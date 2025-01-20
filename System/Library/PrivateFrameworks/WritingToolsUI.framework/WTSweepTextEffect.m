@interface WTSweepTextEffect
@end

@implementation WTSweepTextEffect

uint64_t __33___WTSweepTextEffect_invalidate___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  double v2 = 0.016;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  [MEMORY[0x263F158F8] setAnimationDuration:v2];
  v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  [MEMORY[0x263F158F8] setAnimationTimingFunction:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33___WTSweepTextEffect_invalidate___block_invoke_2;
  v6[3] = &unk_26558E530;
  v6[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F158F8] setCompletionBlock:v6];
  v4 = [*(id *)(a1 + 32) rootLayer];
  [v4 setOpacity:0.0];

  return [MEMORY[0x263F158F8] commit];
}

void __33___WTSweepTextEffect_invalidate___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) displayLink];
  [v2 invalidate];

  [*(id *)(a1 + 32) setDisplayLink:0];
  v3 = [*(id *)(a1 + 32) rootLayer];
  [v3 removeFromSuperlayer];

  v4 = [*(id *)(a1 + 32) completion];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) completion];
    v5[2]();
  }
}

void __39___WTSweepTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) fadeOutLayer];
  [v1 removeFromSuperlayer];
}

void __39___WTSweepTextEffect_updateEffectWith___block_invoke_21(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v2 = [*(id *)(a1 + 32) rootMaskLayer];
  v3 = [v2 sublayers];
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v51;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * v8++) removeFromSuperlayer];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v6);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v13), "layerWithContents", (void)v46);
        v15 = [*(id *)(a1 + 32) rootMaskLayer];
        [v15 addSublayer:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v11);
  }

  v16 = [*(id *)(a1 + 32) effectView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [*(id *)(a1 + 32) rootMaskLayer];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  v26 = [*(id *)(a1 + 32) effectView];
  [v26 bounds];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [*(id *)(a1 + 32) rootLayer];
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  v36 = [*(id *)(a1 + 32) effectView];
  [v36 platformGetVisibleRect];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [*(id *)(a1 + 32) rbLayer];
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);
}

@end