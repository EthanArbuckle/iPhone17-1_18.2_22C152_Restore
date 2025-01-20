@interface PBTextRun
+ (void)readTextRun:(id)a3 plainText:(id)a4 characterAttributes:(id)a5 state:(id)a6;
@end

@implementation PBTextRun

+ (void)readTextRun:(id)a3 plainText:(id)a4 characterAttributes:(id)a5 state:(id)a6
{
  id v53 = a3;
  id v54 = a4;
  id v9 = a5;
  id v52 = a6;
  unint64_t v10 = [v53 textRunCount];
  v11 = [v9 objectForKey:@"PptCharacterPropertyRunAttribute"];
  uint64_t v49 = [v11 pointerValue];

  v12 = [v9 objectForKey:@"PptSpecialInfoRunAttribute"];
  uint64_t v48 = [v12 pointerValue];

  v13 = [v9 objectForKey:@"PptClickHyperlinkRunAttribute"];
  v51 = [v13 pointerValue];

  v14 = [v9 objectForKey:@"PptHoverHyperlinkRunAttribute"];
  v50 = [v14 pointerValue];

  v15 = [v9 objectForKey:@"PptMetaCharacterRunAttribute"];
  v16 = [v15 nonretainedObjectValue];

  id v46 = v9;
  v47 = v16;
  if (v16)
  {
    switch([v16 type])
    {
      case 0u:
        id v17 = (id)[v53 addFooterField];
        break;
      case 1u:
        id v32 = (id)[v53 addDateTimeFieldWithFormat:0];
        break;
      case 2u:
        v33 = [v53 addDateTimeFieldWithFormat:0];
        objc_msgSend(v33, "setFormat:", objc_msgSend(v16, "extraData") + 1);
        goto LABEL_24;
      case 4u:
        v33 = [v53 addSlideNumberField];
        v34 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v52, "numberOfSlideIndexes"));
        [v33 setText:v34];
        goto LABEL_23;
      default:
        break;
    }
  }
  else
  {
    if (+[PBTextRun readTextRun:plainText:characterAttributes:state:]::once != -1) {
      dispatch_once(&+[PBTextRun readTextRun:plainText:characterAttributes:state:]::once, &__block_literal_global_99);
    }
    uint64_t v18 = [v54 length];
    uint64_t v19 = v18;
    if (v18)
    {
      unint64_t v20 = 0;
      unint64_t v45 = v18;
      while (1)
      {
        unint64_t v21 = objc_msgSend(v54, "rangeOfCharacterFromSet:options:range:", +[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet, 2, v20, v19 - v20);
        unint64_t v23 = v21;
        if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v24 = v22;
        if (v21 > v20)
        {
          v25 = [v53 addRegularTextRun];
          v26 = [v25 text];
          v27 = objc_msgSend(v54, "substringWithRange:", v20, v23 - v20);
          [v26 setString:v27];

          unint64_t v20 = v23;
        }
        unint64_t v28 = v23 + v24;
        if (v20 < v23 + v24)
        {
          do
          {
            if ([v54 characterAtIndex:v20] == 11)
            {
              id v29 = (id)[v53 addTextLineBreak];
            }
            else
            {
              v30 = [NSString stringWithUTF8String:"+[PBTextRun readTextRun:plainText:characterAttributes:state:]"];
              v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBTextRun.mm"];
              +[OITSUAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:101 isFatal:0 description:"Unhandled special character"];

              +[OITSUAssertionHandler logBacktraceThrottled];
            }
            ++v20;
          }
          while (v28 != v20);
          unint64_t v20 = v28;
        }
        uint64_t v19 = v45;
        if (v20 >= v45) {
          goto LABEL_25;
        }
      }
      v33 = [v53 addRegularTextRun];
      v34 = [v33 text];
      v35 = [v54 substringFromIndex:v20];
      [v34 setString:v35];

LABEL_23:
LABEL_24:
    }
  }
LABEL_25:
  unint64_t v36 = [v53 textRunCount];
  v38 = v46;
  v37 = v47;
  if (v10 < v36)
  {
    do
    {
      v39 = [v53 textRunAtIndex:v10];
      v40 = [v39 properties];
      if (v49) {
        +[PBCharacterProperties readCharacterProperties:v40 characterPropertyRun:v49 state:v52];
      }
      if (v48) {
        +[PBCharacterProperties readCharacterProperties:v40 specialInfoRun:v48 state:v52];
      }
      if (v51)
      {
        v41 = [v51 interactiveInfoContainerHolder];
        v42 = +[PBHyperlink readAnimationInfoContainerHolder:v41 presentationState:v52];
        [v40 setClickHyperlink:v42];
      }
      if (v50)
      {
        v43 = [v50 interactiveInfoContainerHolder];
        v44 = +[PBHyperlink readAnimationInfoContainerHolder:v43 presentationState:v52];
        [v40 setHoverHyperlink:v44];
      }
      ++v10;
      v38 = v46;
      v37 = v47;
    }
    while (v36 != v10);
  }
}

void __61__PBTextRun_readTextRun_plainText_characterAttributes_state___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\v"];
  v1 = (void *)+[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet;
  +[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet = v0;
}

@end