@interface _UIVelocityIntegrator
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)offset3D;
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)velocity3D;
- (BOOL)hasVelocity;
- (CGVector)offset;
- (CGVector)velocity;
- (_UIVelocityIntegrator)init;
- (double)hysteresisTimeInterval;
- (double)minimumRequiredMovement;
- (float64_t)_offset3D;
- (id).cxx_construct;
- (void)_velocity3D;
- (void)addSample3D:(id)a3;
- (void)addSample:(CGPoint)a3;
- (void)reset;
- (void)setHysteresisTimeInterval:(double)a3;
- (void)setMinimumRequiredMovement:(double)a3;
@end

@implementation _UIVelocityIntegrator

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (BOOL)hasVelocity
{
  long long v3 = 0u;
  long long v4 = 0u;
  [(_UIVelocityIntegrator *)&v3 _velocity3D];
  return fabs(*(double *)&v3) >= 2.22044605e-16
      || fabs(*((double *)&v3 + 1)) >= 2.22044605e-16
      || fabs(*(double *)&v4) >= 2.22044605e-16;
}

- (void)_velocity3D
{
  if (a2)
  {
    if (!*(unsigned char *)(a2 + 56))
    {
      float64x2_t v4 = 0uLL;
      uint64_t v5 = 0;
      if (*(void *)(a2 + 48) >= 2uLL)
      {
        double v6 = *(double *)(*(void *)(*(void *)(a2 + 16) + 8 * (*(void *)(a2 + 40) / 0x33uLL))
                       + 80 * (*(void *)(a2 + 40) % 0x33uLL));
        v7.f64[0] = CACurrentMediaTime();
        uint64_t v5 = 0;
        float64x2_t v4 = 0uLL;
        v7.f64[0] = v7.f64[0] - v6;
        if (v7.f64[0] > 0.0)
        {
          v7.f64[0] = 1.0 / v7.f64[0];
          float64x2_t v4 = vmulq_n_f64(*(float64x2_t *)(a2 + 112), v7.f64[0]);
          uint64_t v5 = *(_OWORD *)&vmulq_f64(v7, *(float64x2_t *)(a2 + 128));
        }
      }
      *(float64x2_t *)(a2 + 144) = v4;
      *(void *)(a2 + 160) = v5;
      *(void *)(a2 + 168) = 0;
      *(unsigned char *)(a2 + 56) = 1;
    }
    long long v8 = *(_OWORD *)(a2 + 160);
    *a1 = *(_OWORD *)(a2 + 144);
    a1[1] = v8;
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
}

- (CGVector)velocity
{
  memset(v4, 0, sizeof(v4));
  [(_UIVelocityIntegrator *)v4 _velocity3D];
  double v3 = *((double *)v4 + 1);
  double v2 = *(double *)v4;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (void)addSample:(CGPoint)a3
{
  v3[0] = a3;
  v3[1] = (CGPoint)xmmword_186B89740;
  [(_UIVelocityIntegrator *)self addSample3D:v3];
}

- (void)addSample3D:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  double v5 = *(double *)v3;
  double v6 = *(double *)(v3 + 8);
  double v7 = *(double *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  double v9 = CACurrentMediaTime();
  if (self)
  {
    double v10 = v9;
    p_samples = &self->_samples;
    unint64_t value = self->_samples.__size_.__value_;
    if (value)
    {
      v13 = (float64x2_t *)((char *)self->_samples.__map_.__begin_[(self->_samples.__start_ + value - 1) / 0x33]
                          + 80 * ((self->_samples.__start_ + value - 1) % 0x33));
      double v14 = v13[1].f64[0];
      double v15 = v13[1].f64[1];
      double v16 = v13[2].f64[0];
      double minimumRequiredMovement = self->_minimumRequiredMovement;
      double v18 = vabdd_f64(v15, v6);
      BOOL v19 = vabdd_f64(v14, v5) < minimumRequiredMovement && v18 < minimumRequiredMovement;
      double v20 = vabdd_f64(v16, v7);
      if (v19 && v20 < minimumRequiredMovement)
      {
        v13->f64[0] = v10;
        return;
      }
      double v22 = v13->f64[0];
      if (v10 - v13->f64[0] <= 0.0)
      {
        float64_t v23 = v13[2].f64[0];
        double v24 = v13[4].f64[0];
        *(float64x2_t *)&self->_totalTranslation.var0.x = vsubq_f64(*(float64x2_t *)&self->_totalTranslation.var0.x, v13[3]);
        self->_totalTranslation.var0.z = self->_totalTranslation.var0.z - v24;
        self->_samples.__size_.__value_ = value - 1;
        std::deque<_UIVelocityIntegratorDataSample>::__maybe_remove_back_spare[abi:nn180100](&self->_samples.__map_.__first_);
        unint64_t value = self->_samples.__size_.__value_;
        if (value)
        {
          v25 = (double *)((char *)self->_samples.__map_.__begin_[(value + self->_samples.__start_ - 1) / 0x33]
                         + 80 * ((value + self->_samples.__start_ - 1) % 0x33));
          double v22 = *v25;
          double v14 = v25[2];
          double v15 = v25[3];
          double v16 = v25[4];
        }
        else
        {
          double v16 = v23;
        }
      }
    }
    else
    {
      double v22 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
    }
    *(double *)&v95[3] = v6;
    *(double *)&v95[4] = v7;
    v95[5] = v8;
    *(double *)&v95[2] = v5;
    *(double *)v95 = v10;
    long long v96 = 0u;
    long long v97 = 0u;
    double hysteresisTimeInterval = self->_hysteresisTimeInterval;
    double v27 = v10 - v22;
    if (hysteresisTimeInterval != 0.0 && v27 > hysteresisTimeInterval)
    {
      [(_UIVelocityIntegrator *)self reset];
LABEL_25:
      std::deque<_UIVelocityIntegratorDataSample>::push_back(&self->_samples.__map_.__first_, (uint64_t)v95);
      *(_OWORD *)&self->_totalTranslation.var0.x = 0u;
      *(_OWORD *)&self->_totalTranslation.var0.z = 0u;
LABEL_26:
      self->_hasMemoizedVelocity = 0;
      return;
    }
    if (v22 == 0.0) {
      goto LABEL_25;
    }
    if (value < 2
      || (double resetHysteresisOnSampleThetaDiff = self->_resetHysteresisOnSampleThetaDiff,
          resetHysteresisOnSampleThetaDiff == 0.0))
    {
LABEL_36:
      double v34 = v7 - v16;
      *(double *)&long long v96 = v5 - v14;
      *((double *)&v96 + 1) = v6 - v15;
      long long v97 = *(unint64_t *)&v34;
      if (hysteresisTimeInterval == 0.0)
      {
        uint64_t v42 = 0;
        unint64_t v36 = self->_samples.__size_.__value_;
      }
      else
      {
        begin = self->_samples.__map_.__begin_;
        unint64_t v36 = self->_samples.__size_.__value_;
        if (self->_samples.__map_.__end_ == begin
          || (unint64_t start = self->_samples.__start_,
              v38 = &begin[start / 0x33],
              v39 = *v38,
              v40 = (double *)((char *)*v38 + 80 * (start % 0x33)),
              unint64_t v41 = (unint64_t)begin[(start + v36) / 0x33] + 80 * ((start + v36) % 0x33),
              v40 == (double *)v41))
        {
          uint64_t v42 = 0;
        }
        else
        {
          uint64_t v42 = 0;
          do
          {
            if (v10 - *v40 <= hysteresisTimeInterval) {
              break;
            }
            v40 += 10;
            if ((char *)v40 - v39 == 4080)
            {
              v43 = (double *)v38[1];
              ++v38;
              v39 = v43;
              v40 = v43;
            }
            ++v42;
          }
          while (v40 != (double *)v41);
        }
      }
      double padding = self->_totalTranslation.var0._padding;
      double v45 = v5 - v14 + self->_totalTranslation.var0.x;
      double v46 = v6 - v15 + self->_totalTranslation.var0.y;
      double v47 = v34 + self->_totalTranslation.var0.z;
      if (v36 - v42 < self->_maxNumberOfSamples) {
        uint64_t v48 = v42;
      }
      else {
        uint64_t v48 = v42 + 1;
      }
      if (v48)
      {
        unint64_t v49 = self->_samples.__start_;
        v51 = self->_samples.__map_.__begin_;
        end = self->_samples.__map_.__end_;
        v52 = (char **)&v51[v49 / 0x33];
        v53 = *v52;
        if (end == v51) {
          v54 = 0;
        }
        else {
          v54 = (double *)&v53[80 * (v49 % 0x33)];
        }
        v55 = *v52;
        v56 = &v51[v49 / 0x33];
        do
        {
          v57 = v54 + 10;
          if ((char *)(v54 + 10) - v55 == 4080)
          {
            v58 = (double *)v56[1];
            ++v56;
            v55 = (char *)v58;
            v57 = v58;
          }
          double v45 = v45 - v54[6];
          double v46 = v46 - v54[7];
          double v47 = v47 - v54[8];
          v54 = v57;
          --v48;
        }
        while (v48);
        if (end == v51) {
          v59 = 0;
        }
        else {
          v59 = &v53[80 * (v49 % 0x33)];
        }
        if (v57 == (double *)v59) {
          unint64_t v60 = 0;
        }
        else {
          unint64_t v60 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v57 - v55) >> 4)
        }
              + 51 * (((char *)v56 - (char *)v52) >> 3)
              + 0x3333333333333333 * ((v59 - v53) >> 4);
        uint64_t v89 = v60;
        if (end == v51) {
          v61 = 0;
        }
        else {
          v61 = &v53[80 * (v49 % 0x33)];
        }
        if (v59 == v61) {
          uint64_t v62 = 0;
        }
        else {
          uint64_t v62 = 0xCCCCCCCCCCCCCCCDLL * ((v59 - v53) >> 4) + 0x3333333333333333 * ((v61 - v53) >> 4);
        }
        v92 = &v51[v49 / 0x33];
        v93 = v61;
        std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v62);
        if (v89 >= 1)
        {
          double v84 = padding;
          v85 = &self->_samples;
          unint64_t v63 = v62;
          v64 = (void **)v92;
          v65 = v93;
          v86 = self;
          uint64_t v87 = v63;
          if (v63 <= (v36 - v89) >> 1)
          {
            std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v89);
            if (v52 == (char **)v64)
            {
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v61, v65, v92, v93);
              p_samples = &self->_samples;
              double padding = v84;
            }
            else
            {
              v70 = (char *)*v64;
              v69 = (char **)(v64 - 1);
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v70, v65, v92, v93);
              v71 = v93;
              v72 = v94;
              if (v69 == v52)
              {
                p_samples = &self->_samples;
                double padding = v84;
              }
              else
              {
                p_samples = &self->_samples;
                double padding = v84;
                do
                {
                  v73 = *v69--;
                  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v73, v73 + 4080, v71, v72);
                  v71 = v93;
                  v72 = v94;
                }
                while (v69 != v52);
              }
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v61, *v52 + 4080, v71, v72);
            }
            uint64_t v62 = v87;
            unint64_t v81 = self->_samples.__size_.__value_ - v89;
            unint64_t v49 = self->_samples.__start_ + v89;
            self->_samples.__start_ = v49;
            self->_samples.__size_.__value_ = v81;
            v51 = self->_samples.__map_.__begin_;
            if (v49 >= 0x66)
            {
              do
              {
                operator delete(*v51);
                v51 = self->_samples.__map_.__begin_ + 1;
                self->_samples.__map_.__begin_ = v51;
                unint64_t v49 = self->_samples.__start_ - 51;
                self->_samples.__start_ = v49;
              }
              while (v49 > 0x65);
            }
          }
          else
          {
            std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v89);
            v66 = v93;
            v67 = &v51[(v49 + v36) / 0x33];
            if (end == v51) {
              v68 = 0;
            }
            else {
              v68 = (char *)*v67 + 80 * ((v49 + v36) % 0x33);
            }
            if (v67 != v92)
            {
              v74 = v92 + 1;
              std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v93, (unsigned char *)*v92 + 4080, v64, v65);
              v64 = (void **)v93;
              v65 = v94;
              if (v74 != v67)
              {
                v83 = v68;
                v75 = *(unsigned char **)v93;
                v91 = &v51[(v49 + v36) / 0x33];
                do
                {
                  uint64_t v76 = 0;
                  v77 = *v74;
                  for (++v64; ; ++v64)
                  {
                    int64_t v78 = 0xCCCCCCCCCCCCCCCDLL * ((v75 - v65 + 4080) >> 4);
                    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((4080 - 80 * v76) >> 4)) >= v78) {
                      unint64_t v79 = v78;
                    }
                    else {
                      unint64_t v79 = 0xCCCCCCCCCCCCCCCDLL * ((4080 - 80 * v76) >> 4);
                    }
                    if (v79) {
                      memmove(v65, (char *)v77 + 80 * v76, 80 * v79);
                    }
                    v76 += v79;
                    if (v76 == 51) {
                      break;
                    }
                    v80 = *v64;
                    v75 = v80;
                    v65 = v80;
                  }
                  v65 += 80 * v79;
                  v75 = *(v64 - 1);
                  if (v75 + 4080 == v65)
                  {
                    v75 = *v64;
                    v65 = (char *)*v64;
                  }
                  else
                  {
                    --v64;
                  }
                  v67 = v91;
                  ++v74;
                }
                while (v74 != v91);
                v68 = v83;
              }
              v66 = (char *)*v67;
            }
            std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v66, v68, v64, v65);
            p_samples = v85;
            self = v86;
            uint64_t v62 = v87;
            v86->_samples.__size_.__value_ -= v89;
            double padding = v84;
            while (std::deque<_UIVelocityIntegratorDataSample>::__maybe_remove_back_spare[abi:nn180100](v85))
              ;
            v51 = v86->_samples.__map_.__begin_;
            unint64_t v49 = v86->_samples.__start_;
          }
        }
        if (self->_samples.__map_.__end_ == v51) {
          v82 = 0;
        }
        else {
          v82 = (char *)v51[v49 / 0x33] + 80 * (v49 % 0x33);
        }
        v92 = &v51[v49 / 0x33];
        v93 = v82;
        std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v62);
      }
      std::deque<_UIVelocityIntegratorDataSample>::push_back(p_samples, (uint64_t)v95);
      self->_totalTranslation.var0.x = v45;
      self->_totalTranslation.var0.y = v46;
      self->_totalTranslation.var0.z = v47;
      self->_totalTranslation.var0._double padding = padding;
      goto LABEL_26;
    }
    double v90 = v16;
    v30 = (double *)((char *)self->_samples.__map_.__begin_[self->_samples.__start_ / 0x33]
                   + 80 * (self->_samples.__start_ % 0x33));
    double v88 = atan2(v30[3] - v15, v30[2] - v14);
    double v31 = atan2(v15 - v6, v14 - v5) - v88;
    if (v31 <= 3.14159265)
    {
      if (v31 >= -3.14159265) {
        goto LABEL_32;
      }
      double v32 = 6.28318531;
    }
    else
    {
      double v32 = -6.28318531;
    }
    double v31 = v31 + v32;
