@interface TypistKeyboard
+ (BOOL)supportsSecureCoding;
+ (id)keyboardLanguageValueMap;
+ (void)typeStringOnHardwareKeyboard:(id)a3 withLanguage:(id)a4;
- (BOOL)_isPlaneControlKey:(id)a3;
- (BOOL)dictationSupported;
- (BOOL)fastTyping;
- (BOOL)flickTyping;
- (BOOL)hasCandidate:(id)a3;
- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4;
- (BOOL)hasCandidates:(id)a3;
- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4;
- (BOOL)hasCandidatesToCommit;
- (BOOL)isAutoshiftedToCapitalPlane:(id)a3;
- (BOOL)isAvailableFlickOnCurrentPlane:(id)a3 withDirection:(id)a4;
- (BOOL)isAvailableGestureOnCurrentPlane:(id)a3 withDirection:(id)a4;
- (BOOL)isAvailableKeyOnCurrentPlane:(id)a3;
- (BOOL)isAvailablePopoverOnCurrentPlane:(id)a3;
- (BOOL)isCapsLockedState;
- (BOOL)isFloating;
- (BOOL)isHandwriting;
- (BOOL)isKanaKeyboard;
- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6;
- (BOOL)isTenKey;
- (BOOL)prefersPopoverKeys;
- (BOOL)shouldShowDictationKey;
- (BOOL)shouldShowGlobeKey;
- (BOOL)swipeForceSpace;
- (BOOL)usePopupKeys;
- (BOOL)usePredictionBar;
- (BOOL)usesMecabraCandidateBar;
- (CGAffineTransform)_determineTransformationInFrame:(SEL)a3 segmentStart:(CGRect)a4 totalSegmentWidth:(double)a5 scale:(unint64_t)a6 characterHeight:(double)a7 characterWidth:(double)a8 dimensions:(double)a9 isLatex:(id)a10;
- (CGPoint)_determinePointBetween:(CGPoint)a3 nextPoint:(CGPoint)a4;
- (CGPoint)_guardAgainstOffScreenPoint:(CGPoint)a3;
- (CGPoint)calculateCoordinatesForFlickGesture:(CGPoint)a3 direction:(id)a4 offset:(float)a5;
- (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4;
- (CGRect)_determineHandwritingBound;
- (NSDictionary)planeSwitchTable;
- (NSMutableDictionary)keyPlanes;
- (NSNumber)pressDuration;
- (NSNumber)swipeAlpha;
- (NSNumber)swipeConvexProbability;
- (NSNumber)swipeConvexSigma;
- (NSNumber)swipeErrantProbability;
- (NSNumber)swipeErrantSigma;
- (NSNumber)swipePivotProbability;
- (NSNumber)swipeSigma;
- (NSNumber)tapBounds;
- (NSNumber)tapSigma;
- (NSNumber)touchMajorRadius;
- (NSNumber)typeInterval;
- (NSRegularExpression)autoshiftRegex;
- (NSString)defaultPlaneName;
- (NSString)keyboardID;
- (NSString)keyboardSW;
- (NSString)keyboardType;
- (NSString)languageID;
- (NSString)layoutName;
- (NSString)regionCode;
- (NSString)sentenceDelimitingCharacters;
- (NSString)sentencePrefixingCharacters;
- (NSString)sentenceTrailingCharacters;
- (TypistCandidateBar)candidatebar;
- (TypistHWKeyboard)hardwareKeyboard;
- (TypistKeyboard)initWithCoder:(id)a3;
- (TypistKeyboard)initWithHardwareKeyboard:(id)a3;
- (double)_getScaleInFrame:(CGRect)a3 isPencil:(BOOL)a4 dimensions:(id)a5;
- (id)_character_set_pattern_from_string:(id)a3;
- (id)_constructSwitchPath:(id)a3 toPlane:(id)a4 fromPlane:(id)a5;
- (id)_convertCollationCharacters:(id)a3;
- (id)_dimensionsForLatex:(id)a3 formula:(id)a4 withPathMap:(id)a5 regionCode:(id)a6 isCursive:(BOOL)a7 cumulativeWidth:(unint64_t)a8 totalWidth:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12;
- (id)_dimensionsForText:(id)a3 withPathMap:(id)a4 regionCode:(id)a5 isCursive:(BOOL)a6 cumulativeWidth:(unint64_t *)a7 totalWidth:(unint64_t)a8 segmentTextDirection:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12;
- (id)_generateArgumentList:(id)a3;
- (id)_generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 dimensions:(id)a6 isLatex:(BOOL)a7;
- (id)_multiCharacterTrailForGrapheme:(id)a3;
- (id)_sanitizedStringForAutoShiftCheck:(id)a3;
- (id)_setupAutoShiftRegex;
- (id)addAccentKeyAction:(id)a3;
- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6;
- (id)attemptToFindKeystrokeAsSecondaryDisplay:(id)a3;
- (id)changeKeyNameToGenericCharacter:(id)a3;
- (id)convertRepresentedStringsIfNecessary:(id)a3;
- (id)createAutoshiftRegularExpressionWithDelimitingCharacters:(id)a3 sentenceTrailingCharacters:(id)a4 sentencePrefixingCharacters:(id)a5;
- (id)findKey:(id)a3 inPlane:(id)a4;
- (id)findKeyInOtherPlanes:(id)a3 currentPlane:(id)a4;
- (id)findKeyOnAnyPlane:(id)a3;
- (id)findKeyOnCurrentPlane:(id)a3;
- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5;
- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6;
- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6 isCursive:(BOOL)a7;
- (id)generateKeyplaneSwitchTable:(id)a3;
- (id)generateKeyplaneSwitchTableFor10Key:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)generatePencilGestureStream:(int)a3 gestureStyle:(int)a4 inFrame:(CGRect)a5;
- (id)generateSwipeStream:(id)a3;
- (id)getActionForKeystroke:(id)a3 fromKeyPlane:(id)a4;
- (id)getAllCandidates;
- (id)getAlternatePlanesForDefaultPlane;
- (id)getAlternativeKeyPlaneName:(id)a3;
- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4;
- (id)getPostfixKey:(id)a3;
- (id)getShiftPlaneForAlternatePlane;
- (id)getShiftPlaneForDefaultPlane;
- (id)getShiftedKeyPlaneName:(id)a3;
- (id)getVisibleCandidates;
- (id)init:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)init:(id)a3 options:(id)a4 locale:(id)a5;
- (id)keysDataForInputMode:(id)a3 andFileName:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (id)splitKeystrokeStreamByWord:(id)a3 originalText:(id)a4;
- (id)switchToPlane:(id)a3 fromPlane:(id)a4;
- (id)tryAlternateVariationsOfKey:(id)a3;
- (int)tapStyle;
- (int64_t)commitCandidate:(id)a3;
- (int64_t)commitCandidateAtIndex:(int64_t)a3;
- (void)_bailWithError:(id)a3 completion:(id)a4;
- (void)_setKeyboardUserPreferences:(id)a3;
- (void)activate:(BOOL)a3;
- (void)attachHardwareKeyboard:(id)a3;
- (void)attachHardwareKeyboardWithCountryCode:(id)a3;
- (void)dealloc;
- (void)detachHardwareKeyboard;
- (void)dragFromKey:(id)a3 toKey:(id)a4 completion:(id)a5;
- (void)dragPopoverKey:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)flickKey:(id)a3 withDirection:(id)a4 completion:(id)a5;
- (void)moveFloatingKeyboardToPosition:(CGPoint)a3;
- (void)preprocessing;
- (void)pressAndHoldHardwareKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 validateAfter:(double)a6;
- (void)pressKeycode:(unsigned __int16)a3;
- (void)setAutoshiftRegex:(id)a3;
- (void)setCandidatebar:(id)a3;
- (void)setDefaultPlaneName:(id)a3;
- (void)setDictationSupported:(BOOL)a3;
- (void)setFastTyping:(BOOL)a3;
- (void)setFlickTyping:(BOOL)a3;
- (void)setFloatingKeyboard:(BOOL)a3;
- (void)setHardwareKeyboard:(id)a3;
- (void)setHasCandidatesToCommit:(BOOL)a3;
- (void)setIsCapsLockedState:(BOOL)a3;
- (void)setIsHandwriting:(BOOL)a3;
- (void)setIsKana:(BOOL)a3;
- (void)setIsTenKey:(BOOL)a3;
- (void)setKeyPlanes:(id)a3;
- (void)setKeyboardID:(id)a3;
- (void)setKeyboardSW:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setLanguageID:(id)a3;
- (void)setLayoutName:(id)a3;
- (void)setOneHandedPosition:(id)a3;
- (void)setPlaneSwitchTable:(id)a3;
- (void)setPrefersPopoverKeys:(BOOL)a3;
- (void)setPressDuration:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setSentenceDelimitingCharacters:(id)a3;
- (void)setSentencePrefixingCharacters:(id)a3;
- (void)setSentenceTrailingCharacters:(id)a3;
- (void)setShouldShowDictationKey:(BOOL)a3;
- (void)setShouldShowGlobeKey:(BOOL)a3;
- (void)setSwipeAlpha:(id)a3;
- (void)setSwipeConvexProbability:(id)a3;
- (void)setSwipeConvexSigma:(id)a3;
- (void)setSwipeErrantProbability:(id)a3;
- (void)setSwipeErrantSigma:(id)a3;
- (void)setSwipeForceSpace:(BOOL)a3;
- (void)setSwipePivotProbability:(id)a3;
- (void)setSwipeSigma:(id)a3;
- (void)setTapBounds:(id)a3;
- (void)setTapSigma:(id)a3;
- (void)setTapStyle:(int)a3;
- (void)setTapStyleNoise:(id)a3;
- (void)setTouchMajorRadius:(id)a3;
- (void)setTypeInterval:(id)a3;
- (void)setUsePopupKeys:(BOOL)a3;
- (void)setUsePredictionBar:(BOOL)a3;
- (void)setupSentenceBoundryStrings;
- (void)swipeGestureKey:(id)a3 withDirection:(id)a4 completion:(id)a5;
- (void)swipeGestureOrFlickKey:(id)a3 withDirection:(id)a4 completion:(id)a5;
- (void)swipeString:(id)a3;
- (void)switchKeyPlaneOnActiveKeyboard:(id)a3;
- (void)tapGlobeKey;
- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 completion:(id)a5;
- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 overriddenTypeInterval:(id)a5 completion:(id)a6;
- (void)tapMoreKey;
- (void)toggleCapsLock;
- (void)typeKeystrokeStream:(id)a3;
- (void)typeKeystrokeStream:(id)a3 completion:(id)a4;
- (void)typeKeystrokeStreamWithPredictive:(id)a3 originalText:(id)a4 completion:(id)a5;
- (void)typeString:(id)a3;
- (void)typeString:(id)a3 completion:(id)a4;
- (void)typeString:(id)a3 withCommit:(id)a4;
- (void)typeStringWithHardwareKeyboard:(id)a3;
- (void)typeWordKeystrokeWithPredictive:(id)a3 atIndex:(int64_t)a4 completion:(id)a5;
- (void)typeWordKeystrokes:(id)a3 expectedWord:(id)a4 atIndex:(int64_t)a5 completion:(id)a6;
- (void)writePencilGesture:(int)a3 inStyle:(int)a4 inFrame:(CGRect)a5;
- (void)writeString:(id)a3 inFrame:(CGRect)a4;
- (void)writeString:(id)a3 inFrame:(CGRect)a4 isCursive:(BOOL)a5;
- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5;
- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5 isCursive:(BOOL)a6;
@end

@implementation TypistKeyboard

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPressDuration:(id)a3
{
  id v24 = a3;
  if (!v24 || [v24 compare:&unk_270C6EA80] == -1)
  {
    v9 = [(TypistKeyboard *)self pressDuration];

    if (v9)
    {
      v23 = [(TypistKeyboard *)self pressDuration];
      TYLogl(OS_LOG_TYPE_ERROR, @"Invalid pressDuration was provided: %@. The existing value of (%@) will continue to be used!", v10, v11, v12, v13, v14, v15, (char)v24);
    }
    else
    {
      pressDuration = self->_pressDuration;
      self->_pressDuration = (NSNumber *)&unk_270C6EA90;

      TYLogl(OS_LOG_TYPE_ERROR, @"Invalid pressDuration was provided: %@. The default value of %@ will be used instead.", v17, v18, v19, v20, v21, v22, (char)v24);
    }
  }
  else
  {
    v5 = [(TypistKeyboard *)self hardwareKeyboard];

    if (v5)
    {
      [v24 doubleValue];
      double v7 = v6;
      v8 = [(TypistKeyboard *)self hardwareKeyboard];
      [v8 setPressDuration:v7];
    }
    objc_storeStrong((id *)&self->_pressDuration, a3);
  }
}

- (void)setTypeInterval:(id)a3
{
  id v24 = a3;
  if (!v24 || [v24 compare:&unk_270C6EA80] == -1)
  {
    v9 = [(TypistKeyboard *)self typeInterval];

    if (v9)
    {
      v23 = [(TypistKeyboard *)self typeInterval];
      TYLogl(OS_LOG_TYPE_ERROR, @"Invalid typeInterval was provided: %@. The existing value of (%@) will continue to be used!", v10, v11, v12, v13, v14, v15, (char)v24);
    }
    else
    {
      typeInterval = self->_typeInterval;
      self->_typeInterval = (NSNumber *)&unk_270C6EA90;

      TYLogl(OS_LOG_TYPE_ERROR, @"Invalid typeInterval was provided: %@. The default value of %@ will be used instead.", v17, v18, v19, v20, v21, v22, (char)v24);
    }
  }
  else
  {
    v5 = [(TypistKeyboard *)self hardwareKeyboard];

    if (v5)
    {
      [v24 doubleValue];
      double v7 = v6;
      v8 = [(TypistKeyboard *)self hardwareKeyboard];
      [v8 setTypeInterval:v7];
    }
    objc_storeStrong((id *)&self->_typeInterval, a3);
  }
}

- (void)setTouchMajorRadius:(id)a3
{
  id v12 = a3;
  [v12 doubleValue];
  if (v11 <= 0.0)
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"Invalid touch radius was provided: %@. Ignoring.", v5, v6, v7, v8, v9, v10, (char)v12);
  }
  else
  {
    objc_storeStrong((id *)&self->_touchMajorRadius, a3);
    +[TypistKeyboardUtilities setTapTouchRadius:v12];
  }
}

- (void)dealloc
{
  +[TypistKeyboardUtilities tearDownRecapInlinePlayer];
  +[TypistKeyboardUtilities setTapTouchRadius:0];
  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboard;
  [(TypistKeyboard *)&v3 dealloc];
}

- (id)init:(id)a3
{
  return [(TypistKeyboard *)self init:a3 options:0];
}

- (id)init:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"fr"])
  {
    uint64_t v8 = TypistKeyboardFrench;
  }
  else if ([v6 hasPrefix:@"fa"])
  {
    uint64_t v8 = TypistKeyboardFarsi;
  }
  else if ([v6 hasPrefix:@"ja_JP"])
  {
    uint64_t v8 = TypistKeyboardJapanese;
  }
  else if (([v6 hasPrefix:@"zh_Han"] & 1) != 0 {
         || [v6 hasPrefix:@"yue_Hant"])
  }
  {
    uint64_t v8 = TypistKeyboardChinese;
  }
  else if ([v6 hasPrefix:@"ko_KR"])
  {
    uint64_t v8 = TypistKeyboardKorean;
  }
  else if ([v6 hasPrefix:@"chr"])
  {
    uint64_t v8 = TypistKeyboardCherokee;
  }
  else if ([v6 hasPrefix:@"cs_CZ"])
  {
    uint64_t v8 = TypistKeyboardCzech;
  }
  else if ([v6 hasPrefix:@"haw"])
  {
    uint64_t v8 = TypistKeyboardHawaiian;
  }
  else if ([v6 hasPrefix:@"el_GR"])
  {
    uint64_t v8 = TypistKeyboardGreek;
  }
  else if ([v6 hasPrefix:@"lut"])
  {
    uint64_t v8 = TypistKeyboardLushootseed;
  }
  else if (([v6 hasPrefix:@"bo"] & 1) != 0 {
         || [v6 hasPrefix:@"dz"])
  }
  {
    uint64_t v8 = TypistKeyboardTibetan;
  }
  else if ([v6 hasPrefix:@"ta"] {
         && ([v6 hasPrefix:@"ta@sw=Tamil-QWERTY"] & 1) == 0)
  }
  {
    uint64_t v8 = TypistKeyboardTamil;
  }
  else if ([v6 hasPrefix:@"pa@sw=Punjabi-Phonetic"])
  {
    uint64_t v8 = TypistKeyboardPunjabi;
  }
  else if ([v6 hasPrefix:@"si"])
  {
    uint64_t v8 = TypistKeyboardSinhala;
  }
  else if ([v6 hasPrefix:@"ug"])
  {
    uint64_t v8 = TypistKeyboardUyghur;
  }
  else if ([v6 hasPrefix:@"am"])
  {
    uint64_t v8 = TypistKeyboardAmharic;
  }
  else if ([v6 hasPrefix:@"my@sw=Burmese"])
  {
    uint64_t v8 = TypistKeyboardBurmese;
  }
  else
  {
    if (![v6 containsString:@"emoji"])
    {
      id v9 = [[TypistKeyboard alloc] init:v6 options:v7 locale:0];
      goto LABEL_11;
    }
    uint64_t v8 = TypistKeyboardEmoji;
  }
  id v9 = (id)[[v8 alloc] init:v6 options:v7];
LABEL_11:
  uint64_t v10 = v9;

  return v10;
}

- (id)init:(id)a3 options:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)TypistKeyboard;
  id v9 = [(TypistKeyboard *)&v29 init];
  if (!v9) {
    goto LABEL_6;
  }
  if ([(TypistKeyboard *)v9 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    TYLog(@"Initializing TypistKeyboard: [%@]", v12, v13, v14, v15, v16, v17, v18, (char)v11);
  }
  uint64_t v19 = [(TypistKeyboard *)v9 setupKeyboardInfo:v7 options:v8];
  if (v19)
  {
    v26 = (void *)v19;
    TYLogl(OS_LOG_TYPE_ERROR, @"%@", v20, v21, v22, v23, v24, v25, v19);

    v27 = 0;
  }
  else
  {
LABEL_6:
    v27 = v9;
  }

  return v27;
}

- (void)setupSentenceBoundryStrings
{
  id v6 = [(objc_class *)+[TypistKeyboardData keyboardData] getSentenceBoundaryStrings];
  objc_super v3 = [v6 objectForKeyedSubscript:@"sentenceTrailingCharacters"];
  [(TypistKeyboard *)self setSentenceTrailingCharacters:v3];

  v4 = [v6 objectForKeyedSubscript:@"sentenceDelimitingCharacters"];
  [(TypistKeyboard *)self setSentenceDelimitingCharacters:v4];

  uint64_t v5 = [v6 objectForKeyedSubscript:@"sentencePrefixingCharacters"];
  [(TypistKeyboard *)self setSentencePrefixingCharacters:v5];
}

- (id)_setupAutoShiftRegex
{
  objc_super v3 = [(TypistKeyboard *)self sentenceDelimitingCharacters];
  v4 = [(TypistKeyboard *)self sentenceTrailingCharacters];
  uint64_t v5 = [(TypistKeyboard *)self sentencePrefixingCharacters];
  id v6 = [(TypistKeyboard *)self createAutoshiftRegularExpressionWithDelimitingCharacters:v3 sentenceTrailingCharacters:v4 sentencePrefixingCharacters:v5];

  return v6;
}

- (void)setTapStyleNoise:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([v4 caseInsensitiveCompare:@"anyInRect"])
    {
      if ([v6 caseInsensitiveCompare:@"normal"])
      {
        if ([v6 caseInsensitiveCompare:@"uniform"])
        {
          if (![v6 caseInsensitiveCompare:@"none"]) {
            goto LABEL_11;
          }
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = 2;
        }
      }
      else
      {
        uint64_t v5 = 3;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
    [(TypistKeyboard *)self setTapStyle:v5];
  }
LABEL_11:
  MEMORY[0x270F9A758]();
}

