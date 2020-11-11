while true:
    rack=str(input("RACK: "))
    ru=float(input("RU: "))
    ps=float(input("Pisos: "))
    i=((ru*5)+20)/100
    p=ps*0.6
    print("RACK cliente: ",rack)
    print(i,"metros no rack destino",p,"metros de calha")
    print("total: ",p+i)
