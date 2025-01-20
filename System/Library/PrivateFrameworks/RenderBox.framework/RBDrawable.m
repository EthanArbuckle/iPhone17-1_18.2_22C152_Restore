@interface RBDrawable
- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor;
- (CGSize)size;
- (MTLEvent)event;
- (MTLTexture)texture;
- (NSDictionary)statistics;
- (RBDevice)device;
- (RBDrawable)initWithDevice:(id)a3;
- (RBDrawableDelegate)delegate;
- (double)GPUDuration;
- (double)scale;
- (id).cxx_construct;
- (id)statisticsHandler;
- (int)initialState;
- (unint64_t)eventValue;
- (unint64_t)pixelFormat;
- (void)_RBDrawableStatisticsDidChange;
- (void)dealloc;
- (void)dumpTexture:(id)a3 name:(id)a4;
- (void)finish;
- (void)renderDisplayList:(id)a3 flags:(unsigned int)a4;
- (void)renderDisplayList:(id)a3 sourceRect:(id *)a4 destinationOffset:(id *)a5 flags:(unsigned int)a6;
- (void)renderItems:(id)a3 flags:(unsigned int)a4;
- (void)renderWithFlags:(uint64_t)a3 items:(uint64_t)a4 count:(void *)a5 displayList:;
- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4;
- (void)setClearColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventValue:(unint64_t)a3;
- (void)setInitialState:(int)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStatisticsHandler:(id)a3;
- (void)setTexture:(id)a3;
@end

@implementation RBDrawable

- (RBDrawable)initWithDevice:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RBDrawable;
  v4 = [(RBDrawable *)&v8 init];
  v5 = v4;
  if (v4)
  {
    id v6 = (id)*((void *)v4 + 5);
    if (v6 != a3)
    {

      *((void *)v5 + 5) = a3;
    }
    *((void *)v5 + 9) = 0x3FF0000000000000;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = *((void *)self + 1);
  if (v3) {
    RB::Drawable::set_delegate(v3, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)RBDrawable;
  [(RBDrawable *)&v4 dealloc];
}

- (RBDevice)device
{
  return (RBDevice *)*((void *)self + 5);
}

- (RBDrawableDelegate)delegate
{
  v2 = (RBDrawableDelegate *)objc_loadWeakRetained((id *)self + 4);

  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (MTLTexture)texture
{
  return (MTLTexture *)*((void *)self + 6);
}

- (void)setTexture:(id)a3
{
  id v4 = (id)*((void *)self + 6);
  if (v4 != a3)
  {

    *((void *)self + 6) = a3;
  }
}

- (MTLEvent)event
{
  return (MTLEvent *)*((void *)self + 7);
}

- (void)setEvent:(id)a3
{
  id v4 = (id)*((void *)self + 7);
  if (v4 != a3)
  {

    *((void *)self + 7) = a3;
  }
}

- (void)renderDisplayList:(id)a3 flags:(unsigned int)a4
{
  memset(v4, 0, sizeof(v4));
  v5[0] = 0;
  v5[1] = 0;
  uint64x2_t v6 = vcvtq_u64_f64(*((float64x2_t *)self + 6));
  [(RBDrawable *)self renderDisplayList:a3 sourceRect:v5 destinationOffset:v4 flags:*(void *)&a4];
}

- (void)renderDisplayList:(id)a3 sourceRect:(id *)a4 destinationOffset:(id *)a5 flags:(unsigned int)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v7 = *((_DWORD *)self + 16);
  if (v7 >= 3) {
    abort();
  }
  MTLPixelFormat v8 = *(void *)&a6;
  v6.i64[0] = *((void *)self + 14);
  v6.i32[2] = *((_DWORD *)self + 30);
  float32x4_t v25 = v6;
  float v24 = *((float *)self + 31);
  uint64_t v13 = objc_msgSend(a3, "_rb_contents");
  if (v13)
  {
    int32x2_t v14 = vmovn_s64(*(int64x2_t *)&a4->var2);
    uint32x2_t v15 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v14);
    if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) == 0)
    {
      v16 = (const RB::DisplayList::Contents *)v13;
      int32x2_t v17 = vmovn_s64(*(int64x2_t *)&a4->var0);
      if (*(unsigned char *)(v13 + 400))
      {
        RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v27);
        RB::DisplayList::Builder::set_optimized((uint64_t)v27, 1);
        v18.i32[0] = 0;
        uint32x2_t v19 = (uint32x2_t)vceq_s32(v14, (int32x2_t)0x8000000080000000);
        int8x8_t v20 = (int8x8_t)vdup_lane_s32(vcgt_s32(v18, (int32x2_t)vpmin_u32(v19, v19)), 0);
        RB::DisplayList::Builder::set_crop(v27, (float32x2_t)vbsl_s8(v20, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(v17)), (float32x2_t)vbsl_s8(v20, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(v14)));
        RB::DisplayList::Builder::draw((RB::DisplayList::Layer ***)v27, v16, v30, 1.0, 0, 0);
        RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v27, v21, &v26);
        v22 = v26;
        RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v27);
        v16 = (const RB::DisplayList::Contents *)v22;
      }
      else
      {
        v22 = 0;
      }
      float32x4_t v23 = v25;
      v23.i32[3] = 1.0;
      v27[0] = (float32x2_t)v16;
      v27[1] = 0;
      v27[2] = (float32x2_t)v17;
      v27[3] = (float32x2_t)v14;
      v27[4] = (float32x2_t)vmovn_s64(*(int64x2_t *)&a5->var0);
      unsigned int v28 = v7;
      float32x4_t v29 = vmulq_n_f32(v23, v24);
      -[RBDrawable renderWithFlags:items:count:displayList:]((uint64_t)self, v8, (uint64_t)v27, 1, a3);
      if (v22)
      {
        if (atomic_fetch_add_explicit(v22 + 2, 0xFFFFFFFF, memory_order_release) == 1)
        {
          __dmb(9u);
          (*(void (**)(atomic_uint *))(*(void *)v22 + 8))(v22);
        }
      }
    }
  }
}

