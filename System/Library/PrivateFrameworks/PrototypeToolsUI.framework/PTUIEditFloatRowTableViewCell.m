@interface PTUIEditFloatRowTableViewCell
- (id)textForValue:(id)a3;
- (id)valueForText:(id)a3;
@end

@implementation PTUIEditFloatRowTableViewCell

- (id)textForValue:(id)a3
{
  id v4 = a3;
  v5 = [(PTUIRowTableViewCell *)self row];
  unint64_t v6 = [v5 precision];
  if (v6 >= 0x7FFFFFFF) {
    uint64_t v7 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = NSString;
  [v4 floatValue];
  float v10 = v9;

  v11 = objc_msgSend(v8, "stringWithFormat:", @"%.*f", v7, v10);

  return v11;
}

- (id)valueForText:(id)a3
{
  v3 = NSNumber;
  [a3 floatValue];

  return (id)objc_msgSend(v3, "numberWithFloat:");
}

@end