@interface PVTimelineMarker
+ (id)markerWithOZXTimeMarker:(_OZXTimeMarker *)a3;
+ (id)markerWithOZXTimeMarkerFigTime:(_OZXTimeMarkerFigTime *)a3;
+ (id)markerWithType:(int)a3 timeRange:(id *)a4;
- ($202A6A048D39AE170264FF71A65A9479)timeRange;
- (NSString)comment;
- (NSString)label;
- (PVTimelineMarker)initWithType:(int)a3 timeRange:(id *)a4;
- (int)color;
- (int)type;
- (void)setColor:(int)a3;
- (void)setComment:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTimeRange:(id *)a3;
- (void)setType:(int)a3;
@end

@implementation PVTimelineMarker

+ (id)markerWithType:(int)a3 timeRange:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)&a4->var0.var3;
  v10[0] = *(_OWORD *)&a4->var0.var0;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->var1.var1;
  v8 = (void *)[v6 initWithType:v5 timeRange:v10];

  return v8;
}

- (PVTimelineMarker)initWithType:(int)a3 timeRange:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PVTimelineMarker;
  id v6 = [(PVTimelineMarker *)&v11 init];
  long long v7 = v6;
  if (v6)
  {
    [(PVTimelineMarker *)v6 setType:v5];
    long long v8 = *(_OWORD *)&a4->var0.var3;
    v10[0] = *(_OWORD *)&a4->var0.var0;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a4->var1.var1;
    [(PVTimelineMarker *)v7 setTimeRange:v10];
  }
  return v7;
}

- ($202A6A048D39AE170264FF71A65A9479)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  self->_color = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)markerWithOZXTimeMarker:(_OZXTimeMarker *)a3
{
  memset(&v12, 0, sizeof(v12));
  CMTimeMakeWithSeconds(&start, a3->var0, 120000);
  CMTimeMakeWithSeconds(&duration, a3->var1, 120000);
  CMTimeRangeMake(&v12, &start, &duration);
  uint64_t var5 = a3->var5;
  CMTimeRange v9 = v12;
  uint64_t v5 = +[PVTimelineMarker markerWithType:var5 timeRange:&v9];
  [v5 setColor:a3->var4];
  var2 = a3->var2;
  [v5 setLabel:var2];

  var3 = a3->var3;
  [v5 setComment:var3];

  return v5;
}

+ (id)markerWithOZXTimeMarkerFigTime:(_OZXTimeMarkerFigTime *)a3
{
  memset(&v12, 0, sizeof(v12));
  CMTime start = (CMTime)a3->var0;
  CMTime duration = (CMTime)a3->var1;
  CMTimeRangeMake(&v12, &start, &duration);
  uint64_t var5 = a3->var5;
  CMTimeRange v9 = v12;
  uint64_t v5 = +[PVTimelineMarker markerWithType:var5 timeRange:&v9];
  [v5 setColor:a3->var4];
  var2 = a3->var2;
  [v5 setLabel:var2];

  var3 = a3->var3;
  [v5 setComment:var3];

  return v5;
}

@end