- (void)_setKeyboardUserPreferences:(id)a3
{
  id v53 = a3;
  id v4 = [v53 objectForKeyedSubscript:@"typeInterval"];

  if (v4)
  {
    uint64_t v5 = [v53 objectForKeyedSubscript:@"typeInterval"];
    [(TypistKeyboard *)self setTypeInterval:v5];
  }
  else
  {
    [(TypistKeyboard *)self setTypeInterval:&unk_270C6EA90];
  }
  id v6 = [v53 objectForKeyedSubscript:@"touchMajorRadius"];

  if (v6)
  {
    id v7 = [v53 objectForKeyedSubscript:@"touchMajorRadius"];
    [(TypistKeyboard *)self setTouchMajorRadius:v7];
  }
  id v8 = [v53 objectForKeyedSubscript:@"pressDuration"];

  if (v8)
  {
    id v9 = [v53 objectForKeyedSubscript:@"pressDuration"];
    [(TypistKeyboard *)self setPressDuration:v9];
  }
  else
  {
    [(TypistKeyboard *)self setPressDuration:&unk_270C6EA90];
  }
  uint64_t v10 = [v53 objectForKeyedSubscript:@"fastTyping"];
  if (v10)
  {
    double v11 = [v53 objectForKeyedSubscript:@"fastTyping"];
    -[TypistKeyboard setFastTyping:](self, "setFastTyping:", [v11 BOOLValue]);
  }
  else
  {
    [(TypistKeyboard *)self setFastTyping:0];
  }

  uint64_t v12 = [v53 objectForKeyedSubscript:@"flickTyping"];
  if (v12)
  {
    uint64_t v13 = [v53 objectForKeyedSubscript:@"flickTyping"];
    -[TypistKeyboard setFlickTyping:](self, "setFlickTyping:", [v13 BOOLValue]);
  }
  else
  {
    [(TypistKeyboard *)self setFlickTyping:0];
  }

  uint64_t v14 = [v53 objectForKeyedSubscript:@"usePredictionBar"];
  if (v14)
  {
    uint64_t v15 = [v53 objectForKeyedSubscript:@"usePredictionBar"];
    -[TypistKeyboard setUsePredictionBar:](self, "setUsePredictionBar:", [v15 BOOLValue]);
  }
  else
  {
    [(TypistKeyboard *)self setUsePredictionBar:0];
  }

  uint64_t v16 = [v53 objectForKeyedSubscript:@"prefersPopoverKeys"];
  if (v16)
  {
    uint64_t v17 = [v53 objectForKeyedSubscript:@"prefersPopoverKeys"];
    -[TypistKeyboard setPrefersPopoverKeys:](self, "setPrefersPopoverKeys:", [v17 BOOLValue]);
  }
  else
  {
    [(TypistKeyboard *)self setPrefersPopoverKeys:1];
  }

  uint64_t v18 = [v53 objectForKeyedSubscript:@"FORCE_SPACE"];
  if (v18)
  {
    uint64_t v19 = [v53 objectForKeyedSubscript:@"FORCE_SPACE"];
    -[TypistKeyboard setSwipeForceSpace:](self, "setSwipeForceSpace:", [v19 BOOLValue]);
  }
  else
  {
    [(TypistKeyboard *)self setSwipeForceSpace:0];
  }

  uint64_t v20 = [v53 objectForKeyedSubscript:@"ALPHA"];
  if (v20)
  {
    uint64_t v21 = [v53 objectForKeyedSubscript:@"ALPHA"];
    uint64_t v22 = +[TypistKeyboardUtilities validateProbability:v21];
    [(TypistKeyboard *)self setSwipeAlpha:v22];
  }
  else
  {
    [(TypistKeyboard *)self setSwipeAlpha:&unk_270C6EAA0];
  }

  uint64_t v23 = [v53 objectForKeyedSubscript:@"SIGMA"];
  if (v23)
  {
    uint64_t v24 = [v53 objectForKeyedSubscript:@"SIGMA"];
    [v24 doubleValue];
    if (v25 <= 0.0)
    {
      [(TypistKeyboard *)self setSwipeSigma:&unk_270C6EF10];
    }
    else
    {
      v26 = [v53 objectForKeyedSubscript:@"SIGMA"];
      [(TypistKeyboard *)self setSwipeSigma:v26];
    }
  }
  else
  {
    [(TypistKeyboard *)self setSwipeSigma:&unk_270C6EF10];
  }

  v27 = [v53 objectForKeyedSubscript:@"P_PIVOT"];
  if (v27)
  {
    v28 = [v53 objectForKeyedSubscript:@"P_PIVOT"];
    objc_super v29 = +[TypistKeyboardUtilities validateProbability:v28];
    [(TypistKeyboard *)self setSwipePivotProbability:v29];
  }
  else
  {
    [(TypistKeyboard *)self setSwipePivotProbability:&unk_270C6EF10];
  }

  v30 = [v53 objectForKeyedSubscript:@"tapNoiseStyle"];
  [(TypistKeyboard *)self setTapStyleNoise:v30];

  v31 = [v53 objectForKeyedSubscript:@"tapNoiseSigma"];
  v32 = v31;
  if (v31 && ([v31 doubleValue], v33 > 0.0)) {
    v34 = v32;
  }
  else {
    v34 = &unk_270C6EF10;
  }
  [(TypistKeyboard *)self setTapSigma:v34];
  v35 = [v53 objectForKeyedSubscript:@"tapNoiseBounds"];
  v36 = v35;
  if (v35 && ([v35 doubleValue], v37 > 0.0)) {
    v38 = v36;
  }
  else {
    v38 = &unk_270C6EF10;
  }
  [(TypistKeyboard *)self setTapBounds:v38];
  v39 = [v53 objectForKeyedSubscript:@"P_ERRANT"];
  if (v39)
  {
    v40 = [v53 objectForKeyedSubscript:@"P_ERRANT"];
    v41 = +[TypistKeyboardUtilities validateProbability:v40];
    [(TypistKeyboard *)self setSwipeErrantProbability:v41];
  }
  else
  {
    [(TypistKeyboard *)self setSwipeErrantProbability:&unk_270C6EF10];
  }

  v42 = [v53 objectForKeyedSubscript:@"SIGMA_PIVOT"];
  if (v42)
  {
    v43 = [v53 objectForKeyedSubscript:@"SIGMA_PIVOT"];
    [v43 doubleValue];
    if (v44 <= 0.0)
    {
      [(TypistKeyboard *)self setSwipeErrantSigma:&unk_270C6EF10];
    }
    else
    {
      v45 = [v53 objectForKeyedSubscript:@"SIGMA_PIVOT"];
      [(TypistKeyboard *)self setSwipeErrantSigma:v45];
    }
  }
  else
  {
    [(TypistKeyboard *)self setSwipeErrantSigma:&unk_270C6EF10];
  }

  v46 = [v53 objectForKeyedSubscript:@"P_CONVEX"];
  if (v46)
  {
    v47 = [v53 objectForKeyedSubscript:@"P_CONVEX"];
    v48 = +[TypistKeyboardUtilities validateProbability:v47];
    [(TypistKeyboard *)self setSwipeConvexProbability:v48];
  }
  else
  {
    [(TypistKeyboard *)self setSwipeConvexProbability:&unk_270C6EF10];
  }

  v49 = [v53 objectForKeyedSubscript:@"SIGMA_CONVEX"];
  if (v49)
  {
    v50 = [v53 objectForKeyedSubscript:@"SIGMA_CONVEX"];
    [v50 doubleValue];
    if (v51 <= 0.0)
    {
      [(TypistKeyboard *)self setSwipeConvexSigma:&unk_270C6EF10];
    }
    else
    {
      v52 = [v53 objectForKeyedSubscript:@"SIGMA_CONVEX"];
      [(TypistKeyboard *)self setSwipeConvexSigma:v52];
    }
  }
  else
  {
    [(TypistKeyboard *)self setSwipeConvexSigma:&unk_270C6EF10];
  }
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v202[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 rangeOfString:@";ml="];
  uint64_t v10 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v8 substringToIndex:v9];
  }
  double v11 = [NSString stringWithFormat:@"^(%@){1}(hw=.+)?$", v10];;
  uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", v11];
  unint64_t v13 = 0x265559000uLL;
  uint64_t v14 = +[TypistKeyboardUtilities generateKeyboardList];
  uint64_t v15 = v14;
  if (!v8
    || ([v14 filteredArrayUsingPredicate:v12],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 count],
        v16,
        BOOL v18 = v17 == 1,
        unint64_t v13 = 0x265559000,
        !v18))
  {
    v38 = NSString;
    v39 = [*(id *)(v13 + 1000) getMobileGestalt:@"HWModelStr"];
    v40 = [v38 stringWithFormat:@"CRITICAL WARNING: The keyboard ID (%@) is not valid on this device (%@)", v8, v39];

    v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v201 = *MEMORY[0x263F08338];
    v202[0] = v40;
    v42 = [NSDictionary dictionaryWithObjects:v202 forKeys:&v201 count:1];
    v43 = [v41 errorWithDomain:@"TypistUnsupportedKeyboardIDError" code:2 userInfo:v42];

    id v44 = v43;
    goto LABEL_36;
  }
  [(TypistKeyboard *)self setKeyboardID:v8];
  [(TypistKeyboard *)self setIsCapsLockedState:0];
  [(TypistKeyboard *)self setUsePopupKeys:1];
  uint64_t v19 = [v8 componentsSeparatedByString:@"@"];
  v128 = v15;
  v125 = v19;
  v184 = self;
  if (v19)
  {
    uint64_t v20 = [v19 objectAtIndexedSubscript:0];
    [(TypistKeyboard *)self setLayoutName:v20];

    uint64_t v21 = [(TypistKeyboard *)self layoutName];
    unsigned int v22 = [v21 containsString:@"_"];

    uint64_t v23 = [(TypistKeyboard *)self layoutName];
    uint64_t v24 = [v23 componentsSeparatedByString:@"_"];
    double v25 = [v24 objectAtIndexedSubscript:0];
    [(TypistKeyboard *)v184 setLanguageID:v25];

    self = v184;
    v26 = [(TypistKeyboard *)v184 layoutName];
    v27 = [v26 componentsSeparatedByString:@"_"];
    v28 = [v27 objectAtIndexedSubscript:v22];
    [(TypistKeyboard *)v184 setRegionCode:v28];
  }
  objc_super v29 = [(TypistKeyboard *)self keyboardID];
  v30 = [v29 componentsSeparatedByString:@"sw="];
  v31 = [v30 objectAtIndexedSubscript:1];

  v124 = v31;
  v32 = [v31 componentsSeparatedByString:@";"];
  double v33 = [v32 objectAtIndexedSubscript:0];
  [(TypistKeyboard *)self setKeyboardSW:v33];

  v34 = [(objc_class *)+[TypistKeyboardData keyboardData] setTIPreferences:v7];
  v181 = [(objc_class *)+[TypistKeyboardData keyboardData] setKeyboardUISettings:v7];
  [(TypistKeyboard *)self _setKeyboardUserPreferences:v7];
  uint64_t v35 = *MEMORY[0x263F7E830];
  v182 = v34;
  v36 = [v34 objectForKeyedSubscript:*MEMORY[0x263F7E830]];
  LODWORD(v33) = [v36 BOOLValue];

  id v183 = v8;
  v127 = v11;
  v126 = v12;
  if (v33)
  {
    double v37 = +[TypistCandidateBar initWithTypistKeyboard:self];
    [(TypistKeyboard *)self setCandidatebar:v37];
  }
  else
  {
    [(TypistKeyboard *)self setCandidatebar:0];
  }
  v177 = [v7 objectForKeyedSubscript:@"keyboardList"];
  v179 = [v7 objectForKeyedSubscript:@"appendKeyboard"];
  v174 = [v7 objectForKeyedSubscript:@"perfConditions"];
  v170 = [v7 objectForKeyedSubscript:@"preprocessing"];
  v168 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v166 = [v7 objectForKeyedSubscript:@"typeInterval"];
  v164 = [v7 objectForKeyedSubscript:@"touchMajorRadius"];
  v162 = [v7 objectForKeyedSubscript:@"fastTyping"];
  v160 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v158 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v156 = [v7 objectForKeyedSubscript:@"flickTyping"];
  v154 = [v7 objectForKeyedSubscript:@"prefersPopoverKeys"];
  uint64_t v188 = *MEMORY[0x263F7E7C0];
  v152 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v187 = *MEMORY[0x263F7E7C8];
  v150 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v186 = *MEMORY[0x263F7E7E0];
  v148 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v185 = *MEMORY[0x263F7E828];
  v123 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v193 = *MEMORY[0x263F7E7D8];
  v122 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v121 = [v7 objectForKeyedSubscript:v35];
  uint64_t v192 = *MEMORY[0x263F7E740];
  v120 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v191 = *MEMORY[0x263F7E878];
  v146 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v189 = *MEMORY[0x263F7E868];
  v144 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v190 = *MEMORY[0x263F1D398];
  v119 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v172 = *MEMORY[0x263F7E7B8];
  v118 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v117 = [v7 objectForKeyedSubscript:@"LowerCaseKeyboard"];
  v116 = [v7 objectForKeyedSubscript:@"usePredictionBar"];
  v142 = [v7 objectForKeyedSubscript:@"dictation"];
  uint64_t v173 = *MEMORY[0x263F7E870];
  v140 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v176 = *MEMORY[0x263F7E748];
  v138 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v136 = [v7 objectForKeyedSubscript:@"tapNoiseStyle"];
  v134 = [v7 objectForKeyedSubscript:@"FORCE_SPACE"];
  v132 = [v7 objectForKeyedSubscript:@"ALPHA"];
  v130 = [v7 objectForKeyedSubscript:@"SIGMA"];
  v129 = [v7 objectForKeyedSubscript:@"P_PIVOT"];
  v114 = [v7 objectForKeyedSubscript:@"P_ERRANT"];
  v115 = [v7 objectForKeyedSubscript:@"SIGMA_PIVOT"];
  v113 = [v7 objectForKeyedSubscript:@"P_CONVEX"];
  v112 = [v7 objectForKeyedSubscript:@"SIGMA_CONVEX"];
  v111 = v136;
  v110 = v138;
  v109 = v140;
  v108 = v142;
  v107 = v144;
  v106 = v146;
  uint64_t v105 = v35;
  v104 = v148;
  TYLog(@"######## SPECIFIED KEYBOARD OPTIONS FOR %@\n%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@",
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    (char)v8);

  v180 = [v182 objectForKeyedSubscript:v188];
  unsigned int v167 = [v180 BOOLValue];
  v178 = [v182 objectForKeyedSubscript:v187];
  unsigned int v163 = [v178 BOOLValue];
  v175 = [v182 objectForKeyedSubscript:v186];
  unsigned int v159 = [v175 BOOLValue];
  v171 = [v182 objectForKeyedSubscript:v185];
  unsigned int v155 = [v171 BOOLValue];
  v169 = [v182 objectForKeyedSubscript:v193];
  unsigned int v151 = [v169 BOOLValue];
  v165 = [v182 objectForKeyedSubscript:v35];
  unsigned int v147 = [v165 BOOLValue];
  v161 = [v182 objectForKeyedSubscript:v192];
  unsigned int v143 = [v161 BOOLValue];
  v157 = [v182 objectForKeyedSubscript:v191];
  unsigned int v139 = [v157 BOOLValue];
  v153 = [v182 objectForKeyedSubscript:v189];
  unsigned int v135 = [v153 BOOLValue];
  v149 = [v181 objectForKeyedSubscript:v190];
  unsigned int v133 = [v149 BOOLValue];
  v145 = [v182 objectForKeyedSubscript:v172];
  unsigned int v131 = [v145 BOOLValue];
  v141 = [v181 objectForKeyedSubscript:@"LowerCaseKeyboard"];
  unsigned int v52 = [v141 BOOLValue];
  v137 = [v181 objectForKeyedSubscript:@"dictation"];
  unsigned int v53 = [v137 BOOLValue];
  v54 = [v182 objectForKeyedSubscript:v173];
  unsigned int v55 = [v54 BOOLValue];
  v56 = [v182 objectForKeyedSubscript:v176];
  uint64_t v103 = [v56 BOOLValue];
  uint64_t v102 = v55;
  uint64_t v101 = v52;
  uint64_t v100 = v35;
  TYLog(@"######## ACTUAL KEYBOARD AND ACCESSIBILITY SETTINGS ON SYSTEM\n%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d; \n########",
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v188);

  uint64_t v64 = [v7 objectForKeyedSubscript:@"keyboardList"];
  if (!v64
    || (v65 = (void *)v64,
        [v7 objectForKeyedSubscript:@"keyboardList"],
        v66 = objc_claimAutoreleasedReturnValue(),
        uint64_t v67 = [v66 count],
        v66,
        v65,
        !v67))
  {
    id v8 = v183;
    double v11 = v127;
    uint64_t v12 = v126;
    v40 = v125;
    v85 = v184;
LABEL_31:
    v93 = [v7 objectForKeyedSubscript:@"appendKeyboard"];
    -[TypistKeyboard activate:](v85, "activate:", [v93 BOOLValue]);

    [(TypistKeyboard *)v85 setupSentenceBoundryStrings];
    v94 = [(TypistKeyboard *)v85 _setupAutoShiftRegex];
    [(TypistKeyboard *)v85 setAutoshiftRegex:v94];

    uint64_t v95 = [v7 objectForKeyedSubscript:@"preprocessing"];
    if (!v95
      || (v96 = (void *)v95,
          [v7 objectForKeyedSubscript:@"preprocessing"],
          v97 = objc_claimAutoreleasedReturnValue(),
          int v98 = [v97 BOOLValue],
          v97,
          v96,
          v98))
    {
      [(TypistKeyboard *)v85 preprocessing];
    }
    id v44 = 0;
    goto LABEL_35;
  }
  v68 = [v7 objectForKeyedSubscript:@"keyboardList"];
  v69 = (void *)[v68 copy];

  v70 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v69, "count"));
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id v71 = v69;
  uint64_t v72 = [v71 countByEnumeratingWithState:&v194 objects:v200 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v195;
    do
    {
      for (uint64_t i = 0; i != v73; ++i)
      {
        if (*(void *)v195 != v74) {
          objc_enumerationMutation(v71);
        }
        id v76 = *(id *)(*((void *)&v194 + 1) + 8 * i);

        uint64_t v77 = [v76 rangeOfString:@";ml="];
        if (v77 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v76;
        }
        else
        {
          uint64_t v10 = [v76 substringToIndex:v77];
        }
        [v70 addObject:v10];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v194 objects:v200 count:16];
    }
    while (v73);
  }

  v78 = [MEMORY[0x263EFFA08] setWithArray:v70];
  v79 = [MEMORY[0x263EFFA08] setWithArray:v128];
  int v80 = [v78 isSubsetOfSet:v79];

  if (v80)
  {
    v81 = [v7 objectForKeyedSubscript:@"appendKeyboard"];
    int v82 = [v81 BOOLValue];

    v83 = +[TypistKeyboardData keyboardData];
    id v8 = v183;
    double v11 = v127;
    uint64_t v12 = v126;
    if (v82) {
      id v84 = (id)[(objc_class *)v83 addKeyboards:v71];
    }
    else {
      id v92 = (id)[(objc_class *)v83 setKeyboards:v71];
    }
    v85 = v184;

    uint64_t v10 = 0;
    v40 = v125;
    goto LABEL_31;
  }
  v86 = NSString;
  v87 = +[TypistKeyboardUtilities getMobileGestalt:@"HWModelStr"];
  objc_msgSend(v86, "stringWithFormat:", @"CRITICAL WARNING: Some keyboards specified are not valid on this device (%@)", v87, v167, v187, v163, v186, v159, v185, v155, v193, v151, v100, v147, v192, v143, v191, v139,
    v189,
    v135,
    v190,
    v133,
    v172,
    v131,
    @"LowerCaseKeyboard",
    v101,
    @"dictation",
    v53,
    v173,
    v102,
    v176,
    v103,
    v104,
    v185,
    v123,
    v193,
    v122,
    v105,
    v121,
    v192,
    v120,
    v191,
    v106,
    v189,
    v107,
    v190,
    v119,
    v172,
    v118,
    @"LowerCaseKeyboard",
    v117,
    @"usePredictionBar",
    v116,
    @"dictation",
    v108,
    v173,
    v109,
    v176,
    v110,
    @"tapNoiseStyle",
    v111,
  v88 = @"FORCE_SPACE");

  v89 = (void *)MEMORY[0x263F087E8];
  uint64_t v198 = *MEMORY[0x263F08338];
  v199 = v88;
  v90 = [NSDictionary dictionaryWithObjects:&v199 forKeys:&v198 count:1];
  v91 = [v89 errorWithDomain:@"TypistUnsupportedKeyboardIDError" code:2 userInfo:v90];

  id v44 = v91;
  uint64_t v10 = 0;
  id v8 = v183;
  double v11 = v127;
  uint64_t v12 = v126;
  v40 = v125;
LABEL_35:

  uint64_t v15 = v128;
LABEL_36:

  return v44;
}

- (id)_character_set_pattern_from_string:(id)a3
{
  objc_super v3 = NSString;
  id v4 = [MEMORY[0x263F08AE8] escapedPatternForString:a3];
  uint64_t v5 = [v3 stringWithFormat:@"[%@]", v4];

  id v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];

  return v6;
}

- (id)createAutoshiftRegularExpressionWithDelimitingCharacters:(id)a3 sentenceTrailingCharacters:(id)a4 sentencePrefixingCharacters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(TypistKeyboard *)self _character_set_pattern_from_string:@"  "];
  uint64_t v12 = NSString;
  unint64_t v13 = [(TypistKeyboard *)self _character_set_pattern_from_string:v10];

  uint64_t v14 = [(TypistKeyboard *)self _character_set_pattern_from_string:v9];

  uint64_t v15 = [v12 stringWithFormat:@"\\A|\\n|(?:%@){3}|((?:\\b\\w++(?:\\.\\w++)*)?(?:%@))(?:%@)*(?:%@)", v11, v13, v14, v11];

  uint64_t v16 = NSString;
  uint64_t v17 = [(TypistKeyboard *)self _character_set_pattern_from_string:v8];

  BOOL v18 = [v16 stringWithFormat:@"(?:%@)(?:%@)*(?:%@)*\\Z", v15, v11, v17];

  id v29 = 0;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v18 options:16 error:&v29];
  id v20 = v29;
  v27 = v20;
  if (!v19) {
    TYLogl(OS_LOG_TYPE_ERROR, @"Failed to create autoshift regular expression: %@", v21, v22, v23, v24, v25, v26, (char)v20);
  }

  return v19;
}

- (void)activate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TypistKeyboard *)self keyboardID];
  TYLog(@"Switching keyboard to %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);

  unint64_t v13 = +[TypistKeyboardData keyboardData];
  id v14 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v15 = [(TypistKeyboard *)self keyboardID];
  uint64_t v16 = objc_msgSend(v14, "initWithObjects:", v15, 0);
  if (v3) {
    id v17 = (id)[(objc_class *)v13 addKeyboards:v16];
  }
  else {
    id v18 = (id)[(objc_class *)v13 setKeyboards:v16];
  }

  uint64_t v19 = +[TypistKeyboardData keyboardData];
  id v20 = [(TypistKeyboard *)self keyboardID];
  [(objc_class *)v19 switchToKeyboard:v20];
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v3 = a3;
  id v4 = [(objc_class *)+[TypistKeyboardData keyboardData] generateKeyplaneSwitchTable:v3];

  return v4;
}

- (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  id v3 = a3;
  id v4 = [(objc_class *)+[TypistKeyboardData keyboardData] generateKeyplaneSwitchTableFor10Key:v3];

  return v4;
}

- (void)setOneHandedPosition:(id)a3
{
  id v26 = a3;
  TYLog(@"######## SETTING ONE HANDED (REACHABLE) KEYBOARD", v4, v5, v6, v7, v8, v9, v10, v24);
  int64_t v11 = +[TypistKeyboardUtilities getUIInterfaceOrientation];
  uint64_t v12 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v12 userInterfaceIdiom] == 1) {
    goto LABEL_6;
  }
  unint64_t v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 _referenceBounds];
  if (v14 <= 320.0)
  {

LABEL_6:
    goto LABEL_7;
  }

  if (v11 == 1)
  {
    uint64_t v21 = +[TypistKeyboardData keyboardData];
    uint64_t v22 = [NSDictionary dictionaryWithObject:v26 forKey:*MEMORY[0x263F7E7D0]];
    id v23 = (id)[(objc_class *)v21 setKeyboardUISettings:v22];

    [(TypistKeyboard *)self preprocessing];
    goto LABEL_8;
  }
LABEL_7:
  TYLogl(OS_LOG_TYPE_ERROR, @"### WARNING: setOneHandedPosition - The one handed mode is not supported on this device with current orientation. Nothing to do...", v15, v16, v17, v18, v19, v20, v25);
LABEL_8:
}

- (void)setFloatingKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TypistKeyboard *)self isFloating] != a3)
  {
    +[TypistKeyboardUtilities setFloatingKeyboard:v3];
    [(TypistKeyboard *)self preprocessing];
  }
}

- (BOOL)isFloating
{
  return +[TypistKeyboardUtilities isFloating];
}

- (void)moveFloatingKeyboardToPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v32[2] = *MEMORY[0x263EF8340];
  if ([(TypistKeyboard *)self isFloating])
  {
    +[TypistKeyboardUtilities floatingKeyboardDraggablePoint];
    unint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
    v32[0] = v13;
    double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
    v32[1] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];

    uint64_t v16 = NSNumber;
    double v17 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate];
    *(float *)&double v17 = v17;
    uint64_t v18 = [v16 numberWithFloat:v17];
    v30[0] = @"ALPHA";
    LODWORD(v19) = 1.0;
    uint64_t v20 = [NSNumber numberWithFloat:v19];
    v30[1] = @"CPPATHGEN_TIME_INTERVAL";
    v31[0] = v20;
    v31[1] = v18;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    uint64_t v22 = +[TypistPathUtilities generatePathArgumentStringWithParameters:v21 fromPoints:v15];

    v27[0] = @"action";
    v27[1] = @"argumentList";
    v28[0] = @"mt";
    v28[1] = v22;
    id v23 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v29 = v23;
    char v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];

    char v25 = +[TypistKeyboardUtilities convertRecapCommandsFromListOfActions:v24];
    +[TypistKeyboardUtilities launchRecap:v25];

    id v26 = [(TypistKeyboard *)self typeInterval];
    [v26 doubleValue];
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:");

    [(TypistKeyboard *)self preprocessing];
  }
  else
  {
    TYLog(@"Keyboard is not currently in a floating state.", v6, v7, v8, v9, v10, v11, v12, v34);
  }
}

- (BOOL)isTenKey
{
  return 0;
}

- (BOOL)isKanaKeyboard
{
  return 0;
}

- (BOOL)isHandwriting
{
  return 0;
}

- (id)keysDataForInputMode:(id)a3 andFileName:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 stringWithFormat:@"%@/System/Library/TextInput/TextInput_%@.bundle/%@", GSSystemRootDirectory(), v7, v6];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v8 options:1 error:0];
  uint64_t v10 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:0 format:0 error:0];

  return v10;
}

- (BOOL)dictationSupported
{
  v2 = [(TypistKeyboard *)self keyboardID];
  BOOL v3 = +[TypistKeyboardUtilities isDictationSupported:v2];

  return v3;
}

- (BOOL)shouldShowDictationKey
{
  return +[TypistKeyboardUtilities shouldShowDictationKey];
}

- (BOOL)shouldShowGlobeKey
{
  return +[TypistKeyboardUtilities shouldShowGlobeKey];
}

- (id)getShiftPlaneForDefaultPlane
{
  BOOL v3 = [(TypistKeyboard *)self planeSwitchTable];
  uint64_t v4 = [(TypistKeyboard *)self defaultPlaneName];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v5 allKeysForObject:@"⇧"];
  id v7 = [v6 lastObject];

  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_270C5A038;
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)getShiftPlaneForAlternatePlane
{
  BOOL v3 = [(TypistKeyboard *)self planeSwitchTable];
  uint64_t v4 = [(TypistKeyboard *)self defaultPlaneName];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v5 allKeysForObject:@"🔤"];
  id v7 = [v6 lastObject];

  if (v7)
  {
    uint64_t v8 = [(TypistKeyboard *)self planeSwitchTable];
    uint64_t v9 = [v8 objectForKeyedSubscript:v7];
    uint64_t v10 = [v9 allKeysForObject:@"⇧"];
    uint64_t v11 = [v10 lastObject];
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &stru_270C5A038;
  }
  unint64_t v13 = v12;

  return v13;
}

- (id)getAlternatePlanesForDefaultPlane
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(TypistKeyboard *)self planeSwitchTable];
  uint64_t v5 = [(TypistKeyboard *)self defaultPlaneName];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 allKeysForObject:@"🔤"];
  uint64_t v8 = [v7 lastObject];

  if (v8)
  {
    [v3 addObject:v8];
    uint64_t v9 = [(TypistKeyboard *)self planeSwitchTable];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];
    uint64_t v11 = [v10 allKeysForObject:@"⇧"];
    uint64_t v12 = [v11 lastObject];

    if (v12) {
      [v3 addObject:v12];
    }
    id v13 = v3;
  }
  else
  {
    id v13 = &unk_270C6F7C8;
  }

  return v13;
}

