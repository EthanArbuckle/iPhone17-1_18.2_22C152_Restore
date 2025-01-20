@interface NSCharacterSet
+ (id)crlwp_allQuotesCharacterSetExcludingLeft;
+ (id)crlwp_allQuotesCharacterSetExcludingRight;
+ (id)crlwp_breakingSpaceCharacterSet;
+ (id)crlwp_characterSetWithCharactersInArray:(const unsigned __int16 *)a3 length:(unint64_t)a4;
+ (id)crlwp_curlyQuotesCharacterSet;
+ (id)crlwp_invisibleCharacterSet;
+ (id)crlwp_lineBreakingCharacterSet;
+ (id)crlwp_postSmartSet;
+ (id)crlwp_preSmartSet;
+ (id)crlwp_sentenceDelimiterCharacterSet;
+ (id)crlwp_singleLeftQuoteCharacterSet;
+ (id)crlwp_singleRightQuoteCharacterSet;
+ (id)crlwp_smartSingleQuotesCharacterSet;
+ (id)crlwp_spaceCharacterSet;
+ (id)crlwp_variationSelectorCharacterSet;
@end

@implementation NSCharacterSet

+ (id)crlwp_characterSetWithCharactersInArray:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  v4 = +[NSString stringWithCharacters:a3 length:a4];
  v5 = +[NSCharacterSet characterSetWithCharactersInString:v4];

  return v5;
}

+ (id)crlwp_sentenceDelimiterCharacterSet
{
  if (qword_1016A93E8 != -1) {
    dispatch_once(&qword_1016A93E8, &stru_1014E51B8);
  }
  v2 = (void *)qword_1016A93E0;

  return v2;
}

+ (id)crlwp_breakingSpaceCharacterSet
{
  if (qword_1016A93F8 != -1) {
    dispatch_once(&qword_1016A93F8, &stru_1014E51D8);
  }
  v2 = (void *)qword_1016A93F0;

  return v2;
}

+ (id)crlwp_invisibleCharacterSet
{
  if (qword_1016A9408 != -1) {
    dispatch_once(&qword_1016A9408, &stru_1014E51F8);
  }
  v2 = (void *)qword_1016A9400;

  return v2;
}

+ (id)crlwp_spaceCharacterSet
{
  if (qword_1016A9418 != -1) {
    dispatch_once(&qword_1016A9418, &stru_1014E5218);
  }
  v2 = (void *)qword_1016A9410;

  return v2;
}

+ (id)crlwp_smartSingleQuotesCharacterSet
{
  if (qword_1016A9428 != -1) {
    dispatch_once(&qword_1016A9428, &stru_1014E5238);
  }
  v2 = (void *)qword_1016A9420;

  return v2;
}

+ (id)crlwp_singleLeftQuoteCharacterSet
{
  if (qword_1016A9438 != -1) {
    dispatch_once(&qword_1016A9438, &stru_1014E5258);
  }
  v2 = (void *)qword_1016A9430;

  return v2;
}

+ (id)crlwp_singleRightQuoteCharacterSet
{
  if (qword_1016A9448 != -1) {
    dispatch_once(&qword_1016A9448, &stru_1014E5278);
  }
  v2 = (void *)qword_1016A9440;

  return v2;
}

+ (id)crlwp_curlyQuotesCharacterSet
{
  if (qword_1016A9458 != -1) {
    dispatch_once(&qword_1016A9458, &stru_1014E5298);
  }
  v2 = (void *)qword_1016A9450;

  return v2;
}

+ (id)crlwp_variationSelectorCharacterSet
{
  if (qword_1016A9468 != -1) {
    dispatch_once(&qword_1016A9468, &stru_1014E52B8);
  }
  v2 = (void *)qword_1016A9460;

  return v2;
}

+ (id)crlwp_allQuotesCharacterSetExcludingLeft
{
  if (qword_1016A9478 != -1) {
    dispatch_once(&qword_1016A9478, &stru_1014E52D8);
  }
  v2 = (void *)qword_1016A9470;

  return v2;
}

+ (id)crlwp_allQuotesCharacterSetExcludingRight
{
  if (qword_1016A9488 != -1) {
    dispatch_once(&qword_1016A9488, &stru_1014E52F8);
  }
  v2 = (void *)qword_1016A9480;

  return v2;
}

+ (id)crlwp_preSmartSet
{
  return sub_1001CF738(@"NSCharacterSetAdditions.preSmartSet", &stru_1014E5338);
}

+ (id)crlwp_postSmartSet
{
  return sub_1001CF738(@"NSCharacterSetAdditions.postSmartSet", &stru_1014E5358);
}

+ (id)crlwp_lineBreakingCharacterSet
{
  return sub_1001CF738(@"NSCharacterSetAdditions.lineBreakingCharacterSet", &stru_1014E5398);
}

@end