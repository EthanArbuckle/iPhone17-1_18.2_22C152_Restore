@interface RBLayer
+ (id)defaultValueForKey:(id)a3;
+ (void)willEnterForeground;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor;
- (BOOL)_willMoveSubsurface:(unsigned int)a3;
- (BOOL)allowsBottomLeftOrigin;
- (BOOL)allowsPackedDrawable;
- (BOOL)clearsBackground;
- (BOOL)displayWithBounds:(CGRect)a3 callback:(id)a4;
- (BOOL)isDrawableAvailable;
- (BOOL)needsSynchronousUpdate;
- (BOOL)promotesFramebuffer;
- (BOOL)rendersAsynchronously;
- (NSDictionary)statistics;
- (RBDevice)device;
- (RBLayer)init;
- (RBLayer)initWithCoder:(id)a3;
- (RBLayer)initWithLayer:(id)a3;
- (id).cxx_construct;
- (id)actionForKey:(id)a3;
- (id)statisticsHandler;
- (int)colorMode;
- (int64_t)maxDrawableCount;
- (uint64_t)_updateSubsurface:(uint64_t)result;
- (uint64_t)statistics;
- (unint64_t)pixelFormat;
- (void)_RBDrawableStatisticsDidChange;
- (void)_clearSubsurface;
- (void)_moveSubsurface:(void *)a3;
- (void)_renderForegroundInContext:(CGContext *)a3;
- (void)copyImageInRect:(CGRect)a3 options:(id)a4 completionQueue:(id)a5 handler:(id)a6;
- (void)dealloc;
- (void)display;
- (void)displayIfNeeded;
- (void)drawInDisplayList:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)rb_init;
- (void)renderInContext:(CGContext *)a3;
- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4;
- (void)setAllowsBottomLeftOrigin:(BOOL)a3;
- (void)setAllowsPackedDrawable:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClearColor:(id)a3;
- (void)setClearsBackground:(BOOL)a3;
- (void)setColorMode:(int)a3;
- (void)setContents:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMaxDrawableCount:(int64_t)a3;
- (void)setNeedsSynchronousUpdate:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setPromotesFramebuffer:(BOOL)a3;
- (void)setRendersAsynchronously:(BOOL)a3;
- (void)setStatisticsHandler:(id)a3;
- (void)setSubsurface:(int)a3 rotated:(uint64_t)a4 bounds:(char)a5 contentsScale:(double)a6 locked:;
- (void)updateColor;
- (void)waitUntilAsyncRenderingCompleted;
@end

@implementation RBLayer

