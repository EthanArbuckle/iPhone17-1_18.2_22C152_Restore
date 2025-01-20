@interface PPConnectionsDataDetectors
+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forDataDetectorsMatch:(id)a4 addressComponents:(id)a5;
@end

@implementation PPConnectionsDataDetectors

+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forDataDetectorsMatch:(id)a4 addressComponents:(id)a5
{
  int v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  v10 = 0;
  switch(v6)
  {
    case 1:
      id v11 = v7;
      goto LABEL_11;
    case 2:
      v12 = (void *)MEMORY[0x1E4F28948];
      goto LABEL_10;
    case 3:
      v12 = (void *)MEMORY[0x1E4F28958];
      goto LABEL_10;
    case 4:
      v12 = (void *)MEMORY[0x1E4F28920];
      goto LABEL_10;
    case 5:
      v12 = (void *)MEMORY[0x1E4F28960];
      goto LABEL_10;
    case 6:
      v12 = (void *)MEMORY[0x1E4F28950];
      goto LABEL_10;
    case 7:
      v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28920]];
      v14 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28950]];
      v10 = +[PPConnectionsAddressFormatter formattedCityAndStateWithCity:v13 state:v14];

      break;
    case 9:
      v12 = (void *)MEMORY[0x1E4F28928];
LABEL_10:
      id v11 = [v8 objectForKeyedSubscript:*v12];
LABEL_11:
      v10 = v11;
      break;
    default:
      break;
  }

  return v10;
}

@end