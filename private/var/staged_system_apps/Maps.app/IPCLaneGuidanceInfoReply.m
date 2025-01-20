@interface IPCLaneGuidanceInfoReply
+ (id)ipcReplyForLaneGuidanceInfo:(id)a3;
- (BOOL)isForManeuver;
- (IPCLaneGuidanceInfoReply)initWithDictionary:(id)a3;
- (NSArray)lanes;
- (NSArray)midStepTitles;
- (NSArray)textAlternatives;
- (NSUUID)laneInfoId;
- (id)description;
- (id)dictionaryValue;
- (id)laneGuidanceInfo;
- (void)setIsForManeuver:(BOOL)a3;
- (void)setLaneInfoId:(id)a3;
- (void)setLanes:(id)a3;
- (void)setMidStepTitles:(id)a3;
- (void)setTextAlternatives:(id)a3;
@end

@implementation IPCLaneGuidanceInfoReply

- (IPCLaneGuidanceInfoReply)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IPCLaneGuidanceInfoReply;
  v5 = [(IPCMessageObject *)&v17 initWithDictionary:v4];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSUUID);
    v7 = [v4 objectForKeyedSubscript:@"kIPCLaneGuidanceInfoReplyLaneInfoIDKey"];
    id v8 = [v6 initWithUUIDString:v7];
    [(IPCLaneGuidanceInfoReply *)v5 setLaneInfoId:v8];

    v9 = [v4 objectForKeyedSubscript:@"kIPCLaneGuidanceInfoReplyLanesKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_opt_class();
      v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
      v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:0];
    }
    else
    {
      v12 = 0;
    }

    [(IPCLaneGuidanceInfoReply *)v5 setLanes:v12];
    v13 = [v4 objectForKeyedSubscript:@"kIPCLaneGuidanceInfoReplyIsForManeuverKey"];
    -[IPCLaneGuidanceInfoReply setIsForManeuver:](v5, "setIsForManeuver:", [v13 BOOLValue]);

    v14 = sub_1000ABC9C(v4, @"kIPCLaneGuidanceInfoReplyInstructionsKey");
    [(IPCLaneGuidanceInfoReply *)v5 setTextAlternatives:v14];

    v15 = sub_1000ABC9C(v4, @"kIPCLaneGuidanceInfoReplyMidStepKey");
    [(IPCLaneGuidanceInfoReply *)v5 setMidStepTitles:v15];
  }
  return v5;
}

- (id)dictionaryValue
{
  v16.receiver = self;
  v16.super_class = (Class)IPCLaneGuidanceInfoReply;
  v3 = [(IPCMessageObject *)&v16 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = [(IPCLaneGuidanceInfoReply *)self laneInfoId];
  id v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCLaneGuidanceInfoReplyLaneInfoIDKey"];

  v7 = [(IPCLaneGuidanceInfoReply *)self lanes];
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  [v4 setObject:v8 forKeyedSubscript:@"kIPCLaneGuidanceInfoReplyLanesKey"];

  v9 = +[NSNumber numberWithBool:[(IPCLaneGuidanceInfoReply *)self isForManeuver]];
  [v4 setObject:v9 forKeyedSubscript:@"kIPCLaneGuidanceInfoReplyIsForManeuverKey"];

  uint64_t v10 = [(IPCLaneGuidanceInfoReply *)self textAlternatives];
  v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  [v4 setObject:v11 forKeyedSubscript:@"kIPCLaneGuidanceInfoReplyInstructionsKey"];

  v12 = [(IPCLaneGuidanceInfoReply *)self midStepTitles];
  v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  [v4 setObject:v13 forKeyedSubscript:@"kIPCLaneGuidanceInfoReplyMidStepKey"];

  id v14 = [v4 copy];

  return v14;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)IPCLaneGuidanceInfoReply;
  v3 = [(IPCLaneGuidanceInfoReply *)&v11 description];
  id v4 = [(IPCLaneGuidanceInfoReply *)self laneInfoId];
  v5 = [(IPCLaneGuidanceInfoReply *)self lanes];
  unsigned int v6 = [(IPCLaneGuidanceInfoReply *)self isForManeuver];
  v7 = [(IPCLaneGuidanceInfoReply *)self textAlternatives];
  id v8 = [(IPCLaneGuidanceInfoReply *)self midStepTitles];
  v9 = +[NSString stringWithFormat:@"%@             laneInfoID : {%@}             lanes : {%@}             isForManeuver : %d             instructions: {%@}             midStepTitles {%@}", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (NSUUID)laneInfoId
{
  return self->_laneInfoId;
}

- (void)setLaneInfoId:(id)a3
{
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (void)setLanes:(id)a3
{
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (void)setIsForManeuver:(BOOL)a3
{
  self->_isForManeuver = a3;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (void)setTextAlternatives:(id)a3
{
}

- (NSArray)midStepTitles
{
  return self->_midStepTitles;
}

- (void)setMidStepTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midStepTitles, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_lanes, 0);

  objc_storeStrong((id *)&self->_laneInfoId, 0);
}

+ (id)ipcReplyForLaneGuidanceInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(IPCLaneGuidanceInfoReply);
  v5 = [v3 laneInfoId];
  [(IPCLaneGuidanceInfoReply *)v4 setLaneInfoId:v5];

  unsigned int v6 = [v3 lanes];
  [(IPCLaneGuidanceInfoReply *)v4 setLanes:v6];

  -[IPCLaneGuidanceInfoReply setIsForManeuver:](v4, "setIsForManeuver:", [v3 isForManeuver]);
  v7 = [v3 textAlternatives];
  [(IPCLaneGuidanceInfoReply *)v4 setTextAlternatives:v7];

  id v8 = [v3 midStepTitles];

  [(IPCLaneGuidanceInfoReply *)v4 setMidStepTitles:v8];

  return v4;
}

- (id)laneGuidanceInfo
{
  id v3 = [NavSignLaneGuidanceInfo alloc];
  id v4 = [(IPCLaneGuidanceInfoReply *)self laneInfoId];
  v5 = [(IPCLaneGuidanceInfoReply *)self lanes];
  BOOL v6 = [(IPCLaneGuidanceInfoReply *)self isForManeuver];
  v7 = [(IPCLaneGuidanceInfoReply *)self midStepTitles];
  id v8 = [(IPCLaneGuidanceInfoReply *)self textAlternatives];
  v9 = [(NavSignLaneGuidanceInfo *)v3 initWithLaneInfoId:v4 lanes:v5 forManeuver:v6 midStepTitles:v7 details:v8];

  return v9;
}

@end