- (void)renderWithFlags:(uint64_t)a3 items:(uint64_t)a4 count:(void *)a5 displayList:
{
  if (!a1) {
    return;
  }
  int32x2_t v6 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(a1 + 96)));
  uint32x2_t v7 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v6);
  if ((vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0) {
    return;
  }
  double v8 = *(double *)(a1 + 72);
  if (v8 == 0.0) {
    return;
  }
  int v12 = a2;
  unint64_t v13 = *(void *)(a1 + 80);
  if (!v13)
  {
    int32x2_t v14 = *(void **)(a1 + 48);
    if (v14) {
      unint64_t v13 = [v14 pixelFormat];
    }
    else {
      unint64_t v13 = 80;
    }
  }
  uint32x2_t v15 = RB::pixel_format_traits(v13, a2);
  unint64_t v16 = *v15 | ((unint64_t)*((unsigned __int16 *)v15 + 2) << 32);
  BOOL v17 = (v16 & 0x1000000000) != 0 || (v16 & 0x200000000) != 0 && *(unsigned int *)((char *)v15 + 18) == 0;
  BOOL v18 = !v17;
  if (*((unsigned char *)v15 + 17)) {
    unsigned __int8 v19 = *((unsigned char *)v15 + 16);
  }
  else {
    unsigned __int8 v19 = !v17;
  }
  unsigned __int8 v24 = v19;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v27 = *(id *)(a1 + 40);
  int8x8_t v20 = *(atomic_uint **)(a1 + 8);
  if (v20) {
    atomic_fetch_add_explicit(v20 + 2, 1u, memory_order_relaxed);
  }
  id v25 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = v21 + 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke;
  block[3] = &unk_26C4E7220;
  id v29 = v25;
  id v30 = WeakRetained;
  block[4] = a1;
  int v40 = v12;
  id v31 = v27;
  if (v20) {
    atomic_fetch_add_explicit(v20 + 2, 1u, memory_order_relaxed);
  }
  v32 = v20;
  unint64_t v33 = v13;
  int32x2_t v34 = v6;
  double v35 = v8;
  unsigned __int8 v41 = v24;
  BOOL v42 = v18;
  BOOL v43 = (v16 & 0x200000000) != 0;
  uint64_t v36 = a4;
  uint64_t v37 = a3;
  block[5] = a5;
  id v38 = v23;
  uint64_t v39 = v21;
  RB::Drawable::begin_frame((RB::Drawable *)v20);
  if ((v12 & 8) != 0)
  {
    dispatch_async((dispatch_queue_t)[v27 queue], block);
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  dispatch_sync((dispatch_queue_t)[v27 queue], block);
  if (a5) {
LABEL_24:
  }
    RBXMLRecorderMarkFrame((const void *)a1, a5, v24, *(double *)(a1 + 96), *(double *)(a1 + 104));
LABEL_25:

  v22 = v32;
  if (v32 && atomic_fetch_add_explicit(v32 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(atomic_uint *))(*(void *)v22 + 8))(v22);
  }

  if (v20)
  {
    if (atomic_fetch_add_explicit(v20 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v20 + 8))(v20);
    }
  }
}

