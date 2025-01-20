@interface TSWPTab
+ (id)displayStringFromTabLeader:(id)a3;
+ (id)kTabStopAlignmentStringCenter;
+ (id)kTabStopAlignmentStringDecimal;
+ (id)kTabStopAlignmentStringLeft;
+ (id)kTabStopAlignmentStringRight;
+ (id)kTabStopDisplayStringArrow;
+ (id)kTabStopDisplayStringDash;
+ (id)kTabStopDisplayStringNone;
+ (id)kTabStopDisplayStringPoint;
+ (id)kTabStopDisplayStringUnderscore;
+ (id)kTabStopLeaderStringArrow;
+ (id)kTabStopLeaderStringArrowRTL;
+ (id)kTabStopLeaderStringDash;
+ (id)kTabStopLeaderStringPoint;
+ (id)kTabStopLeaderStringUnderscore;
+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4;
+ (id)tab;
+ (id)tabLeaderFromDisplayString:(id)a3;
+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPosition:(double)a3;
- (NSString)leader;
- (TSWPTab)init;
- (TSWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5;
- (double)position;
- (double)positionInInches;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)alignment;
- (int64_t)compare:(id)a3;
- (int64_t)compareToPosition:(double)a3;
- (void)dealloc;
- (void)setAlignment:(int)a3;
- (void)setLeader:(id)a3;
- (void)setPosition:(double)a3;
- (void)setPositionInInches:(double)a3;
@end

@implementation TSWPTab

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _kTabStopAlignmentStringLeft = [(id)TSWPBundle() localizedStringForKey:@"Left" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopAlignmentStringCenter = [(id)TSWPBundle() localizedStringForKey:@"Center" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopAlignmentStringRight = [(id)TSWPBundle() localizedStringForKey:@"Right" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopAlignmentStringDecimal = [(id)TSWPBundle() localizedStringForKey:@"Decimal" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopDisplayStringNone = [(id)TSWPBundle() localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopDisplayStringPoint = [(id)TSWPBundle() localizedStringForKey:@"....." value:&stru_26D688A48 table:@"TSText"];
    _kTabStopDisplayStringDash = [(id)TSWPBundle() localizedStringForKey:@"-----" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopDisplayStringUnderscore = [(id)TSWPBundle() localizedStringForKey:@"_____" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopDisplayStringArrow = [(id)TSWPBundle() localizedStringForKey:@"→→→" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopLeaderStringPoint = [(id)TSWPBundle() localizedStringForKey:@"." value:&stru_26D688A48 table:@"TSText"];
    _kTabStopLeaderStringDash = [(id)TSWPBundle() localizedStringForKey:@"-" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopLeaderStringUnderscore = [(id)TSWPBundle() localizedStringForKey:@"_" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopLeaderStringArrow = [(id)TSWPBundle() localizedStringForKey:@"→" value:&stru_26D688A48 table:@"TSText"];
    _kTabStopLeaderStringArrowRTL = [(id)TSWPBundle() localizedStringForKey:@"←" value:&stru_26D688A48 table:@"TSText"];
  }
}

+ (id)kTabStopAlignmentStringLeft
{
  return (id)_kTabStopAlignmentStringLeft;
}

+ (id)kTabStopAlignmentStringCenter
{
  return (id)_kTabStopAlignmentStringCenter;
}

+ (id)kTabStopAlignmentStringRight
{
  return (id)_kTabStopAlignmentStringRight;
}

+ (id)kTabStopAlignmentStringDecimal
{
  return (id)_kTabStopAlignmentStringDecimal;
}

+ (id)kTabStopDisplayStringNone
{
  return (id)_kTabStopDisplayStringNone;
}

+ (id)kTabStopDisplayStringPoint
{
  return (id)_kTabStopDisplayStringPoint;
}

+ (id)kTabStopDisplayStringDash
{
  return (id)_kTabStopDisplayStringDash;
}

+ (id)kTabStopDisplayStringUnderscore
{
  return (id)_kTabStopDisplayStringUnderscore;
}

+ (id)kTabStopDisplayStringArrow
{
  return (id)_kTabStopDisplayStringArrow;
}

+ (id)kTabStopLeaderStringPoint
{
  return (id)_kTabStopLeaderStringPoint;
}

+ (id)kTabStopLeaderStringDash
{
  return (id)_kTabStopLeaderStringDash;
}

+ (id)kTabStopLeaderStringUnderscore
{
  return (id)_kTabStopLeaderStringUnderscore;
}

+ (id)kTabStopLeaderStringArrow
{
  return (id)_kTabStopLeaderStringArrow;
}

+ (id)kTabStopLeaderStringArrowRTL
{
  return (id)_kTabStopLeaderStringArrowRTL;
}

- (double)positionInInches
{
  return self->_position / 72.0;
}

- (void)setPositionInInches:(double)a3
{
  self->_position = 72.0 * a3;
}

+ (id)tabLeaderFromDisplayString:(id)a3
{
  if ([a3 isEqualToString:_kTabStopDisplayStringPoint]) {
    return (id)_kTabStopLeaderStringPoint;
  }
  if ([a3 isEqualToString:_kTabStopDisplayStringDash]) {
    return (id)_kTabStopLeaderStringDash;
  }
  if ([a3 isEqualToString:_kTabStopDisplayStringUnderscore]) {
    return (id)_kTabStopLeaderStringUnderscore;
  }
  if ([a3 isEqualToString:_kTabStopDisplayStringArrow]) {
    return (id)_kTabStopLeaderStringArrow;
  }
  return 0;
}

+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isEqualToString:_kTabStopAlignmentStringLeft])
  {
    if (v4) {
      return 2;
    }
    else {
      return 0;
    }
  }
  else if ([a3 isEqualToString:_kTabStopAlignmentStringCenter])
  {
    return 1;
  }
  else if ([a3 isEqualToString:_kTabStopAlignmentStringRight])
  {
    if (v4) {
      return 0;
    }
    else {
      return 2;
    }
  }
  else if ([a3 isEqualToString:_kTabStopAlignmentStringDecimal])
  {
    return 3;
  }
  else
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"+[TSWPTab tabAlignmentFromString:isRTL:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTabs.mm"), 207, @"Unrecognized tab alignment string. Returning kTabAlignmentLeft by default.");
    return 0;
  }
}

+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      BOOL v4 = &_kTabStopAlignmentStringRight;
      v5 = &_kTabStopAlignmentStringLeft;
      goto LABEL_6;
    case 1:
      id result = (id)_kTabStopAlignmentStringCenter;
      break;
    case 2:
      BOOL v4 = &_kTabStopAlignmentStringLeft;
      v5 = &_kTabStopAlignmentStringRight;
LABEL_6:
      if (!a4) {
        BOOL v4 = v5;
      }
      id result = (id)*v4;
      break;
    case 3:
      id result = (id)_kTabStopAlignmentStringDecimal;
      break;
    default:
      id result = &stru_26D688A48;
      break;
  }
  return result;
}