- (void)preprocessing
{
  id v10 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardLayout:self];
  BOOL v3 = [v10 objectForKeyedSubscript:@"keyPlanes"];
  [(TypistKeyboard *)self setKeyPlanes:v3];

  uint64_t v4 = [v10 objectForKeyedSubscript:@"defaultPlaneName"];
  [(TypistKeyboard *)self setDefaultPlaneName:v4];

  uint64_t v5 = [v10 objectForKeyedSubscript:@"planeSwitchTable"];
  [(TypistKeyboard *)self setPlaneSwitchTable:v5];

  if (+[TypistKeyboardData isKeyboardUIOutOfProcess])
  {
    id v6 = [v10 objectForKeyedSubscript:@"extraKeyplaneData"];

    if (v6)
    {
      id v7 = [v10 objectForKeyedSubscript:@"extraKeyplaneData"];
      [(TypistKeyboard *)self setupExtraKeyplaneDataIfNeeded:v7];
    }
  }
  uint64_t v8 = +[TypistKeyboardData keyboardData];
  uint64_t v9 = [(TypistKeyboard *)self defaultPlaneName];
  [(objc_class *)v8 switchToPlane:v9];

  +[TypistKeyboardUtilities waitFor:0.2];
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 lowercaseString];
  char v5 = [v4 containsString:@"space-key"];

  if (v5)
  {
    id v6 = @" ";
  }
  else
  {
    id v7 = [v3 lowercaseString];
    char v8 = [v7 containsString:@"return-key"];

    if (v8)
    {
      id v6 = @"⏎";
    }
    else
    {
      uint64_t v9 = [v3 lowercaseString];
      char v10 = [v9 containsString:@"delete"];

      if (v10)
      {
        id v6 = @"⌫";
      }
      else
      {
        uint64_t v11 = [v3 lowercaseString];
        char v12 = [v11 containsString:@"international"];

        if (v12)
        {
          id v6 = @"🌐";
        }
        else
        {
          id v13 = [v3 lowercaseString];
          char v14 = [v13 containsString:@"writeboard-key"];

          if (v14)
          {
            id v6 = @"☝";
          }
          else
          {
            uint64_t v15 = [v3 lowercaseString];
            char v16 = [v15 containsString:@"shift"];

            if (v16)
            {
              id v6 = @"⇧";
            }
            else
            {
              double v17 = [v3 lowercaseString];
              char v18 = [v17 containsString:@"tab-key"];

              if (v18)
              {
                id v6 = @"⇥";
              }
              else
              {
                double v19 = [v3 lowercaseString];
                char v20 = [v19 containsString:@"more-key"];

                if (v20)
                {
                  id v6 = @"🔤";
                }
                else
                {
                  uint64_t v21 = [v3 lowercaseString];
                  char v22 = [v21 containsString:@"dictation"];

                  if (v22)
                  {
                    id v6 = @"🎙";
                  }
                  else
                  {
                    id v23 = [v3 lowercaseString];
                    char v24 = [v23 containsString:@"undo"];

                    if (v24)
                    {
                      id v6 = @"↩";
                    }
                    else
                    {
                      char v25 = [v3 lowercaseString];
                      int v26 = [v25 containsString:@"redo"];

                      if (v26) {
                        id v6 = @"↪";
                      }
                      else {
                        id v6 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

- (CGPoint)calculateCoordinatesForFlickGesture:(CGPoint)a3 direction:(id)a4 offset:(float)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  uint64_t v18 = 0;
  double v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  uint64_t v21 = &unk_26042309E;
  CGFloat v22 = x;
  CGFloat v23 = y;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__TypistKeyboard_calculateCoordinatesForFlickGesture_direction_offset___block_invoke;
  v14[3] = &unk_2655597C8;
  id v9 = v8;
  float v17 = a5;
  id v15 = v9;
  char v16 = &v18;
  +[TypistKeyboardUtilities runOnMainThread:v14];
  double v10 = v19[4];
  double v11 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v12 = v10;
  double v13 = v11;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

double __71__TypistKeyboard_calculateCoordinatesForFlickGesture_direction_offset___block_invoke(uint64_t a1)
{
  double v10 = 0.0;
  double v11 = 0.0;
  if ([*(id *)(a1 + 32) isEqualToString:@"↓"])
  {
    double v2 = *(float *)(a1 + 48) + 0.0;
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"↑"])
    {
      if ([*(id *)(a1 + 32) isEqualToString:@"←"])
      {
        double v3 = 0.0 - *(float *)(a1 + 48);
      }
      else if ([*(id *)(a1 + 32) isEqualToString:@"→"])
      {
        double v3 = *(float *)(a1 + 48) + 0.0;
      }
      else if ([*(id *)(a1 + 32) isEqualToString:@"↙"])
      {
        double v4 = *(float *)(a1 + 48);
        double v5 = v4 + 0.0;
        double v3 = 0.0 - v4;
        double v11 = v5;
      }
      else
      {
        if (![*(id *)(a1 + 32) isEqualToString:@"↘"]) {
          goto LABEL_15;
        }
        double v3 = *(float *)(a1 + 48) + 0.0;
        double v11 = v3;
      }
      double v10 = v3;
      goto LABEL_15;
    }
    double v2 = 0.0 - *(float *)(a1 + 48);
  }
  double v11 = v2;
LABEL_15:
  id v6 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", *(void *)&v10);
  +[TypistKeyboardUtilities correctForRotation:orientation:](TypistKeyboardUtilities, "correctForRotation:orientation:", &v10, [v6 orientation]);

  double v7 = v11;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v10
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v7 + *(double *)(v8 + 40);
  *(double *)(v8 + 40) = result;
  return result;
}

- (id)convertRepresentedStringsIfNecessary:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = [(objc_class *)+[TypistKeyboardData keyboardData] addKeyboardPopupKeys:self keys:v13 inPlane:v12 addTo:v11 keyplaneKeycaps:v10];

  return v14;
}

- (BOOL)_isPlaneControlKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"⇧"] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@"⌫"] & 1) != 0
    || ([v3 isEqualToString:@"🔤"] & 1) != 0
    || ([v3 isEqualToString:@"🌐"] & 1) != 0
    || ([v3 isEqualToString:@"⇪"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"⏎"];
  }

  return v4;
}

- (CGPoint)_guardAgainstOffScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  GSMainScreenPointSize();
  double v7 = 0.0;
  if (x >= 0.0) {
    double v8 = x;
  }
  else {
    double v8 = 0.0;
  }
  if (y >= 0.0) {
    double v7 = y;
  }
  if (v8 <= v5) {
    double v5 = v8;
  }
  if (v7 <= v6) {
    double v6 = v7;
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)_determinePointBetween:(CGPoint)a3 nextPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", a3.x, a3.y, 5.0);
  float v10 = x - v7;
  if (v10 >= 0.0)
  {
    if (v8 >= v7) {
      goto LABEL_7;
    }
    double v12 = v7 - v8;
    double v13 = 2.0;
  }
  else
  {
    if (v8 <= v7) {
      goto LABEL_7;
    }
    double v12 = v8 - v7;
    double v13 = -2.0;
  }
  double v8 = v8 + v12 * v13;
LABEL_7:
  float v11 = y - v6;
  if (v11 >= 0.0)
  {
    if (v9 < v6)
    {
      double v14 = v6 - v9;
      double v15 = 2.0;
      goto LABEL_12;
    }
  }
  else if (v9 > v6)
  {
    double v14 = v9 - v6;
    double v15 = -2.0;
LABEL_12:
    double v9 = v9 + v14 * v15;
  }
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (id)_generateArgumentList:(id)a3
{
  v95[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(TypistKeyboard *)self swipeAlpha];
  [v5 doubleValue];
  double v82 = v6;

  double v7 = [(TypistKeyboard *)self swipeSigma];
  [v7 doubleValue];
  double v9 = v8;

  float v10 = [(TypistKeyboard *)self swipePivotProbability];
  [v10 doubleValue];
  double v87 = v11;

  double v12 = [(TypistKeyboard *)self swipeErrantProbability];
  [v12 doubleValue];
  double v86 = v13;

  double v14 = [(TypistKeyboard *)self swipeErrantSigma];
  [v14 doubleValue];
  double v85 = v15;

  char v16 = [(TypistKeyboard *)self swipeConvexProbability];
  [v16 doubleValue];
  double v88 = v17;

  uint64_t v18 = [(TypistKeyboard *)self swipeConvexSigma];
  [v18 doubleValue];
  double v84 = v19;

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_270C5A038];
  uint64_t v21 = objc_opt_new();
  if ([v4 count])
  {
    unint64_t v22 = 0;
    double v81 = 0.333333333;
    double v80 = 0.666666667;
    double v79 = 0.666666667;
    double v78 = 0.333333333;
    do
    {
      CGFloat v23 = objc_msgSend(v4, "objectAtIndexedSubscript:", v22, *(void *)&v78, *(void *)&v79, *(void *)&v80, *(void *)&v81);
      [v23 floatValue];
      double v25 = v24;

      int v26 = [v4 objectAtIndexedSubscript:v22 + 1];
      [v26 floatValue];
      double v28 = v27;

      if (!v22)
      {
        +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
        -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
        id v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
        [v21 addObject:v29];
      }
      +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
      -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
      double v31 = v30;
      double v33 = v32;
      char v34 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
      [v21 addObject:v34];

      if (v22 <= [v4 count] - 4 && (unint64_t)objc_msgSend(v4, "count") >= 3)
      {
        if ((double)arc4random() / 4294967300.0 <= v86)
        {
          +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v31, v33, v85);
          -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
          double v31 = v35;
          double v33 = v36;
          double v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
          [v21 addObject:v37];
        }
        if ((double)arc4random() / 4294967300.0 <= v87 && v22 != 0)
        {
          v39 = [v4 objectAtIndexedSubscript:v22 + 2];
          [v39 floatValue];
          double v41 = v40;
          v42 = [v4 objectAtIndexedSubscript:v22 + 3];
          [v42 floatValue];
          double v44 = v43;

          -[TypistKeyboard _determinePointBetween:nextPoint:](self, "_determinePointBetween:nextPoint:", v31, v33, v41, v44);
          -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
          double v31 = v45;
          double v33 = v46;
          uint64_t v47 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
          [v21 addObject:v47];
        }
        if ((double)arc4random() / 4294967300.0 <= v88)
        {
          uint64_t v48 = [v4 objectAtIndexedSubscript:v22 + 2];
          [v48 floatValue];
          double v50 = v49;
          uint64_t v51 = [v4 objectAtIndexedSubscript:v22 + 3];
          [v51 floatValue];
          double v53 = v52;

          if ((double)arc4random() / 4294967300.0 <= v88)
          {
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v50 * v81 + v31 * v80, v53 * v81 + v33 * v80, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            double v59 = v58;
            double v83 = v60;
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v50 * v79 + v31 * v78, v53 * v79 + v33 * v78, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            double v55 = v61;
            double v57 = v62;
            uint64_t v63 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v59, v83);
            [v21 addObject:v63];
          }
          else
          {
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", (v31 + v50) * 0.5, (v33 + v53) * 0.5, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            double v55 = v54;
            double v57 = v56;
          }
          uint64_t v64 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v55, v57);
          [v21 addObject:v64];
        }
      }
      if (v22 == [v4 count] - 2)
      {
        +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
        -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
        v65 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
        [v21 addObject:v65];
      }
      v22 += 2;
    }
    while (v22 < [v4 count]);
  }
  double v66 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate];
  *(float *)&double v66 = v66;
  uint64_t v67 = [NSNumber numberWithFloat:v66];
  v94[0] = @"ALPHA";
  HIDWORD(v68) = HIDWORD(v82);
  *(float *)&double v68 = v82;
  v69 = [NSNumber numberWithFloat:v68];
  v95[0] = v69;
  v95[1] = v67;
  v94[1] = @"CPPATHGEN_TIME_INTERVAL";
  v94[2] = @"CPPATHGEN_TIMING_ALGORITHM";
  v94[3] = @"CPPATHGEN_VELOCITY";
  v95[2] = @"EQUIDISTANT";
  v95[3] = &unk_270C6FD00;
  v70 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:4];

  id v71 = +[TypistPathUtilities generatePathArgumentStringWithParameters:v70 fromPoints:v21];
  [v20 appendString:v71];

  v91[0] = @"action";
  v91[1] = @"argumentList";
  v92[0] = @"mt";
  v92[1] = v20;
  uint64_t v72 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
  v93[0] = v72;
  v89[0] = @"action";
  v89[1] = @"time";
  v90[0] = @"wait";
  uint64_t v73 = [(TypistKeyboard *)self typeInterval];
  uint64_t v74 = [v73 stringValue];
  v90[1] = v74;
  v75 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  v93[1] = v75;
  id v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];

  return v76;
}

- (id)generateSwipeStream:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __38__TypistKeyboard_generateSwipeStream___block_invoke;
    v22[3] = &unk_265559650;
    v22[4] = self;
    +[TypistKeyboardUtilities runOnMainThread:v22];
    TYLogl(OS_LOG_TYPE_DEBUG, @"Generating swipe stream for input: [%@]", v5, v6, v7, v8, v9, v10, (char)v4);
    +[TypistKeyboardUtilities waitFor:0.1];
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x3032000000;
    double v19 = __Block_byref_object_copy__1;
    uint64_t v20 = __Block_byref_object_dispose__1;
    id v21 = (id)objc_opt_new();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__TypistKeyboard_generateSwipeStream___block_invoke_481;
    v13[3] = &unk_2655597F0;
    v13[4] = self;
    id v14 = v4;
    double v15 = &v16;
    +[TypistKeyboardUtilities runOnMainThread:v13];
    id v11 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __38__TypistKeyboard_generateSwipeStream___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) keyboardID];
  int v3 = [v2 isEqualToString:@"ko_KR@sw=Korean;hw=Automatic"];

  if (v3)
  {
    id v4 = +[TypistKeyboardData keyboardData];
    id v5 = [*(id *)(a1 + 32) defaultPlaneName];
    [(objc_class *)v4 switchToPlane:v5];
  }
}

void __38__TypistKeyboard_generateSwipeStream___block_invoke_481(uint64_t a1)
{
  v220[2] = *MEMORY[0x263EF8340];
  v219[0] = @"action";
  v219[1] = @"time";
  v220[0] = @"wait";
  double v2 = [*(id *)(a1 + 32) typeInterval];
  int v3 = [v2 stringValue];
  v220[1] = v3;
  v180 = [NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:2];

  v182 = +[TypistKeyboardUtilities formattedKeyplaneName];
  int v177 = [*(id *)(a1 + 32) swipeForceSpace];
  id v4 = objc_opt_new();
  if ([*(id *)(a1 + 40) length])
  {
    unint64_t v5 = 0;
    char v185 = 1;
    v181 = v4;
    do
    {
      unint64_t v6 = [*(id *)(a1 + 40) rangeOfComposedCharacterSequenceAtIndex:v5];
      unint64_t v8 = v5 - v6;
      if (v5 < v6) {
        unint64_t v8 = 0;
      }
      if (v5 <= v6) {
        unint64_t v9 = v6;
      }
      else {
        unint64_t v9 = v5;
      }
      uint64_t v10 = v7 - v8;
      id v11 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v7 - v8);
      double v12 = [*(id *)(a1 + 32) _multiCharacterTrailForGrapheme:v11];
      unint64_t v192 = v5;
      id obj = v12;
      if (v12)
      {
        long long v200 = 0u;
        long long v201 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v198 objects:v218 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v199;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v199 != v15) {
                objc_enumerationMutation(obj);
              }
              double v17 = *(void **)(*((void *)&v198 + 1) + 8 * i);
              uint64_t v18 = [v17 length];
              double v19 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v10 + v9, v18);
              LODWORD(v17) = [v19 isEqualToString:v17];

              if (v17)
              {
                v10 += v18;
                uint64_t v20 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v10);

                id v11 = (void *)v20;
              }
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v198 objects:v218 count:16];
          }
          while (v14);
        }
      }
      id v21 = v11;
      unint64_t v22 = v21;
      if (v10)
      {
        uint64_t v23 = v10 - 1;
        float v24 = v21;
        id v4 = v181;
        uint64_t v25 = v192;
        while (1)
        {
          int v26 = [*(id *)(a1 + 32) findKeyOnAnyPlane:v24];

          if (v26) {
            break;
          }
          objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v23);
          id v27 = (id)objc_claimAutoreleasedReturnValue();

          --v23;
          float v24 = v27;
          if (v23 == -1) {
            goto LABEL_25;
          }
        }
        id v27 = v24;

        uint64_t v25 = v192 + v23;
        unint64_t v22 = v27;
      }
      else
      {
        id v27 = v21;
        id v4 = v181;
        uint64_t v25 = v192;
      }