- (void)renderItems:(id)a3 flags:(unsigned int)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  unint64_t v7 = [a3 count];
  if (!(v7 >> 58))
  {
    unint64_t v53 = v7 << 6;
    if (v7 << 6 > 0x1000)
    {
      v10 = (char *)malloc_type_malloc(v7 << 6, 0xDD00DD05uLL);
      if (!v10)
      {
LABEL_49:
        free(v10);
        return;
      }
    }
    else
    {
      MEMORY[0x270FA5388](v7, v8);
      v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, v9);
    }
    v67 = 0;
    uint64_t v68 = 0x800000000;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v58 objects:v65 count:16];
    v51 = self;
    unsigned int v52 = a4;
    uint64_t v12 = 0;
    if (v11)
    {
      uint64_t v13 = *(void *)v59;
      __asm { FMOV            V0.4S, #1.0 }
      long long v54 = _Q0;
      int8x8_t v19 = (int8x8_t)vdup_n_s32(0x7F7FFFFFu);
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(a3);
          }
          uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v22 = (void *)[v21 displayList];
          if (v22)
          {
            id v23 = (const RB::DisplayList::Contents *)objc_msgSend(v22, "_rb_contents");
            if (v23)
            {
              int64x2_t v24 = 0uLL;
              int64x2_t v56 = 0u;
              int64x2_t v57 = 0u;
              if (v21)
              {
                [v21 sourceRect];
                int64x2_t v24 = v56;
                int64x2_t v25 = v57;
              }
              else
              {
                int64x2_t v25 = 0uLL;
              }
              int32x2_t v26 = vmovn_s64(v25);
              uint32x2_t v27 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v26);
              if ((vpmax_u32(v27, v27).u32[0] & 0x80000000) == 0)
              {
                int32x2_t v28 = vmovn_s64(v24);
                if (*((unsigned char *)v23 + 400))
                {
                  RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)&v62);
                  RB::DisplayList::Builder::set_optimized((uint64_t)&v62, 1);
                  v29.i32[0] = 0;
                  uint32x2_t v30 = (uint32x2_t)vceq_s32(v26, (int32x2_t)0x8000000080000000);
                  int8x8_t v31 = (int8x8_t)vdup_lane_s32(vcgt_s32(v29, (int32x2_t)vpmin_u32(v30, v30)), 0);
                  RB::DisplayList::Builder::set_crop((float32x2_t *)&v62, (float32x2_t)vbsl_s8(v31, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(v28)), (float32x2_t)vbsl_s8(v31, v19, (int8x8_t)vcvt_f32_s32(v26)));
                  RB::DisplayList::Builder::draw((RB::DisplayList::Layer ***)&v62, v23, v64, 1.0, 0, 0);
                  RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)&v62, v32, &v55);
                  int v33 = v68;
                  unsigned int v34 = v68 + 1;
                  if (HIDWORD(v68) < (v68 + 1))
                  {
                    RB::vector<RB::objc_ptr<void({block_pointer})(NSError *)>,8ul,unsigned int>::reserve_slow(__dst, v34);
                    int v33 = v68;
                    unsigned int v34 = v68 + 1;
                  }
                  double v35 = v67;
                  if (!v67) {
                    double v35 = __dst;
                  }
                  *(void *)&v35[8 * v33] = v55;
                  LODWORD(v68) = v34;
                  id v23 = *(const RB::DisplayList::Contents **)&v35[8 * v33];
                  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)&v62);
                }
                uint64_t v36 = (int32x2_t *)&v10[64 * v12];
                *uint64_t v36 = (int32x2_t)v23;
                v36[2] = v28;
                v36[3] = v26;
                uint64_t v63 = 0;
                int64x2_t v37 = 0uLL;
                int64x2_t v62 = 0u;
                if (v21)
                {
                  [v21 destinationOffset];
                  int64x2_t v37 = v62;
                }
                v36[4] = vmovn_s64(v37);
                int v38 = [v21 initialState];
                if (v38)
                {
                  if (v38 == 1)
                  {
                    *(_DWORD *)&v10[64 * v12 + 40] = 1;
                  }
                  else if (v38 == 2)
                  {
                    uint64_t v39 = (float32x4_t *)&v10[64 * v12];
                    v39[2].i32[2] = 2;
                    [v21 clearColor];
                    v42.i64[0] = __PAIR64__(v41, v40);
                    v42.i64[1] = __PAIR64__(HIDWORD(v54), v43);
                    v39[3] = vmulq_n_f32(v42, v44);
                  }
                }
                else
                {
                  *(_DWORD *)&v10[64 * v12 + 40] = 0;
                }
                ++v12;
              }
            }
          }
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v11);
    }
    if ([a3 count] == 1) {
      v45 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "displayList");
    }
    else {
      v45 = 0;
    }
    -[RBDrawable renderWithFlags:items:count:displayList:]((uint64_t)v51, (MTLPixelFormat)v52, (uint64_t)v10, v12, v45);
    v46 = v67;
    if (v67) {
      v47 = v67;
    }
    else {
      v47 = __dst;
    }
    if (v68)
    {
      unint64_t v48 = 0;
      do
      {
        v49 = *(atomic_uint **)&v47[8 * v48];
        if (v49 && atomic_fetch_add_explicit(v49 + 2, 0xFFFFFFFF, memory_order_release) == 1)
        {
          __dmb(9u);
          (*(void (**)(atomic_uint *))(*(void *)v49 + 8))(v49);
        }
        ++v48;
      }
      while (v48 < v68);
      v46 = v67;
    }
    if (v46) {
      free(v46);
    }
    if (v53 > 0x1000) {
      goto LABEL_49;
    }
  }
}

