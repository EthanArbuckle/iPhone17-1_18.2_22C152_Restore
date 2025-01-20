@interface MCDrawInput
+ (RefPtr<TI::Favonius::KeyboardLayout>)copyKeyboardLayout:(const void *)a3;
- (BOOL)_canCompose;
- (BOOL)canComposeNew:(id)a3;
- (BOOL)isComplete;
- (BOOL)isCompleting;
- (BOOL)isDrawing;
- (BOOL)shouldResample;
- (MCDrawInput)initWithKeyboardLayout:(const void *)a3;
- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4;
- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4 shouldResample:(BOOL)a5;
- (RefPtr<TI::Favonius::KeyboardLayout>)keyboardLayout;
- (RefPtr<TI::Favonius::KeyboardLayout>)rescaleKeyboardLayout;
- (id).cxx_construct;
- (id)_createDrawableTouchInputWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7 previousTouchInput:(id)a8 isInflectionPoint:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortDescriptionWithLeadingString:(id)a3;
- (int)drawHand;
- (void)_appendWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7;
- (void)_updateSampledInputs;
- (void)_updateSampledInputsWithResampler:(const void *)a3 permanentlyFinalized:(BOOL)a4;
- (void)composeNew:(id)a3;
- (void)composeWith:(id)a3;
- (void)resampler;
- (void)setDrawHand:(int)a3;
@end

@implementation MCDrawInput

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0x402E000000000000;
  *((void *)self + 8) = 1;
  *((unsigned char *)self + 72) = 1;
  *((void *)self + 10) = 0x3FD3333333333333;
  *((unsigned char *)self + 88) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 50) = 0;
  *((unsigned char *)self + 192) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_resampler = &self->_resampler;
  begin = self->_resampler.m_raw_path.m_inflection_points.__begin_;
  if (begin)
  {
    p_resampler->m_raw_path.m_inflection_points.__end_ = begin;
    operator delete(begin);
  }
  v5 = p_resampler->m_raw_path.m_samples.__begin_;
  if (v5)
  {
    p_resampler->m_raw_path.m_samples.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_resampler->m_resampled_path.m_inflection_points.__begin_;
  if (v6)
  {
    p_resampler->m_resampled_path.m_inflection_points.__end_ = v6;
    operator delete(v6);
  }
  v7 = p_resampler->m_resampled_path.m_samples.__begin_;
  if (v7)
  {
    p_resampler->m_resampled_path.m_samples.__end_ = v7;
    operator delete(v7);
  }
  m_ptr = self->_rescaleKeyboardLayout.m_ptr;
  if (m_ptr) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)m_ptr);
  }
  v9 = self->_keyboardLayout.m_ptr;
  if (v9)
  {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v9);
  }
}

- (void)setDrawHand:(int)a3
{
  self->_drawHand = a3;
}

- (int)drawHand
{
  return self->_drawHand;
}

- (void)resampler
{
  return &self->_resampler;
}

- (BOOL)shouldResample
{
  return self->_shouldResample;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)rescaleKeyboardLayout
{
  m_ptr = self->_rescaleKeyboardLayout.m_ptr;
  *v2 = m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)keyboardLayout
{
  m_ptr = self->_keyboardLayout.m_ptr;
  *v2 = m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (id)_createDrawableTouchInputWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7 previousTouchInput:(id)a8 isInflectionPoint:(BOOL)a9
{
  BOOL v9 = a9;
  double y = a3.y;
  double x = a3.x;
  id v15 = a8;
  v20 = 0;
  if ([(MCDrawInput *)self shouldResample])
  {
    [(MCDrawInput *)self drawHand];
    [(MCDrawInput *)self rescaleKeyboardLayout];
    if (!v19) {
      [(MCDrawInput *)self keyboardLayout];
    }
    operator new();
  }
  v16 = -[MCDrawableTouchInput initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:]([MCDrawableTouchInput alloc], "initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:", v9, &v20, x, y, a6, a4);
  if (v20)
  {
    unsigned int v17 = atomic_load(v20 + 2);
    if (v17 == 1) {
      (*(void (**)(void))(*(void *)v20 + 8))();
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v20 + 2, 0xFFFFFFFF);
    }
  }

  return v16;
}

