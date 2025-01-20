@interface WBListLevelOverride
+ (void)readFrom:(id)a3 listLevelOverride:(id)a4 formatOverride:(WrdListLevelFormatOverride *)a5 document:(id)a6;
+ (void)write:(id)a3 listLevelOverride:(id)a4 wrdFormatOverride:(WrdListLevelFormatOverride *)a5;
@end

@implementation WBListLevelOverride

+ (void)readFrom:(id)a3 listLevelOverride:(id)a4 formatOverride:(WrdListLevelFormatOverride *)a5 document:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a6;
  __int16 v11 = *(_WORD *)((char *)a5 + 21);
  if (v11)
  {
    [v9 setStartNumber:a5->var2];
    __int16 v11 = *(_WORD *)((char *)a5 + 21);
  }
  if ((v11 & 2) != 0)
  {
    v12 = [v9 mutableListLevel];
    +[WBListLevel readFrom:v13 listLevel:v12 format:EshDataModelVisitor::getClientVisitor((EshDataModelVisitor *)a5) document:v10];
  }
}

+ (void)write:(id)a3 listLevelOverride:(id)a4 wrdFormatOverride:(WrdListLevelFormatOverride *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v7 isStartNumberOverridden])
  {
    *(_WORD *)((char *)a5 + 21) |= 1u;
    a5->var2 = [v7 startNumber];
  }
  a5->var3 = [v7 level];
  if ([v7 isListLevelOverridden])
  {
    WrdListLevelFormatOverride::setFormatting(a5, 1);
    v8 = [v7 listLevel];
    +[WBListLevel write:v9 listLevel:v8 format:EshDataModelVisitor::getClientVisitor((EshDataModelVisitor *)a5)];
  }
}

@end