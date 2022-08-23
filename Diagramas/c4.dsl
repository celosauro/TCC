// https://structurizr.com/dsl

workspace {

    model {
        user = person "Usuário" "Usuário da aplicação: Pais/Responsáveis, Professores, Coordenação"
        
        softwareSystem = softwareSystem "Diário escolar" {
        
            webapp = container "Web Application" {
                user -> this "Usa"
            }
            container "Database" {
                webapp -> this "Lê/escreve"
            }
            
        }
        
        notificationSystem = softwareSystem "Sistema de notificação" "Sistema de notificação utilizando Push Notifications e Email"
        
        softwareSystem -> notificationSystem "Envia itens para fila de notificação"
        notificationSystem -> user "Notifica usuário" "E-mail" "Asynchronous"
        //notificationSystem -> user "bbb" "Push notification" "Asynchronous"
    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }

        theme default
    }

}