- (void)_updateSampledInputsWithResampler:(const void *)a3 permanentlyFinalized:(BOOL)a4
{
  BOOL v17 = a4;
  if ([(MCDrawInput *)self shouldResample])
  {
    v6 = [(MCKeyboardInput *)self inputs];
    unint64_t v7 = [v6 count];
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 6) - *((void *)a3 + 5)) >> 4);

    if (v7 < v8)
    {
      BOOL v9 = [(MCKeyboardInput *)self inputs];
      LODWORD(v10) = [v9 count];

      uint64_t v11 = *((void *)a3 + 5);
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)a3 + 6) - v11) >> 4);
      if (v12 > (int)v10)
      {
        uint64_t v10 = (int)v10;
        do
        {
          uint64_t v13 = v10 != 0;
          if (v10 && v17)
          {
            if (*((unsigned char *)a3 + 136))
            {
              if (v10 == v12 - 1) {
                uint64_t v13 = 2;
              }
              else {
                uint64_t v13 = 1;
              }
            }
            else
            {
              uint64_t v13 = 1;
            }
          }
          if (v10 < 1)
          {
            id v15 = 0;
          }
          else
          {
            v14 = [(MCKeyboardInput *)self inputs];
            id v15 = [v14 objectAtIndexedSubscript:(v10 - 1)];
          }
          v16 = -[MCDrawInput _createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:](self, "_createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:", v13, v15, TI::CP::Path::inflection_point_count((TI::CP::Path *)((char *)a3 + 40), v10, v10) != 0, *(double *)(v11 + 48 * v10), *(double *)(v11 + 48 * v10 + 8), *(double *)(v11 + 48 * v10 + 16), *(double *)(v11 + 48 * v10 + 24), *(double *)(v11 + 48 * v10 + 40));
          v18.receiver = self;
          v18.super_class = (Class)MCDrawInput;
          [(MCKeyboardInput *)&v18 composeNew:v16];

          ++v10;
          uint64_t v11 = *((void *)a3 + 5);
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)a3 + 6) - v11) >> 4);
        }
        while (v12 > v10);
      }
    }
  }
}

- (void)_updateSampledInputs
{
  if ([(MCDrawInput *)self shouldResample])
  {
    if (*(unsigned char *)([(MCDrawInput *)self resampler] + 136))
    {
      v3 = [(MCDrawInput *)self resampler];
      [(MCDrawInput *)self _updateSampledInputsWithResampler:v3 permanentlyFinalized:1];
    }
    else
    {
      v4 = [(MCDrawInput *)self resampler];
      uint64_t v5 = *((void *)v4 + 4);
      long long v6 = v4[1];
      long long v21 = *v4;
      long long v22 = v6;
      uint64_t v23 = v5;
      std::vector<TI::CP::PathSample>::vector(&v24, (uint64_t)v4 + 40);
      std::vector<unsigned int>::vector(&v26, (const std::vector<unsigned int> *)(v4 + 4));
      std::vector<TI::CP::PathSample>::vector(v27, (uint64_t)v4 + 88);
      std::vector<unsigned int>::vector(&__p, (const std::vector<unsigned int> *)(v4 + 7));
      uint64_t v7 = *((void *)v4 + 17);
      int v30 = *((_DWORD *)v4 + 36);
      uint64_t v29 = v7;
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)&v21);
      unint64_t v8 = [(MCKeyboardInput *)self inputs];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          unint64_t v12 = [(MCKeyboardInput *)self inputs];
          uint64_t v13 = [v12 objectAtIndexedSubscript:v11];

          if (0xAAAAAAAAAAAAAAABLL * ((v25 - (unsigned char *)v24) >> 4) <= v11) {
            break;
          }
          [v13 touchPoint];
          if (v15 != *(double *)((char *)v24 + v10) || v14 != *(double *)((char *)v24 + v10 + 8)) {
            break;
          }

          ++v11;
          BOOL v17 = [(MCKeyboardInput *)self inputs];
          unint64_t v18 = [v17 count];

          v10 += 48;
          if (v18 <= v11) {
            goto LABEL_18;
          }
        }
        uint64_t v19 = [(MCKeyboardInput *)self inputs];
        uint64_t v20 = [v19 count];

        for (; v11 != v20; --v20)
          [(MCKeyboardInput *)self removeComposingInput];
      }
LABEL_18:
      [(MCDrawInput *)self _updateSampledInputsWithResampler:&v21 permanentlyFinalized:0];
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      if (v27[0])
      {
        v27[1] = v27[0];
        operator delete(v27[0]);
      }
      if (v26.__begin_)
      {
        v26.__end_ = v26.__begin_;
        operator delete(v26.__begin_);
      }
      if (v24)
      {
        v25 = v24;
        operator delete(v24);
      }
    }
  }
}