- (id)actionForKey:(id)a3
{
  if (([a3 isEqualToString:@"contents"] & 1) != 0
    || ([a3 isEqualToString:@"sublayers"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  return [(RBLayer *)&v6 actionForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"opaque"]) {
    return (id)MEMORY[0x263EFFA88];
  }
  if ([a3 isEqualToString:@"needsLayoutOnGeometryChange"]) {
    return (id)MEMORY[0x263EFFA80];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RBLayer;
  return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
}

- (BOOL)displayWithBounds:(CGRect)a3 callback:(id)a4
{
  CGFloat width = a3.size.width;
  double height = a3.size.height;
  uint64_t v134 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)self + 169))
  {
    double y = a3.origin.y;
    double x = a3.origin.x;
    if (!+[RBDevice isRunningInBackground])
    {
      os_unfair_lock_lock((os_unfair_lock_t)self + 8);
      v9 = current_device_locked(self);
      if (v9)
      {

        v9 = v9;
        os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
        if (v9)
        {
          [(RBLayer *)self contentsScale];
          v10.f64[0] = width;
          v10.f64[1] = height;
          double v88 = v11;
          int32x2_t v85 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v10, v11))));
          uint32x2_t v12 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v85);
          if ((vpmax_u32(v12, v12).u32[0] & 0x80000000) == 0)
          {
            uint64_t v13 = [(RBLayer *)self allowsDisplayCompositing];
            if ([(RBLayer *)self rendersAsynchronously]) {
              int v83 = ![(RBLayer *)self needsSynchronousUpdate];
            }
            else {
              int v83 = 0;
            }
            *((unsigned char *)self + 175) = 0;
            if ([(RBLayer *)self allowsPackedDrawable] && !*((void *)self + 18))
            {
              v65 = (RB::Device *)-[RBDecodedFontMetadata fontUID]((uint64_t)v9);
              v66 = (RB::SharedSurfaceGroup *)RB::Device::shared_surfaces(v65);
              BOOL v14 = RB::SharedSurfaceGroup::preflight_subsurface(v66, vadd_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(vdup_lane_s32(v85, 1), v85), 0), (int8x8_t)vrev64_s32(v85), (int8x8_t)v85), (int32x2_t)0x200000002));
            }
            else
            {
              BOOL v14 = 0;
            }
            int v15 = [(RBLayer *)self isOpaque];
            if (v14)
            {
              if (vcgt_s32(vdup_lane_s32(v85, 1), v85).u8[0]) {
                int RotationFlags = 4;
              }
              else {
                int RotationFlags = 0;
              }
            }
            else
            {
              if (*((void *)self + 7)) {
                int v17 = v13;
              }
              else {
                int v17 = 0;
              }
              if (v17 == 1)
              {
                os_unfair_lock_lock((os_unfair_lock_t)self + 8);
                int RotationFlags = CAImageQueueGetRotationFlags();
                os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
              }
              else
              {
                int RotationFlags = 0;
              }
            }
            if ([(RBLayer *)self allowsBottomLeftOrigin]
              && ![(RBLayer *)self contentsAreFlipped])
            {
              double v20 = v88;
              double d = -v88;
              double v18 = -x;
              double v19 = y + height;
            }
            else
            {
              double v18 = -x;
              double v19 = -y;
              double v20 = v88;
              double d = v88;
            }
            long long v132 = 0uLL;
            tdouble y = v20 * v19;
            tdouble x = v18 * v20;
            if (RotationFlags)
            {
              if ((-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7] & 4) != 0)
              {
                float64x2_t v26 = vmulq_n_f64((float64x2_t)xmmword_2142181C0, (double)v85.i32[1]);
                float64x2_t v24 = (float64x2_t)xmmword_21421A370;
                float64x2_t v25 = (float64x2_t)xmmword_2142181D0;
                int32x2_t v27 = vrev64_s32(v85);
              }
              else
              {
                float64x2_t v24 = (float64x2_t)xmmword_2142181D0;
                float64x2_t v25 = (float64x2_t)xmmword_2142181C0;
                float64x2_t v26 = 0uLL;
                int32x2_t v27 = v85;
              }
              double v87 = *(double *)&v27;
              if ((-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7] & 2) != 0)
              {
                float64x2_t v26 = vmlaq_f64(vmlaq_n_f64(v26, v25, (double)v85.i32[0]), (float64x2_t)0, v24);
                float64x2_t v25 = vnegq_f64(v25);
              }
              if (-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7])
              {
                float64x2_t v26 = vmlaq_f64(vmlaq_n_f64(v26, v24, (double)v85.i32[1]), (float64x2_t)0, v25);
                float64x2_t v24 = vnegq_f64(v24);
              }
              *(_OWORD *)&t1.b = v132;
              t1.CGFloat a = v88;
              t1.double d = d;
              t1.tdouble x = tx;
              t1.tdouble y = ty;
              *(float64x2_t *)&t2.CGFloat a = v25;
              *(float64x2_t *)&t2.c = v24;
              *(float64x2_t *)&t2.tdouble x = v26;
              CGAffineTransformConcat(&v133, &t1, &t2);
              long long v132 = *(_OWORD *)&v133.b;
              CGFloat a = v133.a;
              double d = v133.d;
              tdouble x = v133.tx;
              tdouble y = v133.ty;
            }
            else
            {
              CGFloat a = v20;
              double v87 = *(double *)&v85;
            }
            uint64_t v29 = [(RBLayer *)self colorMode];
            int v82 = v29;
            RB::ColorMode::ColorMode(&v129, v29);
            v30 = objc_opt_new();
            [v30 setProfile:2];
            [v30 setDefaultColorSpace:rb_color_space(((v129 & 0x100000000) == 0) | 0x100u)];
            v31.i32[0] = 0;
            uint32x2_t v32 = (uint32x2_t)vceq_s32(*(int32x2_t *)&v87, (int32x2_t)0x8000000080000000);
            int8x8_t v33 = (int8x8_t)vdup_lane_s32(vcgt_s32(v31, (int32x2_t)vpmin_u32(v32, v32)), 0);
            int8x8_t v34 = vbsl_s8(v33, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(*(int32x2_t *)&v87));
            int8x8_t v35 = vand_s8((int8x8_t)0x100000001000000, v33);
            objc_msgSend(v30, "setContentRect:", *(float *)v35.i32, *(float *)&v35.i32[1], *(float *)v34.i32, *(float *)&v34.i32[1]);
            long long v125 = v132;
            CGFloat v124 = a;
            double v126 = d;
            double v127 = tx;
            double v128 = ty;
            [v30 concat:&v124];
            (*((void (**)(id, void *))a4 + 2))(a4, v30);
            uint64_t v36 = objc_msgSend(v30, "_rb_contents");
            if (v36)
            {
              int v37 = RB::DisplayList::Layer::output_depth((RB::DisplayList::Layer *)(v36 + 320));
              LOBYTE(v129) = RB::max_color_depth(v129, v37);
            }
            BOOL v38 = [(RBLayer *)self promotesFramebuffer];
            int v84 = v15;
            if (v15) {
              char v39 = 2;
            }
            else {
              char v39 = 3;
            }
            if (v13) {
              v39 |= 4u;
            }
            if (v38) {
              char v40 = v39;
            }
            else {
              char v40 = v39 | 0x20;
            }
            BOOL v41 = [(RBLayer *)self clearsBackground];
            BOOL v42 = v41;
            if (v41) {
              int v43 = 2;
            }
            else {
              int v43 = 1;
            }
            int v81 = v43;
            __n128 v86 = 0u;
            if (v41)
            {
              [(RBLayer *)self clearColor];
              __asm { FMOV            V4.4S, #1.0 }
              v52.i32[3] = _Q4.i32[3];
              v52.i32[0] = v51;
              int8x16_t v54 = (int8x16_t)vdupq_lane_s32(v53, 0);
              if (v84) {
                unsigned int v55 = -1;
              }
              else {
                unsigned int v55 = 0;
              }
              v52.i32[1] = v44;
              v52.i32[2] = v45;
              __n128 v86 = (__n128)vmulq_f32(v52, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v55), _Q4, v54));
            }
            unint64_t v56 = [(RBLayer *)self pixelFormat];
            __int16 v123 = 0;
            int v122 = 0;
            if (v56)
            {
              HIBYTE(v123) = RB::ColorMode::output_space((RB::ColorMode *)&v129);
              LOBYTE(v123) = (v129 & 0x100000000) == 0;
            }
            else
            {
              uint64_t v57 = -[RBDecodedFontMetadata fontUID]((uint64_t)v9);
              unint64_t v56 = RB::ColorMode::pixel_format((unsigned __int8 *)&v129, v57, v40, (unsigned char *)&v123 + 1, (BOOL *)&v123, &v122);
            }
            validouble d = -[RBDecodedFontMetadata fontUID]((uint64_t)v9);
            if ((v56 & 0x80000000) != 0)
            {
              validouble d = RB::Device::valid_texture_size_nonnative(valid, v56, *(int32x2_t *)&v87);
              if ((valid & 1) == 0) {
                goto LABEL_63;
              }
            }
            else
            {
              v59 = (const float *)(valid + 288);
              int32x2_t v60 = (int32x2_t)vld1_dup_f32(v59);
              uint32x2_t v61 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v60, *(int32x2_t *)&v87), (int8x8_t)vcgtz_s32(*(int32x2_t *)&v87));
              if ((vpmin_u32(v61, v61).u32[0] & 0x80000000) == 0)
              {
LABEL_63:
                v62 = RB::error_log((RB *)valid);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                {
                  v64 = RB::pixel_format_name((RB *)v56, v63);
                  [(RBLayer *)(uint64_t)v64 displayWithBounds:v62 callback:v87];
                }
                BOOL v8 = 0;
LABEL_105:

                goto LABEL_106;
              }
            }
            *(void *)&v133.CGFloat a = (char *)self + 32;
            LOBYTE(v133.b) = 1;
            os_unfair_lock_lock((os_unfair_lock_t)self + 8);
            if (v14)
            {
              if (v42) {
                unsigned __int32 v67 = 7;
              }
              else {
                unsigned __int32 v67 = 3;
              }
              if (v83 && *((void *)self + 10)) {
                v67 |= 8u;
              }
              v68 = self;
              v113[0] = (void (*)(void, void))MEMORY[0x263EF8330];
              v113[1] = (void (*)(void, void))3321888768;
              v113[2] = (void (*)(void, void))__38__RBLayer_displayWithBounds_callback___block_invoke;
              v113[3] = (void (*)(void, void))&__block_descriptor_85_e8_32c29_ZTSN2RB8objc_ptrIP7RBLayerEE_e9_v16__0_v8l;
              v80 = v68;
              id v114 = v68;
              int v120 = RotationFlags;
              double v115 = x;
              double v116 = y;
              CGFloat v117 = width;
              double v118 = height;
              double v119 = v88;
              char v121 = (v67 & 8) >> 3;
              if (!*((void *)self + 17)) {
                operator new();
              }
              v69 = (RB::Device *)-[RBDecodedFontMetadata fontUID]((uint64_t)v9);
              v70 = (os_unfair_lock_s *)RB::Device::shared_surfaces(v69);
              float v71 = v88;
              uint64_t v72 = RB::SharedSurfaceGroup::add_subsurface(v70, *((atomic_uint **)self + 17), v56, HIBYTE(v123), v122, v30, v67, v113, COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v87, (int32x2_t)0x200000002)), v71, v86);
              if (v72)
              {
                if ((v67 & 8) != 0) {
                  *((void *)self + 9) = v72;
                }
                -[RBLayer updateColor](self);
                std::unique_lock<RB::spin_lock>::unlock((uint64_t)&v133);
                RBXMLRecorderMarkFrame(self, v30, HIBYTE(v123), (double)SLODWORD(v87), (double)SHIDWORD(v87));
                id v73 = v114;
LABEL_102:

                if (LOBYTE(v133.b)) {
                  os_unfair_lock_unlock(*(os_unfair_lock_t *)&v133.a);
                }
                BOOL v8 = 1;
                goto LABEL_105;
              }
            }
            -[RBLayer _clearSubsurface]((uint64_t)self);
            ensure_drawable_locked(self);
            v74 = (void *)*((void *)self + 7);
            if (v74)
            {
              [v74 contentsScale];
              if (v75 != v88)
              {
                [*((id *)self + 7) setContentsScale:v88];
                int v83 = 0;
              }
            }
            else
            {
              v76 = -[RBImageQueueLayer initWithSlots:]([RBImageQueueLayer alloc]);

              *((void *)self + 7) = v76;
              [v76 setContentsScale:v88];
              [(RBLayer *)self insertSublayer:*((void *)self + 7) atIndex:0];
              int v83 = 0;
            }
            objc_msgSend(*((id *)self + 7), "setPosition:", x, y);
            [*((id *)self + 7) setAllowsDisplayCompositing:v13];
            if ((v13 & 1) == 0 && [(RBLayer *)self contentsAreFlipped]) {
              v122 |= 0x80u;
            }
            v80 = self;
            id v73 = *((id *)self + 7);
            v77 = (atomic_uint *)*((void *)self + 6);
            if (v77) {
              atomic_fetch_add_explicit(v77 + 2, 1u, memory_order_relaxed);
            }
            -[RBLayer updateColor](self);
            std::unique_lock<RB::spin_lock>::unlock((uint64_t)&v133);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3321888768;
            block[2] = __38__RBLayer_displayWithBounds_callback___block_invoke_28;
            block[3] = &unk_26C4EF030;
            double v94 = v87;
            char v108 = v13 ^ 1;
            id v95 = v73;
            id v96 = v9;
            unint64_t v97 = v56;
            char v109 = HIBYTE(v123);
            int v103 = v122;
            id v98 = v80;
            if (v77) {
              atomic_fetch_add_explicit(v77 + 2, 1u, memory_order_relaxed);
            }
            v99 = v77;
            double v100 = v88;
            char v110 = v123;
            uint64_t v104 = v129;
            int v105 = v82;
            char v111 = v84;
            __n128 v92 = v86;
            char v112 = v83;
            int v106 = v81;
            int v107 = RotationFlags;
            id v101 = v30;
            v93 = self;
            double v102 = v87;
            RB::Drawable::begin_frame((RB::Drawable *)v77);
            if (v83) {
              dispatch_async((dispatch_queue_t)[(RBDevice *)v9 queue], block);
            }
            else {
              dispatch_sync((dispatch_queue_t)[(RBDevice *)v9 queue], block);
            }

            v78 = v99;
            if (v99 && atomic_fetch_add_explicit(v99 + 2, 0xFFFFFFFF, memory_order_release) == 1)
            {
              __dmb(9u);
              (*(void (**)(atomic_uint *))(*(void *)v78 + 8))(v78);
            }

            if (v77 && atomic_fetch_add_explicit(v77 + 2, 0xFFFFFFFF, memory_order_release) == 1)
            {
              __dmb(9u);
              (*(void (**)(atomic_uint *))(*(void *)v77 + 8))(v77);
            }
            goto LABEL_102;
          }
          [(RBLayer *)self setContents:0];
          BOOL v8 = 1;