LABEL_25:
      double v28 = objc_opt_new();
      if ([v22 isEqualToString:@"⇪"])
      {
        [v28 addObject:v180];
        id v29 = [*(id *)(a1 + 32) generateKeystrokeStream:v22];
        [v28 addObjectsFromArray:v29];

        if ([v4 count])
        {
          double v30 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v216 = @"actions";
          double v31 = [*(id *)(a1 + 32) _generateArgumentList:v4];
          v217 = v31;
          double v32 = [NSDictionary dictionaryWithObjects:&v217 forKeys:&v216 count:1];
          [v30 addObject:v32];

          [v4 removeAllObjects];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v180];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v28];
        char v185 = 1;
        goto LABEL_117;
      }
      uint64_t v33 = [*(id *)(a1 + 32) getPostfixKey:v22];

      char v34 = (void *)v33;
      double v35 = [*(id *)(a1 + 32) keyPlanes];
      double v36 = [v35 objectForKeyedSubscript:v182];
      v184 = v34;
      double v37 = [v36 objectForKeyedSubscript:v34];
      v38 = (void *)[v37 mutableCopy];

      v39 = v38;
      if (v38)
      {
        float v40 = [v38 objectForKeyedSubscript:@"key"];
        if (![v40 isEqualToString:@" "])
        {

          id v4 = v181;
          v42 = v182;
LABEL_39:
          double v54 = [v39 objectForKeyedSubscript:@"plane"];
          char v55 = [v54 isEqualToString:&stru_270C5A038];
          double v56 = v42;
          if ((v55 & 1) == 0)
          {
            uint64_t v172 = [v39 objectForKeyedSubscript:@"plane"];
            double v56 = v172;
          }
          double v57 = v4;
          if ([v182 isEqualToString:v56])
          {
            double v58 = v39;
            [v39 objectForKeyedSubscript:@"key"];
            uint64_t v194 = v25;
            v60 = double v59 = v28;
            char v61 = [v60 isEqualToString:@" "];

            double v28 = v59;
            uint64_t v25 = v194;
            if (v55) {
              goto LABEL_46;
            }
LABEL_45:
          }
          else
          {
            double v58 = v39;
            char v61 = 1;
            if ((v55 & 1) == 0) {
              goto LABEL_45;
            }
          }
LABEL_46:

          v185 |= v61;
          uint64_t v193 = 0;
          v39 = v58;
          id v4 = v57;
          v42 = v182;
          goto LABEL_83;
        }
        char v41 = [*(id *)(a1 + 32) swipeForceSpace];

        id v4 = v181;
        v42 = v182;
        if (v41) {
          goto LABEL_39;
        }
        if ([v181 count])
        {
          float v43 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v212 = @"actions";
          double v44 = [*(id *)(a1 + 32) _generateArgumentList:v181];
          v213 = v44;
          [NSDictionary dictionaryWithObjects:&v213 forKeys:&v212 count:1];
          v46 = double v45 = v39;
          [v43 addObject:v46];

          v39 = v45;
          id v4 = v181;
          v42 = v182;

          [v181 removeAllObjects];
        }
        uint64_t v47 = 0;
        char v185 = 1;
        if (v177)
        {
          uint64_t v193 = 0;
LABEL_83:
          v96 = [v39 objectForKeyedSubscript:@"plane"];
          int v97 = [v96 isEqualToString:&stru_270C5A038];

          if (v97)
          {
            [v39 setObject:v42 forKey:@"plane"];
            char v185 = 1;
          }
          int v98 = *(void **)(a1 + 32);
          if (v25)
          {
            uint64_t v99 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v25 - 1, 1);
            uint64_t v176 = (void *)v99;
          }
          else
          {
            uint64_t v99 = 0;
          }
          uint64_t v100 = [*(id *)(a1 + 40) substringToIndex:v9];
          int v101 = [v98 isSwitchedToCapitalPlane:v39 previous:v99 currentPlane:v42 context:v100];

          if (v25) {
          uint64_t v102 = *(void **)(a1 + 32);
          }
          if (v101)
          {
            uint64_t v103 = [*(id *)(a1 + 32) defaultPlaneName];
            [v102 getShiftedKeyPlaneName:v103];
          }
          else
          {
            uint64_t v103 = [v39 objectForKeyedSubscript:@"plane"];
            [v102 getExpectedPlaneNameForKey:v184 currentPlane:v103];
          uint64_t v183 = };

          v104 = +[TypistKeyboardData keyboardData];
          uint64_t v105 = [v39 objectForKeyedSubscript:@"plane"];
          v106 = [(objc_class *)v104 getKeyplaneDescription:v105];

          if ((v185 & 1) != 0 && [v4 count])
          {
            v107 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            v210 = @"actions";
            v108 = [*(id *)(a1 + 32) _generateArgumentList:v4];
            v211 = v108;
            [NSDictionary dictionaryWithObjects:&v211 forKeys:&v210 count:1];
            v110 = v109 = v28;
            [v107 addObject:v110];

            double v28 = v109;
            [v4 removeAllObjects];
          }
          if ([v106 isLetters]
            && (v111 = *(void **)(a1 + 32),
                [v39 objectForKeyedSubscript:@"key"],
                v112 = objc_claimAutoreleasedReturnValue(),
                LOBYTE(v111) = [v111 _isPlaneControlKey:v112],
                v112,
                (v111 & 1) == 0))
          {
            uint64_t v190 = v28;
            v124 = [v39 objectForKeyedSubscript:@"type"];
            int v125 = [v124 isEqualToString:@"popover"];

            if (v125)
            {
              v126 = (void *)MEMORY[0x263EFF9A0];
              v174 = [*(id *)(a1 + 32) keyPlanes];
              v127 = [v39 objectForKeyedSubscript:@"plane"];
              v128 = [v174 objectForKeyedSubscript:v127];
              [v39 objectForKeyedSubscript:@"basekey"];
              v130 = v129 = v39;
              unsigned int v131 = [v128 objectForKeyedSubscript:v130];
              v132 = [v126 dictionaryWithDictionary:v131];

              v39 = v129;
              unsigned int v133 = [v132 objectForKeyedSubscript:@"x"];
              [v129 setObject:v133 forKey:@"x"];

              v134 = [v132 objectForKeyedSubscript:@"y"];
              [v129 setObject:v134 forKey:@"y"];

              [v129 setObject:@"tap" forKey:@"action"];
            }
            v175 = v106;
            unsigned int v135 = NSNumber;
            v136 = [v39 objectForKeyedSubscript:@"x"];
            [v136 floatValue];
            v137 = objc_msgSend(v135, "numberWithFloat:");
            [v181 addObject:v137];

            v138 = NSNumber;
            unsigned int v139 = [v39 objectForKeyedSubscript:@"y"];
            [v139 floatValue];
            v140 = objc_msgSend(v138, "numberWithFloat:");
            [v181 addObject:v140];

            if (v193)
            {
              v178 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              v208 = @"actions";
              v206[0] = @"action";
              v206[1] = @"plane";
              v207[0] = @"waitfor";
              v141 = v39;
              v142 = objc_msgSend(v39, "objectForKeyedSubscript:");
              v207[1] = v142;
              unsigned int v143 = [NSDictionary dictionaryWithObjects:v207 forKeys:v206 count:2];
              v144 = [v193 arrayByAddingObject:v143];
              v209 = v144;
              int v145 = 1;
              v146 = [NSDictionary dictionaryWithObjects:&v209 forKeys:&v208 count:1];
              [v178 addObject:v146];

              [*(id *)(a1 + 32) setIsCapsLockedState:0];
            }
            else
            {
              v141 = v39;
              int v145 = (v177 | [*(id *)(a1 + 32) swipeForceSpace]) & 1;
            }
            double v28 = v190;
            id v4 = v181;
            if (v25 == [*(id *)(a1 + 40) length] - 1)
            {
              v156 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              v204 = @"actions";
              v157 = [*(id *)(a1 + 32) _generateArgumentList:v181];
              v205 = v157;
              v158 = [NSDictionary dictionaryWithObjects:&v205 forKeys:&v204 count:1];
              [v156 addObject:v158];

              [v181 removeAllObjects];
              int v145 = [*(id *)(a1 + 32) swipeForceSpace];
            }
            char v185 = 0;
            v39 = v141;
            uint64_t v77 = (void *)v183;
            v106 = v175;
          }
          else
          {
            v113 = [v39 objectForKeyedSubscript:@"type"];
            int v114 = [v113 isEqualToString:@"basekey"];

            if (v114)
            {
              [v28 addObject:v39];
            }
            else
            {
              v115 = [v39 objectForKeyedSubscript:@"type"];
              int v116 = [v115 isEqualToString:@"gesture"];

              if (v116)
              {
                v117 = [*(id *)(a1 + 32) keyPlanes];
                v118 = [v39 objectForKeyedSubscript:@"plane"];
                v119 = [v117 objectForKeyedSubscript:v118];
                [v39 objectForKeyedSubscript:@"basekey"];
                v120 = v106;
                v122 = v121 = v39;
                uint64_t v189 = [v119 objectForKeyedSubscript:v122];

                v39 = v121;
                v106 = v120;

                [v28 addObject:v189];
                [v28 addObject:v39];
                uint64_t v123 = [v39 objectForKeyedSubscript:@"key"];

                v184 = (void *)v123;
              }
              else
              {
                uint64_t v191 = v28;
                unsigned int v147 = [v39 objectForKeyedSubscript:@"type"];
                int v148 = [v147 isEqualToString:@"popover"];

                if (v148)
                {
                  v149 = (void *)MEMORY[0x263EFF9A0];
                  v179 = [*(id *)(a1 + 32) keyPlanes];
                  v150 = [v39 objectForKeyedSubscript:@"plane"];
                  [v179 objectForKeyedSubscript:v150];
                  v152 = unsigned int v151 = v39;
                  v153 = [v151 objectForKeyedSubscript:@"basekey"];
                  v154 = [v152 objectForKeyedSubscript:v153];
                  unsigned int v155 = [v149 dictionaryWithDictionary:v154];

                  v39 = v151;
                  [v155 setValue:@"taphold" forKey:@"action"];
                  double v28 = v191;
                  [v191 addObject:v155];
                  [v191 addObject:v151];
                }
                else
                {
                  unsigned int v159 = [*(id *)(a1 + 32) keyPlanes];
                  v160 = [v39 objectForKeyedSubscript:@"plane"];
                  v161 = [v159 objectForKeyedSubscript:v160];
                  [v39 objectForKeyedSubscript:@"basekey"];
                  unsigned int v163 = v162 = v39;
                  v164 = [v161 objectForKeyedSubscript:v163];

                  v39 = v162;
                  [v191 addObject:v164];
                  [v191 addObject:v162];

                  double v28 = v191;
                }
              }
              id v4 = v181;
            }
            [v28 addObject:v180];
            v165 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            v202[0] = @"keystroke";
            v202[1] = @"actions";
            v203[0] = v184;
            v203[1] = v28;
            v166 = [NSDictionary dictionaryWithObjects:v203 forKeys:v202 count:2];
            [v165 addObject:v166];

            [v4 removeAllObjects];
            char v185 = 1;
            int v145 = 1;
            uint64_t v77 = (void *)v183;
          }

          int v177 = v145 != 0;
          uint64_t v47 = v193;
          goto LABEL_116;
        }
        int v177 = 0;
        uint64_t v77 = v42;
      }
      else
      {
        uint64_t v48 = [@"⊎" stringByAppendingString:v184];
        float v49 = [*(id *)(a1 + 32) keyPlanes];
        double v50 = [v49 objectForKeyedSubscript:v182];
        uint64_t v173 = (void *)v48;
        uint64_t v51 = [v50 objectForKeyedSubscript:v48];
        uint64_t v52 = [v51 mutableCopy];

        v39 = (void *)v52;
        if (v52)
        {
          double v53 = 0;
          v42 = v182;
          id v4 = v181;
          goto LABEL_82;
        }
        double v62 = [*(id *)(a1 + 32) findKeyInOtherPlanes:v184 currentPlane:v182];
        uint64_t v63 = (void *)[v62 mutableCopy];

        v42 = v182;
        if (v63)
        {
          v171 = v63;
          if ([*(id *)(a1 + 32) isCapsLockedState])
          {
            v70 = [v63 objectForKeyedSubscript:@"plane"];
            id v71 = [*(id *)(a1 + 32) getShiftedKeyPlaneName:v182];
            int v72 = [v70 isEqualToString:v71];

            if (v72)
            {
              uint64_t v73 = [v184 lowercaseString];

              v170 = [*(id *)(a1 + 32) keyPlanes];
              uint64_t v74 = [v170 objectForKeyedSubscript:v182];
              v75 = [v74 objectForKeyedSubscript:v73];
              v39 = (void *)[v75 mutableCopy];

              id v76 = v74;
              v184 = (void *)v73;
              double v53 = 0;
              id v4 = v181;
              goto LABEL_81;
            }
          }
          v170 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyplaneDescription:v182];
          double v78 = +[TypistKeyboardData keyboardData];
          double v79 = [v171 objectForKeyedSubscript:@"plane"];
          if ([v79 isEqualToString:&stru_270C5A038])
          {
            id v76 = [(objc_class *)v78 getKeyplaneDescription:v182];
          }
          else
          {
            double v80 = [v171 objectForKeyedSubscript:@"plane"];
            id v76 = [(objc_class *)v78 getKeyplaneDescription:v80];
          }
          v42 = v182;

          v39 = v171;
          id v4 = v181;
          if ([v170 isAlphabeticPlane]
            && [v170 isShiftKeyplane]
            && [v76 isAlphabeticPlane]
            && ([v76 isShiftKeyplane] & 1) == 0
            && (![v170 isAlphabeticPlane]
             || ![v170 isShiftKeyplane]
             || ![v76 isAlphabeticPlane]
             || [v76 isShiftKeyplane])
            && (![v170 isAlphabeticPlane]
             || ([v170 isShiftKeyplane] & 1) != 0
             || ![v76 isAlphabeticPlane]
             || ![v76 isShiftKeyplane]))
          {
            double v53 = 0;
LABEL_80:
            char v185 = 1;
LABEL_81:

LABEL_82:
            uint64_t v193 = v53;

            goto LABEL_83;
          }
          v169 = v76;
          double v81 = [v171 objectForKeyedSubscript:@"plane"];
          int v82 = [v81 isEqualToString:&stru_270C5A038];

          if (v82) {
            [v171 setObject:v182 forKey:@"plane"];
          }
          double v83 = *(void **)(a1 + 32);
          double v84 = [v171 objectForKeyedSubscript:@"plane"];
          v42 = v182;
          double v53 = [v83 switchToPlane:v84 fromPlane:v182];

          if (v25 < 1)
          {
            v39 = v171;
            goto LABEL_77;
          }
          double v85 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
          if (!objc_msgSend(v85, "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", v25)))goto LABEL_68; {
          long long v195 = v53;
          }
          double v86 = *(void **)(a1 + 32);
          uint64_t v186 = [*(id *)(a1 + 40) substringToIndex:v25];
          double v87 = [v86 _sanitizedStringForAutoShiftCheck:v186];
          LODWORD(v86) = [v86 isAutoshiftedToCapitalPlane:v87];

          if (v86)
          {
            unint64_t v167 = [v195 count];
            double v88 = [v195 lastObject];
            v89 = [v88 objectForKeyedSubscript:@"plane"];
            int v187 = [v89 containsString:@"small-letter"];

            if (v187)
            {
              uint64_t v90 = objc_msgSend(v195, "subarrayWithRange:", 0, objc_msgSend(v195, "count") - 1);
              double v85 = v195;
              goto LABEL_67;
            }
            v39 = v171;
            if (v167 >= 2)
            {
              uint64_t v188 = [v195 lastObject];
              v91 = [v188 objectForKeyedSubscript:@"action"];
              if (([v91 isEqualToString:@"wait"] & 1) == 0)
              {

                double v85 = v188;
                double v53 = v195;
                goto LABEL_69;
              }
              id v92 = [v195 objectAtIndexedSubscript:v167 - 2];
              v93 = [v92 objectForKeyedSubscript:@"plane"];
              int v168 = [v93 containsString:@"small-letter"];

              if (v168)
              {
                double v85 = v195;
                uint64_t v90 = objc_msgSend(v195, "subarrayWithRange:", 0, objc_msgSend(v195, "count") - 2);
LABEL_67:
                double v53 = (void *)v90;
LABEL_68:
                v39 = v171;
LABEL_69:

LABEL_77:
                id v76 = v169;
                if (v53 && [v53 count])
                {
                  [v28 addObjectsFromArray:v53];
                  v214[0] = @"action";
                  v214[1] = @"plane";
                  v215[0] = @"waitfor";
                  objc_msgSend(v39, "objectForKeyedSubscript:");
                  v94 = long long v196 = v53;
                  v215[1] = v94;
                  uint64_t v95 = [NSDictionary dictionaryWithObjects:v215 forKeys:v214 count:2];
                  [v28 addObject:v95];

                  id v76 = v169;
                  double v53 = v196;
                  [*(id *)(a1 + 32) setIsCapsLockedState:0];
                }
                goto LABEL_80;
              }
              goto LABEL_75;
            }
          }
          else
          {
LABEL_75:
            v39 = v171;
          }
          double v53 = v195;
          goto LABEL_77;
        }
        TYLogl(OS_LOG_TYPE_ERROR, @"CRITICAL WARNING: key '%@' cannot be found in any of the keyboard planes, or is not supported.", v64, v65, v66, v67, v68, v69, (char)v184);

        v39 = 0;
        uint64_t v47 = 0;
        uint64_t v77 = v182;
        id v4 = v181;
      }
LABEL_116:

      unint64_t v22 = v184;
      v182 = v77;
LABEL_117:

      unint64_t v5 = v25 + 1;
    }
    while (v5 < [*(id *)(a1 + 40) length]);
  }
}

- (id)generateKeystrokeStream:(id)a3
{
  uint64_t v218 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4 || ([v4 isEqualToString:&stru_270C5A038] & 1) != 0)
  {
    id v180 = 0;
    goto LABEL_148;
  }
  unint64_t v6 = +[TypistKeyboardUtilities formattedKeyplaneName];
  TYLogl(OS_LOG_TYPE_DEBUG, @"Generating keystroke (tap) stream for input: [%@]", v7, v8, v9, v10, v11, v12, (char)v5);
  id v180 = (id)objc_opt_new();
  if ([v5 length])
  {
    int v194 = 0;
    unint64_t v13 = 0;
    v178 = &stru_270C5A038;
    char v185 = self;
    while (1)
    {
      long long v196 = v6;
      uint64_t v14 = objc_msgSend(v5, "substringWithRange:", v13, 1);
      if ([v14 isEqualToString:@"‍"])
      {
        unint64_t v15 = [v5 length] - 1;

        if (v13 < v15)
        {
          [v5 rangeOfComposedCharacterSequenceAtIndex:v13 + 1];
          uint64_t v17 = v16 + 1;
          unint64_t v18 = v13;
          goto LABEL_11;
        }
      }
      else
      {
      }
      unint64_t v18 = [v5 rangeOfComposedCharacterSequenceAtIndex:v13];
LABEL_11:
      unint64_t v19 = v13 - v18;
      if (v13 < v18) {
        unint64_t v19 = 0;
      }
      uint64_t v193 = v13;
      if (v13 <= v18) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = v13;
      }
      uint64_t v21 = v17 - v19;
      unint64_t v22 = objc_msgSend(v5, "substringWithRange:", v20, v17 - v19);
      uint64_t v23 = [(TypistKeyboard *)v185 _multiCharacterTrailForGrapheme:v22];
      id obj = v23;
      if (v23)
      {
        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v201 objects:v217 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v202;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v202 != v26) {
                objc_enumerationMutation(obj);
              }
              double v28 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              uint64_t v29 = [v28 length];
              double v30 = objc_msgSend(v5, "substringWithRange:", v21 + v20, v29);
              LODWORD(v28) = [v30 isEqualToString:v28];

              if (v28)
              {
                v21 += v29;
                uint64_t v31 = objc_msgSend(v5, "substringWithRange:", v20, v21);

                unint64_t v22 = (void *)v31;
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v201 objects:v217 count:16];
          }
          while (v25);
        }
      }
      double v32 = v22;
      uint64_t v33 = v32;
      if (v21)
      {
        uint64_t v34 = v21 - 1;
        double v35 = v32;
        double v36 = v185;
        unint64_t v37 = 0x263EFF000uLL;
        while (1)
        {
          v38 = [(TypistKeyboard *)v185 findKeyOnAnyPlane:v35];

          if (v38) {
            break;
          }
          objc_msgSend(v5, "substringWithRange:", v20, v34);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

          --v34;
          double v35 = v39;
          if (v34 == -1) {
            goto LABEL_33;
          }
        }
        v39 = v35;

        v193 += v34;
        uint64_t v33 = v39;
      }
      else
      {
        v39 = v32;
        double v36 = v185;
        unint64_t v37 = 0x263EFF000;
      }
LABEL_33:
      v184 = v39;
      if (v194)
      {
        float v40 = [NSString stringWithFormat:@"%@%@", v178, v33];
        goto LABEL_35;
      }
      if ([(TypistKeyboard *)v36 isTenKey]
        || [(TypistKeyboard *)v36 isKanaKeyboard]
        || ([(__CFString *)v33 isEqualToString:@"↓"] & 1) == 0
        && ([(__CFString *)v33 isEqualToString:@"↑"] & 1) == 0
        && ([(__CFString *)v33 isEqualToString:@"←"] & 1) == 0
        && ([(__CFString *)v33 isEqualToString:@"→"] & 1) == 0
        && ([(__CFString *)v33 isEqualToString:@"↙"] & 1) == 0
        && ![(__CFString *)v33 isEqualToString:@"↘"])
      {
        if (![(__CFString *)v33 isEqualToString:@"⇪"]) {
          goto LABEL_40;
        }
        char v41 = [(TypistKeyboard *)v36 keyPlanes];
        v42 = [v41 objectForKeyedSubscript:v196];
        float v43 = [v42 objectForKeyedSubscript:v33];

        if (!v43)
        {
          [(TypistKeyboard *)v36 setIsCapsLockedState:1];
          float v40 = @"⇧";
LABEL_35:
          int v189 = v194 ^ 1;

          uint64_t v33 = v40;
        }
        else
        {
LABEL_40:
          int v189 = 0;
        }
        uint64_t v190 = (__CFString *)objc_opt_new();
        double v44 = (void *)[(__CFString *)v33 copy];
        double v45 = [(TypistKeyboard *)v36 getPostfixKey:v33];

        double v46 = [(TypistKeyboard *)v36 getActionForKeystroke:v45 fromKeyPlane:v196];
        uint64_t v47 = [v46 mutableCopy];

        long long v195 = (void *)v47;
        uint64_t v186 = v44;
        uint64_t v191 = v45;
        if (v47)
        {
          uint64_t v48 = v190;
          goto LABEL_90;
        }
        float v49 = [(TypistKeyboard *)v36 findKeyInOtherPlanes:v45 currentPlane:v196];
        double v50 = (void *)[v49 mutableCopy];

        uint64_t v48 = v190;
        long long v195 = v50;
        if (!v50) {
          goto LABEL_153;
        }
        if ([(TypistKeyboard *)v36 isCapsLockedState])
        {
          uint64_t v51 = [v50 objectForKeyedSubscript:@"plane"];
          uint64_t v52 = [(TypistKeyboard *)v36 getShiftedKeyPlaneName:v196];
          int v53 = [v51 isEqualToString:v52];

          if (v53)
          {
            uint64_t v54 = [(__CFString *)v45 lowercaseString];

            unint64_t v192 = [(TypistKeyboard *)v36 keyPlanes];
            char v55 = [v192 objectForKeyedSubscript:v196];
            double v56 = (__CFString *)v54;
            double v57 = [v55 objectForKeyedSubscript:v54];
            uint64_t v58 = [v57 mutableCopy];

            uint64_t v191 = v56;
            long long v195 = (void *)v58;
            double v44 = v186;
            if (!v58)
            {
LABEL_153:
              double v59 = [(TypistKeyboard *)v36 attemptToFindKeystrokeAsSecondaryDisplay:v191];
              double v60 = (void *)[v59 mutableCopy];

              char v61 = [v60 objectForKeyedSubscript:@"plane"];
              if ([v196 isEqualToString:v61])
              {
                long long v195 = v60;
                v39 = v184;
              }
              else
              {
                uint64_t v65 = [v60 objectForKeyedSubscript:@"plane"];
                uint64_t v66 = [(TypistKeyboard *)v36 switchToPlane:v65 fromPlane:v196];
                if ([v66 count])
                {
                  long long v195 = v60;
                }
                else
                {

                  long long v195 = 0;
                }
                v39 = v184;

                double v44 = v186;
              }

              if (!v195)
              {
                double v62 = v191;
                double v88 = [(TypistKeyboard *)v36 tryAlternateVariationsOfKey:v191];
                if (v88) {
                  [v180 addObjectsFromArray:v88];
                }
                else {
                  TYLogl(OS_LOG_TYPE_ERROR, @"CRITICAL WARNING: key '%@' cannot be found in any of the keyboard planes, or is not supported.", v82, v83, v84, v85, v86, v87, (char)v191);
                }
                uint64_t v64 = obj;
                uint64_t v188 = v196;
                uint64_t v63 = v193;
                goto LABEL_143;
              }
            }
          }
        }
        uint64_t v67 = [v195 objectForKeyedSubscript:@"plane"];
        int v68 = [v67 isEqualToString:&stru_270C5A038];

        if (v68) {
          [v195 setObject:v196 forKey:@"plane"];
        }
        uint64_t v69 = [v195 objectForKeyedSubscript:@"plane"];
        if ([v69 isEqualToString:v196])
        {
          double v44 = v186;
          goto LABEL_89;
        }
        v70 = [v195 objectForKeyedSubscript:@"plane"];
        int v187 = [(TypistKeyboard *)v36 switchToPlane:v70 fromPlane:v196];

        if (v193 < 1)
        {
          double v44 = v186;
          id v71 = v187;
          goto LABEL_76;
        }
        double v44 = v186;
        id v71 = v187;
        if (!v187) {
          goto LABEL_76;
        }
        int v72 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
        if (objc_msgSend(v72, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v193)))
        {
          [v5 substringToIndex:v193];
          v74 = uint64_t v73 = v72;
          v75 = [(TypistKeyboard *)v36 _sanitizedStringForAutoShiftCheck:v74];
          BOOL v76 = [(TypistKeyboard *)v36 isAutoshiftedToCapitalPlane:v75];

          if (!v76)
          {
            double v44 = v186;
            goto LABEL_88;
          }
          unint64_t v181 = [v187 count];
          uint64_t v77 = [v187 lastObject];
          double v78 = [v77 objectForKeyedSubscript:@"plane"];
          char v79 = [v78 containsString:@"small-letter"];

          if (v79)
          {
            uint64_t v80 = -1;
            goto LABEL_72;
          }
          unint64_t v89 = v181 - 2;
          double v44 = v186;
          if (v181 < 2) {
            goto LABEL_88;
          }
          int v72 = [v187 lastObject];
          v182 = [v72 objectForKeyedSubscript:@"action"];
          if ([v182 isEqualToString:@"wait"])
          {
            [v187 objectAtIndexedSubscript:v89];
            uint64_t v90 = v177 = v72;
            v91 = [v90 objectForKeyedSubscript:@"plane"];
            int v92 = [v91 containsString:@"small-letter"];

            if (v92)
            {
              uint64_t v80 = -2;
LABEL_72:
              uint64_t v81 = objc_msgSend(v187, "subarrayWithRange:", 0, objc_msgSend(v187, "count") + v80);

              id v71 = (void *)v81;
              double v44 = v186;
LABEL_76:
              if (!v71)
              {
LABEL_90:
                uint64_t v95 = [v195 objectForKeyedSubscript:@"plane"];
                int v96 = [v95 isEqualToString:&stru_270C5A038];

                if (v96) {
                  [v195 setObject:v196 forKey:@"plane"];
                }
                if (v193)
                {
                  uint64_t v97 = objc_msgSend(v5, "substringWithRange:", v193 - 1, 1);
                  v179 = (void *)v97;
                }
                else
                {
                  uint64_t v97 = 0;
                }
                int v98 = [v5 substringToIndex:v20];
                BOOL v99 = [(TypistKeyboard *)v36 isSwitchedToCapitalPlane:v195 previous:v97 currentPlane:v196 context:v98];

                if (v193) {
                if (v99)
                }
                {
                  uint64_t v100 = [(TypistKeyboard *)v36 defaultPlaneName];
                  uint64_t v188 = [(TypistKeyboard *)v36 getShiftedKeyPlaneName:v100];
                }
                else
                {
                  if (v189) {
                    int v101 = @"⇪";
                  }
                  else {
                    int v101 = v191;
                  }
                  uint64_t v100 = [v195 objectForKeyedSubscript:@"plane"];
                  uint64_t v188 = [(TypistKeyboard *)v36 getExpectedPlaneNameForKey:v101 currentPlane:v100];
                }

                uint64_t v102 = +[TypistKeyboardData keyboardData];
                uint64_t v103 = [v195 objectForKeyedSubscript:@"plane"];
                uint64_t v183 = [(objc_class *)v102 getKeyplaneDescription:v103];

                v104 = [v195 objectForKeyedSubscript:@"type"];
                LODWORD(v103) = [v104 isEqualToString:@"basekey"];

                if (v103)
                {
                  if ([(TypistKeyboard *)v36 tapStyle])
                  {
                    if ([v183 isLetters])
                    {
                      uint64_t v105 = [v195 objectForKeyedSubscript:@"key"];
                      BOOL v106 = [(TypistKeyboard *)v36 _isPlaneControlKey:v105];

                      if (!v106)
                      {
                        v107 = [v195 objectForKeyedSubscript:@"x"];
                        [v107 doubleValue];
                        double v109 = v108;

                        v110 = [v195 objectForKeyedSubscript:@"y"];
                        [v110 doubleValue];
                        double v112 = v111;

                        if ([(TypistKeyboard *)v36 tapStyle] == 1)
                        {
                          v113 = [v195 objectForKeyedSubscript:@"rect"];
                          [v113 CGRectValue];
                          +[TypistKeyboardUtilities generateUniformPointWithMean:andBounds:](TypistKeyboardUtilities, "generateUniformPointWithMean:andBounds:", v109, v112, v114 * 0.5, v115 * 0.5);
                          uint64_t v117 = v116;
                          uint64_t v119 = v118;

                          goto LABEL_120;
                        }
                        if ([(TypistKeyboard *)v36 tapStyle] == 2)
                        {
                          v141 = [(TypistKeyboard *)v36 tapBounds];
                          [v141 doubleValue];
                          double v143 = v142;

                          +[TypistKeyboardUtilities generateUniformPointWithMean:andBounds:](TypistKeyboardUtilities, "generateUniformPointWithMean:andBounds:", v109, v112, v143, v143);
                          goto LABEL_119;
                        }
                        uint64_t v117 = 0;
                        uint64_t v119 = 0;
                        if ([(TypistKeyboard *)v36 tapStyle] == 3)
                        {
                          v146 = [(TypistKeyboard *)v36 tapSigma];
                          [v146 doubleValue];
                          double v148 = v147;

                          +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v109, v112, v148);
LABEL_119:
                          uint64_t v117 = v144;
                          uint64_t v119 = v145;
                        }
LABEL_120:
                        v149 = [NSString stringWithFormat:@"%.2f", v117];
                        [v195 setObject:v149 forKeyedSubscript:@"x"];

                        v150 = [NSString stringWithFormat:@"%.2f", v119];
                        [v195 setObject:v150 forKeyedSubscript:@"y"];
                      }
                    }
                  }
                  [(__CFString *)v48 addObject:v195];
                  if (v189)
                  {
                    [(__CFString *)v48 addObject:&unk_270C6F9E0];
                    [(__CFString *)v48 addObject:v195];
                  }
                }
                else
                {
                  v120 = [v195 objectForKeyedSubscript:@"type"];
                  int v121 = [v120 isEqualToString:@"gesture"];

                  if (v121)
                  {
                    long long v197 = [(TypistKeyboard *)v36 keyPlanes];
                    v122 = [v195 objectForKeyedSubscript:@"plane"];
                    uint64_t v123 = [v197 objectForKeyedSubscript:v122];
                    [v195 objectForKeyedSubscript:@"basekey"];
                    int v125 = v124 = v44;
                    v126 = [v123 objectForKeyedSubscript:v125];

                    double v44 = v124;
                    [(__CFString *)v190 addObject:v126];
                    [(__CFString *)v190 addObject:v195];
                    uint64_t v127 = [v195 objectForKeyedSubscript:@"key"];

                    uint64_t v48 = v190;
                    uint64_t v191 = (__CFString *)v127;
                  }
                  else
                  {
                    v128 = [v195 objectForKeyedSubscript:@"type"];
                    int v129 = [v128 isEqualToString:@"popover"];

                    if (v129)
                    {
                      v130 = (void *)MEMORY[0x263EFF9A0];
                      long long v198 = [(TypistKeyboard *)v36 keyPlanes];
                      unsigned int v131 = [v195 objectForKeyedSubscript:@"plane"];
                      v132 = [v198 objectForKeyedSubscript:v131];
                      unsigned int v133 = [v195 objectForKeyedSubscript:@"basekey"];
                      v134 = [v132 objectForKeyedSubscript:v133];
                      unsigned int v135 = [v130 dictionaryWithDictionary:v134];

                      [v135 setValue:@"taphold" forKey:@"action"];
                      uint64_t v48 = v190;
                      [(__CFString *)v190 addObject:v135];
                      [(__CFString *)v190 addObject:v195];
                    }
                    else
                    {
                      v136 = [(TypistKeyboard *)v36 keyPlanes];
                      v137 = [v195 objectForKeyedSubscript:@"plane"];
                      v138 = [v136 objectForKeyedSubscript:v137];
                      unsigned int v139 = [v195 objectForKeyedSubscript:@"basekey"];
                      v140 = [v138 objectForKeyedSubscript:v139];

                      uint64_t v48 = v190;
                      [(__CFString *)v190 addObject:v140];
                      [(__CFString *)v190 addObject:v195];
                    }
                    double v44 = v186;
                  }
                }
                unsigned int v151 = [(TypistKeyboard *)v36 addAccentKeyAction:v44];
                long long v199 = v151;
                if (v151)
                {
                  v152 = v151;
                  if ([v151 count])
                  {
                    unint64_t v153 = 0;
                    do
                    {
                      v213[0] = @"action";
                      v213[1] = @"time";
                      v214[0] = @"wait";
                      v154 = v36;
                      unsigned int v155 = [(TypistKeyboard *)v36 typeInterval];
                      v156 = [v155 stringValue];
                      v214[1] = v156;
                      [*(id *)(v37 + 2352) dictionaryWithObjects:v214 forKeys:v213 count:2];
                      v158 = v157 = v48;
                      [(__CFString *)v157 addObject:v158];

                      unsigned int v159 = [v152 objectAtIndexedSubscript:v153];
                      v160 = [v159 objectForKeyedSubscript:@"type"];
                      LODWORD(v158) = [v160 isEqualToString:@"gesture"];

                      if (v158)
                      {
                        v161 = [(TypistKeyboard *)v154 keyPlanes];
                        v162 = [v159 objectForKeyedSubscript:@"plane"];
                        unsigned int v163 = [v161 objectForKeyedSubscript:v162];
                        v164 = [v159 objectForKeyedSubscript:@"basekey"];
                        v165 = [v163 objectForKeyedSubscript:v164];

                        [(__CFString *)v157 addObject:v165];
                        unint64_t v37 = 0x263EFF000;
                      }
                      [(__CFString *)v157 addObject:v159];

                      ++v153;
                      v152 = v199;
                      uint64_t v48 = v157;
                      double v36 = v154;
                    }
                    while ([v199 count] > v153);
                  }
                }
                uint64_t v63 = v193;
                if ([(TypistKeyboard *)v36 fastTyping]
                  || ([(__CFString *)v191 isEqualToString:@"🔤"] & 1) != 0
                  || ([(__CFString *)v191 isEqualToString:@"⇧"] & 1) != 0
                  || ([(__CFString *)v191 isEqualToString:@" "] & 1) != 0
                  || ([(__CFString *)v191 isEqualToString:@"⏎"] & 1) != 0)
                {
                  goto LABEL_138;
                }
                if (v189)
                {
                  [(TypistKeyboard *)v36 fastTyping];
                  double v44 = v186;
                  goto LABEL_140;
                }
                v166 = [v195 objectForKeyedSubscript:@"plane"];
                unint64_t v167 = [(TypistKeyboard *)v36 getShiftPlaneForDefaultPlane];
                int v168 = [v166 isEqualToString:v167];

                if (!v168)
                {
LABEL_138:
                  double v44 = v186;
                  if (((v189 | [(TypistKeyboard *)v36 fastTyping]) & 1) != 0
                    || ([v195 objectForKeyedSubscript:@"plane"],
                        v171 = objc_claimAutoreleasedReturnValue(),
                        char v172 = [v188 isEqualToString:v171],
                        v171,
                        (v172 & 1) != 0))
                  {
LABEL_140:
                    v207[0] = @"action";
                    v207[1] = @"time";
                    v208[0] = @"wait";
                    uint64_t v173 = [(TypistKeyboard *)v36 typeInterval];
                    v174 = [v173 stringValue];
                    v208[1] = v174;
                    v170 = [NSDictionary dictionaryWithObjects:v208 forKeys:v207 count:2];
                  }
                  else
                  {
                    v209[0] = @"action";
                    v209[1] = @"plane";
                    v210[0] = @"waitfor";
                    v210[1] = v188;
                    v170 = [NSDictionary dictionaryWithObjects:v210 forKeys:v209 count:2];
                  }
                }
                else
                {
                  v211[0] = @"action";
                  v211[1] = @"plane";
                  v212[0] = @"waitfor";
                  v169 = [(TypistKeyboard *)v36 defaultPlaneName];
                  v212[1] = v169;
                  v170 = [NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:2];

                  double v44 = v186;
                }
                [(__CFString *)v48 addObject:v170];

                v205[0] = @"keystroke";
                v205[1] = @"actions";
                v206[0] = v44;
                v206[1] = v48;
                v175 = [NSDictionary dictionaryWithObjects:v206 forKeys:v205 count:2];
                [v180 addObject:v175];

                uint64_t v64 = obj;
                v39 = v184;
                double v62 = v191;
                double v88 = v195;
LABEL_143:

                int v194 = 0;
                unint64_t v6 = v188;
                goto LABEL_144;
              }
            }
            else
            {
              double v44 = v186;
            }
LABEL_88:
            [(__CFString *)v190 addObjectsFromArray:v71];
            v215[1] = @"plane";
            v216[0] = @"waitfor";
            v215[0] = @"action";
            v93 = [v195 objectForKeyedSubscript:@"plane"];
            v216[1] = v93;
            v94 = [*(id *)(v37 + 2352) dictionaryWithObjects:v216 forKeys:v215 count:2];
            [(__CFString *)v190 addObject:v94];

            [(TypistKeyboard *)v36 setIsCapsLockedState:0];
            uint64_t v69 = v71;
LABEL_89:

            goto LABEL_90;
          }
        }
        goto LABEL_88;
      }
      double v62 = v33;
      int v194 = 1;
      uint64_t v48 = v178;
      v178 = v62;
      uint64_t v63 = v193;
      unint64_t v6 = v196;
      uint64_t v64 = obj;
