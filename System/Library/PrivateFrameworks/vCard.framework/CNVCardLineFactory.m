@interface CNVCardLineFactory
+ (id)version21LineFactory;
+ (id)version30LineFactory;
- (id)arrayLineWithName:(id)a3 value:(id)a4;
- (id)arrayLineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5;
- (id)dataLineWithName:(id)a3 value:(id)a4;
- (id)lineWithLiteralValue:(id)a3;
- (id)stringLineWithName:(id)a3 value:(id)a4;
- (id)versionPlaceholderLine;
@end

@implementation CNVCardLineFactory

+ (id)version30LineFactory
{
  v2 = objc_alloc_init(CNVCardLineFactory);
  return v2;
}

+ (id)version21LineFactory
{
  v2 = objc_alloc_init(CNVCardLineFactory);
  return v2;
}

- (id)stringLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:a3 value:a4];
}

- (id)arrayLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:a3 value:a4];
}

- (id)arrayLineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  return +[CNVCardLine lineWithName:a3 value:a4 itemSeparator:a5];
}

- (id)dataLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:a3 value:a4];
}

- (id)lineWithLiteralValue:(id)a3
{
  return +[CNVCardLine lineWithLiteralValue:a3];
}

- (id)versionPlaceholderLine
{
  return +[CNVCardLine versionPlaceholderLine];
}

@end