LABEL_106:

          return v8;
        }
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
      }
      BOOL v8 = 0;
      goto LABEL_106;
    }
  }
  return 0;
}

uint64_t __18__RBLayer_display__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawInDisplayList:a2];
}

- (void)updateColor
{
  if (a1)
  {
    {
      unsigned int v4 = (unsigned __int16)RB::debug_BOOL((RB *)"RB_COLOR_LAYERS", v3);
      if (v4 <= 0x100) {
        LOBYTE(v4) = 0;
      }
      -[RBLayer updateColor]::color_layers = v4 != 0;
    }
    if (-[RBLayer updateColor]::color_layers && pthread_main_np())
    {
      {
        -[RBLayer updateColor]::queue_color = (uint64_t)CGColorCreateSRGB(1.0, 0.0, 0.5, 1.0);
      }
      {
        -[RBLayer updateColor]::shared_color = (uint64_t)CGColorCreateSRGB(0.5, 0.0, 1.0, 1.0);
      }
      {
        -[RBLayer updateColor]::empty_color = (uint64_t)CGColorCreateSRGB(0.0, 1.0, 0.5, 1.0);
      }
      if (a1[7])
      {
        v2 = &-[RBLayer updateColor]::queue_color;
      }
      else
      {
        v2 = &-[RBLayer updateColor]::shared_color;
        if (!a1[9] && !a1[10]) {
          v2 = &-[RBLayer updateColor]::empty_color;
        }
      }
      [a1 setBorderColor:*v2];
      [a1 setBorderWidth:1.0];
    }
  }
}

- (BOOL)rendersAsynchronously
{
  return *((unsigned char *)self + 174);
}

- (BOOL)promotesFramebuffer
{
  return *((unsigned char *)self + 176);
}

- (unint64_t)pixelFormat
{
  return *((void *)self + 23);
}

- (void)drawInDisplayList:(id)a3
{
  v5 = (void *)[(RBLayer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 RBLayer:self draw:a3];
  }
}

- (void)display
{
  v4.receiver = self;
  v4.super_class = (Class)RBLayer;
  [(RBLayer *)&v4 setContents:0];
  if (*((unsigned char *)self + 169) && !+[RBDevice isRunningInBackground])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __18__RBLayer_display__block_invoke;
    v3[3] = &unk_2641F8D68;
    v3[4] = self;
    [(RBLayer *)self bounds];
    -[RBLayer displayWithBounds:callback:](self, "displayWithBounds:callback:", v3);
  }
  else
  {
    *((unsigned char *)self + 170) = 1;
  }
}

- (int)colorMode
{
  return *((_DWORD *)self + 45);
}

- (BOOL)clearsBackground
{
  return *((unsigned char *)self + 177);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float v2 = *((float *)self + 50);
  float v3 = *((float *)self + 51);
  float v4 = *((float *)self + 52);
  float v5 = *((float *)self + 53);
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)allowsPackedDrawable
{
  return *((unsigned char *)self + 178);
}

- (BOOL)allowsBottomLeftOrigin
{
  return *((unsigned char *)self + 179);
}

- (void)_clearSubsurface
{
  if (a1)
  {
    float v2 = (RB::SharedSubsurface *)(a1 + 80);
    if (*(void *)v2)
    {
      RB::SharedSubsurface::reset(v2);
      *(void *)(a1 + 72) = 0;
      *(unsigned char *)(a1 + 175) = 1;
      [*(id *)(a1 + 64) removeFromSuperlayer];

      *(void *)(a1 + 64) = 0;
    }
  }
}

- (int64_t)maxDrawableCount
{
  return *((void *)self + 24);
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  *((unsigned char *)self + 174) = a3;
}

- (void)setAllowsPackedDrawable:(BOOL)a3
{
  *((unsigned char *)self + 178) = a3;
}

- (RBLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)RBLayer;
  float v2 = [(RBLayer *)&v5 init];
  float v3 = v2;
  if (v2) {
    -[RBLayer rb_init]((uint64_t)v2);
  }
  return v3;
}

- (void)rb_init
{
  if (a1)
  {
    *(_DWORD *)(a1 + 180) = 0;
    *(void *)(a1 + 184) = 0;
    *(unsigned char *)(a1 + 176) = 1;
    *(unsigned char *)(a1 + 177) = 1;
    *(void *)(a1 + 200) = 0;
    *(void *)(a1 + 208) = 0;
    *(unsigned char *)(a1 + 175) = 1;
    *(void *)(a1 + 192) = 3;
    *(unsigned char *)(a1 + 178) = 1;
    *(void *)(a1 + 152) = 0x3FB999999999999ALL;
    os_unfair_lock_lock((os_unfair_lock_t)v2);
    uint64_t v3 = *(void *)(v2 + 16);
    if (*(void *)(v2 + 24) < (unint64_t)(v3 + 1))
    {
      RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(v2 + 8, v3 + 1);
      uint64_t v3 = *(void *)(v2 + 16);
    }
    *(void *)(*(void *)(v2 + 8) + 8 * v3) = a1;
    ++*(void *)(v2 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
}

- (void)setColorMode:(int)a3
{
  *((_DWORD *)self + 45) = a3;
  *((void *)self + 23) = 0;
}

- (void)setMaxDrawableCount:(int64_t)a3
{
  unint64_t v3 = 2;
  if (a3 > 2) {
    unint64_t v3 = a3;
  }
  if (v3 >= 3) {
    unint64_t v3 = 3;
  }
  *((void *)self + 24) = v3;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  if (*((unsigned char *)self + 169) && *((void *)self + 7))
  {
    [(RBLayer *)self bounds];
    double v10 = v9;
    double v12 = v11;
    os_unfair_lock_unlock(v8);
    if (width != v10 || height != v12)
    {
      [(RBLayer *)self setNeedsSynchronousUpdate:1];
      [(RBLayer *)self setNeedsDisplay];
    }
  }
  else
  {
    os_unfair_lock_unlock(v8);
  }
  v13.receiver = self;
  v13.super_class = (Class)RBLayer;
  -[RBLayer setBounds:](&v13, sel_setBounds_, x, y, width, height);
}

RB::Surface *__38__RBLayer_displayWithBounds_callback___block_invoke_2(uint64_t a1, MTLPixelFormat a2)
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 result = *(RB::Surface **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result
    || ((uint64_t v4 = *(void *)(a1 + 40)) == 0 || (v5 = *(void *)(v4 + 32)) == 0
      ? (objc_super v6 = 0)
      : (objc_super v6 = *(_CAImageQueue **)(v5 + 8)),
        v7 = (os_unfair_lock_s *)RB::SurfacePool::shared(0),
        uint64_t v8 = -[RBDecodedFontMetadata fontUID](*(void *)(a1 + 48)),
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = RB::SurfacePool::alloc(v7, v8, *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 84), *(_DWORD *)(a1 + 80), v6, *(int32x2_t *)(a1 + 56), (int8x8_t)vsub_s32(*(int32x2_t *)(a1 + 56), *(int32x2_t *)(a1 + 72))), ($C28CD4A45FD07A4F97CC9D5F91F25271 result = *(RB::Surface **)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) != 0))
  {
    return (RB::Surface *)RB::Surface::texture(result, a2);
  }
  return result;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 13) = 0;
  *((unsigned char *)self + 168) = 0;
  return self;
}

