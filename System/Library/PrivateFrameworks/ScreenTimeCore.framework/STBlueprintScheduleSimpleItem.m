@interface STBlueprintScheduleSimpleItem
- (NSDateComponents)endTime;
- (NSDateComponents)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation STBlueprintScheduleSimpleItem

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDateComponents *)self->_startTime copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDateComponents *)self->_endTime copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSDateComponents)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDateComponents)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end