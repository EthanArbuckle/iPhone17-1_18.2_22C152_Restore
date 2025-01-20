@interface CNDescriptionBuilder(CNVCardOptions)
- (id)appendName:()CNVCardOptions vCardOutputVersionValue:;
@end

@implementation CNDescriptionBuilder(CNVCardOptions)

- (id)appendName:()CNVCardOptions vCardOutputVersionValue:
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      v7 = @".30";
      goto LABEL_7;
    case 1:
      v7 = @".21";
      goto LABEL_7;
    case 0:
      v7 = @".latest";
LABEL_7:
      v8 = [a1 appendName:v6 object:v7];
      goto LABEL_9;
  }
  v9 = NSString;
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  v11 = [v9 stringWithFormat:@"unknown (%@)", v10];
  v8 = [a1 appendName:v6 object:v11];

LABEL_9:
  return v8;
}

@end