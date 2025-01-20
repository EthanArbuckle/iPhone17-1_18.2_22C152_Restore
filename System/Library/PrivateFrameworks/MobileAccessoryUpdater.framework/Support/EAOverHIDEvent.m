@interface EAOverHIDEvent
- (EAOverHIDEvent)initWithName:(id)a3 info:(id)a4;
- (NSDictionary)info;
- (NSString)filterName;
- (void)dealloc;
- (void)setFilterName:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation EAOverHIDEvent

- (EAOverHIDEvent)initWithName:(id)a3 info:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EAOverHIDEvent;
  v6 = [(EAOverHIDEvent *)&v8 init];
  if (v6)
  {
    [(EAOverHIDEvent *)v6 setFilterName:a3];
    [(EAOverHIDEvent *)v6 setInfo:a4];
  }
  return v6;
}

- (void)dealloc
{
  filterName = self->_filterName;
  if (filterName) {

  }
  info = self->_info;
  if (info) {

  }
  v5.receiver = self;
  v5.super_class = (Class)EAOverHIDEvent;
  [(EAOverHIDEvent *)&v5 dealloc];
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFilterName:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInfo:(id)a3
{
}

@end