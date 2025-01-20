@interface CNVCardDateComponentsLineGenerator
- (id)lineWithValue:(id)a3 label:(id)a4;
- (id)makeLineWithName:(id)a3 value:(id)a4;
@end

@implementation CNVCardDateComponentsLineGenerator

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
  v12 = [(CNVCardDateComponentsFormatter *)v11 stringFromDateComponents:v10];
  v15.receiver = self;
  v15.super_class = (Class)CNVCardDateComponentsLineGenerator;
  v13 = [(CNVCardLineGenerator *)&v15 makeLineWithName:v7 value:v12];

  return v13;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateComponentsLineGenerator;
  id v5 = a3;
  id v6 = [(CNVCardLineGenerator *)&v10 lineWithValue:v5 label:a4];
  uint64_t v7 = [v5 year];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 1604);
    [v6 addParameterWithName:@"X-APPLE-OMIT-YEAR" value:v8];
  }
  return v6;
}

@end