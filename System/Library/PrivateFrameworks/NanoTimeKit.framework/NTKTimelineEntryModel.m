@interface NTKTimelineEntryModel
- (NSDate)entryDate;
- (id)entryForComplicationFamily:(int64_t)a3;
- (id)templateForComplicationFamily:(int64_t)a3;
- (void)setEntryDate:(id)a3;
@end

@implementation NTKTimelineEntryModel

- (id)entryForComplicationFamily:(int64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(NTKTimelineEntryModel *)self entryDate];
  [v5 setDate:v6];

  v7 = [(NTKTimelineEntryModel *)self templateForComplicationFamily:a3];
  [v5 setComplicationTemplate:v7];

  [v5 finalize];
  return v5;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  return 0;
}

@end