LABEL_144:

      unint64_t v13 = v63 + 1;
      if (v13 >= [v5 length]) {
        goto LABEL_147;
      }
    }
  }
  v178 = &stru_270C5A038;
LABEL_147:

LABEL_148:
  return v180;
}

- (CGAffineTransform)_determineTransformationInFrame:(SEL)a3 segmentStart:(CGRect)a4 totalSegmentWidth:(double)a5 scale:(unint64_t)a6 characterHeight:(double)a7 characterWidth:(double)a8 dimensions:(double)a9 isLatex:(id)a10
{
  BOOL v11 = a11;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a10;
  [v21 rotationBias];
  if (v22 == 0.0) {
    double v22 = 0.0;
  }
  double v50 = v22;
  uint64_t v23 = [v21 primaryWritingDirection];
  uint64_t v24 = [v21 segmentWritingDirection];
  uint64_t v25 = MEMORY[0x263F000D0];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v26;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v25 + 32);
  if (v23 == 2) {
    double v27 = width;
  }
  else {
    double v27 = -0.0;
  }
  int64_t v28 = +[TypistKeyboardUtilities getUIInterfaceOrientation];
  uint64_t v29 = +[TypistKeyboardUtilities getOneHandedKeyboardHandBias];
  if ([v29 caseInsensitiveCompare:@"Right"]) {
    BOOL v30 = 0;
  }
  else {
    BOOL v30 = v28 == 1;
  }
  if (v30)
  {
    +[TypistKeyboardUtilities findKeyBoundsInKeyboard:@"Candidate-Selection"];
    if (v23 == 2) {
      double v27 = width;
    }
    else {
      double v27 = v31;
    }
  }
  double v32 = x + v27;
  [v21 writingOriginOffsetX];
  double v34 = v33;
  [v21 writingOriginOffsetY];
  double v35 = v32 - v34 * a7;
  double v37 = y + v36 * a7;
  if (v23 != 2 || v24 != 2)
  {
    double v35 = v32 + v34 * a7;
    double y = v37;
  }
  double v38 = -(height + -a8 * a7);
  if (height - a8 * a7 >= 0.0) {
    double v38 = height - a8 * a7;
  }
  double v39 = v35 + a5;
  if (v24 == 2) {
    double v39 = v35 + a5 + (double)a6;
  }
  double v40 = v35 - a5;
  if (v24 != 2) {
    double v40 = v40 - (double)a6;
  }
  double v41 = v38 * 0.5;
  if (v23 == 2) {
    double v42 = v40;
  }
  else {
    double v42 = v39;
  }
  if (v11) {
    double v43 = -0.0;
  }
  else {
    double v43 = v38 * 0.5;
  }
  GSMainScreenPointSize();
  switch(v28)
  {
    case 2:
      double v46 = v44 - v42;
      double v42 = v45 - y - v41;
      double v47 = 180.0;
      break;
    case 3:
      double v46 = v44 - y - v41;
      double v47 = 90.0;
      break;
    case 4:
      double v46 = v41 + y;
      double v42 = v45 - v42;
      double v47 = 270.0;
      break;
    default:
      double v46 = v42;
      double v42 = y + v43;
      double v48 = v50;
      goto LABEL_36;
  }
  double v48 = v50 + v47;
LABEL_36:
  CGAffineTransformMakeRotation(&t1, v48 * 3.14159265 / 180.0);
  t2.a = a7;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.d = a7;
  t2.tdouble x = v46;
  t2.tdouble y = v42;
  CGAffineTransformConcat(retstr, &t1, &t2);

  return result;
}

- (CGRect)_determineHandwritingBound
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5
{
  return -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", a3, a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0.0);
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6
{
  return -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", a3, a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6);
}

- (id)_convertCollationCharacters:(id)a3
{
  double v3 = NSString;
  id v4 = a3;
  double v5 = objc_msgSend(v3, "stringWithFormat:", @"%C", 65010);
  unint64_t v6 = [v4 stringByReplacingOccurrencesOfString:@"الله" withString:v5];

  return v6;
}

- (id)_dimensionsForLatex:(id)a3 formula:(id)a4 withPathMap:(id)a5 regionCode:(id)a6 isCursive:(BOOL)a7 cumulativeWidth:(unint64_t)a8 totalWidth:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12
{
  unint64_t v16 = a10;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a12;
  id v21 = objc_opt_new();
  [v17 offsetY];
  double v23 = v22;
  uint64_t v24 = [v18 allKeys];
  if ([v24 count])
  {
    uint64_t v25 = [MEMORY[0x263F08708] charactersRequiringExtentionCharacterSet];
    long long v26 = [v24 objectAtIndex:0];
    unsigned int v27 = objc_msgSend(v25, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0));

    int64_t v28 = [v24 objectAtIndex:0];
    uint64_t v52 = [v18 objectForKey:v28];

    uint64_t v54 = v24;
    [v24 objectAtIndex:0];
    if (a7) {
      uint64_t v29 = {;
    }
      +[TypistPathUtilities getTextClustersFrom:v19 forCharacters:v29];
    }
    else {
      uint64_t v29 = {;
    }
      [v29 graphemeArray];
    double v32 = };
    unsigned int v53 = v27;
    id v55 = v18;
    id v56 = v17;

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      unint64_t v31 = 0;
      uint64_t v36 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v59 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          double v45 = [v19 objectForKeyedSubscript:v38];
          if (v45)
          {
            [v20 addObject:v45];
            if ([v45 width] >= 1)
            {
              [v45 perCharacterScale];
              if (v46 > 0.0)
              {
                double v47 = (double)[v45 width];
                [v45 perCharacterScale];
                unint64_t v49 = llround(v48 * v47);
                v31 += v49;
                a8 += v49;
              }
            }
          }
          else
          {
            TYLogl(OS_LOG_TYPE_ERROR, @"No path data found for character: [%@]", v39, v40, v41, v42, v43, v44, v38);
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v35);
    }
    else
    {
      unint64_t v31 = 0;
    }

    id v21 = (void *)v52;
    id v18 = v55;
    id v17 = v56;
    uint64_t v24 = v54;
    unint64_t v16 = a10;
    uint64_t v30 = v53;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v31 = 0;
  }
  double v50 = objc_alloc_init(TYHandwritingDimensions);
  [(TYHandwritingDimensions *)v50 setWritingOriginOffsetX:0.0];
  [(TYHandwritingDimensions *)v50 setWritingOriginOffsetY:0.0];
  [(TYHandwritingDimensions *)v50 setTotalWidth:(double)a9];
  [(TYHandwritingDimensions *)v50 setCumulativeWidth:(double)a8];
  [(TYHandwritingDimensions *)v50 setSegmentWidth:(double)v31];
  [(TYHandwritingDimensions *)v50 setFixedScaleHeight:1024.0];
  [(TYHandwritingDimensions *)v50 setRotationBias:a11];
  [v21 rectValue];
  -[TYHandwritingDimensions setRect:](v50, "setRect:");
  [(TYHandwritingDimensions *)v50 setPrimaryWritingDirection:v16];
  [(TYHandwritingDimensions *)v50 setSegmentWritingDirection:1];
  [(TYHandwritingDimensions *)v50 setOffsetY:v23];
  [(TYHandwritingDimensions *)v50 setRequiresExtension:v30];

  return v50;
}

- (id)_dimensionsForText:(id)a3 withPathMap:(id)a4 regionCode:(id)a5 isCursive:(BOOL)a6 cumulativeWidth:(unint64_t *)a7 totalWidth:(unint64_t)a8 segmentTextDirection:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a12;
  uint64_t v44 = v19;
  if (a6) {
    +[TypistPathUtilities getTextClustersFrom:v17 withRegion:v19];
  }
  else {
    [v17 graphemeArray];
  }
  double v45 = v17;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0;
    uint64_t v25 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v34 = [v18 objectForKeyedSubscript:v27];
        if (v34)
        {
          [v20 addObject:v34];
          if ([v34 width] >= 1)
          {
            [v34 perCharacterScale];
            if (v35 > 0.0)
            {
              double v36 = (double)[v34 width];
              [v34 perCharacterScale];
              unint64_t v38 = llround(v37 * v36);
              *a7 += v38;
              v24 += v38;
            }
          }
        }
        else
        {
          TYLogl(OS_LOG_TYPE_ERROR, @"No path data found for character: [%@]", v28, v29, v30, v31, v32, v33, v27);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v23);
  }
  else
  {
    unint64_t v24 = 0;
  }

  double v39 = 0.0;
  if (a9 == 2)
  {
    +[TypistPathUtilities getWidthOfFirstCharacterInString:v45];
    double v39 = v40;
  }
  uint64_t v41 = objc_alloc_init(TYHandwritingDimensions);
  [(TYHandwritingDimensions *)v41 setWritingOriginOffsetX:v39];
  [(TYHandwritingDimensions *)v41 setWritingOriginOffsetY:0.0];
  [(TYHandwritingDimensions *)v41 setTotalWidth:(double)a8];
  [(TYHandwritingDimensions *)v41 setCumulativeWidth:(double)*a7];
  [(TYHandwritingDimensions *)v41 setSegmentWidth:(double)v24];
  [(TYHandwritingDimensions *)v41 setFixedScaleHeight:1024.0];
  [(TYHandwritingDimensions *)v41 setRotationBias:a11];
  [(TYHandwritingDimensions *)v41 setPrimaryWritingDirection:a10];
  [(TYHandwritingDimensions *)v41 setSegmentWritingDirection:a9];

  return v41;
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6 isCursive:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  BOOL v105 = a5;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v12 = a3;
  unint64_t v13 = (void *)[v12 copy];
  uint64_t v14 = [MEMORY[0x263F14BF0] sharedSettings];
  int v15 = [v14 isScribbleActive];

  if (v15)
  {
    unint64_t v16 = [MEMORY[0x263F14BF0] sharedSettings];
    id v17 = [v16 currentLanguageIdentifier];

    id v18 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v17];
    v107 = [v18 countryCode];
    if (!v107)
    {
      v107 = [v18 scriptCode];
      if (!v107)
      {
        v107 = [v18 languageCode];
      }
    }
  }
  else
  {
    id v17 = [(TypistKeyboard *)self keyboardID];
    v107 = +[TypistKeyboardUtilities getRegionCodeFromKeyboardID:v17];
  }

  id v19 = [MEMORY[0x263F08708] arabicGenericCharacters];
  uint64_t v20 = [v13 rangeOfCharacterFromSet:v19];

  id v21 = [MEMORY[0x263F08708] arabicPresentationFormCharacters];
  uint64_t v22 = [v13 rangeOfCharacterFromSet:v21];

  if (v20 != 0x7FFFFFFFFFFFFFFFLL || v22 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = [(TypistKeyboard *)self _convertCollationCharacters:v13];

    unint64_t v13 = [v23 stringByConvertingArabicCharactersToPresentationForms];

    BOOL v7 = 1;
  }
  unint64_t v24 = [[TYParsedScribbleData alloc] initWithText:v13 regionCode:v107 isCursive:v7];
  uint64_t v25 = [(TYParsedScribbleData *)v24 pathMap];

  if (v25)
  {
    BOOL v101 = v7;
    uint64_t v102 = self;
    uint64_t v32 = @"handwriting";
    if (v105) {
      uint64_t v32 = @"stylus";
    }
    id v90 = v12;
    TYLogl(OS_LOG_TYPE_DEBUG, @"Generating %@ stream for input: [%@]", v26, v27, v28, v29, v30, v31, (char)v32);
    uint64_t v33 = [(TYParsedScribbleData *)v24 convertedString];
    unint64_t v89 = v13;
    char v34 = [v13 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
      double v35 = [(TYParsedScribbleData *)v24 convertedString];
      TYLog(@"Text after conversion [%@]", v36, v37, v38, v39, v40, v41, v42, (char)v35);
    }
    uint64_t v121 = 0;
    id v106 = (id)objc_opt_new();
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obj = [(TYParsedScribbleData *)v24 parsedData];
    uint64_t v93 = [obj countByEnumeratingWithState:&v117 objects:v124 count:16];
    if (v93)
    {
      unint64_t v43 = 0;
      uint64_t v92 = *(void *)v118;
      uint64_t v100 = v24;
      do
      {
        for (uint64_t i = 0; i != v93; ++i)
        {
          if (*(void *)v118 != v92) {
            objc_enumerationMutation(obj);
          }
          double v45 = *(void **)(*((void *)&v117 + 1) + 8 * i);
          if ([v45 isLatexString])
          {
            if (v43 <= 1) {
              unint64_t v43 = 1;
            }
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            id v96 = [v45 latexFormulaBoundingBoxes];
            uint64_t v46 = [v96 countByEnumeratingWithState:&v113 objects:v123 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v94 = i;
              long long v48 = 0;
              uint64_t v98 = *(void *)v114;
              do
              {
                uint64_t v49 = 0;
                double v50 = v48;
                do
                {
                  if (*(void *)v114 != v98) {
                    objc_enumerationMutation(v96);
                  }
                  uint64_t v51 = *(void *)(*((void *)&v113 + 1) + 8 * v49);
                  uint64_t v52 = [MEMORY[0x263EFF980] array];
                  unsigned int v53 = [(TYParsedScribbleData *)v24 pathMap];
                  long long v48 = [(TypistKeyboard *)v102 _dimensionsForLatex:v45 formula:v51 withPathMap:v53 regionCode:v107 isCursive:v101 cumulativeWidth:v121 totalWidth:a6 primaryTextDirection:[(TYParsedScribbleData *)v24 totalWidth] rotationBias:v43 characterByCharacterPaths:v52];

                  [v45 boundingSize];
                  double v55 = height / v54;
                  [v45 boundingSize];
                  double v57 = width / v56;
                  if (v55 >= v57) {
                    double v55 = v57;
                  }
                  [v45 offsetY];
                  CGFloat v59 = -(v58 * v55);
                  [v48 rect];
                  v112.b = 0.0;
                  v112.c = 0.0;
                  v112.a = v55;
                  v112.d = v55;
                  v112.tdouble x = 0.0;
                  v112.tdouble y = v59;
                  CGRect v128 = CGRectApplyAffineTransform(v127, &v112);
                  double v60 = v128.size.width;
                  double v61 = v128.size.height;
                  double v62 = x + v128.origin.x;
                  double v63 = y + v128.origin.y;
                  [v45 boundingSize];
                  double v65 = v64;
                  [v48 totalWidth];
                  double v67 = v65 / v66;
                  [v45 boundingSize];
                  double v69 = v68 * 0.0009765625;
                  if (v67 < v68 * 0.0009765625) {
                    double v69 = v67;
                  }
                  [v48 setBoundingBoxScale:v69];
                  unint64_t v24 = v100;
                  v70 = -[TypistKeyboard _generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:](v102, "_generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:", v52, v105, v48, 1, v62, v63, v60, v61);
                  [v106 addObjectsFromArray:v70];

                  ++v49;
                  double v50 = v48;
                }
                while (v47 != v49);
                uint64_t v47 = [v96 countByEnumeratingWithState:&v113 objects:v123 count:16];
              }
              while (v47);

              uint64_t i = v94;
            }

            [v45 boundingSize];
            double v72 = 1024.0 / v71;
            [v45 boundingSize];
            v121 += llround(v73 * v72);
          }
          else
          {
            uint64_t v95 = i;
            uint64_t v74 = [v45 annotatedTextDirections];
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            id v97 = v74;
            uint64_t v75 = [v74 countByEnumeratingWithState:&v108 objects:v122 count:16];
            if (v75)
            {
              uint64_t v76 = v75;
              uint64_t v99 = *(void *)v109;
              do
              {
                for (uint64_t j = 0; j != v76; ++j)
                {
                  if (*(void *)v109 != v99) {
                    objc_enumerationMutation(v97);
                  }
                  double v78 = *(void **)(*((void *)&v108 + 1) + 8 * j);
                  char v79 = [MEMORY[0x263EFF980] array];
                  if (!v43) {
                    unint64_t v43 = [v78 textDirection];
                  }
                  [v78 range];
                  if (v80)
                  {
                    uint64_t v81 = [v45 string];
                    uint64_t v82 = [v78 range];
                    uint64_t v84 = objc_msgSend(v81, "substringWithRange:", v82, v83);

                    uint64_t v85 = [(TYParsedScribbleData *)v24 pathMap];
                    uint64_t v86 = -[TypistKeyboard _dimensionsForText:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:segmentTextDirection:primaryTextDirection:rotationBias:characterByCharacterPaths:](v102, "_dimensionsForText:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:segmentTextDirection:primaryTextDirection:rotationBias:characterByCharacterPaths:", v84, v85, v107, v101, &v121, -[TYParsedScribbleData totalWidth](v24, "totalWidth"), a6, [v78 textDirection], v43, v79);

                    uint64_t v87 = -[TypistKeyboard _generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:](v102, "_generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:", v79, v105, v86, 0, x, y, width, height);
                    [v106 addObjectsFromArray:v87];

                    unint64_t v24 = v100;
                  }
                }
                uint64_t v76 = [v97 countByEnumeratingWithState:&v108 objects:v122 count:16];
              }
              while (v76);
            }

            uint64_t i = v95;
          }
        }
        uint64_t v93 = [obj countByEnumeratingWithState:&v117 objects:v124 count:16];
      }
      while (v93);
    }

    unint64_t v13 = v89;
    id v12 = v90;
  }
  else
  {
    id v106 = 0;
  }

  return v106;
}