void __38__RBLayer_displayWithBounds_callback___block_invoke(uint64_t a1, int32x2_t *a2)
{
  -[RBLayer setSubsurface:rotated:bounds:contentsScale:locked:](*(void *)(a1 + 32), a2, *(_DWORD *)(a1 + 80) != 0, a1 + 40, *(unsigned char *)(a1 + 84) == 0, *(double *)(a1 + 72));
}

- (void)setSubsurface:(int)a3 rotated:(uint64_t)a4 bounds:(char)a5 contentsScale:(double)a6 locked:
{
  if (a1)
  {
    if (a5)
    {
      double v12 = 0;
    }
    else
    {
      double v12 = (os_unfair_lock_s *)(a1 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    }
    *(void *)(a1 + 72) = 0;
    -[RBLayer _updateSubsurface:](a1, a2);
    uint64_t v13 = *(void *)(a1 + 80);
    if (v13)
    {
      BOOL v14 = *(RB::SharedSurfaceGroup **)(v13 + 16);
      if (v14) {
        RB::SharedSurfaceGroup::schedule_updates(v14);
      }
    }
    float64x2_t v24 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_2142181C0, *(double *)a4), (float64x2_t)xmmword_2142181D0, *(double *)(a4 + 8));
    if (a3)
    {
      int v15 = [(id)a1 contentsAreFlipped];
      long long v16 = *(_OWORD *)(a4 + 16);
      if (v15)
      {
        float64x2_t v17 = (float64x2_t)xmmword_2142181C0;
        float64x2_t v18 = (float64x2_t)xmmword_2142181D0;
        float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v16, 0);
        float64x2_t v20 = v24;
      }
      else
      {
        float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v16, 0);
        float64x2_t v20 = vmlaq_n_f64(vmlaq_n_f64(v24, (float64x2_t)xmmword_2142181C0, *(double *)&v16), (float64x2_t)xmmword_2142181D0, *((double *)&v16 + 1));
        float64x2_t v17 = (float64x2_t)xmmword_21421A370;
        float64x2_t v18 = (float64x2_t)xmmword_21421A380;
      }
      float64x2_t v24 = vmlaq_f64(vmlaq_f64(v20, (float64x2_t)0, v18), v17, v19);
      objc_msgSend(*(id *)(a1 + 64), "setContentsScale:", a6, vnegq_f64(v17), *(_OWORD *)&v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "setContentsScale:", a6, 0, 0x3FF0000000000000, 0x3FF0000000000000, 0);
    }
    v21 = *(void **)(a1 + 64);
    v25[0] = v23;
    v25[1] = v22;
    v25[2] = v24;
    [v21 setAffineTransform:v25];
    if ((a5 & 1) == 0) {
      os_unfair_lock_unlock(v12);
    }
  }
}

- (uint64_t)_updateSubsurface:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = (int32x2_t *)result;
    if (!*(void *)(result + 80) || a2[6].i32[0] - *(_DWORD *)(result + 128) >= 0)
    {
      uint64_t v4 = *(void **)(result + 56);
      if (v4)
      {
        [v4 removeFromSuperlayer];

        v3[7] = 0;
      }
      if (&v3[10] != a2)
      {
        RB::SharedSubsurface::~SharedSubsurface((id *)&v3[10]);
        int32x2_t *v5 = *a2;
        v5[1] = a2[1];
        v5[2] = a2[2];
        v5[3] = 0;
        v5[6].i32[0] = a2[6].i32[0];
        v5[6].i8[4] = a2[6].i8[4];
        *a2 = 0;
      }
      RB::SharedSurfaceTimestamp::attach((uint64_t)&v3[13], (id)[(int32x2_t *)v3 context]);
      if (!*(void *)&v3[8])
      {
        uint64_t v6 = objc_opt_new();

        v3[8] = (int32x2_t)v6;
        [(int32x2_t *)v3 addSublayer:*(void *)&v3[8]];
      }
      if (v3[10])
      {
        uint64_t v7 = *(void *)(*(void *)&v3[10] + 32);
        v8.i64[0] = (int)v7;
        v8.i64[1] = SHIDWORD(v7);
        float64x2_t v9 = vcvtq_f64_s64(v8);
      }
      else
      {
        float64x2_t v9 = 0uLL;
      }
      __asm { FMOV            V1.2D, #1.0 }
      float64x2_t v15 = vdivq_f64(_Q1, v9);
      *(int32x2_t *)&_Q1.f64[0] = vadd_s32(v3[11], (int32x2_t)0x100000001);
      v16.i64[0] = SLODWORD(_Q1.f64[0]);
      v16.i64[1] = SHIDWORD(_Q1.f64[0]);
      float64x2_t v17 = vmulq_f64(v15, vcvtq_f64_s64(v16));
      *(int32x2_t *)&_Q1.f64[0] = vadd_s32(v3[12], (int32x2_t)0x100000001);
      v16.i64[0] = SLODWORD(_Q1.f64[0]);
      v16.i64[1] = SHIDWORD(_Q1.f64[0]);
      float64x2_t v21 = v17;
      if (([(int32x2_t *)v3 contentsAreFlipped] & 1) == 0)
      {
        v18.f64[0] = v21.f64[0];
        v18.f64[1] = 1.0 - COERCE_DOUBLE(*(void *)&vaddq_f64(v21, v20).f64[1]);
        float64x2_t v21 = v18;
      }
      [*(id *)&v3[8] setContents:RB::SharedSubsurface::contents((RB::SharedSubsurface *)&v3[10])];
      float64x2_t v19 = (void *)v3[8];
      return objc_msgSend(v19, "setContentsRect:", *(_OWORD *)&v21, *(_OWORD *)&v20);
    }
  }
  return result;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (*((unsigned char *)self + 170) && !+[RBDevice isRunningInBackground])
    {
      [(RBLayer *)self setNeedsSynchronousUpdate:1];
      [(RBLayer *)self setNeedsDisplay];
      *((unsigned char *)self + 170) = 0;
    }
  }
  else if (!*((unsigned char *)self + 171))
  {
    operator new();
  }
  *((unsigned char *)self + 169) = v3;
  v5.receiver = self;
  v5.super_class = (Class)RBLayer;
  [(RBLayer *)&v5 layerDidBecomeVisible:v3];
}

- (RBLayer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  BOOL v3 = [(RBLayer *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3) {
    -[RBLayer rb_init]((uint64_t)v3);
  }
  return v4;
}

- (RBLayer)initWithLayer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RBLayer;
  uint64_t v4 = -[RBLayer initWithLayer:](&v9, sel_initWithLayer_);
  objc_super v5 = v4;
  if (v4)
  {
    objc_super v6 = (void *)*((void *)a3 + 5);
    uint64_t v7 = (void *)*((void *)v4 + 5);
    if (v7 != v6)
    {

      *((void *)v5 + 5) = v6;
    }
    *((unsigned char *)v5 + 174) = *((unsigned char *)a3 + 174);
    *((_DWORD *)v5 + 45) = *((_DWORD *)a3 + 45);
    *((void *)v5 + 23) = 0;
    *((unsigned char *)v5 + 176) = *((unsigned char *)a3 + 176);
    *((unsigned char *)v5 + 177) = *((unsigned char *)a3 + 177);
    *(_OWORD *)((char *)v5 + 200) = *(_OWORD *)((char *)a3 + 200);
    *((void *)v5 + 24) = *((void *)a3 + 24);
    *((unsigned char *)v5 + 178) = *((unsigned char *)a3 + 178);
    *((unsigned char *)v5 + 179) = *((unsigned char *)a3 + 179);
  }
  return v5;
}

