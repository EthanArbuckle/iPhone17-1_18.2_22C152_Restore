@interface RBSymbolLayer
- ($4C453035CF9D444C7FDAB91FAAAE42FC)symbolTransform;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)resolveStyle:(unsigned int)a3 colorName:(id)a4;
- (RBSymbolAnimator)animator;
- (RBSymbolLayer)init;
- (RBSymbolLayer)initWithCoder:(id)a3;
- (RBSymbolLayer)initWithLayer:(id)a3;
- (id).cxx_construct;
- (id)RBLayerDefaultDevice:(id)a3;
- (id)actionForKey:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)styleResolver;
- (unsigned)drawingOptions;
- (void)clearContents;
- (void)configureSublayer:(id)a3 type:(unsigned int)a4;
- (void)dealloc;
- (void)display;
- (void)drawingContents;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)renderInContext:(CGContext *)a3;
- (void)setAnimator:(id)a3;
- (void)setDrawingOptions:(unsigned int)a3;
- (void)setNeedsLayout;
- (void)setStyleResolver:(id)a3;
- (void)setSymbolTransform:(id)a3;
- (void)symbolAnimatorDidChange:(id)a3;
- (void)updateForTime:(os_unfair_lock_s *)a1;
@end

@implementation RBSymbolLayer

- (RBSymbolLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)RBSymbolLayer;
  result = [(RBSymbolLayer *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)result + 5) = _Q0;
    *((void *)result + 12) = 0;
    *((void *)result + 13) = 0;
  }
  return result;
}

- (RBSymbolLayer)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RBSymbolLayer;
  result = [(RBSymbolLayer *)&v9 initWithCoder:a3];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)result + 5) = _Q0;
    *((void *)result + 12) = 0;
    *((void *)result + 13) = 0;
  }
  return result;
}

- (RBSymbolLayer)initWithLayer:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RBSymbolLayer;
  v4 = -[RBSymbolLayer initWithLayer:](&v12, sel_initWithLayer_);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)*((void *)a3 + 4);
    v7 = (void *)*((void *)v4 + 4);
    if (v7 != v6)
    {

      *((void *)v5 + 4) = v6;
    }
    long long v8 = *((_OWORD *)a3 + 6);
    *((_OWORD *)v5 + 5) = *((_OWORD *)a3 + 5);
    *((_OWORD *)v5 + 6) = v8;
    *((_DWORD *)v5 + 19) = *((_DWORD *)a3 + 19);
    objc_super v9 = (void *)*((void *)a3 + 5);
    v10 = (void *)*((void *)v5 + 5);
    if (v10 != v9)
    {

      *((void *)v5 + 5) = v9;
    }
  }
  return v5;
}

- (void)dealloc
{
  -[RBSymbolAnimator removeObserver:](*((void *)self + 4), (uint64_t)self);
  +[CALayer cancelAnimation:](MEMORY[0x263F157E8], self);
  v3.receiver = self;
  v3.super_class = (Class)RBSymbolLayer;
  [(RBSymbolLayer *)&v3 dealloc];
}

- (RBSymbolAnimator)animator
{
  return (RBSymbolAnimator *)*((void *)self + 4);
}

- (void)setAnimator:(id)a3
{
  v5 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  id v6 = (id)*((void *)self + 4);
  if (v6 == a3)
  {
    id v6 = 0;
  }
  else
  {
    *((void *)self + 4) = 0;
    if (a3)
    {

      *((void *)self + 4) = a3;
    }
  }
  os_unfair_lock_unlock(v5);
  if (v6 != a3)
  {
    -[RBSymbolAnimator removeObserver:]((uint64_t)v6, (uint64_t)self);
    -[RBSymbolAnimator addObserver:]((uint64_t)a3, (uint64_t)self);
    [(RBSymbolLayer *)self setNeedsLayout];
  }
}

- (void)setSymbolTransform:(id)a3
{
  double dy = a3.var1.dy;
  double dx = a3.var1.dx;
  double v5 = a3.var0.dy;
  double v6 = a3.var0.dx;
  long long v8 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  if (v6 == *((double *)self + 10)
    && v5 == *((double *)self + 11)
    && dx == *((double *)self + 12)
    && dy == *((double *)self + 13))
  {
    os_unfair_lock_unlock(v8);
  }
  else
  {
    *((double *)self + 10) = v6;
    *((double *)self + 11) = v5;
    *((double *)self + 12) = dx;
    *((double *)self + 13) = dy;
    os_unfair_lock_unlock(v8);
    [(RBSymbolLayer *)self setNeedsLayout];
  }
}