- (id)_generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 dimensions:(id)a6 isLatex:(BOOL)a7
{
  BOOL v55 = a7;
  BOOL v8 = a5;
  double y = a4.origin.y;
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v59 = a6;
  double v65 = self;
  if ((-[TypistKeyboard isHandwriting](self, "isHandwriting") || v8) && [v12 count])
  {
    unint64_t v13 = NSNumber;
    double v14 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate];
    *(float *)&double v14 = v14;
    double v63 = [v13 numberWithFloat:v14];
    id v64 = (id)objc_opt_new();
    -[TypistKeyboard _getScaleInFrame:isPencil:dimensions:](self, "_getScaleInFrame:isPencil:dimensions:", v8, v59, x, y, width, height);
    double v16 = v15;
    [v59 cumulativeWidth];
    double v18 = v17;
    [v59 segmentWidth];
    double v20 = v19;
    uint64_t v21 = [v59 primaryWritingDirection];
    uint64_t v22 = [v59 segmentWritingDirection];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v51 = v12;
    id obj = v12;
    uint64_t v58 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
    if (v58)
    {
      uint64_t v23 = 1;
      if (v21 != v22) {
        uint64_t v23 = -1;
      }
      double v24 = v16 * v18 - v16 * v20;
      unint64_t v54 = (unint64_t)(v16 * v20);
      uint64_t v53 = *(void *)v74;
      if (v8) {
        uint64_t v25 = @"st";
      }
      else {
        uint64_t v25 = @"mt";
      }
      double v62 = v25;
      double v26 = (double)v23;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v74 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = v27;
          uint64_t v28 = *(void **)(*((void *)&v73 + 1) + 8 * v27);
          [v28 perCharacterScale];
          double v30 = v16 * v29;
          double v31 = (double)[v28 height];
          double v32 = (double)[v28 width];
          memset(&v72, 0, sizeof(v72));
          -[TypistKeyboard _determineTransformationInFrame:segmentStart:totalSegmentWidth:scale:characterHeight:characterWidth:dimensions:isLatex:](v65, "_determineTransformationInFrame:segmentStart:totalSegmentWidth:scale:characterHeight:characterWidth:dimensions:isLatex:", v54, v59, v55, x, y, width, height, v24, v30, v31, v32);
          if (v55 && [v59 requiresExtension])
          {
            CGAffineTransform v70 = v72;
            CGAffineTransformScale(&v71, &v70, width / (v30 * v32), 1.0);
            CGAffineTransform v72 = v71;
          }
          uint64_t v33 = [v28 strokeArray];
          CGAffineTransform v71 = v72;
          char v34 = +[TypistPathUtilities convertSVGPaths:v33 withTransformation:&v71];

          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v61 = v34;
          uint64_t v35 = [v61 countByEnumeratingWithState:&v66 objects:v86 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v67 != v37) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v39 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                if ([v39 count])
                {
                  v84[0] = @"ALPHA";
                  LODWORD(v40) = 0.5;
                  uint64_t v41 = [NSNumber numberWithFloat:v40];
                  v85[0] = v41;
                  v85[1] = v63;
                  v84[1] = @"CPPATHGEN_TIME_INTERVAL";
                  v84[2] = @"CPPATHGEN_TIMING_ALGORITHM";
                  v84[3] = @"CPPATHGEN_VELOCITY";
                  v85[2] = @"ANGULAR";
                  v85[3] = &unk_270C6FD10;
                  uint64_t v42 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:4];
                  unint64_t v43 = +[TypistPathUtilities generatePathArgumentStringWithParameters:v42 fromPoints:v39];

                  uint64_t v82 = @"actions";
                  v79[0] = @"action";
                  v79[1] = @"argumentList";
                  v80[0] = v62;
                  v80[1] = v43;
                  uint64_t v44 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
                  v81[0] = v44;
                  v77[0] = @"action";
                  v77[1] = @"time";
                  v78[0] = @"wait";
                  double v45 = [(TypistKeyboard *)v65 typeInterval];
                  uint64_t v46 = [v45 stringValue];
                  v78[1] = v46;
                  uint64_t v47 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
                  v81[1] = v47;
                  long long v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
                  uint64_t v83 = v48;
                  uint64_t v49 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
                  [v64 addObject:v49];
                }
              }
              uint64_t v36 = [v61 countByEnumeratingWithState:&v66 objects:v86 count:16];
            }
            while (v36);
          }
          double v24 = v24 + v26 * v32 * v30;

          uint64_t v27 = v60 + 1;
        }
        while (v60 + 1 != v58);
        uint64_t v58 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
      }
      while (v58);
    }

    id v12 = v51;
  }
  else
  {
    id v64 = 0;
  }

  return v64;
}

- (double)_getScaleInFrame:(CGRect)a3 isPencil:(BOOL)a4 dimensions:(id)a5
{
  BOOL v5 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  uint64_t v39 = 0;
  double v40 = (double *)&v39;
  uint64_t v41 = 0x3010000000;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v42 = &unk_26042309E;
  uint64_t v33 = 0;
  char v34 = (double *)&v33;
  uint64_t v35 = 0x4010000000;
  uint64_t v36 = &unk_26042309E;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__1;
  double v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__TypistKeyboard__getScaleInFrame_isPencil_dimensions___block_invoke;
  v22[3] = &unk_265559818;
  *(CGFloat *)&v22[8] = x;
  *(CGFloat *)&v22[9] = y;
  *(CGFloat *)&v22[10] = width;
  *(CGFloat *)&v22[11] = height;
  v22[4] = &v39;
  void v22[5] = &v33;
  v22[6] = &v27;
  v22[7] = &v23;
  +[TypistKeyboardUtilities runOnMainThread:v22];
  if ([(id)v28[5] caseInsensitiveCompare:@"Left"]
    && [(id)v28[5] caseInsensitiveCompare:@"Right"])
  {
    BOOL v11 = v40;
  }
  else
  {
    BOOL v11 = v40;
    if (v24[3] == 1)
    {
      v40[4] = v34[6];
      v11[5] = height;
    }
  }
  double v12 = v11[4];
  [v10 totalWidth];
  double v14 = v13;
  double v15 = v40[5];
  if (v5)
  {
    [v10 fixedScaleHeight];
    double v17 = v15 / v16;
  }
  else
  {
    double v18 = v34[7];
    [v10 fixedScaleHeight];
    double v17 = (v15 - v18) / v19;
  }
  if (v12 / v14 >= v17) {
    double v20 = v17;
  }
  else {
    double v20 = v12 / v14;
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v20;
}

int64_t __55__TypistKeyboard__getScaleInFrame_isPencil_dimensions___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *(_OWORD *)(a1 + 80);
  +[TypistKeyboardUtilities findKeyBoundsInKeyboard:@"Candidate-Selection"];
  double v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  uint64_t v7 = +[TypistKeyboardUtilities getOneHandedKeyboardHandBias];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  int64_t result = +[TypistKeyboardUtilities getUIInterfaceOrientation];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)generatePencilGestureStream:(int)a3 gestureStyle:(int)a4 inFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v69[2] = *MEMORY[0x263EF8340];
  double v12 = NSNumber;
  double v13 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate];
  *(float *)&double v13 = v13;
  uint64_t v21 = [v12 numberWithFloat:v13];
  double v22 = y + height * 0.5;
  if (a3 == 3 && !a4)
  {
    double v23 = x + width;
    double v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v23, v22);
    v69[0] = v24;
    uint64_t v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v23, v22 + 1.0);
    v69[1] = v25;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];

    uint64_t v27 = NSNumber;
    double v28 = 1.0
        / (double)+[TypistKeyboardUtilities touchScanRate]
        * 100.0;
    *(float *)&double v28 = v28;
    uint64_t v29 = [v27 numberWithFloat:v28];

    uint64_t v21 = (void *)v29;
LABEL_17:
    v64[0] = @"ALPHA";
    LODWORD(v30) = 0.5;
    uint64_t v46 = [NSNumber numberWithFloat:v30];
    v65[0] = v46;
    v65[1] = v21;
    v64[1] = @"CPPATHGEN_TIME_INTERVAL";
    v64[2] = @"CPPATHGEN_TIMING_ALGORITHM";
    v64[3] = @"CPPATHGEN_VELOCITY";
    v65[2] = @"ANGULAR";
    v65[3] = &unk_270C6FD10;
    uint64_t v47 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
    long long v48 = +[TypistPathUtilities generatePathArgumentStringWithParameters:v47 fromPoints:v26];

    uint64_t v49 = objc_opt_new();
    double v62 = @"actions";
    v59[0] = @"action";
    v59[1] = @"argumentList";
    v60[0] = @"st";
    v60[1] = v48;
    double v50 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
    v61[0] = v50;
    v57[0] = @"action";
    v57[1] = @"time";
    v58[0] = @"wait";
    id v51 = [(TypistKeyboard *)self typeInterval];
    uint64_t v52 = [v51 stringValue];
    v58[1] = v52;
    uint64_t v53 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    v61[1] = v53;
    unint64_t v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
    double v63 = v54;
    BOOL v55 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    [v49 addObject:v55];

    goto LABEL_18;
  }
  if (a3 == 1 && !a4)
  {
    +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", x + width, v22, height * 0.25);
    double v32 = v31;
    double v34 = v33;
    +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:");
    double v36 = v35;
    double v38 = v37;
    uint64_t v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, v22);
    v68[0] = v39;
    double v40 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v32, v34);
    v68[1] = v40;
    uint64_t v41 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, v22);
    v68[2] = v41;
    uint64_t v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v36, v38);
    v68[3] = v42;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];

LABEL_16:
    goto LABEL_17;
  }
  if (a3 == 1 && a4 == 1)
  {
    uint64_t v26 = +[TypistPathUtilities convertCurveDeleteTouchPoints:endPoint:curveHeight:curveDensity:tilt:](TypistPathUtilities, "convertCurveDeleteTouchPoints:endPoint:curveHeight:curveDensity:tilt:", 10, x, v22, x + width, v22, height, -1.5);
    goto LABEL_17;
  }
  if (!(a4 | a3))
  {
    uint64_t v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, v22);
    v67[0] = v39;
    double v40 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x + width + -1.0, v22);
    v67[1] = v40;
    uint64_t v44 = (void *)MEMORY[0x263EFF8C0];
    double v45 = v67;
    goto LABEL_15;
  }
  if (a3 == 2 && !a4)
  {
    double v43 = x + width;
    uint64_t v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v43, v22);
    v66[0] = v39;
    double v40 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v43, height + v22);
    v66[1] = v40;
    uint64_t v44 = (void *)MEMORY[0x263EFF8C0];
    double v45 = v66;
LABEL_15:
    uint64_t v26 = [v44 arrayWithObjects:v45 count:2];
    goto LABEL_16;
  }
  TYLog(@"Gesture %u is not supported", v14, v15, v16, v17, v18, v19, v20, a3);
  uint64_t v49 = 0;
LABEL_18:

  return v49;
}

- (id)getActionForKeystroke:(id)a3 fromKeyPlane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TypistKeyboard *)self keyPlanes];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if ([(TypistKeyboard *)self prefersPopoverKeys]) {
    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_7;
  }
  BOOL v11 = [v10 objectForKeyedSubscript:@"type"];
  int v12 = [v11 isEqualToString:@"popover"];

  if (!v12) {
    goto LABEL_7;
  }
  double v13 = [(TypistKeyboard *)self findKeyInOtherPlanes:v6 currentPlane:v7];
  if (!v13) {
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  uint64_t v15 = [v13 objectForKeyedSubscript:@"type"];
  char v16 = [v15 isEqualToString:@"basekey"];

  if (v16) {
    id v17 = 0;
  }
  else {
LABEL_7:
  }
    id v17 = v10;

  return v17;
}

- (id)findKeyOnAnyPlane:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(TypistKeyboard *)self keyPlanes];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int v12 = [(TypistKeyboard *)self keyPlanes];
        double v13 = [v12 objectForKeyedSubscript:v11];
        uint64_t v14 = [v13 objectForKeyedSubscript:v4];

        if (v14)
        {
          char v16 = [(TypistKeyboard *)self keyPlanes];
          id v17 = [v16 objectForKeyedSubscript:v11];
          uint64_t v15 = [v17 objectForKeyedSubscript:v4];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = [(TypistKeyboard *)self attemptToFindKeystrokeAsSecondaryDisplay:v4];
LABEL_11:

  return v15;
}

- (id)findKey:(id)a3 inPlane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TypistKeyboard *)self keyPlanes];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)findKeyOnCurrentPlane:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TypistKeyboardUtilities formattedKeyplaneName];
  id v6 = [(TypistKeyboard *)self findKey:v4 inPlane:v5];

  return v6;
}

- (id)_multiCharacterTrailForGrapheme:(id)a3
{
  return 0;
}

- (id)getPostfixKey:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)addAccentKeyAction:(id)a3
{
  return 0;
}

- (id)attemptToFindKeystrokeAsSecondaryDisplay:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    id v7 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v7 userInterfaceIdiom] != 1)
    {

      goto LABEL_17;
    }
    BOOL v8 = [(TypistKeyboard *)self isFloating];

    if (v8)
    {
LABEL_17:
      long long v22 = 0;
      goto LABEL_20;
    }
    uint64_t v9 = @"↓";
  }
  else
  {
    uint64_t v9 = @"⊎";
  }
  uint64_t v10 = [NSString stringWithFormat:@"%@%@", v9, v4];
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = (void *)v10;
  id v26 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v12 = [(TypistKeyboard *)self keyPlanes];
  double v13 = [v12 allKeys];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v19 = [(TypistKeyboard *)self keyPlanes];
        long long v20 = [v19 objectForKeyedSubscript:v18];
        long long v21 = [v20 objectForKeyedSubscript:v11];

        if (v21)
        {
          double v23 = [(TypistKeyboard *)self keyPlanes];
          uint64_t v24 = [v23 objectForKeyedSubscript:v18];
          long long v22 = [v24 objectForKeyedSubscript:v11];

          goto LABEL_19;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0;
LABEL_19:
  id v4 = v26;
LABEL_20:

  return v22;
}

- (id)tryAlternateVariationsOfKey:(id)a3
{
  return 0;
}

- (id)findKeyInOtherPlanes:(id)a3 currentPlane:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v8 = [(TypistKeyboard *)self keyPlanes];
  uint64_t v9 = [v8 allKeys];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      uint64_t v13 = 0;
      uint64_t v28 = v11;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        if (([v14 isEqualToString:v7] & 1) == 0)
        {
          uint64_t v15 = [(TypistKeyboard *)self keyPlanes];
          uint64_t v16 = [v15 objectForKeyedSubscript:v14];
          uint64_t v17 = [v16 objectForKeyedSubscript:v6];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            [(TypistKeyboard *)self switchToPlane:v14 fromPlane:v7];
            uint64_t v19 = v12;
            long long v20 = self;
            id v21 = v7;
            v23 = id v22 = v6;
            uint64_t v30 = [v23 count];

            id v6 = v22;
            id v7 = v21;
            self = v20;
            uint64_t v12 = v19;
            uint64_t v11 = v28;

            if (v30)
            {
              uint64_t v24 = [(TypistKeyboard *)self keyPlanes];
              uint64_t v25 = [v24 objectForKeyedSubscript:v14];
              id v26 = [v25 objectForKeyedSubscript:v6];

              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
  id v26 = 0;
LABEL_14:

  return v26;
}

- (id)_constructSwitchPath:(id)a3 toPlane:(id)a4 fromPlane:(id)a5
{
  v55[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v47 = (id)objc_opt_new();
  id v9 = v8;
  uint64_t v52 = [v7 allKeys];
  uint64_t v46 = v9;
  if ([v52 containsObject:v9])
  {
    id v48 = v7;
    id v51 = self;
    while (1)
    {
      uint64_t v10 = v9;
      uint64_t v11 = (void *)[v9 copy];
      id v9 = [v7 objectForKeyedSubscript:v9];

      uint64_t v12 = [(TypistKeyboard *)self planeSwitchTable];
      uint64_t v13 = [v12 objectForKeyedSubscript:v9];
      uint64_t v14 = [v13 objectForKeyedSubscript:v11];
      if (!v14) {
        goto LABEL_8;
      }
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [(TypistKeyboard *)self keyPlanes];
      uint64_t v17 = [v16 objectForKeyedSubscript:v9];
      if (!v17) {
        break;
      }
      double v50 = [(TypistKeyboard *)self keyPlanes];
      [v50 objectForKeyedSubscript:v9];
      uint64_t v18 = v53 = v11;
      uint64_t v19 = [(TypistKeyboard *)self planeSwitchTable];
      long long v20 = [v19 objectForKeyedSubscript:v9];
      [v20 objectForKeyedSubscript:v53];
      id v21 = v49 = v16;
      id v22 = [v18 objectForKeyedSubscript:v21];

      id v7 = v48;
      self = v51;

      uint64_t v11 = v53;
      if (!v22) {
        goto LABEL_9;
      }
      double v23 = [(TypistKeyboard *)v51 keyPlanes];
      uint64_t v24 = [v23 objectForKeyedSubscript:v9];
      uint64_t v25 = [(TypistKeyboard *)v51 planeSwitchTable];
      id v26 = [v25 objectForKeyedSubscript:v9];
      long long v27 = [v26 objectForKeyedSubscript:v53];
      uint64_t v28 = [v24 objectForKeyedSubscript:v27];
      [v47 insertObject:v28 atIndex:0];

      uint64_t v11 = v53;
      v54[0] = @"action";
      v54[1] = @"time";
      v55[0] = @"wait";
      long long v29 = [(TypistKeyboard *)v51 typeInterval];
      uint64_t v30 = [v29 stringValue];
      v55[1] = v30;
      long long v31 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
      [v47 insertObject:v31 atIndex:1];

      self = v51;
LABEL_10:

      if (([v52 containsObject:v9] & 1) == 0) {
        goto LABEL_11;
      }
    }

LABEL_8:
LABEL_9:
    long long v32 = [(TypistKeyboard *)self keyboardID];
    TYLogl(OS_LOG_TYPE_ERROR, @"%@: !!! Unable to find a valid switch path !!!", v33, v34, v35, v36, v37, v38, (char)v32);

    TYLogl(OS_LOG_TYPE_ERROR, @"self.keyPlanes[%@][self.planeSwitchTable[%@][%@]]", v39, v40, v41, v42, v43, v44, (char)v9);
    goto LABEL_10;
  }
LABEL_11:

  return v47;
}

- (id)switchToPlane:(id)a3 fromPlane:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    char v8 = [v6 isEqualToString:&stru_270C5A038];
    id v9 = (void *)MEMORY[0x263EFFA68];
    if (v7
      && (v8 & 1) == 0
      && ([v7 isEqualToString:&stru_270C5A038] & 1) == 0
      && ([v7 isEqualToString:v6] & 1) == 0)
    {
      uint64_t v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      [v11 addObject:v7];
      uint64_t v12 = objc_opt_new();
      if ([v11 count])
      {
        id v24 = v7;
        uint64_t v25 = self;
        while (1)
        {
          uint64_t v13 = objc_msgSend(v11, "objectAtIndex:", 0, v24);
          if ([v13 isEqualToString:v6]) {
            break;
          }
          [v11 removeObjectAtIndex:0];
          [v10 addObject:v13];
          uint64_t v14 = [(TypistKeyboard *)self planeSwitchTable];
          uint64_t v15 = [v14 objectForKeyedSubscript:v13];
          uint64_t v16 = [v15 allKeys];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v27 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                if (([v10 containsObject:v22] & 1) == 0)
                {
                  [v11 addObject:v22];
                  [v12 setObject:v13 forKeyedSubscript:v22];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
            }
            while (v19);
          }

          self = v25;
          if (![v11 count])
          {
            id v9 = 0;
            id v7 = v24;
            goto LABEL_26;
          }
        }
        id v7 = v24;
        id v9 = [(TypistKeyboard *)self _constructSwitchPath:v12 toPlane:v6 fromPlane:v24];
      }
      else
      {
        id v9 = 0;
      }
LABEL_26:
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (id)_sanitizedStringForAutoShiftCheck:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"🔤" withString:&stru_270C5A038];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"⇧" withString:&stru_270C5A038];

  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"⇪" withString:&stru_270C5A038];

  return v5;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v13 objectForKeyedSubscript:@"key"];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"more-after"];

  if (v10 | v15
    || ([v14 isEqualToString:@" "] & 1) != 0
    || [v14 isEqualToString:@"⏎"])
  {
    uint64_t v16 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyplaneDescription:v11];
    int v17 = [v16 usesAutoShift];
    int v18 = [v16 isAlphabeticPlane];
    if (v18 && !v17
      || !+[TypistKeyboardUtilities getAutoCapitalizationPrefSetting])
    {
      BOOL v23 = 0;
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v19 = [&stru_270C5A038 stringByPaddingToLength:2 withString:@" " startingAtIndex:0];
    uint64_t v20 = [MEMORY[0x263F1C920] mainScreen];
    [v20 _referenceBounds];
    double Height = CGRectGetHeight(v39);
    uint64_t v38 = (void *)v19;
    if (Height <= 1194.0)
    {
      char v22 = 0;
    }
    else
    {
      uint64_t v37 = [MEMORY[0x263F1C920] mainScreen];
      [v37 _referenceBounds];
      if (CGRectGetHeight(v40) > 1194.0 && [(TypistKeyboard *)self isFloating])
      {
        char v22 = 0;
        goto LABEL_14;
      }
      uint64_t v25 = [MEMORY[0x263F1C920] mainScreen];
      [v25 _referenceBounds];
      CGFloat v26 = CGRectGetHeight(v41);
      char v27 = v18 ^ 1;
      if (v26 <= 1194.0) {
        char v27 = 1;
      }
      if (v27)
      {
LABEL_25:

        goto LABEL_36;
      }
      uint64_t v36 = [(TypistKeyboard *)self defaultPlaneName];
      if (![v36 isEqualToString:v11]
        || [(TypistKeyboard *)self isCapsLockedState])
      {

        goto LABEL_25;
      }
      uint64_t v35 = v25;
      char v22 = 1;
    }
LABEL_14:
    if ([v14 isEqualToString:@" "])
    {
      if (([(id)v10 isEqualToString:@"."] & 1) != 0
        || ([(id)v10 isEqualToString:@"!"] & 1) != 0
        || ([(id)v10 isEqualToString:@"?"] & 1) != 0)
      {
        char v24 = 1;
        goto LABEL_31;
      }
      if ((unint64_t)[v12 length] > 1)
      {
        uint64_t v34 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v12, "length") - 2);
        char v24 = [v34 isEqualToString:v19];

        if ((v22 & 1) == 0) {
          goto LABEL_33;
        }
        long long v28 = v36;
LABEL_32:

LABEL_33:
        if (Height > 1194.0) {

        }
        if (v24) {
          goto LABEL_39;
        }
LABEL_36:
        if ((v18 & [v14 isEqualToString:@" "]) == 1
          && ([(TypistKeyboard *)self defaultPlaneName],
              long long v29 = objc_claimAutoreleasedReturnValue(),
              int v30 = [v29 isEqualToString:v11],
              v29,
              !v30)
          || ([v14 isEqualToString:@"⏎"] & 1) != 0)
        {
LABEL_39:
          BOOL v23 = 1;
          uint64_t v31 = v38;
LABEL_40:

          goto LABEL_41;
        }
        if ([v14 isEqualToString:@"🔤"])
        {
          uint64_t v31 = v38;
          if ((v18 & 1) == 0)
          {
LABEL_45:
            uint64_t v33 = [(TypistKeyboard *)self _sanitizedStringForAutoShiftCheck:v12];
            if ([v33 length]) {
              BOOL v23 = [(TypistKeyboard *)self isAutoshiftedToCapitalPlane:v33];
            }
            else {
              BOOL v23 = 1;
            }

            goto LABEL_40;
          }
        }
        else
        {
          uint64_t v31 = v38;
          if (((v18 | [v14 isEqualToString:@" "] ^ 1) & 1) == 0) {
            goto LABEL_45;
          }
        }
        BOOL v23 = 0;
        goto LABEL_40;
      }
    }
    char v24 = 0;