- (void)dealloc
{
  os_unfair_lock_lock((os_unfair_lock_t)v3);
  uint64_t v4 = *(RBLayer ***)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  objc_super v6 = v4;
  if (v5)
  {
    uint64_t v7 = 8 * v5;
    objc_super v6 = *(RBLayer ***)(v3 + 8);
    while (*v6 != self)
    {
      ++v6;
      v7 -= 8;
      if (!v7)
      {
        objc_super v6 = &v4[v5];
        break;
      }
    }
  }
  uint64_t v8 = v6 - v4;
  if (v8 != v5)
  {
    objc_super v9 = &v4[v5];
    double v10 = v4[v8];
    v4[v8] = *(v9 - 1);
    *(v9 - 1) = v10;
    --*(void *)(v3 + 16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v3);
  double v12 = (os_unfair_lock_s *)RB::SurfacePool::shared(v11);
  RB::SurfacePool::unwatch_queues(v12, (CALayer *)self);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  *((unsigned char *)self + 168) = 1;
  uint64_t v13 = *((void *)self + 6);
  if (v13) {
    RB::Drawable::set_delegate(v13, 0);
  }
  uint64_t v14 = *((void *)self + 17);
  if (v14) {
    *(void *)(v14 + 16) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
  v15.receiver = self;
  v15.super_class = (Class)RBLayer;
  [(RBLayer *)&v15 dealloc];
}

- (void)setDevice:(id)a3
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  id v6 = (id)*((void *)self + 5);
  if (v6 != a3)
  {

    *((void *)self + 5) = a3;
  }
  os_unfair_lock_unlock(v5);
}

- (RBDevice)device
{
  uint64_t v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  uint64_t v4 = (RBDevice *)*((id *)self + 5);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (BOOL)isDrawableAvailable
{
  if (+[RBDevice isRunningInBackground]) {
    return 0;
  }
  uint64_t v4 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  BOOL v3 = [(RBLayer *)self needsSynchronousUpdate]
    || !*((void *)self + 7)
    || CAImageQueueCollect() != 0;
  os_unfair_lock_unlock(v4);
  return v3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  if (RB::pixel_format_traits(a3, (MTLPixelFormat)a2)[3]) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = 0;
  }
  *((void *)self + 23) = v5;
}

void __38__RBLayer_displayWithBounds_callback___block_invoke_28(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  BOOL v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  int32x2_t v3 = *(int32x2_t *)(a1 + 56);
  v1.i8[0] = *(unsigned char *)(a1 + 152);
  uint64_t v4 = (void *)MEMORY[0x21669B110]();
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3321888768;
  int32x2_t v31 = __38__RBLayer_displayWithBounds_callback___block_invoke_2;
  uint32x2_t v32 = &unk_26C4E8738;
  int8x8_t v33 = &v41;
  id v34 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 72);
  v6.i32[0] = 0;
  double v7 = COERCE_DOUBLE(vbsl_s8(vdup_lane_s8(vceq_s8(v1, v6), 0), (int8x8_t)v3, (int8x8_t)(*(void *)&vadd_s32(v3, (int32x2_t)0x1F0000001FLL) & 0xFFFFFFE0FFFFFFE0)));
  id v35 = v5;
  double v36 = v7;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v37 = *(void *)(a1 + 80);
  char v40 = *(unsigned char *)(a1 + 153);
  int v39 = *(_DWORD *)(a1 + 128);
  uint64_t v38 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v8 + 172) && (((void (*)(void *))v31)(v30), !v42[3]))
  {
    RB::Drawable::cancel_frame(*(RB::Drawable **)(a1 + 96));
  }
  else
  {
    objc_super v9 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(void *)(a1 + 72));
    RB::RenderFrame::RenderFrame((RB::RenderFrame *)v45, v9, *(RB::Drawable **)(a1 + 96), 1u);
    uint64_t v10 = *(void *)(a1 + 80);
    double v11 = *(double *)(a1 + 104);
    char v12 = *(unsigned char *)(a1 + 153);
    char v13 = *(unsigned char *)(a1 + 154);
    char v14 = *(unsigned char *)(a1 + 132);
    char HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(a1 + 140));
    float v16 = v11;
    RB::RenderParams::RenderParams((uint64_t)&v27, (uint64_t)v45, v10, v12, v13, v14, HasExtendedRange, v7, v16);
    char v29 = (v29 & 0xF3 | (4 * *(unsigned char *)(a1 + 155)) | (2 * *(unsigned char *)(a1 + 128)) & 8) ^ 4;
    float64x2_t v17 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 112), "_rb_contents");
    if (!v17) {
      float64x2_t v17 = (const RB::DisplayList::Contents *)RB::DisplayList::Contents::empty_contents(0);
    }
    RB::DisplayList::render(v17, &v27, (uint64_t)v30, *(_DWORD *)(a1 + 144), 0, 0, v28, *(__n128 *)(a1 + 32));
    if ((*(unsigned char *)(v45[0] + 292) & 2) != 0)
    {
      id v18 = *(id *)(a1 + 112);
      if (v46 != v18)
      {

        id v46 = v18;
      }
    }
    RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v45);
  }

  uint64_t v19 = *(void *)(a1 + 64);
  if (v19 && (uint64_t v20 = *(void *)(v19 + 32)) != 0) {
    float64x2_t v21 = *(_CAImageQueue **)(v20 + 8);
  }
  else {
    float64x2_t v21 = 0;
  }
  long long v22 = (RB::Surface *)v42[3];
  if (v22)
  {
    long long v22 = (RB::Surface *)RB::Surface::queue_id(v22, v21);
    if (v22) {
      operator new();
    }
  }
  long long v23 = (os_unfair_lock_s *)RB::SurfacePool::shared(v22);
  float64x2_t v24 = (RB::Surface *)v42[3];
  if (v24)
  {
    RB::SurfacePool::dealloc(v23, v24, v21);
  }
  else
  {
    RB::SurfacePool::watch_queue(v23, (CALayer *)v21, *(CALayer **)(a1 + 88));
    *(unsigned char *)(*(void *)(a1 + 88) + 172) = 1;
  }
  float64x2_t v26 = (os_unfair_lock_s *)RB::SurfacePool::shared(v25);
  RB::SurfacePool::collect_async(v26);
  RBXMLRecorderMarkFrame(*(const void **)(a1 + 48), *(void **)(a1 + 112), *(unsigned __int8 *)(a1 + 153), (double)(int)*(void *)(a1 + 120), (double)(int)HIDWORD(*(void *)(a1 + 120)));
  _Block_object_dispose(&v41, 8);
}

- (BOOL)_willMoveSubsurface:(unsigned int)a3
{
  id v5 = (os_unfair_lock_s *)((char *)self + 32);
  BOOL v6 = os_unfair_lock_trylock((os_unfair_lock_t)self + 8);
  if (v6)
  {
    if ((*((unsigned char *)self + 168) & 1) != 0 || *((_DWORD *)self + 32) != a3)
    {
      os_unfair_lock_unlock(v5);
      LOBYTE(v6) = 0;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (void)_moveSubsurface:(void *)a3
{
  -[RBLayer _updateSubsurface:]((uint64_t)self, (int32x2_t *)a3);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
}

- (void)waitUntilAsyncRenderingCompleted
{
  if (!pthread_main_np() && (*((unsigned char *)self + 168) & 1) == 0) {
    RB::precondition_failure((RB *)"%s may only be called on main thread", v3, "-[RBLayer waitUntilAsyncRenderingCompleted]");
  }
  uint64_t v4 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  uint64_t v5 = *((void *)self + 9);
  if (v5) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v5 + 8), 1u, memory_order_relaxed);
  }
  BOOL v6 = (atomic_uint *)*((void *)self + 6);
  if (v6) {
    atomic_fetch_add_explicit(v6 + 2, 1u, memory_order_relaxed);
  }
  os_unfair_lock_unlock(v4);
  if (v5) {
    RB::SharedSurfaceGroup::finish_async(*(os_unfair_lock_s **)(v5 + 16));
  }
  if (v6
    && (RB::Drawable::finish((intptr_t)v6), atomic_fetch_add_explicit(v6 + 2, 0xFFFFFFFF, memory_order_release) == 1))
  {
    __dmb(9u);
    (*(void (**)(atomic_uint *))(*(void *)v6 + 8))(v6);
    if (!v5) {
      return;
    }
  }
  else if (!v5)
  {
    return;
  }
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(v5 + 8), 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    double v7 = *(void (**)(uint64_t))(*(void *)v5 + 8);
    v7(v5);
  }
}

- (void)setContents:(id)a3
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  BOOL v6 = (void *)*((void *)self + 7);
  *((void *)self + 7) = 0;
  -[RBLayer _clearSubsurface]((uint64_t)self);
  *((unsigned char *)self + 170) = 0;
  -[RBLayer updateColor](self);
  os_unfair_lock_unlock(v5);
  [v6 removeFromSuperlayer];
  v7.receiver = self;
  v7.super_class = (Class)RBLayer;
  [(RBLayer *)&v7 setContents:a3];
}

