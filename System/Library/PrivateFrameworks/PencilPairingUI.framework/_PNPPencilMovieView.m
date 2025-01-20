@interface _PNPPencilMovieView
+ (Class)layerClass;
+ (double)_playbackRate;
- (_PNPPencilMovieView)initWithDeviceType:(int64_t)a3;
- (id)assetName;
- (void)_applyFilterToLayer;
- (void)_playbackEnded;
- (void)completeRevolutionWithCompletionBlock:(id)a3;
- (void)prepare;
- (void)teardown;
@end

@implementation _PNPPencilMovieView

- (_PNPPencilMovieView)initWithDeviceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PNPPencilMovieView;
  result = [(_PNPPencilMovieView *)&v5 init];
  if (result) {
    result->_deviceType = a3;
  }
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)_playbackRate
{
  return 1.0;
}

- (void)_playbackEnded
{
  if (self->_repeat)
  {
    player = self->_player;
    long long v6 = *MEMORY[0x263F010E0];
    uint64_t v7 = *(void *)(MEMORY[0x263F010E0] + 16);
    [(AVPlayer *)player seekToTime:&v6];
    v4 = self->_player;
    [(id)objc_opt_class() _playbackRate];
    *(float *)&double v5 = v5;
    [(AVPlayer *)v4 setRate:v5];
  }
}

- (void)teardown
{
  id v2 = [(_PNPPencilMovieView *)self _playerLayer];
  [v2 setPlayer:0];
}

- (id)assetName
{
  if (self->_deviceType == 4) {
    return @"apple_pencil-B532";
  }
  else {
    return @"apple_pencil_2";
  }
}

- (void)prepare
{
  self->_repeat = 1;
  [(_PNPPencilMovieView *)self _applyFilterToLayer];
  if (!self->_player)
  {
    v3 = [(_PNPPencilMovieView *)self assetName];
    v4 = PencilPairingUIBundle();
    double v5 = [v4 URLForResource:v3 withExtension:@"mov"];

    long long v6 = [MEMORY[0x263EFA7F0] playerWithURL:v5];
    player = self->_player;
    self->_player = v6;

    [(AVPlayer *)self->_player setAllowsExternalPlayback:0];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v9 = *MEMORY[0x263EFA050];
    v10 = [(AVPlayer *)self->_player currentItem];
    [v8 addObserver:self selector:sel__playbackEnded name:v9 object:v10];
  }
  v11 = [(_PNPPencilMovieView *)self _playerLayer];
  [v11 setPlayer:self->_player];

  v12 = self->_player;
  [(id)objc_opt_class() _playbackRate];
  *(float *)&double v13 = v13;
  [(AVPlayer *)v12 setRate:v13];
  id v14 = [MEMORY[0x263EF93E0] sharedInstance];
  [v14 setCategory:*MEMORY[0x263EF9048] error:0];
}

- (void)_applyFilterToLayer
{
  v25[2] = *MEMORY[0x263EF8340];
  v3 = [(_PNPPencilMovieView *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == 1;

  double v5 = [(_PNPPencilMovieView *)self traitCollection];
  if ([v5 userInterfaceStyle] == 1) {
    double v6 = 0.5;
  }
  else {
    double v6 = 0.19;
  }

  if (self->_deviceType == 4)
  {
    uint64_t v7 = [(_PNPPencilMovieView *)self traitCollection];
    if ([v7 userInterfaceStyle] == 1) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.98;
    }

    uint64_t v9 = [(_PNPPencilMovieView *)self traitCollection];
    if ([v9 userInterfaceStyle] == 1) {
      double v6 = 0.5;
    }
    else {
      double v6 = 0.41;
    }
  }
  else
  {
    double v8 = dbl_2397FAC40[v4];
  }
  v10 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  float v11 = v8;
  float v17 = v11;
  long long v18 = *(_OWORD *)(MEMORY[0x263F15720] + 4);
  int v19 = *(_DWORD *)(MEMORY[0x263F15720] + 20);
  float v20 = v11;
  long long v21 = *(_OWORD *)(MEMORY[0x263F15720] + 28);
  int v22 = *(_DWORD *)(MEMORY[0x263F15720] + 44);
  float v23 = v11;
  *(_OWORD *)v24 = *(_OWORD *)(MEMORY[0x263F15720] + 52);
  *(_OWORD *)&v24[12] = *(_OWORD *)(MEMORY[0x263F15720] + 64);
  v12 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:&v17];
  [v10 setValue:v12 forKey:@"inputColorMatrix"];

  double v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15AE0]];
  id v14 = [NSNumber numberWithDouble:v6];
  [v13 setValue:v14 forKey:@"inputAmount"];

  v15 = [(_PNPPencilMovieView *)self layer];
  v25[0] = v10;
  v25[1] = v13;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v15 setFilters:v16];
}

- (void)completeRevolutionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  float v17 = __Block_byref_object_copy__0;
  long long v18 = __Block_byref_object_dispose__0;
  id v19 = [(AVPlayer *)self->_player currentItem];
  [(AVPlayer *)self->_player rate];
  double v6 = (void *)v15[5];
  if (v6)
  {
    int v7 = v5;
    double v8 = [v6 asset];

    if (v8)
    {
      uint64_t v9 = [(id)v15[5] asset];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke;
      v10[3] = &unk_264DA5E48;
      v12 = &v14;
      int v13 = v7;
      id v11 = v4;
      [v9 loadValuesAsynchronouslyForKeys:&unk_26ECE7AB0 completionHandler:v10];
    }
  }
  _Block_object_dispose(&v14, 8);
}

- (void).cxx_destruct
{
}

@end