- (id)styleResolver
{
  return (id)*((void *)self + 5);
}

- (void)setStyleResolver:(id)a3
{
  double v5 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  if (*((id *)self + 5) == a3)
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v6 = [a3 copy];

    *((void *)self + 5) = v6;
    os_unfair_lock_unlock(v5);
    [(RBSymbolLayer *)self setNeedsLayout];
  }
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resolveStyle:(unsigned int)a3 colorName:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(RBSymbolLayer *)self styleResolver];
  if (v6)
  {
    v6[2](v6, v5, a4);
  }
  else
  {
    float v7 = -32768.0;
    float v8 = -32768.0;
    float v9 = -32768.0;
    float v10 = -32768.0;
  }
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)symbolAnimatorDidChange:(id)a3
{
  [(RBSymbolLayer *)self setNeedsLayout];
  v4 = (void *)[(RBSymbolLayer *)self superlayer];
  [v4 setNeedsLayout];
}

- (void)setNeedsLayout
{
  if (!*((_DWORD *)self + 17))
  {
    +[CALayer cancelAnimation:](MEMORY[0x263F157E8], self);
    v3.receiver = self;
    v3.super_class = (Class)RBSymbolLayer;
    [(RBSymbolLayer *)&v3 setNeedsLayout];
  }
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)self + 73) = a3;
  [(RBSymbolLayer *)self setNeedsLayout];
  v5.receiver = self;
  v5.super_class = (Class)RBSymbolLayer;
  [(RBSymbolLayer *)&v5 layerDidBecomeVisible:v3];
}

- (void)layoutSublayers
{
  double v3 = CACurrentMediaTime();
  -[RBSymbolLayer updateForTime:]((os_unfair_lock_s *)self, v3);
}

- (void)updateForTime:(os_unfair_lock_s *)a1
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    v4 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    *(_DWORD *)(v3 + 68) = 1;
    if (*(double *)(v3 + 56) > a2) {
      a2 = *(double *)(v3 + 56);
    }
    *(double *)(v3 + 56) = a2;
    uint64_t v5 = *(void *)(v3 + 32);
    if (!v5 || !*(unsigned char *)(v3 + 73))
    {
      -[RBSymbolLayer clearContents](v3);
      goto LABEL_10;
    }
    uint64_t v6 = (os_unfair_lock_s *)-[RBAnimation rb_animation](v5);
    RB::Symbol::Animator::set_current_time(v6, a2);
    if (v184)
    {
      -[RBSymbolLayer clearContents](v3);
LABEL_8:
      float v7 = v183 * v178;
      -[CALayer scheduleAnimation:atTime:maxVelocityInPixels:]((void *)v3, (void *)v3, v177, v7);
      -[RBSymbolAnimator unblockObservers](*(void *)(v3 + 32));
      RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v172);