void __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669B110]();
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x3052000000;
  int64x2_t v37 = __Block_byref_object_copy__1;
  int v38 = __Block_byref_object_dispose__1;
  uint64_t v39 = 0;
  uint64_t v28 = 0;
  int32x2_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  int8x8_t v31 = __Block_byref_object_copy__1;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  v32 = __Block_byref_object_dispose__1;
  uint64_t v33 = v4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3321888768;
  v22 = __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke_3;
  id v23 = &unk_26C4E72B8;
  int64x2_t v25 = &v28;
  int32x2_t v26 = &v34;
  id v27 = v3;
  uint64_t v24 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 136);
  int32x2_t v6 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(void *)(a1 + 64));
  RB::RenderFrame::RenderFrame((RB::RenderFrame *)v40, v6, *(RB::Drawable **)(a1 + 72), (v5 & 5) != 0);
  unint64_t v7 = *(RB **)(a1 + 80);
  double v8 = *(double *)(a1 + 88);
  double v9 = *(double *)(a1 + 96);
  char v10 = *(unsigned char *)(a1 + 140);
  char v11 = *(unsigned char *)(a1 + 141);
  char v13 = RB::pixel_format_required_depth(v7, v12);
  float v14 = v9;
  RB::RenderParams::RenderParams((uint64_t)&v19, (uint64_t)v40, (uint64_t)v7, v10, v11, v13, *(unsigned char *)(a1 + 142), v8, v14);
  char v20 = (*(unsigned char *)(a1 + 136) >> 2) & 4 | v20 & 0xFB;
  RB::DisplayList::render_many(&v19, (uint64_t)v21, *(void *)(a1 + 104), *(int32x2_t **)(a1 + 112));
  if ((*((unsigned char *)v40[0] + 292) & 2) != 0)
  {
    id v15 = *(id *)(a1 + 40);
    if (v15)
    {
      if (v41 != v15)
      {

        id v41 = v15;
      }
    }
  }
  if (*(unsigned char *)(a1 + 136))
  {
    if (!v29[5]) {
      v22((uint64_t)v21);
    }
    if (v35[5])
    {
      char v16 = objc_opt_respondsToSelector();
      double v17 = 0.0;
      if (v16) {
        objc_msgSend(*(id *)(a1 + 56), "RBDrawablePresentationTime:", *(void *)(a1 + 32), 0.0);
      }
      RB::RenderFrame::present((uint64_t)v40, v35[5], v17);
    }
  }
  if ((*(unsigned char *)(a1 + 136) & 2) != 0) {
    RBStrokeRef::clip(v40);
  }
  uint64_t v18 = *(void *)(a1 + 120);
  if (v18) {
    RB::RenderFrame::signal_event(v40, v18, *(void *)(a1 + 128));
  }
  RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v40);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

