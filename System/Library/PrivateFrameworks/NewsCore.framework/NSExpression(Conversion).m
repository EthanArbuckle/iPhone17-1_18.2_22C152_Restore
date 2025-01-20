@interface NSExpression(Conversion)
+ (id)expressionWithFCCKPRecordFieldValue:()Conversion translator:;
@end

@implementation NSExpression(Conversion)

+ (id)expressionWithFCCKPRecordFieldValue:()Conversion translator:
{
  v4 = (void *)MEMORY[0x1E4F28BC0];
  v5 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](a4, a3);
  v6 = [v4 expressionForConstantValue:v5];

  return v6;
}

@end