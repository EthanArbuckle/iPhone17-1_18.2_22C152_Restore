@interface MCTransitionTrigger
+ (id)transitionForTargetPlugObjectID:(id)a3 withTransitionID:(id)a4;
- (MCTransitionTrigger)initWithImprint:(id)a3;
- (NSDictionary)transitionAttributes;
- (NSString)transitionDestinationPlugID;
- (NSString)transitionID;
- (double)transitionDuration;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setTransitionAttributes:(id)a3;
- (void)setTransitionDestinationPlugID:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionID:(id)a3;
@end

@implementation MCTransitionTrigger

+ (id)transitionForTargetPlugObjectID:(id)a3 withTransitionID:(id)a4
{
  v6 = objc_alloc_init(MCTransitionTrigger);
  [(MCAction *)v6 setTargetObjectID:a3];
  [(MCTransitionTrigger *)v6 setTransitionID:a4];
  return v6;
}

- (MCTransitionTrigger)initWithImprint:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MCTransitionTrigger;
  v4 = -[MCAction initWithImprint:](&v8, "initWithImprint:");
  if (v4)
  {
    v4->_transitionID = (NSString *)[a3 objectForKey:@"transitionID"];
    id v5 = [a3 objectForKey:@"transitionDuration"];
    if (v5) {
      [v5 doubleValue];
    }
    else {
      double v6 = 0.0;
    }
    v4->_transitionDuration = v6;
    v4->_transitionAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"transitionAttributes"));
    v4->_transitionDestinationPlugID = (NSString *)[a3 objectForKey:@"transitionDestinationPlugID"];
  }
  return v4;
}

- (void)demolish
{
  self->_transitionID = 0;
  self->_transitionAttributes = 0;

  self->_transitionDestinationPlugID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCTransitionTrigger;
  [(MCAction *)&v3 demolish];
}

- (id)imprint
{
  v9.receiver = self;
  v9.super_class = (Class)MCTransitionTrigger;
  id v3 = [(MCAction *)&v9 imprint];
  v4 = v3;
  transitionID = self->_transitionID;
  if (transitionID) {
    [v3 setObject:transitionID forKey:@"transitionID"];
  }
  if (self->_transitionDuration != 0.0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"transitionDuration");
  }
  transitionAttributes = self->_transitionAttributes;
  if (transitionAttributes) {
    [v4 setObject:transitionAttributes forKey:@"transitionAttributes"];
  }
  transitionDestinationPlugID = self->_transitionDestinationPlugID;
  if (transitionDestinationPlugID) {
    [v4 setObject:transitionDestinationPlugID forKey:@"transitionDestinationPlugID"];
  }
  return v4;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)MCTransitionTrigger;
  [(MCAction *)&v8 _copySelfToSnapshot:a3];
  transitionID = self->_transitionID;
  if (transitionID) {
    *((void *)a3 + 4) = [(NSString *)transitionID copy];
  }
  *((void *)a3 + 5) = *(void *)&self->_transitionDuration;
  transitionAttributes = self->_transitionAttributes;
  if (transitionAttributes) {
    *((void *)a3 + 3) = [(NSMutableDictionary *)transitionAttributes copy];
  }
  transitionDestinationPlugID = self->_transitionDestinationPlugID;
  if (transitionDestinationPlugID) {
    *((void *)a3 + 6) = [(NSString *)transitionDestinationPlugID copy];
  }
  objc_sync_exit(self);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCTransitionTrigger;
  return objc_msgSend(-[MCAction description](&v3, "description"), "stringByAppendingFormat:", @", transitionID='%@', duration=%f, destinationPlugID='%@', attributes=%@", self->_transitionID, *(void *)&self->_transitionDuration, self->_transitionDestinationPlugID, self->_transitionAttributes);
}

- (NSString)transitionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransitionID:(id)a3
{
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (NSDictionary)transitionAttributes
{
  return &self->_transitionAttributes->super;
}

- (void)setTransitionAttributes:(id)a3
{
}

- (NSString)transitionDestinationPlugID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransitionDestinationPlugID:(id)a3
{
}

@end