- (BOOL)isDrawing
{
  if ([(MCDrawInput *)self isCompleting]) {
    return 0;
  }
  else {
    return ![(MCDrawInput *)self isComplete];
  }
}

- (BOOL)isCompleting
{
  if (!*(unsigned char *)([(MCDrawInput *)self resampler] + 136)) {
    return 0;
  }
  v3 = [(MCKeyboardInput *)self inputs];
  unint64_t v4 = [v3 count];
  uint64_t v5 = [(MCDrawInput *)self resampler];
  BOOL v6 = v4 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[6] - v5[5]) >> 4);

  return v6;
}

- (BOOL)isComplete
{
  if (!*(unsigned char *)([(MCDrawInput *)self resampler] + 136)) {
    return 0;
  }
  v3 = [(MCKeyboardInput *)self inputs];
  unint64_t v4 = [v3 count];
  uint64_t v5 = [(MCDrawInput *)self resampler];
  BOOL v6 = v4 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[6] - v5[5]) >> 4);

  return v6;
}

- (void)_appendWithPoint:(CGPoint)a3 timestamp:(double)a4 force:(double)a5 radius:(double)a6 touchStage:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(MCDrawInput *)self rescaleKeyboardLayout];
  if (v37)
  {
    double v30 = x;
    double v31 = y;
    double v32 = a4;
    double v33 = a5;
    double v34 = a6;
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v37);
    [(MCDrawInput *)self keyboardLayout];
    double v15 = v37[15];
    double v14 = v37[16];
    double v16 = v37[17];
    double v17 = v37[18];
    [(MCDrawInput *)self rescaleKeyboardLayout];
    double v19 = v36[15];
    double v18 = v36[16];
    double v21 = v36[17];
    double v20 = v36[18];
    v39.origin.double x = v15;
    v39.origin.double y = v14;
    v39.size.width = v16;
    v39.size.height = v17;
    v40.origin.double x = v19;
    v40.origin.double y = v18;
    v40.size.width = v21;
    v40.size.height = v20;
    if (CGRectEqualToRect(v39, v40))
    {
      double x = v30;
      double y = v31;
    }
    else
    {
      double x = v19 + (v30 - v15) / v16 * v21;
      double y = v18 + (v31 - v14) / v17 * v20;
    }
    a5 = v33;
    a6 = v34;
    a4 = v32;
    if (v36) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v36);
    }
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v37);
  }
  if ([(MCDrawInput *)self shouldResample])
  {
    long long v22 = [(MCDrawInput *)self resampler];
    v38.double x = x;
    v38.double y = y;
    unsigned int v23 = TI::CP::PathResampler::append_and_resample(v22, v38, a4, a5, a6);
    v24 = [(MCDrawInput *)self resampler];
    int64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24[6] - v24[5]) >> 4) - v23;
    if (v25 >= 1)
    {
      do
      {
        [(MCKeyboardInput *)self removeComposingInput];
        --v25;
      }
      while (v25);
    }
    if (v7 == 2) {
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)[(MCDrawInput *)self resampler]);
    }
    [(MCDrawInput *)self _updateSampledInputs];
  }
  else
  {
    std::vector<unsigned int> v26 = [(MCKeyboardInput *)self inputs];
    if ([v26 count])
    {
      v27 = [(MCKeyboardInput *)self inputs];
      v28 = [v27 lastObject];
    }
    else
    {
      v28 = 0;
    }

    uint64_t v29 = -[MCDrawInput _createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:](self, "_createDrawableTouchInputWithPoint:timestamp:force:radius:touchStage:previousTouchInput:isInflectionPoint:", v7, v28, 0, x, y, a4, a5, a6);
    v35.receiver = self;
    v35.super_class = (Class)MCDrawInput;
    [(MCKeyboardInput *)&v35 composeNew:v29];
    if (v7 == 2) {
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)[(MCDrawInput *)self resampler]);
    }
  }
}