LABEL_10:
      *(_DWORD *)(v3 + 68) = 0;
      os_unfair_lock_unlock(v4);
      return;
    }
    unsigned int v149 = [(CALayer *)v171[0] drawingOptions];
    int64x2_t v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v180, (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(v179, (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(v181));
    uint64_t v153 = v3;
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] & 0x8000000000000000) != 0
      && (v149 & 2) == 0
      && (RB::Symbol::Presentation::style_mask((RB::Symbol::Presentation *)v172) & 0x1000) == 0)
    {
      RB::Symbol::Presentation::template_image((uint64_t)v172, (uint64_t)&v168);
      float64_t v9 = v168.n128_f64[0];
      if (v168.n128_u64[0])
      {
        double v10 = v168.n128_f64[1];
        int v11 = v169;
        if (LOBYTE(v171[0][2]._attr.refcount) != 3
          || (id v12 = [(NSArray *)[(CALayer *)v171[0] sublayers] objectAtIndexedSubscript:0]) == 0)
        {
          id v12 = (id)objc_opt_new();
          [(CALayer *)v171[0] configureSublayer:v12 type:0];
          if (color_symbols())
          {
            {
            }
          }
          [v12 setContentsGravity:*MEMORY[0x263F15DF0]];
          [v12 setContentsSwizzle:*MEMORY[0x263F15E48]];
          [v12 setDelegate:v171[0]];
          *(void *)&long long v185 = v12;
          -[CALayer setSublayers:](v171[0], "setSublayers:", [MEMORY[0x263EFF8C0] arrayWithObjects:&v185 count:1]);

          if (v171[0] && LOBYTE(v171[0][2]._attr.refcount) != 3) {
            LOBYTE(v171[0][2]._attr.refcount) = 3;
          }
        }
        [v12 setContents:*(void *)&v9];
        [v12 setContentsScale:v10];
        LODWORD(v13) = v11;
        [v12 setOpacity:v13];
        if (color_symbols())
        {
          [(CALayer *)v171[0] bounds];
          objc_msgSend(v12, "setFrame:");
        }
        __n128 __dst = (__n128)RBColorWhite;
        LODWORD(v189) = 10;
        v190[1] = 0;
        if (RB::Symbol::ResolvedColor::begin_update((uint64_t)&__dst, 0, 0, 0))
        {
          v14 = (float **)&v175;
          if (v176) {
            v14 = (float **)(v176 + 376);
          }
          v15 = *v14;
          v16 = (float *)&v174 + 1;
          if (v176) {
            v16 = (float *)(v176 + 36);
          }
          if (v15) {
            v16 = v15 + 5;
          }
          float v17 = *v16;
          if (*v16 == -32768.0)
          {
            [(CALayer *)v171[0] resolveStyle:0 colorName:0];
          }
          else
          {
            v18 = (float *)&v173;
            if (v176) {
              v18 = (float *)(v176 + 24);
            }
            v19 = v15 + 2;
            v20 = (float *)&v174;
            if (v176) {
              v20 = (float *)(v176 + 32);
            }
            v21 = (float *)(v176 + 28);
            if (!v176) {
              v21 = (float *)&v173 + 1;
            }
            BOOL v22 = v15 == 0;
            v23 = v15 + 4;
            if (!v15) {
              v23 = v20;
            }
            float v24 = *v23;
            v25 = v15 + 3;
            if (v22) {
              v25 = v21;
            }
            float v26 = *v25;
            if (v22) {
              v27 = v18;
            }
            else {
              v27 = v19;
            }
            float v28 = *v27;
          }
          RB::Symbol::ResolvedColor::commit_update((uint64_t)&__dst, v28, v26, v24, v17);
        }
        v130 = (CGColor *)[v12 contentsMultiplyColor];
        if (!v130
          || (__n128 v131 = __dst, v132 = RBColorFromCGColor(v130, 0), v131.n128_f32[0] != *(float *)&v132)
          || v131.n128_f32[1] != v133
          || v131.n128_f32[2] != v134
          || v131.n128_f32[3] != v135)
        {
          [v12 setContentsMultiplyColor:RB::Symbol::ResolvedColor::operator CGColor *((uint64_t)&__dst)];
        }
        if (v190[1]) {
          CFRelease(v190[1]);
        }
        goto LABEL_8;
      }
    }
    if ((v149 & 4) != 0 && (RB::Symbol::Presentation::style_mask((RB::Symbol::Presentation *)v172) & 0x1000) == 0)
    {
      *(_OWORD *)v192 = 0u;
      unint64_t v193 = 2;
      uint64_t updated = RBSymbolUpdateGroupCount((uint64_t)v172);
      v141 = v4;
      long long v169 = v30;
      long long v170 = v31;
      long long v185 = RBColorWhite;
      int v186 = 10;
      CFTypeRef v187 = 0;
      if (updated)
      {
        BOOL v32 = 0;
        unint64_t v33 = 0;
        CFTypeRef cf = 0;
        CFStringRef colorName = (const __CFString *)*MEMORY[0x263F002F8];
        for (i = updated; i != v33; BOOL v32 = v33 >= i)
        {
          uint64_t v34 = RBSymbolUpdateGroupSize((uint64_t)v172, v33);
          if (v34)
          {
            uint64_t v35 = v34;
            LODWORD(v136) = v32;
            v36 = v192[1];
            if ((void *)v193 < (char *)v192[1] + 1)
            {
              v36 = v192[1];
              uint64_t v3 = v153;
            }
            uint64_t v37 = 0;
            p_dst = (__n128 *)v192[0];
            if (!v192[0]) {
              p_dst = &__dst;
            }
            v39 = &p_dst[26 * (void)v36];
            v39[24] = 0u;
            v39[25] = 0u;
            v39[22] = 0u;
            v39[23] = 0u;
            v39[20] = 0u;
            v39[21] = 0u;
            v39[18] = 0u;
            v39[19] = 0u;
            v39[16] = 0u;
            v39[17] = 0u;
            v39[14] = 0u;
            v39[15] = 0u;
            v39[12] = 0u;
            v39[13] = 0u;
            v39[10] = 0u;
            v39[11] = 0u;
            v39[8] = 0u;
            v39[9] = 0u;
            v39[6] = 0u;
            v39[7] = 0u;
            v39[4] = 0u;
            v39[5] = 0u;
            v39[2] = 0u;
            v39[3] = 0u;
            __n128 *v39 = 0u;
            v39[1] = 0u;
            v39[25].n128_u64[0] = 4;
            v40 = v192[1]++;
            v41 = (__n128 *)v192[0];
            if (!v192[0]) {
              v41 = &__dst;
            }
            v42 = &v41[26 * (void)v40];
            do
            {
              v167[0] = v172;
              v167[1] = v33;
              v167[2] = v37;
              float v43 = RBSymbolUpdateLayerDrawingOpacity(v167);
              v166[0] = v172;
              v166[1] = v33;
              v166[2] = v37;
              float v44 = RBSymbolUpdateLayerErasingOpacity(v166);
              float v45 = v44;
              if (v43 > 0.0 || v44 > 0.0)
              {
                v162[0] = v172;
                v162[1] = v33;
                v162[2] = v37;
                v47 = RBSymbolUpdateLayerPath(v162, &v163, (v149 >> 2) & 2);
                unint64_t v48 = v46;
                if (v47 == (void *)1 && v46 == 0x21421C340)
                {
                  v4 = v141;
                  v86 = cf;
                  char v87 = (char)v136;
                  goto LABEL_151;
                }
                if (v45 > 0.0)
                {
                  CFTypeRef v50 = cf;
                  if (cf
                    || (CGColorRef ConstantColor = CGColorGetConstantColor(colorName)) != 0
                    && (CFTypeRef v50 = CFRetain(ConstantColor)) != 0)
                  {
                    CFTypeRef cf = v50;
                    CFTypeRef v51 = CFRetain(v50);
                  }
                  else
                  {
                    CFTypeRef cf = 0;
                    CFTypeRef v51 = 0;
                  }
                  float64x2_t v159 = v163;
                  __n128 v160 = v164;
                  __n128 v161 = v165;
                  v53.n128_f64[0] = RB::operator*(&v159, (float64x2_t *)&v168);
                  __n128 v150 = v53;
                  __n128 v142 = v55;
                  __n128 v145 = v54;
                  unint64_t v56 = v42[24].n128_u64[1];
                  if (v42[25].n128_u64[0] < v56 + 1)
                  {
                    unint64_t v56 = v42[24].n128_u64[1];
                  }
                  v57 = (__n128 *)v42[24].n128_u64[0];
                  if (!v57) {
                    v57 = v42;
                  }
                  v58 = &v57[6 * v56];
                  v58->n128_u64[0] = (unint64_t)v47;
                  v58->n128_u64[1] = v48;
                  v58[1].n128_u64[0] = (unint64_t)v51;
                  v58[2] = v150;
                  v58[3] = v145;
                  v58[4] = v142;
                  v58[5].n128_f32[0] = v45;
                  v58[5].n128_u8[4] = 1;
                  ++v42[24].n128_u64[1];
                }
                if (v43 > 0.0)
                {
                  float64x2_t v159 = v163;
                  __n128 v160 = v164;
                  __n128 v161 = v165;
                  v59.n128_f64[0] = RB::operator*(&v159, (float64x2_t *)&v168);
                  __n128 v151 = v59;
                  __n128 v143 = v61;
                  __n128 v146 = v60;
                  unint64_t v62 = v42[24].n128_u64[1];
                  if (v42[25].n128_u64[0] < v62 + 1)
                  {
                    unint64_t v62 = v42[24].n128_u64[1];
                  }
                  v63 = (__n128 *)v42[24].n128_u64[0];
                  if (!v63) {
                    v63 = v42;
                  }
                  v64 = &v63[6 * v62];
                  v64->n128_u64[0] = (unint64_t)v47;
                  v64->n128_u64[1] = v48;
                  v64[1].n128_u64[0] = 0;
                  v64[2] = v151;
                  v64[3] = v146;
                  v64[4] = v143;
                  v64[5].n128_f32[0] = v43;
                  v64[5].n128_u8[4] = 0;
                  v65 = (__n128 *)v42[24].n128_u64[0];
                  uint64_t v66 = v42[24].n128_u64[1] + 1;
                  v42[24].n128_u64[1] = v66;
                  if (v65) {
                    v67 = v65;
                  }
                  else {
                    v67 = v42;
                  }
                  uint64_t v68 = v66;
                  v158[0] = v172;
                  v158[1] = v33;
                  v158[2] = v37;
                  float v69 = RBSymbolUpdateLayerColor(v158);
                  if (v72 == -32768.0)
                  {
                    v157[0] = v172;
                    v157[1] = v33;
                    v157[2] = v37;
                    uint64_t v73 = RBSymbolUpdateLayerStyle(v157);
                    if (v73 == 9)
                    {
                      v156[0] = v172;
                      v156[1] = v33;
                      v156[2] = v37;
                      uint64_t v74 = RBSymbolUpdateLayerColorName(v156);
                      v155[0] = v172;
                      v155[1] = v33;
                      v155[2] = v37;
                      v75 = (CGColor *)RBSymbolUpdateLayerDefaultColor(v155);
                    }
                    else
                    {
                      uint64_t v74 = 0;
                      v75 = 0;
                    }
                    if (RB::Symbol::ResolvedColor::begin_update((uint64_t)&v185, v73, v74, v75))
                    {
                      if (v73 == 10)
                      {
                        float v76 = 1.0;
                        float v77 = 1.0;
                        float v78 = 1.0;
                        float v79 = 1.0;
                      }
                      else
                      {
                        [(CALayer *)v171[0] resolveStyle:v73 colorName:v74];
                      }
                      RB::Symbol::ResolvedColor::commit_update((uint64_t)&v185, v76, v77, v78, v79);
                    }
                  }
                  else
                  {
                    RB::Symbol::ResolvedColor::update((uint64_t)&v185, v69, v70, v71, v72);
                  }
                  CGColorRef v80 = RB::Symbol::ResolvedColor::operator CGColor *((uint64_t)&v185);
                  v81 = &v67[6 * v68 - 6];
                  CGColorRef v84 = (CGColorRef)v81[1].n128_u64[0];
                  v83 = v81 + 1;
                  CGColorRef v82 = v84;
                  uint64_t v3 = v153;
                  if (v84 != v80)
                  {
                    if (v82) {
                      CFRelease(v82);
                    }
                    if (v80) {
                      CFTypeRef v85 = CFRetain(v80);
                    }
                    else {
                      CFTypeRef v85 = 0;
                    }
                    v83->n128_u64[0] = (unint64_t)v85;
                    uint64_t v3 = v153;
                  }
                }
              }
              ++v37;
            }
            while (v35 != v37);
          }
          ++v33;
        }
      }
      else
      {
        CFTypeRef cf = 0;
      }
      v88 = v171[0];
      if (LOBYTE(v171[0][2]._attr.refcount) == 4)
      {
        v4 = v141;
      }
      else
      {
        v4 = v141;
        -[RBSymbolLayer clearContents]((uint64_t)v171[0]);
        v88 = v171[0];
        if (v171[0] && LOBYTE(v171[0][2]._attr.refcount) != 4) {
          LOBYTE(v171[0][2]._attr.refcount) = 4;
        }
      }
      v89 = [(CALayer *)v88 sublayers];
      uint64_t v90 = [(NSArray *)v89 count];
      unint64_t v91 = v90;
      v136 = v89;
      v144 = v192[1];
      if (v192[1])
      {
        v138 = v88;
        unint64_t v92 = 0;
        uint64_t v93 = 0;
        uint64_t v154 = *MEMORY[0x263F15B90];
        CFStringRef colorNamea = (CFStringRef)v90;
        do
        {
          if (v192[0]) {
            v94 = (__n128 *)v192[0];
          }
          else {
            v94 = &__dst;
          }
          unint64_t v152 = v92;
          if (v92 >= v91
            || (id v95 = [(NSArray *)v136 objectAtIndexedSubscript:v92], v152 = v92 + 1, !v95))
          {
            id v95 = (id)objc_msgSend(MEMORY[0x263F157E8], "layer", v136);
            [(CALayer *)v171[0] configureSublayer:v95 type:4];
            if (color_symbols())
            {
              {
              }
            }
            [v95 setDelegate:v171[0]];
            objc_msgSend(v95, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
            [(CALayer *)v138 addSublayer:v95];
          }
          if (color_symbols())
          {
            objc_msgSend(v95, "setPosition:", rect2.origin.x, rect2.origin.y);
            objc_msgSend(v95, "setBounds:", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
          }
          v96 = objc_msgSend(v95, "sublayers", v136);
          unint64_t v97 = [v96 count];
          uint64_t v147 = v93;
          v98 = &v94[26 * v93];
          unint64_t v99 = v98[24].n128_u64[1];
          if (v99)
          {
            uint64_t v100 = 0;
            unint64_t v101 = 0;
            do
            {
              if (v98[24].n128_u64[0]) {
                v102 = (__n128 *)v98[24].n128_u64[0];
              }
              else {
                v102 = v98;
              }
              if (v101 >= v97 || (v103 = (void *)[v96 objectAtIndexedSubscript:v101], ++v101, !v103))
              {
                v103 = (void *)+[RBSymbolShapeLayer layer];
                [(CALayer *)v171[0] configureSublayer:v95 type:3];
                [v103 setDelegate:v171[0]];
                objc_msgSend(v103, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
                [v95 addSublayer:v103];
              }
              [(RBSymbolShapeLayer *)(uint64_t)v103 setRBPath:v102[v100].n128_i64[1]];
              [v103 setFillColor:v102[v100 + 1].n128_u64[0]];
              float64x2_t v163 = (float64x2_t)v102[v100 + 2];
              __n128 v164 = v102[v100 + 3];
              __n128 v165 = v102[v100 + 4];
              [v103 setAffineTransform:&v163];
              LODWORD(v104) = v102[v100 + 5].n128_u32[0];
              [v103 setOpacity:v104];
              if (v102[v100 + 5].n128_u8[4]) {
                uint64_t v105 = v154;
              }
              else {
                uint64_t v105 = 0;
              }
              [v103 setCompositingFilter:v105];
              v100 += 6;
              --v99;
            }
            while (v99);
          }
          else
          {
            unint64_t v101 = 0;
          }
          unint64_t v91 = (unint64_t)colorNamea;
          v4 = v141;
          uint64_t v3 = v153;
          unint64_t v92 = v152;
          while (v101 < v97)
            objc_msgSend((id)objc_msgSend(v96, "objectAtIndexedSubscript:", --v97), "removeFromSuperlayer");
          ++v93;
        }
        while ((void *)(v147 + 1) != v144);
      }
      else
      {
        unint64_t v92 = 0;
      }
      if (v92 >= v91)
      {
        char v87 = 1;
        v86 = cf;
      }
      else
      {
        v86 = cf;
        v106 = v136;
        do
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](v106, "objectAtIndexedSubscript:", --v91, v136), "removeFromSuperlayer");
        while (v92 < v91);
        char v87 = 1;
      }
LABEL_151:
      if (v86) {
        CFRelease(v86);
      }
      if (v187) {
        CFRelease(v187);
      }
      v107 = v192[0];
      if (v192[0]) {
        v108 = (__n128 *)v192[0];
      }
      else {
        v108 = &__dst;
      }
      if (v192[1])
      {
        v109 = 0;
        do
        {
          v110 = &v108[26 * (void)v109];
          v111 = (void *)v110[24].n128_u64[0];
          unint64_t v112 = v110[24].n128_u64[1];
          if (v111) {
            v113 = (__n128 *)v110[24].n128_u64[0];
          }
          else {
            v113 = &v108[26 * (void)v109];
          }
          if (v112)
          {
            unint64_t v114 = 0;
            v115 = (CFTypeRef *)&v113[1];
            do
            {
              if (*v115)
              {
                CFRelease(*v115);
                unint64_t v112 = v110[24].n128_u64[1];
              }
              ++v114;
              v115 += 12;
            }
            while (v114 < v112);
            v111 = (void *)v110[24].n128_u64[0];
          }
          if (v111) {
            free(v111);
          }
          v109 = (char *)v109 + 1;
        }
        while (v109 < v192[1]);
        v107 = v192[0];
        uint64_t v3 = v153;
      }
      if (v107) {
        free(v107);
      }
      if (v87) {
        goto LABEL_8;
      }
    }
    if (v149) {
      int v116 = 2;
    }
    else {
      int v116 = 1;
    }
    if (LOBYTE(v171[0][2]._attr.refcount) == v116
      && (v117 = [(NSArray *)[(CALayer *)v171[0] sublayers] objectAtIndexedSubscript:0], (v118 = v117) != 0))
    {
      [(CALayer *)v117 position];
      if (v120 == rect2.origin.x && v119 == rect2.origin.y)
      {
        [(CALayer *)v118 bounds];
        if (CGRectEqualToRect(v195, rect2))
        {
          [(CALayer *)v118 contentsScale];
          if (v121 == v183)
          {
LABEL_199:
            v168.n128_u64[0] = MEMORY[0x263EF8330];
            v168.n128_u64[1] = 3221225472;
            *(void *)&long long v169 = ___ZN12_GLOBAL__N_17Updater13update_mergedEv_block_invoke;
            *((void *)&v169 + 1) = &__block_descriptor_40_e28____ffff_20__0I8__NSString_12l;
            *(void *)&long long v170 = v171;
            if (v149)
            {
              v124 = objc_opt_new();
              [v124 setProfile:4];
              long long v189 = v125;
              *(_OWORD *)v190 = v126;
              [v124 concat:&__dst];
              State = (RB::DisplayList::State *)RBDisplayListGetState((uint64_t)v124);
              RB::Symbol::Presentation::draw((uint64_t)v172, State, (uint64_t)&v168);
              v128 = v171[0];
              uint64_t v129 = [v124 moveContents];

              v128[1]._attr.layer = (void *)v129;
              [(CALayer *)v118 setNeedsDisplay];

              uint64_t v3 = v153;
            }
            else
            {
              __dst.n128_u64[0] = MEMORY[0x263EF8330];
              __dst.n128_u64[1] = 3221225472;
              *(void *)&long long v189 = ___ZN12_GLOBAL__N_17Updater13update_mergedEv_block_invoke_2;
              *((void *)&v189 + 1) = &unk_2641F8BB0;
              v191 = v171;
              v190[0] = v118;
              v190[1] = &v168;
              -[CALayer displayWithBounds:callback:](v118, "displayWithBounds:callback:", &__dst, rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
              if ([(CALayer *)v118 needsDisplay]) {
                [(CALayer *)v118 setContents:[(CALayer *)v118 contents]];
              }
            }
            goto LABEL_8;
          }
        }
      }
    }
    else
    {
      v118 = (CALayer *)objc_opt_new();
      if (v149) {
        uint64_t v122 = 2;
      }
      else {
        uint64_t v122 = 1;
      }
      -[CALayer configureSublayer:type:](v171[0], "configureSublayer:type:", v118, v122, v136);
      if (color_symbols())
      {
        {
          uint64_t v3 = v153;
        }
        {
          uint64_t v3 = v153;
        }
        if (v149) {
        [(CALayer *)v118 setBackgroundColor:*v123];
        }
      }
      [(CALayer *)v118 setOpaque:0];
      -[CALayer setAnchorPoint:](v118, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(CALayer *)v118 setDelegate:v171[0]];
      __dst.n128_u64[0] = (unint64_t)v118;
      -[CALayer setSublayers:](v171[0], "setSublayers:", [MEMORY[0x263EFF8C0] arrayWithObjects:&__dst count:1]);

      if (v171[0] && LOBYTE(v171[0][2]._attr.refcount) != v116) {
        LOBYTE(v171[0][2]._attr.refcount) = v116;
      }
    }
    -[CALayer setPosition:](v118, "setPosition:", rect2.origin.x, rect2.origin.y, v136);
    -[CALayer setBounds:](v118, "setBounds:", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
    [(CALayer *)v118 setContentsScale:v183];
    goto LABEL_199;
  }
}

- (void)clearContents
{
  if (a1 && *(unsigned char *)(a1 + 72))
  {
    [(id)a1 setSublayers:0];

    *(void *)(a1 + 48) = 0;
    if (*(unsigned char *)(a1 + 72)) {
      *(unsigned char *)(a1 + 72) = 0;
    }
  }
}

- (void)drawingContents
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    *a2 = *(id *)(a1 + 48);
    os_unfair_lock_unlock(v4);
  }
  else
  {
    *a2 = 0;
  }
}

