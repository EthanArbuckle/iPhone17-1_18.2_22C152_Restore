@interface RCWaveformContainerArray
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- (NSMutableArray)waveformViewControllers;
- (RCWaveformContainerArray)init;
- (RCWaveformContainerArrayDelegate)delegate;
- (double)currentTime;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (void)addContainer:(id)a3;
- (void)cancelLoadingWaveformDataSource;
- (void)enableWaveformScrolling:(BOOL)a3;
- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4;
- (void)removeContainer:(id)a3;
- (void)removeContainerAtIndex:(unint64_t)a3;
- (void)resetZoomScale;
- (void)setActiveTimeController:(id)a3;
- (void)setBlurred:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIsCompactView:(BOOL)a3;
- (void)setIsEditMode:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setWaveformViewControllers:(id)a3;
- (void)stopScrolling;
- (void)updateColors;
@end

@implementation RCWaveformContainerArray

- (RCWaveformContainerArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCWaveformContainerArray;
  v2 = [(RCWaveformContainerArray *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    waveformViewControllers = v2->_waveformViewControllers;
    v2->_waveformViewControllers = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_waveformViewControllers count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_waveformViewControllers objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)addContainer:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained containersWillUpdate:[self->_waveformViewControllers count]];

  [(NSMutableArray *)self->_waveformViewControllers addObject:v5];
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  [v7 containersDidUpdate:[self->_waveformViewControllers count]];
}

- (void)removeContainer:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained containersWillUpdate:[self->_waveformViewControllers count]];

  [(NSMutableArray *)self->_waveformViewControllers removeObject:v5];
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  [v7 containersDidUpdate:[self->_waveformViewControllers count]];
}

- (void)removeContainerAtIndex:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained containersWillUpdate:[self->_waveformViewControllers count]];

  [(NSMutableArray *)self->_waveformViewControllers removeObjectAtIndex:a3];
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  [v7 containersDidUpdate:[self->_waveformViewControllers count]];
}

- (void)setActiveTimeController:(id)a3
{
  id v4 = a3;
  waveformViewControllers = self->_waveformViewControllers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000411A4;
  v7[3] = &unk_100221528;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v7];
}

- (void)setBlurred:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041220;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (void)resetZoomScale
{
}

- (void)setIsPlayback:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000412F0;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (void)setIsEditMode:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000413B4;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (void)setIsOverview:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041430;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (void)setIsCompactView:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000414F4;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (double)currentTime
{
  v2 = [(RCWaveformContainerArray *)self objectAtIndexedSubscript:0];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)setCurrentTime:(double)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000415FC;
  v4[3] = &unk_1002215A8;
  *(double *)&void v4[4] = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  v2 = [(RCWaveformContainerArray *)self objectAtIndexedSubscript:0];
  [v2 selectedTimeRange];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
  waveformViewControllers = self->_waveformViewControllers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000416C8;
  v5[3] = &unk_1002215C8;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = a3;
  double v7 = a4;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v5];
}

- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  waveformViewControllers = self->_waveformViewControllers;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041798;
  v11[3] = &unk_1002215F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v11];
}

- (void)cancelLoadingWaveformDataSource
{
}

- (void)stopScrolling
{
}

- (void)enableWaveformScrolling:(BOOL)a3
{
  waveformViewControllers = self->_waveformViewControllers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000418D8;
  v4[3] = &unk_100221548;
  BOOL v5 = a3;
  [(NSMutableArray *)waveformViewControllers enumerateObjectsUsingBlock:v4];
}

- (void)updateColors
{
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_waveformViewControllers count];
}

- (NSMutableArray)waveformViewControllers
{
  return self->_waveformViewControllers;
}

- (void)setWaveformViewControllers:(id)a3
{
}

- (RCWaveformContainerArrayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCWaveformContainerArrayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_waveformViewControllers, 0);
}

@end