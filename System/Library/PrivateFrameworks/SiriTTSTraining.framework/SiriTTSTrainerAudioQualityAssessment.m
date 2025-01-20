@interface SiriTTSTrainerAudioQualityAssessment
+ (float)DO_NOT_NORMALIZE;
+ (float)default_target_db;
+ (float)default_threshold_db;
- (float)SNR;
- (float)SNR_end;
- (float)SNR_threshold;
- (float)SNR_unnormalized;
- (float)SNR_unnormalized_end;
- (float)SPL;
- (float)SPL_end;
- (float)SPL_threshold;
- (float)SPL_unnormalized;
- (float)SPL_unnormalized_end;
- (id).cxx_construct;
- (uint64_t)initWithMetrics:(void *)a3 unnormalized:;
@end

@implementation SiriTTSTrainerAudioQualityAssessment

- (uint64_t)initWithMetrics:(void *)a3 unnormalized:
{
  if (!a1) {
    goto LABEL_77;
  }
  if (a1 + 1 != a2)
  {
    v5 = a2 + 1;
    v6 = (void *)*a2;
    if (a1[3])
    {
      v8 = (uint64_t **)(a1 + 2);
      uint64_t v7 = a1[2];
      uint64_t v9 = a1[1];
      a1[1] = (uint64_t)(a1 + 2);
      *(void *)(v7 + 16) = 0;
      a1[2] = 0;
      a1[3] = 0;
      if (*(void *)(v9 + 8)) {
        uint64_t v10 = *(void *)(v9 + 8);
      }
      else {
        uint64_t v10 = v9;
      }
      if (v10)
      {
        v11 = std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::_DetachedTreeCache::__detach_next(v10);
        if (v6 == v5)
        {
          v13 = (void *)v10;
        }
        else
        {
          v12 = v6;
          do
          {
            v13 = v11;
            int v14 = *((_DWORD *)v12 + 8);
            *(_DWORD *)(v10 + 32) = v14;
            *(void *)(v10 + 40) = v12[5];
            v15 = *v8;
            v16 = (uint64_t **)(a1 + 2);
            v17 = (uint64_t **)(a1 + 2);
            if (*v8)
            {
              do
              {
                while (1)
                {
                  v16 = (uint64_t **)v15;
                  if (v14 >= *((_DWORD *)v15 + 8)) {
                    break;
                  }
                  v15 = (uint64_t *)*v15;
                  v17 = v16;
                  if (!*v16) {
                    goto LABEL_16;
                  }
                }
                v15 = (uint64_t *)v15[1];
              }
              while (v15);
              v17 = v16 + 1;
            }
LABEL_16:
            std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::__insert_node_at((uint64_t **)a1 + 1, (uint64_t)v16, v17, (uint64_t *)v10);
            if (v11) {
              v11 = std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
            }
            else {
              v11 = 0;
            }
            v18 = (void *)v12[1];
            if (v18)
            {
              do
              {
                v6 = v18;
                v18 = (void *)*v18;
              }
              while (v18);
            }
            else
            {
              do
              {
                v6 = (void *)v12[2];
                BOOL v19 = *v6 == (void)v12;
                v12 = v6;
              }
              while (!v19);
            }
            if (!v13) {
              break;
            }
            uint64_t v10 = (uint64_t)v13;
            v12 = v6;
          }
          while (v6 != v5);
        }
        std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::destroy((uint64_t)(a1 + 1), v13);
        if (!v11) {
          goto LABEL_34;
        }
        for (i = (void *)v11[2]; i; i = (void *)i[2])
          v11 = i;
        uint64_t v20 = (uint64_t)(a1 + 1);
        v21 = v11;
      }
      else
      {
        uint64_t v20 = (uint64_t)(a1 + 1);
        v21 = 0;
      }
      std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::destroy(v20, v21);
    }
LABEL_34:
    if (v6 != v5)
    {
      v23 = (uint64_t **)(a1 + 2);
      do
      {
        v24 = operator new(0x30uLL);
        v24[2] = *((_OWORD *)v6 + 2);
        v25 = *v23;
        v26 = (uint64_t **)(a1 + 2);
        v27 = (uint64_t **)(a1 + 2);
        if (*v23)
        {
          do
          {
            while (1)
            {
              v26 = (uint64_t **)v25;
              if (*((_DWORD *)v24 + 8) >= *((_DWORD *)v25 + 8)) {
                break;
              }
              v25 = (uint64_t *)*v25;
              v27 = v26;
              if (!*v26) {
                goto LABEL_42;
              }
            }
            v25 = (uint64_t *)v25[1];
          }
          while (v25);
          v27 = v26 + 1;
        }
LABEL_42:
        std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::__insert_node_at((uint64_t **)a1 + 1, (uint64_t)v26, v27, (uint64_t *)v24);
        v28 = (void *)v6[1];
        if (v28)
        {
          do
          {
            v29 = v28;
            v28 = (void *)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (void *)v6[2];
            BOOL v19 = *v29 == (void)v6;
            v6 = v29;
          }
          while (!v19);
        }
        v6 = v29;
      }
      while (v29 != v5);
    }
  }
  if (a3[2])
  {
    v30 = (void *)*a3;
    if ((void *)*a3 != a3 + 1)
    {
      v31 = (uint64_t **)(a1 + 2);
      do
      {
        v32 = *v31;
        if (*v31)
        {
          int v33 = *((_DWORD *)v30 + 8);
          v34 = (uint64_t **)(a1 + 2);
          while (1)
          {
            while (1)
            {
              v35 = (uint64_t **)v32;
              int v36 = *((_DWORD *)v32 + 8);
              if (v33 >= v36) {
                break;
              }
              v32 = *v35;
              v34 = v35;
              if (!*v35)
              {
                v37 = 0;
                v34 = v35;
                goto LABEL_61;
              }
            }
            if (v36 >= v33) {
              break;
            }
            v34 = v35 + 1;
            v32 = v35[1];
            if (!v32)
            {
              v37 = 0;
              goto LABEL_61;
            }
          }
          v37 = v35;
        }
        else
        {
          v37 = 0;
          v35 = (uint64_t **)(a1 + 2);
          v34 = (uint64_t **)(a1 + 2);
        }
LABEL_61:
        v38 = (void *)v30[1];
        v39 = v38;
        v40 = v30;
        if (v38)
        {
          do
          {
            v41 = v39;
            v39 = (void *)*v39;
          }
          while (v39);
        }
        else
        {
          do
          {
            v41 = (void *)v40[2];
            BOOL v19 = *v41 == (void)v40;
            v40 = v41;
          }
          while (!v19);
        }
        if (!v37)
        {
          v42 = v30;
          if (v38)
          {
            do
            {
              v43 = v38;
              v38 = (void *)*v38;
            }
            while (v38);
          }
          else
          {
            do
            {
              v43 = (void *)v42[2];
              BOOL v19 = *v43 == (void)v42;
              v42 = v43;
            }
            while (!v19);
          }
          if ((void *)*a3 == v30) {
            *a3 = v43;
          }
          v44 = (uint64_t *)a3[1];
          --a3[2];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v44, v30);
          std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::__insert_node_at((uint64_t **)a1 + 1, (uint64_t)v35, v34, v30);
        }
        v30 = v41;
      }
      while (v41 != a3 + 1);
    }
  }
  v45 = a1;