- (id)actionForKey:(id)a3
{
  if ([a3 isEqualToString:@"sublayers"]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RBSymbolLayer;
  return [(RBSymbolLayer *)&v6 actionForKey:a3];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)*MEMORY[0x263EFFD08];
}

- (void)display
{
  [(RBSymbolLayer *)self layoutSublayers];
  [(RBSymbolLayer *)self setContents:0];
}

- (void)renderInContext:(CGContext *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)self + 4);
  if (v4)
  {
    objc_super v6 = (RB::Symbol::Animator *)-[RBAnimation rb_animation](v4);
    if (v23[212])
    {
      long long v15 = v7;
      long long v16 = v8;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __33__RBSymbolLayer_renderInContext___block_invoke;
      v21[3] = &unk_2641F8B68;
      v21[4] = self;
      unsigned int v19 = 0;
      float v20 = 1.0;
      float64_t v9 = (RB::DisplayList::State *)RBDrawingStateFromCGContext(a3, &v20, &v19);
      double v10 = (int8x16_t *)v9;
      if (v9)
      {
        int v11 = RBDrawingStateBeginLayer(v9, 0);
        v18[0] = v14;
        v18[1] = v15;
        v18[2] = v16;
        RBDrawingStateConcatCTM((uint64_t)v11, (uint64_t)v18);
        RB::Symbol::Presentation::draw((uint64_t)v23, v11, (uint64_t)v21);
        RBDrawingStateDrawLayer(v10, v11, v19, v20);
      }
      else
      {
        id v12 = objc_opt_new();
        [v12 setProfile:3];
        v17[0] = v14;
        v17[1] = v15;
        v17[2] = v16;
        [v12 concat:v17];
        State = (RB::DisplayList::State *)RBDisplayListGetState((uint64_t)v12);
        RB::Symbol::Presentation::draw((uint64_t)v23, State, (uint64_t)v21);
        [v12 renderInContext:a3 options:0];
      }
    }
    RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v23);
  }
}

