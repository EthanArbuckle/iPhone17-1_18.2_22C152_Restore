@interface TVPMediaItemRollInfo
- (BOOL)isSkippable;
- (NSNumber)adamID;
- (NSString)dynamicSlotDataSetId;
- (TVPMediaItemRollInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5;
- (double)duration;
- (double)start;
- (id)_typeDescription;
- (id)description;
- (unint64_t)type;
- (void)setAdamID:(id)a3;
- (void)setDynamicSlotDataSetId:(id)a3;
- (void)setSkippable:(BOOL)a3;
@end

@implementation TVPMediaItemRollInfo

- (TVPMediaItemRollInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TVPMediaItemRollInfo;
  result = [(TVPMediaItemRollInfo *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_start = a4;
    result->_duration = a5;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(TVPMediaItemRollInfo *)self _typeDescription];
  v5 = (void *)v4;
  if (self->_skippable) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"type - %@, start - %f, duration - %f, adamID - %@, skippable - %@", v4, *(void *)&self->_start, *(void *)&self->_duration, self->_adamID, v6];

  return v7;
}

- (id)_typeDescription
{
  unint64_t v2 = [(TVPMediaItemRollInfo *)self type];
  if (v2 - 1 > 2) {
    return 0;
  }
  else {
    return off_264CC6A40[v2 - 1];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (double)start
{
  return self->_start;
}

- (double)duration
{
  return self->_duration;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (BOOL)isSkippable
{
  return self->_skippable;
}

- (void)setSkippable:(BOOL)a3
{
  self->_skippable = a3;
}

- (NSString)dynamicSlotDataSetId
{
  return self->_dynamicSlotDataSetId;
}

- (void)setDynamicSlotDataSetId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicSlotDataSetId, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end