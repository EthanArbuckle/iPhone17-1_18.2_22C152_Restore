@interface SDAPerBundleHistogram
+ (id)newWithVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8;
- (NSMutableDictionary)perBundle;
- (SDAPerBundleHistogram)init;
- (void)setPerBundle:(id)a3;
- (void)updateVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8;
@end

@implementation SDAPerBundleHistogram

- (SDAPerBundleHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAPerBundleHistogram;
  v2 = [(SDAPerBundleHistogram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    perBundle = v2->_perBundle;
    v2->_perBundle = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)newWithVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  v14 = objc_opt_new();
  [v14 updateVolType:v13 residency:v12 urgency:v11 state:v10 age:a7 size:a8];
  return v14;
}

- (void)updateVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8
{
  id v22 = +[NSNumber numberWithUnsignedLong:a3];
  v14 = +[NSNumber numberWithUnsignedLong:a4];
  v15 = +[NSNumber numberWithUnsignedLong:a5];
  v16 = +[NSNumber numberWithUnsignedLong:a6];
  v17 = [(NSMutableDictionary *)self->_perBundle objectForKey:v22];
  if (!v17)
  {
    v17 = objc_opt_new();
    [(NSMutableDictionary *)self->_perBundle setObject:v17 forKey:v22];
  }
  v18 = [v17 objectForKey:v14];
  if (!v18)
  {
    v18 = objc_opt_new();
    [v17 setObject:v18 forKey:v14];
  }
  v19 = [v18 objectForKey:v15];
  if (!v19)
  {
    v19 = objc_opt_new();
    [v18 setObject:v19 forKey:v15];
  }
  v20 = [v19 objectForKey:v16];
  if (v20)
  {
    id v21 = v20;
    [v20 adjAge:a7 andSize:a8];
  }
  else
  {
    id v21 = +[SDAHistogramElement newWithAge:a7 andSize:a8];
    [v19 setObject:v21 forKey:v16];
  }
}

- (NSMutableDictionary)perBundle
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPerBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end