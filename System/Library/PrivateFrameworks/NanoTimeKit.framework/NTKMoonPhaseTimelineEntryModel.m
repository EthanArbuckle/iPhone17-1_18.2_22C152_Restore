@interface NTKMoonPhaseTimelineEntryModel
+ (id)circular:(id)a3 isMedium:(BOOL)a4;
+ (id)extraLarge:(id)a3;
+ (id)imageProviderWithOnePieceImage:(id)a3;
+ (id)largeModular:(id)a3;
+ (id)largeUtility:(id)a3;
+ (id)providerWithText:(id)a3;
+ (id)smallModular:(id)a3;
+ (id)smallUtility:(id)a3;
+ (id)textForMoonPhaseEvent:(int64_t)a3;
+ (id)textForMoonPhaseEvent:(int64_t)a3 useShort:(BOOL)a4;
- (BOOL)currentEvent;
- (NSDate)eventDate;
- (NSString)animationGroup;
- (NSString)phaseName;
- (id)templateForComplicationFamily:(int64_t)a3;
- (int64_t)event;
- (int64_t)hemisphere;
- (unint64_t)phaseNumber;
- (void)setAnimationGroup:(id)a3;
- (void)setCurrentEvent:(BOOL)a3;
- (void)setEvent:(int64_t)a3;
- (void)setEventDate:(id)a3;
- (void)setHemisphere:(int64_t)a3;
- (void)setPhaseName:(id)a3;
- (void)setPhaseNumber:(unint64_t)a3;
@end

@implementation NTKMoonPhaseTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  v5 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v6 = [(id)objc_opt_class() smallModular:self];
      goto LABEL_8;
    case 1:
      uint64_t v6 = [(id)objc_opt_class() largeModular:self];
      goto LABEL_8;
    case 2:
      uint64_t v6 = [(id)objc_opt_class() smallUtility:self];
      goto LABEL_8;
    case 3:
      uint64_t v6 = [(id)objc_opt_class() largeUtility:self];
      goto LABEL_8;
    case 4:
      uint64_t v6 = [(id)objc_opt_class() circular:self isMedium:0];
      goto LABEL_8;
    case 7:
      uint64_t v6 = [(id)objc_opt_class() extraLarge:self];
LABEL_8:
      v5 = (void *)v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E4F19648] == a3)
  {
    uint64_t v7 = [(id)objc_opt_class() circular:self isMedium:1];

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)largeModular:(id)a3
{
  id v4 = a3;
  v5 = [v4 phaseName];
  uint64_t v6 = [a1 providerWithText:v5];

  uint64_t v7 = [v4 eventDate];
  if (!v7 || (v8 = (void *)v7, uint64_t v9 = [v4 event], v8, v9 == -1))
  {
    v15 = +[NTKNoContentTemplateProvider largeModularEmptyTextProvider];
    v18 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F19AE0];
    v11 = [v4 eventDate];
    v12 = [v10 textProviderWithDate:v11];

    v13 = objc_msgSend(a1, "textForMoonPhaseEvent:", objc_msgSend(v4, "event"));
    v14 = [a1 providerWithText:v13];
    v15 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v14, v12];
    if ([v4 currentEvent])
    {
      v16 = (void *)MEMORY[0x1E4F19AB0];
      v17 = NTKClockFaceLocalizedString(@"COUNTDOWN_NOW", @"Now");
      [v16 textProviderWithText:v17];
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F19A88];
      v17 = [v4 eventDate];
      [v19 textProviderWithDate:v17 style:0 units:96];
    v18 = };
  }
  v20 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v6 body1TextProvider:v15 body2TextProvider:v18];
  v21 = [MEMORY[0x1E4FB1618] colorWithRed:0.807843137 green:0.941176471 blue:0.564705882 alpha:1.0];
  [v20 setTintColor:v21];

  return v20;
}

+ (id)smallModular:(id)a3
{
  id v4 = a3;
  [v4 phaseNumber];
  [v4 hemisphere];

  v5 = NUNIMoonImageForPhaseNumber();
  uint64_t v6 = [a1 imageProviderWithOnePieceImage:v5];
  uint64_t v7 = [MEMORY[0x1E4F199B8] templateWithImageProvider:v6];
  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setTintColor:v8];

  return v7;
}

+ (id)smallUtility:(id)a3
{
  id v4 = a3;
  [v4 phaseNumber];
  [v4 hemisphere];

  v5 = NUNIMoonImageForPhaseNumber();
  uint64_t v6 = [a1 imageProviderWithOnePieceImage:v5];
  uint64_t v7 = [MEMORY[0x1E4F19A08] templateWithImageProvider:v6];

  return v7;
}

+ (id)circular:(id)a3 isMedium:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 phaseNumber];
  [v6 hemisphere];

  if (v4) {
    uint64_t v7 = (id *)0x1E4F196F0;
  }
  else {
    uint64_t v7 = (id *)0x1E4F19720;
  }
  v8 = NUNIMoonImageForPhaseNumber();
  uint64_t v9 = [a1 imageProviderWithOnePieceImage:v8];
  v10 = [*v7 templateWithImageProvider:v9];

  return v10;
}

+ (id)largeUtility:(id)a3
{
  BOOL v4 = [a3 phaseName];
  v5 = [a1 providerWithText:v4];

  id v6 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v5];

  return v6;
}

+ (id)extraLarge:(id)a3
{
  id v4 = a3;
  [v4 phaseNumber];
  [v4 hemisphere];

  v5 = NUNIMoonImageForPhaseNumber();
  id v6 = [a1 imageProviderWithOnePieceImage:v5];
  uint64_t v7 = [MEMORY[0x1E4F19798] templateWithImageProvider:v6];
  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setTintColor:v8];

  return v7;
}

+ (id)imageProviderWithOnePieceImage:(id)a3
{
  return (id)[MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:a3];
}

+ (id)providerWithText:(id)a3
{
  return (id)[MEMORY[0x1E4F19AB0] finalizedTextProviderWithText:a3];
}

+ (id)textForMoonPhaseEvent:(int64_t)a3
{
  return (id)[a1 textForMoonPhaseEvent:a3 useShort:0];
}

+ (id)textForMoonPhaseEvent:(int64_t)a3 useShort:(BOOL)a4
{
  if ((unint64_t)(a3 + 1) > 3)
  {
    id v4 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v4 = off_1E62C8488[a3 + 1];
  if (a4)
  {
LABEL_5:
    id v4 = [(__CFString *)v4 stringByAppendingString:@"_SHORT"];
  }
LABEL_6:
  v5 = NUNILocalizedString();

  return v5;
}

- (NSString)phaseName
{
  return self->_phaseName;
}

- (void)setPhaseName:(id)a3
{
}

- (unint64_t)phaseNumber
{
  return self->_phaseNumber;
}

- (void)setPhaseNumber:(unint64_t)a3
{
  self->_phaseNumber = a3;
}

- (int64_t)hemisphere
{
  return self->_hemisphere;
}

- (void)setHemisphere:(int64_t)a3
{
  self->_hemisphere = a3;
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
}

- (BOOL)currentEvent
{
  return self->_currentEvent;
}

- (void)setCurrentEvent:(BOOL)a3
{
  self->_currentEvent = a3;
}

- (NSString)animationGroup
{
  return self->_animationGroup;
}

- (void)setAnimationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationGroup, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_phaseName, 0);
}

@end