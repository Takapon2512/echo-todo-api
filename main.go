package main

import (
	"echo-rest-api/controller"
	"echo-rest-api/db"
	"echo-rest-api/repository"
	"echo-rest-api/router"
	"echo-rest-api/usecase"
)

func main() {
	db := db.NewDB()
	userRepository := repository.NewUserRepository(db)
	taskRepository := repository.NewTaskRepository(db)

	userUsecase := usecase.NewUseUsecase(userRepository)
	taskUsecase := usecase.NewTaskUsecase(taskRepository)

	userController := controller.NewUserController(userUsecase)
	taskController := controller.NewTaskController(taskUsecase)

	e := router.NewRouter(userController, taskController)
	e.Logger.Fatal(e.Start(":8080"))
}