LABEL_77:

  return a1;
}

- (float)SPL
{
  int v3 = 2;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SNR
{
  int v3 = 3;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SPL_unnormalized
{
  int v3 = 2;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SNR_unnormalized
{
  int v3 = 3;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SPL_end
{
  int v3 = 4;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SNR_end
{
  int v3 = 5;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SPL_unnormalized_end
{
  int v3 = 6;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SNR_unnormalized_end
{
  int v3 = 7;
  v4 = &v3;
  return *((double *)std::__tree<std::__value_type<AudioQualityMetric,double>,std::__map_value_compare<AudioQualityMetric,std::__value_type<AudioQualityMetric,double>,std::less<AudioQualityMetric>,true>,std::allocator<std::__value_type<AudioQualityMetric,double>>>::__emplace_unique_key_args<AudioQualityMetric,std::piecewise_construct_t const&,std::tuple<AudioQualityMetric const&>,std::tuple<>>((uint64_t **)&self->_metrics, &v3, (uint64_t)&std::piecewise_construct, &v4)+ 5);
}

- (float)SPL_threshold
{
  return 28.0;
}

- (float)SNR_threshold
{
  return 30.0;
}

+ (float)default_target_db
{
  return -28.0;
}

+ (float)default_threshold_db
{
  return -35.0;
}

+ (float)DO_NOT_NORMALIZE
{
  return NAN;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end