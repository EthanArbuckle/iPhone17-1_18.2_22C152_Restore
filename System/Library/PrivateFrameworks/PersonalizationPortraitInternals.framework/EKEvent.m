@interface EKEvent
- (id)pp_eventNameForCategory:(void *)a1;
@end

@implementation EKEvent

- (id)pp_eventNameForCategory:(void *)a1
{
  if (a1)
  {
    v4 = (void *)MEMORY[0x1CB79D060]();
    v5 = [a1 customObjectForKey:*MEMORY[0x1E4F8A1B0]];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = [v5 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
      v7 = v6;
      if (v6 && [v6 count])
      {
        v8 = [v7 firstObject];
        v9 = v8;
        v10 = 0;
        switch(a2)
        {
          case 2:
          case 6:
          case 7:
          case 10:
            v11 = [v8 objectForKeyedSubscript:@"reservationFor"];
            v10 = [v11 objectForKeyedSubscript:@"name"];
            goto LABEL_14;
          case 3:
            v12 = [v8 objectForKeyedSubscript:@"reservationFor"];
            v11 = v12;
            v13 = @"arrivalStation";
            goto LABEL_13;
          case 4:
            v12 = [v8 objectForKeyedSubscript:@"reservationFor"];
            v11 = v12;
            v13 = @"arrivalBusStop";
            goto LABEL_13;
          case 5:
            v12 = [v8 objectForKeyedSubscript:@"reservationFor"];
            v11 = v12;
            v13 = @"arrivalBoatTerminal";
LABEL_13:
            v14 = [v12 objectForKeyedSubscript:v13];
            v10 = [v14 objectForKeyedSubscript:@"name"];

LABEL_14:
            break;
          default:
            break;
        }
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end