uint64_t __33__RBSymbolLayer_renderInContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) resolveStyle:a2 colorName:a3];
}

- (void)configureSublayer:(id)a3 type:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [(RBSymbolLayer *)self delegate];
  if (v7)
  {
    long long v8 = (void *)v7;
    if (objc_opt_respondsToSelector())
    {
      [v8 rbSymbolLayer:self configureSublayer:a3 type:v4];
    }
  }
}

- (id)RBLayerDefaultDevice:(id)a3
{
  uint64_t v4 = [(RBSymbolLayer *)self delegate];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return (id)[v5 RBLayerDefaultDevice:a3];
}

- ($4C453035CF9D444C7FDAB91FAAAE42FC)symbolTransform
{
  double v2 = *((double *)self + 10);
  double v3 = *((double *)self + 11);
  double v4 = *((double *)self + 12);
  double v5 = *((double *)self + 13);
  result.var1.double dy = v5;
  result.var1.double dx = v4;
  result.var0.double dy = v3;
  result.var0.double dx = v2;
  return result;
}

- (unsigned)drawingOptions
{
  return *((_DWORD *)self + 19);
}

- (void)setDrawingOptions:(unsigned int)a3
{
  *((_DWORD *)self + 19) = a3;
}

- (void).cxx_destruct
{
  double v3 = (void *)*((void *)self + 4);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 16) = 0;
  *((_DWORD *)self + 17) = 0;
  return self;
}

@end