LABEL_31:
    long long v28 = v36;
    if ((v22 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  BOOL v23 = 0;
LABEL_42:

  return v23;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  id v4 = a3;
  if (v4
    && +[TypistKeyboardUtilities getAutoCapitalizationPrefSetting])
  {
    uint64_t v5 = (void *)MEMORY[0x263F08708];
    id v6 = [(TypistKeyboard *)self sentenceDelimitingCharacters];
    id v7 = [v5 characterSetWithCharactersInString:v6];
    uint64_t v8 = [v4 rangeOfCharacterFromSet:v7 options:4];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    unint64_t v10 = [(TypistKeyboard *)self autoshiftRegex];
    id v11 = objc_msgSend(v10, "firstMatchInString:options:range:", v4, 0, v9, objc_msgSend(v4, "length") - v9);

    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)getShiftedKeyPlaneName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TypistKeyboard *)self planeSwitchTable];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 allKeysForObject:@"⇧"];

  if (v7 && [v7 count])
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v8 = [(TypistKeyboard *)self defaultPlaneName];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)getAlternativeKeyPlaneName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TypistKeyboard *)self planeSwitchTable];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 allKeysForObject:@"🔤"];

  if (v7 && [v7 count])
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"⇧"])
  {
    if ([v8 isEqualToString:@"🔤"])
    {
      [(TypistKeyboard *)self setIsCapsLockedState:0];
      id v14 = [(TypistKeyboard *)self getAlternativeKeyPlaneName:v9];
LABEL_34:
      unint64_t v10 = v14;
      goto LABEL_35;
    }
    uint64_t v15 = [(TypistKeyboard *)self defaultPlaneName];
    uint64_t v16 = [(TypistKeyboard *)self getShiftedKeyPlaneName:v15];
    if ([v16 isEqualToString:v9])
    {
      BOOL v17 = [(TypistKeyboard *)self isCapsLockedState];

      if (!v17) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    int v18 = [(TypistKeyboard *)self getAlternatePlanesForDefaultPlane];
    char v19 = [v18 containsObject:v9];
    if ((v19 & 1) == 0)
    {
      uint64_t v20 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyplaneDescription:v9];
      if (([v20 ignoresShiftState] & 1) == 0)
      {

LABEL_32:
        id v14 = [(TypistKeyboard *)self defaultPlaneName];
        goto LABEL_34;
      }
      double v56 = v20;
    }
    int v21 = [v8 isEqualToString:@" "];
    if (v21)
    {
      id v4 = [(TypistKeyboard *)self keyPlanes];
      uint64_t v22 = [(TypistKeyboard *)self defaultPlaneName];
      BOOL v23 = [v4 objectForKeyedSubscript:v22];
      uint64_t v24 = [v23 objectForKeyedSubscript:@" "];
      double v57 = v23;
      uint64_t v58 = (void *)v22;
      if (v24)
      {
        int v59 = v21;
        id v61 = (void *)v24;
        uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
        [v5 _referenceBounds];
        if (CGRectGetHeight(v63) <= 1194.0)
        {
LABEL_21:

          char v26 = 1;
          char v27 = v61;
          goto LABEL_28;
        }
        uint64_t v25 = [MEMORY[0x263F1C920] mainScreen];
        [v25 _referenceBounds];
        if (CGRectGetHeight(v64) > 1194.0 && [(TypistKeyboard *)self isFloating])
        {

          goto LABEL_21;
        }
        uint64_t v52 = v25;
        char v28 = 1;
        int v21 = v59;
      }
      else
      {
        id v61 = 0;
        char v28 = 0;
      }
    }
    else
    {
      char v28 = 0;
    }
    if ([v8 isEqualToString:@"⏎"])
    {
      char v26 = 1;
      if ((v28 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
      int v60 = v21;
      unint64_t v54 = v5;
      BOOL v55 = v4;
      int v30 = [(TypistKeyboard *)self keyPlanes];
      uint64_t v31 = [v30 objectForKeyedSubscript:v9];
      long long v32 = [v31 objectForKeyedSubscript:v8];
      uint64_t v33 = [v32 objectForKeyedSubscript:@"more-after"];
      uint64_t v53 = v30;
      if ([v33 BOOLValue] & 1) != 0 || (objc_msgSend(v8, "isEqualToString:", @"'"))
      {
        char v26 = 1;
      }
      else
      {
        id v51 = [(TypistKeyboard *)self keyPlanes];
        double v50 = [v51 objectForKeyedSubscript:v9];
        uint64_t v49 = [v50 objectForKeyedSubscript:v8];
        uint64_t v34 = [v49 objectForKeyedSubscript:@"type"];
        if (v34)
        {
          id v48 = v34;
          id v47 = [(TypistKeyboard *)self keyPlanes];
          uint64_t v46 = [v47 objectForKeyedSubscript:v9];
          double v45 = [v46 objectForKeyedSubscript:v8];
          uint64_t v35 = [v45 objectForKeyedSubscript:@"basekey"];
          if (v35)
          {
            id v44 = v35;
            uint64_t v43 = [(TypistKeyboard *)self keyPlanes];
            uint64_t v42 = [v43 objectForKeyedSubscript:v9];
            CGRect v41 = [v42 objectForKeyedSubscript:v8];
            CGRect v40 = [v41 objectForKeyedSubscript:@"type"];
            if ([v40 isEqualToString:@"popover"])
            {
              CGRect v39 = [(TypistKeyboard *)self keyPlanes];
              uint64_t v38 = [v39 objectForKeyedSubscript:v9];
              uint64_t v37 = [v38 objectForKeyedSubscript:v8];
              uint64_t v36 = [v37 objectForKeyedSubscript:@"basekey"];
              char v26 = [v36 isEqualToString:@"'"];
            }
            else
            {
              char v26 = 0;
            }

            uint64_t v35 = v44;
          }
          else
          {
            char v26 = 0;
          }

          uint64_t v34 = v48;
        }
        else
        {
          char v26 = 0;
        }
      }
      uint64_t v5 = v54;
      id v4 = v55;
      int v21 = v60;
      if ((v28 & 1) == 0)
      {
LABEL_27:
        char v27 = v61;
        if (!v21) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }

    char v27 = v61;
    if ((v21 & 1) == 0)
    {
LABEL_29:
      if ((v19 & 1) == 0) {

      }
      if ((v26 & 1) == 0)
      {
        id v14 = v9;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
LABEL_28:

    goto LABEL_29;
  }
  unint64_t v10 = [(TypistKeyboard *)self getShiftedKeyPlaneName:v9];
  if ([(TypistKeyboard *)self isCapsLockedState])
  {
    id v11 = [(TypistKeyboard *)self defaultPlaneName];
    int v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      uint64_t v13 = [(TypistKeyboard *)self defaultPlaneName];

      unint64_t v10 = (void *)v13;
    }
  }
  [(TypistKeyboard *)self setIsCapsLockedState:0];
LABEL_35:

  return v10;
}

- (void)typeKeystrokeStream:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7 && [v7 count])
  {
    id v6 = +[TypistKeyboardUtilities convertRecapCommands:v7];
    +[TypistKeyboardUtilities launchRecap:v6 completion:v5];
  }
}

- (void)typeKeystrokeStream:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    if ([v3 count])
    {
      id v4 = +[TypistKeyboardUtilities convertRecapCommands:v5];
      +[TypistKeyboardUtilities launchRecap:v4];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)typeString:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 length])
  {
    id v7 = [NSString stringWithFormat:@"%@%@", @"⇧", @"⇧"];
    id v8 = [v10 stringByReplacingOccurrencesOfString:v7 withString:@"⇪"];
    if ([(TypistKeyboard *)self usePredictionBar]
      && +[TypistKeyboardUtilities getPredictivePrefSetting]&& ![(TypistKeyboard *)self usesMecabraCandidateBar])
    {
      id v9 = [(TypistKeyboard *)self generateKeystrokeStream:v8];
      [(TypistKeyboard *)self typeKeystrokeStreamWithPredictive:v9 originalText:v8 completion:v6];
    }
    else
    {
      id v9 = [(TypistKeyboard *)self generateKeystrokeStream:v8];
      [(TypistKeyboard *)self typeKeystrokeStream:v9 completion:v6];
    }
  }
}

- (void)typeString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(TypistKeyboard *)self hardwareKeyboard];

    if (v6)
    {
      [(TypistKeyboard *)self typeStringWithHardwareKeyboard:v5];
    }
    else
    {
      if ([(TypistKeyboard *)self fastTyping]) {
        +[TypistKeyboardUtilities setRecapFastMode:1];
      }
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __29__TypistKeyboard_typeString___block_invoke;
      v7[3] = &unk_265559650;
      v7[4] = self;
      [(TypistKeyboard *)self typeString:v5 completion:v7];
    }
  }
}

uint64_t __29__TypistKeyboard_typeString___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) fastTyping];
  if (result)
  {
    return +[TypistKeyboardUtilities setRecapFastMode:0];
  }
  return result;
}

- (void)typeString:(id)a3 withCommit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TypistKeyboard *)self candidatebar];
  if (v8
    && (uint64_t v15 = (void *)v8,
        BOOL v16 = [(TypistKeyboard *)self usesMecabraCandidateBar],
        v15,
        v16))
  {
    id v17 = objc_alloc_init(MEMORY[0x263F08958]);
    v27[0] = 0;
    v27[1] = v27;
    void v27[2] = 0x2020000000;
    char v28 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __40__TypistKeyboard_typeString_withCommit___block_invoke;
    v26[3] = &unk_265559710;
    v26[4] = v27;
    int v18 = (void (**)(void))MEMORY[0x261210570](v26);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__TypistKeyboard_typeString_withCommit___block_invoke_2;
    v22[3] = &unk_265559840;
    v22[4] = self;
    id v23 = v7;
    id v19 = v17;
    id v24 = v19;
    uint64_t v25 = v27;
    uint64_t v20 = (void *)MEMORY[0x261210570](v22);
    [(TypistKeyboard *)self typeString:v6 completion:v20];
    v18[2](v18);

    _Block_object_dispose(v27, 8);
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"ERROR: This function is for CJ based candidate bar only! Aborting.", v9, v10, v11, v12, v13, v14, v21);
  }
}

uint64_t __40__TypistKeyboard_typeString_withCommit___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    do
      uint64_t result = +[TypistKeyboardUtilities waitFor:0.02];
    while (!*(unsigned char *)(*(void *)(*(void *)(v1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __40__TypistKeyboard_typeString_withCommit___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) commitCandidate:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 48) tryLock];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v3 = *(void **)(a1 + 48);
    return [v3 unlock];
  }
  return result;
}

- (void)swipeString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v8 = v4;
    if ([v4 length])
    {
      id v5 = [NSString stringWithFormat:@"%@%@", @"⇧", @"⇧"];
      id v6 = [v8 stringByReplacingOccurrencesOfString:v5 withString:@"⇪"];
      id v7 = [(TypistKeyboard *)self generateSwipeStream:v6];
      [(TypistKeyboard *)self typeKeystrokeStream:v7 completion:0];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4
{
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 isCursive:(BOOL)a5
{
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5
{
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5 isCursive:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  if (v13)
  {
    id v15 = v13;
    if ([v13 length])
    {
      uint64_t v14 = -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", v15, 1, v6, x, y, width, height, a5);
      [(TypistKeyboard *)self typeKeystrokeStream:v14 completion:0];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)writePencilGesture:(int)a3 inStyle:(int)a4 inFrame:(CGRect)a5
{
  -[TypistKeyboard generatePencilGestureStream:gestureStyle:inFrame:](self, "generatePencilGestureStream:gestureStyle:inFrame:", *(void *)&a3, *(void *)&a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(TypistKeyboard *)self typeKeystrokeStream:v6 completion:0];
}

- (BOOL)usesMecabraCandidateBar
{
  return 0;
}

- (id)getAllCandidates
{
  id v3 = [(TypistKeyboard *)self candidatebar];

  if (v3)
  {
    id v4 = [(TypistKeyboard *)self candidatebar];
    id v5 = [v4 getAllCandidates];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)getVisibleCandidates
{
  id v3 = [(TypistKeyboard *)self candidatebar];

  if (v3)
  {
    id v4 = [(TypistKeyboard *)self candidatebar];
    id v5 = [v4 getVisibleCandidates];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (int64_t)commitCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TypistKeyboard *)self candidatebar];

  if (v5)
  {
    id v6 = [(TypistKeyboard *)self candidatebar];
    int64_t v7 = [v6 selectCandidate:v4];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)commitCandidateAtIndex:(int64_t)a3
{
  id v5 = [(TypistKeyboard *)self candidatebar];

  if (!v5) {
    return -1;
  }
  id v6 = [(TypistKeyboard *)self candidatebar];
  int64_t v7 = [v6 selectCandidateAtIndex:a3];

  return v7;
}

- (BOOL)hasCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TypistKeyboard *)self candidatebar];

  if (v5)
  {
    id v6 = [(TypistKeyboard *)self candidatebar];
    char v7 = [v6 hasCandidate:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(TypistKeyboard *)self candidatebar];

  if (v8)
  {
    uint64_t v9 = [(TypistKeyboard *)self candidatebar];
    char v10 = objc_msgSend(v9, "hasCandidate:inRange:", v7, location, length);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)hasCandidates:(id)a3
{
  id v4 = a3;
  id v5 = [(TypistKeyboard *)self candidatebar];

  if (v5)
  {
    id v6 = [(TypistKeyboard *)self candidatebar];
    char v7 = [v6 hasCandidates:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(TypistKeyboard *)self candidatebar];

  if (v8)
  {
    uint64_t v9 = [(TypistKeyboard *)self candidatebar];
    objc_msgSend(v9, "hasCandidates:inRange:", v7, location, length);
  }
  return 0;
}

- (id)splitKeystrokeStreamByWord:(id)a3 originalText:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v37 = [MEMORY[0x263EFF980] array];
  uint64_t v36 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263F089D8] string];
  uint64_t v8 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
  uint64_t v9 = [MEMORY[0x263F08708] punctuationCharacterSet];
  [v8 formUnionWithCharacterSet:v9];

  uint64_t v33 = v6;
  char v10 = [v6 componentsSeparatedByCharactersInSet:v8];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v35 = v11;
  [v11 removeObject:&stru_270C5A038];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  unint64_t v12 = 0x263F08000;
  unint64_t v13 = 0x263EFF000;
  uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        unint64_t v15 = v13;
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v17 = [v16 objectForKeyedSubscript:@"keystroke"];
        if ([v17 rangeOfCharacterFromSet:v8] == 0x7FFFFFFFFFFFFFFFLL)
        {
          int v18 = objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v17, "length") - 1);
          [v7 appendString:v18];

          [v36 addObject:v16];
          unint64_t v13 = v15;
        }
        else
        {
          if ([v7 length])
          {
            v49[0] = @"word";
            v48[0] = @"type";
            v48[1] = @"text";
            id v19 = NSString;
            uint64_t v20 = [v35 objectAtIndexedSubscript:0];
            char v21 = [v19 stringWithString:v20];
            v49[1] = v21;
            v48[2] = @"keystrokeStream";
            uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];
            v49[2] = v22;
            id v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
            [v37 addObject:v23];

            [v7 setString:&stru_270C5A038];
            [v36 removeAllObjects];
            [v35 removeObjectAtIndex:0];
          }
          v47[0] = @"separator";
          v46[0] = @"type";
          v46[1] = @"text";
          id v24 = [NSString stringWithString:v7];
          v47[1] = v24;
          v46[2] = @"keystrokeStream";
          uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObject:v16];
          v47[2] = v25;
          char v26 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
          [v37 addObject:v26];

          unint64_t v13 = 0x263EFF000uLL;
        }

        unint64_t v12 = 0x263F08000uLL;
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v39);
  }

  if ([v7 length] && objc_msgSend(v35, "count"))
  {
    v45[0] = @"separator";
    v44[0] = @"type";
    v44[1] = @"text";
    char v27 = *(void **)(v12 + 2880);
    char v28 = [v35 objectAtIndexedSubscript:0];
    long long v29 = [v27 stringWithString:v28];
    v45[1] = v29;
    v44[2] = @"keystrokeStream";
    int v30 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];
    v45[2] = v30;
    uint64_t v31 = [*(id *)(v13 + 2352) dictionaryWithObjects:v45 forKeys:v44 count:3];
    [v37 addObject:v31];
  }
  return v37;
}

- (void)typeKeystrokeStreamWithPredictive:(id)a3 originalText:(id)a4 completion:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(TypistKeyboard *)self candidatebar];
  if (!v10) {
    goto LABEL_4;
  }
  id v17 = (void *)v10;
  uint64_t v18 = [(TypistKeyboard *)self candidatebar];
  if (v18)
  {
    id v19 = (void *)v18;
    BOOL v20 = [(TypistKeyboard *)self usesMecabraCandidateBar];

    if (v20)
    {
LABEL_4:
      TYLogl(OS_LOG_TYPE_ERROR, @"ERROR: Predictive setting or QuickType bar is not enabled with the keyboard. Aborting.", v11, v12, v13, v14, v15, v16, v22);
      goto LABEL_7;
    }
  }
  else
  {
  }
  char v21 = [(TypistKeyboard *)self splitKeystrokeStreamByWord:v23 originalText:v8];
  [(TypistKeyboard *)self typeWordKeystrokeWithPredictive:v21 atIndex:0 completion:v9];

LABEL_7:
}

- (void)typeWordKeystrokeWithPredictive:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ([v8 count] && objc_msgSend(v8, "count") > (unint64_t)a4)
  {
    uint64_t v10 = [v8 objectAtIndexedSubscript:a4];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"type"];
    int v12 = [v11 isEqualToString:@"separator"];

    if (v12)
    {
      uint64_t v13 = [v10 objectForKeyedSubscript:@"keystrokeStream"];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke;
      v25[3] = &unk_265559868;
      v25[4] = self;
      id v26 = v8;
      int64_t v28 = a4;
      char v27 = v9;
      [(TypistKeyboard *)self typeKeystrokeStream:v13 completion:v25];

      uint64_t v14 = v26;
    }
    else
    {
      if ([(TypistKeyboard *)self usePredictionBar])
      {
        uint64_t v15 = [(TypistKeyboard *)self candidatebar];
        uint64_t v16 = [v10 objectForKeyedSubscript:@"text"];
        uint64_t v17 = [v15 getIndexOfCandidate:v16];

        if ((v17 & 0x8000000000000000) == 0)
        {
          uint64_t v18 = [(TypistKeyboard *)self candidatebar];
          [v18 selectCandidateAtIndex:v17];

          [(TypistKeyboard *)self typeWordKeystrokeWithPredictive:v8 atIndex:a4 + 1 completion:v9];
LABEL_12:

          goto LABEL_13;
        }
      }
      id v19 = [v10 objectForKeyedSubscript:@"keystrokeStream"];
      BOOL v20 = [v10 objectForKeyedSubscript:@"text"];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke_2;
      v21[3] = &unk_265559868;
      v21[4] = self;
      id v22 = v8;
      int64_t v24 = a4;
      id v23 = v9;
      [(TypistKeyboard *)self typeWordKeystrokes:v19 expectedWord:v20 atIndex:0 completion:v21];

      uint64_t v14 = v22;
    }

    goto LABEL_12;
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_13:
}

uint64_t __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) typeWordKeystrokeWithPredictive:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

uint64_t __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) typeWordKeystrokeWithPredictive:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

- (void)typeWordKeystrokes:(id)a3 expectedWord:(id)a4 atIndex:(int64_t)a5 completion:(id)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  int v12 = (void (**)(void))a6;
  if ([v10 count] && objc_msgSend(v10, "count") > (unint64_t)a5)
  {
    uint64_t v13 = [v10 objectAtIndexedSubscript:a5];
    v20[0] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__TypistKeyboard_typeWordKeystrokes_expectedWord_atIndex_completion___block_invoke;
    v15[3] = &unk_265559890;
    v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    uint64_t v18 = v12;
    int64_t v19 = a5;
    [(TypistKeyboard *)self typeKeystrokeStream:v14 completion:v15];
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

uint64_t __69__TypistKeyboard_typeWordKeystrokes_expectedWord_atIndex_completion___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) usePredictionBar]
    || ([*(id *)(a1 + 32) candidatebar],
        double v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 getIndexOfCandidate:*(void *)(a1 + 40)],
        v2,
        v3 < 0))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64) + 1;
    id v11 = *(void **)(a1 + 48);
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) candidatebar];
    [v4 selectCandidateAtIndex:v3];

    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 count];
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = v7;
    id v11 = v5;
    uint64_t v12 = v6;
  }
  return [v10 typeWordKeystrokes:v11 expectedWord:v12 atIndex:v8 completion:v9];
}

- (void)switchKeyPlaneOnActiveKeyboard:(id)a3
{
  id v3 = a3;
  [(objc_class *)+[TypistKeyboardData keyboardData] switchToPlane:v3];
}

- (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v8 = +[TypistKeyboardData keyboardData];
  -[objc_class centerOfKey:withOffset:](v8, "centerOfKey:withOffset:", v7, v6, x, y);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (TypistKeyboard)initWithHardwareKeyboard:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboard;
  id v5 = [(TypistKeyboard *)&v10 init];
  double v6 = v5;
  if (v5)
  {
    typeInterval = v5->_typeInterval;
    v5->_typeInterval = (NSNumber *)&unk_270C6EA90;

    pressDuration = v6->_pressDuration;
    v6->_pressDuration = (NSNumber *)&unk_270C6EA90;

    [(TypistKeyboard *)v6 attachHardwareKeyboard:v4];
  }

  return v6;
}

- (void)pressKeycode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v5)
  {
    id v6 = [(TypistKeyboard *)self hardwareKeyboard];
    [v6 pressKeycode:v3];
  }
}

+ (void)typeStringOnHardwareKeyboard:(id)a3 withLanguage:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  if (v13 && v5)
  {
    uint64_t v12 = [[TypistHWKeyboard alloc] initWithLanguage:v5];
    if (v12)
    {
      [&unk_270C6EA90 doubleValue];
      -[TypistHWKeyboard setTypeInterval:](v12, "setTypeInterval:");
      [(TypistHWKeyboard *)v12 typeString:v13];
      [(TypistHWKeyboard *)v12 detach];
    }
    else
    {
      TYLogl(OS_LOG_TYPE_ERROR, @"Unable to attach hardware keyboard with language %@", v6, v7, v8, v9, v10, v11, (char)v5);
    }
  }
}

- (void)attachHardwareKeyboard:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v23 = v5;
    uint64_t v6 = [(TypistKeyboard *)self hardwareKeyboard];

    if (v6)
    {
      TYLog(@"An existing hardware keyboard was found to be attached. Detaching prior to attaching new keyboard (%@)...", v7, v8, v9, v10, v11, v12, v13, (char)v23);
      [(TypistKeyboard *)self detachHardwareKeyboard];
    }
    uint64_t v14 = [[TypistHWKeyboard alloc] initWithLanguage:v23];
    [(TypistKeyboard *)self setHardwareKeyboard:v14];

    uint64_t v15 = [(TypistKeyboard *)self pressDuration];
    if (v15)
    {
      uint64_t v3 = [(TypistKeyboard *)self pressDuration];
      [v3 doubleValue];
    }
    else
    {
      [&unk_270C6EA90 doubleValue];
    }
    double v17 = v16;
    uint64_t v18 = [(TypistKeyboard *)self hardwareKeyboard];
    [v18 setPressDuration:v17];

    if (v15) {
    int64_t v19 = [(TypistKeyboard *)self typeInterval];
    }
    if (v19)
    {
      uint64_t v3 = [(TypistKeyboard *)self typeInterval];
      [v3 doubleValue];
    }
    else
    {
      [&unk_270C6EAB0 doubleValue];
    }
    double v21 = v20;
    id v22 = [(TypistKeyboard *)self hardwareKeyboard];
    [v22 setTypeInterval:v21];

    if (v19) {
    id v5 = v23;
    }
  }
}

- (void)attachHardwareKeyboardWithCountryCode:(id)a3
{
  if (a3)
  {
    +[TypistHWKeyboard convertHIDCountryCodeToLanguage:](TypistHWKeyboard, "convertHIDCountryCodeToLanguage:", [a3 integerValue]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    typeInterval = self->_typeInterval;
    self->_typeInterval = (NSNumber *)&unk_270C6EA90;

    pressDuration = self->_pressDuration;
    self->_pressDuration = (NSNumber *)&unk_270C6EA90;

    [(TypistKeyboard *)self attachHardwareKeyboard:v6];
  }
}

- (void)detachHardwareKeyboard
{
  uint64_t v3 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v3)
  {
    id v4 = [(TypistKeyboard *)self hardwareKeyboard];
    [v4 detach];

    [(TypistKeyboard *)self setHardwareKeyboard:0];
  }
}

- (void)typeStringWithHardwareKeyboard:(id)a3
{
  id v13 = a3;
  id v4 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v4)
  {
    uint64_t v11 = [(TypistKeyboard *)self hardwareKeyboard];
    [v11 typeString:v13];
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"A call to typeStringWithHardwareKeyboard was made but no hardware keyboard is attached.", v5, v6, v7, v8, v9, v10, v12);
  }
}

- (void)pressAndHoldHardwareKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 validateAfter:(double)a6
{
  id v13 = a3;
  id v10 = a5;
  if (v13)
  {
    uint64_t v11 = [(TypistKeyboard *)self hardwareKeyboard];

    if (v11)
    {
      char v12 = [(TypistKeyboard *)self hardwareKeyboard];
      [v12 pressAndHoldKeys:v13 forDuration:v10 withValidation:a4 after:a6];
    }
  }
}

- (void)toggleCapsLock
{
  uint64_t v3 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v3)
  {
    id v4 = [(TypistKeyboard *)self hardwareKeyboard];
    [v4 typeString:@"⇪"];
  }
  else
  {
    [(TypistKeyboard *)self typeString:@"⇪"];
  }
}

- (void)tapGlobeKey
{
  uint64_t v3 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v3)
  {
    id v4 = [(TypistKeyboard *)self hardwareKeyboard];
    [v4 typeString:@"⌨"];
  }
  else
  {
    [(TypistKeyboard *)self typeString:@"🌐"];
  }
}