- (void)composeWith:(id)a3
{
  id v19 = a3;
  if (![(MCDrawInput *)self _canCompose]) {
    goto LABEL_33;
  }
  if ([(MCDrawInput *)self shouldResample])
  {
    if (![v19 stage])
    {
      uint64_t v10 = [(MCDrawInput *)self resampler];
      uint64_t v11 = v10[12];
      if (v10[11] != v11 && *(double *)(v11 - 16) > 0.0) {
        goto LABEL_33;
      }
    }
  }
  if ([(MCDrawInput *)self shouldResample])
  {
    if ([v19 stage])
    {
      uint64_t v5 = [(MCDrawInput *)self resampler];
      if (v5[12] == v5[11]) {
        goto LABEL_33;
      }
    }
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample") || [v19 stage])
  {
    int v6 = 0;
  }
  else
  {
    v3 = [(MCKeyboardInput *)self inputs];
    if ([v3 count])
    {

      goto LABEL_33;
    }
    int v6 = 1;
  }
  if (-[MCDrawInput shouldResample](self, "shouldResample") || ![v19 stage])
  {
    if (v6) {

    }
LABEL_18:
    if (![v19 stage])
    {
      if ((int)[v19 fingerID] > 7)
      {
        uint64_t v9 = 2;
LABEL_28:
        [(MCDrawInput *)self setDrawHand:v9];
        goto LABEL_29;
      }
      if ((int)[v19 fingerID] >= 2)
      {
        uint64_t v9 = 1;
        goto LABEL_28;
      }
    }
LABEL_29:
    if (-[MCDrawInput shouldResample](self, "shouldResample") && [v19 stage] == 2)
    {
      TI::CP::PathResampler::finalize((TI::CP::PathResampler *)[(MCDrawInput *)self resampler]);
      [(MCDrawInput *)self _updateSampledInputs];
    }
    else
    {
      [v19 location];
      double v13 = v12;
      double v15 = v14;
      [v19 timestamp];
      double v17 = v16;
      [v19 radius];
      -[MCDrawInput _appendWithPoint:timestamp:force:radius:touchStage:](self, "_appendWithPoint:timestamp:force:radius:touchStage:", [v19 stage], v13, v15, v17, 0.0, v18);
    }
    goto LABEL_33;
  }
  uint64_t v7 = [(MCKeyboardInput *)self inputs];
  uint64_t v8 = [v7 count];

  if (v6) {
  if (v8)
  }
    goto LABEL_18;
LABEL_33:
}

- (void)composeNew:(id)a3
{
  id v15 = a3;
  if (-[MCDrawInput canComposeNew:](self, "canComposeNew:") && ![(MCDrawInput *)self isCompleting])
  {
    id v4 = v15;
    uint64_t v5 = [(MCKeyboardInput *)self inputs];
    BOOL v6 = [v5 count] != 0;

    [v4 touchPoint];
    double v8 = v7;
    double v10 = v9;
    [v4 timestamp];
    double v12 = v11;
    [v4 radius];
    double v14 = v13;

    -[MCDrawInput _appendWithPoint:timestamp:force:radius:touchStage:](self, "_appendWithPoint:timestamp:force:radius:touchStage:", v6, v8, v10, v12, 0.0, v14);
  }
}

- (BOOL)canComposeNew:(id)a3
{
  id v4 = a3;
  if ([(MCDrawInput *)self isComplete])
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_canCompose
{
  if ([(MCDrawInput *)self isCompleting]) {
    return 0;
  }
  else {
    return ![(MCDrawInput *)self isComplete];
  }
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28E78], "string", a3);
  uint64_t v5 = [(MCKeyboardInput *)self inputs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if ([(MCDrawInput *)self shouldResample]) {
      double v7 = @"resampled ";
    }
    else {
      double v7 = &stru_1F3F7A998;
    }
    double v8 = [(MCKeyboardInput *)self inputs];
    uint64_t v9 = [v8 count];
    if ([(MCDrawInput *)self shouldResample]) {
      double v10 = @"YES";
    }
    else {
      double v10 = @"NO";
    }
    [(MCDrawInput *)self rescaleKeyboardLayout];
    if (v13) {
      double v11 = @"YES";
    }
    else {
      double v11 = @"NO";
    }
    [v4 appendFormat:@"MCDrawInput: %@samples = %lu, shouldResample = %@, shouldRescale = %@", v7, v9, v10, v11];
    if (v13) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v13);
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MCDrawInput;
  id v4 = [(MCKeyboardInput *)&v12 copyWithZone:a3];
  if (v4)
  {
    +[MCDrawInput copyKeyboardLayout:&self->_keyboardLayout];
    uint64_t v5 = *((void *)v4 + 5);
    *((void *)v4 + 5) = v11;
    if (v5) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v5);
    }
    +[MCDrawInput copyKeyboardLayout:&self->_rescaleKeyboardLayout];
    uint64_t v6 = *((void *)v4 + 6);
    *((void *)v4 + 6) = 0;
    if (v6) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v6);
    }
    v4[32] = self->_shouldResample;
    long long v8 = *(_OWORD *)&self->_resampler.m_params.segment_length;
    long long v7 = *(_OWORD *)&self->_resampler.m_params.should_downsample;
    v4[88] = self->_resampler.m_params.should_flush_on_pause;
    *(_OWORD *)(v4 + 56) = v8;
    *(_OWORD *)(v4 + 72) = v7;
    TI::CP::Path::operator=((char **)v4 + 12, (const void **)&self->_resampler.m_resampled_path.m_samples.__begin_);
    TI::CP::Path::operator=((char **)v4 + 18, (const void **)&self->_resampler.m_raw_path.m_samples.__begin_);
    uint64_t v9 = *(void *)&self->_resampler.m_is_final;
    *((_DWORD *)v4 + 50) = self->_resampler.m_retroactively_processed_sample_count;
    *((void *)v4 + 24) = v9;
    *((_DWORD *)v4 + 9) = self->_drawHand;
  }
  return v4;
}

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4 shouldResample:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)MCDrawInput;
  long long v8 = [(MCKeyboardInput *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    double v10 = *(atomic_uint **)a3;
    if (*(void *)a3) {
      atomic_fetch_add(v10, 1u);
    }
    uint64_t m_ptr = (uint64_t)v8->_keyboardLayout.m_ptr;
    v9->_keyboardLayout.uint64_t m_ptr = (KeyboardLayout *)v10;
    if (m_ptr) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(m_ptr);
    }
    objc_super v12 = *(atomic_uint **)a4;
    if (*(void *)a4) {
      atomic_fetch_add(v12, 1u);
    }
    uint64_t v13 = (uint64_t)v9->_rescaleKeyboardLayout.m_ptr;
    v9->_rescaleKeyboardLayout.uint64_t m_ptr = (KeyboardLayout *)v12;
    if (v13) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v13);
    }
    v9->_shouldResample = a5;
    v9->_resampler.m_params.segment_length = 15.0;
    *(void *)&v9->_resampler.m_params.inflection_point_detection_mode = 2;
    v9->_resampler.m_params.should_downsample = 1;
    v9->_resampler.m_params.minimum_pause_length = 0.3;
    v9->_resampler.m_params.should_flush_on_pause = 0;
    v9->_drawHand = 0;
  }
  return v9;
}

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3 rescaleKeyboardLayout:(const void *)a4
{
  uint64_t v6 = 0;
  id v4 = [(MCDrawInput *)self initWithKeyboardLayout:a3 rescaleKeyboardLayout:&v6 shouldResample:1];
  if (v6) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v6);
  }
  return v4;
}