LABEL_32:
    double v16 = v90;
    if (resetHysteresisOnSampleThetaDiff < fabs(v31))
    {
      didResetHysteresisOnThetaDiffHandler = (void (**)(void))self->_didResetHysteresisOnThetaDiffHandler;
      if (didResetHysteresisOnThetaDiffHandler) {
        didResetHysteresisOnThetaDiffHandler[2]();
      }
      [(_UIVelocityIntegrator *)self reset];
      double hysteresisTimeInterval = self->_hysteresisTimeInterval;
      double v16 = v90;
    }
    goto LABEL_36;
  }
}

- (void)reset
{
  begin = self->_samples.__map_.__begin_;
  end = self->_samples.__map_.__end_;
  self->_samples.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      double v6 = self->_samples.__map_.__end_;
      begin = self->_samples.__map_.__begin_ + 1;
      self->_samples.__map_.__begin_ = begin;
      unint64_t v5 = (char *)v6 - (char *)begin;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    unint64_t v7 = 25;
    goto LABEL_7;
  }
  if (v5 >> 3 == 2)
  {
    unint64_t v7 = 51;
LABEL_7:
    self->_samples.__start_ = v7;
  }
  *(_OWORD *)&self->_totalTranslation.var0.x = 0u;
  *(_OWORD *)&self->_totalTranslation.var0.z = 0u;
  self->_hasMemoizedVelocity = 0;
}

