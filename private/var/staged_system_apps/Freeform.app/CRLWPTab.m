@interface CRLWPTab
+ (id)displayStringFromTabLeader:(id)a3;
+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4 isVertical:(BOOL)a5;
+ (id)tab;
+ (id)tabLeaderFromDisplayString:(id)a3;
+ (id)tabStopAlignmentStringBottom;
+ (id)tabStopAlignmentStringCenter;
+ (id)tabStopAlignmentStringDecimal;
+ (id)tabStopAlignmentStringLeft;
+ (id)tabStopAlignmentStringMiddle;
+ (id)tabStopAlignmentStringRight;
+ (id)tabStopAlignmentStringTop;
+ (id)tabStopDisplayStringArrow;
+ (id)tabStopDisplayStringDash;
+ (id)tabStopDisplayStringNone;
+ (id)tabStopDisplayStringPoint;
+ (id)tabStopDisplayStringUnderscore;
+ (id)tabStopLeaderStringArrow;
+ (id)tabStopLeaderStringArrowRTL;
+ (id)tabStopLeaderStringDash;
+ (id)tabStopLeaderStringPoint;
+ (id)tabStopLeaderStringUnderscore;
+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPosition:(double)a3;
- (CRLWPTab)init;
- (CRLWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5;
- (NSString)leader;
- (double)position;
- (double)positionInInches;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)alignment;
- (int64_t)compare:(id)a3;
- (int64_t)compareToPosition:(double)a3;
- (unint64_t)hash;
- (void)setAlignment:(int)a3;
- (void)setLeader:(id)a3;
- (void)setPosition:(double)a3;
- (void)setPositionInInches:(double)a3;
@end

@implementation CRLWPTab

+ (id)tabStopAlignmentStringTop
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Top" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringMiddle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Middle" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringBottom
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Bottom" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringLeft
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Left" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringCenter
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Center" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringRight
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Right" value:0 table:0];

  return v3;
}

+ (id)tabStopAlignmentStringDecimal
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Decimal" value:0 table:0];

  return v3;
}

+ (id)tabStopDisplayStringNone
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"NONE_LEADER_DISPLAY" value:@"None" table:0];

  return v3;
}

+ (id)tabStopDisplayStringPoint
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"....." value:0 table:0];

  return v3;
}

+ (id)tabStopDisplayStringDash
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"-----" value:0 table:0];

  return v3;
}

+ (id)tabStopDisplayStringUnderscore
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"_____" value:0 table:0];

  return v3;
}

+ (id)tabStopDisplayStringArrow
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"→→→" value:0 table:0];

  return v3;
}

+ (id)tabStopLeaderStringPoint
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"." value:0 table:0];

  return v3;
}

+ (id)tabStopLeaderStringDash
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"-" value:0 table:0];

  return v3;
}

+ (id)tabStopLeaderStringUnderscore
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"_" value:0 table:0];

  return v3;
}

+ (id)tabStopLeaderStringArrow
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"→" value:0 table:0];

  return v3;
}

+ (id)tabStopLeaderStringArrowRTL
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"←" value:0 table:0];

  return v3;
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
  id v4 = a3;
  v5 = [a1 tabStopDisplayStringPoint];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [a1 tabStopLeaderStringPoint];
LABEL_9:
    v14 = (void *)v7;
    goto LABEL_10;
  }
  v8 = [a1 tabStopDisplayStringDash];
  unsigned int v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    uint64_t v7 = [a1 tabStopLeaderStringDash];
    goto LABEL_9;
  }
  v10 = [a1 tabStopDisplayStringUnderscore];
  unsigned int v11 = [v4 isEqualToString:v10];

  if (v11)
  {
    uint64_t v7 = [a1 tabStopLeaderStringUnderscore];
    goto LABEL_9;
  }
  v12 = [a1 tabStopDisplayStringArrow];
  unsigned int v13 = [v4 isEqualToString:v12];

  if (v13)
  {
    uint64_t v7 = [a1 tabStopLeaderStringArrow];
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [a1 tabStopAlignmentStringLeft];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if (v4) {
      int v9 = 2;
    }
    else {
      int v9 = 0;
    }
    goto LABEL_15;
  }
  v10 = [a1 tabStopAlignmentStringCenter];
  int v11 = [v6 isEqualToString:v10];

  if (v11)
  {
LABEL_6:
    int v9 = 1;
    goto LABEL_15;
  }
  v12 = [a1 tabStopAlignmentStringRight];
  unsigned int v13 = [v6 isEqualToString:v12];

  if (!v13)
  {
    v14 = [a1 tabStopAlignmentStringDecimal];
    unsigned __int8 v15 = [v6 isEqualToString:v14];

    if (v15)
    {
      int v9 = 3;
      goto LABEL_15;
    }
    v16 = [a1 tabStopAlignmentStringTop];
    unsigned __int8 v17 = [v6 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      v19 = [a1 tabStopAlignmentStringMiddle];
      unsigned __int8 v20 = [v6 isEqualToString:v19];

      if (v20) {
        goto LABEL_6;
      }
      v21 = [a1 tabStopAlignmentStringBottom];
      unsigned __int8 v22 = [v6 isEqualToString:v21];

      if (v22)
      {
        int v9 = 2;
        goto LABEL_15;
      }
      int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD0B0);
      }
      v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082B8C(v23, v24);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD0D0);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        v26 = +[CRLAssertionHandler packedBacktraceString];
        sub_10106CDAC(v26, v29, v23, (os_log_t)v25);
      }

      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPTab tabAlignmentFromString:isRTL:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTabs.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:154 isFatal:0 description:"Unrecognized tab alignment string. Returning kTabAlignmentLeft by default."];
    }
    int v9 = 0;
    goto LABEL_15;
  }
  if (v4) {
    int v9 = 0;
  }
  else {
    int v9 = 2;
  }
