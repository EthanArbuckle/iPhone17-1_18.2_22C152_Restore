@interface WBOleObject
+ (void)readFrom:(id)a3 at:(int)a4 oleId:(unsigned int)a5 textRun:(WrdCharacterTextRun *)a6 paragraph:(id)a7 to:(id)a8;
@end

@implementation WBOleObject

+ (void)readFrom:(id)a3 at:(int)a4 oleId:(unsigned int)a5 textRun:(WrdCharacterTextRun *)a6 paragraph:(id)a7 to:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___WBOleObject;
  objc_msgSendSuper2(&v22, sel_readFrom_at_textRun_paragraph_to_, v14, v12, a6, v15, v16);
  +[TCProgressContext createStageWithSteps:1.0 takingSteps:0.0];
  uint64_t ObjectPoolStorage = WrdBinaryReader::getObjectPoolStorage((WrdBinaryReader *)[v14 wrdReader]);
  if (ObjectPoolStorage)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"_%d", v11);
    v19 = [v14 cancelDelegate];
    v20 = +[OABOle readFromParentStorage:ObjectPoolStorage storageName:v18 cancel:v19];

    +[TCProgressContext endStage];
    v21 = [v16 drawable];
    [v21 setOle:v20];
  }
  else
  {
    +[TCProgressContext endStage];
  }
}

@end