uint64_t __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (objc_opt_respondsToSelector())
    {
      v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "RBDrawableLayer:", *(void *)(a1 + 32)), "nextDrawable");
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v2;
      uint64_t v3 = [v2 texture];
LABEL_6:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v3;
      return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [*(id *)(a1 + 56) RBDrawableTexture:*(void *)(a1 + 32)];
      goto LABEL_6;
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

- (void)finish
{
}

- (void)dumpTexture:(id)a3 name:(id)a4
{
  unint64_t v7 = [*((id *)self + 5) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__RBDrawable_dumpTexture_name___block_invoke;
  block[3] = &unk_2641F8A80;
  block[4] = self;
  block[5] = a4;
  void block[6] = a3;
  dispatch_sync(v7, block);
}

uint64_t __31__RBDrawable_dumpTexture_name___block_invoke(void *a1)
{
  v2 = (id *)-[RBDecodedFontMetadata fontUID](*(void *)(a1[4] + 40));
  uint64_t v3 = (void *)[RB::Device::command_queue(v2) commandBuffer];
  uint64_t v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    int v5 = (void *)[v3 debugCommandEncoder];
    uint64_t v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      unint64_t v7 = (void *)a1[5];
      if (v7) {
        double v8 = (const char *)[v7 UTF8String];
      }
      else {
        double v8 = "RBDrawable_texture";
      }
      [v5 dumpTexture:a1[6] name:v8];
    }
    else
    {
      char v10 = RB::error_log((RB *)v6);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __31__RBDrawable_dumpTexture_name___block_invoke_cold_1((uint64_t)v5, v10);
      }
    }
    [v5 endEncoding];
  }
  else
  {
    double v9 = RB::error_log((RB *)v4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __31__RBDrawable_dumpTexture_name___block_invoke_cold_2((uint64_t)v3, v9);
    }
  }
  [v3 commit];
  return [v3 waitUntilCompleted];
}

- (double)GPUDuration
{
  return *(double *)(*((void *)self + 1) + 24);
}

- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4
{
  RB::Drawable::reset_statistics(*((os_unfair_lock_s **)self + 1), a3, a4);
  uint64_t v6 = *((void *)self + 1);
  if (a3) {
    unint64_t v7 = self;
  }
  else {
    unint64_t v7 = 0;
  }
  RB::Drawable::set_delegate(v6, (uint64_t)v7);
}

- (NSDictionary)statistics
{
  RB::Drawable::statistics(*((os_unfair_lock_s **)self + 1), v3);
  return (NSDictionary *)RB::Drawable::Statistics::dictionary((RB::Drawable::Statistics *)v3);
}

- (id)statisticsHandler
{
  uint64_t v3 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  uint64_t v4 = (void *)*((void *)self + 3);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setStatisticsHandler:(id)a3
{
  int v5 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  if (*((id *)self + 3) != a3)
  {
    uint64_t v6 = [a3 copy];

    *((void *)self + 3) = v6;
  }
  os_unfair_lock_unlock(v5);
}

- (void)_RBDrawableStatisticsDidChange
{
  uint64_t v3 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  id v4 = (id)*((void *)self + 3);
  if (v4)
  {

    id v4 = v4;
    os_unfair_lock_unlock(v3);
    if (v4) {
      (*((void (**)(id, RBDrawable *))v4 + 2))(v4, self);
    }
  }
  else
  {
    os_unfair_lock_unlock(v3);
  }
}

- (CGSize)size
{
  double v2 = *((double *)self + 12);
  double v3 = *((double *)self + 13);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *((void *)self + 12) = *(void *)&a3.width;
  *((void *)self + 13) = *(void *)&a3.height;
}

- (double)scale
{
  return *((double *)self + 9);
}

- (void)setScale:(double)a3
{
  *((double *)self + 9) = a3;
}

- (unint64_t)pixelFormat
{
  return *((void *)self + 10);
}

- (void)setPixelFormat:(unint64_t)a3
{
  *((void *)self + 10) = a3;
}

- (int)initialState
{
  return *((_DWORD *)self + 16);
}

- (void)setInitialState:(int)a3
{
  *((_DWORD *)self + 16) = a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float v2 = *((float *)self + 28);
  float v3 = *((float *)self + 29);
  float v4 = *((float *)self + 30);
  float v5 = *((float *)self + 31);
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setClearColor:(id)a3
{
  *((_DWORD *)self + 28) = LODWORD(a3.var0);
  *((_DWORD *)self + 29) = LODWORD(a3.var1);
  *((_DWORD *)self + 30) = LODWORD(a3.var2);
  *((_DWORD *)self + 31) = LODWORD(a3.var3);
}

- (unint64_t)eventValue
{
  return *((void *)self + 11);
}

- (void)setEventValue:(unint64_t)a3
{
  *((void *)self + 11) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 4);
  float v3 = (atomic_uint *)*((void *)self + 1);
  if (v3 && atomic_fetch_add_explicit(v3 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    float v4 = *(void (**)(void))(*(void *)v3 + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 7) = 0;
  return self;
}

- (uint64_t)renderDisplayList:(uint64_t)a1 sourceRect:(uint64_t)a2 destinationOffset:(int)a3 flags:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v8)
  {
    OUTLINED_FUNCTION_1_0();
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8))();
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

- (void)renderWithFlags:(id *)a3 items:count:displayList:.cold.1(id *a1, id *a2, id *a3)
{
}

- (uint64_t)renderWithFlags:(uint64_t)a1 items:count:displayList:.cold.2(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_1_0();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

void __31__RBDrawable_dumpTexture_name___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2140F5000, a2, OS_LOG_TYPE_ERROR, "%@ does not respond to -dumpTexture:name:", (uint8_t *)&v2, 0xCu);
}

void __31__RBDrawable_dumpTexture_name___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2140F5000, a2, OS_LOG_TYPE_ERROR, "%@ does not respond to -debugCommandEncoder", (uint8_t *)&v2, 0xCu);
}

@end