- (MCDrawInput)initWithKeyboardLayout:(const void *)a3
{
  uint64_t v5 = 0;
  v3 = [(MCDrawInput *)self initWithKeyboardLayout:a3 rescaleKeyboardLayout:&v5];
  if (v5) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v5);
  }
  return v3;
}

+ (RefPtr<TI::Favonius::KeyboardLayout>)copyKeyboardLayout:(const void *)a3
{
  id v4 = v3;
  uint64_t v5 = *(void *)a3;
  if (*(void *)a3)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x4812000000;
    v12[3] = __Block_byref_object_copy__12747;
    v12[4] = __Block_byref_object_dispose__12748;
    v12[5] = "";
    memset(&v12[6], 0, 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v9 = __34__MCDrawInput_copyKeyboardLayout___block_invoke;
    double v10 = &unk_1E6E2C768;
    uint64_t v11 = v12;
    uint64_t v6 = *(void *)(v5 + 8);
    for (uint64_t i = *(void *)(v5 + 16); v6 != i; v6 += 8)
      v9((uint64_t)v8, v6);
    operator new();
  }
  void *v4 = 0;
  return (RefPtr<TI::Favonius::KeyboardLayout>)a1;
}

void __34__MCDrawInput_copyKeyboardLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  KB::String::String((KB::String *)v3, (const KB::String *)(*(void *)a2 + 8));
  if (*(unsigned __int16 *)(*(void *)a2 + 40) >= 0xFuLL) {
    operator new[]();
  }
  operator new();
}

@end