+ (void)willEnterForeground
{
  v0 = (_anonymous_namespace_::AllLayers *)self;
  char v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)v1);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t v4 = 8 * v2;
    do
    {
      uint64_t v5 = *(unsigned char **)v3;
      if (*(unsigned char *)(*(void *)v3 + 169) && v5[170])
      {
        BOOL v6 = v5;
        unint64_t v7 = v14;
        if (v15 < v14 + 1)
        {
          RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)&v13, v14 + 1);
          unint64_t v7 = v14;
        }
        uint64_t v8 = v13;
        v8[v7] = v6;
        ++v14;
      }
      v3 += 8;
      v4 -= 8;
    }
    while (v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v1);
  objc_super v9 = v13;
  if (v14)
  {
    uint64_t v10 = 8 * v14;
    do
    {
      [*v9 setNeedsSynchronousUpdate:1];
      [*v9 setNeedsDisplay];
      double v11 = *v9++;
      v11[170] = 0;
      v10 -= 8;
    }
    while (v10);
    objc_super v9 = v13;
    if (v14)
    {
      for (unint64_t i = 0; i < v14; ++i)

      objc_super v9 = v13;
    }
  }
  if (v9) {
    free(v9);
  }
}

void __33__RBLayer_layerDidBecomeVisible___block_invoke(uint64_t a1)
{
  WeakRetainedouble d = (unsigned __int8 *)objc_loadWeakRetained(*(id **)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x263F158F8] lock];
    WeakRetained[171] = 0;
    int v3 = WeakRetained[169];
    [MEMORY[0x263F158F8] unlock];
    if (!v3)
    {
      [WeakRetained setContents:0];
      WeakRetained[170] = 1;
    }
  }
  uint64_t v4 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_destroyWeak(v4);
    MEMORY[0x21669AC10](v4, 0x80C40B8603338);
  }
}

- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4
{
  BOOL v6 = self;
  unint64_t v7 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  *((void *)v6 + 18) = a3;
  *((double *)v6 + 19) = a4;
  uint64_t v8 = (os_unfair_lock_s *)*((void *)v6 + 6);
  if (v8) {
    atomic_fetch_add_explicit((atomic_uint *volatile)&v8[2], 1u, memory_order_relaxed);
  }
  if (a3)
  {
    if (!*((void *)v6 + 20)) {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(v7);
  if (v8)
  {
    RB::Drawable::reset_statistics(v8, a3, a4);
    RB::Drawable::set_delegate((uint64_t)v8, (uint64_t)v6);
    if (atomic_fetch_add_explicit((atomic_uint *volatile)&v8[2], 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      objc_super v9 = *(void (**)(os_unfair_lock_s *))(*(void *)&v8->_os_unfair_lock_opaque + 8);
      v9(v8);
    }
  }
}

- (NSDictionary)statistics
{
  int v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  uint64_t v4 = (os_unfair_lock_s *)*((void *)self + 6);
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)&v4[2], 1u, memory_order_relaxed);
    os_unfair_lock_unlock(v3);
    RB::Drawable::statistics(v4, v7);
    uint64_t v5 = (NSDictionary *)RB::Drawable::Statistics::dictionary((RB::Drawable::Statistics *)v7);
    if (atomic_fetch_add_explicit((atomic_uint *volatile)&v4[2], 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(os_unfair_lock_s *))(*(void *)&v4->_os_unfair_lock_opaque + 8))(v4);
    }
  }
  else
  {
    os_unfair_lock_unlock(v3);
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v5;
}

