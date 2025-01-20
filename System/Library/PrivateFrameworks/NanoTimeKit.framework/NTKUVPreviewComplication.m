@interface NTKUVPreviewComplication
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)complicationWithEntry:(id)a3 forFamily:(int64_t)a4;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (CLKComplicationPreviewTimelineEntry)entry;
- (NTKUVPreviewComplication)init;
- (NTKUVPreviewComplication)initWithComplicationType:(unint64_t)a3;
- (int64_t)family;
@end

@implementation NTKUVPreviewComplication

- (NTKUVPreviewComplication)init
{
  return [(NTKUVPreviewComplication *)self initWithComplicationType:54];
}

- (NTKUVPreviewComplication)initWithComplicationType:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUVPreviewComplication;
  return [(NTKComplication *)&v4 initWithComplicationType:54];
}

+ (id)complicationWithEntry:(id)a3 forFamily:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  uint64_t v8 = [v6 copy];

  v9 = (void *)v7[4];
  v7[4] = v8;

  v7[5] = a4;
  return v7;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return self->_family == a3;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CLKComplicationPreviewTimelineEntry)entry
{
  return self->_entry;
}

- (int64_t)family
{
  return self->_family;
}

- (void).cxx_destruct
{
}

@end