- (void)tapMoreKey
{
  uint64_t v3 = [(TypistKeyboard *)self hardwareKeyboard];

  if (v3)
  {
    TYLog(@"%@ is not an understood action in the context of hardware keyboards. Aborting...", v4, v5, v6, v7, v8, v9, v10, (char)@"🔤");
  }
  else
  {
    [(TypistKeyboard *)self typeString:@"🔤"];
  }
}

+ (id)keyboardLanguageValueMap
{
  return +[TypistHWKeyboard keyboardLanguageValueMap];
}

- (TypistKeyboard)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TypistKeyboard;
  uint64_t v5 = [(TypistKeyboard *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardID"];
    keyboardID = v5->_keyboardID;
    v5->_keyboardID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeInterval"];
    typeInterval = v5->_typeInterval;
    v5->_typeInterval = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardwareKeyboard"];
    hardwareKeyboard = v5->_hardwareKeyboard;
    v5->_hardwareKeyboard = (TypistHWKeyboard *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidatebar"];
    candidatebar = v5->_candidatebar;
    v5->_candidatebar = (TypistCandidateBar *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutName"];
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"languageID"];
    languageID = v5->_languageID;
    v5->_languageID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionCode"];
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardSW"];
    keyboardSW = v5->_keyboardSW;
    v5->_keyboardSW = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardType"];
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v22;

    v5->_usePopupKeys = [v4 decodeBoolForKey:@"usePopupKeys"];
    v5->_usePredictionBar = [v4 decodeBoolForKey:@"usePredictionBar"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyPlanes"];
    keyPlanes = v5->_keyPlanes;
    v5->_keyPlanes = (NSMutableDictionary *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultPlaneName"];
    defaultPlaneName = v5->_defaultPlaneName;
    v5->_defaultPlaneName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planeSwitchTable"];
    planeSwitchTable = v5->_planeSwitchTable;
    v5->_planeSwitchTable = (NSDictionary *)v28;

    v5->_dictationSupported = [v4 decodeBoolForKey:@"dictationSupported"];
    v5->_shouldShowDictationKedouble y = [v4 decodeBoolForKey:@"shouldShowDictationKey"];
    v5->_shouldShowGlobeKedouble y = [v4 decodeBoolForKey:@"shouldShowGlobeKey"];
    v5->_isTenKedouble y = [v4 decodeBoolForKey:@"isTenKey"];
    v5->_isKana = [v4 decodeBoolForKey:@"isKana"];
    v5->_isHandwriting = [v4 decodeBoolForKey:@"isHandwriting"];
    v5->_fastTyping = [v4 decodeBoolForKey:@"fastTyping"];
    v5->_hasCandidatesToCommit = [v4 decodeBoolForKey:@"hasCandidatesToCommit"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sentenceDelimitingCharacters"];
    sentenceDelimitingCharacters = v5->_sentenceDelimitingCharacters;
    v5->_sentenceDelimitingCharacters = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sentenceTrailingCharacters"];
    sentenceTrailingCharacters = v5->_sentenceTrailingCharacters;
    v5->_sentenceTrailingCharacters = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sentencePrefixingCharacters"];
    sentencePrefixingCharacters = v5->_sentencePrefixingCharacters;
    v5->_sentencePrefixingCharacters = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoshiftRegex"];
    autoshiftRegedouble x = v5->_autoshiftRegex;
    v5->_autoshiftRegedouble x = (NSRegularExpression *)v36;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  keyboardID = self->_keyboardID;
  id v22 = v4;
  if (keyboardID)
  {
    [v4 encodeObject:keyboardID forKey:@"keyboardID"];
    id v4 = v22;
  }
  typeInterval = self->_typeInterval;
  if (typeInterval)
  {
    [v22 encodeObject:typeInterval forKey:@"typeInterval"];
    id v4 = v22;
  }
  candidatebar = self->_candidatebar;
  if (candidatebar)
  {
    [v22 encodeObject:candidatebar forKey:@"candidatebar"];
    id v4 = v22;
  }
  hardwareKeyboard = self->_hardwareKeyboard;
  if (hardwareKeyboard)
  {
    [v22 encodeObject:hardwareKeyboard forKey:@"hardwareKeyboard"];
    id v4 = v22;
  }
  layoutName = self->_layoutName;
  if (layoutName)
  {
    [v22 encodeObject:layoutName forKey:@"layoutName"];
    id v4 = v22;
  }
  languageID = self->_languageID;
  if (languageID)
  {
    [v22 encodeObject:languageID forKey:@"languageID"];
    id v4 = v22;
  }
  regionCode = self->_regionCode;
  if (regionCode)
  {
    [v22 encodeObject:regionCode forKey:@"regionCode"];
    id v4 = v22;
  }
  keyboardSW = self->_keyboardSW;
  if (keyboardSW)
  {
    [v22 encodeObject:keyboardSW forKey:@"keyboardSW"];
    id v4 = v22;
  }
  keyboardType = self->_keyboardType;
  if (keyboardType)
  {
    [v22 encodeObject:keyboardType forKey:@"keyboardType"];
    id v4 = v22;
  }
  [v4 encodeBool:self->_usePopupKeys forKey:@"usePopupKeys"];
  [v22 encodeBool:self->_usePredictionBar forKey:@"usePredictionBar"];
  keyPlanes = self->_keyPlanes;
  if (keyPlanes) {
    [v22 encodeObject:keyPlanes forKey:@"keyPlanes"];
  }
  defaultPlaneName = self->_defaultPlaneName;
  if (defaultPlaneName) {
    [v22 encodeObject:defaultPlaneName forKey:@"defaultPlaneName"];
  }
  planeSwitchTable = self->_planeSwitchTable;
  double v17 = v22;
  if (planeSwitchTable)
  {
    [v22 encodeObject:planeSwitchTable forKey:@"planeSwitchTable"];
    double v17 = v22;
  }
  [v17 encodeBool:self->_dictationSupported forKey:@"dictationSupported"];
  [v22 encodeBool:self->_shouldShowDictationKey forKey:@"shouldShowDictationKey"];
  [v22 encodeBool:self->_shouldShowGlobeKey forKey:@"shouldShowGlobeKey"];
  [v22 encodeBool:self->_isTenKey forKey:@"isTenKey"];
  [v22 encodeBool:self->_isKana forKey:@"isKana"];
  [v22 encodeBool:self->_isHandwriting forKey:@"isHandwriting"];
  [v22 encodeBool:self->_fastTyping forKey:@"fastTyping"];
  [v22 encodeBool:self->_hasCandidatesToCommit forKey:@"hasCandidatesToCommit"];
  [v22 encodeBool:self->_sentenceDelimitingCharacters != 0 forKey:@"sentenceDelimitingCharacters"];
  sentenceTrailingCharacters = self->_sentenceTrailingCharacters;
  if (sentenceTrailingCharacters) {
    [v22 encodeObject:sentenceTrailingCharacters forKey:@"sentenceTrailingCharacters"];
  }
  sentencePrefixingCharacters = self->_sentencePrefixingCharacters;
  if (sentencePrefixingCharacters) {
    [v22 encodeObject:sentencePrefixingCharacters forKey:@"sentencePrefixingCharacters"];
  }
  autoshiftRegedouble x = self->_autoshiftRegex;
  double v21 = v22;
  if (autoshiftRegex)
  {
    [v22 encodeObject:autoshiftRegex forKey:@"autoshiftRegex"];
    double v21 = v22;
  }
}

- (NSNumber)typeInterval
{
  return self->_typeInterval;
}

- (NSNumber)touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (NSString)keyboardID
{
  return self->_keyboardID;
}

- (void)setKeyboardID:(id)a3
{
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (void)setLayoutName:(id)a3
{
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (NSString)keyboardSW
{
  return self->_keyboardSW;
}

- (void)setKeyboardSW:(id)a3
{
}

- (BOOL)prefersPopoverKeys
{
  return self->_prefersPopoverKeys;
}

- (void)setPrefersPopoverKeys:(BOOL)a3
{
  self->_prefersPopoverKeys = a3;
}

- (BOOL)usePopupKeys
{
  return self->_usePopupKeys;
}

- (void)setUsePopupKeys:(BOOL)a3
{
  self->_usePopupKeys = a3;
}

- (BOOL)flickTyping
{
  return self->_flickTyping;
}

- (void)setFlickTyping:(BOOL)a3
{
  self->_flickTyping = a3;
}

- (int)tapStyle
{
  return self->_tapStyle;
}

- (void)setTapStyle:(int)a3
{
  self->_tapStyle = a3;
}

- (NSNumber)tapSigma
{
  return self->_tapSigma;
}

- (void)setTapSigma:(id)a3
{
}

- (NSNumber)tapBounds
{
  return self->_tapBounds;
}

- (void)setTapBounds:(id)a3
{
}

- (BOOL)usePredictionBar
{
  return self->_usePredictionBar;
}

- (void)setUsePredictionBar:(BOOL)a3
{
  self->_usePredictionBar = a3;
}

- (TypistCandidateBar)candidatebar
{
  return self->_candidatebar;
}

- (void)setCandidatebar:(id)a3
{
}

- (BOOL)swipeForceSpace
{
  return self->_swipeForceSpace;
}

- (void)setSwipeForceSpace:(BOOL)a3
{
  self->_swipeForceSpace = a3;
}

- (NSNumber)swipeSigma
{
  return self->_swipeSigma;
}

- (void)setSwipeSigma:(id)a3
{
}

- (NSNumber)swipeAlpha
{
  return self->_swipeAlpha;
}

- (void)setSwipeAlpha:(id)a3
{
}

- (NSNumber)swipePivotProbability
{
  return self->_swipePivotProbability;
}

- (void)setSwipePivotProbability:(id)a3
{
}

- (NSNumber)swipeErrantProbability
{
  return self->_swipeErrantProbability;
}

- (void)setSwipeErrantProbability:(id)a3
{
}

- (NSNumber)swipeConvexProbability
{
  return self->_swipeConvexProbability;
}

- (void)setSwipeConvexProbability:(id)a3
{
}

- (NSNumber)swipeErrantSigma
{
  return self->_swipeErrantSigma;
}

- (void)setSwipeErrantSigma:(id)a3
{
}

- (NSNumber)swipeConvexSigma
{
  return self->_swipeConvexSigma;
}

- (void)setSwipeConvexSigma:(id)a3
{
}

- (NSNumber)pressDuration
{
  return self->_pressDuration;
}

- (TypistHWKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(id)a3
{
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
}

- (NSMutableDictionary)keyPlanes
{
  return self->_keyPlanes;
}

- (void)setKeyPlanes:(id)a3
{
}

- (NSString)defaultPlaneName
{
  return self->_defaultPlaneName;
}

- (void)setDefaultPlaneName:(id)a3
{
}

- (NSDictionary)planeSwitchTable
{
  return self->_planeSwitchTable;
}

- (void)setPlaneSwitchTable:(id)a3
{
}

- (void)setDictationSupported:(BOOL)a3
{
  self->_dictationSupported = a3;
}

- (void)setShouldShowDictationKey:(BOOL)a3
{
  self->_shouldShowDictationKedouble y = a3;
}

- (void)setShouldShowGlobeKey:(BOOL)a3
{
  self->_shouldShowGlobeKedouble y = a3;
}

- (void)setIsTenKey:(BOOL)a3
{
  self->_isTenKedouble y = a3;
}

- (void)setIsKana:(BOOL)a3
{
  self->_isKana = a3;
}

- (void)setIsHandwriting:(BOOL)a3
{
  self->_isHandwriting = a3;
}

- (BOOL)fastTyping
{
  return self->_fastTyping;
}

- (void)setFastTyping:(BOOL)a3
{
  self->_fastTyping = a3;
}

- (BOOL)hasCandidatesToCommit
{
  return self->_hasCandidatesToCommit;
}

- (void)setHasCandidatesToCommit:(BOOL)a3
{
  self->_hasCandidatesToCommit = a3;
}

- (BOOL)isCapsLockedState
{
  return self->_isCapsLockedState;
}

- (void)setIsCapsLockedState:(BOOL)a3
{
  self->_isCapsLockedState = a3;
}

- (NSString)sentenceDelimitingCharacters
{
  return self->_sentenceDelimitingCharacters;
}

- (void)setSentenceDelimitingCharacters:(id)a3
{
}

- (NSString)sentenceTrailingCharacters
{
  return self->_sentenceTrailingCharacters;
}

- (void)setSentenceTrailingCharacters:(id)a3
{
}

- (NSString)sentencePrefixingCharacters
{
  return self->_sentencePrefixingCharacters;
}

- (void)setSentencePrefixingCharacters:(id)a3
{
}

- (NSRegularExpression)autoshiftRegex
{
  return self->_autoshiftRegex;
}

- (void)setAutoshiftRegex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoshiftRegex, 0);
  objc_storeStrong((id *)&self->_sentencePrefixingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceTrailingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceDelimitingCharacters, 0);
  objc_storeStrong((id *)&self->_planeSwitchTable, 0);
  objc_storeStrong((id *)&self->_defaultPlaneName, 0);
  objc_storeStrong((id *)&self->_keyPlanes, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboard, 0);
  objc_storeStrong((id *)&self->_pressDuration, 0);
  objc_storeStrong((id *)&self->_swipeConvexSigma, 0);
  objc_storeStrong((id *)&self->_swipeErrantSigma, 0);
  objc_storeStrong((id *)&self->_swipeConvexProbability, 0);
  objc_storeStrong((id *)&self->_swipeErrantProbability, 0);
  objc_storeStrong((id *)&self->_swipePivotProbability, 0);
  objc_storeStrong((id *)&self->_swipeAlpha, 0);
  objc_storeStrong((id *)&self->_swipeSigma, 0);
  objc_storeStrong((id *)&self->_candidatebar, 0);
  objc_storeStrong((id *)&self->_tapBounds, 0);
  objc_storeStrong((id *)&self->_tapSigma, 0);
  objc_storeStrong((id *)&self->_keyboardSW, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_keyboardID, 0);
  objc_storeStrong((id *)&self->_touchMajorRadius, 0);
  objc_storeStrong((id *)&self->_typeInterval, 0);
}

- (void)_bailWithError:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, id))a4 + 2))(a4, a3);
  }
}

- (BOOL)isAvailableKeyOnCurrentPlane:(id)a3
{
  uint64_t v3 = [(TypistKeyboard *)self findKeyOnCurrentPlane:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"type"];
    char v6 = [v5 isEqualToString:@"basekey"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isAvailablePopoverOnCurrentPlane:(id)a3
{
  uint64_t v3 = [(TypistKeyboard *)self findKeyOnCurrentPlane:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"type"];
    char v6 = [v5 isEqualToString:@"popover"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isAvailableFlickOnCurrentPlane:(id)a3 withDirection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TypistKeyboard *)self isTenKey])
  {
    uint64_t v8 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v6];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"type"];
      if ([v10 isEqualToString:@"gesture"])
      {
        uint64_t v11 = [v9 objectForKeyedSubscript:@"direction"];
        char v12 = [v11 isEqualToString:v7];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isAvailableGestureOnCurrentPlane:(id)a3 withDirection:(id)a4
{
  uint64_t v5 = [NSString stringWithFormat:@"%@%@", a4, a3];
  id v6 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v5];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"type"];
    char v9 = [v8 isEqualToString:@"gesture"];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(TypistKeyboard *)self typeInterval];
  [(TypistKeyboard *)self tapKey:v9 tapCount:a4 overriddenTypeInterval:v10 completion:v8];
}

- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 overriddenTypeInterval:(id)a5 completion:(id)a6
{
  void v31[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v25 = a5;
  uint64_t v11 = (void (**)(id, void *))a6;
  char v12 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v10];
  id v13 = v12;
  if (v12
    && ([v12 objectForKeyedSubscript:@"type"],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:@"basekey"],
        v14,
        v15))
  {
    uint64_t v24 = objc_opt_new();
    for (uint64_t i = objc_opt_new(); a4; --a4)
    {
      if (a4 == 1)
      {
        double v17 = [(TypistKeyboard *)self typeInterval];
        uint64_t v18 = [v17 stringValue];
      }
      else
      {
        uint64_t v18 = [v25 stringValue];
      }
      [i addObject:v13];
      v30[0] = @"action";
      v30[1] = @"time";
      v31[0] = @"wait";
      v31[1] = v18;
      int64_t v19 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      [i addObject:v19];
    }
    v28[0] = @"keystroke";
    v28[1] = @"actions";
    v29[0] = v10;
    v29[1] = i;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    double v21 = v24;
    [v24 addObject:v20];

    [(TypistKeyboard *)self typeKeystrokeStream:v24];
    id v22 = 0;
  }
  else
  {
    id v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    double v21 = [NSString stringWithFormat:@"No tap information was found for %@", v10];
    char v27 = v21;
    uint64_t i = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v22 = [v23 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:i];
  }

  if (v11) {
    v11[2](v11, v22);
  }
}

- (void)dragFromKey:(id)a3 toKey:(id)a4 completion:(id)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v8];
  if (v11)
  {
    char v12 = +[TypistKeyboardUtilities formattedKeyplaneName];
    uint64_t v38 = [(TypistKeyboard *)self getExpectedPlaneNameForKey:v8 currentPlane:v12];
    id v13 = -[TypistKeyboard findKey:inPlane:](self, "findKey:inPlane:", v9);
    if (v13)
    {
      id v37 = v12;
      uint64_t v14 = objc_opt_new();
      int v15 = objc_opt_new();
      uint64_t v16 = NSNumber;
      double v17 = [v11 objectForKeyedSubscript:@"x"];
      [v17 floatValue];
      uint64_t v18 = objc_msgSend(v16, "numberWithFloat:");
      [v15 addObject:v18];

      int64_t v19 = NSNumber;
      uint64_t v20 = [v11 objectForKeyedSubscript:@"y"];
      [v20 floatValue];
      double v21 = objc_msgSend(v19, "numberWithFloat:");
      [v15 addObject:v21];

      id v22 = NSNumber;
      id v23 = [v13 objectForKeyedSubscript:@"x"];
      [v23 floatValue];
      uint64_t v24 = objc_msgSend(v22, "numberWithFloat:");
      [v15 addObject:v24];

      id v25 = NSNumber;
      uint64_t v26 = [v13 objectForKeyedSubscript:@"y"];
      [v26 floatValue];
      char v27 = objc_msgSend(v25, "numberWithFloat:");
      [v15 addObject:v27];

      objc_super v39 = @"actions";
      uint64_t v28 = [(TypistKeyboard *)self _generateArgumentList:v15];
      long long v40 = v28;
      long long v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v14 addObject:v29];

      [(TypistKeyboard *)self typeKeystrokeStream:v14];
      if (v10) {
        v10[2](v10, 0);
      }

      uint64_t v30 = 0;
      char v12 = v37;
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08338];
      uint64_t v35 = [NSString stringWithFormat:@"No key information was found for %@", v9];
      long long v42 = v35;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v30 = [v34 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:v36];

      [(TypistKeyboard *)self _bailWithError:v30 completion:v10];
    }
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08338];
    uint64_t v32 = [NSString stringWithFormat:@"No key information was found for %@", v8];
    v44[0] = v32;
    uint64_t v33 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v30 = [v31 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:v33];

    [(TypistKeyboard *)self _bailWithError:v30 completion:v10];
  }
}

- (void)dragPopoverKey:(id)a3 completion:(id)a4
{
  void v27[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v6];
  id v9 = v8;
  if (v8
    && ([v8 objectForKeyedSubscript:@"type"],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:@"popover"],
        v10,
        v11))
  {
    char v12 = objc_opt_new();
    id v13 = objc_opt_new();
    double v21 = (void *)MEMORY[0x263EFF9A0];
    id v23 = [(TypistKeyboard *)self keyPlanes];
    uint64_t v14 = [v9 objectForKeyedSubscript:@"plane"];
    int v15 = [v23 objectForKeyedSubscript:v14];
    uint64_t v16 = [v9 objectForKeyedSubscript:@"basekey"];
    double v17 = [v15 objectForKeyedSubscript:v16];
    id v22 = [v21 dictionaryWithDictionary:v17];

    [v22 setValue:@"taphold" forKey:@"action"];
    [v13 addObject:v22];
    [v13 addObject:v9];
    v26[0] = @"keystroke";
    v26[1] = @"actions";
    v27[0] = v6;
    v27[1] = v13;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v12 addObject:v18];

    [(TypistKeyboard *)self typeKeystrokeStream:v12];
    int64_t v19 = 0;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08338];
    char v12 = [NSString stringWithFormat:@"No popover information was found for %@", v6];
    id v25 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    int64_t v19 = [v20 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:v13];
  }

  if (v7) {
    v7[2](v7, v19);
  }
}

- (void)flickKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  v32[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (![(TypistKeyboard *)self isTenKey])
  {
    id v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08338];
    char v12 = [NSString stringWithFormat:@"The current keyboard is not a ten key implementation or is not a ten key implementation known to this version of Typist. Please file a radar."];
    uint64_t v28 = v12;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v22 = [v23 errorWithDomain:@"TypistKeyboardNotTenKeyError" code:1 userInfo:v16];
    goto LABEL_10;
  }
  int v11 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v8];
  char v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  id v13 = [v11 objectForKeyedSubscript:@"type"];
  if (([v13 isEqualToString:@"gesture"] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:@"direction"];
  int v15 = [v14 isEqualToString:v9];

  if (!v15)
  {
LABEL_8:
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08338];
    uint64_t v16 = [NSString stringWithFormat:@"No key information was found for %@ with direction %@", v8, v9];
    uint64_t v30 = v16;
    double v17 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v22 = [v24 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:v17];
    goto LABEL_9;
  }
  uint64_t v16 = objc_opt_new();
  double v17 = objc_opt_new();
  uint64_t v26 = [(TypistKeyboard *)self keyPlanes];
  uint64_t v18 = [v12 objectForKeyedSubscript:@"plane"];
  int64_t v19 = [v26 objectForKeyedSubscript:v18];
  uint64_t v20 = [v12 objectForKeyedSubscript:@"basekey"];
  id v25 = [v19 objectForKeyedSubscript:v20];

  [v17 addObject:v25];
  [v17 addObject:v12];
  v31[0] = @"keystroke";
  v31[1] = @"actions";
  v32[0] = v8;
  v32[1] = v17;
  double v21 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v16 addObject:v21];

  [(TypistKeyboard *)self typeKeystrokeStream:v16];
  id v22 = 0;
LABEL_9:

LABEL_10:
  if (v10) {
    v10[2](v10, v22);
  }
}

- (void)swipeGestureKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  void v30[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [NSString stringWithFormat:@"%@%@", a4, v8];
  int v11 = [(TypistKeyboard *)self findKeyOnCurrentPlane:v10];
  char v12 = v11;
  if (v11
    && ([v11 objectForKeyedSubscript:@"type"],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:@"gesture"],
        v13,
        v14))
  {
    int v15 = objc_opt_new();
    uint64_t v16 = objc_opt_new();
    [(TypistKeyboard *)self keyPlanes];
    double v17 = v26 = v8;
    uint64_t v18 = [v12 objectForKeyedSubscript:@"plane"];
    int64_t v19 = [v17 objectForKeyedSubscript:v18];
    uint64_t v20 = [v12 objectForKeyedSubscript:@"basekey"];
    [v19 objectForKeyedSubscript:v20];
    double v21 = v25 = self;

    id v8 = v26;
    [v16 addObject:v21];
    [v16 addObject:v12];
    v29[0] = @"keystroke";
    v29[1] = @"actions";
    v30[0] = v26;
    v30[1] = v16;
    id v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v15 addObject:v22];

    [(TypistKeyboard *)v25 typeKeystrokeStream:v15];
    id v23 = 0;
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08338];
    int v15 = [NSString stringWithFormat:@"No gesture information was found for %@", v10];
    uint64_t v28 = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v23 = [v24 errorWithDomain:@"TypistKeyNotFoundError" code:1 userInfo:v16];
  }

  if (v9) {
    v9[2](v9, v23);
  }
}

- (void)swipeGestureOrFlickKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(TypistKeyboard *)self isAvailableFlickOnCurrentPlane:v8 withDirection:v9])
  {
    [(TypistKeyboard *)self flickKey:v8 withDirection:v9 completion:v10];
  }
  else if ([(TypistKeyboard *)self isAvailableGestureOnCurrentPlane:v8 withDirection:v9])
  {
    [(TypistKeyboard *)self swipeGestureKey:v8 withDirection:v9 completion:v10];
  }
  else if (v10)
  {
    int v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08338];
    char v12 = [NSString stringWithFormat:@"No gesture or flick information was found for %@ in direction \"%@\" ", v8, v9];
    v16[0] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v14 = [v11 errorWithDomain:@"TypistKeyNotFoundInSpecifiedDirectionError" code:1 userInfo:v13];

    v10[2](v10, v14);
  }
}

@end