- (id)statisticsHandler
{
  int v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  uint64_t v4 = (void *)*((void *)self + 20);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setStatisticsHandler:(id)a3
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  if (*((id *)self + 20) != a3)
  {
    uint64_t v6 = [a3 copy];

    *((void *)self + 20) = v6;
  }
  unint64_t v7 = (atomic_uint *)*((void *)self + 6);
  if (v7) {
    atomic_fetch_add_explicit(v7 + 2, 1u, memory_order_relaxed);
  }
  uint64_t v8 = *((void *)self + 18);
  os_unfair_lock_unlock(v5);
  if (v7)
  {
    BOOL v9 = !v8 || a3 == 0;
    uint64_t v10 = v9 ? 0 : self;
    RB::Drawable::set_delegate(*((void *)self + 6), (uint64_t)v10);
    if (atomic_fetch_add_explicit(v7 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      double v11 = *(void (**)(atomic_uint *))(*(void *)v7 + 8);
      v11(v7);
    }
  }
}

- (void)_RBDrawableStatisticsDidChange
{
  int v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  id v4 = (id)*((void *)self + 20);
  if (v4)
  {

    id v4 = v4;
    os_unfair_lock_unlock(v3);
    if (v4) {
      (*((void (**)(id, RBLayer *))v4 + 2))(v4, self);
    }
  }
  else
  {
    os_unfair_lock_unlock(v3);
  }
}

- (void)copyImageInRect:(CGRect)a3 options:(id)a4 completionQueue:(id)a5 handler:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (+[RBDevice isRunningInBackground])
  {
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke;
    v75[3] = &unk_2641F8578;
    v75[4] = a6;
    unint64_t v14 = v75;
LABEL_19:
    dispatch_async((dispatch_queue_t)a5, v14);
    return;
  }
  unint64_t v15 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImageScale];
  if (!v15 || ([v15 doubleValue], double v17 = v16, v16 <= 0.0))
  {
    [(RBLayer *)self contentsScale];
    double v17 = v18;
  }
  double v19 = ceil(v17 * width);
  if (v19 <= 0.0 || (double v20 = ceil(v17 * height), v20 <= 0.0))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2;
    block[3] = &unk_2641F8578;
    void block[4] = a6;
    unint64_t v14 = block;
    goto LABEL_19;
  }
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  float64x2_t v21 = current_device_locked(self);
  if (v21 && (0, (long long v22 = v21) != 0))
  {
    ensure_drawable_locked(self);
    long long v23 = (atomic_uint *)*((void *)self + 6);
    if (v23) {
      atomic_fetch_add_explicit(v23 + 2, 1u, memory_order_relaxed);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
    int8x16_t v54 = v23;
    uint64_t v24 = [(RBLayer *)self colorMode];
    float64x2_t v25 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImageColorMode];
    if (v25) {
      uint64_t v24 = [v25 intValue];
    }
    RB::ColorMode::ColorMode(&v72, v24);
    float64x2_t v26 = objc_opt_new();
    [v26 setProfile:2];
    [v26 setDefaultColorSpace:rb_color_space(((v72 & 0x100000000) == 0) | 0x100u)];
    objc_msgSend(v26, "setContentRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v19, v20);
    *(double *)float v71 = v17;
    v71[1] = 0;
    v71[2] = 0;
    *(double *)&v71[3] = v17;
    *(CGFloat *)&v71[4] = x;
    *(CGFloat *)&v71[5] = y;
    [v26 concat:v71];
    [(RBLayer *)self drawInDisplayList:v26];
    uint64_t v27 = objc_msgSend(v26, "_rb_contents");
    if (v27)
    {
      int v28 = RB::DisplayList::Layer::output_depth((RB::DisplayList::Layer *)(v27 + 320));
      LOBYTE(v72) = RB::max_color_depth(v72, v28);
    }
    char v29 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImageOpaque];
    if (v29) {
      int v30 = [v29 BOOLValue];
    }
    else {
      int v30 = [(RBLayer *)self isOpaque];
    }
    int v31 = v30;
    uint32x2_t v32 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImagePromotesFramebuffer];
    if (v32) {
      int v33 = [v32 BOOLValue];
    }
    else {
      int v33 = [(RBLayer *)self promotesFramebuffer];
    }
    if (v31) {
      int v34 = 8;
    }
    else {
      int v34 = 9;
    }
    if (v33) {
      int v35 = v34;
    }
    else {
      int v35 = v34 | 0x20;
    }
    double v36 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImageClearsBackground];
    if (v36) {
      int v37 = [v36 BOOLValue];
    }
    else {
      int v37 = [(RBLayer *)self clearsBackground];
    }
    if (v37)
    {
      uint64_t v38 = (void *)[a4 objectForKeyedSubscript:RBLayerCopyImageClearColor];
      if (v38)
      {
        [v38 getValue:v70 size:16];
        unsigned int v39 = v70[0];
        unsigned int v40 = v70[1];
        __int32 v41 = v70[2];
        float v42 = *(float *)&v70[3];
      }
      else
      {
        [(RBLayer *)self clearColor];
      }
      __asm { FMOV            V4.4S, #1.0 }
      _Q4.i64[0] = __PAIR64__(v40, v39);
      _Q4.i32[2] = v41;
      float32x4_t v53 = vmulq_n_f32(_Q4, v42);
      int v43 = 2;
    }
    else
    {
      int v43 = 0;
      float32x4_t v53 = 0u;
    }
    id v49 = a5;
    v50 = (void *)[a6 copy];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3321888768;
    v55[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4;
    v55[3] = &__block_descriptor_133_e16_48c30_ZTSN2RB8objc_ptrIP8RBDeviceEE72c61_ZTSN2RB8objc_ptrIPU28objcproto17OS_dispatch_queue8NSObjectEE80c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE88c40_ZTSN2RB14refcounted_ptrINS_8DrawableEEE104c36_ZTSN2RB8objc_ptrIP13RBDisplayListEE_e5_v8__0l;
    id v57 = v22;
    uint64_t v65 = v72;
    int v66 = v35;
    double v58 = v19;
    double v59 = v20;
    id v60 = v49;
    id v61 = v50;
    if (v54) {
      atomic_fetch_add_explicit(v54 + 2, 1u, memory_order_relaxed);
    }
    v62 = v54;
    double v63 = v17;
    int v67 = v24;
    char v69 = v31;
    id v64 = v26;
    int v68 = v43;
    float32x4_t v56 = v53;
    RB::Drawable::begin_frame((RB::Drawable *)v54);
    dispatch_async((dispatch_queue_t)[(RBDevice *)v22 queue], v55);
    int v51 = RB::ColorMode::output_space((RB::ColorMode *)&v72);
    RBXMLRecorderMarkFrame(self, v26, v51, v19, v20);

    float32x4_t v52 = v62;
    if (v62 && atomic_fetch_add_explicit(v62 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v52 + 8))(v52);
    }

    if (v54)
    {
      if (atomic_fetch_add_explicit(v54 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v54 + 8))(v54);
      }
    }
  }
  else
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3;
    v73[3] = &unk_2641F8578;
    v73[4] = a6;
    dispatch_async((dispatch_queue_t)a5, v73);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
    long long v22 = 0;
  }
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v2 = (float *)-[RBDecodedFontMetadata fontUID](*(void *)(a1 + 48));
  __int16 v54 = 0;
  int v53 = 0;
  int v3 = (RB *)RB::ColorMode::pixel_format((unsigned __int8 *)(a1 + 112), (uint64_t)v2, *(_DWORD *)(a1 + 120), (unsigned char *)&v54 + 1, (BOOL *)&v54, &v53);
  uint64_t v5 = v3;
  char v6 = 0;
  int32x2_t v7 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(a1 + 56)));
  uint64_t v8 = 10;
  uint64_t v9 = (uint64_t)v3;
  int32x2_t v10 = v7;
  switch((unint64_t)v3)
  {
    case 0x80000001uLL:
    case 0x80000002uLL:
      goto LABEL_10;
    case 0x80000003uLL:
      uint64_t v8 = 25;
LABEL_10:
      v10.i32[1] = v7.i32[1];
      v10.i32[0] = 3 * v7.i32[0];
      char v6 = 1;
      uint64_t v9 = v8;
      goto LABEL_13;
    case 0x80000004uLL:
    case 0x80000006uLL:
      goto LABEL_13;
    case 0x80000005uLL:
      char v6 = 0;
      uint64_t v9 = 23;
      goto LABEL_12;
    case 0x80000007uLL:
    case 0x80000008uLL:
      char v6 = 0;
      uint64_t v9 = 80;
      goto LABEL_12;
    case 0x80000009uLL:
    case 0x8000000AuLL:
      char v6 = 0;
      uint64_t v9 = 70;
      goto LABEL_12;
    case 0x8000000BuLL:
    case 0x8000000CuLL:
      char v6 = 0;
      uint64_t v9 = 115;
      goto LABEL_12;
    default:
      uint64_t v9 = (uint64_t)v3;
      int32x2_t v10 = v7;
      if (v3 != (RB *)43) {
        goto LABEL_13;
      }
      char v6 = 0;
      if (*((unsigned char *)v2 + 284)) {
        uint64_t v9 = 43;
      }
      else {
        uint64_t v9 = 23;
      }
LABEL_12:
      int32x2_t v10 = v7;
LABEL_13:
      int32x2_t v28 = v10;
      double v29 = *(double *)&v7;
      double v11 = v2 + 72;
      int32x2_t v12 = (int32x2_t)vld1_dup_f32(v11);
      uint32x2_t v13 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v12, v10), (int8x8_t)vcgtz_s32(v10));
      if ((vpmin_u32(v13, v13).u32[0] & 0x80000000) == 0)
      {
        unint64_t v14 = RB::error_log(v3);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4_cold_1(v5, v14, v29);
        }
        double v16 = *(NSObject **)(a1 + 72);
        unint64_t v15 = *(void **)(a1 + 80);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3321888768;
        block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_43;
        block[3] = &__block_descriptor_40_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE_e5_v8__0l;
        id v52 = v15;
        dispatch_async(v16, block);
      }
      BOOL v17 = (((unint64_t)*((unsigned __int16 *)RB::pixel_format_traits((unint64_t)v5, v4) + 2) << 32) & 0x30000000000) == 0x10000000000;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3812000000;
      v49[3] = __Block_byref_object_copy__4;
      v49[4] = __Block_byref_object_dispose__4;
      id v50 = 0;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      float v42 = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_45;
      int v43 = &unk_2641F8DB0;
      uint64_t v44 = v49;
      uint64_t v45 = v9;
      int32x2_t v46 = v28;
      BOOL v48 = v17;
      uint64_t v47 = v2;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3321888768;
      v35[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2_47;
      v35[3] = &unk_26C4E72F0;
      v35[4] = v49;
      v35[5] = v5;
      *(double *)&v35[6] = v29;
      v35[7] = v28;
      char v39 = HIBYTE(v54);
      char v40 = v6;
      uint64_t v38 = *(void *)(a1 + 112);
      id v36 = *(id *)(a1 + 72);
      id v37 = *(id *)(a1 + 80);
      RB::RenderFrame::RenderFrame((RB::RenderFrame *)v55, (RB::Device *)v2, *(RB::Drawable **)(a1 + 88), 0);
      double v18 = *(double *)(a1 + 96);
      char v19 = HIBYTE(v54);
      char v20 = v54;
      char v21 = *(unsigned char *)(a1 + 112);
      char HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(a1 + 124));
      float v23 = v18;
      RB::RenderParams::RenderParams((uint64_t)&v32, (uint64_t)v55, (uint64_t)v5, v19, v20, v21, HasExtendedRange, v29, v23);
      char v34 = (v34 & 0xF3 | (4 * *(unsigned char *)(a1 + 132)) | (2 * v53) & 8) ^ 4;
      uint64_t v24 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 104), "_rb_contents");
      if (v24) {
        RB::DisplayList::render(v24, &v32, (uint64_t)v41, *(_DWORD *)(a1 + 128), 0, 0, v33, *(__n128 *)(a1 + 32));
      }
      if (v42((uint64_t)v41))
      {
        RBStrokeRef::clip(v55);
        {
          uint64_t v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
        }
      }
      else
      {
        float64x2_t v26 = *(NSObject **)(a1 + 72);
        float64x2_t v25 = *(void **)(a1 + 80);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3321888768;
        void v30[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_50;
        v30[3] = &__block_descriptor_40_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE_e5_v8__0l;
        id v31 = v25;
        dispatch_async(v26, v30);
      }
      RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v55);

      _Block_object_dispose(v49, 8);
      return;
  }
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_45(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (!result)
  {
    int v3 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:*(void *)(a1 + 40) width:(int)*(void *)(a1 + 48) height:(int)HIDWORD(*(void *)(a1 + 48)) mipmapped:0];
    [v3 setUsage:5];
    if (*(unsigned char *)(a1 + 64)) {
      objc_msgSend(v3, "setUsage:", objc_msgSend(v3, "usage") | 2);
    }
    [v3 setStorageMode:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = [*(id *)(*(void *)(a1 + 56) + 24) newTextureWithDescriptor:v3];

    *(void *)(v4 + 48) = v5;
    return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  }
  return result;
}

