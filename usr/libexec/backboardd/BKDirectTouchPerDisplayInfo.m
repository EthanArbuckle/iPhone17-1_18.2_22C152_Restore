@interface BKDirectTouchPerDisplayInfo
- (NSMutableDictionary)serviceToDigitizer;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)setServiceToDigitizer:(id)a3;
@end

@implementation BKDirectTouchPerDisplayInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToDigitizer, 0);
  objc_storeStrong((id *)&self->_cachedServiceProperties, 0);
  objc_storeStrong((id *)&self->_hitTestRegions, 0);
  objc_storeStrong((id *)&self->_touchStreams, 0);
  objc_storeStrong((id *)&self->_display, 0);

  objc_storeStrong((id *)&self->_displayController, 0);
}

- (void)setServiceToDigitizer:(id)a3
{
}

- (NSMutableDictionary)serviceToDigitizer
{
  return self->_serviceToDigitizer;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  [v8 appendProem:self block:&stru_1000F5888];
  v4 = sub_10000CDE8((id *)&self->super.isa);
  id v5 = [v8 appendObject:v4 withName:@"digitizers"];

  id v6 = [v8 appendObject:self->_touchStreams withName:@"touchStreams"];
  id v7 = [v8 appendObject:self->_hitTestRegions withName:@"hitTestRegions"];
}

- (void)dealloc
{
  touchStreams = self->_touchStreams;
  if (touchStreams)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(NSMutableArray *)touchStreams->_clients copy];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          sub_10009629C(*(id **)(*((void *)&v10 + 1) + 8 * (void)v8));
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)BKDirectTouchPerDisplayInfo;
  [(BKDirectTouchPerDisplayInfo *)&v9 dealloc];
}

@end