+ (id)displayStringFromTabLeader:(id)a3
{
  BOOL v4 = (void *)_kTabStopDisplayStringNone;
  if ([a3 isEqualToString:_kTabStopLeaderStringPoint]) {
    return (id)_kTabStopDisplayStringPoint;
  }
  if ([a3 isEqualToString:_kTabStopLeaderStringDash]) {
    return (id)_kTabStopDisplayStringDash;
  }
  if ([a3 isEqualToString:_kTabStopLeaderStringUnderscore]) {
    return (id)_kTabStopDisplayStringUnderscore;
  }
  if ([a3 isEqualToString:_kTabStopLeaderStringArrow]) {
    return (id)_kTabStopDisplayStringArrow;
  }
  return v4;
}

+ (id)tab
{
  v2 = objc_alloc_init(TSWPTab);

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTab;
  [(TSWPTab *)&v3 dealloc];
}

- (TSWPTab)init
{
  return [(TSWPTab *)self initWithPosition:0 alignment:0 leader:0.0];
}

- (TSWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPTab;
  uint64_t v8 = [(TSWPTab *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_position = a3;
    v8->_alignment = a4;
    v8->_leader = (NSString *)[a5 copy];
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double position = self->_position;
  uint64_t alignment = self->_alignment;
  leader = self->_leader;

  return (id)[v4 initWithPosition:alignment alignment:leader leader:position];
}

- (NSString)leader
{
  if (self->_leader) {
    return self->_leader;
  }
  else {
    return (NSString *)@" ";
  }
}

- (int64_t)compareToPosition:(double)a3
{
  double position = self->_position;
  if (position < a3) {
    return -1;
  }
  else {
    return position > a3;
  }
}

- (int64_t)compare:(id)a3
{
  if (!a3) {
    return -1;
  }
  [a3 position];

  return -[TSWPTab compareToPosition:](self, "compareToPosition:");
}

- (BOOL)isEqualToPosition:(double)a3
{
  return vabdd_f64(self->_position, a3) <= 0.0000999999975;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return 0;
  }
  v5 = v4;
  double position = self->_position;
  [v4 position];
  if (vabdd_f64(position, v7) > 0.0000999999975) {
    return 0;
  }
  int alignment = self->_alignment;
  if (alignment != [v5 alignment]) {
    return 0;
  }
  leader = self->_leader;
  uint64_t v10 = [v5 leader];
  if (leader) {
    objc_super v11 = (__CFString *)leader;
  }
  else {
    objc_super v11 = @" ";
  }
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @" ";
  }

  return [(__CFString *)v11 isEqualToString:v12];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: pos=%f; align=%d; leader=\"%@\">",
               NSStringFromClass(v4),
               *(void *)&self->_position,
               self->_alignment,
               self->_leader);
}

- (double)position
{
  return self->_position;
}

- (void)setPosition:(double)a3
{
  self->_double position = a3;
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_int alignment = a3;
}

- (void)setLeader:(id)a3
{
}

@end