void __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2_47(uint64_t a1, MTLPixelFormat a2)
{
  uint64_t v3 = *((unsigned __int8 *)RB::pixel_format_traits(*(void *)(a1 + 40), a2) + 6);
  int v25 = HIDWORD(*(void *)(a1 + 48));
  size_t v4 = (*(void *)(a1 + 48) * v3 + 63) & 0xFFFFFFC0;
  int v5 = getpagesize();
  size_t v6 = (v4 * v25 + v5 - 1) & -(uint64_t)v5;
  int32x2_t v7 = mmap(0, v6, 3, 4098, -1, 0);
  if (v7 != (void *)-1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = CGDataProviderCreateWithData(0, v7, v6, (CGDataProviderReleaseDataCallback)_ZZZZ59__RBLayer_copyImageInRect_options_completionQueue_handler__EUb0_EUb1_EN3__18__invokeIPvPKvmEEDaT_T0_T1_);
    int32x2_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    memset(v29, 0, sizeof(v29));
    *(void *)&long long v12 = (int)v11;
    *((void *)&v12 + 1) = SHIDWORD(v11);
    long long v30 = v12;
    uint64_t v31 = 1;
    [v10 getBytes:v8 bytesPerRow:v4 fromRegion:v29 mipmapLevel:0];
    unint64_t v14 = RB::pixel_format_traits(*(void *)(a1 + 40), v13);
    unint64_t v15 = *v14 | ((unint64_t)*((unsigned __int16 *)v14 + 2) << 32);
    double v16 = (RB *)*(unsigned __int8 *)(a1 + 88);
    if ((v15 & 0x200000000) != 0)
    {
      BOOL v17 = RB::cg_color_space(v16, 1);
      if (*(unsigned char *)(a1 + 89)) {
        CGBitmapInfo v19 = 4352;
      }
      else {
        CGBitmapInfo v19 = 4353;
      }
      size_t v20 = 16;
    }
    else
    {
      BOOL v17 = RB::cg_color_space((RB *)(v16 | 1), *(unsigned char *)(a1 + 80) == 0);
      uint64_t v18 = *(void *)(a1 + 40);
      CGBitmapInfo v19 = 4102;
      size_t v20 = 5;
      if (v18 != 43 && v18 != 2147483653)
      {
        if (*(unsigned char *)(a1 + 89)) {
          CGBitmapInfo v19 = 0;
        }
        else {
          CGBitmapInfo v19 = 8194;
        }
        size_t v20 = 8;
      }
    }
    CGImageRef v21 = CGImageCreate((int)*(void *)(a1 + 48), (int)HIDWORD(*(void *)(a1 + 48)), v20, 8 * v3, v4, v17, v19, v9, 0, 1, kCGRenderingIntentDefault);
    float v23 = *(NSObject **)(a1 + 64);
    long long v22 = *(void **)(a1 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3321888768;
    block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3_48;
    block[3] = &__block_descriptor_48_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE40c27_ZTSN2RB6cf_ptrIP7CGImageEE_e5_v8__0l;
    id v27 = v22;
    if (v21) {
      CFTypeRef v24 = CFRetain(v21);
    }
    else {
      CFTypeRef v24 = 0;
    }
    CFTypeRef cf = v24;
    dispatch_async(v23, block);
    if (cf) {
      CFRelease(cf);
    }

    if (v21) {
      CFRelease(v21);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayIfNeeded
{
  if (!*((unsigned char *)self + 173))
  {
    v2.receiver = self;
    v2.super_class = (Class)RBLayer;
    [(RBLayer *)&v2 displayIfNeeded];
  }
}

- (void)renderInContext:(CGContext *)a3
{
  *((unsigned char *)self + 173) = 1;
  v4.receiver = self;
  v4.super_class = (Class)RBLayer;
  [(RBLayer *)&v4 renderInContext:a3];
  *((unsigned char *)self + 173) = 0;
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  [(RBLayer *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  RB::ColorMode::ColorMode(v30, [(RBLayer *)self colorMode]);
  MTLPixelFormat v13 = objc_opt_new();
  [v13 setProfile:3];
  [v13 setDefaultColorSpace:rb_color_space(((v30[4] & 1) == 0) | 0x100u)];
  objc_msgSend(v13, "setContentRect:", v6, v8, v10, v12);
  [v13 beginLayer];
  if ([(RBLayer *)self clearsBackground])
  {
    [(RBLayer *)self clearColor];
    float v18 = v17;
    if (v17 != 0.0)
    {
      int v19 = v14;
      int v20 = v15;
      int v21 = v16;
      long long v22 = objc_opt_new();
      float v23 = objc_opt_new();
      LODWORD(v24) = v19;
      LODWORD(v25) = v20;
      LODWORD(v26) = v21;
      *(float *)&double v27 = v18;
      objc_msgSend(v22, "setColor:", v24, v25, v26, v27);
      objc_msgSend(v23, "setRect:", v6, v8, v10, v12);
      LODWORD(v28) = 1.0;
      [v13 drawShape:v23 fill:v22 alpha:0 blendMode:v28];
    }
  }
  [(RBLayer *)self drawInDisplayList:v13];
  LODWORD(v29) = 1.0;
  [v13 drawLayerWithAlpha:0 blendMode:v29];
  CGContextSaveGState(a3);
  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  CGContextClipToRect(a3, v31);
  if (([(RBLayer *)self contentsAreFlipped] & 1) == 0)
  {
    CGContextTranslateCTM(a3, 0.0, v12);
    CGContextScaleCTM(a3, 1.0, -1.0);
  }
  [v13 renderInContext:a3 options:0];
  CGContextRestoreGState(a3);
}

- (BOOL)needsSynchronousUpdate
{
  return *((unsigned char *)self + 175);
}

- (void)setNeedsSynchronousUpdate:(BOOL)a3
{
  *((unsigned char *)self + 175) = a3;
}

- (void)setPromotesFramebuffer:(BOOL)a3
{
  *((unsigned char *)self + 176) = a3;
}

- (void)setClearsBackground:(BOOL)a3
{
  *((unsigned char *)self + 177) = a3;
}

- (void)setClearColor:(id)a3
{
  *((_DWORD *)self + 50) = LODWORD(a3.var0);
  *((_DWORD *)self + 51) = LODWORD(a3.var1);
  *((_DWORD *)self + 52) = LODWORD(a3.var2);
  *((_DWORD *)self + 53) = LODWORD(a3.var3);
}

- (void)setAllowsBottomLeftOrigin:(BOOL)a3
{
  *((unsigned char *)self + 179) = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = (atomic_uint *)*((void *)self + 17);
  if (v3 && atomic_fetch_add_explicit(v3 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(atomic_uint *))(*(void *)v3 + 8))(v3);
  }
  RB::SharedSubsurface::~SharedSubsurface((id *)self + 10);

  objc_super v4 = (atomic_uint *)*((void *)self + 6);
  if (v4 && atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(atomic_uint *))(*(void *)v4 + 8))(v4);
  }
  double v5 = (void *)*((void *)self + 5);
}

- (void)displayWithBounds:(os_log_t)log callback:(double)a4 .cold.4(uint64_t a1, uint8_t *buf, os_log_t log, double a4)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = LODWORD(a4);
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = HIDWORD(a4);
  _os_log_fault_impl(&dword_2140F5000, log, OS_LOG_TYPE_FAULT, "RBLayer: unable to create texture: %s, [%d, %d]", buf, 0x18u);
}

- (uint64_t)resetStatistics:alpha:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)statistics
{
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

__n128 __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4_cold_1(RB *a1, NSObject *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(_DWORD *)buf = 136315650;
  double v7 = RB::pixel_format_name(a1, (MTLPixelFormat)a2);
  __int16 v8 = 1024;
  int v9 = LODWORD(a3);
  __int16 v10 = 1024;
  int v11 = HIDWORD(a3);
  _os_log_fault_impl(&dword_2140F5000, a2, OS_LOG_TYPE_FAULT, "RBLayer: unable to create image texture: %s, [%d, %d]", buf, 0x18u);
  return result;
}

@end