- (void)setHysteresisTimeInterval:(double)a3
{
  self->_double hysteresisTimeInterval = a3;
}

- (_UIVelocityIntegrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVelocityIntegrator;
  CGVector result = [(_UIVelocityIntegrator *)&v3 init];
  if (result)
  {
    result->_double minimumRequiredMovement = 5.0;
    result->_maxNumberOfSamples = 20;
  }
  return result;
}

- (float64_t)_offset3D
{
  float64_t result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  if (a2)
  {
    unint64_t v3 = a2[6];
    if (v3 >= 2)
    {
      uint64_t v4 = a2[2];
      unint64_t v5 = a2[5];
      double v6 = (float64x2_t *)(*(void *)(v4 + 8 * (v5 / 0x33)) + 80 * (v5 % 0x33));
      unint64_t v7 = (float64x2_t *)(*(void *)(v4 + 8 * ((v3 + v5 - 1) / 0x33)) + 80 * ((v3 + v5 - 1) % 0x33));
      float64_t result = v7[2].f64[0] - v6[2].f64[0];
      *(float64x2_t *)a1 = vsubq_f64(v7[1], v6[1]);
      a1[2] = result;
    }
  }
  return result;
}

- (CGVector)offset
{
  memset(v4, 0, sizeof(v4));
  [(_UIVelocityIntegrator *)(double *)v4 _offset3D];
  double v3 = *((double *)v4 + 1);
  double v2 = *(double *)v4;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)velocity3D
{
  [(_UIVelocityIntegrator *)v2 _velocity3D];
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)offset3D
{
  float64_t v3 = [(_UIVelocityIntegrator *)v2 _offset3D];
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (double)minimumRequiredMovement
{
  return self->_minimumRequiredMovement;
}

- (void)setMinimumRequiredMovement:(double)a3
{
  self->_double minimumRequiredMovement = a3;
}

- (double)hysteresisTimeInterval
{
  return self->_hysteresisTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didResetHysteresisOnThetaDiffHandler, 0);
  begin = self->_samples.__map_.__begin_;
  end = self->_samples.__map_.__end_;
  self->_samples.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_samples.__map_.__end_;
      begin = self->_samples.__map_.__begin_ + 1;
      self->_samples.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 25;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 51;
LABEL_7:
    self->_samples.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      uint64_t v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    double v10 = self->_samples.__map_.__begin_;
    double v9 = self->_samples.__map_.__end_;
    if (v9 != v10) {
      self->_samples.__map_.__end_ = (_UIVelocityIntegratorDataSample **)((char *)v9
    }
                                                                        + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_samples.__map_.__first_;
  if (first)
  {
    operator delete(first);
  }
}

@end