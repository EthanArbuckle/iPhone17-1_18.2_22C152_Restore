@interface SXLayoutParametersManager
- (NSMutableDictionary)durations;
- (SXLayoutParametersManager)init;
- (id)layoutParametersForTask:(id)a3 previousLayoutOptions:(id)a4;
- (void)layoutFinishedForTask:(id)a3 result:(id)a4;
@end

@implementation SXLayoutParametersManager

- (SXLayoutParametersManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXLayoutParametersManager;
  v2 = [(SXLayoutParametersManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    durations = v2->_durations;
    v2->_durations = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)layoutFinishedForTask:(id)a3 result:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [v6 duration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v13 elapsedDuration];
  }
  v7 = [v6 blueprint];
  int v8 = [v7 isComplete];

  if (v8)
  {
    v9 = [(SXLayoutParametersManager *)self durations];
    v10 = NSNumber;
    [v6 duration];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "type"));
    [v9 setObject:v11 forKey:v12];
  }
}

- (id)layoutParametersForTask:(id)a3 previousLayoutOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1)
  {
    uint64_t v8 = 2;
  }
  else if (v7)
  {
    v9 = [v6 options];
    unint64_t v10 = [v7 diffWithLayoutOptions:v9];

    uint64_t v11 = 2;
    if (((1 << v10) & 0x10110) == 0) {
      uint64_t v11 = 1;
    }
    if (v10 <= 0x10) {
      uint64_t v8 = v11;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  v12 = [(SXLayoutParametersManager *)self durations];
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v14 = [v12 objectForKey:v13];

  if (v14)
  {
    [v14 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = -1.0;
  }
  v17 = [SXLayoutParameters alloc];
  v18 = [v6 options];
  v19 = [(SXLayoutParameters *)v17 initWithLayoutOptions:v18 layoutType:v8 expectedDuration:v16];

  return v19;
}

- (NSMutableDictionary)durations
{
  return self->_durations;
}

- (void).cxx_destruct
{
}

@end