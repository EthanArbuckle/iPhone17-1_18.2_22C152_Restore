@interface VUILabelFactory
+ (id)labelWithElement:(id)a3 textLayout:(id)a4 existingLabel:(id)a5;
@end

@implementation VUILabelFactory

+ (id)labelWithElement:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = [v7 text];
    v11 = [v10 string];

    v12 = [v7 attributes];
    v13 = [v12 objectForKeyedSubscript:@"type"];

    if ([v13 length]
      && [v13 isEqualToString:@"rentalExpiration"]
      && [v11 length]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E4F1C9C8];
      [v11 doubleValue];
      v16 = [v14 dateWithTimeIntervalSince1970:v15 / 1000.0];
      v17 = +[VUIRentalExpirationLabel labelWithExpirationDate:v16 textLayout:v8 existingLabel:v9 locStringPrefix:@"EXPIRATION_IN"];
    }
    else
    {
      v17 = +[VUILabel labelWithString:v11 textLayout:v8 existingLabel:v9];
    }
    [v17 transferLayoutStylesFromElement:v7];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end