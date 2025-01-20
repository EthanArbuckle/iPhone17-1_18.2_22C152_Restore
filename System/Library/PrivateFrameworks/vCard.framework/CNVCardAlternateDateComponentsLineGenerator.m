@interface CNVCardAlternateDateComponentsLineGenerator
- (id)makeLineWithName:(id)a3 value:(id)a4;
@end

@implementation CNVCardAlternateDateComponentsLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  v11 = objc_alloc_init(CNVCardDateComponentsFormatter);
  v12 = [(CNVCardDateComponentsFormatter *)v11 altBDAYStringFromDateComponents:v10];
  v17.receiver = self;
  v17.super_class = (Class)CNVCardAlternateDateComponentsLineGenerator;
  v13 = [(CNVCardLineGenerator *)&v17 makeLineWithName:v7 value:v12];

  v14 = [v10 calendar];
  v15 = [v14 calendarIdentifier];
  [v13 addParameterWithName:@"CALSCALE" value:v15];

  return v13;
}

@end