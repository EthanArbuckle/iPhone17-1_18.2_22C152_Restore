@interface NSString(WeatherCityAdditions)
+ (id)stringWithFormat:()WeatherCityAdditions andArguments:;
@end

@implementation NSString(WeatherCityAdditions)

+ (id)stringWithFormat:()WeatherCityAdditions andArguments:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7 < 1)
  {
    v18 = 0;
  }
  else
  {
    v8 = 0;
    id v26 = v5;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v24 = 0;
    v15 = 0;
    v16 = 0;
    v27 = 0;
    switch(v7)
    {
      case 1:
        goto LABEL_14;
      case 2:
        goto LABEL_13;
      case 3:
        goto LABEL_12;
      case 4:
        goto LABEL_11;
      case 5:
        goto LABEL_10;
      case 6:
        goto LABEL_9;
      case 7:
        goto LABEL_8;
      case 8:
        goto LABEL_7;
      case 9:
        goto LABEL_6;
      case 10:
        goto LABEL_5;
      case 11:
        goto LABEL_4;
      case 12:
        v8 = [v6 objectAtIndexedSubscript:11];
LABEL_4:
        v9 = v8;
        v8 = [v6 objectAtIndexedSubscript:10];
LABEL_5:
        v10 = v8;
        v8 = [v6 objectAtIndexedSubscript:9];
LABEL_6:
        v11 = v8;
        v8 = [v6 objectAtIndexedSubscript:8];
LABEL_7:
        v12 = v8;
        v8 = [v6 objectAtIndexedSubscript:7];
LABEL_8:
        v13 = v8;
        v8 = [v6 objectAtIndexedSubscript:6];
LABEL_9:
        v14 = v8;
        v8 = [v6 objectAtIndexedSubscript:5];
LABEL_10:
        v24 = v8;
        v8 = [v6 objectAtIndexedSubscript:4];
LABEL_11:
        v15 = v8;
        v8 = [v6 objectAtIndexedSubscript:3];
LABEL_12:
        v16 = v8;
        v8 = [v6 objectAtIndexedSubscript:2];
LABEL_13:
        v27 = v8;
        v8 = [v6 objectAtIndexedSubscript:1];
LABEL_14:
        v23 = v15;
        v25 = v16;
        v17 = v8;
        v8 = [v6 objectAtIndexedSubscript:0];
        break;
      default:
        v17 = 0;
        v27 = 0;
        v25 = 0;
        v23 = 0;
        v24 = 0;
        v14 = 0;
        v13 = 0;
        v12 = 0;
        v11 = 0;
        v10 = 0;
        v9 = 0;
        break;
    }
    v22 = v17;
    v18 = objc_msgSend(NSString, "stringWithFormat:", v26, v8, v17, v27, v25, v23, v24, v14, v13, v12, v11, v10, v9);

    id v5 = v26;
  }
  if (v18) {
    v19 = v18;
  }
  else {
    v19 = v5;
  }
  id v20 = v19;

  return v20;
}

@end