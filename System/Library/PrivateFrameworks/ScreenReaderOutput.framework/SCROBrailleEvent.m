@interface SCROBrailleEvent
+ (id)eventWithType:(int)a3 data:(id)a4;
+ (id)eventWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6;
- (BOOL)shouldDisplay;
- (SCROBrailleEvent)initWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6;
- (id)data;
- (id)data2;
- (id)data3;
- (id)description;
- (int)type;
- (void)setShouldDisplay:(BOOL)a3;
@end

@implementation SCROBrailleEvent

+ (id)eventWithType:(int)a3 data:(id)a4
{
  return (id)[a1 eventWithType:*(void *)&a3 data:a4 data2:0 data3:0];
}

+ (id)eventWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:v8 data:v11 data2:v10 data3:v9];

  return v12;
}

- (SCROBrailleEvent)initWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SCROBrailleEvent;
  v14 = [(SCROBrailleEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong(&v14->_data, a4);
    objc_storeStrong(&v15->_data2, a5);
    objc_storeStrong(&v15->_data3, a6);
    v15->_shouldDisplay = 1;
  }

  return v15;
}

- (int)type
{
  return self->_type;
}

- (id)data
{
  return self->_data;
}

- (id)data2
{
  return self->_data2;
}

- (id)data3
{
  return self->_data3;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SCROBrailleEvent;
  v4 = [(SCROBrailleEvent *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ : [%ld], %@, %@, %@", v4, self->_type, self->_data, self->_data2, self->_data3];

  return v5;
}

- (BOOL)shouldDisplay
{
  return self->_shouldDisplay;
}

- (void)setShouldDisplay:(BOOL)a3
{
  self->_shouldDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data3, 0);
  objc_storeStrong(&self->_data2, 0);

  objc_storeStrong(&self->_data, 0);
}

@end