LABEL_15:

  return v9;
}

+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4 isVertical:(BOOL)a5
{
  switch(a3)
  {
    case 0:
      if (a5)
      {
        [a1 tabStopAlignmentStringTop:v5];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_14;
    case 1:
      if (a5) {
        [a1 tabStopAlignmentStringMiddle:v5];
      }
      else {
        [a1 tabStopAlignmentStringCenter:v5];
      }
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 2:
      if (a5)
      {
        [a1 tabStopAlignmentStringBottom:v5];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else if (a4)
      {
LABEL_16:
        [a1 tabStopAlignmentStringLeft:v5];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_14:
        [a1 tabStopAlignmentStringRight:v5];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_18;
    case 3:
      [a1 tabStopAlignmentStringDecimal:v5];
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      break;
    default:
      uint64_t v7 = &stru_101538650;
      break;
  }
  return v7;
}

+ (id)displayStringFromTabLeader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 tabStopDisplayStringNone];
  uint64_t v6 = [a1 tabStopLeaderStringPoint];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [a1 tabStopDisplayStringPoint];
  }
  else
  {
    int v9 = [a1 tabStopLeaderStringDash];
    unsigned int v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      uint64_t v8 = [a1 tabStopDisplayStringDash];
    }
    else
    {
      int v11 = [a1 tabStopLeaderStringUnderscore];
      unsigned int v12 = [v4 isEqualToString:v11];

      if (v12)
      {
        uint64_t v8 = [a1 tabStopDisplayStringUnderscore];
      }
      else
      {
        unsigned int v13 = [a1 tabStopLeaderStringArrow];
        unsigned int v14 = [v4 isEqualToString:v13];

        if (!v14) {
          goto LABEL_10;
        }
        uint64_t v8 = [a1 tabStopDisplayStringArrow];
      }
    }
  }
  unsigned __int8 v15 = (void *)v8;

  uint64_t v5 = v15;
LABEL_10:

  return v5;
}

+ (id)tab
{
  v2 = objc_alloc_init(CRLWPTab);

  return v2;
}

- (CRLWPTab)init
{
  return [(CRLWPTab *)self initWithPosition:0 alignment:0 leader:0.0];
}

- (CRLWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRLWPTab;
  int v9 = [(CRLWPTab *)&v14 init];
  unsigned int v10 = v9;
  if (v9)
  {
    v9->_position = a3;
    v9->_alignment = a4;
    int v11 = (NSString *)[v8 copy];
    leader = v10->_leader;
    v10->_leader = v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double position = self->_position;
  uint64_t alignment = self->_alignment;
  leader = self->_leader;

  return _[v4 initWithPosition:alignment alignment:leader leader:position];
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
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 position];
    int64_t v6 = -[CRLWPTab compareToPosition:](self, "compareToPosition:");
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (BOOL)isEqualToPosition:(double)a3
{
  double position = self->_position;
  return position == a3 || vabdd_f64(position, a3) < fabs(a3 * 0.000000999999997);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int64_t v6 = sub_1002469D0(v5, v4);
  unsigned int v7 = v6;
  if (v6
    && ((double position = self->_position, [v6 position], position == v9)
     || vabdd_f64(position, v9) < fabs(v9 * 0.000000999999997))
    && (int alignment = self->_alignment, alignment == [v7 alignment]))
  {
    leader = self->_leader;
    unsigned int v12 = [v7 leader];
    unsigned int v13 = leader;
    if (v13) {
      objc_super v14 = v13;
    }
    else {
      objc_super v14 = @" ";
    }
    if (v12) {
      unsigned __int8 v15 = v12;
    }
    else {
      unsigned __int8 v15 = @" ";
    }
    v16 = v12;
    unsigned __int8 v17 = [(__CFString *)v14 isEqualToString:v15];
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  return self->_alignment;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: pos=%f; align=%d; leader='%@'>",
    v4,
    *(void *)&self->_position,
    self->_alignment,
  uint64_t v5 = self->_leader);

  return v5;
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

- (void).cxx_destruct
{
}

@end