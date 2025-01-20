@interface SBPIPDefaults
- (double)lastKnownSizeForContentType:(id)a3;
- (unint64_t)lastKnownCornerPositionForContentType:(id)a3;
- (void)_bindAndRegisterDefaults;
- (void)setLastKnownCornerPosition:(unint64_t)a3 contentType:(id)a4;
- (void)setLastKnownSize:(double)a3 contentType:(id)a4;
@end

@implementation SBPIPDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"allowAutoPIP"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBAllowAutoPIP" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v4 = [NSString stringWithUTF8String:"visualizeKeyboardFrame"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBPIPVisualizeKeyboardFrame" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v6 = [NSString stringWithUTF8String:"visualizePositionRegions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBPIPVisualizePositionRegions" toDefaultValue:v5 options:1];

  v7 = [NSString stringWithUTF8String:"initiallyUsesMinimumPreferredContentSize"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBPIPInitiallyUsesMinimumPreferredContentSize" toDefaultValue:v5 options:1];

  v8 = [NSString stringWithUTF8String:"lastKnownCornerPositionByContentType"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBPIPLastKnownCornerPositionByContentType" toDefaultValue:0 options:1];

  id v9 = [NSString stringWithUTF8String:"lastKnownSizeByContentType"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBPIPLastKnownSizeByContentType" toDefaultValue:0 options:1];
}

- (unint64_t)lastKnownCornerPositionForContentType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBPIPDefaults *)self lastKnownCornerPositionByContentType];
  v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 3;
  }

  return v7;
}

- (void)setLastKnownCornerPosition:(unint64_t)a3 contentType:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBPIPDefaults *)self lastKnownCornerPositionByContentType];
  id v10 = (id)v7;
  if (v7) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
  }
  else {
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forKey:v6];

  [(SBPIPDefaults *)self setLastKnownCornerPositionByContentType:v8];
}

- (double)lastKnownSizeForContentType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBPIPDefaults *)self lastKnownSizeByContentType];
  id v6 = [v5 objectForKey:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setLastKnownSize:(double)a3 contentType:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBPIPDefaults *)self lastKnownSizeByContentType];
  id v10 = (id)v7;
  if (v7) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
  }
  else {
  double v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v9 = [NSNumber numberWithDouble:a3];
  [v8 setObject:v9 forKey:v6];

  [(SBPIPDefaults *)self setLastKnownSizeByContentType:v8];
}

@end