@interface UIEventSessionTouchEvent
- (BOOL)containsTouchID:(id)a3;
- (NSMutableDictionary)touchStatus;
- (UIEventSessionTouchEvent)initWithTouchType:(int64_t)a3 withTrackpadFingerDownCount:(int64_t)a4;
- (int64_t)touchType;
- (int64_t)trackpadFingerDownCount;
- (void)setTouchStatus:(id)a3;
- (void)setTouchType:(int64_t)a3;
- (void)setTrackpadFingerDownCount:(int64_t)a3;
@end

@implementation UIEventSessionTouchEvent

- (UIEventSessionTouchEvent)initWithTouchType:(int64_t)a3 withTrackpadFingerDownCount:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIEventSessionTouchEvent;
  v6 = [(UIEventSessionTouchEvent *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    touchStatus = v6->_touchStatus;
    v6->_touchStatus = v7;

    v6->_touchType = a3;
    v6->_trackpadFingerDownCount = a4;
  }
  return v6;
}

- (BOOL)containsTouchID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_touchStatus objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSMutableDictionary)touchStatus
{
  return self->_touchStatus;
}

- (void)setTouchStatus:(id)a3
{
}

- (int64_t)touchType
{
  return self->_touchType;
}

- (void)setTouchType:(int64_t)a3
{
  self->_touchType = a3;
}

- (int64_t)trackpadFingerDownCount
{
  return self->_trackpadFingerDownCount;
}

- (void)setTrackpadFingerDownCount:(int64_t)a3
{
  self->_trackpadFingerDownCount = a3;
}

- (void).cxx_destruct
{
}

@end