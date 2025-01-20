@interface _WTReplaceRemainderTextEffect
- (double)durationOverride;
- (double)offset;
- (void)setDurationOverride:(double)a3;
- (void)setOffset:(double)a3;
- (void)updateEffectWith:(id)a3;
@end

@implementation _WTReplaceRemainderTextEffect

- (void)updateEffectWith:(id)a3
{
  id v4 = a3;
  v5 = [(_WTTextEffect *)self rootLayer];

  v6 = [v4 firstObject];

  if (!v5)
  {
    [(_WTReplaceRemainderTextEffect *)self durationOverride];
    double v8 = v7;
    if (v7 == 0.0)
    {
      [(_WTReplaceTextEffect *)self sweepDuration];
      double v8 = v9;
    }
    [(_WTReplaceRemainderTextEffect *)self offset];
    double v11 = v8 * dbl_261C13FF0[v10 > 0.0];
    v12 = [v6 layerWithContents];
    [(_WTTextEffect *)self setRootLayer:v12];

    v13 = [(_WTTextEffect *)self effectView];
    v14 = [v13 layer];
    v15 = [(_WTTextEffect *)self rootLayer];
    [v14 addSublayer:v15];

    v16 = [(_WTTextEffect *)self rootLayer];
    [v16 position];
    uint64_t v18 = v17;
    v19 = [(_WTTextEffect *)self rootLayer];
    [v19 position];
    double v21 = v20;
    [(_WTReplaceRemainderTextEffect *)self offset];
    double v23 = v21 - v22;

    v24 = [(_WTTextEffect *)self rootLayer];
    [v24 position];
    uint64_t v26 = v25;
    uint64_t v28 = v27;

    v29 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
    v30 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v29 setTimingFunction:v30];

    v39[0] = v18;
    *(double *)&v39[1] = v23;
    v31 = [MEMORY[0x263F08D40] valueWithBytes:v39 objCType:"{CGPoint=dd}"];
    [v29 setFromValue:v31];

    v38[0] = v26;
    v38[1] = v28;
    v32 = [MEMORY[0x263F08D40] valueWithBytes:v38 objCType:"{CGPoint=dd}"];
    [v29 setToValue:v32];

    [v29 setDuration:(v8 - v11) * 0.5];
    [v29 setBeginTime:v11 + CACurrentMediaTime()];
    [v29 setFillMode:*MEMORY[0x263F15AA8]];
    [v29 setRemovedOnCompletion:0];
    v33 = [(_WTTextEffect *)self rootLayer];
    [v33 addAnimation:v29 forKey:0];

    [(_WTTextEffect *)self invalidationDelay];
    if (v34 > 0.0)
    {
      [(_WTTextEffect *)self invalidationDelay];
      double v8 = v35;
    }
    dispatch_time_t v36 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50___WTReplaceRemainderTextEffect_updateEffectWith___block_invoke;
    block[3] = &unk_26558E530;
    block[4] = self;
    dispatch_after(v36, MEMORY[0x263EF83A0], block);
  }
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)durationOverride
{
  return self->_durationOverride;
}

- (void)setDurationOverride:(double)a3
{
  self->_durationOverride = a3;
}

@end