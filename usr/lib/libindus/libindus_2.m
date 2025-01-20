uint64_t XofSvcsIf::GetNavicAlmData(uint64_t a1, char **a2)
{
  std::mutex *v4;
  uint64_t Alm;

  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  Alm = XofSvcsIf::GetAlmData<XofNavicAlmanac>(a1, 6, (void *)(a1 + 664), a2);
  std::mutex::unlock(v4);
  return Alm;
}

void sub_263D2BA44(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetAlmData<XofNavicAlmanac>(uint64_t a1, int a2, void *a3, char **a4)
{
  v4 = *a4;
  a4[1] = *a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(unsigned char *)(a1 + 48 * a2 + 17)) {
    return 7;
  }
  if (!a3[2]) {
    return 10;
  }
  v5 = a3 + 1;
  v6 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    do
    {
      v8 = (long long *)(v6 + 4);
      unint64_t v9 = (unint64_t)a4[2];
      if ((unint64_t)v4 >= v9)
      {
        v12 = *a4;
        unint64_t v13 = 0x8E38E38E38E38E39 * (((char *)v4 - *a4) >> 2);
        unint64_t v14 = v13 + 1;
        if (v13 + 1 > 0x71C71C71C71C71CLL) {
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v15 = 0x8E38E38E38E38E39 * ((uint64_t)(v9 - (void)v12) >> 2);
        if (2 * v15 > v14) {
          unint64_t v14 = 2 * v15;
        }
        if (v15 >= 0x38E38E38E38E38ELL) {
          unint64_t v16 = 0x71C71C71C71C71CLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          if (v16 > 0x71C71C71C71C71CLL) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v17 = (char *)operator new(36 * v16);
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[36 * v13];
        long long v19 = *v8;
        long long v20 = *((_OWORD *)v6 + 3);
        *((_DWORD *)v18 + 8) = *((_DWORD *)v6 + 16);
        *(_OWORD *)v18 = v19;
        *((_OWORD *)v18 + 1) = v20;
        if (v4 == (_OWORD *)v12)
        {
          v24 = (char *)v4;
          v21 = &v17[36 * v13];
        }
        else
        {
          v21 = &v17[36 * v13];
          do
          {
            long long v22 = *(_OWORD *)((char *)v4 - 36);
            long long v23 = *(_OWORD *)((char *)v4 - 20);
            *((_DWORD *)v21 - 1) = *((_DWORD *)v4 - 1);
            *(_OWORD *)(v21 - 20) = v23;
            *(_OWORD *)(v21 - 36) = v22;
            v21 -= 36;
            v4 = (_OWORD *)((char *)v4 - 36);
          }
          while (v4 != (_OWORD *)v12);
          v24 = *a4;
        }
        v4 = v18 + 36;
        *a4 = v21;
        a4[1] = v18 + 36;
        a4[2] = &v17[36 * v16];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        long long v10 = *v8;
        long long v11 = *((_OWORD *)v6 + 3);
        *((_DWORD *)v4 + 8) = *((_DWORD *)v6 + 16);
        _OWORD *v4 = v10;
        v4[1] = v11;
        v4 = (_OWORD *)((char *)v4 + 36);
      }
      a4[1] = (char *)v4;
      v25 = (void *)v6[1];
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (void *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (void *)v6[2];
          BOOL v27 = *v26 == (void)v6;
          v6 = v26;
        }
        while (!v27);
      }
      v6 = v26;
    }
    while (v26 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetGpsBrdCstEphData(uint64_t a1, char **a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofGpsQzssEphemeris>(a1, 0, (void *)(a1 + 688), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2BD30(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBrdCstEphData<XofGpsQzssEphemeris>(uint64_t a1, int a2, void *a3, char **a4)
{
  v4 = *a4;
  a4[1] = *a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(unsigned char *)(a1 + 48 * a2 + 18)) {
    return 7;
  }
  if (!a3[2]) {
    return 10;
  }
  v5 = a3 + 1;
  v6 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    do
    {
      v8 = v6 + 4;
      unint64_t v9 = (unint64_t)a4[2];
      if ((unint64_t)v4 >= v9)
      {
        unint64_t v13 = *a4;
        unint64_t v14 = 0x8E38E38E38E38E39 * (((char *)v4 - *a4) >> 3);
        unint64_t v15 = v14 + 1;
        if (v14 + 1 > 0x38E38E38E38E38ELL) {
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v16 = 0x8E38E38E38E38E39 * ((uint64_t)(v9 - (void)v13) >> 3);
        if (2 * v16 > v15) {
          unint64_t v15 = 2 * v16;
        }
        if (v16 >= 0x1C71C71C71C71C7) {
          unint64_t v17 = 0x38E38E38E38E38ELL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          if (v17 > 0x38E38E38E38E38ELL) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v18 = (char *)operator new(72 * v17);
        }
        else
        {
          v18 = 0;
        }
        long long v19 = &v18[72 * v14];
        *(_OWORD *)long long v19 = *v8;
        long long v20 = *((_OWORD *)v6 + 3);
        long long v21 = *((_OWORD *)v6 + 4);
        long long v22 = *((_OWORD *)v6 + 5);
        *((void *)v19 + 8) = v6[12];
        *((_OWORD *)v19 + 2) = v21;
        *((_OWORD *)v19 + 3) = v22;
        *((_OWORD *)v19 + 1) = v20;
        if (v4 == (_OWORD *)v13)
        {
          BOOL v27 = (char *)v4;
          long long v23 = &v18[72 * v14];
        }
        else
        {
          long long v23 = &v18[72 * v14];
          do
          {
            *(_OWORD *)(v23 - 72) = *(_OWORD *)((char *)v4 - 72);
            long long v24 = *(_OWORD *)((char *)v4 - 56);
            long long v25 = *(_OWORD *)((char *)v4 - 40);
            long long v26 = *(_OWORD *)((char *)v4 - 24);
            *((void *)v23 - 1) = *((void *)v4 - 1);
            *(_OWORD *)(v23 - 24) = v26;
            *(_OWORD *)(v23 - 40) = v25;
            *(_OWORD *)(v23 - 56) = v24;
            v23 -= 72;
            v4 = (_OWORD *)((char *)v4 - 72);
          }
          while (v4 != (_OWORD *)v13);
          BOOL v27 = *a4;
        }
        v4 = v19 + 72;
        *a4 = v23;
        a4[1] = v19 + 72;
        a4[2] = &v18[72 * v17];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        _OWORD *v4 = *v8;
        long long v10 = *((_OWORD *)v6 + 3);
        long long v11 = *((_OWORD *)v6 + 4);
        long long v12 = *((_OWORD *)v6 + 5);
        *((void *)v4 + 8) = v6[12];
        v4[2] = v11;
        v4[3] = v12;
        v4[1] = v10;
        v4 = (_OWORD *)((char *)v4 + 72);
      }
      a4[1] = (char *)v4;
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
          BOOL v30 = *v29 == (void)v6;
          v6 = v29;
        }
        while (!v30);
      }
      v6 = v29;
    }
    while (v29 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetQzssBrdCstEphData(uint64_t a1, char **a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofGpsQzssEphemeris>(a1, 2, (void *)(a1 + 760), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2C04C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetGloBrdCstEphData(uint64_t a1, uint64_t a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofGlonassBrdcastEphemeris>(a1, 4, (void *)(a1 + 712), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2C0F0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBrdCstEphData<XofGlonassBrdcastEphemeris>(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  v4 = *(_OWORD **)a4;
  *(void *)(a4 + 8) = *(void *)a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(unsigned char *)(a1 + 48 * a2 + 18)) {
    return 7;
  }
  if (!a3[2]) {
    return 10;
  }
  v5 = a3 + 1;
  v6 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    do
    {
      v8 = (long long *)(v6 + 4);
      unint64_t v9 = *(void *)(a4 + 16);
      if ((unint64_t)v4 >= v9)
      {
        long long v12 = *(_OWORD **)a4;
        uint64_t v13 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v4 - *(void *)a4) >> 2);
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) > 0x5D1745D1745D174) {
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v15 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v9 - (void)v12) >> 2);
        if (2 * v15 > v14) {
          unint64_t v14 = 2 * v15;
        }
        if (v15 >= 0x2E8BA2E8BA2E8BALL) {
          unint64_t v16 = 0x5D1745D1745D174;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          if (v16 > 0x5D1745D1745D174) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v17 = (char *)operator new(44 * v16);
        }
        else
        {
          unint64_t v17 = 0;
        }
        v18 = &v17[44 * v13];
        long long v19 = *v8;
        long long v20 = *((_OWORD *)v6 + 3);
        *(_OWORD *)(v18 + 28) = *(_OWORD *)((char *)v6 + 60);
        *(_OWORD *)v18 = v19;
        *((_OWORD *)v18 + 1) = v20;
        if (v4 == v12)
        {
          long long v24 = v4;
          long long v21 = &v17[44 * v13];
        }
        else
        {
          long long v21 = &v17[44 * v13];
          do
          {
            long long v22 = *(_OWORD *)((char *)v4 - 44);
            long long v23 = *(_OWORD *)((char *)v4 - 28);
            *(_OWORD *)(v21 - 17) = *(_OWORD *)((char *)v4 - 17);
            *(_OWORD *)(v21 - 28) = v23;
            *(_OWORD *)(v21 - 44) = v22;
            v21 -= 44;
            v4 = (_OWORD *)((char *)v4 - 44);
          }
          while (v4 != v12);
          long long v24 = *(_OWORD **)a4;
        }
        v4 = v18 + 44;
        *(void *)a4 = v21;
        *(void *)(a4 + 8) = v18 + 44;
        *(void *)(a4 + 16) = &v17[44 * v16];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        long long v10 = *v8;
        long long v11 = *((_OWORD *)v6 + 3);
        *(_OWORD *)((char *)v4 + 28) = *(_OWORD *)((char *)v6 + 60);
        _OWORD *v4 = v10;
        v4[1] = v11;
        v4 = (_OWORD *)((char *)v4 + 44);
      }
      *(void *)(a4 + 8) = v4;
      long long v25 = (void *)v6[1];
      if (v25)
      {
        do
        {
          long long v26 = v25;
          long long v25 = (void *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          long long v26 = (void *)v6[2];
          BOOL v27 = *v26 == (void)v6;
          v6 = v26;
        }
        while (!v27);
      }
      v6 = v26;
    }
    while (v26 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetGalBrdCstEphData(uint64_t a1, char **a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofGpsQzssEphemeris>(a1, 3, (void *)(a1 + 736), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2C3D8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBdsBrdCstEphData(uint64_t a1, char **a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofBeidouEphemeris>(a1, 5, (void *)(a1 + 784), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2C47C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBrdCstEphData<XofBeidouEphemeris>(uint64_t a1, int a2, void *a3, char **a4)
{
  v4 = *a4;
  a4[1] = *a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(unsigned char *)(a1 + 48 * a2 + 18)) {
    return 7;
  }
  if (!a3[2]) {
    return 10;
  }
  v5 = a3 + 1;
  v6 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    do
    {
      v8 = v6 + 5;
      unint64_t v9 = (unint64_t)a4[2];
      if ((unint64_t)v4 >= v9)
      {
        unint64_t v16 = *a4;
        unint64_t v17 = 0xF0F0F0F0F0F0F0F1 * (((char *)v4 - *a4) >> 3);
        unint64_t v18 = v17 + 1;
        if (v17 + 1 > 0x1E1E1E1E1E1E1E1) {
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v19 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v9 - (void)v16) >> 3);
        if (2 * v19 > v18) {
          unint64_t v18 = 2 * v19;
        }
        if (v19 >= 0xF0F0F0F0F0F0F0) {
          unint64_t v20 = 0x1E1E1E1E1E1E1E1;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          if (v20 > 0x1E1E1E1E1E1E1E1) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          long long v21 = (char *)operator new(136 * v20);
        }
        else
        {
          long long v21 = 0;
        }
        long long v22 = &v21[136 * v17];
        *(_OWORD *)long long v22 = *v8;
        long long v23 = *(_OWORD *)(v6 + 7);
        long long v24 = *(_OWORD *)(v6 + 9);
        long long v25 = *(_OWORD *)(v6 + 13);
        *((_OWORD *)v22 + 3) = *(_OWORD *)(v6 + 11);
        *((_OWORD *)v22 + 4) = v25;
        *((_OWORD *)v22 + 1) = v23;
        *((_OWORD *)v22 + 2) = v24;
        long long v26 = *(_OWORD *)(v6 + 15);
        long long v27 = *(_OWORD *)(v6 + 17);
        long long v28 = *(_OWORD *)(v6 + 19);
        *((void *)v22 + 16) = v6[21];
        *((_OWORD *)v22 + 6) = v27;
        *((_OWORD *)v22 + 7) = v28;
        *((_OWORD *)v22 + 5) = v26;
        if (v4 == (_OWORD *)v16)
        {
          v36 = (char *)v4;
          v29 = &v21[136 * v17];
        }
        else
        {
          v29 = &v21[136 * v17];
          do
          {
            *(_OWORD *)(v29 - 136) = *(_OWORD *)((char *)v4 - 136);
            long long v30 = *(_OWORD *)((char *)v4 - 120);
            long long v31 = *(_OWORD *)((char *)v4 - 104);
            long long v32 = *(_OWORD *)((char *)v4 - 88);
            *(_OWORD *)(v29 - 72) = *(_OWORD *)((char *)v4 - 72);
            *(_OWORD *)(v29 - 88) = v32;
            *(_OWORD *)(v29 - 104) = v31;
            *(_OWORD *)(v29 - 120) = v30;
            long long v33 = *(_OWORD *)((char *)v4 - 56);
            long long v34 = *(_OWORD *)((char *)v4 - 40);
            long long v35 = *(_OWORD *)((char *)v4 - 24);
            *(void *)(v29 - 10) = *(void *)((char *)v4 - 10);
            *(_OWORD *)(v29 - 24) = v35;
            *(_OWORD *)(v29 - 40) = v34;
            *(_OWORD *)(v29 - 56) = v33;
            v29 -= 136;
            v4 = (_OWORD *)((char *)v4 - 136);
          }
          while (v4 != (_OWORD *)v16);
          v36 = *a4;
        }
        v4 = v22 + 136;
        *a4 = v29;
        a4[1] = v22 + 136;
        a4[2] = &v21[136 * v20];
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        _OWORD *v4 = *v8;
        long long v10 = *(_OWORD *)(v6 + 7);
        long long v11 = *(_OWORD *)(v6 + 9);
        long long v12 = *(_OWORD *)(v6 + 13);
        v4[3] = *(_OWORD *)(v6 + 11);
        v4[4] = v12;
        v4[1] = v10;
        v4[2] = v11;
        long long v13 = *(_OWORD *)(v6 + 15);
        long long v14 = *(_OWORD *)(v6 + 17);
        long long v15 = *(_OWORD *)(v6 + 19);
        *((void *)v4 + 16) = v6[21];
        v4[6] = v14;
        v4[7] = v15;
        v4[5] = v13;
        v4 = (_OWORD *)((char *)v4 + 136);
      }
      a4[1] = (char *)v4;
      v37 = (void *)v6[1];
      if (v37)
      {
        do
        {
          v38 = v37;
          v37 = (void *)*v37;
        }
        while (v37);
      }
      else
      {
        do
        {
          v38 = (void *)v6[2];
          BOOL v39 = *v38 == (void)v6;
          v6 = v38;
        }
        while (!v39);
      }
      v6 = v38;
    }
    while (v38 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetSbasBrdCstEphData(uint64_t a1, char **a2)
{
  a2[1] = *a2;
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1 && *(unsigned char *)(a1 + 66))
  {
    if (*(void *)(a1 + 824))
    {
      v5 = *(void **)(a1 + 808);
      v6 = (void *)(a1 + 816);
      if (v5 != v6)
      {
        v7 = a2[1];
        do
        {
          v8 = (long long *)(v5 + 4);
          unint64_t v9 = (unint64_t)a2[2];
          if ((unint64_t)v7 >= v9)
          {
            long long v12 = *a2;
            unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a2) >> 3);
            unint64_t v14 = v13 + 1;
            if (v13 + 1 > 0x666666666666666) {
              std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v9 - (void)v12) >> 3);
            if (2 * v15 > v14) {
              unint64_t v14 = 2 * v15;
            }
            if (v15 >= 0x333333333333333) {
              unint64_t v16 = 0x666666666666666;
            }
            else {
              unint64_t v16 = v14;
            }
            if (v16)
            {
              if (v16 > 0x666666666666666) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              unint64_t v17 = (char *)operator new(40 * v16);
            }
            else
            {
              unint64_t v17 = 0;
            }
            unint64_t v18 = &v17[40 * v13];
            long long v19 = *v8;
            long long v20 = *((_OWORD *)v5 + 3);
            *((void *)v18 + 4) = v5[8];
            *(_OWORD *)unint64_t v18 = v19;
            *((_OWORD *)v18 + 1) = v20;
            if (v7 == v12)
            {
              long long v24 = v7;
              long long v21 = &v17[40 * v13];
            }
            else
            {
              long long v21 = &v17[40 * v13];
              do
              {
                long long v22 = *(_OWORD *)(v7 - 40);
                long long v23 = *(_OWORD *)(v7 - 24);
                *(void *)(v21 - 9) = *(void *)(v7 - 9);
                *(_OWORD *)(v21 - 24) = v23;
                *(_OWORD *)(v21 - 40) = v22;
                v21 -= 40;
                v7 -= 40;
              }
              while (v7 != v12);
              long long v24 = *a2;
            }
            v7 = v18 + 40;
            *a2 = v21;
            a2[1] = v18 + 40;
            a2[2] = &v17[40 * v16];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            long long v10 = *v8;
            long long v11 = *((_OWORD *)v5 + 3);
            *((void *)v7 + 4) = v5[8];
            *(_OWORD *)v7 = v10;
            *((_OWORD *)v7 + 1) = v11;
            v7 += 40;
          }
          a2[1] = v7;
          long long v25 = (void *)v5[1];
          if (v25)
          {
            do
            {
              long long v26 = v25;
              long long v25 = (void *)*v25;
            }
            while (v25);
          }
          else
          {
            do
            {
              long long v26 = (void *)v5[2];
              BOOL v27 = *v26 == (void)v5;
              v5 = v26;
            }
            while (!v27);
          }
          v5 = v26;
        }
        while (v26 != v6);
      }
      uint64_t v28 = 1;
    }
    else
    {
      uint64_t v28 = 10;
    }
  }
  else
  {
    uint64_t v28 = 7;
  }
  std::mutex::unlock(v4);
  return v28;
}

void sub_263D2C974(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetNavicBrdCstEphData(uint64_t a1, char **a2)
{
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofNavicEphemeris>(a1, 6, (void *)(a1 + 832), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_263D2CA20(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBrdCstEphData<XofNavicEphemeris>(uint64_t a1, int a2, void *a3, char **a4)
{
  v4 = *a4;
  a4[1] = *a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(unsigned char *)(a1 + 48 * a2 + 18)) {
    return 7;
  }
  if (!a3[2]) {
    return 10;
  }
  v5 = a3 + 1;
  v6 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    do
    {
      v8 = v6 + 4;
      unint64_t v9 = (unint64_t)a4[2];
      if ((unint64_t)v4 >= v9)
      {
        unint64_t v13 = *a4;
        unint64_t v14 = 0xF0F0F0F0F0F0F0F1 * (((char *)v4 - *a4) >> 2);
        unint64_t v15 = v14 + 1;
        if (v14 + 1 > 0x3C3C3C3C3C3C3C3) {
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v16 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v9 - (void)v13) >> 2);
        if (2 * v16 > v15) {
          unint64_t v15 = 2 * v16;
        }
        if (v16 >= 0x1E1E1E1E1E1E1E1) {
          unint64_t v17 = 0x3C3C3C3C3C3C3C3;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          if (v17 > 0x3C3C3C3C3C3C3C3) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v18 = (char *)operator new(68 * v17);
        }
        else
        {
          unint64_t v18 = 0;
        }
        long long v19 = &v18[68 * v14];
        *(_OWORD *)long long v19 = *v8;
        long long v20 = *((_OWORD *)v6 + 3);
        long long v21 = *((_OWORD *)v6 + 4);
        long long v22 = *((_OWORD *)v6 + 5);
        *((_DWORD *)v19 + 16) = *((_DWORD *)v6 + 24);
        *((_OWORD *)v19 + 2) = v21;
        *((_OWORD *)v19 + 3) = v22;
        *((_OWORD *)v19 + 1) = v20;
        if (v4 == (_OWORD *)v13)
        {
          BOOL v27 = (char *)v4;
          long long v23 = &v18[68 * v14];
        }
        else
        {
          long long v23 = &v18[68 * v14];
          do
          {
            *(_OWORD *)(v23 - 68) = *(_OWORD *)((char *)v4 - 68);
            long long v24 = *(_OWORD *)((char *)v4 - 52);
            long long v25 = *(_OWORD *)((char *)v4 - 36);
            long long v26 = *(_OWORD *)((char *)v4 - 20);
            *((_DWORD *)v23 - 1) = *((_DWORD *)v4 - 1);
            *(_OWORD *)(v23 - 20) = v26;
            *(_OWORD *)(v23 - 36) = v25;
            *(_OWORD *)(v23 - 52) = v24;
            v23 -= 68;
            v4 = (_OWORD *)((char *)v4 - 68);
          }
          while (v4 != (_OWORD *)v13);
          BOOL v27 = *a4;
        }
        v4 = v19 + 68;
        *a4 = v23;
        a4[1] = v19 + 68;
        a4[2] = &v18[68 * v17];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        _OWORD *v4 = *v8;
        long long v10 = *((_OWORD *)v6 + 3);
        long long v11 = *((_OWORD *)v6 + 4);
        long long v12 = *((_OWORD *)v6 + 5);
        *((_DWORD *)v4 + 16) = *((_DWORD *)v6 + 24);
        v4[2] = v11;
        v4[3] = v12;
        v4[1] = v10;
        v4 = (_OWORD *)((char *)v4 + 68);
      }
      a4[1] = (char *)v4;
      uint64_t v28 = (void *)v6[1];
      if (v28)
      {
        do
        {
          v29 = v28;
          uint64_t v28 = (void *)*v28;
        }
        while (v28);
      }
      else
      {
        do
        {
          v29 = (void *)v6[2];
          BOOL v30 = *v29 == (void)v6;
          v6 = v29;
        }
        while (!v30);
      }
      v6 = v29;
    }
    while (v29 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetGpsSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 0, a3, v10, a1 + 856, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2CD2C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 1128) == 1 && (unsigned __int8 v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1)) {
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, a2, a3, v12, a5, a6);
  }
  else {
    return 7;
  }
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    uint64_t v8 = a1 + 16;
    if (*(unsigned char *)(v8 + 48 * a2 + 3))
    {
      unint64_t v9 = *(void *)(v8 + 48 * a2 + 8);
      if (a2 == 1) {
        char v10 = -120;
      }
      else {
        char v10 = -1;
      }
      if (a2 == 2) {
        char v10 = 63;
      }
      if ((v9 >> (v10 + a3)))
      {
        if (a4 <= 0x2A)
        {
          uint64_t v13 = *(void *)(a5 + 8);
          uint64_t v11 = a5 + 8;
          uint64_t v12 = v13;
          if (v13)
          {
            uint64_t v14 = v11;
            do
            {
              unsigned int v15 = *(unsigned __int8 *)(v12 + 32);
              BOOL v16 = v15 >= a4;
              if (v15 >= a4) {
                unint64_t v17 = (uint64_t *)v12;
              }
              else {
                unint64_t v17 = (uint64_t *)(v12 + 8);
              }
              if (v16) {
                uint64_t v14 = v12;
              }
              uint64_t v12 = *v17;
            }
            while (*v17);
            if (v14 == v11) {
              return 7;
            }
            if (*(unsigned __int8 *)(v14 + 32) > a4) {
              return 7;
            }
            uint64_t v20 = *(void *)(v14 + 48);
            uint64_t v18 = v14 + 48;
            uint64_t v19 = v20;
            if (!v20) {
              return 7;
            }
            uint64_t v21 = v18;
            do
            {
              unsigned int v22 = *(unsigned __int8 *)(v19 + 28);
              BOOL v23 = v22 >= a3;
              if (v22 >= a3) {
                long long v24 = (uint64_t *)v19;
              }
              else {
                long long v24 = (uint64_t *)(v19 + 8);
              }
              if (v23) {
                uint64_t v21 = v19;
              }
              uint64_t v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 28) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 32);
              long long v25 = *(_OWORD *)(v21 + 48);
              long long v26 = *(_OWORD *)(v21 + 64);
              long long v27 = *(_OWORD *)(v21 + 80);
              *(void *)(a6 + 64) = *(void *)(v21 + 96);
              *(_OWORD *)(a6 + 32) = v26;
              *(_OWORD *)(a6 + 48) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetGloSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 4, a3, v10, a1 + 880, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2CFFC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetQzssSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 2, a3, v10, a1 + 928, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2D0B0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetGalSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 3, a3, v10, a1 + 904, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2D164(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBdsSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(a1, 5, a3, v10, a1 + 952, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2D218(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 1128) == 1 && (unsigned __int8 v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1)) {
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(a1, a2, a3, v12, a5, a6);
  }
  else {
    return 7;
  }
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    uint64_t v8 = a1 + 16;
    if (*(unsigned char *)(v8 + 48 * a2 + 3))
    {
      unint64_t v9 = *(void *)(v8 + 48 * a2 + 8);
      if (a2 == 1) {
        char v10 = -120;
      }
      else {
        char v10 = -1;
      }
      if (a2 == 2) {
        char v10 = 63;
      }
      if ((v9 >> (v10 + a3)))
      {
        if (a4 <= 0x2A)
        {
          uint64_t v13 = *(void *)(a5 + 8);
          uint64_t v11 = a5 + 8;
          uint64_t v12 = v13;
          if (v13)
          {
            uint64_t v14 = v11;
            do
            {
              unsigned int v15 = *(unsigned __int8 *)(v12 + 32);
              BOOL v16 = v15 >= a4;
              if (v15 >= a4) {
                unint64_t v17 = (uint64_t *)v12;
              }
              else {
                unint64_t v17 = (uint64_t *)(v12 + 8);
              }
              if (v16) {
                uint64_t v14 = v12;
              }
              uint64_t v12 = *v17;
            }
            while (*v17);
            if (v14 == v11) {
              return 7;
            }
            if (*(unsigned __int8 *)(v14 + 32) > a4) {
              return 7;
            }
            uint64_t v20 = *(void *)(v14 + 48);
            uint64_t v18 = v14 + 48;
            uint64_t v19 = v20;
            if (!v20) {
              return 7;
            }
            uint64_t v21 = v18;
            do
            {
              unsigned int v22 = *(unsigned __int8 *)(v19 + 32);
              BOOL v23 = v22 >= a3;
              if (v22 >= a3) {
                long long v24 = (uint64_t *)v19;
              }
              else {
                long long v24 = (uint64_t *)(v19 + 8);
              }
              if (v23) {
                uint64_t v21 = v19;
              }
              uint64_t v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 32) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 40);
              long long v25 = *(_OWORD *)(v21 + 56);
              long long v26 = *(_OWORD *)(v21 + 72);
              long long v27 = *(_OWORD *)(v21 + 104);
              *(_OWORD *)(a6 + 48) = *(_OWORD *)(v21 + 88);
              *(_OWORD *)(a6 + 64) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              *(_OWORD *)(a6 + 32) = v26;
              long long v28 = *(_OWORD *)(v21 + 120);
              long long v29 = *(_OWORD *)(v21 + 136);
              long long v30 = *(_OWORD *)(v21 + 152);
              *(void *)(a6 + 126) = *(void *)(v21 + 166);
              *(_OWORD *)(a6 + 96) = v29;
              *(_OWORD *)(a6 + 112) = v30;
              *(_OWORD *)(a6 + 80) = v28;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetNavicSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(a1, 6, a3, v10, a1 + 976, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_263D2D504(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 1128) == 1 && (unsigned __int8 v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1)) {
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(a1, a2, a3, v12, a5, a6);
  }
  else {
    return 7;
  }
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    uint64_t v8 = a1 + 16;
    if (*(unsigned char *)(v8 + 48 * a2 + 3))
    {
      unint64_t v9 = *(void *)(v8 + 48 * a2 + 8);
      if (a2 == 1) {
        char v10 = -120;
      }
      else {
        char v10 = -1;
      }
      if (a2 == 2) {
        char v10 = 63;
      }
      if ((v9 >> (v10 + a3)))
      {
        if (a4 <= 0x2A)
        {
          uint64_t v13 = *(void *)(a5 + 8);
          uint64_t v11 = a5 + 8;
          uint64_t v12 = v13;
          if (v13)
          {
            uint64_t v14 = v11;
            do
            {
              unsigned int v15 = *(unsigned __int8 *)(v12 + 32);
              BOOL v16 = v15 >= a4;
              if (v15 >= a4) {
                unint64_t v17 = (uint64_t *)v12;
              }
              else {
                unint64_t v17 = (uint64_t *)(v12 + 8);
              }
              if (v16) {
                uint64_t v14 = v12;
              }
              uint64_t v12 = *v17;
            }
            while (*v17);
            if (v14 == v11) {
              return 7;
            }
            if (*(unsigned __int8 *)(v14 + 32) > a4) {
              return 7;
            }
            uint64_t v20 = *(void *)(v14 + 48);
            uint64_t v18 = v14 + 48;
            uint64_t v19 = v20;
            if (!v20) {
              return 7;
            }
            uint64_t v21 = v18;
            do
            {
              unsigned int v22 = *(unsigned __int8 *)(v19 + 28);
              BOOL v23 = v22 >= a3;
              if (v22 >= a3) {
                long long v24 = (uint64_t *)v19;
              }
              else {
                long long v24 = (uint64_t *)(v19 + 8);
              }
              if (v23) {
                uint64_t v21 = v19;
              }
              uint64_t v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 28) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 32);
              long long v25 = *(_OWORD *)(v21 + 48);
              long long v26 = *(_OWORD *)(v21 + 64);
              long long v27 = *(_OWORD *)(v21 + 80);
              *(_DWORD *)(a6 + 64) = *(_DWORD *)(v21 + 96);
              *(_OWORD *)(a6 + 32) = v26;
              *(_OWORD *)(a6 + 48) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetRtiData(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6 = (std::mutex *)(a1 + 1200);
  std::mutex::lock((std::mutex *)(a1 + 1200));
  if (*(_DWORD *)(a1 + 1132) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetRtiData");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      uint64_t v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 16 * a2 + 1016);
      uint64_t v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI data is not parsed yet!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetRtiData");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_263D2D8E0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void XofSvcsIf::ClrBceOrbData(XofSvcsIf *this)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v44 = (std::mutex *)((char *)this + 1136);
  std::mutex::lock((std::mutex *)((char *)this + 1136));
  v45 = &v46;
  v46 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  uint64_t v47 = 0;
  v48 = &v49;
  v51 = &v52;
  v52 = 0;
  v55 = 0;
  uint64_t v56 = 0;
  uint64_t v53 = 0;
  v54 = &v55;
  v57 = &v58;
  v58 = 0;
  v61 = 0;
  uint64_t v62 = 0;
  uint64_t v59 = 0;
  v60 = &v61;
  v64 = 0;
  uint64_t v65 = 0;
  v63 = &v64;
  v2 = (char *)this + 696;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 688, *((void **)this + 87));
  v3 = v46;
  *((void *)this + 86) = &v46;
  *((void *)this + 87) = v3;
  uint64_t v4 = v47;
  *((void *)this + 88) = v47;
  if (v4)
  {
    v3[2] = v2;
    v45 = &v46;
    v46 = 0;
    uint64_t v47 = 0;
  }
  else
  {
    *((void *)this + 86) = v2;
  }
  v5 = (char *)this + 720;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 90));
  v6 = v49;
  *((void *)this + 89) = v48;
  *((void *)this + 90) = v6;
  uint64_t v7 = v50;
  *((void *)this + 91) = v50;
  if (v7)
  {
    v6[2] = v5;
    v48 = &v49;
    v49 = 0;
    uint64_t v50 = 0;
  }
  else
  {
    *((void *)this + 89) = v5;
  }
  uint64_t v8 = (char *)this + 744;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 736, *((void **)this + 93));
  uint64_t v9 = v52;
  *((void *)this + 92) = v51;
  *((void *)this + 93) = v9;
  uint64_t v10 = v53;
  *((void *)this + 94) = v53;
  if (v10)
  {
    v9[2] = v8;
    v51 = &v52;
    v52 = 0;
    uint64_t v53 = 0;
  }
  else
  {
    *((void *)this + 92) = v8;
  }
  uint64_t v11 = (char *)this + 768;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 760, *((void **)this + 96));
  uint64_t v12 = v55;
  *((void *)this + 95) = v54;
  *((void *)this + 96) = v12;
  uint64_t v13 = v56;
  *((void *)this + 97) = v56;
  if (v13)
  {
    v12[2] = v11;
    v54 = &v55;
    v55 = 0;
    uint64_t v56 = 0;
  }
  else
  {
    *((void *)this + 95) = v11;
  }
  uint64_t v14 = (char *)this + 792;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 784, *((void **)this + 99));
  unsigned int v15 = v58;
  *((void *)this + 98) = v57;
  *((void *)this + 99) = v15;
  uint64_t v16 = v59;
  *((void *)this + 100) = v59;
  if (v16)
  {
    v15[2] = v14;
    v57 = &v58;
    v58 = 0;
    uint64_t v59 = 0;
  }
  else
  {
    *((void *)this + 98) = v14;
  }
  unint64_t v17 = (char *)this + 816;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 808, *((void **)this + 102));
  uint64_t v18 = v61;
  *((void *)this + 101) = v60;
  *((void *)this + 102) = v18;
  uint64_t v19 = v62;
  *((void *)this + 103) = v62;
  if (v19)
  {
    v18[2] = v17;
    v60 = &v61;
    v61 = 0;
    uint64_t v62 = 0;
  }
  else
  {
    *((void *)this + 101) = v17;
  }
  uint64_t v20 = (char *)this + 840;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 832, *((void **)this + 105));
  uint64_t v21 = v64;
  *((void *)this + 104) = v63;
  *((void *)this + 105) = v21;
  uint64_t v22 = v65;
  *((void *)this + 106) = v65;
  if (v22)
  {
    v21[2] = v20;
    uint64_t v21 = 0;
    v63 = &v64;
    v64 = 0;
    uint64_t v65 = 0;
  }
  else
  {
    *((void *)this + 104) = v20;
  }
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v63, v21);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v60, v61);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v57, v58);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v54, v55);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v51, v52);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v49);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v45, v46);
  v45 = &v46;
  v46 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  uint64_t v47 = 0;
  v48 = &v49;
  v51 = &v52;
  v52 = 0;
  v55 = 0;
  uint64_t v56 = 0;
  uint64_t v53 = 0;
  v54 = &v55;
  v57 = &v58;
  v58 = 0;
  v61 = 0;
  uint64_t v62 = 0;
  uint64_t v59 = 0;
  v60 = &v61;
  BOOL v23 = (char *)this + 552;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 69));
  long long v24 = v46;
  *((void *)this + 68) = v45;
  *((void *)this + 69) = v24;
  uint64_t v25 = v47;
  *((void *)this + 70) = v47;
  if (v25)
  {
    v24[2] = v23;
    v45 = &v46;
    v46 = 0;
    uint64_t v47 = 0;
  }
  else
  {
    *((void *)this + 68) = v23;
  }
  long long v26 = (char *)this + 576;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 72));
  long long v27 = v49;
  *((void *)this + 71) = v48;
  *((void *)this + 72) = v27;
  uint64_t v28 = v50;
  *((void *)this + 73) = v50;
  if (v28)
  {
    v27[2] = v26;
    v48 = &v49;
    v49 = 0;
    uint64_t v50 = 0;
  }
  else
  {
    *((void *)this + 71) = v26;
  }
  long long v29 = (char *)this + 600;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 75));
  long long v30 = v52;
  *((void *)this + 74) = v51;
  *((void *)this + 75) = v30;
  uint64_t v31 = v53;
  *((void *)this + 76) = v53;
  if (v31)
  {
    v30[2] = v29;
    v51 = &v52;
    v52 = 0;
    uint64_t v53 = 0;
  }
  else
  {
    *((void *)this + 74) = v29;
  }
  long long v32 = (char *)this + 624;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 78));
  long long v33 = v55;
  *((void *)this + 77) = v54;
  *((void *)this + 78) = v33;
  uint64_t v34 = v56;
  *((void *)this + 79) = v56;
  if (v34)
  {
    v33[2] = v32;
    v54 = &v55;
    v55 = 0;
    uint64_t v56 = 0;
  }
  else
  {
    *((void *)this + 77) = v32;
  }
  long long v35 = (char *)this + 648;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 81));
  v36 = v58;
  *((void *)this + 80) = v57;
  *((void *)this + 81) = v36;
  uint64_t v37 = v59;
  *((void *)this + 82) = v59;
  if (v37)
  {
    v36[2] = v35;
    v57 = &v58;
    v58 = 0;
    uint64_t v59 = 0;
  }
  else
  {
    *((void *)this + 80) = v35;
  }
  v38 = (char *)this + 672;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((void **)this + 84));
  BOOL v39 = v61;
  *((void *)this + 83) = v60;
  *((void *)this + 84) = v39;
  uint64_t v40 = v62;
  *((void *)this + 85) = v62;
  if (v40)
  {
    v39[2] = v38;
    BOOL v39 = 0;
    v60 = &v61;
    v61 = 0;
    uint64_t v62 = 0;
  }
  else
  {
    *((void *)this + 83) = v38;
  }
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v39);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v58);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v55);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v52);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v49);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v46);
  *((void *)this + 46) = 0;
  v41 = (char *)this + 444;
  do
  {
    *(void *)(v41 + 5) = 0;
    *(void *)v41 = 0;
    *((_WORD *)v41 + 7) = 0;
    v41 += 16;
  }
  while (v41 != (char *)this + 540);
  uint64_t v42 = 0;
  *((void *)this + 47) = 0;
  *((void *)this + 48) = 0;
  *((_DWORD *)this + 98) = 0;
  do
  {
    v43 = (char *)this + v42;
    *(_WORD *)(v43 + 17) = 0;
    *((_OWORD *)v43 + 2) = 0uLL;
    *((_OWORD *)v43 + 3) = 0uLL;
    v42 += 48;
  }
  while (v42 != 336);
  std::mutex::unlock(v44);
}

uint64_t XofSvcsIf::GetBlockLen(uint64_t a1, int a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  uint64_t v5 = 0;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48 * a2 + 21);
  }
  std::mutex::unlock(v4);
  return v5;
}

uint64_t XofSvcsIf::GetXofInjctTime(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 2);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
    uint64_t v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetXofInjctTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_263D2DFB0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetRtiInjctTime(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 1200);
  std::mutex::lock((std::mutex *)(a1 + 1200));
  if (*(_DWORD *)(a1 + 1132) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 1002);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 1004);
    uint64_t v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetRtiInjctTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_263D2E0DC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofExtEphStartTime(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 8);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 12);
    uint64_t v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetXofExtEphStartTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_263D2E208(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofBrdSvBitMask(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid input, unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetXofBrdSvBitMask");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      uint64_t v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 48 * a2 + 32);
      uint64_t v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetXofBrdSvBitMask");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_263D2E3C8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofDoNotUseSvBitMask(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid input, unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetXofDoNotUseSvBitMask");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      uint64_t v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 48 * a2 + 48);
      uint64_t v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetXofDoNotUseSvBitMask");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_263D2E58C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::DecodeXofFormatVersion(uint64_t a1, void *a2, unsigned __int16 *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  XofHeaderCodec::XofHeaderCodec((XofHeaderCodec *)v9);
  if (XofHeaderCodec::DecodeXofFormatVersion((uint64_t)v9, a2, a3) == 1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF format version is [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "DecodeXofFormatVersion", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    uint64_t v6 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF format version!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "DecodeXofFormatVersion");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    uint64_t v6 = 5;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)v9);
  return v6;
}

void sub_263D2E72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::DecodeRtiFormatVersion(uint64_t a1, void *a2, unsigned __int16 *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  RtiDataCodec::RtiDataCodec((RtiDataCodec *)v8);
  if (RtiDataCodec::DecodeRtiFormatVersion((uint64_t)v8, a2, a3) == 1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI format version is [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "DecodeRtiFormatVersion", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 5;
  }
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  *(void *)__str = &v15;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)__str);
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  return v6;
}

void sub_263D2E8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  RtiDataCodec::~RtiDataCodec((void **)va);
  _Unwind_Resume(a1);
}

void XofSvcsIf::XofSvcsIf(XofSvcsIf *this)
{
  uint64_t v1 = 0;
  *((_DWORD *)this + 3) = 0;
  *(void *)this = 0;
  *((_WORD *)this + 4) = 0;
  do
  {
    v2 = (char *)this + v1;
    *((_WORD *)v2 + 10) = 0;
    *((_DWORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 24) = 0uLL;
    *(_OWORD *)(v2 + 40) = 0uLL;
    v1 += 48;
    *((void *)v2 + 7) = 0;
  }
  while (v1 != 336);
  *((void *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *((void *)this + 47) = 0;
  *((void *)this + 48) = 0;
  *((void *)this + 46) = 0;
  uint64_t v3 = 396;
  *((_DWORD *)this + 98) = 0;
  do
  {
    *(_WORD *)((char *)this + v3) = 25344;
    uint64_t v4 = (XofSvcsIf *)((char *)this + v3 + 2);
    v3 += 2;
  }
  while (v4 != (XofSvcsIf *)((char *)this + 444));
  for (uint64_t i = 0; i != 96; i += 16)
  {
    uint64_t v6 = (void *)((char *)this + i + 444);
    *(_WORD *)((char *)this + i + 458) = 0;
    void *v6 = 0;
    *(void *)((char *)v6 + 5) = 0;
  }
  *((void *)this + 70) = 0;
  *((void *)this + 69) = 0;
  *((void *)this + 68) = (char *)this + 552;
  *((void *)this + 73) = 0;
  *((void *)this + 72) = 0;
  *((void *)this + 71) = (char *)this + 576;
  *((void *)this + 76) = 0;
  *((void *)this + 75) = 0;
  *((void *)this + 74) = (char *)this + 600;
  *((void *)this + 79) = 0;
  *((void *)this + 78) = 0;
  *((void *)this + 77) = (char *)this + 624;
  *((void *)this + 82) = 0;
  *((void *)this + 81) = 0;
  *((void *)this + 80) = (char *)this + 648;
  *((void *)this + 84) = 0;
  *((void *)this + 85) = 0;
  *((void *)this + 83) = (char *)this + 672;
  *((void *)this + 88) = 0;
  *((void *)this + 87) = 0;
  *((void *)this + 86) = (char *)this + 696;
  *((void *)this + 90) = 0;
  *((void *)this + 91) = 0;
  *((void *)this + 89) = (char *)this + 720;
  *((void *)this + 93) = 0;
  *((void *)this + 94) = 0;
  *((void *)this + 92) = (char *)this + 744;
  *((void *)this + 96) = 0;
  *((void *)this + 97) = 0;
  *((void *)this + 95) = (char *)this + 768;
  *((void *)this + 99) = 0;
  *((void *)this + 100) = 0;
  *((void *)this + 98) = (char *)this + 792;
  *((void *)this + 103) = 0;
  *((void *)this + 102) = 0;
  *((void *)this + 101) = (char *)this + 816;
  *((void *)this + 106) = 0;
  *((void *)this + 105) = 0;
  *((void *)this + 104) = (char *)this + 840;
  *((void *)this + 109) = 0;
  *((void *)this + 108) = 0;
  *((void *)this + 107) = (char *)this + 864;
  *((void *)this + 112) = 0;
  *((void *)this + 111) = 0;
  *((void *)this + 110) = (char *)this + 888;
  *((void *)this + 115) = 0;
  *((void *)this + 114) = 0;
  *((void *)this + 113) = (char *)this + 912;
  *((void *)this + 118) = 0;
  *((void *)this + 117) = 0;
  *((void *)this + 116) = (char *)this + 936;
  *((void *)this + 121) = 0;
  *((void *)this + 120) = 0;
  *((void *)this + 119) = (char *)this + 960;
  *((void *)this + 124) = 0;
  *((void *)this + 123) = 0;
  *((void *)this + 122) = (char *)this + 984;
  *(_OWORD *)((char *)this + 1096) = 0u;
  *(_OWORD *)((char *)this + 1112) = 0u;
  *(_OWORD *)((char *)this + 1064) = 0u;
  *(_OWORD *)((char *)this + 1080) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1048) = 0u;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *((void *)this + 142) = 850045863;
  *((void *)this + 149) = 0;
  *(_OWORD *)((char *)this + 1176) = 0u;
  *(_OWORD *)((char *)this + 1160) = 0u;
  *(_OWORD *)((char *)this + 1144) = 0u;
  *((void *)this + 150) = 850045863;
  *((void *)this + 157) = 0;
  *(_OWORD *)((char *)this + 1240) = 0u;
  *(_OWORD *)((char *)this + 1224) = 0u;
  *(_OWORD *)((char *)this + 1208) = 0u;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssAlmanac>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = v6[1];
    }
    else {
      uint64_t v9 = (uint64_t)v6;
    }
    long long v29 = result;
    long long v30 = (void *)v9;
    uint64_t v31 = v9;
    if (v9)
    {
      char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      long long v30 = v10;
      if (a2 != a3)
      {
        uint64_t v11 = a2;
        do
        {
          uint64_t v12 = (uint64_t)v10;
          unsigned int v13 = *((unsigned __int8 *)v11 + 28);
          *(unsigned char *)(v9 + 28) = v13;
          long long v14 = *((_OWORD *)v11 + 3);
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          *(_OWORD *)(v9 + 48) = v14;
          uint64_t v15 = *v8;
          uint64_t v16 = v5 + 1;
          char v17 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                uint64_t v16 = (uint64_t **)v15;
                if (v13 >= *((unsigned __int8 *)v15 + 28)) {
                  break;
                }
                uint64_t v15 = (uint64_t *)*v15;
                char v17 = v16;
                if (!*v16) {
                  goto LABEL_14;
                }
              }
              uint64_t v15 = (uint64_t *)v15[1];
            }
            while (v15);
            char v17 = v16 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v16, v17, (uint64_t *)v9);
          if (v12) {
            char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          }
          else {
            char v10 = 0;
          }
          uint64_t v18 = (void *)v11[1];
          if (v18)
          {
            do
            {
              a2 = v18;
              uint64_t v18 = (void *)*v18;
            }
            while (v18);
          }
          else
          {
            do
            {
              a2 = (void *)v11[2];
              BOOL v19 = *a2 == (void)v11;
              uint64_t v11 = a2;
            }
            while (!v19);
          }
          if (!v12) {
            break;
          }
          uint64_t v9 = v12;
          uint64_t v11 = a2;
        }
        while (a2 != a3);
        long long v30 = v10;
        uint64_t v31 = v12;
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v29);
  }
  if (a2 != a3)
  {
    uint64_t v20 = v5 + 1;
    do
    {
      uint64_t v21 = (char *)operator new(0x40uLL);
      long long v22 = *(_OWORD *)((char *)a2 + 28);
      long long v23 = *(_OWORD *)((char *)a2 + 44);
      *((_DWORD *)v21 + 15) = *((_DWORD *)a2 + 15);
      *(_OWORD *)(v21 + 44) = v23;
      *(_OWORD *)(v21 + 28) = v22;
      long long v24 = *v20;
      uint64_t v25 = v5 + 1;
      long long v26 = v5 + 1;
      if (*v20)
      {
        do
        {
          while (1)
          {
            uint64_t v25 = (uint64_t **)v24;
            if (v21[28] >= *((unsigned __int8 *)v24 + 28)) {
              break;
            }
            long long v24 = (uint64_t *)*v24;
            long long v26 = v25;
            if (!*v25) {
              goto LABEL_34;
            }
          }
          long long v24 = (uint64_t *)v24[1];
        }
        while (v24);
        long long v26 = v25 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v25, v26, (uint64_t *)v21);
      long long v27 = (void *)a2[1];
      if (v27)
      {
        do
        {
          uint64_t v28 = v27;
          long long v27 = (void *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          uint64_t v28 = (void *)a2[2];
          BOOL v19 = *v28 == (void)a2;
          a2 = v28;
        }
        while (!v19);
      }
      a2 = v28;
    }
    while (v28 != a3);
  }
  return result;
}

void *std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*(void **)(a1 + 16));
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssEphemeris>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = v6[1];
    }
    else {
      uint64_t v9 = (uint64_t)v6;
    }
    uint64_t v32 = result;
    long long v33 = (void *)v9;
    uint64_t v34 = v9;
    if (v9)
    {
      char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      long long v33 = v10;
      if (a2 != a3)
      {
        uint64_t v11 = a2;
        do
        {
          uint64_t v12 = (uint64_t)v10;
          unsigned int v13 = *((unsigned __int8 *)v11 + 28);
          *(unsigned char *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          long long v14 = *((_OWORD *)v11 + 3);
          long long v15 = *((_OWORD *)v11 + 4);
          long long v16 = *((_OWORD *)v11 + 5);
          *(void *)(v9 + 96) = v11[12];
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          char v17 = *v8;
          uint64_t v18 = v5 + 1;
          BOOL v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                uint64_t v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28)) {
                  break;
                }
                char v17 = (uint64_t *)*v17;
                BOOL v19 = v18;
                if (!*v18) {
                  goto LABEL_14;
                }
              }
              char v17 = (uint64_t *)v17[1];
            }
            while (v17);
            BOOL v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12) {
            char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          }
          else {
            char v10 = 0;
          }
          uint64_t v20 = (void *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              uint64_t v20 = (void *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (void *)v11[2];
              BOOL v21 = *a2 == (void)v11;
              uint64_t v11 = a2;
            }
            while (!v21);
          }
          if (!v12) {
            break;
          }
          uint64_t v9 = v12;
          uint64_t v11 = a2;
        }
        while (a2 != a3);
        long long v33 = v10;
        uint64_t v34 = v12;
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    long long v22 = v5 + 1;
    do
    {
      long long v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      long long v24 = *(_OWORD *)((char *)a2 + 44);
      long long v25 = *(_OWORD *)((char *)a2 + 60);
      long long v26 = *(_OWORD *)((char *)a2 + 76);
      *(_OWORD *)(v23 + 88) = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      long long v27 = *v22;
      uint64_t v28 = v5 + 1;
      long long v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            uint64_t v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28)) {
              break;
            }
            long long v27 = (uint64_t *)*v27;
            long long v29 = v28;
            if (!*v28) {
              goto LABEL_34;
            }
          }
          long long v27 = (uint64_t *)v27[1];
        }
        while (v27);
        long long v29 = v28 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      long long v30 = (void *)a2[1];
      if (v30)
      {
        do
        {
          uint64_t v31 = v30;
          long long v30 = (void *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          uint64_t v31 = (void *)a2[2];
          BOOL v21 = *v31 == (void)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGalileoEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGalileoEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGalileoEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGalileoEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGalileoEphemeris>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = v6[1];
    }
    else {
      uint64_t v9 = (uint64_t)v6;
    }
    uint64_t v32 = result;
    long long v33 = (void *)v9;
    uint64_t v34 = v9;
    if (v9)
    {
      char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      long long v33 = v10;
      if (a2 != a3)
      {
        uint64_t v11 = a2;
        do
        {
          uint64_t v12 = (uint64_t)v10;
          unsigned int v13 = *((unsigned __int8 *)v11 + 28);
          *(unsigned char *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          long long v14 = *((_OWORD *)v11 + 3);
          long long v15 = *((_OWORD *)v11 + 4);
          long long v16 = *((_OWORD *)v11 + 5);
          *(void *)(v9 + 96) = v11[12];
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          char v17 = *v8;
          uint64_t v18 = v5 + 1;
          BOOL v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                uint64_t v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28)) {
                  break;
                }
                char v17 = (uint64_t *)*v17;
                BOOL v19 = v18;
                if (!*v18) {
                  goto LABEL_14;
                }
              }
              char v17 = (uint64_t *)v17[1];
            }
            while (v17);
            BOOL v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12) {
            char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          }
          else {
            char v10 = 0;
          }
          uint64_t v20 = (void *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              uint64_t v20 = (void *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (void *)v11[2];
              BOOL v21 = *a2 == (void)v11;
              uint64_t v11 = a2;
            }
            while (!v21);
          }
          if (!v12) {
            break;
          }
          uint64_t v9 = v12;
          uint64_t v11 = a2;
        }
        while (a2 != a3);
        long long v33 = v10;
        uint64_t v34 = v12;
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    long long v22 = v5 + 1;
    do
    {
      long long v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      long long v24 = *(_OWORD *)((char *)a2 + 44);
      long long v25 = *(_OWORD *)((char *)a2 + 60);
      long long v26 = *(_OWORD *)((char *)a2 + 76);
      *(_OWORD *)(v23 + 88) = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      long long v27 = *v22;
      uint64_t v28 = v5 + 1;
      long long v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            uint64_t v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28)) {
              break;
            }
            long long v27 = (uint64_t *)*v27;
            long long v29 = v28;
            if (!*v28) {
              goto LABEL_34;
            }
          }
          long long v27 = (uint64_t *)v27[1];
        }
        while (v27);
        long long v29 = v28 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      long long v30 = (void *)a2[1];
      if (v30)
      {
        do
        {
          uint64_t v31 = v30;
          long long v30 = (void *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          uint64_t v31 = (void *)a2[2];
          BOOL v21 = *v31 == (void)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofBeidouEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofBeidouEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofBeidouEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofBeidouEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofBeidouEphemeris>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = v6[1];
    }
    else {
      uint64_t v9 = (uint64_t)v6;
    }
    v38 = result;
    BOOL v39 = (void *)v9;
    uint64_t v40 = v9;
    if (v9)
    {
      char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      BOOL v39 = v10;
      if (a2 != a3)
      {
        uint64_t v11 = a2;
        do
        {
          uint64_t v12 = (uint64_t)v10;
          unsigned int v13 = *((unsigned __int8 *)v11 + 32);
          *(unsigned char *)(v9 + 32) = v13;
          *(_OWORD *)(v9 + 40) = *(_OWORD *)(v11 + 5);
          long long v14 = *(_OWORD *)(v11 + 7);
          long long v15 = *(_OWORD *)(v11 + 9);
          long long v16 = *(_OWORD *)(v11 + 11);
          *(_OWORD *)(v9 + 104) = *(_OWORD *)(v11 + 13);
          *(_OWORD *)(v9 + 88) = v16;
          *(_OWORD *)(v9 + 72) = v15;
          *(_OWORD *)(v9 + 56) = v14;
          long long v17 = *(_OWORD *)(v11 + 15);
          long long v18 = *(_OWORD *)(v11 + 17);
          long long v19 = *(_OWORD *)(v11 + 19);
          *(void *)(v9 + 166) = *(void *)((char *)v11 + 166);
          *(_OWORD *)(v9 + 152) = v19;
          *(_OWORD *)(v9 + 136) = v18;
          *(_OWORD *)(v9 + 120) = v17;
          uint64_t v20 = *v8;
          BOOL v21 = v5 + 1;
          long long v22 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                BOOL v21 = (uint64_t **)v20;
                if (v13 >= *((unsigned __int8 *)v20 + 32)) {
                  break;
                }
                uint64_t v20 = (uint64_t *)*v20;
                long long v22 = v21;
                if (!*v21) {
                  goto LABEL_14;
                }
              }
              uint64_t v20 = (uint64_t *)v20[1];
            }
            while (v20);
            long long v22 = v21 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v21, v22, (uint64_t *)v9);
          if (v12) {
            char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          }
          else {
            char v10 = 0;
          }
          long long v23 = (void *)v11[1];
          if (v23)
          {
            do
            {
              a2 = v23;
              long long v23 = (void *)*v23;
            }
            while (v23);
          }
          else
          {
            do
            {
              a2 = (void *)v11[2];
              BOOL v24 = *a2 == (void)v11;
              uint64_t v11 = a2;
            }
            while (!v24);
          }
          if (!v12) {
            break;
          }
          uint64_t v9 = v12;
          uint64_t v11 = a2;
        }
        while (a2 != a3);
        BOOL v39 = v10;
        uint64_t v40 = v12;
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v38);
  }
  if (a2 != a3)
  {
    long long v25 = v5 + 1;
    do
    {
      long long v26 = (unsigned __int8 *)operator new(0xB0uLL);
      *((_OWORD *)v26 + 2) = *((_OWORD *)a2 + 2);
      long long v27 = *((_OWORD *)a2 + 3);
      long long v28 = *((_OWORD *)a2 + 4);
      long long v29 = *((_OWORD *)a2 + 6);
      *((_OWORD *)v26 + 5) = *((_OWORD *)a2 + 5);
      *((_OWORD *)v26 + 6) = v29;
      *((_OWORD *)v26 + 3) = v27;
      *((_OWORD *)v26 + 4) = v28;
      long long v30 = *((_OWORD *)a2 + 7);
      long long v31 = *((_OWORD *)a2 + 8);
      long long v32 = *((_OWORD *)a2 + 10);
      *((_OWORD *)v26 + 9) = *((_OWORD *)a2 + 9);
      *((_OWORD *)v26 + 10) = v32;
      *((_OWORD *)v26 + 7) = v30;
      *((_OWORD *)v26 + 8) = v31;
      long long v33 = *v25;
      uint64_t v34 = v5 + 1;
      uint64_t v35 = v5 + 1;
      if (*v25)
      {
        do
        {
          while (1)
          {
            uint64_t v34 = (uint64_t **)v33;
            if (v26[32] >= *((unsigned __int8 *)v33 + 32)) {
              break;
            }
            long long v33 = (uint64_t *)*v33;
            uint64_t v35 = v34;
            if (!*v34) {
              goto LABEL_34;
            }
          }
          long long v33 = (uint64_t *)v33[1];
        }
        while (v33);
        uint64_t v35 = v34 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v34, v35, (uint64_t *)v26);
      v36 = (void *)a2[1];
      if (v36)
      {
        do
        {
          uint64_t v37 = v36;
          v36 = (void *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          uint64_t v37 = (void *)a2[2];
          BOOL v24 = *v37 == (void)a2;
          a2 = v37;
        }
        while (!v24);
      }
      a2 = v37;
    }
    while (v37 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofNavicEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofNavicEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofNavicEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofNavicEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofNavicEphemeris>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = v6[1];
    }
    else {
      uint64_t v9 = (uint64_t)v6;
    }
    long long v32 = result;
    long long v33 = (void *)v9;
    uint64_t v34 = v9;
    if (v9)
    {
      char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      long long v33 = v10;
      if (a2 != a3)
      {
        uint64_t v11 = a2;
        do
        {
          uint64_t v12 = (uint64_t)v10;
          unsigned int v13 = *((unsigned __int8 *)v11 + 28);
          *(unsigned char *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          long long v14 = *((_OWORD *)v11 + 3);
          long long v15 = *((_OWORD *)v11 + 4);
          long long v16 = *((_OWORD *)v11 + 5);
          *(_DWORD *)(v9 + 96) = *((_DWORD *)v11 + 24);
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          long long v17 = *v8;
          long long v18 = v5 + 1;
          long long v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                long long v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28)) {
                  break;
                }
                long long v17 = (uint64_t *)*v17;
                long long v19 = v18;
                if (!*v18) {
                  goto LABEL_14;
                }
              }
              long long v17 = (uint64_t *)v17[1];
            }
            while (v17);
            long long v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12) {
            char v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          }
          else {
            char v10 = 0;
          }
          uint64_t v20 = (void *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              uint64_t v20 = (void *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (void *)v11[2];
              BOOL v21 = *a2 == (void)v11;
              uint64_t v11 = a2;
            }
            while (!v21);
          }
          if (!v12) {
            break;
          }
          uint64_t v9 = v12;
          uint64_t v11 = a2;
        }
        while (a2 != a3);
        long long v33 = v10;
        uint64_t v34 = v12;
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    long long v22 = v5 + 1;
    do
    {
      long long v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      long long v24 = *(_OWORD *)((char *)a2 + 44);
      long long v25 = *(_OWORD *)((char *)a2 + 60);
      long long v26 = *(_OWORD *)((char *)a2 + 76);
      *(void *)(v23 + 92) = *(void *)((char *)a2 + 92);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      long long v27 = *v22;
      long long v28 = v5 + 1;
      long long v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            long long v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28)) {
              break;
            }
            long long v27 = (uint64_t *)*v27;
            long long v29 = v28;
            if (!*v28) {
              goto LABEL_34;
            }
          }
          long long v27 = (uint64_t *)v27[1];
        }
        while (v27);
        long long v29 = v28 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      long long v30 = (void *)a2[1];
      if (v30)
      {
        do
        {
          long long v31 = v30;
          long long v30 = (void *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          long long v31 = (void *)a2[2];
          BOOL v21 = *v31 == (void)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__tree_node<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,void *> *,long>>(uint64_t **result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = result;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v8 = result + 1;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v9 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v9 = v6;
    }
    long long v23 = result;
    long long v24 = v9;
    long long v25 = v9;
    if (v9)
    {
      long long v24 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next((uint64_t)v9);
      if (a2 != a3)
      {
        char v10 = a2;
        do
        {
          *((unsigned char *)v9 + 32) = *((unsigned char *)v10 + 32);
          if (v9 != v10)
          {
            std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssEphemeris>,void *> *,long>>((uint64_t **)v9 + 5, (void *)v10[5], v10 + 6);
            uint64_t v9 = v25;
          }
          uint64_t v11 = *v8;
          uint64_t v12 = v5 + 1;
          unsigned int v13 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                uint64_t v12 = (uint64_t **)v11;
                if (*((unsigned __int8 *)v9 + 32) >= *((unsigned __int8 *)v11 + 32)) {
                  break;
                }
                uint64_t v11 = (uint64_t *)*v11;
                unsigned int v13 = v12;
                if (!*v12) {
                  goto LABEL_16;
                }
              }
              uint64_t v11 = (uint64_t *)v11[1];
            }
            while (v11);
            unsigned int v13 = v12 + 1;
          }
LABEL_16:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v12, v13, v9);
          uint64_t v9 = v24;
          long long v25 = v24;
          if (v24) {
            long long v24 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next((uint64_t)v24);
          }
          long long v14 = (uint64_t *)v10[1];
          if (v14)
          {
            do
            {
              a2 = v14;
              long long v14 = (uint64_t *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              a2 = (uint64_t *)v10[2];
              BOOL v15 = *a2 == (void)v10;
              char v10 = a2;
            }
            while (!v15);
          }
          if (!v9) {
            break;
          }
          char v10 = a2;
        }
        while (a2 != a3);
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v23);
  }
  if (a2 != a3)
  {
    long long v16 = v5 + 1;
    do
    {
      long long v17 = (uint64_t *)operator new(0x40uLL);
      *((unsigned char *)v17 + 32) = *((unsigned char *)a2 + 32);
      std::map<unsigned char,XofGpsQzssEphemeris>::map[abi:ne180100](v17 + 5, (uint64_t)(a2 + 5));
      long long v18 = *v16;
      long long v19 = v5 + 1;
      uint64_t v20 = v5 + 1;
      if (*v16)
      {
        do
        {
          while (1)
          {
            long long v19 = (uint64_t **)v18;
            if (*((unsigned __int8 *)v17 + 32) >= *((unsigned __int8 *)v18 + 32)) {
              break;
            }
            long long v18 = (uint64_t *)*v18;
            uint64_t v20 = v19;
            if (!*v19) {
              goto LABEL_34;
            }
          }
          long long v18 = (uint64_t *)v18[1];
        }
        while (v18);
        uint64_t v20 = v19 + 1;
      }
LABEL_34:
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v19, v20, v17);
      BOOL v21 = (uint64_t *)a2[1];
      if (v21)
      {
        do
        {
          long long v22 = v21;
          BOOL v21 = (uint64_t *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          long long v22 = (uint64_t *)a2[2];
          BOOL v15 = *v22 == (void)a2;
          a2 = v22;
        }
        while (!v15);
      }
      a2 = v22;
    }
    while (v22 != a3);
  }
  return result;
}

void sub_263D2FBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*(void **)(a1 + 16));
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(a1[1]);
    std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)(a1 + 5), (void *)a1[6]);
    operator delete(a1);
  }
}

void XofData::~XofData(XofData *this)
{
}

void RtiDataCodec::RtiDataCodec(RtiDataCodec *this)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v26, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v27, &v26, 3, 3, 0);
  std::string::basic_string[abi:ne180100]<0>(&v22, "fileCreateGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v23, &v22, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v18, "fileCreateGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v19, &v18, 0, 604799, 0);
  std::vector<RtiPayloadCodec::Payload>::vector((RtiPayloadCodec::Payload *)&v16, 7uLL);
  std::string::basic_string[abi:ne180100]<0>(&v12, "reserved");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v13, &v12, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "fileCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v9, &__p, 0, -1, 0);
  *(_OWORD *)((char *)this + 8) = v28;
  *(_OWORD *)((char *)this + 40) = v24;
  long long v2 = *(_OWORD *)v20;
  *((_OWORD *)this + 4) = v19;
  *((_OWORD *)this + 5) = v2;
  *(_OWORD *)((char *)this + 104) = v16;
  long long v3 = *(_OWORD *)v14;
  *((_OWORD *)this + 8) = v13;
  *((_OWORD *)this + 9) = v3;
  long long v4 = v10;
  *(_OWORD *)((char *)this + 168) = v9;
  uint64_t v5 = v29;
  *(void *)this = v27;
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  uint64_t v6 = v23;
  uint64_t v7 = v25;
  *((void *)this + 3) = v5;
  *((void *)this + 4) = v6;
  *((void *)this + 7) = v7;
  uint64_t v25 = 0;
  long long v24 = 0uLL;
  *((void *)this + 12) = v21;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v21 = 0;
  *((void *)this + 15) = v17;
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  *((void *)this + 20) = v15;
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v15 = 0;
  *((void *)this + 25) = v11;
  *(_OWORD *)((char *)this + 184) = v4;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v15) < 0) {
      operator delete(v14[0]);
    }
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  *(void *)&long long v13 = &v16;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v21) < 0) {
    operator delete(v20[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25) < 0) {
    operator delete((void *)v24);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete((void *)v28);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
}

void sub_263D300A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char *a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  a26 = &a34;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&a26);
  if (a50 < 0) {
    operator delete(a45);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  if (*(char *)(v50 - 81) < 0) {
    operator delete(*(void **)(v50 - 104));
  }
  if (*(char *)(v50 - 113) < 0) {
    operator delete(*(void **)(v50 - 136));
  }
  if (*(char *)(v50 - 25) < 0) {
    operator delete(*(void **)(v50 - 48));
  }
  if (*(char *)(v50 - 57) < 0) {
    operator delete(*(void **)(v50 - 80));
  }
  _Unwind_Resume(a1);
}

void sub_263D30194()
{
}

void sub_263D3019C()
{
}

void std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  long long v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 112;
        std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 111) < 0) {
    operator delete(*(void **)(a2 + 88));
  }
  if (*(char *)(a2 + 55) < 0)
  {
    long long v3 = *(void **)(a2 + 32);
    operator delete(v3);
  }
}

void XofHeaderCodec::XofHeaderCodec(XofHeaderCodec *this)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v43, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v44, &v43, 3, 3, 0);
  std::string::basic_string[abi:ne180100]<0>(&v39, "fileCreateGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v40, &v39, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v35, "fileCreateGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v36, &v35, 0, 604800, 0);
  std::string::basic_string[abi:ne180100]<0>(&v31, "reserved1");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v32, &v31, 0, 0xFFFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v27, "eeStartGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v28, &v27, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v23, "eeStartGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v24, &v23, 0, 604800, 0);
  std::vector<XofConstellationHeaderCodec::Payload>::vector((XofConstellationHeaderCodec::Payload *)v22, 7uLL);
  std::string::basic_string[abi:ne180100]<0>(&v18, "reserved2");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v19, &v18, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v14, "payloadLength");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v15, &v14, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v10, "payloadCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v11, &v10, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v6, "reserved3");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v7, &v6, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v2, "headerCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v3, &v2, 0, -1, 0);
  _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEEEJ15XofIntegralTypeItES4_S3_IjES4_S4_S5_27XofConstellationHeaderCodecS3_IyES5_S5_S5_S5_EEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EJEJEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSB_IJDpT2_EEEDpOT3_((uint64_t)this, (uint64_t)v44, (uint64_t)v40, (uint64_t)v36, (uint64_t)v32, (uint64_t)v28, (uint64_t)v24, (uint64_t)v22, v19, (uint64_t)v15, (uint64_t)v11, (uint64_t)v7, (uint64_t)v3);
  if (v5 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v2.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v2.__r_.__value_.__l.__data_);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  *(void *)&v19[0] = v22;
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)v19);
  if (v26 < 0) {
    operator delete(v25);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (v30 < 0) {
    operator delete(v29);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (v34 < 0) {
    operator delete(v33);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (v38 < 0) {
    operator delete(v37);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  if (v42 < 0) {
    operator delete(v41);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  if (v46 < 0) {
    operator delete(v45);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
}

void sub_263D30714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53,void *a54,uint64_t a55,int a56,__int16 a57,char a58,char a59,uint64_t a60,uint64_t a61,void *a62,uint64_t a63)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a53 < 0) {
    operator delete(a48);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (a67 < 0) {
    operator delete(a62);
  }
  if (a59 < 0) {
    operator delete(a54);
  }
  if (a75 < 0) {
    operator delete(a74);
  }
  if (a72 < 0) {
    operator delete(a68);
  }
  a73 = (uint64_t)&a76;
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&a73);
  if (a80 < 0) {
    operator delete(a79);
  }
  if (a78 < 0) {
    operator delete(a77);
  }
  if (SLOBYTE(STACK[0x20F]) < 0) {
    operator delete(a83);
  }
  if (a82 < 0) {
    operator delete(a81);
  }
  if (*(char *)(v83 - 217) < 0) {
    operator delete(*(void **)(v83 - 240));
  }
  if (SLOBYTE(STACK[0x227]) < 0) {
    operator delete((void *)STACK[0x210]);
  }
  if (*(char *)(v83 - 153) < 0) {
    operator delete(*(void **)(v83 - 176));
  }
  if (*(char *)(v83 - 193) < 0) {
    operator delete(*(void **)(v83 - 216));
  }
  if (*(char *)(v83 - 97) < 0) {
    operator delete(*(void **)(v83 - 120));
  }
  if (*(char *)(v83 - 129) < 0) {
    operator delete(*(void **)(v83 - 152));
  }
  if (*(char *)(v83 - 41) < 0) {
    operator delete(*(void **)(v83 - 64));
  }
  if (*(char *)(v83 - 73) < 0) {
    operator delete(*(void **)(v83 - 96));
  }
  _Unwind_Resume(a1);
}

void sub_263D308C0()
{
}

void sub_263D308C8()
{
}

void sub_263D308D0()
{
}

void sub_263D308D8()
{
}

void sub_263D308E0()
{
}

void sub_263D308E8()
{
}

void sub_263D308F0()
{
}

void sub_263D308F8()
{
}

void sub_263D30900()
{
}

void sub_263D30908()
{
}

void sub_263D30910()
{
}

void sub_263D30918()
{
}

void sub_263D30920()
{
}

void sub_263D30928()
{
}

__n128 _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEEEJ15XofIntegralTypeItES4_S3_IjES4_S4_S5_27XofConstellationHeaderCodecS3_IyES5_S5_S5_S5_EEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EJEJEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSB_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)a1 = *(void *)a2;
  long long v13 = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v13;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a1 + 32) = *(void *)a3;
  long long v14 = *(_OWORD *)(a3 + 8);
  *(void *)(a1 + 56) = *(void *)(a3 + 24);
  *(_OWORD *)(a1 + 40) = v14;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)a4;
  long long v15 = *(_OWORD *)(a4 + 16);
  *(void *)(a1 + 96) = *(void *)(a4 + 32);
  *(_OWORD *)(a1 + 80) = v15;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)(a1 + 104) = *(void *)a5;
  long long v16 = *(_OWORD *)(a5 + 8);
  *(void *)(a1 + 128) = *(void *)(a5 + 24);
  *(_OWORD *)(a1 + 112) = v16;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a1 + 136) = *(void *)a6;
  long long v17 = *(_OWORD *)(a6 + 8);
  *(void *)(a1 + 160) = *(void *)(a6 + 24);
  *(_OWORD *)(a1 + 144) = v17;
  *(void *)(a6 + 16) = 0;
  *(void *)(a6 + 24) = 0;
  *(void *)(a6 + 8) = 0;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)a7;
  long long v18 = *(_OWORD *)(a7 + 16);
  *(void *)(a1 + 200) = *(void *)(a7 + 32);
  *(_OWORD *)(a1 + 184) = v18;
  *(void *)(a7 + 24) = 0;
  *(void *)(a7 + 32) = 0;
  *(void *)(a7 + 16) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(_OWORD *)(a1 + 208) = *(_OWORD *)a8;
  *(void *)(a1 + 224) = *(void *)(a8 + 16);
  *(void *)a8 = 0;
  *(void *)(a8 + 8) = 0;
  *(void *)(a8 + 16) = 0;
  long long v19 = *a9;
  *(_OWORD *)(a1 + 248) = a9[1];
  *(_OWORD *)(a1 + 232) = v19;
  long long v20 = a9[2];
  *(void *)(a1 + 280) = *((void *)a9 + 6);
  *(_OWORD *)(a1 + 264) = v20;
  *((void *)a9 + 5) = 0;
  *((void *)a9 + 6) = 0;
  *((void *)a9 + 4) = 0;
  *(_OWORD *)(a1 + 288) = *(_OWORD *)a10;
  long long v21 = *(_OWORD *)(a10 + 16);
  *(void *)(a1 + 320) = *(void *)(a10 + 32);
  *(_OWORD *)(a1 + 304) = v21;
  *(void *)(a10 + 24) = 0;
  *(void *)(a10 + 32) = 0;
  *(void *)(a10 + 16) = 0;
  *(_OWORD *)(a1 + 328) = *(_OWORD *)a11;
  long long v22 = *(_OWORD *)(a11 + 16);
  *(void *)(a1 + 360) = *(void *)(a11 + 32);
  *(_OWORD *)(a1 + 344) = v22;
  *(void *)(a11 + 24) = 0;
  *(void *)(a11 + 32) = 0;
  *(void *)(a11 + 16) = 0;
  *(_OWORD *)(a1 + 368) = *(_OWORD *)a12;
  long long v23 = *(_OWORD *)(a12 + 16);
  *(void *)(a1 + 400) = *(void *)(a12 + 32);
  *(_OWORD *)(a1 + 384) = v23;
  *(void *)(a12 + 24) = 0;
  *(void *)(a12 + 32) = 0;
  *(void *)(a12 + 16) = 0;
  *(_OWORD *)(a1 + 408) = *(_OWORD *)a13;
  __n128 result = *(__n128 *)(a13 + 16);
  *(void *)(a1 + 440) = *(void *)(a13 + 32);
  *(__n128 *)(a1 + 424) = result;
  *(void *)(a13 + 24) = 0;
  *(void *)(a13 + 32) = 0;
  *(void *)(a13 + 16) = 0;
  return result;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl(uint64_t a1)
{
  v3[1] = *(void ***)MEMORY[0x263EF8340];
  if (*(char *)(a1 + 447) < 0) {
    operator delete(*(void **)(a1 + 424));
  }
  if (*(char *)(a1 + 407) < 0) {
    operator delete(*(void **)(a1 + 384));
  }
  if (*(char *)(a1 + 367) < 0) {
    operator delete(*(void **)(a1 + 344));
  }
  if (*(char *)(a1 + 327) < 0) {
    operator delete(*(void **)(a1 + 304));
  }
  if (*(char *)(a1 + 287) < 0) {
    operator delete(*(void **)(a1 + 264));
  }
  v3[0] = (void **)(a1 + 208);
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100](v3);
  if (*(char *)(a1 + 207) < 0) {
    operator delete(*(void **)(a1 + 184));
  }
  if (*(char *)(a1 + 167) < 0) {
    operator delete(*(void **)(a1 + 144));
  }
  if (*(char *)(a1 + 135) < 0) {
    operator delete(*(void **)(a1 + 112));
  }
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t Hal01_01HandleInitReq(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_INIT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_01HandleInitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    g_IsFSMDeInit = 0;
    int v3 = *(_DWORD *)(a1 + 24);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal01_01HandleInitReq", 1291);
      gnssOsa_PrintLog(__str, 4, 1, 0);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        unint64_t v5 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        char DebugFeaturesBitmask = Ga05_GetDebugFeaturesBitmask();
        char v7 = Ga05_GetDebugFeaturesBitmask();
        uint64_t v8 = 89;
        if ((v7 & 0x10) != 0) {
          uint64_t v9 = 89;
        }
        else {
          uint64_t v9 = 78;
        }
        if ((DebugFeaturesBitmask & 0x20) == 0) {
          uint64_t v8 = 78;
        }
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GnssHw,%u, Platform SPI,%c,PCIe,%c\n", v5, "HAL", 73, "Hal01_01HandleInitReq", v3, v8, v9);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
    }
    std::string v10 = (int *)gnssOsa_Calloc("Hal01_01HandleInitReq", 248, 1, 0x48uLL);
    if (v10)
    {
      uint64_t v11 = v10;
      if (Hal22_InitializeConn()) {
        goto LABEL_33;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "HAL", 73, "Hal01_01HandleInitReq", 1313);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      if (!v3)
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid GnssHw,%u\n");
LABEL_26:
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
LABEL_27:
        *(void *)uint64_t v11 = 0x300000001;
        (*(void (**)(uint64_t, int *))(a1 + 16))(3, v11);
        goto LABEL_33;
      }
      if (v3 != 1)
      {
LABEL_33:
        free(v11);
        return 0;
      }
      if (Hal35_Is_HW_SPI_EN_Default() && (Ga05_GetDebugFeaturesBitmask() & 0x10) == 0)
      {
        Hal35_Set_SPI_InUse(1);
        Hal_Is_BaseBandSPMI_Ack_Enabled();
        if (Hal35_BaseBandSPMI_GNSSWake())
        {
          Hal01_Init_SPI(a1, v11, (char *)v11);
          goto LABEL_33;
        }
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI wake trigger failed\n");
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      int v26 = 3;
      if (Hal34_InitPciGnssDevice(&v26))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v14 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "HAL", 69, "Hal01_Init_SPI_OR_PCIe", 1293);
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        int v15 = v26;
        *uint64_t v11 = 1;
        v11[1] = v15;
        long long v16 = (void (**)(uint64_t, char *))(a1 + 16);
        goto LABEL_32;
      }
      long long v18 = *(void (**)(uint64_t, char *))(a1 + 16);
      long long v16 = (void (**)(uint64_t, char *))(a1 + 16);
      if (!Hal01_GetRevisionInfo((char *)v11, v18)) {
        goto LABEL_33;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v19 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "HAL", 73, "Hal01_Init_SPI_OR_PCIe", 1285);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      int v20 = v26;
      *uint64_t v11 = 2;
      v11[1] = v20;
      int v21 = (unsigned __int16)word_26A9CA200;
      unsigned int v22 = byte_26A9CA1FD;
      if (word_26A9CA200 == 3599 && byte_26A9CA1FD < 2u) {
        goto LABEL_32;
      }
      if (word_26A9CA200 == 3599 && byte_26A9CA1FD >= 2u)
      {
        if ((Ga05_GetDebugFeaturesBitmask() & 0x20) == 0)
        {
LABEL_32:
          (*v16)(3, (char *)v11);
          goto LABEL_33;
        }
        int v21 = (unsigned __int16)word_26A9CA200;
        unsigned int v22 = byte_26A9CA1FD;
      }
      if (v21 != 3599 || v22 < 2 || (Ga05_GetDebugFeaturesBitmask() & 0x20) == 0) {
        goto LABEL_33;
      }
      if (Hal35_InitSPI())
      {
        if (!Hal01_GetRevisionInfo((char *)v11, *v16)) {
          goto LABEL_33;
        }
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v23 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "HAL", 73, "Hal01_Init_SPI_OR_PCIe", 1285);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        int v24 = 2;
      }
      else
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v25 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPI Init failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "HAL", 69, "Hal01_Init_SPI_OR_PCIe");
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        int v24 = 1;
      }
      *uint64_t v11 = v24;
      v11[1] = v20;
      goto LABEL_32;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "HAL", 69, "Hal01_01HandleInitReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_03WriteDataToChip(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_WRITE_DATA_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 68, "Hal01_03WriteDataToChip");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (g_IsFSMDeInit == 1)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DeInitState\n");
LABEL_12:
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
  }
  else if (a1)
  {
    Hal22_ZxSendToChip(*(unsigned __int8 **)(a1 + 16), *(unsigned __int16 *)(a1 + 24));
    int v3 = *(void **)(a1 + 16);
    if (v3) {
      free(v3);
    }
    *(void *)(a1 + 16) = 0;
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_12;
  }
  return 0;
}

uint64_t Hal01_02HandleDeInitReq(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_DEINIT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_02HandleDeInitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal01_02HandleDeInitReq");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  if (a1)
  {
    g_IsFSMDeInit = 1;
    uint64_t v4 = gnssOsa_Calloc("Hal01_02HandleDeInitReq", 331, 1, 0x48uLL);
    if (v4)
    {
      unint64_t v5 = v4;
      _DWORD *v4 = 6;
      BOOL v6 = word_26A9CA200 == 3599 && byte_26A9CA1FD >= 2u;
      if (v6 && (Ga05_GetDebugFeaturesBitmask() & 0x20) != 0) {
        Hal35_DeInitSPI();
      }
      Hal22_DeInitializeConn();
      char v7 = *(void (**)(uint64_t, void *))(a1 + 16);
      if (v7) {
        v7(4, v5);
      }
      free(v5);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v8 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "HAL", 73, "Hal01_02HandleDeInitReq");
        int v9 = 4;
LABEL_19:
        gnssOsa_PrintLog(__str, v9, 1, 0);
      }
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v10 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 69, "Hal01_02HandleDeInitReq", 517);
    int v9 = 1;
    goto LABEL_19;
  }
  return 0;
}

uint64_t Hal01_HandleGnssBBResetReq()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_GNSSBASEBAND_RESET_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal01_HandleGnssBBResetReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  Hal_BaseBandSPMI_GNSSTriggerTrap();
  return 0;
}

uint64_t Hal01_HandleSetPowerReport(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_SET_POWER_RPT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleSetPowerReport");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Hal32_SetPowerReport(*(unsigned __int8 *)(a1 + 12), *(void (**)(BOOL))(a1 + 16), *(uint64_t (**)(double, double, double, double))(a1 + 24));
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 69, "Hal01_HandleSetPowerReport", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_HandleTMPulseTrig(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_TRIG_TIMEMARK_PULSE_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleTMPulseTrig");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_10:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    return 0;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMarkPulseCb\n");
    goto LABEL_10;
  }
  *(_DWORD *)__str = 0;
  BOOL v3 = Hal25_TriggerTimeMarkStrobe((unsigned int *)__str);
  (*(void (**)(void, BOOL))(a1 + 16))(*(unsigned int *)__str, v3);
  return 0;
}

uint64_t Hal01_HandleGNSSWakeReq(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_GNSS_WAKE_REQUEST_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleGNSSWakeReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    if (g_IsSPIEnabled)
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v3 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Triggered GNSS wake\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal01_HandleGNSSWakeReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      uint64_t v4 = Hal35_BaseBandSPMI_GNSSWake();
      if (Hal15_ReadHwRevision(77))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI Wake failed, trigger GNSS coredump\n");
LABEL_15:
          gnssOsa_PrintLog(__str, 1, 1, 0);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI based GNSS Wake, read rev success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 73, "Hal01_HandleGNSSWakeReq");
LABEL_21:
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
    }
    else
    {
      if (Hal15_ReadHwRevision(80))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: CP read rev failed, trigger GNSS coredump\n");
          goto LABEL_15;
        }
LABEL_16:
        Hal_BaseBandSPMI_GNSSTriggerTrap();
        uint64_t v4 = 0;
        goto LABEL_23;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: CP read rev success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "HAL", 73, "Hal01_HandleGNSSWakeReq");
        uint64_t v4 = 1;
        goto LABEL_21;
      }
      uint64_t v4 = 1;
    }
LABEL_23:
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 16);
    if (v8) {
      v8(v4);
    }
    return 0;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "HAL", 69, "Hal01_HandleGNSSWakeReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_Init_SPI(uint64_t a1, void *a2, char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (Hal35_InitSPI())
  {
    uint64_t v7 = *(void (**)(uint64_t, char *))(a1 + 16);
    uint64_t v6 = (uint64_t (**)(uint64_t, char *))(a1 + 16);
    uint64_t result = Hal01_GetRevisionInfo(a3, v7);
    if (!result) {
      return result;
    }
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "HAL", 73, "Hal01_Init_SPI", 1285);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    *a2 = 0x300000002;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v10 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPI Init failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 69, "Hal01_Init_SPI");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    *a2 = 0x300000001;
    uint64_t v6 = (uint64_t (**)(uint64_t, char *))(a1 + 16);
  }
  return (*v6)(3, a3);
}

uint64_t Hal01_GetRevisionInfo(char *a1, void (*a2)(uint64_t, char *))
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v16 = 1;
  uint64_t result = (uint64_t)gnssOsa_Calloc("Hal01_GetRevisionInfo", 81, 1, 0x48uLL);
  if (result)
  {
    uint64_t v5 = (char *)result;
    if (Hal22_GetHwRevision(&v16))
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 69, "Hal01_GetRevisionInfo", 1286);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      int v7 = v16;
      *(_DWORD *)a1 = 3;
      *((_DWORD *)a1 + 1) = v7;
      a2(3, a1);
      free(v5);
      return 0;
    }
    else
    {
      *(_DWORD *)uint64_t v5 = 4;
      *((_DWORD *)v5 + 1) = (unsigned __int16)word_26A9CA200;
      Hal15_GetGNSSVersionString(&__p);
      if ((char)v15 < 0)
      {
        p_p = (const char *)__p;
        if (v14 >= 0x40) {
          size_t v8 = 64;
        }
        else {
          size_t v8 = v14;
        }
      }
      else
      {
        if ((v15 & 0xC0) != 0) {
          size_t v8 = 64;
        }
        else {
          size_t v8 = v15;
        }
        p_p = (const char *)&__p;
      }
      strncpy(v5 + 8, p_p, v8);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v10 = mach_continuous_time();
        BOOL v11 = byte_26A9CA1FD > 1u && word_26A9CA200 == 3599;
        uint64_t v12 = 78;
        if (v11) {
          uint64_t v12 = 89;
        }
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s, GNSSHW SPI,%c\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 73, "Hal01_GetRevisionInfo", v5 + 8, v12);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      a2(1, v5);
      free(v5);
      if ((char)v15 < 0) {
        operator delete(__p);
      }
      return 1;
    }
  }
  return result;
}

void sub_263D3233C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CRCGenerator::GetCRC32(void *a1, unsigned int a2, int a3)
{
  uint64_t v3 = a3 + a2;
  if (v3 <= a2)
  {
    unsigned int v10 = 0;
  }
  else
  {
    uint64_t v4 = a2;
    int v5 = -1;
    do
    {
      unsigned int v6 = __rbit32(*(unsigned __int8 *)(*a1 + v4));
      int v7 = 8;
      do
      {
        int v8 = v5 ^ v6;
        int v9 = 2 * v5;
        int v5 = (2 * v5) ^ 0x4C11DB7;
        if (v8 >= 0) {
          int v5 = v9;
        }
        v6 *= 2;
        --v7;
      }
      while (v7);
      ++v4;
    }
    while (v4 != v3);
    unsigned int v10 = ~v5;
  }
  return __rbit32(v10);
}

void Geo2ECEF(uint64_t a1, uint64_t a2, double *a3)
{
  v21[3] = *(double *)MEMORY[0x263EF8340];
  double v6 = *(double *)(a1 + 16);
  __double2 v7 = __sincos_stret(*(double *)a1);
  double v8 = *(double *)(a2 + 8) / sqrt(-(*(double *)(a2 + 24) * v7.__sinval) * v7.__sinval + 1.0);
  double v9 = v7.__cosval * (v6 + v8);
  double v10 = cos(*(long double *)(a1 + 8)) * v9;
  *a3 = v10;
  double v11 = sin(*(long double *)(a1 + 8)) * v9;
  a3[1] = v11;
  double v12 = v7.__sinval * (v6 + v8 * *(double *)(a2 + 40));
  a3[2] = v12;
  if (*(_WORD *)a2)
  {
    double v13 = v10 - *(double *)(a2 + 48);
    *a3 = v13;
    double v14 = v11 - *(double *)(a2 + 56);
    a3[1] = v14;
    double v15 = v12 - *(double *)(a2 + 64);
    a3[2] = v15;
    if (*(unsigned char *)(a2 + 2))
    {
      uint64_t v16 = 0;
      long long v17 = (double *)(a2 + 88);
      do
      {
        double v18 = v14 * *(v17 - 1) + *(v17 - 2) * v13;
        double v19 = *v17;
        v17 += 3;
        v21[v16++] = v18 + v19 * v15;
      }
      while (v16 != 3);
      double v20 = v14 - v21[1];
      *a3 = v13 - v21[0];
      a3[1] = v20;
      a3[2] = v15 - v21[2];
    }
  }
}

void GncS04_07SndDbgNmea(char *a1, size_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = gnssOsa_Calloc("GncS04_07SndDbgNmea", 211, 1, 0x18uLL);
  if (v4)
  {
    int v5 = v4;
    double v6 = gnssOsa_Calloc("GncS04_07SndDbgNmea", 220, (unsigned __int16)(a2 + 1), 1uLL);
    v5[2] = v6;
    if (v6)
    {
      memcpy_s("GncS04_07SndDbgNmea", 227, v6, (unsigned __int16)(a2 + 1), a1, a2);
      *((_WORD *)v5 + 6) = a2;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_NMEA_DATA_IND =>GNM Len,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "GncS04_07SndDbgNmea", *((unsigned __int16 *)v5 + 6));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      AgpsSendFsmMsg(130, 128, 8521475, v5);
    }
    else
    {
      free(v5);
    }
  }
}

void GncS04_08SndStartPosNmea(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __int16 v2 = word_26A9A1988;
  bzero(__str, 0x400uLL);
  uint64_t v3 = mach_continuous_time();
  unsigned __int16 v6 = snprintf(__str, 0x400uLL, "$PDPSS,%u,%u,%u,%u,%d,%u,%u,%u,%u,%u", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), *(unsigned __int16 *)(a1 + 2), *(unsigned __int8 *)(a1 + 4), *(unsigned __int8 *)(a1 + 49), *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), *(unsigned __int16 *)(a1 + 34), *(unsigned __int16 *)(a1 + 36), *(unsigned __int8 *)(a1 + 32));
  if (HswUtil_AddNmeaCS(__str, 0x400u, &v6))
  {
    size_t v4 = v6;
    LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)__str, v6);
    if ((v2 & 0x200) != 0) {
      GncS04_07SndDbgNmea(__str, v4);
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__s, 0x3C6uLL);
    uint64_t v5 = mach_continuous_time();
    snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 69, "GncS04_08SndStartPosNmea", 772, v6);
    gnssOsa_PrintLog(__s, 1, 1, 0);
  }
}

void GncS04_20SendUpdateToGncpe(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BYTE8(v4) = 0;
  *(void *)&long long v4 = 0;
  BYTE12(v4) = 1;
  HIWORD(v4) = *(_WORD *)(a1 + 2);
  char v5 = *(unsigned char *)(a1 + 32) & 3;
  int v6 = *(_DWORD *)(a1 + 8);
  char v15 = *(unsigned char *)(a1 + 50);
  int v1 = *(unsigned __int8 *)(a1 + 4);
  if (*(unsigned char *)(a1 + 4)) {
    int v1 = *(_DWORD *)(a1 + 28);
  }
  int v2 = *(_DWORD *)(a1 + 12);
  int v7 = v1;
  int v8 = v2;
  int v3 = *(_DWORD *)(a1 + 34);
  int v9 = *(_DWORD *)(a1 + 24);
  int v10 = v3;
  __int16 v11 = 0;
  char v12 = *(unsigned char *)(a1 + 33);
  __int16 v13 = 1;
  char v14 = *(unsigned char *)(a1 + 49);
  GncS03_07PosEventUpdate(&v4);
}

uint64_t GncS04_29GetRespUpdtStat(uint64_t a1, int a2, unsigned char *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (*(unsigned __int8 *)(a1 + 4) - 1 < 2)
    {
      int v6 = *(_DWORD *)(a1 + 8);
      int v7 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v6;
      if (a2 == 1 && !*(unsigned char *)(a1 + 48) || (int v8 = v7 + 30, (v7 + 30) >= *(_DWORD *)(a1 + 28)))
      {
        BOOL v19 = 1;
      }
      else
      {
        int LatestUpdtOsTime = GncP_GetLatestUpdtOsTime();
        if (LatestUpdtOsTime)
        {
          int v10 = LatestUpdtOsTime;
          uint64_t v11 = mach_continuous_time();
          int v12 = HIWORD(qword_26A9A1980);
          if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11) - v10 <= HIWORD(qword_26A9A1980))
          {
            int v7 = v10 - *(_DWORD *)(a1 + 8);
            int v8 = v7 + 30;
          }
        }
        else
        {
          int v12 = HIWORD(qword_26A9A1980);
        }
        BOOL v19 = (v8 + v12) > *(_DWORD *)(a1 + 28);
      }
      int v20 = *(unsigned __int8 *)(a1 + 4);
      BOOL v13 = v20 == 1 || v19;
      uint64_t v18 = v20 != 1 || v19;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v21 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SS ID,%u,Qual,%hhu,IsFinal,%u,SndUpdt,%u,TimeElapsed,%u,RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_29GetRespUpdtStat", *(unsigned __int16 *)(a1 + 2), a2, v13, v18, v7, *(_DWORD *)(a1 + 28));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      goto LABEL_34;
    }
    if (!*(unsigned char *)(a1 + 4))
    {
      BOOL v13 = *(_DWORD *)(a1 + 20) == 1;
      if (*(_DWORD *)(a1 + 16))
      {
        int v14 = *(_DWORD *)(a1 + 8);
        int v15 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v14;
        if (HIWORD(qword_26A9A1980) + v15 + 30 > *(_DWORD *)(a1 + 16))
        {
          if (g_LbsOsaTrace_Config < 4)
          {
            LOBYTE(v13) = 1;
            uint64_t v18 = 1;
LABEL_34:
            *a3 = v13;
            return v18;
          }
          bzero(__str, 0x3C6uLL);
          uint64_t v16 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: PeriodicSessStopTm,%u,TimeElapsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "GNC", 73, "GncS04_29GetRespUpdtStat", *(_DWORD *)(a1 + 16), v15);
          BOOL v13 = 1;
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
      }
      if (g_LbsOsaTrace_Config < 4)
      {
        uint64_t v18 = 1;
      }
      else
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v17 = mach_continuous_time();
        uint64_t v18 = 1;
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Periodc ID,%u,Qual,%hhu,IsFinal,%u,SndUpdt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "GNC", 73, "GncS04_29GetRespUpdtStat", *(unsigned __int16 *)(a1 + 2), a2, v13, 1);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      goto LABEL_34;
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", v23);
      goto LABEL_21;
    }
  }
  else if (g_LbsOsaTrace_Config >= 2)
  {
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_21:
    gnssOsa_PrintLog(__str, 2, 1, 0);
  }
  return 0;
}

void GncS04_33SessStopAckTimrExpiry(void)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (byte_26A9CC168)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoResp from GNCP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_33SessStopAckTimrExpiry");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    byte_26A9CC168 = 0;
    GncS04_31ChkSendPendingStopAck(0);
  }
}

void GncS04_31ChkSendPendingStopAck(int a1)
{
  uint64_t v2 = 0;
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = 1;
  do
  {
    char v4 = v3;
    if (*((unsigned char *)&g_GncSFGClientData + 52 * v2 + 28) == 3)
    {
      GncS04_21SendStopPosResp(a1, *((unsigned __int16 *)&g_GncSFGClientData + 26 * v2 + 15));
      GncS04_05DeRegClient(v2);
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (byte_26A9CC168)
  {
    if (AgpsFsmStopTimer(8523270))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v5 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 87, "GncS04_31ChkSendPendingStopAck", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
    byte_26A9CC168 = 0;
  }
}

void GncS04_36SessStartAckTimrExp(void)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (BYTE8(g_GncSFGClientData))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoResp from GNCP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_36SessStartAckTimrExp");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    BYTE8(g_GncSFGClientData) = 0;
    GncS04_35ChkSendPendingStartAck(0);
  }
}

void GncS04_35ChkSendPendingStartAck(int a1)
{
  uint64_t v2 = 0;
  *(void *)&v16[233] = *MEMORY[0x263EF8340];
  char v3 = 1;
  do
  {
    char v4 = v3;
    uint64_t v5 = (char *)&g_GncSFGClientData + 52 * v2;
    int v7 = v5[28];
    int v6 = v5 + 28;
    if (v7 == 2)
    {
      int v8 = (char *)&g_GncSFGClientData + 52 * v2;
      int v10 = *((unsigned __int16 *)v8 + 15);
      int v9 = (__int16 *)(v8 + 30);
      GncS04_22SendStartPosResp(a1, v10);
      if (a1 == 255)
      {
        unsigned char *v6 = 1;
      }
      else
      {
        __int16 v11 = *v9;
        char __str[8] = 0;
        *(void *)__str = 0;
        uint64_t v15 = 0;
        *(void *)uint64_t v16 = 0;
        uint64_t v14 = 0;
        *(_DWORD *)((char *)&v16[1] + 3) = 0;
        __str[12] = 1;
        *(_WORD *)&__str[14] = v11;
        __str[16] = 0;
        GncS03_07PosEventUpdate((long long *)__str);
        GncS04_05DeRegClient(v2);
      }
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (BYTE8(g_GncSFGClientData))
  {
    if (AgpsFsmStopTimer(8523014))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "GNC", 87, "GncS04_35ChkSendPendingStartAck", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
    BYTE8(g_GncSFGClientData) = 0;
  }
}

void GncS04_41SendNavData(__int16 a1, char a2, char a3, _DWORD *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v8 = gnssOsa_Calloc("GncS04_41SendNavData", 1234, 1, 0x20uLL);
  if (v8)
  {
    int v9 = v8;
    int v10 = gnssOsa_Calloc("GncS04_41SendNavData", 1240, 1, 0x1740uLL);
    v9[3] = v10;
    if (v10)
    {
      *((_DWORD *)v9 + 3) = *a4;
      *((_WORD *)v9 + 8) = a1;
      *((unsigned char *)v9 + 18) = a2;
      *((unsigned char *)v9 + 19) = a3;
      memcpy(v10, a4 + 2, 0x1740uLL);
      __int16 v11 = word_26A9A1988;
      bzero(__str, 0x400uLL);
      uint64_t v12 = v9[3];
      unsigned __int16 v16 = snprintf(__str, 0x400uLL, "$PDPPR,%u,%u,%u,%.9f,%.9f,%f,%.12f,%.12f,%u,%u,%u,%u,%u,%u", *((_DWORD *)v9 + 3), *(_DWORD *)v12, *((unsigned __int16 *)v9 + 8), *(double *)(v12 + 112), *(double *)(v12 + 120), *(double *)(v12 + 136), *(double *)(v12 + 48), *(double *)(v12 + 40), *(unsigned __int8 *)(v12 + 315), *(unsigned __int8 *)(v12 + 316), *(_DWORD *)(v12 + 304), *(unsigned __int8 *)(v12 + 312), *(unsigned __int8 *)(v12 + 297), *(_DWORD *)(v12 + 308));
      if (HswUtil_AddNmeaCS(__str, 0x400u, &v16))
      {
        size_t v13 = v16;
        LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)__str, v16);
        if ((v11 & 0x200) != 0) {
          GncS04_07SndDbgNmea(__str, v13);
        }
      }
      else
      {
        if (!g_LbsOsaTrace_Config)
        {
LABEL_13:
          AgpsSendFsmMsg(130, 128, 8520707, v9);
          return;
        }
        bzero(__s, 0x3C6uLL);
        uint64_t v14 = mach_continuous_time();
        snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "GNC", 69, "GncS04_40SndNavRespNmea", 772, v16);
        gnssOsa_PrintLog(__s, 1, 1, 0);
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_NAV_DATA_IND =>GNM ID,%u,OSTTick,%u,BBTick,%u,Valid,%u,VSF,%u,SVSignalsInView,%u,SatsUsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNC", 73, "GncS04_41SendNavData", *((unsigned __int16 *)v9 + 8), *((_DWORD *)v9 + 3), *(_DWORD *)v9[3], *((unsigned __int8 *)v9 + 19), *(unsigned __int8 *)(v9[3] + 297), *(unsigned __int8 *)(v9[3] + 315), *(unsigned __int8 *)(v9[3] + 316));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      goto LABEL_13;
    }
    free(v9);
  }
}

uint64_t GncS04_42GetValidNavDataCopy(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  GncP_GetNavData(a1);
  if (*(_WORD *)(a1 + 20))
  {
    if ((*(_DWORD *)a1 - a2) >= 0x3E9) {
      unsigned int v6 = a2 - *(_DWORD *)a1;
    }
    else {
      unsigned int v6 = 0;
    }
    if (v6 <= HIWORD(qword_26A9A1980) + 900)
    {
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v9 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 68, "GncS04_42GetValidNavDataCopy", v6);
        uint64_t v8 = 1;
        int v10 = 5;
LABEL_14:
        gnssOsa_PrintLog(__str, v10, 1, 0);
        return v8;
      }
    }
    else
    {
      if (v6 > a3)
      {
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v7 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData NA PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "GncS04_42GetValidNavDataCopy", v6);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        return 0;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData AllwdAge,%u,PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 73, "GncS04_42GetValidNavDataCopy", a3, v6);
        uint64_t v8 = 1;
        int v10 = 4;
        goto LABEL_14;
      }
    }
    return 1;
  }
  return 0;
}

uint64_t GncS04_71CheckAgeLimitCond(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  unsigned int v3 = v2;
  int v4 = v1;
  uint64_t v66 = *MEMORY[0x263EF8340];
  v36[0] = 0;
  memset(&v63[32], 0, 512);
  memset(&v36[2], 0, 11);
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  __int16 v39 = 0;
  long long v54 = 0u;
  memset(v55, 0, sizeof(v55));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v62 = 0u;
  memset(v63, 0, 29);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v5 = 968;
  long long v56 = 0u;
  long long v57 = 0u;
  do
  {
    unsigned int v6 = (char *)v36 + v5;
    char v7 = *((unsigned char *)v36 + v5 + 2);
    *(_WORD *)unsigned int v6 = 0;
    v6[2] = v7 & 0xE0;
    v5 += 3;
  }
  while (v5 != 1352);
  unsigned int v8 = v2;
  bzero(&v64, 0x1209uLL);
  uint64_t v9 = (char *)&g_GncSFGClientData + 52 * v3;
  char v11 = v9[60];
  int v10 = v9 + 60;
  if ((v11 & 2) != 0)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v65, 0x3C6uLL);
      unint64_t v35 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(v65, 0x3C5uLL, "%10u %s%c %s: AgeLimit NA ID,%u,PosOutput,%u\n", v35);
LABEL_31:
      uint64_t v32 = 1;
      goto LABEL_32;
    }
    return 1;
  }
  uint64_t v12 = (char *)&g_GncSFGClientData + 52 * v8;
  unsigned int v14 = *((_DWORD *)v12 + 18);
  size_t v13 = (unsigned int *)(v12 + 72);
  if ((GncS04_42GetValidNavDataCopy((uint64_t)v36, v4, v14) & 1) == 0)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v65, 0x3C6uLL);
      mach_continuous_time();
      snprintf(v65, 0x3C5uLL, "%10u %s%c %s: NavData NA ID,%u\n");
      goto LABEL_31;
    }
    return 1;
  }
  unsigned int v15 = *v13;
  unsigned __int16 v16 = (char *)&g_GncSFGClientData + 52 * v8;
  unsigned int v17 = *((unsigned __int16 *)v16 + 31);
  unsigned int v18 = *((unsigned __int16 *)v16 + 32);
  if (v17) {
    unsigned int v19 = v17;
  }
  else {
    unsigned int v19 = 100;
  }
  if (v18) {
    unsigned int v20 = v18;
  }
  else {
    unsigned int v20 = 150;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(v65, 0x3C6uLL);
    unint64_t v21 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    int v22 = v36[0];
    uint64_t v23 = mach_continuous_time();
    snprintf(v65, 0x3C5uLL, "%10u %s%c %s: CurrPos Age,%u,VSF,%u,HAcc,%f,VAcc,%f\n", v21, "GNC", 73, "GncS04_70QualifyNavForAgeLimit", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23) - v22, v55[25], *(double *)&v51, *((double *)&v50 + 1));
    gnssOsa_PrintLog(v65, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v65, 0x3C6uLL);
      uint64_t v24 = mach_continuous_time();
      snprintf(v65, 0x3C5uLL, "%10u %s%c %s: SessReq Age,%u,HAcc,%u,VAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "GNC", 73, "GncS04_70QualifyNavForAgeLimit", v15, v19, v20);
      gnssOsa_PrintLog(v65, 4, 1, 0);
    }
  }
  int v25 = v36[0];
  if (!v36[0]) {
    goto LABEL_24;
  }
  double v26 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
  unsigned int v27 = (unint64_t)v26 - v25;
  if (v25 - (unint64_t)v26 < 0x3E9) {
    unsigned int v27 = 0;
  }
  BOOL v28 = v27 >= v15 || v55[25] == 0;
  if (!v28
    && *(double *)&v51 <= (double)v19
    && *((double *)&v50 + 1) <= (double)v20
    && (uint64_t v29 = (char *)&g_GncSFGClientData + 52 * v8,
        int v31 = *((unsigned __int16 *)v29 + 15),
        char v30 = (__int16 *)(v29 + 30),
        GncS04_22SendStartPosResp(255, v31),
        (*v10 & 1) != 0))
  {
    GncS04_41SendNavData(*v30, 1, 1, v36);
    uint64_t v32 = 0;
  }
  else
  {
LABEL_24:
    uint64_t v32 = 1;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(v65, 0x3C6uLL);
    uint64_t v33 = mach_continuous_time();
    snprintf(v65, 0x3C5uLL, "%10u %s%c %s: SendReqGncP,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "GNC", 73, "GncS04_71CheckAgeLimitCond", v32);
LABEL_32:
    gnssOsa_PrintLog(v65, 4, 1, 0);
  }
  return v32;
}

void GncS04_22SendStartPosResp(int a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = gnssOsa_Calloc("GncS04_22SendStartPosResp", 416, 1, 0x10uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    *((_WORD *)v4 + 6) = a2;
    v4[14] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_RSP =>GNM ID,%hu,Code,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "GncS04_22SendStartPosResp", a2, a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(130, 128, 8519684, v5);
  }
}

void GncS04_72SendUpdates(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v2 = mach_continuous_time();
  char v3 = 0;
  uint64_t v4 = 0;
  *(void *)uint64_t v64 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2);
  int v63 = v1;
  do
  {
    char v5 = v3;
    uint64_t v6 = (char *)&g_GncSFGClientData + 52 * v4;
    int v9 = v6[28];
    char v7 = v6 + 28;
    int v8 = v9;
    if (v9) {
      uint64_t v10 = (uint64_t)v7;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v8 == 1)
    {
      char v11 = (char *)&g_GncSFGClientData + 52 * v4;
      int v13 = *((_DWORD *)v11 + 12);
      uint64_t v12 = v11 + 48;
      if (!v13)
      {
        if (g_LbsOsaTrace_Config < 4) {
          goto LABEL_94;
        }
        bzero(__str, 0x3C6uLL);
        mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,NumFix,0\n");
LABEL_19:
        int v20 = 4;
LABEL_93:
        gnssOsa_PrintLog(__str, v20, 1, 0);
        goto LABEL_94;
      }
      unsigned int v14 = (char *)&g_GncSFGClientData + 52 * v4;
      unsigned int v15 = *((_DWORD *)v14 + 10);
      unsigned __int16 v16 = (int *)(v14 + 36);
      if (v15) {
        BOOL v17 = v64[0] - *((_DWORD *)v14 + 9) + 30 >= v15;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        if (g_LbsOsaTrace_Config < 4) {
          goto LABEL_94;
        }
        bzero(__str, 0x3C6uLL);
        unint64_t v19 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,Unsol,%c,TmElapsed,%u,StartUpdt,%u\n", v19, "GNC");
        goto LABEL_19;
      }
      if (v63)
      {
        if (g_LbsOsaTrace_Config < 4) {
          goto LABEL_24;
        }
        bzero(__str, 0x3C6uLL);
        unint64_t v18 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updt Unsol ID,%u,Type,%hhu,PrevUpdt,%u\n", v18);
      }
      else
      {
        if (!*((unsigned char *)&g_GncSFGClientData + 52 * v4 + 32))
        {
          if (g_LbsOsaTrace_Config < 4) {
            goto LABEL_94;
          }
          bzero(__str, 0x3C6uLL);
          unint64_t v44 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,Type,%hhu,Unsol,N,PrevUpdt,%u\n", v44);
          goto LABEL_19;
        }
        if (g_LbsOsaTrace_Config < 4)
        {
LABEL_24:
          int v22 = (char *)&g_GncSFGClientData + 52 * v4;
          char v25 = v22[60];
          uint64_t v24 = v22 + 60;
          char v23 = v25;
          if ((v25 & 1) == 0)
          {
            int RespUpdtStat = 0;
            if ((v23 & 2) == 0) {
              goto LABEL_68;
            }
            goto LABEL_49;
          }
          char v65 = 0;
          *(_DWORD *)__str = 0;
          memset(&v85[176], 0, 512);
          *(_DWORD *)((char *)&v68[1] + 3) = 0;
          *(void *)v68 = 0;
          *(void *)&v68[3] = 0;
          *(void *)&v68[5] = 0;
          __int16 v69 = 0;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          memset(v85, 0, 30);
          uint64_t v27 = 968;
          memset(&v85[32], 0, 141);
          do
          {
            BOOL v28 = &__str[v27];
            char v29 = __str[v27 + 2];
            *(_WORD *)BOOL v28 = 0;
            v28[2] = v29 & 0xE0;
            v27 += 3;
          }
          while (v27 != 1352);
          bzero(&v86, 0x1209uLL);
          int ValidNavDataCopy = GncS04_42GetValidNavDataCopy((uint64_t)__str, v64[0], 0);
          char v31 = ValidNavDataCopy;
          if (ValidNavDataCopy)
          {
            if (v88 >= 2u) {
              uint64_t v32 = 2;
            }
            else {
              uint64_t v32 = v88;
            }
            if (v32)
            {
              uint64_t v33 = (unsigned __int16 *)v87;
              while (*((unsigned char *)v33 - 1) != 1 || *v33 != *(unsigned __int16 *)(v10 + 2))
              {
                v33 += 2;
                if (!--v32) {
                  goto LABEL_38;
                }
              }
              int v35 = *((unsigned __int8 *)v33 - 2);
LABEL_43:
              int RespUpdtStat = GncS04_29GetRespUpdtStat(v10, v35, &v65);
              if (RespUpdtStat)
              {
                GncS04_41SendNavData(*(_WORD *)(v10 + 2), v65, v31, __str);
                if (*(_DWORD *)(v10 + 24) >> 3 >= 0x271u) {
                  GncS03_08SessRespSentInd(v64[0], v68[0], *(_WORD *)(v10 + 2), 0);
                }
              }
              else if (g_LbsOsaTrace_Config >= 4)
              {
                bzero(__s, 0x3C6uLL);
                uint64_t v37 = mach_continuous_time();
                snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavData NoUpdt ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v37), "GNC", 73, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
                gnssOsa_PrintLog(__s, 4, 1, 0);
              }
              if ((*v24 & 2) == 0) {
                goto LABEL_68;
              }
LABEL_49:
              if (!v63) {
                goto LABEL_68;
              }
              uint64_t v38 = gnssOsa_Calloc("GncS04_37UpdateDetailedMeasData", 1143, 1, 0x1B8uLL);
              if (!v38) {
                goto LABEL_68;
              }
              __int16 v39 = v38;
              if (GncP_GetDetailedMeasData((uint64_t)v38))
              {
                __s[0] = 0;
                GncS04_29GetRespUpdtStat(v10, 1, __s);
                long long v40 = gnssOsa_Calloc("GncS04_37UpdateDetailedMeasData", 1167, 1, 0x20uLL);
                if (v40)
                {
                  long long v41 = v40;
                  v40[3] = v64[0];
                  *((_WORD *)v40 + 8) = *(_WORD *)(v10 + 2);
                  *((unsigned char *)v40 + 18) = __s[0];
                  *((void *)v40 + 3) = v39;
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    uint64_t v42 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_RAWMEAS_DATA_IND =>GNM ID,%d,OSTTick,%d,Final,%d,NumMeas,%u,NumUsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "GNC", 73, "GncS04_37UpdateDetailedMeasData", *((unsigned __int16 *)v41 + 8), v41[3], *((unsigned __int8 *)v41 + 18), *((unsigned __int16 *)v39 + 44), *((unsigned __int16 *)v39 + 164));
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                  }
                  AgpsSendFsmMsg(130, 128, 8520195, v41);
                  if (*v24 == 2)
                  {
                    int v43 = RespUpdtStat + 1;
                    goto LABEL_69;
                  }
LABEL_68:
                  int v43 = 1;
                  if (!RespUpdtStat)
                  {
                    int v43 = 0;
                    int v50 = 1;
LABEL_71:
                    int v51 = *(unsigned __int8 *)(v10 + 4);
                    if (v51 == 2)
                    {
                      int v55 = *v16;
                      if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation
                                                          * (double)mach_continuous_time())
                         - v55 >= *(_DWORD *)(v10 + 28))
                      {
                        _DWORD *v12 = 0;
                        if (g_LbsOsaTrace_Config < 4) {
                          goto LABEL_94;
                        }
                        bzero(__str, 0x3C6uLL);
                        uint64_t v56 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "GNC", 73, "GncS04_30UpdateSessionParam", *(unsigned __int16 *)(v10 + 2), *(_DWORD *)(v10 + 28));
                        int v57 = 4;
LABEL_89:
                        gnssOsa_PrintLog(__str, v57, 1, 0);
                      }
                    }
                    else
                    {
                      if (v51 != 1)
                      {
                        if (!*(unsigned char *)(v10 + 4))
                        {
                          if (RespUpdtStat && *v12 != -1) {
                            --*v12;
                          }
                          if (!*(_DWORD *)(v10 + 16)) {
                            goto LABEL_91;
                          }
                          int v52 = *v16;
                          uint64_t v53 = mach_continuous_time();
                          char v54 = RespUpdtStat ^ 1;
                          if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v53)
                             - v52
                             + HIWORD(qword_26A9A1980)
                             + 30 <= *(_DWORD *)(v10 + 16))
                            char v54 = 1;
                          if (v54) {
                            goto LABEL_91;
                          }
                          goto LABEL_90;
                        }
                        if (g_LbsOsaTrace_Config < 2) {
                          goto LABEL_94;
                        }
                        bzero(__str, 0x3C6uLL);
                        uint64_t v58 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 87, "GncS04_30UpdateSessionParam", 770, *(unsigned __int8 *)(v10 + 4));
                        int v57 = 2;
                        goto LABEL_89;
                      }
                      if (!v50)
                      {
LABEL_90:
                        _DWORD *v12 = 0;
                        goto LABEL_91;
                      }
                      *(_DWORD *)(v10 + 40) = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation
                                                               * (double)mach_continuous_time());
                    }
LABEL_91:
                    if (g_LbsOsaTrace_Config < 5) {
                      goto LABEL_94;
                    }
                    bzero(__str, 0x3C6uLL);
                    uint64_t v59 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,UpdtSnt,%u,PrevUpdt,%u,NumFix,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "GNC", 68, "GncS04_30UpdateSessionParam", *(unsigned __int16 *)(v10 + 2), v43, *(_DWORD *)(v10 + 40), *v12);
                    int v20 = 5;
                    goto LABEL_93;
                  }
LABEL_69:
                  uint64_t v49 = mach_continuous_time();
                  int v50 = 0;
                  *(_DWORD *)(v10 + 40) = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v49);
                  int RespUpdtStat = 1;
                  goto LABEL_71;
                }
              }
              else if (g_LbsOsaTrace_Config >= 2)
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v45 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: DetailMeas Updt NA ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v45), "GNC", 87, "GncS04_37UpdateDetailedMeasData", *(unsigned __int16 *)(v10 + 2));
                gnssOsa_PrintLog(__str, 2, 1, 0);
              }
              long long v46 = (void *)v39[12];
              if (v46) {
                free(v46);
              }
              v39[12] = 0;
              long long v47 = (void *)v39[42];
              if (v47) {
                free(v47);
              }
              v39[42] = 0;
              long long v48 = (void *)v39[44];
              if (v48) {
                free(v48);
              }
              free(v39);
              goto LABEL_68;
            }
LABEL_38:
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__s, 0x3C6uLL);
              uint64_t v34 = mach_continuous_time();
              snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavQual Missing ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "GNC", 87, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
              int v35 = 2;
              gnssOsa_PrintLog(__s, 2, 1, 0);
              goto LABEL_43;
            }
          }
          else if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__s, 0x3C6uLL);
            uint64_t v36 = mach_continuous_time();
            snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavData NA ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "GNC", 73, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
            gnssOsa_PrintLog(__s, 4, 1, 0);
          }
          int v35 = 2;
          goto LABEL_43;
        }
        bzero(__str, 0x3C6uLL);
        unint64_t v21 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updt ID,%u,Type,%hhu,Unsol,N,TmElapsed,%u,RespTime,%u\n", v21, "GNC");
      }
      gnssOsa_PrintLog(__str, 4, 1, 0);
      goto LABEL_24;
    }
LABEL_94:
    char v3 = 1;
    uint64_t v4 = 1;
  }
  while ((v5 & 1) == 0);
  uint64_t v60 = 0;
  char v61 = 1;
  do
  {
    unsigned int v62 = *((unsigned __int8 *)&g_GncSFGClientData + 52 * v60 + 28) - 3;
    if ((v61 & 1) == 0) {
      break;
    }
    char v61 = 0;
    uint64_t v60 = 1;
  }
  while (v62 < 0xFFFFFFFE);
  if (v62 >= 0xFFFFFFFE && (v63 & 1) == 0) {
    GncS04_74UpdateScheduler();
  }
}

void GncS04_74UpdateScheduler(void)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((_BYTE)g_GncSFGClientData)
  {
    if (AgpsFsmStopTimer(8522758) && g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_74UpdateScheduler", 1545);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(g_GncSFGClientData) = 0;
  }
  uint64_t v1 = 0;
  signed int v2 = 0x7FFFFFFF;
  char v3 = 1;
  do
  {
    char v4 = v3;
    if (*((unsigned char *)&g_GncSFGClientData + 52 * v1 + 28))
    {
      if (*((unsigned __int8 *)&g_GncSFGClientData + 52 * v1 + 28) <= 2u
        && *((_DWORD *)&g_GncSFGClientData + 13 * v1 + 12) != 0)
      {
        uint64_t v6 = (char *)&g_GncSFGClientData + 52 * v1;
        int v9 = v6[32];
        int v8 = (unsigned __int8 *)(v6 + 32);
        int v7 = v9;
        if ((v9 - 1) >= 2)
        {
          if (v7 && g_LbsOsaTrace_Config >= 2)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "GNC", 87, "GncS04_27GetUpdateReportInt", 770, *v8);
            int v19 = 2;
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v10 = (char *)&g_GncSFGClientData + 52 * v1;
          int v11 = *((_DWORD *)v10 + 9);
          int v12 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v11;
          int v14 = *((_DWORD *)v10 + 10);
          int v13 = v10 + 40;
          unsigned int v15 = v12 + 30;
          unsigned int v16 = v14 + v13[4];
          int v17 = v16 - v12 - 30;
          if (v17 <= 30) {
            int v17 = 30;
          }
          if (v15 >= v16) {
            int v17 = 30;
          }
          if (v17 < v2) {
            signed int v2 = v17;
          }
          if (g_LbsOsaTrace_Config > 4)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,StartTm,%u,RespTime,%u,MinPosTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 68, "GncS04_27GetUpdateReportInt", *((unsigned __int16 *)&g_GncSFGClientData + 26 * v1 + 15), *v13, v13[4], v2);
            int v19 = 5;
LABEL_24:
            gnssOsa_PrintLog(__str, v19, 1, 0);
          }
        }
      }
    }
    char v3 = 0;
    uint64_t v1 = 1;
  }
  while ((v4 & 1) != 0);
  if (v2 == 0x7FFFFFFF)
  {
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FGSess timer Not Req\n");
      goto LABEL_34;
    }
  }
  else
  {
    if (AgpsFsmStartTimer(0x820C06u, v2))
    {
      if (g_LbsOsaTrace_Config < 2) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 87, "GncS04_74UpdateScheduler", 1544, v2);
      int v22 = 2;
    }
    else
    {
      LOBYTE(g_GncSFGClientData) = 1;
      if (g_LbsOsaTrace_Config < 5) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Scheduler timer,%u\n");
LABEL_34:
      int v22 = 5;
    }
    gnssOsa_PrintLog(__str, v22, 1, 0);
  }
}

void GncS04_73FGPosTimerExpiry(void)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FG timer Expired\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 68, "GncS04_73FGPosTimerExpiry");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  LOBYTE(g_GncSFGClientData) = 0;
  GncS04_72SendUpdates(0);
}

uint64_t GncS04_75HandleStopPos(uint64_t a1)
{
  *(void *)&v43[247] = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(&__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_75HandleStopPos");
    gnssOsa_PrintLog((char *)&__str, 4, 1, 0);
  }
  if (a1)
  {
    uint64_t v3 = 0;
    int v4 = *(unsigned __int16 *)(a1 + 12);
    for (char i = 1; ; char i = 0)
    {
      char v6 = i;
      int v7 = (char *)&g_GncSFGClientData + 52 * v3;
      int v9 = *((unsigned __int16 *)v7 + 15);
      int v8 = (__int16 *)(v7 + 30);
      if (v9 == v4) {
        break;
      }
      uint64_t v3 = 1;
      if ((v6 & 1) == 0)
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(&__str, 0x3C6uLL);
          uint64_t v10 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionNotFound ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "GNC", 87, "GncS04_75HandleStopPos", 2052, v4);
          gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
        }
        GncS04_21SendStopPosResp(1, v4);
        return 0;
      }
    }
    __int16 v13 = word_26A9A1988;
    bzero(&__str, 0x400uLL);
    uint64_t v14 = mach_continuous_time();
    unsigned __int16 v37 = snprintf((char *)&__str, 0x400uLL, "$PDPST,%u,%u", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), v4);
    if (HswUtil_AddNmeaCS((char *)&__str, 0x400u, &v37))
    {
      size_t v15 = v37;
      LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)&__str, v37);
      if ((v13 & 0x200) != 0) {
        GncS04_07SndDbgNmea((char *)&__str, v15);
      }
    }
    else if (g_LbsOsaTrace_Config)
    {
      bzero(__s, 0x3C6uLL);
      uint64_t v16 = mach_continuous_time();
      snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "GNC", 69, "GncS04_09SndStopPosNmea", 772, v37);
      gnssOsa_PrintLog(__s, 1, 1, 0);
    }
    int v17 = (char *)&g_GncSFGClientData + 52 * v3;
    int v19 = v17[28];
    uint64_t v18 = (unsigned __int8 *)(v17 + 28);
    switch(v19)
    {
      case 0:
        goto LABEL_49;
      case 1:
        __int16 v20 = *v8;
        BYTE8(__str) = 0;
        *(void *)&long long __str = 0;
        uint64_t v41 = 0;
        *(void *)int v43 = 0;
        uint64_t v42 = 0;
        *(_DWORD *)((char *)&v43[1] + 3) = 0;
        BYTE12(__str) = 1;
        HIWORD(__str) = v20;
        char v40 = 0;
        GncS03_07PosEventUpdate(&__str);
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(&__str, 0x3C6uLL);
          uint64_t v21 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Stopped ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_75HandleStopPos", 2058, v4);
          gnssOsa_PrintLog((char *)&__str, 4, 1, 0);
        }
        if (byte_26A9CC168)
        {
          if (AgpsFsmStopTimer(8523270) && g_LbsOsaTrace_Config >= 2)
          {
            bzero(&__str, 0x3C6uLL);
            uint64_t v22 = mach_continuous_time();
            snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "GNC", 87, "GncS04_75HandleStopPos", 1545);
            gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
          }
          byte_26A9CC168 = 0;
        }
        unsigned __int8 *v18 = 3;
        if (AgpsFsmStartTimer(0x820E06u, 0x258u))
        {
          if (g_LbsOsaTrace_Config < 2) {
            goto LABEL_39;
          }
          bzero(&__str, 0x3C6uLL);
          uint64_t v23 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "GNC", 87, "GncS04_75HandleStopPos", 1544, 600);
          int v24 = 2;
        }
        else
        {
          byte_26A9CC168 = 1;
          if (g_LbsOsaTrace_Config < 5) {
            goto LABEL_39;
          }
          bzero(&__str, 0x3C6uLL);
          uint64_t v30 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: SessStopAck Timer,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "GNC", 68, "GncS04_75HandleStopPos", 600);
          int v24 = 5;
        }
        gnssOsa_PrintLog((char *)&__str, v24, 1, 0);
LABEL_39:
        uint64_t v31 = 0;
        char v32 = 1;
        do
        {
          unsigned int v33 = *((unsigned __int8 *)&g_GncSFGClientData + 52 * v31 + 28) - 3;
          if ((v32 & 1) == 0) {
            break;
          }
          char v32 = 0;
          uint64_t v31 = 1;
        }
        while (v33 < 0xFFFFFFFE);
        if (v33 > 0xFFFFFFFD)
        {
          GncS04_74UpdateScheduler();
        }
        else if ((_BYTE)g_GncSFGClientData)
        {
          if (AgpsFsmStopTimer(8522758) && g_LbsOsaTrace_Config >= 2)
          {
            bzero(&__str, 0x3C6uLL);
            uint64_t v34 = mach_continuous_time();
            snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "GNC", 87, "GncS04_75HandleStopPos", 1545);
            gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
          }
          LOBYTE(g_GncSFGClientData) = 0;
        }
LABEL_49:
        if (g_LbsOsaTrace_Config < 5) {
          return 0;
        }
        bzero(&__str, 0x3C6uLL);
        uint64_t v35 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "GNC", 68, "GncS04_75HandleStopPos", byte_26A9CC170);
        int v12 = 5;
        break;
      case 2:
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(&__str, 0x3C6uLL);
          uint64_t v27 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionNotActive ID,%u,State,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "GNC", 87, "GncS04_75HandleStopPos", 2050, v4, *v18);
          gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
        }
        __int16 v28 = *v8;
        BYTE8(__str) = 0;
        *(void *)&long long __str = 0;
        uint64_t v41 = 0;
        *(void *)int v43 = 0;
        uint64_t v42 = 0;
        *(_DWORD *)((char *)&v43[1] + 3) = 0;
        BYTE12(__str) = 1;
        HIWORD(__str) = v28;
        char v40 = 0;
        GncS03_07PosEventUpdate(&__str);
        GncS04_05DeRegClient(v3);
        GncS04_21SendStopPosResp(0, v4);
        goto LABEL_49;
      case 3:
        if (g_LbsOsaTrace_Config < 4) {
          return 0;
        }
        bzero(&__str, 0x3C6uLL);
        uint64_t v29 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: StopAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "GNC", 73, "GncS04_75HandleStopPos", v4);
        int v26 = 4;
        goto LABEL_35;
      default:
        if (g_LbsOsaTrace_Config < 2) {
          return 0;
        }
        bzero(&__str, 0x3C6uLL);
        uint64_t v25 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "GNC", 87, "GncS04_75HandleStopPos", 770);
        int v26 = 2;
LABEL_35:
        gnssOsa_PrintLog((char *)&__str, v26, 1, 0);
        goto LABEL_49;
    }
    goto LABEL_51;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(&__str, 0x3C6uLL);
    uint64_t v11 = mach_continuous_time();
    snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 69, "GncS04_75HandleStopPos", 517);
    int v12 = 1;
LABEL_51:
    gnssOsa_PrintLog((char *)&__str, v12, 1, 0);
  }
  return 0;
}

void GncS04_21SendStopPosResp(int a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = gnssOsa_Calloc("GncS04_21SendStopPosResp", 393, 1, 0x10uLL);
  if (v4)
  {
    char v5 = v4;
    *((_WORD *)v4 + 6) = a2;
    v4[14] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_RSP =>GNM ID,%hu,Code,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "GncS04_21SendStopPosResp", a2, a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(130, 128, 8519940, v5);
  }
}

void GncS04_05DeRegClient(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!byte_26A9CC170)
  {
    if (g_LbsOsaTrace_Config < 2) {
      return;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n");
    goto LABEL_13;
  }
  if (a1 >= 2)
  {
    if (g_LbsOsaTrace_Config < 2) {
      return;
    }
LABEL_12:
    bzero(__str, 0x3C6uLL);
    unint64_t v6 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Handle,%u\n", v6);
LABEL_13:
    gnssOsa_PrintLog(__str, 2, 1, 0);
    return;
  }
  uint64_t v2 = (char *)&g_GncSFGClientData + 52 * a1;
  int v4 = v2[28];
  uint64_t v3 = v2 + 28;
  if (!v4)
  {
    if (g_LbsOsaTrace_Config < 2) {
      return;
    }
    goto LABEL_12;
  }
  --byte_26A9CC170;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u,DeRegSessionID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "GncS04_05DeRegClient", byte_26A9CC170, *((unsigned __int16 *)&g_GncSFGClientData + 26 * a1 + 15));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  *(_DWORD *)(v3 + 47) = 0;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
}

uint64_t GncS04_76HandleStartPos(uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_76HandleStartPos");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    uint64_t v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "GNC", 69, "GncS04_76HandleStartPos", 517);
    int v14 = 1;
    goto LABEL_14;
  }
  uint64_t v3 = 0;
  uint64_t v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (*((unsigned __int16 *)&g_GncSFGClientData + 26 * v3 + 15) == *(unsigned __int16 *)(a1 + 12))
    {
      size_t v15 = (char *)&g_GncSFGClientData + 52 * v3 + 28;
      if (*(unsigned char *)(a1 + 14))
      {
        if (*(unsigned char *)(a1 + 14))
        {
          unsigned int v16 = *(_DWORD *)(a1 + 32);
          if (*(unsigned char *)(a1 + 15) == 2 && v16 > *(_DWORD *)(a1 + 36))
          {
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__str, 0x3C6uLL);
              unint64_t v17 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixInterval,%u,ResponseTime,%u\n", v17);
LABEL_57:
              int v37 = 1;
              gnssOsa_PrintLog(__str, 2, 1, 0);
LABEL_107:
              int v19 = *(unsigned __int16 *)(a1 + 12);
              int v20 = v37;
              goto LABEL_108;
            }
            goto LABEL_58;
          }
          if (v16 - 1 <= 0x62)
          {
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__str, 0x3C6uLL);
              unint64_t v25 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixInterval,%u,MinSupportedInt,%u\n", v25);
              goto LABEL_57;
            }
LABEL_58:
            int v37 = 1;
            goto LABEL_107;
          }
        }
        if ((*(unsigned char *)(a1 + 14) & 2) != 0 && *((unsigned char *)&g_GncSFGClientData + 52 * v3 + 32))
        {
          int v26 = *(_DWORD *)(a1 + 36);
          if (!v26) {
            int v26 = 1000;
          }
          uint64_t v27 = (char *)&g_GncSFGClientData + 52 * v3;
          *((_DWORD *)v27 + 14) = v26;
          __int16 v28 = v27 + 56;
          if (g_LbsOsaTrace_Config < 4)
          {
            int v30 = 1;
          }
          else
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v29 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v28);
            int v30 = 1;
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
        else
        {
          int v30 = 0;
        }
        char v31 = *(unsigned char *)(a1 + 14);
        if (v31)
        {
          int v32 = 1000;
          if (*(_DWORD *)(a1 + 32))
          {
            if (*((unsigned char *)&g_GncSFGClientData + 52 * v3 + 32) == 1) {
              int v32 = 1000;
            }
            else {
              int v32 = *(_DWORD *)(a1 + 32);
            }
          }
          unsigned int v33 = (char *)&g_GncSFGClientData + 52 * v3;
          *((_DWORD *)v33 + 13) = v32;
          uint64_t v34 = v33 + 52;
          if (g_LbsOsaTrace_Config < 4)
          {
            int v30 = 1;
          }
          else
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v35 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated FixInterval,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v34);
            int v30 = 1;
            gnssOsa_PrintLog(__str, 4, 1, 0);
            char v31 = *(unsigned char *)(a1 + 14);
          }
        }
        if ((v31 & 4) != 0)
        {
          uint64_t v38 = (char *)&g_GncSFGClientData + 52 * v3;
          int v40 = v38[60];
          __int16 v39 = (unsigned __int8 *)(v38 + 60);
          int v41 = *(unsigned __int8 *)(a1 + 48);
          if (v40 != v41)
          {
            *__int16 v39 = v41;
            if (g_LbsOsaTrace_Config < 4)
            {
              int v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v42 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated PosOutput,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v39);
              int v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              char v31 = *(unsigned char *)(a1 + 14);
            }
          }
        }
        if ((v31 & 8) != 0)
        {
          uint64_t v45 = (char *)&g_GncSFGClientData + 52 * v3;
          int v47 = v45[61];
          long long v46 = (unsigned __int8 *)(v45 + 61);
          int v48 = *(unsigned __int8 *)(a1 + 50);
          if (v47 != v48)
          {
            unsigned __int8 *v46 = v48;
            if (g_LbsOsaTrace_Config < 4)
            {
              int v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v49 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated ConstMask,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v49), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v46);
              int v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              char v31 = *(unsigned char *)(a1 + 14);
            }
          }
        }
        if ((v31 & 0x10) == 0)
        {
LABEL_85:
          if ((v31 & 0x20) != 0)
          {
            char v54 = (char *)&g_GncSFGClientData + 52 * v3;
            int v56 = *((unsigned __int16 *)v54 + 31);
            int v55 = (unsigned __int16 *)(v54 + 62);
            int v57 = *(unsigned __int16 *)(a1 + 44);
            if (v56 != v57)
            {
              unsigned __int16 *v55 = v57;
              if (g_LbsOsaTrace_Config < 4)
              {
                int v30 = 1;
              }
              else
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v58 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated HorAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v55);
                int v30 = 1;
                gnssOsa_PrintLog(__str, 4, 1, 0);
                char v31 = *(unsigned char *)(a1 + 14);
              }
            }
          }
          if ((v31 & 0x40) != 0)
          {
            uint64_t v59 = (char *)&g_GncSFGClientData + 52 * v3;
            int v61 = *((unsigned __int16 *)v59 + 32);
            uint64_t v60 = (unsigned __int16 *)(v59 + 64);
            int v62 = *(unsigned __int16 *)(a1 + 46);
            if (v61 != v62)
            {
              *uint64_t v60 = v62;
              if (g_LbsOsaTrace_Config < 4)
              {
                int v30 = 1;
              }
              else
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v63 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated VertAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v63), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v60);
                int v30 = 1;
                gnssOsa_PrintLog(__str, 4, 1, 0);
                char v31 = *(unsigned char *)(a1 + 14);
              }
            }
          }
          if ((v31 & 0x80) == 0) {
            goto LABEL_102;
          }
          uint64_t v64 = (char *)&g_GncSFGClientData + 52 * v3;
          int v66 = *((_DWORD *)v64 + 18);
          char v65 = v64 + 72;
          int v67 = *(_DWORD *)(a1 + 40);
          if (v66 == v67 || !*(unsigned char *)(a1 + 15)) {
            goto LABEL_102;
          }
          *char v65 = v67;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v68 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated AgeLimit,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v68), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v65);
            gnssOsa_PrintLog(__str, 4, 1, 0);
            int v67 = *v65;
          }
          if (v67 && !*((unsigned char *)&g_GncSFGClientData + 52 * v3 + 76))
          {
            char v74 = GncS04_71CheckAgeLimitCond(v4);
            long long v75 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v75 + 9) = v4;
            *((_DWORD *)v75 + 17) = v4;
            if (v74) {
              goto LABEL_103;
            }
          }
          else
          {
LABEL_102:
            __int16 v69 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v69 + 9) = v4;
            *((_DWORD *)v69 + 17) = v4;
            if (v30)
            {
LABEL_103:
              if (g_LbsOsaTrace_Config >= 4)
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v70 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionUpdted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v70), "GNC", 73, "GncS04_32HandleSessionModifyReq", 2059);
                gnssOsa_PrintLog(__str, 4, 1, 0);
              }
              GncS04_20SendUpdateToGncpe((uint64_t)v15);
              GncS04_74UpdateScheduler();
            }
          }
          GncS04_08SndStartPosNmea((uint64_t)v15);
          int v37 = 255;
          goto LABEL_107;
        }
        int v50 = *(unsigned __int16 *)(a1 + 28);
        if (*(_WORD *)(a1 + 28))
        {
          if (!*((unsigned char *)&g_GncSFGClientData + 52 * v3 + 32))
          {
LABEL_82:
            int v51 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v51 + 12) = v50;
            int v52 = v51 + 48;
            if (g_LbsOsaTrace_Config < 4)
            {
              int v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v53 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated NumReports,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v53), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v52);
              int v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              char v31 = *(unsigned char *)(a1 + 14);
            }
            goto LABEL_85;
          }
        }
        else if (!*((unsigned char *)&g_GncSFGClientData + 52 * v3 + 32))
        {
          int v50 = -1;
          goto LABEL_82;
        }
        int v50 = 1;
        goto LABEL_82;
      }
      if (*v15 != 2)
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          unint64_t v36 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ID,%u,ReqRcvd,%u\n", v36);
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      if (g_LbsOsaTrace_Config < 4) {
        return 0;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx StartAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_76HandleStartPos", 2053, *(unsigned __int16 *)(a1 + 12));
      int v14 = 4;
LABEL_14:
      gnssOsa_PrintLog(__str, v14, 1, 0);
      return 0;
    }
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  uint64_t v7 = 0;
  char v8 = 1;
  while (1)
  {
    char v9 = v8;
    uint64_t v10 = (char *)&g_GncSFGClientData + 52 * v7;
    int v12 = v10[28];
    uint64_t v11 = v10 + 28;
    if (!v12) {
      break;
    }
    char v8 = 0;
    uint64_t v7 = 1;
    if ((v9 & 1) == 0)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_24:
        gnssOsa_PrintLog(__str, 2, 1, 0);
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v18 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 87, "GncS04_76HandleStartPos", 2049);
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
      }
      goto LABEL_26;
    }
  }
  if (byte_26A9CC170 > 1u)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v100 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u,Max,%lu\n", v100);
      goto LABEL_24;
    }
LABEL_26:
    int v19 = *(unsigned __int16 *)(a1 + 12);
    int v20 = 0;
    goto LABEL_108;
  }
  ++byte_26A9CC170;
  *uint64_t v11 = 1;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v22 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "GNC", 73, "GncS04_76HandleStartPos", byte_26A9CC170);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (*(unsigned char *)(a1 + 14))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      uint64_t v103 = *(unsigned __int16 *)(a1 + 12);
      uint64_t v104 = *(unsigned __int8 *)(a1 + 14);
      uint64_t v102 = 515;
      int v24 = "%10u %s%c %s: #%04hx SessionID,%u,ReqType,%u\n";
      goto LABEL_35;
    }
LABEL_37:
    GncS04_05DeRegClient(v7);
    int v19 = *(unsigned __int16 *)(a1 + 12);
    int v20 = 1;
LABEL_108:
    GncS04_22SendStartPosResp(v20, v19);
    return 0;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    if (g_LbsOsaTrace_Config < 2) {
      goto LABEL_37;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v101 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx OutputType,%u\n", v101);
    goto LABEL_36;
  }
  unsigned int v43 = *(_DWORD *)(a1 + 24);
  int v44 = *(unsigned __int8 *)(a1 + 15);
  if (!v43)
  {
    int v72 = *(unsigned __int8 *)(a1 + 15);
    if (v44 != 2) {
      goto LABEL_119;
    }
    unsigned int v73 = *(_DWORD *)(a1 + 32);
    if (v73 <= *(_DWORD *)(a1 + 36))
    {
      int v72 = 2;
      goto LABEL_125;
    }
    if (g_LbsOsaTrace_Config < 2) {
      goto LABEL_37;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v103 = *(unsigned int *)(a1 + 32);
    uint64_t v104 = *(unsigned int *)(a1 + 36);
    uint64_t v102 = 514;
    int v24 = "%10u %s%c %s: #%04hx FixInterval,%u,ResponseTime,%u\n";
LABEL_35:
    snprintf(__str, 0x3C5uLL, v24, v23, "GNC", 87, "GncS04_23ChkStartPosParams", v102, v103, v104);
LABEL_36:
    gnssOsa_PrintLog(__str, 2, 1, 0);
    goto LABEL_37;
  }
  if (*(unsigned char *)(a1 + 15))
  {
    if (g_LbsOsaTrace_Config < 2) {
      goto LABEL_37;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v103 = *(unsigned __int8 *)(a1 + 15);
    uint64_t v104 = *(unsigned int *)(a1 + 24);
    uint64_t v102 = 515;
    int v24 = "%10u %s%c %s: #%04hx SessType,%hhu,StopTime,%u\n";
    goto LABEL_35;
  }
  if (v43 <= *(_DWORD *)(a1 + 20))
  {
    if (g_LbsOsaTrace_Config < 2) {
      goto LABEL_37;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v103 = *(unsigned int *)(a1 + 20);
    uint64_t v104 = *(unsigned int *)(a1 + 24);
    uint64_t v102 = 515;
    int v24 = "%10u %s%c %s: #%04hx StartTime,%u,StopTime,%u\n";
    goto LABEL_35;
  }
  int v72 = 0;
LABEL_119:
  unsigned int v73 = *(_DWORD *)(a1 + 32);
LABEL_125:
  if (v73 - 1 <= 0x62)
  {
    if (g_LbsOsaTrace_Config < 2) {
      goto LABEL_37;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v103 = *(unsigned int *)(a1 + 32);
    uint64_t v104 = 100;
    uint64_t v102 = 514;
    int v24 = "%10u %s%c %s: #%04hx FixInterval,%u,MinSupportedInt,%u\n";
    goto LABEL_35;
  }
  if (!v72 && *(_DWORD *)(a1 + 40))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v76 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx AgeLimit,%u,SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v76), "GNC", 87, "GncS04_23ChkStartPosParams", 515, *(_DWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 15));
      gnssOsa_PrintLog(__str, 2, 1, 0);
      int v44 = *(unsigned __int8 *)(a1 + 15);
    }
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (*(unsigned char *)(a1 + 16) && !v44)
  {
    if (g_LbsOsaTrace_Config < 2)
    {
      int v44 = 0;
    }
    else
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v77 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx WaitToTimeout,%u,SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v77), "GNC", 87, "GncS04_23ChkStartPosParams", 515, *(unsigned __int8 *)(a1 + 16), *(unsigned __int8 *)(a1 + 15));
      gnssOsa_PrintLog(__str, 2, 1, 0);
      int v44 = *(unsigned __int8 *)(a1 + 15);
    }
    *(unsigned char *)(a1 + 16) = 0;
  }
  __int16 v78 = *(_WORD *)(a1 + 12);
  long long v79 = (char *)&g_GncSFGClientData + 52 * v7;
  int v80 = 1000 * *(_DWORD *)(a1 + 20);
  *((_DWORD *)v79 + 10) = v80;
  long long v81 = v79 + 40;
  *((_WORD *)v81 - 5) = v78;
  v107 = (unsigned __int16 *)v81 - 5;
  *(v81 - 1) = v4;
  v81[7] = v4;
  *((unsigned char *)v81 - 8) = v44;
  int v82 = *(unsigned __int16 *)(a1 + 28);
  if (!*(_WORD *)(a1 + 28))
  {
    if (!v44)
    {
      int v82 = -1;
      goto LABEL_144;
    }
LABEL_143:
    int v82 = 1;
    goto LABEL_144;
  }
  if (v44) {
    goto LABEL_143;
  }
LABEL_144:
  long long v83 = (char *)&g_GncSFGClientData + 52 * v7;
  int v84 = *(_DWORD *)(a1 + 32);
  if (v44 == 1 || v84 == 0) {
    int v84 = 1000;
  }
  *((_DWORD *)v83 + 13) = v84;
  uint64_t v86 = v83 + 52;
  *((_DWORD *)v86 - 1) = v82;
  int v87 = *(_DWORD *)(a1 + 24);
  if (v87)
  {
    if (!v44)
    {
      *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 11) = 1000 * v87;
      goto LABEL_156;
    }
  }
  else if (!v44)
  {
    goto LABEL_156;
  }
  int v88 = *(_DWORD *)(a1 + 36);
  if (v88) {
    *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14) = v88 + v80;
  }
  else {
    *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14) = 1000;
  }
LABEL_156:
  unsigned __int8 v89 = *(unsigned char *)(a1 + 54);
  v90 = (char *)&g_GncSFGClientData + 52 * v7;
  v90[76] = *(unsigned char *)(a1 + 16);
  v91 = (unsigned __int8 *)(v90 + 76);
  v91[2] = v89;
  *(v91 - 16) = *(unsigned char *)(a1 + 48);
  *(v91 - 15) = *(unsigned char *)(a1 + 50);
  *(_DWORD *)(v91 - 14) = *(_DWORD *)(a1 + 44);
  *((_DWORD *)v91 - 1) = *(_DWORD *)(a1 + 40);
  v92 = v91 - 4;
  v91[1] = *(unsigned char *)(a1 + 49) != 0;
  if (g_LbsOsaTrace_Config >= 4)
  {
    v105 = v86 - 4;
    v106 = v86;
    bzero(__str, 0x3C6uLL);
    uint64_t v93 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ID,%u,Type,%hhu,NumFix,%d,FixInt,%u,Age,%u,PrefFtaMeasTime,%u,StartTm,%u,StopTm,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v93), "GNC", 73, "GncS04_24StoreSessParams", 2057, *v107, *((unsigned __int8 *)v81 - 8), *(_DWORD *)v105, *(_DWORD *)v106, *((_DWORD *)v91 - 1), v91[2], *v81, *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 11));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    v92 = v91 - 4;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v94 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespTime,%u,HAcc,%u,VAcc,%u,Output,%u,ConstMask,%u,WaitTO,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v94), "GNC", 73, "GncS04_24StoreSessParams", 2057, *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14), *((unsigned __int16 *)v91 - 7), *((unsigned __int16 *)v91 - 6), *(v91 - 16), *(v91 - 15), *v91);
      gnssOsa_PrintLog(__str, 4, 1, 0);
      v92 = v91 - 4;
    }
  }
  if (!*(_DWORD *)v92 || *v91 || GncS04_71CheckAgeLimitCond(v4))
  {
    *uint64_t v11 = 2;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v95 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: StartAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v95), "GNC", 73, "GncS04_76HandleStartPos", *v107);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (BYTE8(g_GncSFGClientData))
    {
      if (AgpsFsmStopTimer(8523014) && g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v96 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v96), "GNC", 87, "GncS04_76HandleStartPos", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      BYTE8(g_GncSFGClientData) = 0;
    }
    if (AgpsFsmStartTimer(0x820D06u, 0x1F40u))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v97 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v97), "GNC", 87, "GncS04_76HandleStartPos", 1544, 8000);
        int v98 = 2;
        goto LABEL_174;
      }
    }
    else
    {
      BYTE8(g_GncSFGClientData) = 1;
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v99 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SessStartAck Timer,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v99), "GNC", 68, "GncS04_76HandleStartPos", 8000);
        int v98 = 5;
LABEL_174:
        gnssOsa_PrintLog(__str, v98, 1, 0);
      }
    }
    GncS04_20SendUpdateToGncpe((uint64_t)v11);
    GncS04_74UpdateScheduler();
    GncS04_08SndStartPosNmea((uint64_t)v11);
  }
  return 0;
}

uint64_t GncS04_82HandlePosEvntResp(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_POS_EVENT_RSP Status,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_82HandlePosEvntResp", *(unsigned __int8 *)(a1 + 12));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    switch(*(unsigned char *)(a1 + 12))
    {
      case 1:
      case 3:
        int v3 = 255;
        goto LABEL_10;
      case 2:
      case 7:
        return 0;
      case 4:
      case 5:
        int v3 = 2;
LABEL_10:
        GncS04_31ChkSendPendingStopAck(v3);
        return 0;
      case 6:
      case 8:
        int v6 = 255;
        goto LABEL_15;
      case 9:
        int v6 = 0;
LABEL_15:
        GncS04_35ChkSendPendingStartAck(v6);
        return 0;
      default:
        if (g_LbsOsaTrace_Config < 2) {
          return 0;
        }
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GncS04_82HandlePosEvntResp", 770, *(unsigned __int8 *)(a1 + 12));
        int v5 = 2;
        break;
    }
    goto LABEL_8;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNC", 69, "GncS04_82HandlePosEvntResp", 517);
    int v5 = 1;
LABEL_8:
    gnssOsa_PrintLog(__str, v5, 1, 0);
  }
  return 0;
}

void GncS04_99DeInitFGClientInstance(void)
{
  if ((_BYTE)g_GncSFGClientData) {
    AgpsFsmStopTimer(8522758);
  }
  if (byte_26A9CC168) {
    AgpsFsmStopTimer(8523270);
  }
  if (BYTE8(g_GncSFGClientData))
  {
    AgpsFsmStopTimer(8523014);
  }
}

uint64_t Gnm10_00InitReq(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_INIT\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_00InitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    *(_OWORD *)&qword_26A9CC1F0 = 0u;
    *(_OWORD *)&qword_26A9CC200 = 0u;
    *(_OWORD *)&g_GnmCBs = 0u;
    HSW_InitConfiguration(a1);
    qword_26A9CA000 = 0;
    unk_26A9CA008 = 0;
    qword_26A9CA010 = 0;
    g_GnmInstances[0] = 0;
    g_HWStatus = 0u;
    unk_26A9CA06C = 0u;
    xmmword_26A9CA07C = 0u;
    unk_26A9CA08C = 0u;
    unk_26A9CA095 = 0u;
    g_HalStatusInfo = 0;
    qword_26A9CA2E8 = 0;
    unk_26A9CA2F0 = 0;
    g_Gnm_NVStoreCntxt = 0;
    *(_DWORD *)&byte_26A9CA2F7 = 0;
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_00InitReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

void *Gnm10_01DeinitReq(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_DEINIT\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_01DeinitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    g_IsHwInit = 0;
    Gnm02_24AbortAllNafSessions(7);
    Gnm02_52DeInitializeInstances();
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnmState,Active/Reset->Init\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 73, "Gnm10_01DeinitReq", 261);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    return &a_GnmInitState;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_01DeinitReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0;
  }
}

uint64_t Gnm10_04PositioningReq(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_04PositioningReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    uint64_t v3 = *(unsigned char *)(a1 + 54) & 2;
    uint64_t v4 = Gnm02_13ReqNewNafInstn(*(_DWORD *)(a1 + 12), "GNM_REG_POS_REQ");
    if (v4 && (uint64_t v5 = v4, (v6 = *((void *)v4 + 1)) != 0) && *((unsigned char *)v4 + 2) == 1)
    {
      unint64_t v7 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      *(unsigned char *)(v6 + 4) = *(unsigned char *)(a1 + 54);
      *(void *)(v6 + 72) = *(void *)(a1 + 64);
      *(unsigned char *)(v6 + 8) = *(unsigned char *)(a1 + 48);
      *(_DWORD *)(v6 + 12) = v7;
      *(_DWORD *)(v6 + 40) = v7;
      *(int32x2_t *)(v6 + 16) = vmul_s32(*(int32x2_t *)(a1 + 36), vdup_n_s32(0x3E8u));
      *(_DWORD *)(v6 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(v6 + 36) = v7;
      *(_WORD *)(v6 + 44) = *(_WORD *)(a1 + 44);
      *(_WORD *)(v6 + 52) = *(_WORD *)(a1 + 50);
      *(_WORD *)(v6 + 54) = *(_WORD *)(a1 + 52);
      *(void *)(v6 + 28) = *(void *)(a1 + 24);
      *(void *)(v6 + 56) = *(void *)(a1 + 16);
      *(unsigned char *)(v6 + 64) = *(unsigned char *)(a1 + 56);
      Hal_StoreCoExConfiguration(*(void *)(a1 + 72));
      uint64_t v8 = *((void *)v5 + 1);
      char v9 = gnssOsa_Calloc("Gnm10_27SendPosStart", 464, 1, 0x38uLL);
      if (v9)
      {
        uint64_t v11 = v9;
        v9[6] = *v5;
        v9[7] = 0;
        if ((*(unsigned char *)(v8 + 4) & 2) != 0)
        {
          v9[14] = *(_WORD *)(v8 + 44);
        }
        else if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v12 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "GNM", 87, "Gnm10_27SendPosStart", 770);
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        LODWORD(v10) = *(_DWORD *)(v8 + 16);
        *(double *)&unint64_t v17 = (double)v10 * 0.001;
        *((_DWORD *)v11 + 5) = *(double *)&v17;
        LODWORD(v17) = *(_DWORD *)(v8 + 20);
        *((_DWORD *)v11 + 6) = ((double)v17 * 0.001);
        *((_DWORD *)v11 + 8) = *(_DWORD *)(v8 + 24);
        v11[22] = *(_WORD *)(v8 + 52);
        v11[23] = *(_WORD *)(v8 + 54);
        *((unsigned char *)v11 + 48) = *(unsigned char *)(v8 + 8);
        *((unsigned char *)v11 + 50) = 115;
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v18 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SessionId,%u,StartTime,%u,StopTime,%u,NoOfRep,%u,FixInt,%u RespTime,%u,HorAcc,%u,VerAcc,%u,PosOutput,%u,ConstRep,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNM", 73, "Gnm10_27SendPosStart", (unsigned __int16)v11[6], *((_DWORD *)v11 + 5), *((_DWORD *)v11 + 6), (unsigned __int16)v11[14], *((_DWORD *)v11 + 8), *((_DWORD *)v11 + 9), (unsigned __int16)v11[22], (unsigned __int16)v11[23], *((unsigned __int8 *)v11 + 48), *((unsigned __int8 *)v11 + 50));
          gnssOsa_PrintLog(__str, 4, 1, 0);
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v19 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_REQ =>GNCS Id,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "GNM", 73, "Gnm10_27SendPosStart", (unsigned __int16)v11[6]);
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
        AgpsSendFsmMsg(128, 130, 8519680, v11);
      }
      else
      {
        Gnm11_00ApiStatusCB(11, 1, *(unsigned int *)(a1 + 12), v3);
        Gnm02_21DeleteInstn(v5);
      }
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v13 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "GNM", 87, "Gnm10_04PositioningReq", 2052);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      Gnm11_00ApiStatusCB(3, 1, *(unsigned int *)(a1 + 12), v3);
      int v14 = *(void **)(a1 + 64);
      if (v14) {
        free(v14);
      }
      *(void *)(a1 + 64) = 0;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v15 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNM", 69, "Gnm10_04PositioningReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    Gnm11_00ApiStatusCB(11, 0, 0, 0);
  }
  return 0;
}

uint64_t Gnm10_05DiscardPosReq(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_05DiscardPosReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Gnm11_00ApiStatusCB(4, 1, *(unsigned int *)(a1 + 12), *(unsigned char *)(a1 + 54) & 2);
    uint64_t v3 = *(void **)(a1 + 64);
    if (v3) {
      free(v3);
    }
    *(void *)(a1 + 64) = 0;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 69, "Gnm10_05DiscardPosReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    Gnm11_00ApiStatusCB(11, 0, 0, 0);
  }
  return 0;
}

uint64_t Gnm10_06StopPosnReq(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_STOP_POSN_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_06StopPosnReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_06StopPosnReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    uint64_t v6 = 11;
    goto LABEL_14;
  }
  uint64_t InstnFromNafId = Gnm02_32GetInstnFromNafId(*(_DWORD *)(a1 + 12));
  if (!InstnFromNafId)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNM", 87, "Gnm10_06StopPosnReq", 2052);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v6 = 3;
LABEL_14:
    Gnm11_00ApiStatusCB(v6, 0, 0, 1);
    return 0;
  }
  uint64_t v4 = (unsigned __int16 *)InstnFromNafId;
  if ((*(unsigned char *)(*(void *)(InstnFromNafId + 8) + 4) & 7) == 0 || !Gnm02_23StopNafSession(InstnFromNafId))
  {
    Gnm11_00ApiStatusCB(11, 1, *(unsigned int *)(a1 + 12), 1);
    Gnm02_21DeleteInstn(v4);
  }
  return 0;
}

uint64_t Gnm10_08HandleClearGnss(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_CLEAR_GNSS_CACHE\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_08HandleClearGnss");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 12);
    if ((v3 - 0x400000) <= 0xFFC00000)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DeleteFields,0x%X\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 87, "Gnm10_08HandleClearGnss", 770, v3);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      uint64_t v5 = 1;
      goto LABEL_15;
    }
    if (!byte_26A9CC211)
    {
      byte_26A9CC211 = 1;
      Gnm31_04SendClearNv(v3);
      return 0;
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v8 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx PrevReqOngoing\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNM", 87, "Gnm10_08HandleClearGnss", 1028);
      int v7 = 2;
      goto LABEL_13;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 69, "Gnm10_08HandleClearGnss", 517);
    int v7 = 1;
LABEL_13:
    gnssOsa_PrintLog(__str, v7, 1, 0);
  }
  uint64_t v5 = 11;
LABEL_15:
  Gnm11_00ApiStatusCB(v5, 0, 0, 16);
  return 0;
}

uint64_t Gnm10_09DisableGnss(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_DISABLE_GNSS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_09DisableGnss");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Gnm02_24AbortAllNafSessions(7);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_09DisableGnss", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Gnm10_10RegisterGnmCBs(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_CALLBACKS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_10RegisterGnmCBs");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    if (*(void *)(a1 + 16)) {
      g_GnmCBs = *(uint64_t (**)(void, void, void, void))(a1 + 16);
    }
    if (*(void *)(a1 + 24)) {
      qword_26A9CC200 = *(void *)(a1 + 24);
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_10RegisterGnmCBs", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Gnm10_13StopFwActivityRsp(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_STOP_FW_ACTIVE_RSP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_13StopFwActivityRsp");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  unsigned int v3 = g_LbsOsaTrace_Config;
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    uint64_t v8 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNM", 69, "Gnm10_13StopFwActivityRsp", 517);
    int v7 = 1;
LABEL_14:
    gnssOsa_PrintLog(__str, v7, 1, 0);
    return 0;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Activity,%hhu,Resp,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_13StopFwActivityRsp", *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    unsigned int v3 = g_LbsOsaTrace_Config;
  }
  if (*(unsigned char *)(a1 + 12) != 1 && v3 >= 2)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ActivityType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 87, "Gnm10_13StopFwActivityRsp", 770, *(unsigned __int8 *)(a1 + 12));
    int v7 = 2;
    goto LABEL_14;
  }
  return 0;
}

uint64_t Gnm10_15NmeaUpdateReq(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_NMEA_UPDATES\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_15NmeaUpdateReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (v3)
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Registering\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_15NmeaUpdateReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
        uint64_t v3 = *(void *)(a1 + 16);
      }
      qword_26A9CC1F0 = v3;
      word_26A9A1988 = *(_WORD *)(a1 + 24);
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Deregistering\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 73, "Gnm10_15NmeaUpdateReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      qword_26A9CC1F0 = 0;
      word_26A9A1988 = 0;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_15NmeaUpdateReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

BOOL Gnm10_28StopPositioning(unsigned __int16 *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (unsigned __int16 *)gnssOsa_Calloc("Gnm10_28StopPositioning", 517, 1, 0x10uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    v2[6] = *a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_REQ =>GNCS Id,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_28StopPositioning", v3[6]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(128, 130, 8519936, v3);
  }
  return v3 != 0;
}

uint64_t Gnm10_29SendFwActivity(char a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t result = (uint64_t)gnssOsa_Calloc("Gnm10_29SendFwActivity", 543, 1, 0x10uLL);
    if (!result) {
      return result;
    }
    uint64_t v4 = (unsigned char *)result;
    *(unsigned char *)(result + 12) = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_START_FW_ACTIVE_IND =>GNCP Activity,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 73, "Gnm10_29SendFwActivity", v4[12]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    int v6 = 8390403;
  }
  else
  {
    uint64_t result = (uint64_t)gnssOsa_Calloc("Gnm10_29SendFwActivity", 560, 1, 0x10uLL);
    if (!result) {
      return result;
    }
    uint64_t v4 = (unsigned char *)result;
    *(unsigned char *)(result + 12) = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_STOP_FW_ACTIVE_REQ =>GNC Activity,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNM", 73, "Gnm10_29SendFwActivity", v4[12]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    int v6 = 8390656;
  }
  AgpsSendFsmMsg(128, 132, v6, v4);
  return 1;
}

BOOL Gnm10_31SendMEWakeRsp(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = gnssOsa_Calloc("Gnm10_31SendMEWakeRsp", 586, 1, 0x10uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    v2[12] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_ME_WAKE_RSP =>GNCP Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_31SendMEWakeRsp", a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(128, 132, 8390916, v3);
  }
  return v3 != 0;
}

uint64_t Gnm10_zxGnssInitRsp(unsigned __int8 *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = a1[8];
  if (g_LbsOsaTrace_Config > 3)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_zxGnssInitRsp", v1);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (v1 == 32)
  {
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success response\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 68, "Gnm10_zxGnssInitRsp");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
    Gnm10_31SendMEWakeRsp(1);
    Gnm10_29SendFwActivity(1, 0);
  }
  else if (g_LbsOsaTrace_Config >= 2)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 87, "Gnm10_zxGnssInitRsp", 770, v1);
    gnssOsa_PrintLog(__str, 2, 1, 0);
  }
  return 0;
}

void XofData::LogSummaryOfDecodedData(XofData *this)
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Xof File create time [ Week number: %u, TOW: %u ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "LogSummaryOfDecodedData", *((unsigned __int16 *)this + 1), *((_DWORD *)this + 1));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ext. Eph. start time [ Week number: %u, TOW: %u ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNC", 73, "LogSummaryOfDecodedData", *((unsigned __int16 *)this + 4), *((_DWORD *)this + 3));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>((uint64_t)this, (uint64_t)this + 688, (uint64_t)this + 544, 0, 1, 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v140);
  int v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  int v7 = 0;
  for (uint64_t i = 1; i != 25; ++i)
  {
    if (*((unsigned char *)this + 209) && *((void *)this + 72))
    {
      uint64_t v9 = (unsigned __int8 *)this + 576;
      uint64_t v10 = *((void *)this + 72);
      do
      {
        unsigned int v11 = *(unsigned __int8 *)(v10 + 28);
        BOOL v12 = v11 >= i;
        if (v11 >= i) {
          uint64_t v13 = (uint64_t *)v10;
        }
        else {
          uint64_t v13 = (uint64_t *)(v10 + 8);
        }
        if (v12) {
          uint64_t v9 = (unsigned __int8 *)v10;
        }
        uint64_t v10 = *v13;
      }
      while (*v13);
      if (v9 != (unsigned __int8 *)((char *)this + 576) && v9[28] <= i)
      {
        v5 |= 1 << (i - 1);
        ++v4;
      }
    }
    if (*((unsigned char *)this + 210) && *((void *)this + 90))
    {
      int v14 = (unsigned __int8 *)this + 720;
      uint64_t v15 = *((void *)this + 90);
      do
      {
        unsigned int v16 = *(unsigned __int8 *)(v15 + 28);
        BOOL v17 = v16 >= i;
        if (v16 >= i) {
          uint64_t v18 = (uint64_t *)v15;
        }
        else {
          uint64_t v18 = (uint64_t *)(v15 + 8);
        }
        if (v17) {
          int v14 = (unsigned __int8 *)v15;
        }
        uint64_t v15 = *v18;
      }
      while (*v18);
      if (v14 != (unsigned __int8 *)((char *)this + 720) && v14[28] <= i)
      {
        v6 |= 1 << (i - 1);
        ++v7;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "GLO");
  if ((v148 & 0x80u) == 0) {
    uint64_t v19 = __str;
  }
  else {
    uint64_t v19 = *(char **)__str;
  }
  if ((v148 & 0x80u) == 0) {
    uint64_t v20 = v148;
  }
  else {
    uint64_t v20 = v147;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)v19, v20);
  if ((char)v148 < 0) {
    operator delete(*(void **)__str);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v21 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v21 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v21 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v21 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v21 - 24) + 8) |= 0x4000u;
  uint64_t v22 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v22 + *(void *)(*v22 - 24) + 8) = *(_DWORD *)((unsigned char *)v22 + *(void *)(*v22 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v23 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v23 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v23 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v23 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v23 - 24) + 8) |= 0x4000u;
  int v24 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v24 + *(void *)(*v24 - 24) + 8) = *(_DWORD *)((unsigned char *)v24 + *(void *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Sats: ", 11);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Blocks: ", 13);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v25 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v25 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v25 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v25 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v25 - 24) + 8) |= 0x4000u;
  int v26 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v26 + *(void *)(*v26 - 24) + 8) = *(_DWORD *)((unsigned char *)v26 + *(void *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v27 = mach_continuous_time();
    double v28 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v139 >= 0) {
      uint64_t v29 = __p;
    }
    else {
      uint64_t v29 = (void **)__p[0];
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v28 * (double)v27), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v29);
    if (v139 < 0) {
      operator delete(__p[0]);
    }
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  uint64_t v140 = *MEMORY[0x263F8C2C8];
  uint64_t v30 = v140;
  uint64_t v31 = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(uint64_t *)((char *)&v140 + *(void *)(v140 - 24)) = v31;
  uint64_t v141 = MEMORY[0x263F8C318] + 16;
  if (v144 < 0) {
    operator delete(v143);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v145);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v140);
  int v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  int v35 = 0;
  for (uint64_t j = 1; j != 37; ++j)
  {
    if (*((unsigned char *)this + 161) && *((void *)this + 75))
    {
      int v37 = (unsigned __int8 *)this + 600;
      uint64_t v38 = *((void *)this + 75);
      do
      {
        unsigned int v39 = *(unsigned __int8 *)(v38 + 28);
        BOOL v40 = v39 >= j;
        if (v39 >= j) {
          int v41 = (uint64_t *)v38;
        }
        else {
          int v41 = (uint64_t *)(v38 + 8);
        }
        if (v40) {
          int v37 = (unsigned __int8 *)v38;
        }
        uint64_t v38 = *v41;
      }
      while (*v41);
      if (v37 != (unsigned __int8 *)((char *)this + 600) && v37[28] <= j)
      {
        v33 |= 1 << (j - 1);
        ++v32;
      }
    }
    if (*((unsigned char *)this + 162) && *((void *)this + 93))
    {
      uint64_t v42 = (unsigned __int8 *)this + 744;
      uint64_t v43 = *((void *)this + 93);
      do
      {
        unsigned int v44 = *(unsigned __int8 *)(v43 + 28);
        BOOL v45 = v44 >= j;
        if (v44 >= j) {
          long long v46 = (uint64_t *)v43;
        }
        else {
          long long v46 = (uint64_t *)(v43 + 8);
        }
        if (v45) {
          uint64_t v42 = (unsigned __int8 *)v43;
        }
        uint64_t v43 = *v46;
      }
      while (*v46);
      if (v42 != (unsigned __int8 *)((char *)this + 744) && v42[28] <= j)
      {
        v34 |= 1 << (j - 1);
        ++v35;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "GAL");
  if ((v148 & 0x80u) == 0) {
    int v47 = __str;
  }
  else {
    int v47 = *(char **)__str;
  }
  if ((v148 & 0x80u) == 0) {
    uint64_t v48 = v148;
  }
  else {
    uint64_t v48 = v147;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)v47, v48);
  if ((char)v148 < 0) {
    operator delete(*(void **)__str);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v49 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v49 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v49 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v49 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v49 - 24) + 8) |= 0x4000u;
  int v50 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v50 + *(void *)(*v50 - 24) + 8) = *(_DWORD *)((unsigned char *)v50 + *(void *)(*v50 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v51 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v51 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v51 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v51 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v51 - 24) + 8) |= 0x4000u;
  int v52 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v52 + *(void *)(*v52 - 24) + 8) = *(_DWORD *)((unsigned char *)v52 + *(void *)(*v52 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Sats: ", 11);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Blocks: ", 13);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v53 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v53 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v53 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v53 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v53 - 24) + 8) |= 0x4000u;
  char v54 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v54 + *(void *)(*v54 - 24) + 8) = *(_DWORD *)((unsigned char *)v54 + *(void *)(*v54 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v55 = mach_continuous_time();
    double v56 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v139 >= 0) {
      int v57 = __p;
    }
    else {
      int v57 = (void **)__p[0];
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v56 * (double)v55), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v57);
    if (v139 < 0) {
      operator delete(__p[0]);
    }
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  uint64_t v140 = v30;
  *(uint64_t *)((char *)&v140 + *(void *)(v30 - 24)) = v31;
  uint64_t v141 = MEMORY[0x263F8C318] + 16;
  if (v144 < 0) {
    operator delete(v143);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v145);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v140);
  int v58 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  int v61 = 0;
  for (uint64_t k = 1; k != 64; ++k)
  {
    if (*((unsigned char *)this + 257) && *((void *)this + 81))
    {
      uint64_t v63 = (unsigned __int8 *)this + 648;
      uint64_t v64 = *((void *)this + 81);
      do
      {
        unsigned int v65 = *(unsigned __int8 *)(v64 + 28);
        BOOL v66 = v65 >= k;
        if (v65 >= k) {
          int v67 = (uint64_t *)v64;
        }
        else {
          int v67 = (uint64_t *)(v64 + 8);
        }
        if (v66) {
          uint64_t v63 = (unsigned __int8 *)v64;
        }
        uint64_t v64 = *v67;
      }
      while (*v67);
      if (v63 != (unsigned __int8 *)((char *)this + 648) && v63[28] <= k)
      {
        v59 |= 1 << (k - 1);
        ++v58;
      }
    }
    if (*((unsigned char *)this + 258) && *((void *)this + 99))
    {
      uint64_t v68 = (unsigned __int8 *)this + 792;
      uint64_t v69 = *((void *)this + 99);
      do
      {
        unsigned int v70 = *(unsigned __int8 *)(v69 + 32);
        BOOL v71 = v70 >= k;
        if (v70 >= k) {
          int v72 = (uint64_t *)v69;
        }
        else {
          int v72 = (uint64_t *)(v69 + 8);
        }
        if (v71) {
          uint64_t v68 = (unsigned __int8 *)v69;
        }
        uint64_t v69 = *v72;
      }
      while (*v72);
      if (v68 != (unsigned __int8 *)((char *)this + 792) && v68[32] <= k)
      {
        v60 |= 1 << (k - 1);
        ++v61;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "BDS");
  if ((v148 & 0x80u) == 0) {
    unsigned int v73 = __str;
  }
  else {
    unsigned int v73 = *(char **)__str;
  }
  if ((v148 & 0x80u) == 0) {
    uint64_t v74 = v148;
  }
  else {
    uint64_t v74 = v147;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)v73, v74);
  if ((char)v148 < 0) {
    operator delete(*(void **)__str);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v75 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v75 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v75 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v75 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v75 - 24) + 8) |= 0x4000u;
  uint64_t v76 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v76 + *(void *)(*v76 - 24) + 8) = *(_DWORD *)((unsigned char *)v76 + *(void *)(*v76 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v77 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v77 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v77 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v77 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v77 - 24) + 8) |= 0x4000u;
  __int16 v78 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v78 + *(void *)(*v78 - 24) + 8) = *(_DWORD *)((unsigned char *)v78 + *(void *)(*v78 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Sats: ", 11);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Blocks: ", 13);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v79 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v79 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v79 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v79 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v79 - 24) + 8) |= 0x4000u;
  int v80 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v80 + *(void *)(*v80 - 24) + 8) = *(_DWORD *)((unsigned char *)v80 + *(void *)(*v80 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v81 = mach_continuous_time();
    double v82 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v139 >= 0) {
      long long v83 = __p;
    }
    else {
      long long v83 = (void **)__p[0];
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v82 * (double)v81), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v83);
    if (v139 < 0) {
      operator delete(__p[0]);
    }
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  uint64_t v140 = v30;
  *(uint64_t *)((char *)&v140 + *(void *)(v30 - 24)) = v31;
  uint64_t v141 = MEMORY[0x263F8C318] + 16;
  if (v144 < 0) {
    operator delete(v143);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v145);
  XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>((uint64_t)this, (uint64_t)this + 760, (uint64_t)this + 616, 2u, 193, 10);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v140);
  int v84 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  int v87 = 0;
  for (uint64_t m = 1; m != 15; ++m)
  {
    if (*((unsigned char *)this + 305) && *((void *)this + 84))
    {
      unsigned __int8 v89 = (unsigned __int8 *)this + 672;
      uint64_t v90 = *((void *)this + 84);
      do
      {
        unsigned int v91 = *(unsigned __int8 *)(v90 + 28);
        BOOL v92 = v91 >= m;
        if (v91 >= m) {
          uint64_t v93 = (uint64_t *)v90;
        }
        else {
          uint64_t v93 = (uint64_t *)(v90 + 8);
        }
        if (v92) {
          unsigned __int8 v89 = (unsigned __int8 *)v90;
        }
        uint64_t v90 = *v93;
      }
      while (*v93);
      if (v89 != (unsigned __int8 *)((char *)this + 672) && v89[28] <= m)
      {
        v85 |= 1 << (m - 1);
        ++v84;
      }
    }
    if (*((unsigned char *)this + 306) && *((void *)this + 105))
    {
      uint64_t v94 = (unsigned __int8 *)this + 840;
      uint64_t v95 = *((void *)this + 105);
      do
      {
        unsigned int v96 = *(unsigned __int8 *)(v95 + 28);
        BOOL v97 = v96 >= m;
        if (v96 >= m) {
          int v98 = (uint64_t *)v95;
        }
        else {
          int v98 = (uint64_t *)(v95 + 8);
        }
        if (v97) {
          uint64_t v94 = (unsigned __int8 *)v95;
        }
        uint64_t v95 = *v98;
      }
      while (*v98);
      if (v94 != (unsigned __int8 *)((char *)this + 840) && v94[28] <= m)
      {
        v86 |= 1 << (m - 1);
        ++v87;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "NVC");
  if ((v148 & 0x80u) == 0) {
    uint64_t v99 = __str;
  }
  else {
    uint64_t v99 = *(char **)__str;
  }
  if ((v148 & 0x80u) == 0) {
    uint64_t v100 = v148;
  }
  else {
    uint64_t v100 = v147;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)v99, v100);
  if ((char)v148 < 0) {
    operator delete(*(void **)__str);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v101 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v101 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v101 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v101 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v101 - 24) + 8) |= 0x4000u;
  uint64_t v102 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v102 + *(void *)(*v102 - 24) + 8) = *(_DWORD *)((unsigned char *)v102 + *(void *)(*v102 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v103 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v103 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v103 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v103 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v103 - 24) + 8) |= 0x4000u;
  uint64_t v104 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v104 + *(void *)(*v104 - 24) + 8) = *(_DWORD *)((unsigned char *)v104 + *(void *)(*v104 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Sats: ", 11);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Blocks: ", 13);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v105 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v105 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v105 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v105 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v105 - 24) + 8) |= 0x4000u;
  v106 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v106 + *(void *)(*v106 - 24) + 8) = *(_DWORD *)((unsigned char *)v106 + *(void *)(*v106 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v107 = mach_continuous_time();
    double v108 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v139 >= 0) {
      uint64_t v109 = __p;
    }
    else {
      uint64_t v109 = (void **)__p[0];
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v108 * (double)v107), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v109);
    if (v139 < 0) {
      operator delete(__p[0]);
    }
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  uint64_t v140 = v30;
  *(uint64_t *)((char *)&v140 + *(void *)(v30 - 24)) = v31;
  uint64_t v141 = MEMORY[0x263F8C318] + 16;
  if (v144 < 0) {
    operator delete(v143);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v145);
  v137[0] = 0;
  v137[1] = 0;
  v136 = v137;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v140);
  int v110 = 0;
  uint64_t v111 = 0;
  uint64_t v112 = 0;
  int v113 = 0;
  for (uint64_t n = 120; n != 159; ++n)
  {
    if (*((unsigned char *)this + 65) && v137[0])
    {
      v115 = v137;
      v116 = v137[0];
      do
      {
        v117 = v116;
        v118 = v115;
        unsigned int v119 = *((unsigned __int8 *)v116 + 28);
        if (v119 >= n) {
          v115 = (void **)v116;
        }
        else {
          ++v116;
        }
        v116 = (void *)*v116;
      }
      while (v116);
      if (v115 != v137)
      {
        if (v119 < n) {
          v117 = v118;
        }
        if (*((unsigned __int8 *)v117 + 28) <= n)
        {
          v111 |= 1 << (n - 120);
          ++v110;
        }
      }
    }
    if (*((unsigned char *)this + 66) && *((void *)this + 102))
    {
      v120 = (unsigned __int8 *)this + 816;
      uint64_t v121 = *((void *)this + 102);
      do
      {
        unsigned int v122 = *(unsigned __int8 *)(v121 + 28);
        BOOL v123 = v122 >= n;
        if (v122 >= n) {
          v124 = (uint64_t *)v121;
        }
        else {
          v124 = (uint64_t *)(v121 + 8);
        }
        if (v123) {
          v120 = (unsigned __int8 *)v121;
        }
        uint64_t v121 = *v124;
      }
      while (*v124);
      if (v120 != (unsigned __int8 *)((char *)this + 816) && v120[28] <= n)
      {
        v112 |= 1 << (n - 120);
        ++v113;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "SBA");
  if ((v148 & 0x80u) == 0) {
    v125 = __str;
  }
  else {
    v125 = *(char **)__str;
  }
  if ((v148 & 0x80u) == 0) {
    uint64_t v126 = v148;
  }
  else {
    uint64_t v126 = v147;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)v125, v126);
  if ((char)v148 < 0) {
    operator delete(*(void **)__str);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v127 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v127 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v127 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v127 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v127 - 24) + 8) |= 0x4000u;
  v128 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v128 + *(void *)(*v128 - 24) + 8) = *(_DWORD *)((unsigned char *)v128 + *(void *)(*v128 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Sats: ", 12);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v129 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v129 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v129 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v129 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v129 - 24) + 8) |= 0x4000u;
  v130 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v130 + *(void *)(*v130 - 24) + 8) = *(_DWORD *)((unsigned char *)v130 + *(void *)(*v130 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Sats: ", 11);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Blocks: ", 13);
  *(void *)&v142[*(void *)(v140 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v140, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v131 = v140;
  *(void *)&v142[*(void *)(v140 - 24)] = 15;
  *(_DWORD *)((char *)&v140 + *(void *)(v131 - 24) + 8) = *(_DWORD *)((unsigned char *)&v140 + *(void *)(v131 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v140 + *(void *)(v131 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v140 + *(void *)(v131 - 24) + 8) |= 0x4000u;
  v132 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v132 + *(void *)(*v132 - 24) + 8) = *(_DWORD *)((unsigned char *)v132 + *(void *)(*v132 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v133 = mach_continuous_time();
    double v134 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v139 >= 0) {
      v135 = __p;
    }
    else {
      v135 = (void **)__p[0];
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v134 * (double)v133), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v135);
    if (v139 < 0) {
      operator delete(__p[0]);
    }
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  uint64_t v140 = v30;
  *(uint64_t *)((char *)&v140 + *(void *)(v30 - 24)) = v31;
  uint64_t v141 = MEMORY[0x263F8C318] + 16;
  if (v144 < 0) {
    operator delete(v143);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v145);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v136, v137[0]);
}

void sub_263D3B128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *__p,uint64_t a55,int a56,__int16 a57,char a58,char a59)
{
}

uint64_t XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v51);
  int v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  int v15 = 0;
  uint64_t v16 = a1 + 16 + 48 * a4;
  uint64_t v19 = *(void *)(a3 + 8);
  uint64_t v18 = a3 + 8;
  uint64_t v17 = v19;
  int v20 = *(unsigned __int8 *)(v16 + 1);
  int v21 = *(unsigned __int8 *)(v16 + 2);
  uint64_t v24 = *(void *)(a2 + 8);
  uint64_t v23 = a2 + 8;
  uint64_t v22 = v24;
  int v25 = a5;
  do
  {
    if (v20 && v17)
    {
      uint64_t v26 = v18;
      uint64_t v27 = v17;
      do
      {
        unsigned int v28 = *(unsigned __int8 *)(v27 + 28);
        BOOL v29 = v28 >= v25;
        if (v28 >= v25) {
          uint64_t v30 = (uint64_t *)v27;
        }
        else {
          uint64_t v30 = (uint64_t *)(v27 + 8);
        }
        if (v29) {
          uint64_t v26 = v27;
        }
        uint64_t v27 = *v30;
      }
      while (*v30);
      if (v26 != v18 && *(unsigned __int8 *)(v26 + 28) <= v25)
      {
        v13 |= 1 << (v25 - a5);
        ++v12;
      }
    }
    if (v21 && v22)
    {
      uint64_t v31 = v23;
      uint64_t v32 = v22;
      do
      {
        unsigned int v33 = *(unsigned __int8 *)(v32 + 28);
        BOOL v34 = v33 >= v25;
        if (v33 >= v25) {
          int v35 = (uint64_t *)v32;
        }
        else {
          int v35 = (uint64_t *)(v32 + 8);
        }
        if (v34) {
          uint64_t v31 = v32;
        }
        uint64_t v32 = *v35;
      }
      while (*v35);
      if (v31 != v23 && *(unsigned __int8 *)(v31 + 28) <= v25)
      {
        v14 |= 1 << (v25 - a5);
        ++v15;
      }
    }
    ++v25;
  }
  while (v25 < a6 + a5);
  if (a4 > 2) {
    unint64_t v36 = "   ";
  }
  else {
    unint64_t v36 = off_2655E7148[a4];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v36);
  if ((v55 & 0x80u) == 0) {
    int v37 = __p;
  }
  else {
    int v37 = (void **)__p[0];
  }
  if ((v55 & 0x80u) == 0) {
    uint64_t v38 = v55;
  }
  else {
    uint64_t v38 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)v37, v38);
  if ((char)v55 < 0) {
    operator delete(__p[0]);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", Alm sats: ", 12);
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", Alm Bitmask: ", 15);
  uint64_t v39 = v51[0];
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v39 - 24)) = *(_DWORD *)((unsigned char *)&v51[1] + *(void *)(v39 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v39 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v39 - 24)) |= 0x4000u;
  BOOL v40 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v40 + *(void *)(*v40 - 24) + 8) = *(_DWORD *)((unsigned char *)v40 + *(void *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", BCE Sats: ", 12);
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", BCE Bitmask: ", 15);
  uint64_t v41 = v51[0];
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v41 - 24)) = *(_DWORD *)((unsigned char *)&v51[1] + *(void *)(v41 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v41 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v41 - 24)) |= 0x4000u;
  uint64_t v42 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v42 + *(void *)(*v42 - 24) + 8) = *(_DWORD *)((unsigned char *)v42 + *(void *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Sats: ", 11);
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Blocks: ", 13);
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Bitmask: ", 14);
  uint64_t v43 = v51[0];
  *(void *)((char *)&v51[3] + *(void *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v43 - 24)) = *(_DWORD *)((unsigned char *)&v51[1] + *(void *)(v43 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v43 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(void *)(v43 - 24)) |= 0x4000u;
  unsigned int v44 = (void *)std::ostream::operator<<();
  *(_DWORD *)((char *)v44 + *(void *)(*v44 - 24) + 8) = *(_DWORD *)((unsigned char *)v44 + *(void *)(*v44 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__p, 0x3C6uLL);
    uint64_t v45 = mach_continuous_time();
    double v46 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v50 >= 0) {
      int v47 = (const char *)&v49;
    }
    else {
      int v47 = (const char *)v49;
    }
    snprintf((char *)__p, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v46 * (double)v45), "GNC", 73, "LogSummaryOfDecodedConstllationData", v47);
    if (v50 < 0) {
      operator delete(v49);
    }
    gnssOsa_PrintLog((char *)__p, 4, 1, 0);
  }
  v51[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v51 + *(void *)(v51[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v51[1] = MEMORY[0x263F8C318] + 16;
  if (v52 < 0) {
    operator delete((void *)v51[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E6ED60](&v53);
}

void sub_263D3B994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
}

uint64_t XofData::Decode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  int v108 = 372;
  std::string::basic_string[abi:ne180100]<0>(__p, "xofHeaderCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v132, (const std::string *)__p, 0, -1, 0);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v132, (void *)a2, &v108) == 1)
  {
    uint64_t v6 = 0;
    int v7 = -1;
    do
    {
      unsigned int v8 = __rbit32(*(unsigned __int8 *)(*(void *)a2 + v6));
      int v9 = 8;
      do
      {
        int v10 = v7 ^ v8;
        int v11 = 2 * v7;
        int v7 = (2 * v7) ^ 0x4C11DB7;
        if (v10 >= 0) {
          int v7 = v11;
        }
        v8 *= 2;
        --v9;
      }
      while (v9);
      ++v6;
    }
    while (v6 != 372);
    if (v133 == __rbit32(~v7))
    {
      int v12 = 1;
      uint64_t v13 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid header CRC in the XOF file!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNC", 87, "VerifyHeaderCRC");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      int v12 = 0;
      uint64_t v13 = 2;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v14 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF header CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "GNC", 87, "VerifyHeaderCRC");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    int v12 = 0;
    uint64_t v13 = 5;
  }
  if (v135 < 0)
  {
    operator delete(v134);
    if (!v12) {
      return v13;
    }
  }
  else if (!v12)
  {
    return v13;
  }
  int v108 = 364;
  std::string::basic_string[abi:ne180100]<0>(__p, "xofPayloadCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v132, (const std::string *)__p, 0, -1, 0);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v132, (void *)a2, &v108) == 1)
  {
    int CRC32 = CRCGenerator::GetCRC32((void *)a2, 0x178u, *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 376);
    if (v133 == CRC32)
    {
      int v17 = 1;
      uint64_t v13 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v19 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has invalid Payload CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "GNC", 87, "VerifyPayloadCRC");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      int v17 = 0;
      uint64_t v13 = 3;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v18 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF payload CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 87, "VerifyPayloadCRC");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    int v17 = 0;
    uint64_t v13 = 5;
  }
  if (v135 < 0)
  {
    operator delete(v134);
    if (!v17) {
      return v13;
    }
  }
  else if (!v17)
  {
    return v13;
  }
  XofHeaderCodec::XofHeaderCodec((XofHeaderCodec *)v132);
  if (XofHeaderCodec::Decode((uint64_t)v132, (void *)a2, a3))
  {
    XofHeader::XofHeader((uint64_t)__str, (uint64_t)v132);
    memcpy((void *)a1, __str, 0x16CuLL);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v20 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF Header decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "GNC", 73, "Decode", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (*(void *)(a2 + 8) - (*(void *)a2 + *a3) == *(_DWORD *)(a1 + 352))
    {
      std::string::basic_string[abi:ne180100]<0>(&v138, "sa0");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)__str, &v138, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v155, "sa1");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)__p, &v155, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v152, "sa2");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)v70, &v152, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v151, "sa3");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)v149, &v151, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v148, "sb0");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v156, &v148, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v144, "sb1");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v153, &v144, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v140, "sb2");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v145, &v140, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v137, "sb3");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v141, &v137, -128, 127, 0);
      int v108 = *(_DWORD *)__str;
      long long v109 = *(_OWORD *)&__str[8];
      uint64_t v110 = *(void *)&__str[24];
      memset(&__str[8], 0, 24);
      int v111 = *(_DWORD *)__p;
      long long v112 = *(_OWORD *)&__p[8];
      uint64_t v113 = *(void *)&__p[24];
      memset(&__p[8], 0, 24);
      int v114 = *(_DWORD *)v70;
      uint64_t v116 = *(void *)&v70[24];
      long long v115 = *(_OWORD *)&v70[8];
      memset(&v70[8], 0, 24);
      int v117 = *(_DWORD *)v149;
      uint64_t v119 = *(void *)&v149[24];
      long long v118 = *(_OWORD *)&v149[8];
      memset(&v149[8], 0, 24);
      int data = (int)v156.__r_.__value_.__l.__data_;
      uint64_t v122 = v157;
      long long v121 = *(_OWORD *)&v156.__r_.__value_.__r.__words[1];
      *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
      uint64_t v157 = 0;
      int v123 = (int)v153.__r_.__value_.__l.__data_;
      uint64_t v125 = v154;
      long long v124 = *(_OWORD *)&v153.__r_.__value_.__r.__words[1];
      *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
      uint64_t v154 = 0;
      int v126 = v145;
      uint64_t v128 = v147;
      long long v127 = v146;
      long long v146 = 0uLL;
      uint64_t v147 = 0;
      int v129 = v141;
      uint64_t v131 = v143;
      long long v130 = v142;
      long long v142 = 0uLL;
      uint64_t v143 = 0;
      if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v137.__r_.__value_.__l.__data_);
        if (SHIBYTE(v147) < 0) {
          operator delete((void *)v146);
        }
      }
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v140.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v154) < 0) {
        operator delete((void *)v153.__r_.__value_.__l.__size_);
      }
      if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v144.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v157) < 0) {
        operator delete((void *)v156.__r_.__value_.__l.__size_);
      }
      if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v148.__r_.__value_.__l.__data_);
      }
      if ((v149[31] & 0x80000000) != 0) {
        operator delete(*(void **)&v149[8]);
      }
      if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v151.__r_.__value_.__l.__data_);
      }
      if ((v70[31] & 0x80000000) != 0) {
        operator delete(*(void **)&v70[8]);
      }
      if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v152.__r_.__value_.__l.__data_);
      }
      if ((__p[31] & 0x80000000) != 0) {
        operator delete(*(void **)&__p[8]);
      }
      if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v155.__r_.__value_.__l.__data_);
      }
      if (__str[31] < 0) {
        operator delete(*(void **)&__str[8]);
      }
      if (SHIBYTE(v138.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v138.__r_.__value_.__l.__data_);
      }
      if (XofIonosphericModelCodec::Decode((char *)&v108, (void *)a2, a3))
      {
        *(void *)(a1 + 368) = HIBYTE(v108) | ((unint64_t)HIBYTE(v111) << 8) | ((unint64_t)HIBYTE(v114) << 16) | ((unint64_t)HIBYTE(v117) << 24) | ((unint64_t)HIBYTE(data) << 32) | ((unint64_t)HIBYTE(v123) << 40) | ((unint64_t)HIBYTE(v126) << 48) | ((unint64_t)HIBYTE(v129) << 56);
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v21 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IonoSpheric Model decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "Decode", *a3);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        std::string::basic_string[abi:ne180100]<0>(&v155, "a1");
        XofIntegralType<int>::XofIntegralType((uint64_t)__str, &v155, -8388608, 0x7FFFFF, 0);
        std::string::basic_string[abi:ne180100]<0>(&v152, "a0");
        XofIntegralType<int>::XofIntegralType((uint64_t)v70, &v152, 0x80000000, 0x7FFFFFFF, 0);
        std::string::basic_string[abi:ne180100]<0>(&v151, "tot");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v149, &v151, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v148, "wNt");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v156, &v148, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v144, "deltaTls");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v153, &v144, -128, 127, 0);
        std::string::basic_string[abi:ne180100]<0>(&v140, "wnLsf");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v145, &v140, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v137, "dn");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v141, &v137, 1, 7, 0);
        std::string::basic_string[abi:ne180100]<0>(&v136, "deltaTLsf");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v138, &v136, -128, 127, 0);
        *(_OWORD *)std::string __p = *(_OWORD *)__str;
        *(_OWORD *)&__p[16] = *(_OWORD *)&__str[16];
        long long v90 = *(_OWORD *)v70;
        uint64_t v22 = *(void *)&__str[32];
        memset(&__str[16], 0, 24);
        long long v91 = *(_OWORD *)&v70[16];
        std::string::size_type v23 = v71.__r_.__value_.__r.__words[0];
        uint64_t v89 = v22;
        *(void *)&v70[24] = 0;
        v71.__r_.__value_.__r.__words[0] = 0;
        *(void *)&v70[16] = 0;
        uint64_t v24 = *(void *)&v149[24];
        std::string::size_type v92 = v23;
        uint64_t v93 = *(void *)v149;
        long long v94 = *(_OWORD *)&v149[8];
        memset(&v149[8], 0, 24);
        uint64_t v95 = v24;
        std::string v96 = v156;
        uint64_t v97 = v157;
        *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
        uint64_t v157 = 0;
        std::string v98 = v153;
        uint64_t v99 = v154;
        *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
        uint64_t v154 = 0;
        uint64_t v100 = v145;
        uint64_t v102 = v147;
        long long v101 = v146;
        long long v146 = 0uLL;
        uint64_t v147 = 0;
        uint64_t v103 = v141;
        uint64_t v105 = v143;
        long long v104 = v142;
        long long v142 = 0uLL;
        uint64_t v143 = 0;
        std::string v106 = v138;
        uint64_t v107 = v139;
        *(_OWORD *)&v138.__r_.__value_.__r.__words[1] = 0uLL;
        uint64_t v139 = 0;
        if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v136.__r_.__value_.__l.__data_);
          if (SHIBYTE(v143) < 0) {
            operator delete((void *)v142);
          }
        }
        if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v137.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v147) < 0) {
          operator delete((void *)v146);
        }
        if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v140.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v154) < 0) {
          operator delete((void *)v153.__r_.__value_.__l.__size_);
        }
        if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v144.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v157) < 0) {
          operator delete((void *)v156.__r_.__value_.__l.__size_);
        }
        if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v148.__r_.__value_.__l.__data_);
        }
        if ((v149[31] & 0x80000000) != 0) {
          operator delete(*(void **)&v149[8]);
        }
        if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v151.__r_.__value_.__l.__data_);
        }
        if (v71.__r_.__value_.__s.__data_[7] < 0) {
          operator delete(*(void **)&v70[16]);
        }
        if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v152.__r_.__value_.__l.__data_);
        }
        if (__str[39] < 0) {
          operator delete(*(void **)&__str[16]);
        }
        if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v155.__r_.__value_.__l.__data_);
        }
        if (XofUtcModelCodec::Decode((int *)__p, (void *)a2, a3))
        {
          int v25 = HIDWORD(v90);
          __int16 v26 = HIWORD(v93);
          __int16 v27 = HIWORD(v96.__r_.__value_.__r.__words[0]);
          __int16 v28 = HIWORD(v98.__r_.__value_.__r.__words[0]);
          __int16 v29 = HIWORD(v100);
          __int16 v30 = HIWORD(v103);
          __int16 v31 = HIWORD(v106.__r_.__value_.__r.__words[0]);
          *(_DWORD *)(a1 + 376) = *(_DWORD *)&__p[12];
          *(_DWORD *)(a1 + 380) = v25;
          *(_WORD *)(a1 + 384) = v26;
          *(_WORD *)(a1 + 386) = v27;
          *(_WORD *)(a1 + 388) = v28;
          *(_WORD *)(a1 + 390) = v29;
          *(_WORD *)(a1 + 392) = v30;
          *(_WORD *)(a1 + 394) = v31;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v32 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTC Model decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v32), "GNC", 73, "Decode", *a3);
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
          uint64_t v68 = a1;
          if (*(unsigned char *)(a1 + 210) || *(unsigned char *)(a1 + 209) || *(unsigned char *)(a1 + 211))
          {
            uint64_t v33 = 0;
            while (1)
            {
              std::string::basic_string[abi:ne180100]<0>(&v156, "svId");
              XofIntegralType<unsigned char>::XofIntegralType((uint64_t)__str, &v156, 0, 24, 0);
              std::string::basic_string[abi:ne180100]<0>(&v153, "channelNo");
              XofIntegralType<signed char>::XofIntegralType((uint64_t)v149, &v153, -7, 6, 99);
              *(_OWORD *)&v70[8] = *(_OWORD *)&__str[8];
              *(void *)&v70[24] = *(void *)&__str[24];
              memset(&__str[8], 0, 24);
              *(_DWORD *)unsigned int v70 = *(_DWORD *)__str;
              LODWORD(v71.__r_.__value_.__l.__data_) = *(_DWORD *)v149;
              *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = *(_OWORD *)&v149[8];
              uint64_t v72 = *(void *)&v149[24];
              memset(&v149[8], 0, 24);
              if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v153.__r_.__value_.__l.__data_);
                if (__str[31] < 0) {
                  operator delete(*(void **)&__str[8]);
                }
              }
              if (SHIBYTE(v156.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v156.__r_.__value_.__l.__data_);
              }
              BOOL v34 = a3;
              BOOL v35 = XofGlonassChannelMapCodec::Decode((uint64_t)v70, (void *)a2, a3);
              if (v35)
              {
                *(_WORD *)(a1 + 396 + 2 * v33) = v70[3] | (v71.__r_.__value_.__s.__data_[3] << 8);
              }
              else if (g_LbsOsaTrace_Config >= 2)
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v36 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Glonass channel map decode failure, Sat Id = [ %d ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "GNC", 87, "Decode", v33 + 1);
                gnssOsa_PrintLog(__str, 2, 1, 0);
              }
              if (SHIBYTE(v72) < 0) {
                operator delete((void *)v71.__r_.__value_.__l.__size_);
              }
              if ((v70[31] & 0x80000000) != 0) {
                operator delete(*(void **)&v70[8]);
              }
              if (!v35) {
                break;
              }
              ++v33;
              a3 = v34;
              if (v33 == 24) {
                goto LABEL_124;
              }
            }
          }
          else
          {
LABEL_124:
            if (g_LbsOsaTrace_Config >= 4)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v37 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Glonass Channel map decoded, bytes decoded = [%u] \n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v37), "GNC", 73, "Decode", *a3);
              gnssOsa_PrintLog(__str, 4, 1, 0);
            }
            uint64_t v69 = a3;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            uint64_t v40 = 67;
            while (1)
            {
              if (*(unsigned char *)(a1 + v40 - 1) || *(unsigned char *)(a1 + v40 - 2) || *(unsigned char *)(a1 + v40))
              {
                std::string::basic_string[abi:ne180100]<0>(&v155, "sRefTime");
                XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v156, &v155, 0, 0xFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v152, "refWeekNo");
                XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v153, &v152, 0, 0x1FFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v151, "sTA0");
                XofIntegralType<int>::XofIntegralType((uint64_t)__str, &v151, 0x80000000, 0x7FFFFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v148, "sTA1");
                XofIntegralType<int>::XofIntegralType((uint64_t)v149, &v148, -8388608, 0x7FFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v144, "sTA2");
                XofIntegralType<signed char>::XofIntegralType((uint64_t)&v145, &v144, -64, 63, 0);
                std::string::basic_string[abi:ne180100]<0>(&v140, "sTA0_Corr");
                XofIntegralType<short>::XofIntegralType((uint64_t)&v141, &v140, -32768, 0x7FFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v137, "reserved");
                XofIntegralType<unsigned char>::XofIntegralType((uint64_t)&v138, &v137, 0, 255, 0);
                *(std::string *)unsigned int v70 = v156;
                *(void *)&v70[24] = v157;
                *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
                uint64_t v157 = 0;
                std::string v71 = v153;
                uint64_t v72 = v154;
                uint64_t v154 = 0;
                *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
                long long v73 = *(_OWORD *)__str;
                uint64_t v75 = *(void *)&__str[32];
                long long v74 = *(_OWORD *)&__str[16];
                memset(&__str[16], 0, 24);
                long long v76 = *(_OWORD *)v149;
                uint64_t v78 = v150;
                long long v77 = *(_OWORD *)&v149[16];
                *(void *)&v149[16] = 0;
                *(void *)&v149[24] = 0;
                uint64_t v150 = 0;
                int v79 = v145;
                uint64_t v81 = v147;
                long long v80 = v146;
                long long v146 = 0uLL;
                uint64_t v147 = 0;
                uint64_t v82 = v141;
                uint64_t v84 = v143;
                long long v83 = v142;
                long long v142 = 0uLL;
                uint64_t v143 = 0;
                int v85 = (int)v138.__r_.__value_.__l.__data_;
                uint64_t v87 = v139;
                long long v86 = *(_OWORD *)&v138.__r_.__value_.__r.__words[1];
                *(_OWORD *)&v138.__r_.__value_.__r.__words[1] = 0uLL;
                uint64_t v139 = 0;
                if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
                {
                  operator delete(v137.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v143) < 0) {
                    operator delete((void *)v142);
                  }
                }
                if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v140.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v147) < 0) {
                  operator delete((void *)v146);
                }
                if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v144.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v150) < 0) {
                  operator delete(*(void **)&v149[16]);
                }
                if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v148.__r_.__value_.__l.__data_);
                }
                if (__str[39] < 0) {
                  operator delete(*(void **)&__str[16]);
                }
                if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v151.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v154) < 0) {
                  operator delete((void *)v153.__r_.__value_.__l.__size_);
                }
                if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v152.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v157) < 0) {
                  operator delete((void *)v156.__r_.__value_.__l.__size_);
                }
                if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v155.__r_.__value_.__l.__data_);
                }
                BOOL v41 = XofGenericCodec::Decode<0ul,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>((uint64_t)v70, (void *)a2, v69);
                if (v41)
                {
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    uint64_t v42 = mach_continuous_time();
                    uint64_t v43 = "   ";
                    if (v39 <= 5) {
                      uint64_t v43 = off_2655E7160[v39];
                    }
                    double v44 = *(double *)&g_MacClockTicksToMsRelation;
                    std::string::basic_string[abi:ne180100]<0>(v149, v43);
                    uint64_t v45 = v149;
                    if (v149[23] < 0) {
                      uint64_t v45 = *(const char **)v149;
                    }
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Time Model for [ %s ] is decoded, bytes decoded = [%u]\n", (unint64_t)(v44 * (double)v42), "GNC", 73, "Decode", v45, *v69);
                    if ((v149[23] & 0x80000000) != 0) {
                      operator delete(*(void **)v149);
                    }
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                    a1 = v68;
                  }
                  __int16 v46 = HIWORD(v71.__r_.__value_.__r.__words[0]);
                  int v47 = HIDWORD(v73);
                  int v48 = HIDWORD(v76);
                  char v49 = HIBYTE(v79);
                  __int16 v50 = HIWORD(v82);
                  uint64_t v51 = a1 + v38;
                  *(_WORD *)(v51 + 444) = *(_WORD *)&v70[6];
                  *(_WORD *)(v51 + 446) = v46;
                  *(_DWORD *)(v51 + 448) = v47;
                  *(_DWORD *)(v51 + 452) = v48;
                  *(unsigned char *)(v51 + 456) = v49;
                  *(_WORD *)(v51 + 458) = v50;
                }
                else if (g_LbsOsaTrace_Config >= 2)
                {
                  bzero(__str, 0x3C6uLL);
                  uint64_t v52 = mach_continuous_time();
                  uint64_t v53 = "   ";
                  if (v39 <= 5) {
                    uint64_t v53 = off_2655E7160[v39];
                  }
                  double v54 = *(double *)&g_MacClockTicksToMsRelation;
                  std::string::basic_string[abi:ne180100]<0>(v149, v53);
                  if (v149[23] >= 0) {
                    unsigned __int8 v55 = v149;
                  }
                  else {
                    unsigned __int8 v55 = *(const char **)v149;
                  }
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Time Model decode failure, constellation Id = [ %s ]\n", (unint64_t)(v54 * (double)v52), "GNC", 87, "Decode", v55);
                  if ((v149[23] & 0x80000000) != 0) {
                    operator delete(*(void **)v149);
                  }
                  gnssOsa_PrintLog(__str, 2, 1, 0);
                  a1 = v68;
                }
                if (SHIBYTE(v87) < 0) {
                  operator delete((void *)v86);
                }
                if (SHIBYTE(v84) < 0) {
                  operator delete((void *)v83);
                }
                if (SHIBYTE(v81) < 0) {
                  operator delete((void *)v80);
                }
                if (SHIBYTE(v78) < 0) {
                  operator delete((void *)v77);
                }
                if (SHIBYTE(v75) < 0) {
                  operator delete((void *)v74);
                }
                if (SHIBYTE(v72) < 0) {
                  operator delete((void *)v71.__r_.__value_.__l.__size_);
                }
                if ((v70[31] & 0x80000000) != 0) {
                  operator delete(*(void **)&v70[8]);
                }
                if (!v41) {
                  break;
                }
              }
              ++v39;
              v38 += 16;
              v40 += 48;
              if (v39 == 6)
              {
                if (XofAlmanacData::Decode((uint64_t **)(a1 + 544), (void *)a2, v69, (unsigned __int8 *)a1) == 1)
                {
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    uint64_t v56 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Almanac decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "GNC", 73, "Decode", *v69);
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                  }
                  if (XofBrdcstEph::Decode(a1 + 688) == 1)
                  {
                    if (g_LbsOsaTrace_Config >= 4)
                    {
                      bzero(__str, 0x3C6uLL);
                      uint64_t v57 = mach_continuous_time();
                      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Broadcast Ephemeris decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v57), "GNC", 73, "Decode", *v69);
                      gnssOsa_PrintLog(__str, 4, 1, 0);
                    }
                    if (XofExtEph::Decode(a1 + 856) == 1)
                    {
                      if (g_LbsOsaTrace_Config >= 4)
                      {
                        bzero(__str, 0x3C6uLL);
                        uint64_t v58 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Extended Ephemeris decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 73, "Decode", *v69);
                        gnssOsa_PrintLog(__str, 4, 1, 0);
                      }
                      if (*(void *)(a2 + 8) - *(void *)a2 == *v69)
                      {
                        XofData::LogSummaryOfDecodedData((XofData *)a1);
                        uint64_t v13 = 1;
                      }
                      else
                      {
                        if (g_LbsOsaTrace_Config)
                        {
                          bzero(__str, 0x3C6uLL);
                          uint64_t v67 = mach_continuous_time();
                          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Buffer is not fully decoded. Invalid data length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v67), "GNC", 69, "Decode");
                          gnssOsa_PrintLog(__str, 1, 1, 0);
                        }
                        uint64_t v13 = 9;
                      }
                      goto LABEL_213;
                    }
                    if (g_LbsOsaTrace_Config >= 2)
                    {
                      bzero(__str, 0x3C6uLL);
                      uint64_t v66 = mach_continuous_time();
                      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Extended Ephemeris decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v66), "GNC", 87, "Decode");
                      gnssOsa_PrintLog(__str, 2, 1, 0);
                    }
                  }
                  else if (g_LbsOsaTrace_Config >= 2)
                  {
                    bzero(__str, 0x3C6uLL);
                    uint64_t v65 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Broadcast Ephemeris decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v65), "GNC", 87, "Decode");
                    gnssOsa_PrintLog(__str, 2, 1, 0);
                  }
                }
                else if (g_LbsOsaTrace_Config >= 2)
                {
                  bzero(__str, 0x3C6uLL);
                  uint64_t v64 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Almanac decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v64), "GNC", 87, "Decode");
                  gnssOsa_PrintLog(__str, 2, 1, 0);
                }
                break;
              }
            }
          }
        }
        else if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v62 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTC Model decode failure!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v62), "GNC", 87, "Decode");
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        uint64_t v13 = 5;
LABEL_213:
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>::~__tuple_impl((uint64_t)__p);
      }
      else
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v61 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ionosphere model decode failure!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v61), "GNC", 87, "Decode");
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        uint64_t v13 = 5;
      }
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>>::~__tuple_impl((uint64_t)&v108);
    }
    else
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v60 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid payload length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v60), "GNC", 69, "Decode");
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      uint64_t v13 = 9;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v59 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF Header data decode Failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "GNC", 73, "Decode");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    uint64_t v13 = 5;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)v132);
  return v13;
}

void sub_263D3D590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 239) < 0) {
    operator delete(*(void **)(a1 + 216));
  }
  if (*(char *)(a1 + 207) < 0) {
    operator delete(*(void **)(a1 + 184));
  }
  if (*(char *)(a1 + 175) < 0) {
    operator delete(*(void **)(a1 + 152));
  }
  if (*(char *)(a1 + 143) < 0) {
    operator delete(*(void **)(a1 + 120));
  }
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 271) < 0) {
    operator delete(*(void **)(a1 + 248));
  }
  if (*(char *)(a1 + 239) < 0) {
    operator delete(*(void **)(a1 + 216));
  }
  if (*(char *)(a1 + 207) < 0) {
    operator delete(*(void **)(a1 + 184));
  }
  if (*(char *)(a1 + 175) < 0) {
    operator delete(*(void **)(a1 + 152));
  }
  if (*(char *)(a1 + 143) < 0) {
    operator delete(*(void **)(a1 + 120));
  }
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 255) < 0) {
    operator delete(*(void **)(a1 + 232));
  }
  if (*(char *)(a1 + 223) < 0) {
    operator delete(*(void **)(a1 + 200));
  }
  if (*(char *)(a1 + 191) < 0) {
    operator delete(*(void **)(a1 + 168));
  }
  if (*(char *)(a1 + 159) < 0) {
    operator delete(*(void **)(a1 + 136));
  }
  if (*(char *)(a1 + 127) < 0) {
    operator delete(*(void **)(a1 + 104));
  }
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_263D3DEF8(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E6ED60](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  MEMORY[0x263E6EC00](v23, a1);
  if (v23[0])
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      uint64_t v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x263E6EC10](v23);
  return a1;
}

void sub_263D3E324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a2)
  {
    if (a16 < 0) {
      operator delete(__p);
    }
    MEMORY[0x263E6EC10](&a9);
    __cxa_begin_catch(exception_object);
    std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
    __cxa_end_catch();
    JUMPOUT(0x263D3E2D8);
  }
  _Unwind_Resume(exception_object);
}

BOOL XofGenericCodec::Decode<0ul,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>(uint64_t a1, void *a2, _DWORD *a3)
{
  return XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)a1, a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 32), a2, a3) == 1
      && XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 64), a2, a3) == 1
      && XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 104), a2, a3) == 1
      && XofIntegralType<signed char>::DecodeFromHexData((char *)(a1 + 144), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 176), a2, a3) == 1
      && XofIntegralType<unsigned char>::DecodeFromHexData((unsigned __int8 *)(a1 + 208), a2, a3) == 1;
}

BOOL XofUtcModelCodec::Decode(int *a1, void *a2, _DWORD *a3)
{
  if (XofIntegralType<int>::DecodeFromHexData(a1, a2, a3) != 1) {
    return 0;
  }

  return XofGenericCodec::Decode<1ul,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>((uint64_t)a1, a2, a3);
}

BOOL XofGenericCodec::Decode<1ul,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>(uint64_t a1, void *a2, _DWORD *a3)
{
  return XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 40), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 80), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 112), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 144), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 176), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 208), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 240), a2, a3) == 1;
}

unsigned char *NK_Set_Fix_Type(unsigned char *result, double *a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, double a9, double a10, int a11, char a12, int a13, int a14, unsigned char *a15, _DWORD *a16, unsigned int *a17, _DWORD *a18, int *a19, int *a20)
{
  if (a8 > 8) {
    double v20 = 100000000.0;
  }
  else {
    double v20 = dbl_263D84F78[a8];
  }
  double v21 = sqrt(a2[6] + a2[7]);
  double v22 = sqrt(a2[9] + a2[10]);
  unsigned int v23 = 1000 * a11 / a5;
  double v24 = sqrt(v20);
  if (!a13 || (unsigned int v25 = *a17, *a17 >= v23))
  {
    BOOL v27 = 0;
    int v28 = 0;
    BOOL v29 = 0;
    LOBYTE(v26) = 0;
    *(_DWORD *)(a4 + 20) = 0;
    goto LABEL_33;
  }
  if (*(_DWORD *)(a4 + 16) > v25)
  {
    BOOL v26 = *(_DWORD *)(a3 + 48) == 2
       || *(_DWORD *)(a3 + 68) == 2
       || *(_DWORD *)(a3 + 72) == 2
       || *(_DWORD *)(a3 + 76) == 2
       || *(_DWORD *)(a3 + 80) == 2
       || *(_DWORD *)(a3 + 84) == 2
       || *(_DWORD *)(a3 + 88) == 2;
    BOOL v27 = (*(_DWORD *)(a3 + 92) == 2 || *(_DWORD *)(a3 + 96) == 2) && a8 - 3 < 6;
    int v28 = a9 < 1000000.0 && *(_DWORD *)(a3 + 56) == 2 || *(_DWORD *)(a3 + 36) == 2 || v26;
LABEL_29:
    BOOL v29 = v22 < v24 + (double)((v25 * a5 / 0x1F4) & 0xFFFFFE) && v21 < 400.0;
    ++*(_DWORD *)(a4 + 20);
    goto LABEL_33;
  }
  if (a8 - 4 > 4)
  {
    BOOL v27 = 0;
    int v28 = 0;
    BOOL v29 = 0;
    LOBYTE(v26) = 0;
    goto LABEL_33;
  }
  LOBYTE(v26) = 0;
  int v28 = 0;
  BOOL v27 = 0;
  BOOL v29 = 0;
  if (*(unsigned __int8 *)(a3 + 2) <= 1u) {
    goto LABEL_29;
  }
LABEL_33:
  int v31 = *(_DWORD *)(a3 + 60);
  int v30 = *(_DWORD *)(a3 + 64);
  int v32 = *(_DWORD *)(a3 + 56);
  BOOL v34 = a10 < 500000.0 && v31 == 2;
  if (v32 != 1) {
    a9 = 1.0e16;
  }
  if (v31 != 1) {
    a10 = 1.0e16;
  }
  *a19 = 0;
  int v35 = result[6];
  if (!result[6] || *(unsigned char *)a4)
  {
    int v36 = 1;
LABEL_46:
    if (*a17 < 0x1869F) {
      ++*a17;
    }
    *a16 = 0;
    if (v35) {
      int v37 = 0;
    }
    else {
      int v37 = v36;
    }
    if ((v37 & v29) == 1 && *a17 <= v23 && *(unsigned __int8 *)(a3 + 2) <= 1u) {
      *a19 = 1;
    }
    goto LABEL_109;
  }
  if (v21 >= 400.0 && (a6 > 0x7CF || *a15 || v21 >= 1000.0))
  {
    char v38 = a12 ^ 1;
    int v36 = 1;
    if (a6 < 0x186A0) {
      char v38 = 0;
    }
    if ((v38 & 1) != 0 || !*a15) {
      goto LABEL_46;
    }
  }
  int v39 = *(_DWORD *)(a3 + 36);
  if (a14 > 8 || (int v40 = v39 == 1, a14 >= 7) && result[5])
  {
    if (v39 == 1) {
      int v40 = 2;
    }
    else {
      int v40 = 1;
    }
  }
  if (((v28 | v34) & 1) != 0
    || (v45 = *(unsigned __int8 *)(a3 + 1), int v42 = 5, 5 - v40 > v45)
    && (4 - v40 > v45 || (int v42 = 5, a10 >= 160000.0) && a9 >= 160000.0))
  {
    if (v30 == 2) {
      BOOL v34 = 1;
    }
    if ((v28 & 1) != 0
      || (v21 < 400.0 ? (v41 = !v34) : (v41 = 1), v41 || (int v42 = 4, 4 - v40 > *(unsigned __int8 *)(a3 + 1))))
    {
      if (a8 > 1) {
        char v43 = 1;
      }
      else {
        char v43 = v28;
      }
      if ((v43 & 1) == 0 && 2 - v40 <= *(unsigned __int8 *)(a3 + 1))
      {
        int v44 = 3;
        goto LABEL_167;
      }
      if (v29)
      {
        if (v32 == 1
          || *(_DWORD *)(a3 + 92) == 1
          && (*(_DWORD *)(a3 + 68) == 1
           || *(_DWORD *)(a3 + 72) == 1
           || *(_DWORD *)(a3 + 76) == 1
           || *(_DWORD *)(a3 + 80) == 1
           || *(_DWORD *)(a3 + 84) == 1
           || *(_DWORD *)(a3 + 88) == 1)
          || *(_DWORD *)(a3 + 96) == 1
          && (*(_DWORD *)(a3 + 68) == 1
           || *(_DWORD *)(a3 + 72) == 1
           || *(_DWORD *)(a3 + 76) == 1
           || *(_DWORD *)(a3 + 80) == 1
           || *(_DWORD *)(a3 + 84) == 1
           || *(_DWORD *)(a3 + 88) == 1))
        {
          int v44 = 2;
LABEL_167:
          int v36 = 0;
          *a19 = v44;
          goto LABEL_46;
        }
      }
      else
      {
        int v36 = 1;
        if (1 - v40 > *(unsigned __int8 *)(a3 + 1) || !(v27 | v28)) {
          goto LABEL_46;
        }
      }
      int v44 = 1;
      goto LABEL_167;
    }
  }
  *a19 = v42;
  if (*a16 < 0x1869Fu) {
    ++*a16;
  }
  *a17 = 0;
  *a18 = 0;
  if (!a13 && *a16 >= 3u) {
    *a16 = 2;
  }
LABEL_109:
  if (!*a15)
  {
LABEL_112:
    int v46 = 1;
    goto LABEL_113;
  }
  if (*a16 > 4u) {
    goto LABEL_111;
  }
  int v46 = 0;
  if (a6 > 0x12B || !v35 || v21 >= 400.0) {
    goto LABEL_113;
  }
  if (*(unsigned __int8 *)(a3 + 1) >= 6u)
  {
LABEL_111:
    *a15 = 0;
    goto LABEL_112;
  }
  int v46 = 0;
LABEL_113:
  *a20 = 0;
  if (a8 - 5 >= 4) {
    unsigned int v47 = 30;
  }
  else {
    unsigned int v47 = 100;
  }
  if (result[9] && !*(unsigned char *)a4 && (!v46 || v47 > a7 && v22 < v24))
  {
    int v48 = *(_DWORD *)(a3 + 48);
    BOOL v49 = v48 == 1;
    char v50 = v30 == 2 || v26;
    if (v50)
    {
      char v51 = v30 != 2 || v26;
      if ((v51 & 1) == 0 && (v49 ^ 3u) <= *(unsigned __int8 *)(a3 + 5))
      {
        int v52 = 4;
LABEL_169:
        *a20 = v52;
        return result;
      }
    }
    else
    {
      unsigned int v53 = *(unsigned __int8 *)(a3 + 5);
      if (v48 == 1) {
        unsigned int v54 = 3;
      }
      else {
        unsigned int v54 = 4;
      }
      if (v54 <= v53 || (v49 ^ 3u) <= v53 && v30 == 1)
      {
        int v52 = 5;
        goto LABEL_169;
      }
    }
    if (a8 > 1) {
      LOBYTE(v26) = 1;
    }
    if (!v26)
    {
      unsigned int v55 = v48 == 1 ? 1 : 2;
      if (v55 <= *(unsigned __int8 *)(a3 + 5))
      {
        int v52 = 3;
        goto LABEL_169;
      }
    }
    if (*(_DWORD *)(a3 + 76) == 1)
    {
      int v52 = 2;
      goto LABEL_169;
    }
    int v56 = *(_DWORD *)(a3 + 68);
    char v57 = v56 == 1 || v29;
    if (v56 == 1) {
      int v52 = 2;
    }
    else {
      int v52 = 1;
    }
    if (v57) {
      goto LABEL_169;
    }
    char v58 = v50 ^ 1;
    if (!v49 > *(unsigned __int8 *)(a3 + 5)) {
      char v58 = 1;
    }
    if ((v58 & 1) == 0)
    {
      int v52 = 1;
      goto LABEL_169;
    }
  }
  return result;
}

double *NK_Correct_State(double *result, unsigned char *a2, double *a3)
{
  if (*a2) {
    a3[15] = a3[15] + *result * -0.00000000333564095;
  }
  if (a2[1]) {
    a3[16] = a3[16] + result[1] * -0.00000000333564095;
  }
  if (a2[2]) {
    a3[17] = a3[17] + result[2] * -0.00000000333564095;
  }
  if (a2[3]) {
    a3[18] = a3[18] + result[3] * -0.00000000333564095;
  }
  if (a2[4]) {
    a3[19] = a3[19] + result[4] * -0.00000000333564095;
  }
  if (a2[6] && a2[7] && a2[8])
  {
    for (uint64_t i = 0; i != 3; ++i)
      a3[i + 6] = a3[i + 6] - result[i + 6];
  }
  if (a2[9] && a2[10] && a2[11])
  {
    uint64_t v4 = 0;
    double v5 = a3[5];
    uint64_t v6 = result + 9;
    do
    {
      uint64_t v7 = &a3[v4];
      v7[9] = a3[v4 + 9] - v6[v4];
      v7[12] = -v6[v4++] / v5;
    }
    while (v4 != 3);
  }
  if (a2[5]) {
    a3[20] = a3[20] - result[5];
  }
  return result;
}

BOOL Is_GPS_BinEph_Real(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12)
      || *(_DWORD *)(a1 + 16)
      || *(_DWORD *)(a1 + 20)
      || *(_DWORD *)(a1 + 24)
      || *(unsigned char *)(a1 + 34)
      || *(_WORD *)(a1 + 40)
      || *(unsigned __int16 *)(a1 + 45) << 8
      || *(unsigned __int16 *)(a1 + 53) << 8
      || *(unsigned __int16 *)(a1 + 61) << 8
      || *(unsigned __int16 *)(a1 + 73) << 8
      || *(unsigned __int16 *)(a1 + 81) << 8
      || *(unsigned __int16 *)(a1 + 89) << 8
      || *(_DWORD *)(a1 + 96)
      || (*(_WORD *)(a1 + 100) & 0xFFFC) != 0;
}

void Hal_StoreCoExConfiguration(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  g_GNSSCoExConfigSWRequest = a1;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v1 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #CoexConfig bitmask 0x%llx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v1), "HAL", 73, "Hal_StoreCoExConfiguration", g_GNSSCoExConfigSWRequest);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

uint64_t Hal_SetCoexConfig(void)
{
  __int16 v0 = 0;
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset((char *)v16 + 1, 0, 40);
  *(void *)uint64_t v15 = 0x1900284D6242787ALL;
  LOBYTE(v16[0]) = 71;
  for (uint64_t i = 8; i != 46; ++i)
    v0 += v15[i];
  v16[19] = v0;
  LOBYTE(v16[20]) = 10;
  g_HalState = 7;
  qword_26AA36330 = 0;
  if ((int)Hal22_ZxSendToChip(v15, 0x31uLL) <= 0)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_26;
  }
  int v2 = gnssOsa_SemWaitTimeOut(g_HandleAckSem, 0xC8u);
  if (v2 == 1)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    goto LABEL_23;
  }
  if (v2)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
LABEL_23:
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err\n");
LABEL_26:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Get Coex config failed\n");
LABEL_28:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    return 0;
  }
  if (_MergedGlobals_8 != 32)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v12 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err,%u\n", v12);
    goto LABEL_26;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal_GetCoexConfiguration");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  memset(&v16[1], 0, 39);
  *(void *)uint64_t v15 = 0x1900284D6242787ALL;
  v16[0] = 339;
  HIBYTE(v16[1]) = g_GNSSCoExConfigSWRequest & 1;
  HIBYTE(v16[2]) = (g_GNSSCoExConfigSWRequest & 4) != 0;
  HIBYTE(v16[3]) = (g_GNSSCoExConfigSWRequest & 8) != 0;
  HIBYTE(v16[4]) = (g_GNSSCoExConfigSWRequest & 2) != 0;
  HIBYTE(v16[5]) = (g_GNSSCoExConfigSWRequest & 0x10) != 0;
  HIBYTE(v16[6]) = (g_GNSSCoExConfigSWRequest & 0x20) != 0;
  Hal_PrintCoExConfig("Setting CoEx Config", g_GNSSCoExConfigSWRequest);
  __int16 v4 = 0;
  qword_26AA36330 = 0;
  for (uint64_t j = 8; j != 46; ++j)
    v4 += v15[j];
  v16[19] = v4;
  LOBYTE(v16[20]) = 10;
  g_HalState = 6;
  if ((int)Hal22_ZxSendToChip(v15, 0x31uLL) <= 0)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_28;
  }
  int v6 = gnssOsa_SemWaitTimeOut(g_HandleAckSem, 0xC8u);
  if (v6 == 1)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
    goto LABEL_36;
  }
  if (v6)
  {
    if (!g_LbsOsaTrace_Config) {
      return 0;
    }
LABEL_36:
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err\n");
    goto LABEL_28;
  }
  if (_MergedGlobals_8 == 83)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SetCoex,session ongoing\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "HAL", 87, "Hal_SetCoexConfig");
      uint64_t v8 = 1;
      int v9 = 2;
      goto LABEL_39;
    }
    return 1;
  }
  if (_MergedGlobals_8 == 32)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "HAL", 73, "Hal_SetCoexConfig");
      uint64_t v8 = 1;
      int v9 = 4;
LABEL_39:
      gnssOsa_PrintLog(__str, v9, 1, 0);
      return v8;
    }
    return 1;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    unint64_t v13 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err,%u\n", v13);
    goto LABEL_28;
  }
  return 0;
}

void Hal_PrintCoExConfig(const char *a1, unsigned int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s: 2G,%u, NR,%u, LTEB13,%u, LTEB14,%u, EAssist,%u, STW,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal_PrintCoExConfig", a1, a2 & 1, (a2 >> 1) & 1, (a2 >> 2) & 1, (a2 >> 3) & 1, (a2 >> 4) & 1, (a2 >> 5) & 1);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

void Hal_CoexConfigRespone(unsigned __int8 *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config) {
      return;
    }
    bzero(__str, 0x3C6uLL);
    uint64_t v7 = 513;
    unint64_t v6 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v3 = "%10u %s%c %s: #%04hx data\n";
    goto LABEL_17;
  }
  if (a1[2] != 66 || a1[3] != 66)
  {
    if (!g_LbsOsaTrace_Config) {
      return;
    }
    bzero(__str, 0x3C6uLL);
    unint64_t v2 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MC,%u,MID,%u,MIDEx,%u\n", v2, "HAL");
    goto LABEL_18;
  }
  _MergedGlobals_8 = a1[8];
  unsigned int v1 = qword_26AA36330 | a1[11] | (2 * a1[17]) | (4 * a1[13]) | (8 * a1[15]) | (16 * a1[19]) | (32 * a1[21]);
  qword_26AA36330 |= a1[11] | (2 * a1[17]) | (4 * a1[13]) | (8 * a1[15]) | (16 * a1[19]) | (32 * a1[21]);
  if (g_HalState == 6)
  {
    Hal_PrintCoExConfig("FWCoEx Set Response", v1);
    if (g_GNSSCoExConfigSWRequest != qword_26AA36330)
    {
      _MergedGlobals_8 = 71;
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Config mismatch SW,0x%llx,FW,0x%llx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 87, "Hal_CoexConfigRespone", g_GNSSCoExConfigSWRequest, qword_26AA36330);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
  }
  else if (g_HalState == 7)
  {
    Hal_PrintCoExConfig("FWCoEx Get Response", v1);
  }
  if (!gnssOsa_SemRelease((dispatch_semaphore_t)g_HandleAckSem) && g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    unint64_t v5 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v7 = 1542;
    uint64_t v8 = *__error();
    unint64_t v6 = v5;
    uint64_t v3 = "%10u %s%c %s: #%04hx HandleAckSem err,%d\n";
LABEL_17:
    snprintf(__str, 0x3C5uLL, v3, v6, "HAL", 69, "Hal_CoexConfigRespone", v7, v8);
LABEL_18:
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

BOOL Is_NVIC_IntEph_Real(uint64_t a1)
{
  return *(_DWORD *)(a1 + 60)
      || *(_WORD *)(a1 + 30)
      || *(_DWORD *)(a1 + 56)
      || *(_WORD *)(a1 + 64)
      || *(_WORD *)(a1 + 66)
      || *(_WORD *)(a1 + 68)
      || *(_WORD *)(a1 + 70)
      || *(_WORD *)(a1 + 72)
      || *(_WORD *)(a1 + 74)
      || *(unsigned char *)(a1 + 26)
      || *(_WORD *)(a1 + 28) != 0;
}

void GNB_Debug_Flush_Check(void)
{
  int v0 = qword_26AA2DC80 - qword_26AA2DC78;
  if (dword_26AA2DC70 - (int)g_CB_GDbg > 0) {
    int v0 = 0;
  }
  if ((v0 + dword_26AA2DC70 - g_CB_GDbg) <= 0x1FF)
  {
    GNSS_GNB_Debug_Ctl((uint64_t)&g_CB_GDbg);
  }
}

void GNB_Debug_BlockMove(char *__src, int a2)
{
  if (g_Logging_Cfg >= 4)
  {
    int v2 = a2;
    uint64_t v4 = (void *)g_CB_GDbg;
    int v5 = qword_26AA2DC80;
    int v6 = qword_26AA2DC80 - qword_26AA2DC78;
    if (dword_26AA2DC70 - (int)g_CB_GDbg > 0) {
      int v6 = 0;
    }
    if (v6 + dword_26AA2DC70 - (int)g_CB_GDbg <= a2)
    {
      GNSS_GNB_Debug_Ctl((uint64_t)&g_CB_GDbg);
      uint64_t v10 = (void *)g_CB_GDbg;
      int v11 = qword_26AA2DC80;
      int v12 = qword_26AA2DC80 - qword_26AA2DC78;
      if (dword_26AA2DC70 - (int)g_CB_GDbg > 0) {
        int v12 = 0;
      }
      int v13 = v12 + dword_26AA2DC70 - g_CB_GDbg;
      if (v2 > 1023)
      {
        if (v13 == 1024)
        {
          do
          {
            uint64_t v16 = 1023;
            do
            {
              uint64_t v17 = v16;
              BOOL v18 = v16-- != 0;
            }
            while (v18 && __src[v17] != 10);
            unsigned __int16 v19 = v16 + 2;
            if (v17) {
              unsigned __int16 v20 = v19;
            }
            else {
              unsigned __int16 v20 = 1024;
            }
            unsigned int v21 = GN_GPS_Write_GNB_Debug(v20, __src);
            if (!v21)
            {
              LbsOsaTrace_PrintAsciiBuf(0, 4u, 1, (uint64_t)"<OVERFLOW>\n", 12);
              goto LABEL_12;
            }
            __src += v21;
            v2 -= v21;
          }
          while (v2 > 1023);
          if (v2 >= 1)
          {
            int v22 = qword_26AA2DC80;
            unsigned int v23 = (void *)g_CB_GDbg;
            do
            {
              int v24 = v22 - v23;
              if (v2 >= v24) {
                int v25 = v24;
              }
              else {
                int v25 = v2;
              }
              memcpy(v23, __src, v25);
              unsigned int v23 = (void *)(g_CB_GDbg + v25);
              g_CB_GDbg = (uint64_t)v23;
              int v22 = qword_26AA2DC80;
              if ((unint64_t)v23 >= qword_26AA2DC80)
              {
                unsigned int v23 = (void *)qword_26AA2DC78;
                g_CB_GDbg = qword_26AA2DC78;
              }
              __src += v25;
              BOOL v9 = __OFSUB__(v2, v25);
              v2 -= v25;
            }
            while (!((v2 < 0) ^ v9 | (v2 == 0)));
          }
        }
      }
      else if (v13 > v2)
      {
        do
        {
          int v14 = v11 - v10;
          if (v2 >= v14) {
            int v15 = v14;
          }
          else {
            int v15 = v2;
          }
          memcpy(v10, __src, v15);
          uint64_t v10 = (void *)(g_CB_GDbg + v15);
          g_CB_GDbg = (uint64_t)v10;
          int v11 = qword_26AA2DC80;
          if ((unint64_t)v10 >= qword_26AA2DC80)
          {
            uint64_t v10 = (void *)qword_26AA2DC78;
            g_CB_GDbg = qword_26AA2DC78;
          }
          __src += v15;
          BOOL v9 = __OFSUB__(v2, v15);
          v2 -= v15;
        }
        while (!((v2 < 0) ^ v9 | (v2 == 0)));
      }
    }
    else
    {
      do
      {
        int v7 = v5 - v4;
        if (v2 >= v7) {
          int v8 = v7;
        }
        else {
          int v8 = v2;
        }
        memcpy(v4, __src, v8);
        uint64_t v4 = (void *)(g_CB_GDbg + v8);
        g_CB_GDbg = (uint64_t)v4;
        int v5 = qword_26AA2DC80;
        if ((unint64_t)v4 >= qword_26AA2DC80)
        {
          uint64_t v4 = (void *)qword_26AA2DC78;
          g_CB_GDbg = qword_26AA2DC78;
        }
        __src += v8;
        BOOL v9 = __OFSUB__(v2, v8);
        v2 -= v8;
      }
      while (!((v2 < 0) ^ v9 | (v2 == 0)));
    }
LABEL_12:
    GNB_Debug_Flush_Check();
  }
}

double BDS_EphInt2Real(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 12);
  *(_WORD *)(a2 + 16) = *(_WORD *)(a1 + 16);
  *(int32x2_t *)(a2 + 20) = vmul_s32(*(int32x2_t *)(a1 + 20), vdup_n_s32(0x12Cu));
  *(_DWORD *)(a2 + 28) = 300 * *(_DWORD *)(a1 + 28);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4.i64[0] = (int)v2;
  v4.i64[1] = SHIDWORD(v2);
  float64x2_t v5 = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_263D84FD0);
  v4.i64[0] = (int)v3;
  v4.i64[1] = SHIDWORD(v3);
  *(float64x2_t *)(a2 + 32) = v5;
  *(float64x2_t *)(a2 + 48) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_263D84FE0);
  int64x2_t v6 = *(int64x2_t *)(a1 + 48);
  *(void *)&v7.f64[0] = *(_OWORD *)&vcvtq_f64_s64(v6);
  v7.f64[1] = vcvtq_f64_u64(*(uint64x2_t *)&v6).f64[1];
  float64x2_t v8 = vmulq_f64(vcvtq_f64_s64(*(int64x2_t *)(a1 + 64)), (float64x2_t)vdupq_n_s64(0x3E0921FB54442D28uLL));
  *(float64x2_t *)(a2 + 64) = vmulq_f64(v7, (float64x2_t)xmmword_263D84FF0);
  *(float64x2_t *)(a2 + 80) = v8;
  v8.f64[0] = (double)*(int *)(a1 + 88) * 1.78578867e-13;
  *(double *)(a2 + 96) = (double)*(uint64_t *)(a1 + 80) * 7.3145904e-10;
  *(float64_t *)(a2 + 104) = v8.f64[0];
  v8.f64[0] = (double)*(__int16 *)(a1 + 94) * 9.31322575e-10;
  *(double *)(a2 + 112) = (double)*(__int16 *)(a1 + 92) * 1.78578867e-13;
  *(float64_t *)(a2 + 120) = v8.f64[0];
  *(double *)(a2 + 128) = (double)*(__int16 *)(a1 + 96) * 9.31322575e-10;
  v6.i64[0] = *(void *)(a1 + 100);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 136) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL));
  v6.i64[0] = *(void *)(a1 + 108);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 152) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)vdupq_n_s64(0x3E10000000000000uLL));
  v6.i64[0] = *(void *)(a1 + 116);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 168) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_263D85000);
  *(double *)(a2 + 184) = (double)*(__int16 *)(a1 + 124) * 1.35525272e-20;
  *(_WORD *)(a2 + 192) = *(_WORD *)(a1 + 126);
  *(_DWORD *)(a2 + 194) = *(_DWORD *)(a1 + 128);
  *(double *)(a2 + 200) = (double)*(__int16 *)(a1 + 132) * 5.82076609e-11;
  *(double *)v6.i64 = (double)*(__int16 *)(a1 + 134) * 5.82076609e-11;
  double v9 = (double)*(__int16 *)(a1 + 138);
  *(double *)(a2 + 216) = (double)*(__int16 *)(a1 + 136) * 5.82076609e-11;
  *(double *)(a2 + 224) = v9 * 5.82076609e-11;
  *(_DWORD *)(a2 + 232) = *(_DWORD *)(a1 + 140);
  *(unsigned char *)(a2 + 236) = *(unsigned char *)(a1 + 144);
  *(_WORD *)(a2 + 237) = *(_WORD *)(a1 + 145);
  double result = *(double *)v6.i64 + (double)*(char *)(a1 + 147) * 2.32830644e-10;
  *(double *)(a2 + 208) = result;
  return result;
}

_WORD *GPS_To_UTC_Time(_WORD *result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, unsigned __int16 *a7, __int16 a8, double a9, double a10)
{
  for (double i = 0.0005 - a10 + a9; i >= 604800.0; ++a8)
    double i = i + -604800.0;
  while (i < 0.0)
  {
    double i = i + 604800.0;
    --a8;
  }
  int v11 = (int)i;
  double v12 = (i - (double)(int)i) * 1000.0;
  int v13 = (int)v12;
  if (v12 < -2147483650.0) {
    LOWORD(v13) = 0;
  }
  if (v12 <= 2147483650.0) {
    unsigned __int16 v14 = v13;
  }
  else {
    unsigned __int16 v14 = -1;
  }
  *a7 = v14;
  int v15 = v11 / 86400;
  int v16 = v11 % 86400;
  *a4 = v16 / 3600;
  v16 %= 3600;
  *a5 = v16 / 60;
  *a6 = v16 % 60;
  int v17 = v15 - a8 + 8 * a8;
  signed int v18 = v17 + 6;
  if (v17 < 1456)
  {
    LOWORD(v20) = 1980;
  }
  else
  {
    if (v18 >= 2922) {
      signed int v18 = 2922;
    }
    unsigned int v19 = v17 - v18 + 1466;
    signed int v18 = v17 - 1461 * (v19 / 0x5B5) - 1455;
    unsigned int v20 = 4 * (v19 / 0x5B5) + 1984;
  }
  if (v18 >= 367)
  {
    do
    {
      if ((v20 & 3) != 0) {
        int v21 = -365;
      }
      else {
        int v21 = -366;
      }
      v18 += v21;
      LOWORD(v20) = v20 + 1;
    }
    while (v18 > 0x16E);
  }
  uint64_t v22 = 0;
  if ((v20 & 3) != 0) {
    __int16 v23 = v20 + 1;
  }
  else {
    __int16 v23 = v20;
  }
  if ((v20 & 3) != 0) {
    int v24 = 1;
  }
  else {
    int v24 = 366;
  }
  if (v18 == 366) {
    LOWORD(v20) = v23;
  }
  else {
    int v24 = v18;
  }
  *double result = v20;
  while (1)
  {
    int v25 = Days_in_Month[v22];
    BOOL v26 = __OFSUB__(v24, v25);
    int v27 = v24 - v25;
    if ((v27 < 0) ^ v26 | (v27 == 0))
    {
      *a3 = v24;
      unsigned __int16 v28 = v22 + 1;
      goto LABEL_40;
    }
    if (v22 == 1 && (v20 & 3) == 0) {
      break;
    }
LABEL_36:
    ++v22;
    int v24 = v27;
    if (v22 == 12) {
      return result;
    }
  }
  if (v27 >= 2)
  {
    --v27;
    goto LABEL_36;
  }
  *a3 = 29;
  unsigned __int16 v28 = 2;
LABEL_40:
  *a2 = v28;
  return result;
}

uint64_t GPS_To_UTC_DOY(int *a1, __int16 a2, double a3, double a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  *(_DWORD *)int v27 = 0;
  unsigned __int16 v26 = 0;
  uint64_t result = (uint64_t)GPS_To_UTC_Time(&v27[1], v27, &v26, &v25, &v24, &v23, &v22, a2, a3, a4);
  HIDWORD(v7) = -1030792151 * v27[1];
  LODWORD(v7) = HIDWORD(v7);
  unsigned int v6 = v7 >> 2;
  LODWORD(v7) = HIDWORD(v7);
  if ((v7 >> 4) < 0xA3D70B || v6 > 0x28F5C28) {
    int v9 = 32;
  }
  else {
    int v9 = 31;
  }
  if ((v27[1] & 3) != 0) {
    int v10 = 31;
  }
  else {
    int v10 = v9;
  }
  if (v27[0] - 13 >= 0xFFFFFFF4)
  {
    int v12 = 0;
    int v13 = 31;
    int v14 = 28;
    int v15 = 59;
    int v16 = 89;
    int v17 = 120;
    int v18 = 150;
    uint64_t result = 181;
    uint64_t v19 = 212;
    uint64_t v20 = 242;
    uint64_t v21 = 273;
    switch(v27[0])
    {
      case 1u:
        goto LABEL_24;
      case 2u:
        goto LABEL_23;
      case 3u:
        goto LABEL_22;
      case 4u:
        goto LABEL_21;
      case 5u:
        goto LABEL_20;
      case 6u:
        goto LABEL_19;
      case 7u:
        goto LABEL_18;
      case 8u:
        goto LABEL_17;
      case 9u:
        goto LABEL_16;
      case 0xAu:
        goto LABEL_15;
      case 0xBu:
        goto LABEL_14;
      case 0xCu:
        uint64_t v21 = 303;
LABEL_14:
        uint64_t v20 = v21;
LABEL_15:
        uint64_t v19 = v20;
LABEL_16:
        uint64_t result = v19;
LABEL_17:
        int v18 = result;
LABEL_18:
        int v17 = v18;
LABEL_19:
        int v16 = v17;
LABEL_20:
        int v15 = v16;
LABEL_21:
        int v14 = v15;
LABEL_22:
        int v13 = v14 + v10;
LABEL_23:
        int v12 = v13;
LABEL_24:
        int v11 = v12 + v26;
        break;
      default:
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    int v11 = -1;
  }
  *a1 = v11;
  return result;
}

char **ds_NK_Crude_Apx_Pos(char **result, uint64_t a2, uint64_t a3)
{
  int64x2_t v4 = result;
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3 + 68224;
  if (*(unsigned __int8 *)(a3 + 68305) <= 2u && !*(unsigned char *)(a3 + 68304)) {
    return result;
  }
  int v6 = (int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26) - *(_DWORD *)(a3 + 272);
  unsigned int v7 = v6 >= 0
     ? (int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26) - *(_DWORD *)(a3 + 272)
     : *(_DWORD *)(a3 + 272) - ((int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26));
  if (*(unsigned char *)(a2 + 1864) && v7 >= 0xA && !*(unsigned char *)(a3 + 68304)) {
    return result;
  }
  float64x2_t v8 = (unsigned __int8 *)(a3 + 20104);
  int v9 = *result;
  if (g_Logging_Cfg >= 4)
  {
    uint64_t v10 = 0;
    char v11 = 67;
    do
    {
      *uint64_t result = v9 + 1;
      *int v9 = v11;
      int v9 = *result;
      if (*result >= result[3])
      {
        int v9 = result[2];
        *uint64_t result = v9;
      }
      char v11 = aCapSrch[++v10];
    }
    while (v10 != 8);
    sprintf_5d(result, gDebug);
    sprintf_5d(v4, DWORD1(gDebug));
    sprintf_5d(v4, xmmword_26A9CC288);
    sprintf_5d(v4, DWORD1(xmmword_26A9CC288));
    sprintf_5d(v4, DWORD2(xmmword_26A9CC288));
    uint64_t v12 = 0;
    int v13 = *v4;
    char v14 = 32;
    do
    {
      void *v4 = v13 + 1;
      *int v13 = v14;
      int v13 = *v4;
      if (*v4 >= v4[3])
      {
        int v13 = v4[2];
        void *v4 = v13;
      }
      char v14 = aEll[++v12];
    }
    while (v12 != 4);
    sprintf_7f((uint64_t)v4, (int)(*(double *)&xmmword_26A9CC260 * 180.0 * 100.0 / 3.14159265), 3);
    sprintf_7f((uint64_t)v4, (int)(*((double *)&xmmword_26A9CC260 + 1) * 180.0 * 100.0 / 3.14159265), 3);
    sprintf_7d(v4, (int)(*(double *)&xmmword_26A9CC248 / 1000.0));
    sprintf_7d(v4, (int)(*((double *)&xmmword_26A9CC248 + 1) / 1000.0));
    sprintf_4d(v4, (int)*(double *)&qword_26A9CC258);
    uint64_t v15 = 0;
    int v16 = *v4;
    char v17 = 32;
    do
    {
      void *v4 = v16 + 1;
      *int v16 = v17;
      int v16 = *v4;
      if (*v4 >= v4[3])
      {
        int v16 = v4[2];
        void *v4 = v16;
      }
      char v17 = aLsq[++v15];
    }
    while (v15 != 4);
    sprintf_2d(v4, dword_26A9CC274);
    sprintf_2d(v4, dword_26A9CC270);
    sprintf_2d(v4, byte_26A9CC285);
    sprintf_2d(v4, byte_26A9CC286);
    int v18 = *v4;
    char v19 = 32;
    uint64_t v20 = 1u;
    do
    {
      void *v4 = v18 + 1;
      char *v18 = v19;
      int v18 = *v4;
      if (*v4 >= v4[3])
      {
        int v18 = v4[2];
        void *v4 = v18;
      }
      char v19 = aIter[v20++];
    }
    while (v20 != 6);
    sprintf_3d(v4, byte_26A9CC278);
    sprintf_3d(v4, byte_26A9CC279);
    sprintf_3d(v4, byte_26A9CC27A);
    uint64_t v21 = *v4;
    char v22 = 32;
    uint64_t v23 = 1u;
    do
    {
      void *v4 = v21 + 1;
      char *v21 = v22;
      uint64_t v21 = *v4;
      if (*v4 >= v4[3])
      {
        uint64_t v21 = v4[2];
        void *v4 = v21;
      }
      char v22 = aSrchprls[v23++];
    }
    while (v23 != 10);
    sprintf_2d(v4, byte_26A9CC27B);
    sprintf_4d(v4, byte_26A9CC27C);
    sprintf_2d(v4, byte_26A9CC284);
    unsigned __int16 v24 = (*v4)++;
    char *v24 = 32;
    if (*v4 >= v4[3]) {
      void *v4 = v4[2];
    }
    if (dword_26A9CC280 >= 0) {
      unsigned int v25 = dword_26A9CC280;
    }
    else {
      unsigned int v25 = -dword_26A9CC280;
    }
    sprintf1da(v4, v25, v89, 0, dword_26A9CC280 >> 31);
    unsigned __int16 v26 = (*v4)++;
    char *v26 = 10;
    int v27 = *v4;
    if (*v4 >= v4[3]) {
      int v27 = v4[2];
    }
    char v28 = 67;
    uint64_t v29 = 1u;
    do
    {
      void *v4 = v27 + 1;
      *int v27 = v28;
      int v27 = *v4;
      if (*v4 >= v4[3])
      {
        int v27 = v4[2];
        void *v4 = v27;
      }
      char v28 = aCapVv[v29++];
    }
    while (v29 != 7);
    int v30 = dword_26A9CC298;
    if (dword_26A9CC298 >= 9999) {
      int v30 = 9999;
    }
    if (v30 <= -9999) {
      unsigned int v31 = -9999;
    }
    else {
      unsigned int v31 = v30;
    }
    sprintf_5d(v4, v31);
    int v32 = dword_26A9CC2A0;
    if (dword_26A9CC2A0 >= 9999) {
      int v32 = 9999;
    }
    if (v32 <= -9999) {
      unsigned int v33 = -9999;
    }
    else {
      unsigned int v33 = v32;
    }
    sprintf_5d(v4, v33);
    BOOL v34 = *v4;
    char v35 = 32;
    uint64_t v36 = 1u;
    do
    {
      void *v4 = v34 + 1;
      *BOOL v34 = v35;
      BOOL v34 = *v4;
      if (*v4 >= v4[3])
      {
        BOOL v34 = v4[2];
        void *v4 = v34;
      }
      char v35 = aHv[v36++];
    }
    while (v36 != 4);
    int v37 = HIDWORD(xmmword_26A9CC288);
    if (SHIDWORD(xmmword_26A9CC288) >= 9999) {
      int v37 = 9999;
    }
    if (v37 <= -9999) {
      unsigned int v38 = -9999;
    }
    else {
      unsigned int v38 = v37;
    }
    sprintf_5d(v4, v38);
    int v39 = dword_26A9CC29C;
    if (dword_26A9CC29C >= 9999) {
      int v39 = 9999;
    }
    if (v39 <= -9999) {
      unsigned int v40 = -9999;
    }
    else {
      unsigned int v40 = v39;
    }
    sprintf_5d(v4, v40);
    uint64_t v41 = 0;
    int v42 = *v4;
    char v43 = 32;
    do
    {
      void *v4 = v42 + 1;
      *int v42 = v43;
      int v42 = *v4;
      if (*v4 >= v4[3])
      {
        int v42 = v4[2];
        void *v4 = v42;
      }
      char v43 = aA_0[++v41];
    }
    while (v41 != 2);
    int v44 = dword_26A9CC2A4;
    if (dword_26A9CC2A4 >= 9999) {
      int v44 = 9999;
    }
    if (v44 <= -9999) {
      unsigned int v45 = -9999;
    }
    else {
      unsigned int v45 = v44;
    }
    sprintf_5d(v4, v45);
    int v46 = *v4;
    char v47 = 32;
    uint64_t v48 = 1u;
    do
    {
      void *v4 = v46 + 1;
      char *v46 = v47;
      int v46 = *v4;
      if (*v4 >= v4[3])
      {
        int v46 = v4[2];
        void *v4 = v46;
      }
      char v47 = aR2[v48++];
    }
    while (v48 != 4);
    int v49 = dword_26A9CC240;
    if (dword_26A9CC240 >= 9999) {
      int v49 = 9999;
    }
    if (v49 <= -9999) {
      unsigned int v50 = -9999;
    }
    else {
      unsigned int v50 = v49;
    }
    sprintf_5d(v4, v50);
    char v51 = (*v4)++;
    *char v51 = 10;
    if (*v4 >= v4[3]) {
      void *v4 = v4[2];
    }
    xmmword_26A9CC288 = 0u;
    *(_OWORD *)&dword_26A9CC298 = 0u;
    *(long long *)((char *)&xmmword_26A9CC260 + 8) = 0u;
    *(_OWORD *)&byte_26A9CC278 = 0u;
    xmmword_26A9CC248 = 0u;
    *(_OWORD *)&qword_26A9CC258 = 0u;
    gDebug = 0u;
    *(_OWORD *)algn_26A9CC238 = 0u;
    int v9 = *v4;
    if (g_Logging_Cfg >= 4)
    {
      char v52 = 67;
      uint64_t v53 = 1u;
      do
      {
        void *v4 = v9 + 1;
        *int v9 = v52;
        int v9 = *v4;
        if (*v4 >= v4[3])
        {
          int v9 = v4[2];
          void *v4 = v9;
        }
        char v52 = aCapSv[v53++];
      }
      while (v53 != 7);
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 84));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 85));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 86));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 87));
      unsigned int v54 = (*v4)++;
      *unsigned int v54 = 32;
      unsigned int v55 = *v4;
      if (*v4 >= v4[3]) {
        unsigned int v55 = v4[2];
      }
      void *v4 = v55 + 1;
      char *v55 = 10;
      int v9 = *v4;
      if (*v4 >= v4[3]) {
        int v9 = v4[2];
      }
    }
  }
  uint64_t v56 = 0;
  char v57 = 67;
  do
  {
    void *v4 = v9 + 1;
    *int v9 = v57;
    int v9 = *v4;
    if (*v4 >= v4[3])
    {
      int v9 = v4[2];
      void *v4 = v9;
    }
    char v57 = aCap[++v56];
  }
  while (v56 != 4);
  char v58 = "pass";
  if (!*(unsigned char *)(v5 + 96)) {
    char v58 = "fail";
  }
  char v59 = *v58;
  if (*v58)
  {
    uint64_t v60 = (unsigned __int8 *)(v58 + 1);
    do
    {
      void *v4 = v9 + 1;
      *int v9 = v59;
      int v9 = *v4;
      if (*v4 >= v4[3])
      {
        int v9 = v4[2];
        void *v4 = v9;
      }
      int v61 = *v60++;
      char v59 = v61;
    }
    while (v61);
  }
  uint64_t v62 = 0;
  char v63 = 32;
  do
  {
    void *v4 = v9 + 1;
    *int v9 = v63;
    int v9 = *v4;
    if (*v4 >= v4[3])
    {
      int v9 = v4[2];
      void *v4 = v9;
    }
    char v63 = aSv_0[++v62];
  }
  while (v62 != 4);
  sprintf_3d(v4, *(unsigned __int8 *)(v5 + 81));
  uint64_t v64 = *v4;
  char v65 = 32;
  uint64_t v66 = 1u;
  do
  {
    void *v4 = v64 + 1;
    char *v64 = v65;
    uint64_t v64 = *v4;
    if (*v4 >= v4[3])
    {
      uint64_t v64 = v4[2];
      void *v4 = v64;
    }
    char v65 = aMs[v66++];
  }
  while (v66 != 6);
  sprintf_5d(v4, *(unsigned __int16 *)(v5 + 82));
  int v68 = *(_DWORD *)(v5 + 88);
  int v67 = *(_DWORD *)(v5 + 92);
  if (*(void *)(v5 + 88))
  {
    unsigned int v69 = (5729 * v68) >> 15;
    unsigned int v70 = (5729 * v67) >> 15;
    long double v71 = (double)v67 * 0.0000305175781 - *(double *)v5;
    double v72 = *(double *)(v5 + 48);
    __double2 v73 = __sincos_stret((double)v68 * 0.0000305175781);
    double v74 = v73.__cosval * *(double *)(v5 + 56);
    long double v75 = cos(v71) * v74 + v72 * v73.__sinval;
    if (fabs(v75) < 1.0)
    {
      signed int v76 = (int)(acos(v75) * 6378.137);
      goto LABEL_118;
    }
  }
  else
  {
    unsigned int v69 = 0;
    unsigned int v70 = 0;
  }
  signed int v76 = 0;
LABEL_118:
  sprintf_7f((uint64_t)v4, v69, 3);
  sprintf_7f((uint64_t)v4, v70, 3);
  sprintf_6d(v4, v76);
  long long v77 = *v4;
  for (unsigned int i = 5; i > 1; --i)
  {
    void *v4 = v77 + 1;
    *long long v77 = 32;
    long long v77 = *v4;
    if (*v4 >= v4[3])
    {
      long long v77 = v4[2];
      void *v4 = v77;
    }
  }
  if (*(int *)(a2 + 20) >= 4 && (unsigned int v79 = *(unsigned __int8 *)(v5 + 81), v79 >= 3))
  {
    uint64_t v81 = "BAD ";
    if (v76 < 151) {
      uint64_t v81 = "GOOD";
    }
    uint64_t v82 = "bad ";
    if (v76 < 901) {
      uint64_t v82 = "good";
    }
    if (v79 == 3) {
      long long v80 = v82;
    }
    else {
      long long v80 = v81;
    }
    if (!*(unsigned char *)(v5 + 96)) {
      long long v80 = "FAIL";
    }
  }
  else
  {
    long long v80 = "SKIP";
  }
  char v83 = *v80;
  if (*v80)
  {
    uint64_t v84 = (unsigned __int8 *)(v80 + 1);
    do
    {
      void *v4 = v77 + 1;
      *long long v77 = v83;
      long long v77 = *v4;
      if (*v4 >= v4[3])
      {
        long long v77 = v4[2];
        void *v4 = v77;
      }
      int v85 = *v84++;
      char v83 = v85;
    }
    while (v85);
  }
  if (v6 >= 99) {
    int v86 = 99;
  }
  else {
    int v86 = v6;
  }
  if (v86 <= -99) {
    unsigned int v87 = -99;
  }
  else {
    unsigned int v87 = v86;
  }
  sprintf_5d(v4, v87);
  sprintf_3d(v4, *v8);
  uint64_t result = (char **)sprintf1da(v4, v8[1], v89, 0, 0);
  int v88 = (*v4)++;
  *int v88 = 10;
  if (*v4 >= v4[3]) {
    void *v4 = v4[2];
  }
  return result;
}

void WGS84_ECEF2Geo(long double *a1, double *a2)
{
  long double v4 = *a1;
  double v3 = a1[1];
  double v5 = a1[2];
  double v6 = v3 * v3 + v4 * v4;
  double v7 = v5 * v5 * 2.45817226e-14;
  int v9 = 3;
  double v10 = 0.00669437999;
  do
  {
    double v8 = v7 * 0.99330562;
    double v10 = v10
        - (v10 * -0.0000896294469
         + v10 * v10 * (v6 * 2.45817226e-14 + v7 * 0.99330562 + -0.0000448147235 + (v8 + v8) * v10 + v8 * (v10 * v10))
         + -0.0000448147235)
        / ((v6 * 2.45817226e-14
          + v7 * 0.99330562
          + -0.0000448147235
          + v6 * 2.45817226e-14
          + v7 * 0.99330562
          + -0.0000448147235)
         * v10
         + v7 * 0.99330562 * 4.0 * (v10 * v10) * ((v8 + v8) * 3.0 + v10)
         + -0.0000896294469);
    --v9;
  }
  while (v9);
  double v11 = v10 + 1.0;
  if (fabs(v4) >= 0.001 || fabs(v3) >= 0.001)
  {
    a2[1] = atan2(v3, v4);
  }
  else
  {
    a2[1] = 0.0;
    double v12 = 0.0;
    if (fabs(v5) < 0.001) {
      goto LABEL_9;
    }
  }
  double v12 = atan2(v5 * v11, sqrt(v6));
LABEL_9:
  *a2 = v12;
  a2[2] = (v10 * -148.379032 + 1.0) * sqrt(v7 + v6 * 2.45817226e-14 / (v11 * v11)) * 6378137.0;
}

uint64_t GncP11_01ConvertGnssID(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v3 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GNSSId,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNC", 87, "GncP11_01ConvertGnssID", 770, 0);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      uint64_t result = 0;
      break;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GncP11_05ConvertGnssSignalID(uint64_t a1)
{
  uint64_t result = 17;
  if ((int)a1 > 64)
  {
    if ((int)a1 > 81)
    {
      if (a1 == 98) {
        int v4 = 114;
      }
      else {
        int v4 = 17;
      }
      if (a1 == 97) {
        unsigned int v5 = 113;
      }
      else {
        unsigned int v5 = v4;
      }
      if (a1 == 83) {
        int v6 = 99;
      }
      else {
        int v6 = 17;
      }
      if (a1 == 82) {
        unsigned int v7 = 98;
      }
      else {
        unsigned int v7 = v6;
      }
      if ((int)a1 <= 96) {
        return v7;
      }
      else {
        return v5;
      }
    }
    else
    {
      switch((int)a1)
      {
        case 'A':
          uint64_t result = 81;
          break;
        case 'B':
          uint64_t result = 82;
          break;
        case 'C':
          uint64_t result = 83;
          break;
        case 'D':
          uint64_t result = 84;
          break;
        default:
          BOOL v8 = a1 == 81;
          LODWORD(a1) = 97;
LABEL_33:
          if (v8) {
            uint64_t result = a1;
          }
          else {
            uint64_t result = 17;
          }
          break;
      }
    }
  }
  else if ((int)a1 <= 19)
  {
    if (a1 == 19) {
      unsigned int v3 = 19;
    }
    else {
      unsigned int v3 = 17;
    }
    if (a1 == 18) {
      unsigned int v3 = 18;
    }
    if (a1) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    switch((int)a1)
    {
      case '!':
      case '""':
      case '#':
      case '$':
      case '1':
      case '2':
      case '3':
      case '4':
        uint64_t result = a1;
        break;
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
      case '0':
        return result;
      default:
        BOOL v8 = a1 == 20;
        goto LABEL_33;
    }
  }
  return result;
}

uint64_t GncP11_23ConvertUsrState(unsigned int a1)
{
  unsigned int v1 = a1;
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 6)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UsrState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_23ConvertUsrState", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t GncP11_24ConvertGnssContent(unsigned int a1)
{
  unsigned int v1 = a1;
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 5)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnssCntnt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_24ConvertGnssContent", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t GncP11_25ConvertReliab(unsigned int a1)
{
  unsigned int v1 = a1;
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 5)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Reliab,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_25ConvertReliab", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

BOOL GncP11_30CheckUtcValidity(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  uint64_t v7 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 && a4 <= 0x17 && a5 <= 0x3B && a6 <= 0x3C && a7 <= 0x3E7)
  {
    if (a2 <= 0xC)
    {
      if (((1 << a2) & 0x15AA) != 0) {
        return a3 <= 0x1F;
      }
      if (((1 << a2) & 0xA50) != 0) {
        return a3 <= 0x1E;
      }
      if (a2 == 2)
      {
        if ((a1 & 3) == 0
          && ((HIDWORD(v9) = -1030792151 * a1, LODWORD(v9) = -1030792151 * a1, (v9 >> 2) > 0x28F5C28)
           || a1 == 400 * ((10737419 * (unint64_t)a1) >> 32)))
        {
          if (a3 > 0x1D) {
            return 0;
          }
        }
        else if (a3 > 0x1C)
        {
          return 0;
        }
        return 1;
      }
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v10 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Month,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "GNC", 87, "GncP11_30CheckUtcValidity", 770, a2);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    return 0;
  }
  return v7;
}

uint64_t GncP11_32ConvertEstimatedTech(unsigned int a1)
{
  unsigned int v1 = a1;
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 4)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EstimTech,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_32ConvertEstimatedTech", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

double GLON_RealAlm2RefState(__int16 a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(_OWORD *)(a5 + 175) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  if (a3 >= 1) {
    int v10 = -1;
  }
  else {
    int v10 = 86399;
  }
  *(_OWORD *)(a5 + 80) = 0uLL;
  *(_OWORD *)(a5 + 96) = 0uLL;
  *(_OWORD *)(a5 + 48) = 0uLL;
  *(_OWORD *)(a5 + 64) = 0uLL;
  *(_OWORD *)(a5 + 32) = 0uLL;
  *(_OWORD *)a5 = 0uLL;
  *(_OWORD *)(a5 + 16) = 0uLL;
  GLON_RealAlm2ECEF((uint64_t)v18, (uint64_t)&v16, (double *)a4, v10 + a3, (__int16)(a2 - (a3 < 1)));
  GLON_RealAlm2ECEF(a5, a5 + 24, (double *)a4, a3, a2);
  *(float64x2_t *)(a5 + 48) = vsubq_f64(*(float64x2_t *)(a5 + 24), v16);
  *(double *)(a5 + 64) = *(double *)(a5 + 40) - v17;
  *(double *)(a5 + 96) = -*(double *)(a4 + 72);
  *(void *)(a5 + 104) = 0;
  *(_DWORD *)(a5 + 168) = a3;
  *(_WORD *)(a5 + 172) = a2;
  *(_WORD *)(a5 + 174) = a1;
  *(_DWORD *)(a5 + 176) = 2;
  *(_DWORD *)(a5 + 180) = *(_DWORD *)(a4 + 4);
  *(_WORD *)(a5 + 166) = 123;
  *(unsigned char *)(a5 + 188) = *(unsigned char *)(a4 + 10);
  *(_DWORD *)(a5 + 184) = 2;
  int v11 = a2 - *(unsigned __int16 *)(a4 + 8);
  int v12 = v11 + 1461;
  if (v11 >= -730) {
    int v12 = a2 - *(unsigned __int16 *)(a4 + 8);
  }
  if (v11 <= 730) {
    int v13 = v12;
  }
  else {
    int v13 = v11 - 1461;
  }
  if (v13 < 0) {
    int v13 = -v13;
  }
  if (v13 >= 0x281) {
    int v14 = 65500;
  }
  else {
    int v14 = 100 * v13 + 1500;
  }
  double result = (double)(v14 * v14);
  *(double *)(a5 + 112) = result;
  return result;
}

void DD_Assist_GPS_Data(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v6 = 0;
  uint64_t v113 = *MEMORY[0x263EF8340];
  uint64_t v98 = a1 + 224;
  uint64_t v96 = a1 + 192;
  int v97 = a2 - 241;
  do
  {
    if (*(unsigned char *)(*(void *)(a3 + 64) + v6)
      && *(int *)(a3 + 116 * v6 + 124) >= 6
      && (v97 - *(_DWORD *)(a3 + 116 * v6 + 120)) > 0xFFFFF806)
    {
      goto LABEL_39;
    }
    long long v111 = 0u;
    memset(v112, 0, 19);
    long long v109 = 0u;
    long long v110 = 0u;
    memset(v108, 0, sizeof(v108));
    long long v107 = 0u;
    if (!Core_Get_GPS_Eph((v6 + 1), v5, (int *)&v107)) {
      goto LABEL_39;
    }
    uint64_t v7 = *(void *)(a3 + 64);
    if (*(unsigned char *)(v7 + v6))
    {
      int v8 = *(_DWORD *)(a3 + 116 * v6 + 124);
      if (SDWORD1(v107) <= v8)
      {
        int v9 = *(_DWORD *)(a3 + 116 * v6 + 120);
        BOOL v10 = (int)v107 > v9 && DWORD1(v107) == v8;
        if (!v10 && (int)v5 - v9 > -1801) {
          goto LABEL_39;
        }
      }
    }
    uint64_t v11 = v5;
    unint64_t v12 = DWORD2(v107);
    int v13 = v112[12];
    BOOL v14 = v112[12] == 0;
    if (*(unsigned char *)(v7 + v6))
    {
      uint64_t v15 = a3 + 116 * v6;
      int v17 = *(_DWORD *)(v15 + 120);
      float64x2_t v16 = (_DWORD *)(v15 + 120);
      if ((int)v107 - v17 <= 10799)
      {
        BOOL v18 = v112[12] == 0;
        uint64_t v19 = *(void *)(a3 + 64);
        BOOL v20 = Is_GPS_BinEph_Real((uint64_t)v16);
        uint64_t v7 = v19;
        BOOL v14 = v18;
        if (v20)
        {
          BOOL v21 = Is_GPS_BinEph_Real((uint64_t)&v107);
          uint64_t v7 = v19;
          BOOL v14 = v18;
          if (!v21)
          {
            uint64_t v5 = v11;
            *float64x2_t v16 = v11;
            goto LABEL_39;
          }
        }
      }
    }
    unint64_t v22 = 0xE4FE7F3uLL >> ((v12 >> 2) & 0x1F);
    int v23 = v22 & 1;
    unsigned __int16 v24 = *(_OWORD **)a3;
    if (*(unsigned char *)(*(void *)a3 + v6) || !(v22 & 1 | (v13 == 0)))
    {
      uint64_t v5 = v11;
    }
    else
    {
      uint64_t v25 = *(void *)(a3 + 80);
      uint64_t v5 = v11;
      if (*(unsigned char *)(v25 + v6))
      {
        uint64_t v26 = a3 + 44 * v6;
        unint64_t v27 = 0xE4FE7F3uLL >> (*(_DWORD *)(v26 + 7564) & 0x1F);
        int v28 = *(_DWORD *)(v26 + 7544);
        unsigned __int8 v29 = v6 + 1;
        if ((v27 & 1) != 0 || v28 + 3600 <= (int)v11)
        {
          if (v28 + 100 < (int)v11)
          {
            *(unsigned char *)(*(void *)(a3 + 40) + v6) = 0;
            *(unsigned char *)(v25 + v6) = 0;
            *(unsigned char *)(v96 + v6) = -1;
            uint64_t v7 = *(void *)(a3 + 64);
            unsigned __int16 v24 = *(_OWORD **)a3;
          }
        }
        else
        {
          int v23 = 0;
          BOOL v14 = 0;
        }
        goto LABEL_25;
      }
    }
    unsigned __int8 v29 = v6 + 1;
LABEL_25:
    long long v30 = v111;
    uint64_t v31 = a3 + 116 * v6;
    *(_OWORD *)(v31 + 184) = v110;
    *(_OWORD *)(v31 + 200) = v30;
    *(_OWORD *)(v31 + 216) = *(_OWORD *)v112;
    long long v32 = v108[0];
    *(_OWORD *)(v31 + 120) = v107;
    *(_OWORD *)(v31 + 136) = v32;
    long long v33 = v109;
    *(_OWORD *)(v31 + 152) = v108[1];
    *(_DWORD *)(v31 + 232) = *(_DWORD *)&v112[16];
    *(_OWORD *)(v31 + 168) = v33;
    *(unsigned char *)(*(void *)(a3 + 32) + v6) = 1;
    *(unsigned char *)(v7 + v6) = 1;
    *((unsigned char *)v24 + v6) = v23;
    if (v23) {
      int v34 = 1;
    }
    else {
      int v34 = 2;
    }
    uint64_t v35 = *(void *)(a3 + 16);
    if (*(_DWORD *)(v31 + 124) == 5)
    {
      *(_DWORD *)(v35 + 20 * v6 + 8) = v34;
      *(unsigned char *)(*(void *)(a3 + 8) + v6) = v14;
      if (v14) {
        int v36 = 1;
      }
      else {
        int v36 = 2;
      }
      *(_DWORD *)(*(void *)(a3 + 24) + 20 * v6 + 8) = v36;
    }
    else
    {
      *(_DWORD *)(v35 + 20 * v6 + 12) = v34;
    }
    if ((int)v5 >= 1)
    {
      *(unsigned char *)(*(void *)(a3 + 88) + v6) = 1;
      Core_Save_GPS_Eph(v29, 0, (long long *)(v31 + 120));
      unsigned __int16 v24 = *(_OWORD **)a3;
    }
    uint64_t v37 = 0;
    LODWORD(v38) = 0;
    uint64_t v39 = p_NV;
    long long v40 = v24[1];
    *(_OWORD *)(p_NV + 100) = *v24;
    *(_OWORD *)(v39 + 116) = v40;
    uint64_t v41 = v39 + 96;
    __int16 v42 = -9871;
    do
    {
      int v43 = *(unsigned __int8 *)(v41 + v37) ^ HIBYTE(v42);
      __int16 v42 = -12691 * (v42 + (*(unsigned __int8 *)(v41 + v37) ^ HIBYTE(v42))) + 22719;
      uint64_t v38 = (v38 + v43);
      ++v37;
    }
    while (v37 != 40);
    *(void *)(v39 + 88) = v38;
    uint64_t v44 = a1 + 6 * v6;
    *(_DWORD *)uint64_t v44 = 16777472;
    *(_WORD *)(v44 + 4) = 256;
    *(_WORD *)(v98 + 2 * v6) = 256;
LABEL_39:
    ++v6;
  }
  while (v6 != 32);
  uint64_t v45 = a4;
  if ((int)v5 >= 1)
  {
    for (uint64_t i = 0; i != 32; ++i)
    {
      if (*(unsigned char *)(*(void *)a3 + i)
        && !*(unsigned char *)(*(void *)(v45 + 1600) + i)
        && (!*(unsigned char *)(*(void *)(a3 + 72) + i) || (int)v5 - *(_DWORD *)(a3 + 116 * i + 3832) >= 241))
      {
        long long v111 = 0u;
        memset(v112, 0, 19);
        long long v109 = 0u;
        long long v110 = 0u;
        memset(v108, 0, sizeof(v108));
        long long v107 = 0u;
        int GPS_BinEph = EE_Get_GPS_BinEph((XofSvcsIf *)(i + 1), v5, (uint64_t)&v107);
        uint64_t v48 = *(void *)(a3 + 72);
        if (!GPS_BinEph || (int v49 = v107, *(unsigned char *)(v48 + i)) && (int)v107 <= *(_DWORD *)(a3 + 116 * i + 3832))
        {
          *(unsigned char *)(v48 + i) = 0;
        }
        else
        {
          uint64_t v50 = a3 + 116 * i;
          *(_DWORD *)(v50 + 3944) = *(_DWORD *)&v112[16];
          long long v51 = v108[0];
          *(_OWORD *)(v50 + 3832) = v107;
          *(_OWORD *)(v50 + 3848) = v51;
          long long v52 = v109;
          *(_OWORD *)(v50 + 3864) = v108[1];
          *(_OWORD *)(v50 + 3880) = v52;
          long long v53 = *(_OWORD *)v112;
          long long v54 = v110;
          *(_OWORD *)(v50 + 3912) = v111;
          *(_OWORD *)(v50 + 3928) = v53;
          *(_OWORD *)(v50 + 3896) = v54;
          *(unsigned char *)(*(void *)(a3 + 32) + i) = 1;
          *(unsigned char *)(v48 + i) = 1;
          uint64_t v55 = a1 + 6 * i;
          *(_DWORD *)uint64_t v55 = 16777472;
          *(_WORD *)(v55 + 4) = 256;
          *(_WORD *)(v98 + 2 * i) = 256;
          long long v103 = 0u;
          *(_OWORD *)long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          v100[0] = v49;
          v100[1] = DWORD1(v107);
          LOBYTE(v101) = BYTE8(v107);
          unsigned int v56 = 21;
          uint64_t v57 = 11;
          char v58 = (char *)v108 + 8;
          *(_WORD *)((char *)&v101 + 1) = *(_WORD *)((char *)&v107 + 9);
          do
          {
            char v59 = (char *)v100 + v57;
            *char v59 = *v58;
            *(_WORD *)(v59 + 1) = *(_WORD *)(v58 + 1);
            v58 += 4;
            --v56;
            v57 += 3;
          }
          while (v56 > 1);
          *(_WORD *)&v104[15] = *(_WORD *)&v112[12];
          int v105 = *(_DWORD *)&v112[14];
          char v106 = v112[18];
          Debug_Log_GPS_Eph(2, i + 1, (uint64_t)v100);
        }
        uint64_t v45 = a4;
      }
    }
  }
  uint64_t v60 = 0;
  long long v107 = 0u;
  memset(v108, 0, 28);
  while (2)
  {
    if (!*(unsigned char *)(*(void *)(a3 + 80) + v60) || (int)v5 - *(_DWORD *)(a3 + 44 * v60 + 7544) >= 1801)
    {
      *(_OWORD *)((unint64_t)&v107 | 0xC) = 0u;
      *(_OWORD *)(((unint64_t)&v107 | 0xC) + 0x10) = 0u;
      if (Core_Get_GPS_Alm((v60 + 1), v5, (uint64_t)&v107))
      {
        uint64_t v61 = *(void *)(a3 + 80);
        if (!*(unsigned char *)(v61 + v60) || (int)v107 > *(_DWORD *)(a3 + 44 * v60 + 7544))
        {
          unint64_t v62 = (0xE4FE7F3uLL >> (BYTE4(v108[0]) & 0x1F)) & 1;
          char v63 = *(_OWORD **)a3;
          if (*(unsigned char *)(*(void *)a3 + v60)) {
            BOOL v64 = 1;
          }
          else {
            BOOL v64 = v62 == 0;
          }
          if (!v64)
          {
            uint64_t v65 = *(void *)(a3 + 64);
            if (*(unsigned char *)(v65 + v60))
            {
              uint64_t v66 = a3 + 116 * v60;
              unint64_t v67 = 0xE4FE7F3uLL >> (((unint64_t)*(unsigned int *)(v66 + 128) >> 2) & 0x1F);
              int v68 = *(_DWORD *)(v66 + 120);
              if ((v67 & 1) == 0 && v68 + 3600 > (int)v5)
              {
                LOBYTE(v62) = 0;
                goto LABEL_76;
              }
              if (v68 + 100 < (int)v5)
              {
                *(unsigned char *)(*(void *)(a3 + 32) + v60) = 0;
                *(unsigned char *)(v65 + v60) = 0;
                uint64_t v69 = a1 + 6 * v60;
                *(_DWORD *)uint64_t v69 = 16777472;
                *(_WORD *)(v69 + 4) = 256;
                *(_WORD *)(v98 + 2 * v60) = 256;
              }
            }
            LOBYTE(v62) = 1;
          }
LABEL_76:
          unsigned int v70 = (long long *)(a3 + 44 * v60 + 7544);
          long long v71 = v108[0];
          *unsigned int v70 = v107;
          v70[1] = v71;
          *(long long *)((char *)v70 + 28) = *(_OWORD *)((char *)v108 + 12);
          *(unsigned char *)(*(void *)(a3 + 40) + v60) = 1;
          *(unsigned char *)(v61 + v60) = 1;
          *((unsigned char *)v63 + v60) = v62;
          if ((int)v5 >= 1)
          {
            Core_Save_GPS_Alm((v60 + 1), 0, v70);
            char v63 = *(_OWORD **)a3;
          }
          uint64_t v72 = 0;
          LODWORD(v73) = 0;
          uint64_t v74 = p_NV;
          long long v75 = v63[1];
          *(_OWORD *)(p_NV + 100) = *v63;
          *(_OWORD *)(v74 + 116) = v75;
          uint64_t v76 = v74 + 96;
          __int16 v77 = -9871;
          do
          {
            int v78 = *(unsigned __int8 *)(v76 + v72) ^ HIBYTE(v77);
            __int16 v77 = -12691 * (v77 + (*(unsigned __int8 *)(v76 + v72) ^ HIBYTE(v77))) + 22719;
            uint64_t v73 = (v73 + v78);
            ++v72;
          }
          while (v72 != 40);
          *(void *)(v74 + 88) = v73;
          *(unsigned char *)(v96 + v60) = -1;
        }
      }
    }
    if (++v60 != 32) {
      continue;
    }
    break;
  }
  long long v107 = 0uLL;
  unsigned int v79 = (long long *)(a3 + 8952);
  if ((*(_DWORD *)(a3 + 8956) - 4) > 2 || (int)v5 - *(_DWORD *)v79 >= 1801)
  {
    int GPS_Klob = Core_Get_GPS_Klob(v5, &v107);
    int v81 = *(_DWORD *)(a3 + 8956);
    if (GPS_Klob)
    {
      if ((v81 - 4) > 2 || (int)v107 > *(_DWORD *)v79)
      {
        *unsigned int v79 = v107;
        if ((int)v5 >= 1 && *(_DWORD *)(a3 + 8956) != 3)
        {
          uint64_t v82 = 0;
          LODWORD(v83) = 0;
          uint64_t v84 = p_NV;
          *(_OWORD *)(p_NV + 144) = v107;
          uint64_t v85 = v84 + 144;
          __int16 v86 = -9871;
          do
          {
            int v87 = *(unsigned __int8 *)(v85 + v82) ^ HIBYTE(v86);
            __int16 v86 = -12691 * (v86 + (*(unsigned __int8 *)(v85 + v82) ^ HIBYTE(v86))) + 22719;
            uint64_t v83 = (v83 + v87);
            ++v82;
          }
          while (v82 != 16);
          *(void *)(v84 + 136) = v83;
        }
      }
    }
    else if ((int)v5 >= 901 && !v81)
    {
      *(_DWORD *)(a3 + 8952) = v5 - 1209600;
      *(void *)(a3 + 8960) = 0xFAFF0427FFFF0205;
      *(_DWORD *)(a3 + 8956) = 1;
      EvLog("DD_Assist_GPS_Ion:  Iono Model missing, default used.");
    }
  }
  long long v107 = 0uLL;
  *(void *)&v108[0] = 0;
  int v88 = (long long *)(a3 + 8968);
  if (((*(_DWORD *)(a3 + 8972) - 4) > 2 || (int)v5 - *(_DWORD *)v88 >= 1801)
    && Core_Get_GPS_UTC(v5, (uint64_t)&v107)
    && ((*(_DWORD *)(a3 + 8972) - 4) > 2 || (int)v107 > *(_DWORD *)v88))
  {
    *int v88 = v107;
    *(void *)(a3 + 8984) = *(void *)&v108[0];
    if ((int)v5 >= 1 && *(_DWORD *)(a3 + 8972) != 3)
    {
      uint64_t v89 = 0;
      LODWORD(v90) = 0;
      uint64_t v91 = p_NV;
      *(_OWORD *)(p_NV + 168) = v107;
      *(void *)(v91 + 184) = *(void *)&v108[0];
      uint64_t v92 = v91 + 168;
      __int16 v93 = -9871;
      do
      {
        int v94 = *(unsigned __int8 *)(v92 + v89) ^ HIBYTE(v93);
        __int16 v93 = -12691 * (v93 + (*(unsigned __int8 *)(v92 + v89) ^ HIBYTE(v93))) + 22719;
        uint64_t v90 = (v90 + v94);
        ++v89;
      }
      while (v89 != 24);
      *(void *)(v91 + 160) = v90;
    }
  }
}

uint64_t EE_Get_GPS_BinEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v4 = (int)a1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  strcpy(v31, "GN_EE_Get_GPS_Eph_El: ");
  if (((_BYTE)a1 + 53) > 0xF5u || ((_BYTE)a1 - 33) > 0xDFu)
  {
    uint64_t result = GN_EE_Get_GPS_Eph_El(a1, (unsigned __int16)(((1861606989 * a2) >> 50) + ((unint64_t)(1861606989 * a2) >> 63)), a2- 604800* (unsigned __int16)(((1861606989 * a2) >> 50)+ ((unint64_t)(1861606989 * a2) >> 63)), (uint64_t)&v8);
    if (result)
    {
      v20[2] = v9;
      char v21 = v10;
      __int16 v22 = v11;
      char v23 = v12;
      long long v24 = v13;
      uint64_t v25 = v14;
      __int16 v26 = v15;
      long long v27 = v16;
      long long v28 = v17;
      __int16 v29 = v18;
      int v30 = v19;
      uint64_t v6 = *(void *)(p_api + 48);
      if (*(unsigned char *)(v6 + 16) && *(int *)v6 >= 3) {
        int v7 = (int)*(double *)(v6 + 40) + 604800 * *(__int16 *)(v6 + 32);
      }
      else {
        int v7 = 0;
      }
      v20[0] = v7;
      v20[1] = 6;
      if (g_Logging_Cfg < 5) {
        EvLog_v("%s  %d", v31, v4);
      }
      else {
        EvLog_GPS_IntEph(v31, v4, (uint64_t)v20);
      }
      uint64_t result = Is_GPS_IntEph_Valid((uint64_t)v31, v4, (uint64_t)v20);
      if (result)
      {
        GPS_EphInt2Bin((uint64_t)v20, a3);
        return 1;
      }
    }
  }
  else
  {
    EvCrt_v("EE_Get_GLON_GPS_BinEph:  FAILED:  SV = %d, Out of range !", a1);
    return 0;
  }
  return result;
}

uint64_t EE_Get_GLON_GPS_BinEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3 = (int)a1;
  uint64_t v30 = *MEMORY[0x263EF8340];
  __int16 v28 = 0;
  int v27 = 0;
  strcpy(v29, "GN_EE_Get_GLON_GPS_Eph_El: ");
  if (((_BYTE)a1 - 25) > 0xE7u)
  {
    uint64_t result = GN_EE_Get_GLON_GPS_Eph_El(a1, (unsigned __int16)(((1861606989 * a2) >> 50) + ((unint64_t)(1861606989 * a2) >> 63)), a2- 604800* (unsigned __int16)(((1861606989 * a2) >> 50)+ ((unint64_t)(1861606989 * a2) >> 63)), (uint64_t)&v8);
    if (result)
    {
      v18[2] = v9;
      char v19 = v10;
      __int16 v20 = v11;
      char v21 = v12;
      long long v22 = v13;
      uint64_t v23 = v14;
      __int16 v24 = v15;
      long long v25 = v16;
      long long v26 = v17;
      uint64_t v6 = *(void *)(p_api + 48);
      if (*(unsigned char *)(v6 + 16) && *(int *)v6 >= 3) {
        int v7 = (int)*(double *)(v6 + 40) + 604800 * *(__int16 *)(v6 + 32);
      }
      else {
        int v7 = 0;
      }
      v18[0] = v7;
      v18[1] = 6;
      if (g_Logging_Cfg < 5) {
        EvLog_v("%s  %d", v29, v3);
      }
      else {
        EvLog_GPS_IntEph(v29, v3, (uint64_t)v18);
      }
      uint64_t result = Is_GPS_IntEph_Valid((uint64_t)v29, v3, (uint64_t)v18);
      if (result)
      {
        GPS_EphInt2Bin((uint64_t)v18, a3);
        return 1;
      }
    }
  }
  else
  {
    EvCrt_v("EE_Get_GLON_GPS_BinEph:  FAILED:  SV = %d < %d || > %d, Out of range !", a1, 1, 24);
    return 0;
  }
  return result;
}

uint64_t EE_Get_GAL_IntEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3 = (int)a1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (((_BYTE)a1 - 37) <= 0xDBu)
  {
    EvCrt_v("EE_Get_GAL_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if (a2 < 619315200) {
    return 0;
  }
  uint64_t result = GN_EE_Get_GAL_Eph_El(a1, (unsigned __int16)(a2 / 0x93A80u - 1024), a2 % 0x93A80u, (uint64_t)&v20);
  if (!result) {
    return result;
  }
  if (g_Logging_Cfg < 5) {
    EvLog_d("GN_EE_Get_GAL_Eph_El: ", v3);
  }
  else {
    EvLog_nd("GN_EE_Get_GAL_Eph_El: ", 34, SHIWORD(v25), v20, WORD2(v20), BYTE6(v20), HIBYTE(v20), (unsigned __int16)v21, HIWORD(v21), v22, DWORD1(v22), DWORD2(v22), HIDWORD(v22), v23, HIDWORD(v23), v24, (__int16)v25, SWORD1(v25), SWORD2(v25),
  }
      SWORD3(v25),
      SWORD4(v25),
      SWORD5(v25),
      SWORD6(v25),
      SHIWORD(v25),
      WORD1(v27),
      v26,
      HIDWORD(v26),
      (__int16)v27,
      SWORD2(v27),
      SHIWORD(v27),
      v28,
      BYTE1(v28),
      BYTE2(v28),
      HIBYTE(v28),
      v29,
      HIBYTE(v29),
      v30,
      (__int16)v25,
      HIWORD(v21),
      (unsigned __int16)v21,
      HIBYTE(v20),
      BYTE6(v20),
      WORD2(v20));
  unsigned int v6 = BYTE6(v20) - 37;
  BOOL v7 = v6 < 0xFFFFFFDC;
  if (v6 <= 0xFFFFFFDB) {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d, Out of range !", BYTE6(v20));
  }
  if (v20 > 0x93A7F)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  WeekNo = %d >= 604800, Out of range !", v20);
    BOOL v7 = 1;
  }
  if (WORD2(v20) >= 0x1000u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  WeekNo = %d >= 4096, Out of range !", WORD2(v20));
    BOOL v7 = 1;
  }
  unsigned int v8 = BYTE6(v20);
  if (BYTE6(v20) >= 0x41u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d > 2^6, Out of range !", BYTE6(v20));
    unsigned int v8 = BYTE6(v20);
    BOOL v7 = 1;
  }
  if (v8 >= 0x25)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d > 36, Unrealistic value !", v8);
    BOOL v7 = 1;
  }
  if (WORD1(v27) >> 5 >= 0x13Bu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  toc = %d > 10079, Out of range !", WORD1(v27));
    BOOL v7 = 1;
  }
  if (HIWORD(v21) >> 5 >= 0x13Bu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  toe = %d > 10079, Out of range !", HIWORD(v21));
    BOOL v7 = 1;
  }
  if ((unsigned __int16)v21 >= 0x400u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  IODnav = %d > 1023, Out of range !", (unsigned __int16)v21);
    BOOL v7 = 1;
  }
  HIDWORD(v9) = 1067366481;
  if (((BYTE6(v20) - 14) & 0xFB) != 0) {
    double v10 = 0.03;
  }
  else {
    double v10 = 0.25;
  }
  LODWORD(v9) = DWORD1(v22);
  double v11 = (double)v9;
  double v12 = v11 * 1.16415322e-10;
  if (v11 * 1.16415322e-10 < 0.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  e = %g  < %g, Unrealistic value !", v11 * 1.16415322e-10, 0.0);
    BOOL v7 = 1;
  }
  if (v12 > v10)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  e = %g  > %g, Unrealistic value !", v12, v10);
    BOOL v7 = 1;
  }
  LODWORD(v11) = DWORD2(v22);
  double v13 = (double)*(unint64_t *)&v11 * 0.00000190734863;
  if (v13 < 4800.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  sqrtA = %g  < %g, Unrealistic value !", v13, 4800.0);
    BOOL v7 = 1;
  }
  if (v13 > 5800.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  sqrtA = %g  > %g, Unrealistic value !", v13, 5800.0);
    BOOL v7 = 1;
  }
  if ((v24 - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %d < -2^23 || >= 2^23, Out of range !");
LABEL_43:
    BOOL v7 = 1;
    goto LABEL_44;
  }
  double v14 = (double)v24 * 3.57157734e-13;
  if (v14 < -0.00000198862815)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %e  < %e rad/s, Unrealistic value !");
    goto LABEL_43;
  }
  if (v14 > 0.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %e  > %e rad/s, Unrealistic value !");
    goto LABEL_43;
  }
LABEL_44:
  if ((unsigned __int16)((unsigned __int16)(v25 - 0x2000) >> 14) <= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  IDOT = %d < -2^13 || >= 2^13, Out of range !", (__int16)v25);
    BOOL v7 = 1;
  }
  if ((int)v26 - 0x40000000 >= 0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af0 = %d < -2^30 || >= 2^30, Out of range !", v26);
    BOOL v7 = 1;
  }
  if ((HIDWORD(v26) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af1 = %d < -2^20 || >= 2^20, Out of range !", HIDWORD(v26));
    BOOL v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v27 - 32) >> 6) <= 0x3FEu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af2 = %d < -2^5 || >= 2^5, Out of range !", (__int16)v27);
    BOOL v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD2(v27) - 512) >> 10) <= 0x3Eu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  bgdE1E5b = %d < -2^9 || >= 2^9, Out of range !", SWORD2(v27));
    BOOL v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(HIWORD(v27) - 512) >> 10) <= 0x3Eu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  bgdE1E5a = %d < -2^9 || >= 2^9, Out of range !", SHIWORD(v27));
    BOOL v7 = 1;
  }
  if (v28 >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  Model_ID = %d < 0 || > 1, Out of range !", v28);
    BOOL v7 = 1;
  }
  if (BYTE1(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5a_Nav_DVS = %d < 0 || > 1, Out of range !", BYTE1(v28));
    BOOL v7 = 1;
  }
  if (BYTE2(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:   E5b_Nav_DVS = %d < 0 || > 1, Out of range !", BYTE2(v28));
    BOOL v7 = 1;
  }
  if (HIBYTE(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E1B_Nav_DVS = %d < 0 || > 1, Out of range !", HIBYTE(v28));
    BOOL v7 = 1;
  }
  if (v29 >= 4u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5a_Sig_HS = %d < 0 || > 3, Out of range !", v29);
    BOOL v7 = 1;
  }
  if (HIBYTE(v29) >= 4u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5b_Sig_HS = %d < 0 || > 3, Out of range !", HIBYTE(v29));
    BOOL v7 = 1;
  }
  unsigned __int8 v15 = v30;
  if (v30 > 3u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E1B_Sig_HS = %d < 0 || > 1, Out of range !", v30);
    if (v31 < 7u) {
      return 0;
    }
    goto LABEL_72;
  }
  unsigned __int8 v16 = v31;
  if (v31 > 6u)
  {
LABEL_72:
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  Fit_hours = %d > 6, Out of range !");
    return 0;
  }
  if (v7) {
    return 0;
  }
  uint64_t v17 = *(void *)(p_api + 48);
  if (*(unsigned char *)(v17 + 16) && *(int *)v17 >= 3) {
    int v18 = (int)*(double *)(v17 + 40) + 604800 * *(__int16 *)(v17 + 32);
  }
  else {
    int v18 = 0;
  }
  *(_DWORD *)a3 = v18;
  *(_DWORD *)(a3 + 4) = 6;
  *(void *)(a3 + 8) = v20;
  *(_DWORD *)(a3 + 16) = v21;
  *(_OWORD *)(a3 + 20) = v22;
  *(void *)(a3 + 36) = v23;
  *(_DWORD *)(a3 + 44) = v24;
  *(_OWORD *)(a3 + 48) = v25;
  uint64_t v19 = v27;
  *(void *)(a3 + 64) = v26;
  *(void *)(a3 + 72) = v19;
  *(_DWORD *)(a3 + 80) = v28;
  *(_WORD *)(a3 + 84) = v29;
  *(unsigned char *)(a3 + 86) = v15;
  uint64_t result = 1;
  *(unsigned char *)(a3 + 87) = v16;
  return result;
}

uint64_t EE_Get_BDS_CNAV_IntEph(XofSvcsIf *a1, unsigned int a2, uint64_t a3)
{
  int v3 = (int)a1;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (((_BYTE)a1 - 64) <= 0xC0u)
  {
    EvCrt_v("EE_Get_BDS_CNAV_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if ((int)a2 < 820713600) {
    return 0;
  }
  unsigned int v6 = a2 % 0x93A80;
  if (a2 % 0x93A80 < 0xE) {
    __int16 v7 = -1357;
  }
  else {
    __int16 v7 = -1356;
  }
  if (v6 < 0xE) {
    unsigned int v6 = a2 % 0x93A80 + 604800;
  }
  uint64_t result = GN_EE_Get_BDS_CNAV_Eph_El(a1, (unsigned __int16)(v7 + a2 / 0x93A80), v6 - 14, (uint64_t)&v20);
  if (!result) {
    return result;
  }
  if (g_Logging_Cfg < 5) {
    EvLog_d("GN_EE_Get_BDS_CNAV_Eph_El: ", v3);
  }
  else {
    EvLog_v("%s %2u %2u %1u %1u %6u  %4u %4u %4u %4u  %9d %8d  %6d %8d  %11D %11U %11D %11D %11D  %7d %6d  %6d %6d %8d %8d %8d %8d   %9d %8d %5d %5u  %2u %1u %1u %2u  %5d %5d %5d %5d  %1u %1u %1u %1u %1u %1u  %1d  %4d", "GN_EE_Get_BDS_CNAV_Eph_El: ", v20, BYTE1(v20), BYTE2(v20), HIBYTE(v20), v21, v22, v23, v24, v25, v26, DWORD1(v26), DWORD2(v26), HIDWORD(v26), v27, v28, v29,
  }
      v30,
      v31,
      (__int16)v32,
      SHIWORD(v32),
      v33,
      DWORD1(v33),
      DWORD2(v33),
      HIDWORD(v33),
      v34,
      HIDWORD(v34),
      (__int16)v35,
      HIWORD(v35),
      v36,
      BYTE1(v36),
      BYTE2(v36),
      HIBYTE(v36),
      (__int16)v37,
      SWORD1(v37),
      SWORD2(v37),
      SHIWORD(v37),
      v38,
      BYTE1(v38),
      BYTE2(v38),
      HIBYTE(v38),
      v39,
      v40,
      v41,
      v42,
      HIWORD(v35),
      (__int16)v35,
      SHIWORD(v32),
      (__int16)v32,
      v31,
      v29,
      v25,
      v24,
      v23,
      v22,
      HIBYTE(v20),
      BYTE2(v20),
      BYTE1(v20),
      v20);
  unsigned int v8 = v20 - 64;
  BOOL v9 = v8 < 0xFFFFFFC1;
  if (v8 <= 0xFFFFFFC0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El:  FAILED:  SVid = %d, Out of range !", v20);
    if (v20 - 64 <= 0xFFFFFFC0) {
      EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SVid = %d <1 or >%d, Out of range!", v20, 63);
    }
  }
  if (BYTE1(v20) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SatH1 = %d >1, Out of range!", BYTE1(v20));
    BOOL v9 = 1;
  }
  if (BYTE2(v20) >= 4u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SV_type = %d >3, Out of range!", BYTE2(v20));
    BOOL v9 = 1;
  }
  if (HIBYTE(v20) >= 7u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Fit_hours = %d >6, Out of range!", HIBYTE(v20));
    BOOL v9 = 1;
  }
  if (v21 >> 7 >= 0x627)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sSOW = %d >201599, Out of range!", v21);
    BOOL v9 = 1;
  }
  if (v22 >= 0x2000u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Weeuint64_t k = %d >=8191, Out of range!", v22);
    BOOL v9 = 1;
  }
  if (v23 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: toe = %d >2106, Out of range!", v23);
    BOOL v9 = 1;
  }
  if (v24 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: toc = %d >2106, Out of range!", v24);
    BOOL v9 = 1;
  }
  if (v25 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: top = %d >2106, Out of range!", v25);
    BOOL v9 = 1;
  }
  if ((v26 - 0x2000000) >> 26 != 63)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: delta_A = %d <-2^25 or >=2^25, Out of range!", v26);
    BOOL v9 = 1;
  }
  if ((DWORD1(v26) - 0x1000000) >> 25 != 127)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: A_dot = %d <-2^24 or >=2^24, Out of range!", DWORD1(v26));
    BOOL v9 = 1;
  }
  if ((DWORD2(v26) - 0x2000000) >> 26 != 63)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dN = %d <-2^25 or >=2^25, Out of range!", DWORD2(v26));
    BOOL v9 = 1;
  }
  if ((HIDWORD(v26) - 0x400000) >> 23 != 511)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dN_dot = %d <-2^22 or >=2^22, Out of range!", HIDWORD(v26));
    BOOL v9 = 1;
  }
  if ((unint64_t)(v27 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: M0 = %d <-2^32 or >=2^32, Out of range!", v27);
    BOOL v9 = 1;
  }
  if (*((void *)&v27 + 1) >> 33)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %d >=2^33, Out of range!");
LABEL_50:
    BOOL v9 = 1;
    goto LABEL_51;
  }
  double v10 = dbl_263D81800[v20 - 6 < 0x35];
  double v11 = (double)*((unint64_t *)&v27 + 1) * 5.82076609e-11;
  if (v11 < 0.0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %g < %g, Unrealistic value!", (double)*((unint64_t *)&v27 + 1) * 5.82076609e-11, 0.0);
    BOOL v9 = 1;
  }
  if (v11 > v10)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %g > %g, Unrealistic value!");
    goto LABEL_50;
  }
LABEL_51:
  if ((unint64_t)(v28 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: w = %d <-2^32 or >=2^32, Out of range!", v28);
    BOOL v9 = 1;
  }
  if ((unint64_t)(*((void *)&v28 + 1) - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega0 = %d <-2^32 or >=2^32, Out of range!", DWORD2(v28));
    BOOL v9 = 1;
  }
  if ((unint64_t)(v29 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: i0 = %d <-2^32 or >=2^32, Out of range!", v29);
    BOOL v9 = 1;
  }
  if ((v30 - 0x40000) <= 0xFFF7FFFF)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %d <-2^18 or >=2^18, Out of range!");
LABEL_63:
    BOOL v9 = 1;
    goto LABEL_64;
  }
  double v12 = (double)v30 * 1.78578867e-13;
  if (v12 < -0.00000198862815)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %e < %e, Unrealistic value!");
    goto LABEL_63;
  }
  if (v12 > 0.000000314159265)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %e > %e, Unrealistic value!");
    goto LABEL_63;
  }
LABEL_64:
  if (((v31 - 0x4000) & 0x8000) == 0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: i_dot = %d <-2^14 or >=2^14, Out of range!", v31);
    BOOL v9 = 1;
  }
  if ((v33 - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Crs = %d <-2^23 or >=2^23, Out of range!", v33);
    BOOL v9 = 1;
  }
  if ((DWORD1(v33) - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Crc = %d <-2^23 or >=2^23, Out of range!", DWORD1(v33));
    BOOL v9 = 1;
  }
  if ((DWORD2(v33) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Cus = %d <-2^20 or >=2^20, Out of range!", DWORD2(v33));
    BOOL v9 = 1;
  }
  if ((HIDWORD(v33) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Cuc = %d <-2^20 or >=2^20, Out of range!", HIDWORD(v33));
    BOOL v9 = 1;
  }
  if ((v34 - 0x1000000) >> 25 != 127)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af0 = %d <-2^24 or >=2^24, Out of range!", v34);
    BOOL v9 = 1;
  }
  if ((HIDWORD(v34) - 0x200000) >> 22 != 1023)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af1 = %d <-2^21 or >=2^21, Out of range!", HIDWORD(v34));
    BOOL v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v35 - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af2 = %d <-2^10 or >=2^10, Out of range!", (__int16)v35);
    BOOL v9 = 1;
  }
  if (v36 >= 0x20u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Ocb = %d >31, Out of range!", v36);
    BOOL v9 = 1;
  }
  if (BYTE1(v36) >= 8u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oc1 = %d >7, Out of range!", BYTE1(v36));
    BOOL v9 = 1;
  }
  if (BYTE2(v36) >= 8u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oc2 = %d >7, Out of range!", BYTE2(v36));
    BOOL v9 = 1;
  }
  if (HIBYTE(v36) >= 0x20u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oce = %d >31, Out of range!", HIBYTE(v36));
    BOOL v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v37 - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: TGD_B1C_p = %d <-2^10 or >=2^10, Out of range!", (__int16)v37);
    BOOL v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD1(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: TGD_B2a_p = %d <-2^10 or >=2^10, Out of range!", SWORD1(v37));
    BOOL v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD2(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: ISC_B1C_d = %d <-2^10 or >=2^10, Out of range!", SWORD2(v37));
    BOOL v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(HIWORD(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: ISC_B2a_d = %d <-2^10 or >=2^10, Out of range!", SHIWORD(v37));
    BOOL v9 = 1;
  }
  if (v38 >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dif_B1C = %d >1, Out of range!", v38);
    BOOL v9 = 1;
  }
  if (BYTE1(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sif_B1C = %d >1, Out of range!", BYTE1(v38));
    BOOL v9 = 1;
  }
  if (BYTE2(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: aif_B1C = %d >1, Out of range!", BYTE2(v38));
    BOOL v9 = 1;
  }
  if (HIBYTE(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dif_B2a = %d >1, Out of range!", HIBYTE(v38));
    BOOL v9 = 1;
  }
  if (v39 >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sif_B2a = %d >1, Out of range!", v39);
    BOOL v9 = 1;
  }
  unsigned __int8 v13 = v40;
  if (v40 > 1u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: aif_B2a = %d >1, Out of range!", v40);
    if ((v41 - 16) > 0xDFu) {
      return 0;
    }
    goto LABEL_110;
  }
  char v14 = v41;
  if ((v41 - 16) < 0xE0u)
  {
LABEL_110:
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: URAI = %d <-16 or >15, Out of range!");
    return 0;
  }
  if (v9) {
    return 0;
  }
  uint64_t v15 = *(void *)(p_api + 48);
  if (*(unsigned char *)(v15 + 16) && *(int *)v15 >= 3) {
    int v16 = (int)*(double *)(v15 + 40) + 604800 * *(__int16 *)(v15 + 32);
  }
  else {
    int v16 = 0;
  }
  *(_DWORD *)a3 = v16;
  *(_DWORD *)(a3 + 4) = 6;
  unsigned int v17 = v21;
  *(_DWORD *)(a3 + 8) = v20;
  *(_DWORD *)(a3 + 12) = v17;
  *(_WORD *)(a3 + 16) = v22;
  int v18 = v24;
  *(_DWORD *)(a3 + 20) = v23;
  *(_DWORD *)(a3 + 24) = v18;
  *(_DWORD *)(a3 + 28) = v25;
  long long v19 = v27;
  *(_OWORD *)(a3 + 32) = v26;
  *(_OWORD *)(a3 + 48) = v19;
  *(_OWORD *)(a3 + 64) = v28;
  *(void *)(a3 + 80) = v29;
  *(_DWORD *)(a3 + 88) = v30;
  *(_WORD *)(a3 + 92) = v31;
  *(_DWORD *)(a3 + 94) = v32;
  *(_OWORD *)(a3 + 100) = v33;
  *(void *)(a3 + 116) = v34;
  *(_DWORD *)(a3 + 124) = v35;
  *(_DWORD *)(a3 + 128) = v36;
  *(void *)(a3 + 132) = v37;
  *(_DWORD *)(a3 + 140) = v38;
  *(unsigned char *)(a3 + 144) = v39;
  *(unsigned char *)(a3 + 145) = v13;
  *(unsigned char *)(a3 + 146) = v14;
  uint64_t result = 1;
  *(unsigned char *)(a3 + 147) = v42;
  return result;
}

uint64_t EE_Get_BDS_Leg_IntEph(int a1)
{
  if ((a1 - 64) <= 0xFFFFFFC0) {
    EvCrt_v("EE_Get_BDS_IntEph:  FAILED:  SV = %d, Out of range !", a1);
  }
  return 0;
}

uint64_t EE_Get_NVIC_IntEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3 = (int)a1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (((_BYTE)a1 - 15) <= 0xF1u)
  {
    EvCrt_v("EE_Get_NVIC_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if (a2 < 619920000) {
    return 0;
  }
  uint64_t result = GN_EE_Get_NVIC_Eph_El(a1, (unsigned __int16)(a2 / 0x93A80u - 1024), a2 % 0x93A80u, (uint64_t)&v15);
  if (result)
  {
    if (g_Logging_Cfg < 5) {
      EvLog_d("GN_EE_Get_NVIC_Eph_El: ", v3);
    }
    else {
      EvLog_v("%s %2u %1u %1u %1u %3u %3d  %4u %5d %5d %8d %6d %4d  %1d  %6d  %5d %10u %10u %11d %11d %11d %11d %6d %8d  %6d %6d %6d %6d %6d %6d", "GN_EE_Get_NVIC_Eph_El:  ", v15, BYTE1(v15), BYTE2(v15), HIBYTE(v15), v16, SBYTE1(v16), WORD1(v16), WORD2(v16), HIWORD(v16), v17, SWORD2(v17), SBYTE6(v17), HIBYTE(v17), (__int16)v18, SHIWORD(v18), v19,
    }
        DWORD1(v19),
        DWORD2(v19),
        HIDWORD(v19),
        v20,
        HIDWORD(v20),
        v21,
        v22,
        (__int16)v23,
        SWORD1(v23),
        SWORD2(v23),
        SHIWORD(v23),
        (__int16)v24,
        SHIWORD(v24));
    unsigned int v7 = v15 - 15;
    BOOL v8 = v7 < 0xFFFFFFF2;
    if (v7 <= 0xFFFFFFF1) {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  SVid = %d, Out of range !", v15);
    }
    if (BYTE1(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Alert_Flag = %d > 1, Out of range !", BYTE1(v15));
      BOOL v8 = 1;
    }
    if (BYTE2(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  L5_Health_Flag = %d > 1, Out of range !", BYTE2(v15));
      BOOL v8 = 1;
    }
    if (HIBYTE(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  S_Health_Flag = %d > 1, Out of range !", HIBYTE(v15));
      BOOL v8 = 1;
    }
    if ((BYTE1(v16) - 16) <= 0xE0u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  URAI = %d > 1, Out of range !", SBYTE1(v16));
      BOOL v8 = 1;
    }
    if (WORD1(v16) >= 0x1000u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  WeekNo = %d > 4095 Out of range !", WORD1(v16));
      BOOL v8 = 1;
    }
    if (WORD2(v16) >= 0x93A8u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  toc = %d > 37799, Out of range !", WORD2(v16));
      BOOL v8 = 1;
    }
    if (HIWORD(v16) >= 0x93A8u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  toe = %d > 37799, Out of range !", HIWORD(v16));
      BOOL v8 = 1;
    }
    if ((v17 - 0x2000000) >> 26 != 63)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  af0 = %d < -2^25 || >= 2^25, Out of range !", v17);
      BOOL v8 = 1;
    }
    if (HIBYTE(v17) >= 7u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Fit_hours = %d > 6, Out of range !", HIBYTE(v17));
      BOOL v8 = 1;
    }
    if ((unsigned __int16)((unsigned __int16)(HIWORD(v18) - 0x2000) >> 14) <= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  i_dot = %d < -2^13 || >= 2^13, Out of range !", SHIWORD(v18));
      BOOL v8 = 1;
    }
    if ((v21 - 0x800000) >> 24 != 255)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  delta_N = %d < -2^23 || >= 2^23, Out of range !", v21);
      BOOL v8 = 1;
    }
    if ((v22 - 0x800000) >> 24 != 255)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Omega_dot = %d < -2^23 || >= 2^23, Out of range !", v22);
      BOOL v8 = 1;
    }
    LODWORD(v6) = v19;
    double v9 = (double)v6 * 0.00000190734863;
    if (v9 >= *(double *)"")
    {
      if (v9 <= 6700.0) {
        goto LABEL_42;
      }
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: sqrt_A = %g > %g, Unrealistic value!");
    }
    else
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: sqrt_A = %g < %g, Unrealistic value!");
    }
    BOOL v8 = 1;
LABEL_42:
    LODWORD(v9) = DWORD1(v19);
    double v10 = (double)*(unint64_t *)&v9 * 1.16415322e-10;
    if (v10 >= 0.0)
    {
      if (v10 <= 0.03)
      {
LABEL_47:
        int v11 = v22;
        double v12 = (double)v22 * 3.57157734e-13;
        if (v12 < -0.00000198862815)
        {
          EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: Omega_dot = %e < %e, Unrealistic value!");
          return 0;
        }
        if (v12 > 0.000000314159265)
        {
          EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: Omega_dot = %e > %e, Unrealistic value!");
          return 0;
        }
        if (v8) {
          return 0;
        }
        uint64_t v13 = *(void *)(p_api + 48);
        if (*(unsigned char *)(v13 + 16) && *(int *)v13 >= 3) {
          int v14 = (int)*(double *)(v13 + 40) + 604800 * *(__int16 *)(v13 + 32);
        }
        else {
          int v14 = 0;
        }
        *(_DWORD *)a3 = v14;
        *(_DWORD *)(a3 + 4) = 6;
        *(_DWORD *)(a3 + 8) = v15;
        *(void *)(a3 + 12) = v16;
        *(void *)(a3 + 20) = v17;
        *(_DWORD *)(a3 + 28) = v18;
        *(_OWORD *)(a3 + 32) = v19;
        *(void *)(a3 + 48) = v20;
        *(_DWORD *)(a3 + 56) = v21;
        *(_DWORD *)(a3 + 60) = v11;
        *(void *)(a3 + 64) = v23;
        uint64_t result = 1;
        *(_DWORD *)(a3 + 72) = v24;
        return result;
      }
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: e = %g > %g, Unrealistic value!");
    }
    else
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: e = %g < %g, Unrealistic value!");
    }
    BOOL v8 = 1;
    goto LABEL_47;
  }
  return result;
}

uint64_t GNS_Initialize(void)
{
  if (g_GnsInit) {
    return 1;
  }
  gnssDataMgt_Init();
  uint64_t result = AgpsSpawnFsm((uint64_t)&g_AgpsFsmTable, 6);
  g_GnsInit = result;
  return result;
}

BOOL NK_Crude_Apx_Pos_Core(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  v524 = v6;
  BOOL v8 = v7;
  v537 = v9;
  uint64_t v555 = v10;
  v526 = v11;
  uint64_t v577 = v12;
  uint64_t v13 = (int (*)[3])v4;
  uint64_t v745 = *MEMORY[0x263EF8340];
  long long v583 = 0uLL;
  *(double *)&uint64_t v584 = 0.0;
  int8x16_t __x = 0uLL;
  double v593 = 0.0;
  uint64_t v591 = 0;
  long long v589 = 0u;
  long long v590 = 0u;
  int32x4_t v530 = 0u;
  int v14 = (int *)&unk_26AA2D000;
  int v15 = &qword_26A9CA000;
  v558 = v5;
  if (g_Logging_Cfg >= 4)
  {
    uint64_t v16 = mach_continuous_time();
    uint64_t v5 = v558;
    int32x4_t v530 = vdupq_n_s32((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16));
  }
  uint64_t v17 = 0;
  int v18 = 0;
  unsigned int v19 = 0;
  uint64_t v20 = &(*v13)[2];
  do
  {
    if (v5[v17] == 3) {
      ++v19;
    }
    if (*(v20 - 2) && *(v20 - 1) && *v20) {
      ++v18;
    }
    ++v17;
    v20 += 3;
  }
  while (v17 != 128);
  int v523 = v18;
  v531 = v13;
  int v21 = Centroid_SV_Pos(v13, 0x80u, (double *)v597);
  if (v21)
  {
    *(void *)&v597[24] = 0;
    long long v598 = 0uLL;
    long long v594 = *(_OWORD *)v597;
    long long v595 = *(unint64_t *)&v597[16];
    long long v596 = 0uLL;
  }
  else
  {
    long long v595 = 0u;
    long long v596 = 0u;
    long long v594 = 0u;
  }
  int32x4_t v527 = v530;
  if (g_Logging_Cfg >= 5)
  {
    uint64_t v22 = mach_continuous_time();
    int32x4_t v23 = v530;
    v23.i32[1] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22);
    int32x4_t v527 = v23;
  }
  uint32x4_t v24 = 0uLL;
  xmmword_26A9CC288 = 0u;
  *(_OWORD *)&dword_26A9CC298 = 0u;
  *(long long *)((char *)&xmmword_26A9CC260 + 8) = 0u;
  *(_OWORD *)&byte_26A9CC278 = 0u;
  xmmword_26A9CC248 = 0u;
  *(_OWORD *)&qword_26A9CC258 = 0u;
  if (v19 > 2) {
    int v25 = v21;
  }
  else {
    int v25 = 0;
  }
  gDebug = 0uLL;
  *(_OWORD *)algn_26A9CC238 = 0uLL;
  v525 = v8;
  if (v25 == 1)
  {
    byte_26A9CC286 = 1;
    *(_OWORD *)v586 = *(_OWORD *)v597;
    long long v587 = *(_OWORD *)&v597[16];
    long long v588 = v598;
    bzero(v607, 0x1C00uLL);
    uint64_t v27 = 0;
    int v28 = 0;
    char v684 = 0;
    memset(v680, 0, sizeof(v680));
    memset(v681, 0, 345);
    uint64_t v686 = 0;
    uint64_t v683 = 0;
    uint64_t v685 = 0;
    long long v697 = 0u;
    long long v698 = 0u;
    long long v699 = 0u;
    long long v700 = 0u;
    long long v701 = 0u;
    long long v702 = 0u;
    long long v703 = 0u;
    long long v704 = 0u;
    long long v705 = 0u;
    long long v706 = 0u;
    long long v707 = 0u;
    long long v708 = 0u;
    long long v709 = 0u;
    long long v710 = 0u;
    long long v711 = 0u;
    long long v712 = 0u;
    long long v713 = 0u;
    long long v714 = 0u;
    long long v715 = 0u;
    long long v716 = 0u;
    long long v717 = 0u;
    long long v718 = 0u;
    long long v719 = 0u;
    long long v720 = 0u;
    long long v721 = 0u;
    long long v722 = 0u;
    long long v723 = 0u;
    long long v724 = 0u;
    long long v725 = 0u;
    long long v726 = 0u;
    long long v727 = 0u;
    long long v728 = 0u;
    int v689 = 1;
    v691 = (double *)&v676;
    v690 = &v737;
    v692 = v736;
    v693 = &v666;
    v694 = &v651;
    unint64_t v688 = 0xFFFFFFFF00000000;
    long long v695 = 0u;
    long long v696 = 0u;
    char v687 = 1;
    uint64_t v682 = 0;
    dword_26A9CC270 = 0;
    long long v737 = 0u;
    long long v738 = 0u;
    uint32x4_t v739 = 0u;
    uint32x4_t v740 = 0u;
    long long v741 = 0u;
    long long v742 = 0u;
    long long v743 = 0u;
    long long v744 = 0u;
    *(void *)&long long v732 = 0;
    long long v731 = 0u;
    long long v730 = 0u;
    uint64_t v29 = &(*v13)[2];
    int v30 = -1;
    uint64_t v31 = 592;
    memset(v729, 0, sizeof(v729));
    do
    {
      v736[v27] = 1.0;
      if (v558[v27] == 3 && *(v29 - 2) && *(v29 - 1) && *v29)
      {
        *((unsigned char *)&v737 + v27) = 1;
        *((unsigned char *)v680 + v31) = 1;
        ++v28;
        *(unsigned char *)(v577 + v27) = 1;
      }
      else if (v30 == -1)
      {
        HIDWORD(v688) = v27;
        int v30 = v27;
      }
      ++v27;
      v31 += 4;
      v29 += 3;
    }
    while (v27 != 128);
    *(_DWORD *)((char *)&v685 + 3) = -1;
    LODWORD(v685) = -16645888;
    signed int v32 = 3;
    HIBYTE(v685) = 3;
    if ((_BYTE)v28)
    {
      BYTE3(v685) = 3;
      signed int v32 = 4;
      HIBYTE(v685) = 4;
    }
    LODWORD(v686) = 2;
    if (v28 >= 3)
    {
      unsigned int v36 = 0;
      v568 = &(*v13)[2];
      double v37 = 0.0;
      while (1)
      {
        double v38 = *(double *)v597;
        double v39 = *(double *)&v597[8];
        v599[0] = *(double *)v597;
        v599[1] = *(double *)&v597[8];
        double v40 = *(double *)&v597[16];
        v599[2] = *(double *)&v597[16];
        ECEF2Geo(v599, (uint64_t)&WGS84_Datum, (uint64_t)&v644);
        double v41 = v644.f64[1];
        double v42 = -6.28318531;
        if (v644.f64[1] >= 3.14159265 || (double v42 = 6.28318531, v644.f64[1] < -3.14159265))
        {
          double v41 = v644.f64[1] + v42;
          v644.f64[1] = v644.f64[1] + v42;
        }
        __double2 v43 = __sincos_stret(v644.f64[0]);
        __double2 v44 = __sincos_stret(v41);
        uint64_t v45 = 0;
        *(double *)v729 = -(v43.__sinval * v44.__cosval);
        *((double *)v729 + 1) = -(v43.__sinval * v44.__sinval);
        *(double *)&v729[1] = v43.__cosval;
        *((double *)&v729[1] + 1) = -v44.__sinval;
        long long v730 = *(unint64_t *)&v44.__cosval;
        *(double *)&long long v731 = -(v43.__cosval * v44.__cosval);
        *((double *)&v731 + 1) = -(v43.__cosval * v44.__sinval);
        *(double *)&long long v732 = -v43.__sinval;
        char v47 = v568;
        int v46 = &v607[2];
        do
        {
          if (*((unsigned char *)v690 + v45))
          {
            uint64_t v48 = *((void *)v47 - 1);
            v49.i64[0] = (int)v48;
            v49.i64[1] = SHIDWORD(v48);
            float64x2_t v638 = vcvtq_f64_s64(v49);
            double v639 = (double)*v47;
            v640.f64[0] = v38;
            v640.f64[1] = v39;
            double v641 = v40;
            double v50 = Comp_SVrange_Sag_Corr(&v642, (double *)v585, &v640, &v638);
            *((float64x2_t *)v46 - 1) = v642;
            *(void *)int v46 = v643;
            double v51 = 0.0;
            switch(*(unsigned char *)(v577 + v45))
            {
              case 1:
              case 3:
              case 5:
                int v52 = SBYTE3(v685);
                goto LABEL_45;
              case 2:
                int v52 = SBYTE4(v685);
LABEL_45:
                if (v52 > 0) {
                  goto LABEL_46;
                }
                break;
              case 4:
                LOBYTE(v52) = BYTE5(v685);
                if (SBYTE5(v685) < 1) {
                  break;
                }
LABEL_46:
                double v51 = *(double *)&v597[8 * v52];
                break;
              default:
                break;
            }
            v691[v45] = (double)v537[v45] - v50 - v51;
          }
          ++v45;
          v46 += 7;
          v47 += 3;
        }
        while (v45 != 128);
        if (v28 > 4)
        {
          HIDWORD(v688) = -1;
        }
        else
        {
          uint64_t v53 = SHIDWORD(v688);
          *((unsigned char *)v690 + SHIDWORD(v688)) = 1;
          long long v54 = v691;
          LODWORD(v642.f64[0]) = 0;
          LODWORD(v640.f64[0]) = 0;
          LODWORD(v638.f64[0]) = 0;
          v585[0] = 0;
          v599[0] = v38;
          v599[1] = v39;
          v599[2] = v40;
          ECEF2Geo(v599, (uint64_t)&WGS84_Datum, (uint64_t)&v644);
          double v56 = v644.f64[1];
          double v57 = -6.28318531;
          if (v644.f64[1] >= 3.14159265 || (double v57 = 6.28318531, v644.f64[1] < -3.14159265))
          {
            double v56 = v644.f64[1] + v57;
            v644.f64[1] = v644.f64[1] + v57;
          }
          char v58 = &v607[7 * (int)v53];
          LODWORD(v55) = vcvtd_n_s64_f64(v644.f64[0], 0xFuLL);
          uint64_t v59 = Taylor_sin_cos(v55, (int *)&v642, (int *)&v640);
          LODWORD(v59) = vcvtd_n_s64_f64(v56, 0xFuLL);
          Taylor_sin_cos(v59, (int *)&v638, v585);
          double v60 = (double)(LODWORD(v638.f64[0]) * LODWORD(v640.f64[0]));
          double *v58 = (double)(LODWORD(v640.f64[0]) * v585[0]) * 9.31322575e-10;
          v58[1] = v60 * 9.31322575e-10;
          v58[2] = (double)SLODWORD(v642.f64[0]) * 0.0000305175781;
          v54[v53] = v645;
          if (v28 == 4) {
            v692[SHIDWORD(v688)] = 1000000.0;
          }
        }
        BOOL v61 = NK_Least_Squares_Core(v607, (double (*)[3])v729, v32, 0, 0, (uint64_t)v646, (uint64_t)&v653, &v606, (uint64_t)v680);
        uint64_t v62 = 0;
        double v63 = 0.0;
        do
        {
          if ((*((char *)&v685 + v62) & 0x80000000) == 0)
          {
            uint64_t v64 = *((unsigned __int8 *)&v685 + v62);
            double v65 = *((double *)v680 + v64);
            *(double *)&v597[8 * v64] = *(double *)&v597[8 * v64] + v65;
            double v63 = v63 + v65 * v65;
          }
          ++v62;
        }
        while (v62 != 7);
        BOOL v66 = v63 - v37 <= 2500.0 || v36 == 0;
        BOOL v67 = v66 && v61;
        ++byte_26A9CC278;
        if (!v67) {
          break;
        }
        int v68 = v36 + 1;
        if (v36 <= 8)
        {
          ++v36;
          double v37 = v63;
          if (v63 > 10000.0) {
            continue;
          }
        }
        goto LABEL_75;
      }
      int v68 = v36;
LABEL_75:
      BOOL v70 = v68 > 9 && v67;
      BOOL v71 = v63 > 90000.0 && v70;
      int v72 = !v71;
      if (v71 || !v67)
      {
        if (v71) {
          int v73 = 1;
        }
        else {
          int v73 = 2;
        }
        dword_26A9CC270 = v73;
      }
      int v74 = v67 & v72;
      int v14 = (int *)&unk_26AA2D000;
      BOOL v8 = v525;
      uint64_t v34 = v531;
      if (SHIDWORD(v688) >= 1) {
        *((unsigned char *)&v737 + HIDWORD(v688)) = 0;
      }
      if (!v74)
      {
        int v33 = 0;
        goto LABEL_108;
      }
      unint64_t v75 = 0;
      uint64_t v76 = (char)v685;
      __int16 v77 = (float64x2_t *)&v597[8 * (char)v685];
      while (1)
      {
        if (*((unsigned char *)&v737 + v75))
        {
          int v78 = v531[v75];
          v79.i64[0] = (int)*(void *)v78;
          v79.i64[1] = (int)HIDWORD(*(void *)v78);
          float64x2_t v644 = vcvtq_f64_s64(v79);
          double v645 = (double)v78[2];
          uint64_t v80 = 2;
          do
          {
            v599[v80] = v644.f64[v80] - v77->f64[v80];
            unint64_t v81 = v80-- + 1;
          }
          while (v81 > 1);
          uint64_t v82 = 0;
          double v83 = 0.0;
          do
          {
            double v83 = v83 + v77->f64[v82] * v599[v82];
            ++v82;
          }
          while (v82 != 3);
          if (v83 < 0.0)
          {
            int v33 = 0;
            __int16 v86 = &unk_26A9CC000;
            int v87 = 3;
            goto LABEL_107;
          }
        }
        if (v75 >= 0x7F) {
          break;
        }
        ++v75;
      }
      uint64_t v84 = 0;
      double v85 = 0.0;
      do
      {
        if (*((unsigned char *)&v737 + v84)) {
          double v85 = v85 + *(double *)&v666.i64[v84] * *(double *)&v666.i64[v84];
        }
        ++v84;
      }
      while (v84 != 128);
      if (v85 > 225000000.0)
      {
        int v33 = 0;
        __int16 v86 = (_DWORD *)&unk_26A9CC000;
        int v87 = 4;
LABEL_107:
        v86[156] = v87;
        goto LABEL_108;
      }
      float64x2_t v644 = *v77;
      uint64_t v493 = 8 * v76 + 16;
      double v645 = *(double *)&v597[v493];
      ECEF2Geo(v644.f64, (uint64_t)&WGS84_Datum, (uint64_t)&__x);
      int v494 = (int)v593;
      dword_26A9CC2A4 = (int)v593;
      __double2 v495 = __sincos_stret(*(double *)__x.i64);
      __double2 v496 = __sincos_stret(*(double *)&__x.i64[1]);
      v599[0] = -(v495.__sinval * v496.__cosval);
      v599[1] = -(v495.__sinval * v496.__sinval);
      v599[2] = v495.__cosval;
      double v600 = -v496.__sinval;
      double cosval = v496.__cosval;
      uint64_t v602 = 0;
      double v603 = -(v495.__cosval * v496.__cosval);
      double v604 = -(v495.__cosval * v496.__sinval);
      double v605 = -v495.__sinval;
      Comp_NEDvar_UDU((uint64_t)v681, HIBYTE(v685), v76, (double (*)[3])v599, (double *)&v680[3] + v76 + 1);
      double v497 = *(double *)((char *)&v680[3] + v493 + 8);
      if (v497 >= 100000000.0
        || ((int v498 = U4sqrt((int)v497), -500 - 1000 * v498 < v494) ? (v499 = 1000 * v498 + 18000 <= v494) : (v499 = 1),
            v499))
      {
        int v33 = 0;
        dword_26A9CC270 = 5;
      }
      else
      {
        int v33 = 1;
      }
    }
    else
    {
      int v33 = 0;
    }
    uint64_t v34 = v531;
LABEL_108:
    if (g_Logging_Cfg >= 5)
    {
      uint64_t v88 = mach_continuous_time();
      int32x4_t v89 = v527;
      v89.i32[2] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v88);
      int32x4_t v527 = v89;
    }
    if (v33) {
      int v90 = CompVelDoLs(v34, v526, v8, (double *)v597, (BOOL)&v589, v26);
    }
    else {
      int v90 = 0;
    }
    if (g_Logging_Cfg >= 5)
    {
      uint64_t v91 = mach_continuous_time();
      int32x4_t v92 = v527;
      v92.i32[3] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v91);
      int32x4_t v527 = v92;
    }
    if (v90)
    {
      __double2 v93 = __sincos_stret(*(double *)__x.i64);
      __double2 v94 = __sincos_stret(*(double *)&__x.i64[1]);
      uint64_t v95 = 0;
      v607[0] = -(v93.__sinval * v94.__cosval);
      v607[1] = -(v93.__sinval * v94.__sinval);
      uint64_t v96 = &v607[2];
      v607[2] = v93.__cosval;
      v607[3] = -v94.__sinval;
      long long v608 = *(unint64_t *)&v94.__cosval;
      *(double *)&long long v609 = -(v93.__cosval * v94.__cosval);
      *((double *)&v609 + 1) = -(v93.__cosval * v94.__sinval);
      *(double *)&long long v610 = -v93.__sinval;
      long long v97 = v589;
      double v98 = *(double *)&v590;
      do
      {
        double v99 = *(v96 - 1) * *((double *)&v97 + 1) + *(v96 - 2) * *(double *)&v97;
        double v100 = *v96;
        v96 += 3;
        *(double *)((char *)v680 + v95) = v99 + v100 * v98;
        v95 += 8;
      }
      while (v95 != 24);
      double v101 = *((double *)v680 + 1) * *((double *)v680 + 1) + *(double *)v680 * *(double *)v680;
      double v102 = fabs(*(double *)&v680[1]);
      BOOL v103 = v102 < 10.0 && v101 < 4556.25;
      HIDWORD(xmmword_26A9CC288) = (int)sqrt(v101);
      dword_26A9CC298 = (int)v102;
      int v35 = v531;
      if (!v103) {
        dword_26A9CC270 = 6;
      }
    }
    else
    {
      BOOL v103 = 0;
      int v35 = v531;
    }
    if (g_Logging_Cfg >= 5)
    {
      uint64_t v104 = mach_continuous_time();
      int32x4_t v105 = v530;
      v105.i32[0] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v104);
      int32x4_t v530 = v105;
    }
    if (v103)
    {
      int8x16_t *v524 = __x;
      BOOL v106 = 1;
      byte_26A9CC285 = 1;
      goto LABEL_624;
    }
    *(_OWORD *)v597 = *(_OWORD *)v586;
    *(_OWORD *)&v597[16] = v587;
    long long v598 = v588;
    uint32x4_t v24 = 0uLL;
    long long v589 = 0u;
    long long v590 = 0u;
    uint64_t v591 = 0;
    double v593 = 0.0;
    int8x16_t __x = 0uLL;
    dword_26A9CC274 = dword_26A9CC270;
    goto LABEL_129;
  }
  if (!v21)
  {
    int v69 = 0;
    goto LABEL_211;
  }
  int v35 = v13;
LABEL_129:
  uint64_t v107 = 0;
  size_t v108 = 0;
  uint64_t v109 = 0;
  uint64_t v662 = 0;
  uint32x4_t v661 = v24;
  uint32x4_t v660 = v24;
  uint32x4_t v659 = v24;
  uint32x4_t v658 = v24;
  uint32x4_t v657 = v24;
  uint32x4_t v656 = v24;
  uint32x4_t v655 = v24;
  v664 = &v651;
  v665 = v646;
  long long v110 = &(*v526)[2];
  unsigned int v663 = -1;
  long long v111 = &(*v35)[2];
  uint32x4_t v654 = v24;
  uint32x4_t v653 = v24;
  while (1)
  {
    int v112 = *(v111 - 2);
    int v113 = *(v111 - 1);
    int v114 = *v111;
    if (!*((void *)v111 - 1)) {
      break;
    }
LABEL_133:
    v111 += 3;
    double v115 = (double)v112;
    uint64_t v116 = (double *)((char *)v680 + v107 * 8);
    double *v116 = v115;
    v116[1] = (double)v113;
    double v117 = (double)v114;
    v116[2] = (double)v114;
    int v118 = *(v110 - 2);
    v736[v109] = (double)v8[v109];
    double v119 = (double)v118;
    v120 = (double *)&v676.i64[v107];
    double v121 = (double)*(v110 - 1);
    double v122 = (double)v113 * (double)v113 + v115 * v115 + v117 * v117;
    double v123 = (double)*v110;
    *(double *)&v666.i64[v109++] = v122;
    double *v120 = v119;
    v120[1] = v121;
    v120[2] = v123;
    v108 += 8;
    v107 += 3;
    v110 += 3;
    if (v109 == 128)
    {
      memset_pattern16(v646, &unk_263D850E0, 0x400uLL);
LABEL_135:
      BOOL v571 = 0;
      goto LABEL_136;
    }
  }
  if (v114)
  {
    int v113 = 0;
    goto LABEL_133;
  }
  BOOL v571 = v109 == 0;
  if (!v109)
  {
    unsigned int v663 = 0;
    goto LABEL_586;
  }
  memset_pattern16(v646, &unk_263D850E0, v108);
  if (v109 >= 0x80) {
    goto LABEL_135;
  }
  unsigned int v663 = v109;
  if (v109 == 5)
  {
    BOOL v571 = 0;
    uint64_t v650 = 0x3FF9000000000000;
    LODWORD(v109) = 5;
    goto LABEL_136;
  }
  if (v109 == 4)
  {
    BOOL v571 = 0;
    uint64_t v649 = 0x3F647AE147AE147CLL;
    LODWORD(v109) = 4;
    goto LABEL_136;
  }
  if (v109 != 3)
  {
    if (v109 > 7)
    {
      BOOL v571 = 0;
      uint64_t v492 = 0x4039000000000000;
      goto LABEL_587;
    }
LABEL_586:
    uint64_t v492 = 0x4019000000000000;
LABEL_587:
    v646[v109] = v492;
    goto LABEL_136;
  }
  BOOL v571 = 0;
  uint64_t v648 = 0x3F647AE147AE147CLL;
  LODWORD(v109) = 3;
LABEL_136:
  v729[0] = *(_OWORD *)v597;
  *(void *)&v729[1] = *(void *)&v597[16];
  WGS84_ECEF2Geo((long double *)v729, (double *)__x.i64);
  unsigned int v124 = 0;
  *(int8x16_t *)&v597[8] = __x;
  *(void *)v597 = 0x415854A640000000;
  *(void *)&v597[24] = 0;
  do
  {
    unsigned int v575 = v124;
    double v125 = *(double *)v597;
    __double2 v126 = __sincos_stret(*(double *)&v597[8]);
    __double2 v127 = __sincos_stret(*(double *)&v597[16]);
    *(double *)&long long v737 = v126.__cosval * v127.__cosval;
    *((double *)&v737 + 1) = v126.__cosval * v127.__sinval;
    *(double *)&long long v738 = v126.__sinval;
    *((double *)&v738 + 1) = -(v126.__sinval * v127.__cosval);
    *(double *)v739.i64 = -(v126.__sinval * v127.__sinval);
    v739.i64[1] = *(void *)&v126.__cosval;
    *(double *)v740.i64 = -(v126.__cosval * v127.__sinval);
    *(double *)&v740.i64[1] = v126.__cosval * v127.__cosval;
    *(void *)&long long v741 = 0;
    if (!v571)
    {
      uint64_t v128 = 0;
      double v129 = -v125;
      long long v130 = v680;
      uint64_t v131 = &v676;
      double v132 = *(double *)&v597[24];
      do
      {
        uint64_t v133 = 0;
        double v134 = 0.0;
        double v135 = 0.0;
        double v136 = 0.0;
        double v137 = 0.0;
        double v138 = 0.0;
        double v139 = 0.0;
        double v140 = 0.0;
        do
        {
          double v141 = *(double *)((char *)&v737 + v133 * 8);
          double v142 = *(double *)&v131->i64[v133];
          double v140 = v140 + v141 * v142;
          double v143 = *(double *)((char *)&v738 + v133 * 8 + 8);
          double v138 = v138 + v143 * v142;
          double v144 = *(double *)&v740.i64[v133];
          double v136 = v136 + v144 * v142;
          double v145 = *(double *)((char *)v130 + v133 * 8);
          double v139 = v139 + v141 * v145;
          double v137 = v137 + v143 * v145;
          double v135 = v135 + v144 * v145;
          double v134 = v134 + v145 * v142;
          ++v133;
        }
        while (v133 != 3);
        double v146 = *(double *)&v666.i64[v128] + v125 * v125 + v125 * -2.0 * v139;
        double v147 = sqrt(v146);
        double v148 = v146 * v147;
        double v149 = 1.0 / v147;
        double v150 = -(v134 - v140 * v125);
        double v151 = v150 / v148;
        double v152 = -((v125 - v139) * v151 + -v140 * v149);
        std::string v153 = &v607[3 * v128];
        double v154 = -(v151 * v125);
        *std::string v153 = v152;
        v153[1] = -(v137 * v154 + v149 * v129 * v138);
        v153[2] = -(v135 * v154 + v149 * v129 * v136);
        v651.f64[v128] = v736[v128] - (v132 - v150 * v149);
        ++v128;
        long long v130 = (_OWORD *)((char *)v130 + 24);
        uint64_t v131 = (int8x16_t *)((char *)v131 + 24);
      }
      while (v128 != v109);
    }
    uint64_t v155 = v663;
    if ((v663 & 0x80000000) == 0)
    {
      std::string v156 = &v607[3 * v663];
      v156[1] = 0.0;
      v156[2] = 0.0;
      *std::string v156 = -1.0;
      v651.f64[v155] = -(v125
                       + sqrt((v126.__cosval * v126.__cosval + v126.__sinval * v126.__sinval * 0.986656055)/ (v126.__cosval * v126.__cosval + v126.__sinval * v126.__sinval * 0.99330562))* -6378137.0);
    }
    int v157 = CAP_LSQ4_Core((uint64_t)v607, v109, (uint64_t)&v653);
    uint64_t v158 = 0;
    ++byte_26A9CC279;
    double v159 = 0.0;
    do
    {
      double v160 = *(double *)&v653.i64[v158];
      double v161 = *(double *)&v597[8 * v158] + v160;
      *(double *)&v597[8 * v158] = v161;
      if ((v158 - 1) > 1)
      {
        double v159 = v159 + v160 * v160;
      }
      else
      {
        if (v161 > 3.14159265)
        {
          do
            double v161 = v161 + -6.28318531;
          while (v161 > 3.14159265);
          *(double *)&v597[8 * v158] = v161;
        }
        if (v161 < -3.14159265)
        {
          do
            double v161 = v161 + 6.28318531;
          while (v161 < -3.14159265);
          *(double *)&v597[8 * v158] = v161;
        }
        double v159 = v159 + v160 * v160 * 1.0e10;
      }
      ++v158;
    }
    while (v158 != 4);
    if (v159 > 40000.0) {
      int v162 = v157;
    }
    else {
      int v162 = 0;
    }
    BOOL v163 = v162 != 1 || v575 >= 0xE;
    unsigned int v124 = v575 + 1;
  }
  while (!v163);
  if (v157)
  {
    double v164 = 0.0;
    int v14 = (int *)&unk_26AA2D000;
    BOOL v8 = v525;
    int v15 = &qword_26A9CA000;
    if (!v571)
    {
      v165 = &v651;
      uint64_t v166 = v109;
      do
      {
        double v167 = v165->f64[0];
        v165 = (float64x2_t *)((char *)v165 + 8);
        double v164 = v164 + v167 * v167;
        --v166;
      }
      while (v166);
    }
    if (v164 / (double)(int)v109 > 10000.0)
    {
      int v168 = 4;
      goto LABEL_170;
    }
    int v169 = 1;
  }
  else
  {
    int v168 = 2;
    int v14 = (_DWORD *)&unk_26AA2D000;
    BOOL v8 = v525;
    int v15 = &qword_26A9CA000;
LABEL_170:
    int v169 = 0;
    dword_26A9CC270 = v168;
  }
  int8x16_t __x = *(int8x16_t *)&v597[8];
  double v593 = 0.0;
  Geo2ECEF((uint64_t)&__x, (uint64_t)&WGS84_Datum, (double *)v729);
  *(_OWORD *)v597 = v729[0];
  *(void *)&v597[16] = *(void *)&v729[1];
  if (v109 && v169)
  {
    uint64_t v170 = 0;
    v171 = v680;
    while (1)
    {
      uint64_t v172 = 2;
      do
      {
        *((double *)&v737 + v172) = *((double *)v171 + v172) - *(double *)&v597[8 * v172];
        unint64_t v173 = v172-- + 1;
      }
      while (v173 > 1);
      uint64_t v174 = 0;
      double v175 = 0.0;
      do
      {
        double v175 = v175 + *(double *)&v597[v174] * *(double *)((char *)&v737 + v174);
        v174 += 8;
      }
      while (v174 != 24);
      double v176 = 0.0;
      uint64_t v177 = 2;
      do
      {
        double v176 = v176 + *(double *)&v597[8 * v177] * *(double *)&v597[8 * v177];
        unint64_t v178 = v177-- + 1;
      }
      while (v178 > 1);
      double v179 = v175 / sqrt(v176);
      if (v179 < 0.0)
      {
        double v180 = 0.0;
        uint64_t v181 = 2;
        do
        {
          double v180 = v180 + *((double *)&v737 + v181) * *((double *)&v737 + v181);
          unint64_t v182 = v181-- + 1;
        }
        while (v182 > 1);
        if (v179 / sqrt(v180) < -0.087155743) {
          break;
        }
      }
      ++v170;
      v171 = (_OWORD *)((char *)v171 + 24);
      if (v170 == v109) {
        goto LABEL_194;
      }
    }
    dword_26A9CC270 = 3;
LABEL_210:
    int v69 = 0;
    int8x16_t __x = 0uLL;
    double v1 = 0.0;
    double v2 = 0.0;
    double v3 = 0.0;
    double v593 = 0.0;
  }
  else
  {
    if (!v169) {
      goto LABEL_210;
    }
LABEL_194:
    int v183 = 1;
    int v184 = 6;
    uint64_t v185 = 2;
    int v186 = 6;
    unint64_t v187 = 1;
    do
    {
      unint64_t v188 = v187 - 1;
      unsigned int v189 = v187 + v187 * v187;
      uint64_t v190 = v187 + (v189 >> 1);
      unsigned int v191 = v189 >> 1;
      int v192 = v184;
      int v193 = v186;
      uint64_t v194 = v185;
      int v195 = v183;
      unint64_t v196 = v187;
      do
      {
        unsigned int v197 = v196 + v196 * v196;
        if (v187 == v196)
        {
          double v198 = *(double *)&v655.i64[v190];
          unsigned int v199 = v197 >> 1;
        }
        else
        {
          unsigned int v199 = v197 >> 1;
          double v200 = *(double *)&v655.i64[v196 + (v197 >> 1)];
          unsigned int v201 = v187 + (v197 >> 1);
          if (v187 >= v196) {
            unsigned int v201 = v191 + v196;
          }
          double v198 = v200 * *(double *)&v655.i64[v201];
        }
        unsigned int v202 = v192;
        int v203 = v193;
        uint64_t v204 = v194;
        unsigned int v205 = v195;
        do
        {
          unsigned int v206 = v205 + 1;
          unsigned int v207 = (v205 + 2) * (v205 + 1);
          double v208 = *(double *)&v655.i64[v204 + ((unint64_t)v202 >> 1)]
               * *(double *)&v655.i64[v187 + (v207 >> 1)];
          unsigned int v209 = v196 + (v207 >> 1);
          if (v206 <= v196) {
            unsigned int v209 = v206 + v199;
          }
          double v198 = v198 + v208 * *(double *)&v655.i64[v209];
          ++v204;
          v202 += v203;
          v203 += 2;
          unsigned int v205 = v206;
        }
        while (v206 < 3);
        *((double *)&v737 + 2 * v188 + v196 - 1) = v198;
        *((double *)&v737 + 2 * v196 + v188 - 2) = v198;
        ++v195;
        ++v194;
        v192 += v193;
        v193 += 2;
        BOOL v66 = v196 == 2;
        unint64_t v196 = 2;
      }
      while (!v66);
      ++v185;
      ++v183;
      v184 += v186;
      v186 += 2;
      unint64_t v187 = 2;
    }
    while (v185 != 4);
    double v210 = cos(*(long double *)__x.i64);
    double v1 = *(double *)&v737 * 4.06806316e13;
    double v2 = *((double *)&v738 + 1) * (v210 * v210 * 4.06806316e13);
    double v3 = fabs(v210) * 4.06806316e13 * *((double *)&v737 + 1);
    int v69 = 1;
  }
LABEL_211:
  if (v14[896] >= 5)
  {
    uint64_t v211 = mach_continuous_time();
    int32x4_t v212 = v530;
    v212.i32[1] = (unint64_t)(*((double *)v15 + 41) * (double)v211);
    int32x4_t v530 = v212;
  }
  if (!v69)
  {
    *(_OWORD *)v597 = v594;
    *(_OWORD *)&v597[16] = v595;
    long long v598 = v596;
LABEL_263:
    unint64_t v247 = 0;
    *(_OWORD *)v599 = xmmword_263D850D0;
    v248 = (const double *)v597;
    do
    {
      v607[0] = 0.0;
      BOOL v249 = R8_EQ(v248, v607);
      if (v247 > 3) {
        break;
      }
      ++v247;
      ++v248;
    }
    while (v249);
    uint64_t v250 = 0;
    char v251 = 0;
    uint64_t v252 = 0;
    long long v637 = 0u;
    long long v636 = 0u;
    long long v635 = 0u;
    long long v634 = 0u;
    long long v633 = 0u;
    long long v632 = 0u;
    long long v631 = 0u;
    long long v630 = 0u;
    long long v629 = 0u;
    long long v628 = 0u;
    long long v627 = 0u;
    long long v626 = 0u;
    long long v625 = 0u;
    long long v623 = 0u;
    long long v624 = 0u;
    long long v621 = 0u;
    long long v622 = 0u;
    long long v619 = 0u;
    long long v620 = 0u;
    long long v617 = 0u;
    long long v618 = 0u;
    long long v615 = 0u;
    long long v616 = 0u;
    long long v613 = 0u;
    long long v614 = 0u;
    long long v611 = 0u;
    long long v612 = 0u;
    long long v609 = 0u;
    long long v610 = 0u;
    long long v608 = 0u;
    memset(v607, 0, sizeof(v607));
    v646[1] = 0;
    v646[0] = 0;
    int v647 = 0;
    memset(v729, 0, 20);
    v253 = v531;
    v254 = &(*v531)[2];
    do
    {
      if (*(v254 - 2) && *(v254 - 1) && *v254)
      {
        uint64_t v255 = (v252 + 1);
        if ((int)v252 <= 4) {
          v251 |= *(unsigned char *)(v577 + v250) == 2;
        }
      }
      else
      {
        uint64_t v255 = v252;
      }
      ++v250;
      v254 += 3;
      uint64_t v252 = v255;
    }
    while (v250 != 128);
    if ((int)v255 < 1) {
      goto LABEL_300;
    }
    unint64_t v256 = 0;
    int v257 = 0;
    int v258 = 0;
    int v259 = 1;
    unint64_t v260 = v255;
    while (1)
    {
      int v261 = v558[v256];
      if (v261 == 1) {
        break;
      }
      if (v261 == 2)
      {
        int v264 = *v558;
        if (v264 == 3) {
          goto LABEL_284;
        }
        if (v264 == 2)
        {
          int v264 = 6;
LABEL_284:
          *((_DWORD *)v607 + v256) = v264;
        }
        ++v257;
LABEL_293:
        if (v256 >= 5) {
          goto LABEL_298;
        }
LABEL_296:
        int v263 = 5;
        int v262 = 2;
LABEL_297:
        *((_DWORD *)v646 + v256) = v262;
        v259 *= v263;
        goto LABEL_298;
      }
      if (v261 == 3)
      {
        ++v258;
        *((_DWORD *)v607 + v256) = 0;
        if (v256 < 5)
        {
          int v262 = 0;
          int v263 = 1;
          goto LABEL_297;
        }
      }
      else
      {
        *((_DWORD *)v607 + v256) = 22;
        if (v256 <= 4) {
          goto LABEL_296;
        }
      }
LABEL_298:
      if (v255 == ++v256)
      {
        if ((int)v255 < 4)
        {
LABEL_300:
          BOOL v268 = 0;
          goto LABEL_602;
        }
        if ((int)v255 >= 5) {
          uint64_t v269 = 5;
        }
        else {
          uint64_t v269 = v255;
        }
        char v270 = v258 + v257 >= (int)v269 || v249;
        char v545 = v251;
        int v549 = v255;
        int v548 = v259;
        int v553 = v258;
        unsigned int v572 = v269;
        if (v270)
        {
LABEL_308:
          uint32x4_t v653 = 0uLL;
          v654.i32[0] = 0;
        }
        else
        {
          uint64_t v467 = 0;
          *(int32x2_t *)v676.i8 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)v597));
          v676.i32[2] = (int)*(double *)&v597[16];
          do
          {
            *(_DWORD *)((char *)v680 + v467 * 4) = v676.i32[v467] / 1000;
            ++v467;
          }
          while (v467 != 3);
          uint64_t v468 = 0;
          int v469 = 0;
          char v470 = 1;
          v471 = v531;
          do
          {
            uint64_t v472 = 0;
            unsigned int v473 = 0;
            do
            {
              int v474 = (*v471)[v472] / 1000 - *(_DWORD *)((char *)v680 + v472 * 4);
              v473 += v474 * v474;
              ++v472;
            }
            while (v472 != 3);
            int v475 = v537[v468] / -1000;
            int v476 = U4sqrt(v473);
            if (!v468)
            {
              v653.i32[0] = 0;
              int v469 = v475 + v476;
            }
            int v477 = *((_DWORD *)v607 + v468);
            if (v477 < 1)
            {
              int v478 = 0;
            }
            else
            {
              int v478 = (437 * (v475 + v476 - v469) + 65550) >> 17;
              if (v478 >= 0) {
                unsigned int v479 = (437 * (v475 + v476 - v469) + 65550) >> 17;
              }
              else {
                unsigned int v479 = -v478;
              }
              v470 &= v479 <= v477;
            }
            v253 = v531;
            v653.i32[v468++] = v478;
            ++v471;
          }
          while (v468 != v269);
          if ((v470 & 1) == 0)
          {
            LODWORD(v255) = v549;
            if (g_Logging_Cfg >= 5) {
              EvLog_VecI4("SearchPrLs: CheckFit   FAIL , Unused msCorr_Fit: ", v269, v653.i32);
            }
            goto LABEL_308;
          }
          LODWORD(v255) = v549;
          if (g_Logging_Cfg >= 5) {
            EvLog_VecI4("SearchPrLs: CheckFit    OK , msCorr_Fit: ", v269, v653.i32);
          }
          uint64_t v480 = 0;
          char v481 = 0;
          do
          {
            int v482 = v653.i32[v480];
            if (v482 >= 0) {
              int v483 = v653.i32[v480];
            }
            else {
              int v483 = -v482;
            }
            int v484 = *(_DWORD *)((char *)v646 + v480 * 4);
            int v485 = v483 + v484;
            int v486 = *(_DWORD *)((char *)v607 + v480 * 4);
            if (v485 > v486)
            {
              __int32 v487 = v484 - v486;
              __int32 v488 = v486 - v484;
              if (v482 > 0) {
                __int32 v487 = v488;
              }
              v653.i32[v480] = v487;
              char v481 = 1;
            }
            ++v480;
          }
          while (v269 != v480);
          if ((v481 & (g_Logging_Cfg > 4)) == 1) {
            EvLog_VecI4("SearchPrLs: CheckFit    OK ADJ , msCorr_Fit: ", v269, v653.i32);
          }
        }
        uint64_t v271 = 0;
        uint64_t v576 = (v269 - 1);
        v272 = &(*v253)[2];
        do
        {
          v273 = (float64x2_t *)((char *)v680 + v271);
          uint64_t v274 = *((void *)v272 - 1);
          v275.i64[0] = (int)v274;
          v275.i64[1] = SHIDWORD(v274);
          float64x2_t *v273 = vcvtq_f64_s64(v275);
          int v276 = *v272;
          v272 += 3;
          v273[1].f64[0] = (double)v276;
          v271 += 24;
        }
        while (24 * v269 != v271);
        long long v737 = 0uLL;
        LODWORD(v738) = 0;
        if (v258 >= 1)
        {
          if (v258 >= (int)v269) {
            uint64_t v277 = v269;
          }
          else {
            uint64_t v277 = v258;
          }
          v278 = v736;
          v279 = v537;
          do
          {
            int v280 = *v279++;
            *v278++ = (double)v280;
            --v277;
          }
          while (v277);
        }
        int v579 = 0;
        int v281 = 0;
        v564 = &v736[v258];
        uint64_t v566 = v269 - v258;
        v561 = (char *)v729 + 4 * v258;
        v563 = &v537[v258];
        v556 = (char *)&v737 + 4 * v258;
        v559 = &v653.i8[4 * v258];
        uint64_t v282 = v258;
        int v551 = v646[0];
        uint64_t v283 = *(void *)&v597[24];
        while (2)
        {
          LODWORD(v644.f64[0]) = 0;
          LODWORD(v642.f64[0]) = 0;
          if (v258 < (int)v269)
          {
            v284 = (int *)v556;
            v285 = v559;
            v286 = v561;
            v287 = v563;
            v288 = v564;
            uint64_t v289 = v566;
            do
            {
              int v291 = *v284++;
              int v290 = v291;
              int v292 = *(_DWORD *)v285;
              v285 += 4;
              int v293 = v292 + v290;
              *v286++ = v293;
              int v294 = *v287++;
              *v288++ = (double)(v294 + 299792 * v293);
              --v289;
            }
            while (v289);
          }
          ++v579;
          v667.i64[1] = v283;
          uint32x4_t v666 = *(uint32x4_t *)v597;
          v667.i64[0] = *(void *)&v597[16];
          if (!CompPr_LSQ4((double (*)[3])v680, v736, v269, (double *)v666.i64, (int *)&v644, (unsigned int *)&v642, v651.f64))
          {
            char v313 = 0;
            goto LABEL_355;
          }
          int v569 = v281;
          if (v255 >= 6)
          {
            uint64_t v295 = 0;
            unsigned int v296 = 0;
            double v297 = *(double *)v666.i64;
            v586[0] = (int)*(double *)v666.i64 / 1000;
            v586[1] = (int)*(double *)&v666.i64[1] / 1000;
            v586[2] = (int)*(double *)v667.i64 / 1000;
            do
            {
              unsigned int v298 = (*v253)[v295] / 1000 - v586[v295];
              v296 += v298 * v298;
              ++v295;
            }
            while (v295 != 3);
            uint64_t v299 = 0;
            int v300 = *v537 / 1000 - U4sqrt(v296);
            v301 = v253;
            do
            {
              uint64_t v302 = 0;
              unsigned int v303 = 0;
              signed int v305 = *((_DWORD *)v607 + v299);
              do
              {
                unsigned int v306 = (*v301)[v302] / 1000 - v586[v302];
                v303 += v306 * v306;
                ++v302;
              }
              while (v302 != 3);
              int v304 = v537[v299];
              signed int v307 = v300 + v304 / -1000 + U4sqrt(v303);
              if (v307 < 0) {
                signed int v307 = -v307;
              }
              if (v307 < 0x97)
              {
                signed int v310 = 0;
              }
              else
              {
                if (v307 >= 450) {
                  int v308 = 450;
                }
                else {
                  int v308 = v307;
                }
                unsigned int v309 = v307 - v308 + 299;
                signed int v307 = v307 - 300 * (v309 / 0x12C) - 300;
                signed int v310 = v309 / 0x12C + 1;
              }
              v253 = v531;
              if (v307 < 0) {
                signed int v307 = -v307;
              }
              BOOL v312 = v310 > v305 || v307 > 0xF;
              if (++v299 >= v260) {
                break;
              }
              ++v301;
            }
            while (!v312);
            if (v312)
            {
              EvLog_v("SearchPrLs:  BAD %d %d %d  %g %g %g   ClkB %g   ResSq %d", v299, v579, v548, v651.f64[0] * 57.2957795, v651.f64[1] * 57.2957795, v652, v297, LODWORD(v642.f64[0]));
              char v313 = 0;
              LODWORD(v255) = v549;
              int v258 = v553;
              LODWORD(v269) = v572;
              goto LABEL_354;
            }
            LODWORD(v255) = v549;
            int v258 = v553;
            LODWORD(v269) = v572;
          }
          int v314 = LODWORD(v642.f64[0]);
          if (LODWORD(v642.f64[0]) <= 0x57E3)
          {
            dword_26A9CC280 = LODWORD(v642.f64[0]);
            if (g_Logging_Cfg >= 5)
            {
              EvLog_v("SearchPrLs: GOOD %d %d %d  %g %g %g   ClkB %g  ResSq %d", v269, v579, v548, v651.f64[0] * 57.2957795, v651.f64[1] * 57.2957795, v652, *(double *)v666.i64, LODWORD(v642.f64[0]));
              EvLog_VecI4("SearchPrLs: GOOD msCorr", v269, (int *)v729);
            }
            int8x16_t __x = (int8x16_t)v651;
            double v593 = v652;
            char v313 = 1;
LABEL_354:
            int v281 = v569;
LABEL_355:
            int v315 = LODWORD(v644.f64[0]);
            int v316 = (*((_DWORD *)&v737 + v576) < 1) - *((_DWORD *)&v737 + v576);
            *((_DWORD *)&v737 + v576) = v316;
            if ((int)v576 > v258)
            {
              uint64_t v317 = v576;
              do
              {
                if (v316 <= *((_DWORD *)v646 + v317)) {
                  break;
                }
                v318 = (char *)&v737 + 4 * v317;
                int v316 = (*((_DWORD *)v318 - 1) < 1) - *((_DWORD *)v318 - 1);
                *(void *)(v318 - 4) = v316;
                --v317;
              }
              while (v317 > v282);
            }
            v281 += v315;
            if (v258)
            {
              if (v258 >= (int)v269) {
                goto LABEL_380;
              }
              int v319 = *((_DWORD *)&v737 + v282);
              int v320 = *((_DWORD *)v646 + v282);
            }
            else
            {
              int v319 = v737;
              int v320 = v551;
            }
            if (v313 & 1 | (v319 > v320) || v281 > 149)
            {
LABEL_380:
              if (v313)
              {
                char v323 = v281;
                BOOL v268 = 1;
                int v14 = (_DWORD *)&unk_26AA2D000;
                BOOL v8 = v525;
                int v15 = &qword_26A9CA000;
                char v324 = v545;
              }
              else
              {
                if ((int)v255 >= 5) {
                  unsigned int v489 = 250000 * v269;
                }
                else {
                  unsigned int v489 = 22500;
                }
                dword_26A9CC280 = LODWORD(v599[0]);
                int v14 = (int *)&unk_26AA2D000;
                BOOL v8 = v525;
                int v15 = &qword_26A9CA000;
                char v324 = v545;
                if (LODWORD(v599[0]) >= v489)
                {
                  char v323 = v281;
                  if (g_Logging_Cfg >= 5) {
                    EvLog_v("SearchPrLs: FAIL %d %d %d", v579, v548, v281);
                  }
                  BOOL v268 = 0;
                }
                else
                {
                  char v323 = v281;
                  int8x16_t __x = v676;
                  double v593 = *(double *)v677;
                  if (g_Logging_Cfg >= 5) {
                    EvLog_v("SearchPrLs:   OK %d %d %d  %g %g %g   ClkB %g  ResSq %d", v572, v579, v548, *(double *)__x.i64 * 57.2957795, *(double *)&__x.i64[1] * 57.2957795, v593, *(double *)v666.i64, LODWORD(v599[0]));
                  }
                  BOOL v268 = 1;
                }
              }
              byte_26A9CC284 = v324 & 1;
              byte_26A9CC27B = v268;
              byte_26A9CC27C = v323;
              goto LABEL_602;
            }
            continue;
          }
          break;
        }
        if (LODWORD(v642.f64[0]) < LODWORD(v599[0]))
        {
          uint64_t v321 = 0;
          goto LABEL_372;
        }
        if (LODWORD(v642.f64[0]) < HIDWORD(v599[0]))
        {
          uint64_t v321 = 1;
          goto LABEL_372;
        }
        if (LODWORD(v642.f64[0]) >= LODWORD(v599[1]))
        {
          if (LODWORD(v642.f64[0]) >= HIDWORD(v599[1]))
          {
            char v313 = 0;
            int v281 = v569;
            goto LABEL_355;
          }
          uint64_t v321 = 3;
        }
        else
        {
          uint64_t v321 = 2;
LABEL_372:
          memmove(&v677[6 * v321 + 2], (char *)&v676 + 24 * v321, 24 * (v321 ^ 3));
          memmove((void *)(((unint64_t)v599 | (4 * v321)) + 4), (const void *)((unint64_t)v599 | (4 * v321)), 4 * (v321 ^ 3));
          v253 = v531;
        }
        v322 = (double *)&v676.i64[3 * v321];
        *(float64x2_t *)v322 = v651;
        v322[2] = v652;
        *(_DWORD *)((unint64_t)v599 | (4 * v321)) = v314;
        if (g_Logging_Cfg < 5)
        {
          char v313 = 0;
          LODWORD(v269) = v572;
        }
        else
        {
          LODWORD(v269) = v572;
          EvLog_v("SearchPrLs: WAIT %d %d %d  %g %g %g   ClkB %g  ResSq %d", v572, v579, v548, v651.f64[0] * 57.2957795, v651.f64[1] * 57.2957795, v652, *(double *)v666.i64, LODWORD(v599[0]));
          EvLog_VecI4("SearchPrLs: WAIT msCorr", v572, (int *)v729);
          char v313 = 0;
        }
        int v281 = v569;
        int v258 = v553;
        goto LABEL_355;
      }
    }
    int v265 = *v558;
    if (v265 == 2) {
      int v266 = 14;
    }
    else {
      int v266 = 22;
    }
    if (v265 == 3) {
      int v267 = 11;
    }
    else {
      int v267 = v266;
    }
    *((_DWORD *)v607 + v256) = v267;
    goto LABEL_293;
  }
  Comp_ErrorEllipse(v1, v2, v3, (double *)&v583, (double *)&v583 + 1, (double *)&v584);
  xmmword_26A9CC260 = (__int128)__x;
  if (v523 >= 5) {
    int v213 = 5;
  }
  else {
    int v213 = v523;
  }
  if (v213 <= 3) {
    int v213 = 3;
  }
  double v214 = User_Velocity_Compensation[v213 - 3];
  double v215 = *(double *)&v583 * v214;
  double v216 = v214 * *((double *)&v583 + 1);
  *(double *)&long long v583 = v215;
  *((double *)&v583 + 1) = v216;
  double v217 = v215 * 0.00000320473867;
  double v218 = v215 * 0.00000320473867 * v216;
  if (v523 >= 8)
  {
    double v219 = v218 * 0.0016;
    double v220 = 2.0;
    if (v218 * 0.0016 <= 2500.0 && v219 * 4.0 >= 2500.0) {
      double v220 = sqrt(2500.0 / v219);
    }
    double v215 = v215 * v220;
    *(double *)&long long v583 = v215;
    double v221 = v216 * v220;
    goto LABEL_227;
  }
  double v221 = 200000.0;
  if (v215 < 200000.0)
  {
    *(void *)&long long v583 = 0x41086A0000000000;
    double v221 = 200000.0;
    double v215 = 200000.0;
    goto LABEL_227;
  }
  if (v216 < 200000.0 && v218 < 1562500.0)
  {
    if (v217 * 200000.0 > 1562500.0) {
      double v221 = 1562500.0 / v217;
    }
LABEL_227:
    *((double *)&v583 + 1) = v221;
    double v216 = v221;
  }
  if (v216 * (v215 * 3.14159265) * 0.000001 > 1562500.0) {
    goto LABEL_263;
  }
  float64x2_t v578 = (float64x2_t)__x;
  memset(v599, 0, sizeof(v599));
  double v222 = *(double *)&v584;
  bzero(&v676, 0x4A0uLL);
  uint64_t v223 = 0;
  long long v735 = 0u;
  long long v734 = 0u;
  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  unsigned int v224 = -83886080;
  memset(v729, 0, sizeof(v729));
  do
  {
    v225 = (int32x2_t *)&v676.i8[v223];
    int32x2_t *v225 = 0;
    v225[1] = vdup_n_s32(v224);
    v223 += 148;
    v224 += 0x10000;
  }
  while (v223 != 1184);
  uint64_t v226 = 0;
  int v227 = 0;
  unsigned __int8 v228 = 0;
  int v547 = 0;
  v229 = v607;
  v230 = v680;
  v231 = v531;
  do
  {
    uint64_t v232 = v531[v226][0];
    if (v232)
    {
      uint64_t v232 = v531[v226][1];
      if (v232)
      {
        uint64_t v232 = v531[v226][2];
        if (v232)
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            int v234 = (*v231)[i];
            if (v234 > 0) {
              int v235 = 500;
            }
            else {
              int v235 = -500;
            }
            *((_DWORD *)v230 + i) = (v235 + v234) / 1000;
            v229[i] = (double)v234;
          }
          uint64_t v236 = 274877907 * (v537[v226] + 500);
          *((_DWORD *)v646 + v226) = (v236 >> 38) + ((unint64_t)v236 >> 63);
          if (*(_DWORD *)(v555 + 4 * v226) == 1)
          {
            ++v228;
            int v237 = 250000;
          }
          else
          {
            int v237 = 2250000;
          }
          v227 += v237;
          uint64_t v232 = ++v547;
        }
      }
    }
    ++v226;
    v229 += 3;
    v230 = (_OWORD *)((char *)v230 + 12);
    ++v231;
  }
  while (v226 != 128);
  double v238 = v222 * 0.0174532925;
  if (v547 >= 1)
  {
    uint64_t v239 = 0;
    while (1)
    {
      int v240 = v558[v239];
      if (v240 == 1) {
        break;
      }
      if (v240 == 3)
      {
        char v242 = 0;
        goto LABEL_256;
      }
      if (v240 != 2) {
        break;
      }
      int v241 = *v558;
      if (v241 == 3)
      {
        char v242 = 2;
        goto LABEL_256;
      }
      if (v241 == 2)
      {
        char v242 = 4;
LABEL_256:
        *((unsigned char *)v729 + v239) = v242;
      }
      if (v547 == ++v239) {
        goto LABEL_258;
      }
    }
    char v242 = 22;
    goto LABEL_256;
  }
LABEL_258:
  *(int32x2_t *)&v599[0] = vmovn_s64(vcvtq_n_s64_f64(v578, 0xFuLL));
  unsigned int v243 = LODWORD(v599[0]);
  if (SLODWORD(v599[0]) < 0) {
    unsigned int v243 = -LODWORD(v599[0]);
  }
  LODWORD(v232) = vcvtd_n_s64_f64(v238, 0xFuLL);
  LODWORD(v599[1]) = ((40839 * (v243 >> 1)) >> 14) + 6335439;
  HIDWORD(v599[1]) = v232;
  Taylor_sin_cos(v232, (int *)&v599[2], (int *)&v599[2] + 1);
  uint64_t v244 = HIDWORD(v599[1]);
  unsigned __int8 v521 = v228;
  int v522 = v227;
  if (v238 < 0.785398163 || v238 > 2.35619449)
  {
    double v245 = -v238;
    uint64_t v244 = (HIDWORD(v599[1]) - 51472);
    double v246 = v216;
  }
  else
  {
    double v245 = 1.57079633 - v238;
    double v246 = v215;
    double v215 = v216;
  }
  Taylor_sin_cos(v244, (int *)&v599[2], (int *)&v599[2] + 1);
  double v325 = v215 * v215;
  double v326 = v215 * v215 / (v246 * v246);
  double v327 = tan(v245);
  double v328 = v326 + v327 * v327;
  int v329 = (int)(v246 * sqrt(v328));
  *(double *)v330.i64 = cos(v245);
  int v332 = v547;
  if (v329 >= 1)
  {
    int v529 = (int)(25000.0 / fabs(*(double *)v330.i64));
    int v528 = v329 - v529;
    int v533 = SLODWORD(v599[1]) >> 6;
    int v534 = LODWORD(v599[2]);
    double v333 = v325 * v328;
    int v334 = HIDWORD(v599[2]);
    int v532 = HIDWORD(v599[2]);
    double v335 = v599[0];
    int v542 = xmmword_26A9CC288;
    int v543 = DWORD2(xmmword_26A9CC288);
    int v544 = DWORD1(xmmword_26A9CC288);
    int v541 = DWORD1(gDebug);
    int v570 = gDebug;
    int v336 = 0;
    int v554 = v329;
    do
    {
      double v337 = (double)v336;
      double v338 = v333 + -(v337 * v337) * v326;
      if (v338 < 0.0) {
        double v338 = 0.0;
      }
      int v339 = (int)(v327 * (1.0 / v328) * v337);
      int v340 = (int)(1.0 / v328 * sqrt(v338));
      int v535 = v340;
      int v536 = -v336;
      int v341 = 1;
      int v540 = v336;
      while (1)
      {
        LODWORD(v642.f64[0]) = 0;
        LODWORD(v640.f64[0]) = 0;
        unsigned int v539 = v341;
        if (v341 == 2) {
          int v342 = -v339;
        }
        else {
          int v342 = v339;
        }
        int v343 = v340 - v342;
        if (v341 == 2) {
          int v336 = v536;
        }
        int v344 = v343 >> 9;
        int v345 = (v336 + (int)(v327 * (double)(v340 - v342))) >> 9;
        int v346 = LODWORD(v335) + 8 * ((v334 * (v343 >> 9) - v345 * v534) / v533);
        LODWORD(v347) = 102944 - v346;
        if (v346 <= 51472) {
          LODWORD(v347) = LODWORD(v335) + 8 * ((v334 * (v343 >> 9) - v345 * v534) / v533);
        }
        uint64_t v347 = v346 >= -51472 ? v347 : (-102944 - v346);
        unsigned int v348 = (int)v347 >= 0 ? v347 : -(int)v347;
        if (v348 >> 8 > 0xC8) {
          break;
        }
        int v538 = v342;
        int v349 = -v340 - v342;
        int v580 = v336 + (int)(v327 * (double)v349);
        int v546 = v347;
        Taylor_sin_cos(v347, (int *)&v642, (int *)&v640);
        int v350 = LODWORD(v640.f64[0]);
        int v552 = LODWORD(v640.f64[0]);
        if (SLODWORD(v640.f64[0]) < 0) {
          int v350 = -LODWORD(v640.f64[0]);
        }
        unsigned int v351 = ((99658 * v350) >> 15) * (((17965 * v348) >> 23) | 0x8000);
        int v352 = 8 * ((v534 * v344 + v345 * v334) / (int)(v351 >> 15));
        LODWORD(v353) = HIDWORD(v335) + v352;
        int v354 = (v534 * (v349 >> 9) + (v580 >> 9) * v334) / (int)(v351 >> 15);
        unsigned int v355 = HIDWORD(v335) + 8 * v354;
        BOOL v356 = v352 <= 8 * v354;
        if (v352 <= 8 * v354) {
          int v357 = HIDWORD(v335) + 8 * v354;
        }
        else {
          int v357 = HIDWORD(v335) + v352;
        }
        if (v356) {
          uint64_t v353 = v353;
        }
        else {
          uint64_t v353 = v355;
        }
        signed int v358 = 102944;
        uint64_t v359 = 4294864352;
        if (v357 - (int)v353 <= 205887)
        {
          if ((int)v353 >= -205887)
          {
            if (v357 <= 205886)
            {
              signed int v358 = v357;
              uint64_t v359 = v353;
            }
            else
            {
              signed int v358 = v357 % 0x3243Fu;
              uint64_t v359 = v353 - 205887 * (v357 / 0x3243Fu);
            }
          }
          else
          {
            unsigned int v360 = -(int)v353 % 0x3243Fu;
            uint64_t v359 = -v360;
            signed int v358 = v357 - v353 - v360;
          }
        }
        int v361 = LODWORD(v642.f64[0]);
        unsigned int v362 = 0x18EA2312 / U4sqrt(~(4 * v361 * v361 / 0x95u));
        if (v332 >= 1)
        {
          unint64_t v363 = v547 + 1;
          do
          {
            unsigned int v364 = v363 - 2;
            int v365 = *((_DWORD *)v680 + 3 * (v363 - 2) + 2)
                 - ((int)((v362 - ((112313 * v362 + 0x1000000) >> 24)) * v361) >> 15);
            v666.i32[v364] = v365 * v361;
            *((_DWORD *)v736 + v364) = v365 * v365;
            --v363;
          }
          while (v363 > 1);
        }
        int v366 = v554;
        if ((int)v359 <= v358)
        {
          uint64_t v367 = v359;
          unsigned int v565 = v346 - 51473;
          int v550 = (int)(v362 * v552 + 0x8000) >> 15;
          unsigned int v562 = 0x30D40000 / (v351 >> 9);
          signed int v560 = v358 - v562;
          signed int v567 = v358;
          while (1)
          {
            v586[0] = 0;
            LODWORD(v644.f64[0]) = 0;
            long long v744 = 0u;
            long long v743 = 0u;
            long long v742 = 0u;
            long long v741 = 0u;
            uint32x4_t v740 = 0u;
            uint32x4_t v739 = 0u;
            int v368 = 205887;
            long long v738 = 0u;
            long long v737 = 0u;
            if ((int)v367 < -102944 || (int v368 = -205887, v369 = v367, (int)v367 > 102943)) {
              uint64_t v369 = (v368 + v367);
            }
            if (v565 < 0xFFFE6DDF)
            {
              if ((v369 & 0x80000000) != 0) {
                uint64_t v369 = (v369 + 102944);
              }
              else {
                uint64_t v369 = (v369 - 102944);
              }
            }
            Taylor_sin_cos(v369, (int *)v586, (int *)&v644);
            int v573 = v367;
            if (v332 < 1)
            {
              unsigned int v387 = 0;
              __int32 v388 = 0;
LABEL_452:
              uint64_t v389 = 0;
              unsigned int v390 = 1000000 * v387;
              v391 = v677;
              while (1)
              {
                unsigned int v392 = HIBYTE(v676.i32[37 * v389 + 2]);
                if (v332 < 1 || v392 > 0xFA) {
                  break;
                }
                uint64_t v393 = 0;
                do
                {
                  int v394 = *((unsigned __int8 *)v391 + v393);
                  int v395 = *((unsigned __int8 *)&v737 + v393++);
                }
                while (v393 < v547 && v394 == v395);
                if (v394 == v395) {
                  goto LABEL_463;
                }
                ++v389;
                v391 += 37;
                if (v389 == 8) {
                  goto LABEL_473;
                }
              }
              if (v392 < 0xFB)
              {
LABEL_463:
                if ((v389 & 0x80000000) == 0)
                {
                  uint64_t v396 = v389;
                  v397 = &v676.i32[37 * v389];
                  v399 = (unsigned int *)(v397 + 2);
                  unsigned int v398 = v397[2];
                  if (v390 < v398) {
                    unsigned int v398 = v390;
                  }
                  unsigned int *v399 = v398 >> 1;
                  if (!v389)
                  {
                    int v366 = v554;
                    goto LABEL_491;
                  }
                  uint64_t v400 = 0;
                  int v401 = v567;
                  do
                  {
                    if (*v399 >= v676.i32[37 * v400 + 2])
                    {
                      ++v400;
                    }
                    else
                    {
                      uint32x4_t v402 = *((uint32x4_t *)v397 + 7);
                      v403 = (uint32x4_t *)((char *)&v676 + 148 * v400);
                      uint32x4_t v659 = *((uint32x4_t *)v397 + 6);
                      uint32x4_t v660 = v402;
                      uint32x4_t v661 = *((uint32x4_t *)v397 + 8);
                      LODWORD(v662) = v397[36];
                      uint32x4_t v404 = *((uint32x4_t *)v397 + 3);
                      uint32x4_t v655 = *((uint32x4_t *)v397 + 2);
                      uint32x4_t v656 = v404;
                      uint32x4_t v405 = *((uint32x4_t *)v397 + 5);
                      uint32x4_t v657 = *((uint32x4_t *)v397 + 4);
                      uint32x4_t v658 = v405;
                      uint32x4_t v406 = *((uint32x4_t *)v397 + 1);
                      uint64_t v407 = v400 + 1;
                      uint32x4_t v653 = *(uint32x4_t *)v397;
                      uint32x4_t v654 = v406;
                      memmove((char *)v403[9].i64 + 4, v403, 148 * (v396 - v400));
                      uint32x4_t v408 = v660;
                      v403[6] = v659;
                      v403[7] = v408;
                      v403[8] = v661;
                      v403[9].i32[0] = v662;
                      uint32x4_t v409 = v656;
                      v403[2] = v655;
                      v403[3] = v409;
                      uint32x4_t v410 = v658;
                      v403[4] = v657;
                      v403[5] = v410;
                      uint32x4_t v330 = v653;
                      uint32x4_t v331 = v654;
                      uint64_t v400 = v407;
                      uint32x4_t *v403 = v653;
                      v403[1] = v331;
                    }
                  }
                  while (v400 != v396);
                  int v366 = v554;
                  int v411 = v573;
                  goto LABEL_492;
                }
              }
LABEL_473:
              uint64_t v412 = 0;
              __int32 v413 = v546;
              while (v390 >= v676.i32[v412 + 2])
              {
                v412 += 37;
                if (v412 == 296) {
                  goto LABEL_491;
                }
              }
              if (v412 != 259)
              {
                memmove(&v678[v412], &v676.i8[v412 * 4], 1036 - v412 * 4);
                __int32 v413 = v546;
              }
              v414 = &v676.i32[v412];
              v414[1] = v369;
              v414[2] = v390;
              __int32 *v414 = v413;
              long long v415 = v742;
              *((_OWORD *)v414 + 5) = v741;
              *((_OWORD *)v414 + 6) = v415;
              long long v416 = v744;
              *((_OWORD *)v414 + 7) = v743;
              *((_OWORD *)v414 + 8) = v416;
              long long v417 = v738;
              *((_OWORD *)v414 + 1) = v737;
              *((_OWORD *)v414 + 2) = v417;
              uint32x4_t v330 = v739;
              uint32x4_t v331 = v740;
              *((uint32x4_t *)v414 + 3) = v739;
              *((uint32x4_t *)v414 + 4) = v331;
              v414[36] = v388;
              goto LABEL_491;
            }
            int v557 = v369;
            uint64_t v370 = 0;
            int v371 = 0;
            int v372 = 0;
            int v581 = (LODWORD(v644.f64[0]) * v550) >> 15;
            signed int v373 = (signed int)(v586[0] * v550) >> 15;
            int v374 = (LODWORD(v644.f64[0]) * v552) >> 15;
            signed int v375 = (signed int)(v586[0] * v552) >> 15;
            v376 = (_DWORD *)v680 + 1;
            do
            {
              int v377 = *(v376 - 1) - v581;
              int v378 = *v376 - v373;
              int v379 = v666.i32[v370] + v377 * v374 + v378 * v375;
              int v380 = U4sqrt(v377 * v377 + v378 * v378 + *((_DWORD *)v736 + v370));
              if (v379 < 0 && v379 / v380 <= -2857)
              {
                DWORD1(gDebug) = ++v541;
                int v332 = v547;
                int v366 = v554;
LABEL_491:
                int v401 = v567;
                int v411 = v573;
                goto LABEL_492;
              }
              if (!v370) {
                int v371 = LODWORD(v646[0]) - v380;
              }
              int v381 = *((_DWORD *)v646 + v370) - v380 - v371;
              unsigned int v382 = *((unsigned __int8 *)v729 + v370);
              if (*((unsigned char *)v729 + v370))
              {
                int v383 = (437 * v381 + 65550) >> 17;
                if (v383 >= 0) {
                  unsigned int v384 = (437 * v381 + 65550) >> 17;
                }
                else {
                  unsigned int v384 = -v383;
                }
                *((unsigned char *)&v737 + v370) = v383;
                if (v384 > v382)
                {
                  DWORD2(xmmword_26A9CC288) = ++v543;
LABEL_481:
                  int v332 = v547;
                  int v366 = v554;
                  goto LABEL_491;
                }
                v381 -= (613975 * v383) >> 11;
              }
              *((_DWORD *)v651.f64 + v370) = v381;
              if (v381 >= 0) {
                unsigned int v385 = v381;
              }
              else {
                unsigned int v385 = -v381;
              }
              if (v385 >= 0x1A)
              {
                DWORD1(xmmword_26A9CC288) = ++v544;
                goto LABEL_481;
              }
              v376 += 3;
              v372 += v381;
              ++v370;
            }
            while (v547 != v370);
            int v332 = v547;
            if (v547 >= 15) {
              int v386 = v372 / v547;
            }
            else {
              int v386 = (v372 * num_SV_Div_Table[v547]) >> 15;
            }
            int v366 = v554;
            int v411 = v573;
            LODWORD(v369) = v557;
            unsigned int v387 = 0;
            __int32 v388 = v386 + v371;
            v418 = &v651;
            uint64_t v419 = v547;
            int v401 = v567;
            do
            {
              int v420 = LODWORD(v418->f64[0]);
              v418 = (float64x2_t *)((char *)v418 + 4);
              v387 += (v420 - v386) * (v420 - v386);
              if (v387 > 225 * v547)
              {
                LODWORD(xmmword_26A9CC288) = ++v542;
                goto LABEL_492;
              }
              --v419;
            }
            while (v419);
            if (v387 <= 0x1072) {
              goto LABEL_452;
            }
LABEL_492:
            ++v570;
            signed int v421 = v560;
            if (v411 >= v401 || v411 <= v560) {
              signed int v421 = v411;
            }
            uint64_t v367 = v421 + v562;
            if ((int)v367 > v401)
            {
              LODWORD(gDebug) = v570;
              break;
            }
          }
        }
        int v336 = v540;
        int v334 = v532;
        int v339 = v538;
        int v340 = v535;
        if (v540)
        {
          int v341 = v539 + 1;
          int v336 = v540;
          if (v539 < 2) {
            continue;
          }
        }
        goto LABEL_504;
      }
      EvLog_d("SearchEllipse: Stop Candidate search near the poles - ", v347);
      int v542 = xmmword_26A9CC288;
      int v543 = DWORD2(xmmword_26A9CC288);
      int v544 = DWORD1(xmmword_26A9CC288);
      int v366 = v554;
      int v541 = DWORD1(gDebug);
      int v570 = gDebug;
      int v336 = v554;
LABEL_504:
      if (v336 < v366 && v336 > v528) {
        int v336 = v528;
      }
      v336 += v529;
    }
    while (v336 < v366);
  }
  if (v676.i32[2] < 0xFB000000)
  {
    uint64_t v424 = 0;
    v425 = (char *)v677;
    uint32x4_t v330 = (uint32x4_t)vdupq_n_s64(0x3F00000000000000uLL);
    *(uint32x4_t *)v574 = v330;
    do
    {
      v426 = &v676.i32[37 * v424];
      v428 = v426 + 2;
      unsigned int v427 = v426[2];
      if (v427 >= 0xFB000000) {
        break;
      }
      v586[0] = 0;
      v429.i64[0] = (int)*(void *)v426;
      v429.i64[1] = (int)HIDWORD(*(void *)v426);
      float64x2_t v582 = vcvtq_f64_s64(v429);
      float64x2_t v651 = vmulq_f64(v582, *(float64x2_t *)v574);
      double v652 = 0.0;
      Geo2ECEF((uint64_t)&v651, (uint64_t)&WGS84_Datum, (double *)v653.i64);
      int v430 = 1000 * v677[37 * v424 + 32];
      uint32x4_t v666 = v653;
      *(double *)&v667.i64[1] = (double)v430;
      v667.i64[0] = v654.i64[0];
      EvLog_v("SearchEllipse: Best Points: %d  %g %g  %u", v547, 0.00174852843 * v582.f64[0], vmuld_lane_f64(0.00174852843, v582, 1), v427);
      if (v547 >= 1)
      {
        v431 = v736;
        v432 = v537;
        v433 = v425;
        uint64_t v434 = v547;
        do
        {
          int v436 = *v432++;
          int v435 = v436;
          int v437 = *v433++;
          *v431++ = (double)(v435 - 299792 * v437);
          --v434;
        }
        while (v434);
      }
      if (CompPr_LSQ4((double (*)[3])v607, v736, v547, (double *)v666.i64, (int *)&v737, v586, v651.f64))
      {
        int32x2_t v438 = vmovn_s64(vcvtq_n_s64_f64(v651, 0xFuLL));
        *(int32x2_t *)v426 = v438;
        unsigned int v439 = v586[0];
        _DWORD *v428 = v586[0];
        EvLog_v("SearchEllipse: LSQ Upd %d %d   ResSq %d", v438.i32[0], v438.i32[1], v439);
      }
      else
      {
        _DWORD *v428 = -83886080;
        EvDbg_v("SearchEllipse: ERROR DID NOT CONVERGE!");
      }
      ++v424;
      v425 += 148;
    }
    while (v424 != 8);
  }
  unint64_t v440 = 0;
  v441 = &v679;
  uint64_t v442 = -7;
  int v14 = (_DWORD *)&unk_26AA2D000;
  BOOL v8 = v525;
  int v15 = &qword_26A9CA000;
  do
  {
    if (v440 > 6)
    {
      int v445 = v440;
    }
    else
    {
      v443 = v441;
      uint64_t v444 = v442;
      int v445 = v440;
      do
      {
        unsigned int v446 = *v443;
        v443 += 37;
        if (v446 < v676.i32[37 * v445 + 2]) {
          int v445 = v444 + 8;
        }
        BOOL v163 = __CFADD__(v444++, 1);
      }
      while (!v163);
    }
    if (v440 != v445)
    {
      v447 = &v676.i32[37 * v440];
      long long v448 = *((_OWORD *)v447 + 7);
      long long v672 = *((_OWORD *)v447 + 6);
      long long v673 = v448;
      long long v674 = *((_OWORD *)v447 + 8);
      __int32 v675 = v447[36];
      long long v449 = *((_OWORD *)v447 + 3);
      long long v668 = *((_OWORD *)v447 + 2);
      long long v669 = v449;
      long long v450 = *((_OWORD *)v447 + 5);
      long long v670 = *((_OWORD *)v447 + 4);
      long long v671 = v450;
      uint32x4_t v451 = *((uint32x4_t *)v447 + 1);
      uint32x4_t v666 = *(uint32x4_t *)v447;
      uint32x4_t v667 = v451;
      v452 = &v676.i32[37 * v445];
      long long v453 = *((_OWORD *)v452 + 1);
      *(_OWORD *)v447 = *(_OWORD *)v452;
      *((_OWORD *)v447 + 1) = v453;
      long long v454 = *((_OWORD *)v452 + 2);
      long long v455 = *((_OWORD *)v452 + 3);
      long long v456 = *((_OWORD *)v452 + 5);
      *((_OWORD *)v447 + 4) = *((_OWORD *)v452 + 4);
      *((_OWORD *)v447 + 5) = v456;
      *((_OWORD *)v447 + 2) = v454;
      *((_OWORD *)v447 + 3) = v455;
      long long v457 = *((_OWORD *)v452 + 6);
      long long v458 = *((_OWORD *)v452 + 7);
      long long v459 = *((_OWORD *)v452 + 8);
      v447[36] = v452[36];
      *((_OWORD *)v447 + 7) = v458;
      *((_OWORD *)v447 + 8) = v459;
      *((_OWORD *)v447 + 6) = v457;
      long long v460 = v673;
      *((_OWORD *)v452 + 6) = v672;
      *((_OWORD *)v452 + 7) = v460;
      *((_OWORD *)v452 + 8) = v674;
      v452[36] = v675;
      long long v461 = v669;
      *((_OWORD *)v452 + 2) = v668;
      *((_OWORD *)v452 + 3) = v461;
      long long v462 = v671;
      *((_OWORD *)v452 + 4) = v670;
      *((_OWORD *)v452 + 5) = v462;
      uint32x4_t v330 = v666;
      uint32x4_t v331 = v667;
      *(uint32x4_t *)v452 = v666;
      *((uint32x4_t *)v452 + 1) = v331;
    }
    ++v440;
    ++v442;
    v441 += 37;
  }
  while (v440 != 8);
  for (uint64_t j = 0; j != 296; j += 37)
  {
    if (v676.i32[j + 2] >= 0xFB000000) {
      break;
    }
    EvLog_v("SearchEllipse: Best Points Upd: %d  %g %g  %u", v547, (double)v676.i32[j] * 0.00174852843, (double)v676.i32[j + 1] * 0.00174852843, v676.i32[j + 2]);
  }
  unsigned int v464 = v676.u32[2];
  if (v679 < 0xFB000000 && v547 <= 4)
  {
    v253 = v531;
    if (v547 == v521 && (int v466 = 10000 * v547, v676.i32[2] < (10000 * v547)))
    {
      if (v676.i32[2] >= (1089 * v547)) {
        int v466 = 90000 * v547;
      }
    }
    else
    {
      int v466 = 1000000 * v547;
    }
    if (v679 < v466 + v676.i32[2])
    {
      EvLog_v("Ellipse Candidate INVALID as not better than the next: 0 %g %g %d   %d %g %g  %d   %d", (double)v676.i32[0] * 0.00174852843, (double)v676.i32[1] * 0.00174852843, v676.i32[2], 1, (double)v678[0] * 0.00174852843, (double)v678[1] * 0.00174852843, v679, v547);
      unsigned int v464 = -83886080;
    }
  }
  else
  {
    v253 = v531;
  }
  int v490 = 16000000 * v547;
  if (v547 <= 5) {
    int v490 = 0;
  }
  v330.i32[0] = v464;
  v331.i32[0] = v522 + v490;
  dword_26A9CC240 = v464 / v547;
  v491.i64[0] = v676.i32[0];
  v491.i64[1] = v676.i32[1];
  BOOL v268 = v464 < v522 + v490;
  int8x16_t __x = vandq_s8((int8x16_t)vmulq_f64(vcvtq_f64_s64(v491), (float64x2_t)vdupq_n_s64(0x3F00000000000000uLL)), (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(v331, v330), 0));
  double v593 = 0.0;
LABEL_602:
  if (v14[896] >= 5)
  {
    uint64_t v500 = mach_continuous_time();
    int32x4_t v501 = v530;
    v501.i32[2] = (unint64_t)(*((double *)v15 + 41) * (double)v500);
    int32x4_t v530 = v501;
  }
  if (v268)
  {
    Geo2ECEF((uint64_t)&__x, (uint64_t)&WGS84_Datum, (double *)v680);
    *(_OWORD *)v597 = v680[0];
    *(void *)&v597[16] = *(void *)&v680[1];
    char v503 = CompVelDoLs(v253, v526, v8, (double *)v597, (BOOL)&v589, v502);
  }
  else
  {
    char v503 = 0;
  }
  if (v14[896] >= 5)
  {
    uint64_t v504 = mach_continuous_time();
    int32x4_t v505 = v530;
    v505.i32[3] = (unint64_t)(*((double *)v15 + 41) * (double)v504);
    int32x4_t v530 = v505;
  }
  uint64_t v506 = __x.i64[0];
  if (v503)
  {
    __double2 v507 = __sincos_stret(*(double *)__x.i64);
    uint64_t v508 = __x.i64[1];
    __double2 v509 = __sincos_stret(*(double *)&__x.i64[1]);
    uint64_t v510 = 0;
    v607[0] = -(v507.__sinval * v509.__cosval);
    v607[1] = -(v507.__sinval * v509.__sinval);
    v511 = &v607[2];
    v607[2] = v507.__cosval;
    v607[3] = -v509.__sinval;
    long long v608 = *(unint64_t *)&v509.__cosval;
    *(double *)&long long v609 = -(v507.__cosval * v509.__cosval);
    *((double *)&v609 + 1) = -(v507.__cosval * v509.__sinval);
    *(double *)&long long v610 = -v507.__sinval;
    long long v512 = v589;
    double v513 = *(double *)&v590;
    do
    {
      double v514 = *(v511 - 1) * *((double *)&v512 + 1) + *(v511 - 2) * *(double *)&v512;
      double v515 = *v511;
      v511 += 3;
      *(double *)&v676.i64[v510++] = v514 + v515 * v513;
    }
    while (v510 != 3);
    double v516 = *(double *)&v676.i64[1] * *(double *)&v676.i64[1] + *(double *)v676.i64 * *(double *)v676.i64;
    if (v523 >= 5) {
      int v517 = 5;
    }
    else {
      int v517 = v523;
    }
    if (v517 <= 3) {
      int v517 = 3;
    }
    double v518 = fabs(*(double *)v677);
    if (v518 < 10.0)
    {
      double v519 = User_Velocity_Compensation[v517 - 3] * 1.5;
      BOOL v106 = v516 < v519 * v519;
    }
    else
    {
      BOOL v106 = 0;
    }
    dword_26A9CC29C = (int)sqrt(v516);
    dword_26A9CC2A0 = (int)v518;
    if (!v106) {
      dword_26A9CC270 = 6;
    }
  }
  else
  {
    BOOL v106 = 0;
    uint64_t v508 = __x.i64[1];
  }
  v524->i64[0] = v506;
  v524->i64[1] = v508;
  xmmword_26A9CC248 = v583;
  qword_26A9CC258 = v584;
LABEL_624:
  if (v14[896] >= 5) {
    EvLog_v("CAP Time Waypoints %u %d %d %d %d %d %d %d", v527.i32[0], v527.i32[1] - v527.i32[0], v527.i32[2] - v527.i32[0], v527.i32[3] - v527.i32[0], v530.i32[0] - v527.i32[0], v530.i32[1] - v527.i32[0], v530.i32[2] - v527.i32[0], v530.i32[3] - v527.i32[0]);
  }
  return v106;
}

uint64_t CompVelDoLs(int (*a1)[3], __int16 (*a2)[3], __int16 *a3, double *a4, BOOL a5, double *a6)
{
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = v7;
  uint64_t v10 = v9;
  int64x2_t v79 = v11;
  uint64_t v13 = v12;
  uint64_t v14 = v6;
  uint64_t v145 = *MEMORY[0x263EF8340];
  bzero(v141, 0x1C00uLL);
  uint64_t v15 = 0;
  int v16 = 0;
  char v87 = 0;
  memset(v86, 0, 457);
  uint64_t v89 = 0;
  v86[59] = 0;
  uint64_t v88 = 0;
  char v90 = 0;
  uint64_t v91 = 0;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  int v92 = 2;
  __double2 v94 = (double *)&v85;
  __double2 v93 = v83;
  uint64_t v95 = v84;
  uint64_t v96 = &v82;
  long long v97 = &v81;
  v86[58] = 0;
  v86[54] = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  dword_26A9CC270 = 0;
  memset(v83, 0, sizeof(v83));
  double v135 = 0.0;
  long long v134 = 0u;
  long long v133 = 0u;
  uint64_t v17 = (_DWORD *)(v14 + 8);
  int v18 = -1;
  memset(v132, 0, sizeof(v132));
  do
  {
    v84[v15] = 0x3FF0000000000000;
    if (*(v17 - 2) && *(v17 - 1) && *v17)
    {
      v83[v15] = 1;
      ++v16;
    }
    else if (v18 == -1)
    {
      int v18 = v15;
    }
    v17 += 3;
    ++v15;
  }
  while (v15 != 128);
  HIDWORD(v91) = v18;
  if (v16 < 3) {
    return 0;
  }
  if (v18 == -1) {
    goto LABEL_18;
  }
  uint64_t v20 = &v141[7 * v18];
  v143[0] = 0;
  LODWORD(v136) = 0;
  *(void *)uint64_t v80 = 0;
  long long v139 = *v10;
  uint64_t v140 = *((void *)v10 + 2);
  ECEF2Geo((double *)&v139, (uint64_t)&WGS84_Datum, (uint64_t)&v137);
  double v21 = v138;
  if (v138 >= 3.14159265)
  {
    double v22 = -6.28318531;
    goto LABEL_16;
  }
  if (v138 < -3.14159265)
  {
    double v22 = 6.28318531;
LABEL_16:
    double v21 = v138 + v22;
    double v138 = v138 + v22;
  }
  double v23 = v137;
  __double2 v24 = __sincos_stret(v137);
  __double2 v25 = __sincos_stret(v21);
  v132[0] = -(v24.__sinval * v25.__cosval);
  v132[1] = -(v24.__sinval * v25.__sinval);
  v132[2] = v24.__cosval;
  unsigned int v132[3] = -v25.__sinval;
  long long v133 = *(unint64_t *)&v25.__cosval;
  *(double *)&long long v134 = -(v24.__cosval * v25.__cosval);
  *((double *)&v134 + 1) = -(v24.__cosval * v25.__sinval);
  double v135 = -v24.__sinval;
  LODWORD(v26) = vcvtd_n_s64_f64(v23, 0xFuLL);
  uint64_t v27 = Taylor_sin_cos(v26, v143, (int *)&v136);
  LODWORD(v27) = vcvtd_n_s64_f64(v21, 0xFuLL);
  Taylor_sin_cos(v27, &v80[1], v80);
  double v28 = (double)(v80[1] * (int)v136);
  *uint64_t v20 = (double)((int)v136 * v80[0]) * 9.31322575e-10;
  v20[1] = v28 * 9.31322575e-10;
  v20[2] = (double)v143[0] * 0.0000305175781;
LABEL_18:
  unsigned int v29 = 0;
  *(_DWORD *)((char *)&v88 + 3) = -1;
  LODWORD(v88) = 50462976;
  HIBYTE(v88) = 4;
  LODWORD(v89) = 1;
  double v30 = 0.0;
  do
  {
    unsigned int v31 = v29;
    uint64_t v32 = 0x1FFFFFFFFFFFFC80;
    int v33 = v94;
    uint64_t v34 = (int *)(v14 + 4);
    int v35 = (__int16 *)(v13 + 4);
    unsigned int v36 = v79;
    double v37 = v94;
    do
    {
      int v38 = *(v34 - 1);
      int v39 = *v34;
      int v40 = v34[1];
      if (!*(void *)(v34 - 1))
      {
        if (!v40) {
          break;
        }
        int v39 = 0;
      }
      double v41 = &v141[v32];
      v34 += 3;
      double v42 = (double)v38 - *(double *)v10;
      double v43 = (double)v39 - *((double *)v10 + 1);
      double v44 = (double)v40 - *((double *)v10 + 2);
      double v45 = 1.0 / sqrt(v43 * v43 + v42 * v42 + v44 * v44);
      int v46 = *v36++;
      *v37++ = (double)v46 * 0.190293673
             - v45
             * (v43 * -(v8[1] - (double)*(v35 - 1) * 0.190293673)
              + v42 * -(*v8 - (double)*(v35 - 2) * 0.190293673)
              + v44 * -(v8[2] - (double)*v35 * 0.190293673))
             - v8[3];
      v41[896] = v42 * v45;
      v41[897] = v43 * v45;
      v41[898] = v44 * v45;
      v35 += 3;
      v32 += 7;
    }
    while (v32 * 8);
    if (v16 <= 4)
    {
      uint64_t v47 = 0;
      uint64_t v48 = SHIDWORD(v91);
      v93[SHIDWORD(v91)] = 1;
      double v49 = *v8;
      double v50 = v8[1];
      double v51 = v8[2];
      int v52 = &v132[2];
      do
      {
        double v53 = *(v52 - 1) * v50 + *(v52 - 2) * v49;
        double v54 = *v52;
        v52 += 3;
        *(double *)&v143[v47] = v53 + v54 * v51;
        v47 += 2;
      }
      while (v47 != 6);
      v33[v48] = -v144;
    }
    BOOL v55 = NK_Least_Squares_Core(v141, (double (*)[3])v132, 4, 0, 0, (uint64_t)&v139, (uint64_t)&v137, &v136, (uint64_t)v86);
    uint64_t v56 = 0;
    double v57 = 0.0;
    do
    {
      if ((*((char *)&v88 + v56) & 0x80000000) == 0)
      {
        uint64_t v58 = *((unsigned __int8 *)&v88 + v56);
        double v59 = *(double *)&v86[v58];
        v8[v58] = v8[v58] + v59;
        double v57 = v57 + v59 * v59;
      }
      ++v56;
    }
    while (v56 != 7);
    BOOL v61 = (v57 <= v30 || v31 == 0) && v55;
    ++byte_26A9CC27A;
    if (!v61)
    {
      if (v31 > 9) {
        int v78 = 1;
      }
      else {
        int v78 = 2;
      }
      goto LABEL_59;
    }
    if (v31 > 8) {
      break;
    }
    unsigned int v29 = v31 + 1;
    double v30 = v57;
  }
  while (v57 > 1.0);
  if (v31 > 8)
  {
    int v78 = 1;
LABEL_59:
    BOOL v67 = &unk_26A9CC000;
    goto LABEL_60;
  }
  uint64_t v62 = 0;
  double v63 = v94;
  uint64_t v64 = (double *)&v142;
  double v65 = (int *)(v14 + 8);
  BOOL v66 = (__int16 *)(v13 + 4);
  BOOL v67 = (_DWORD *)&unk_26A9CC000;
  do
  {
    int v68 = *(v65 - 2);
    int v69 = *(v65 - 1);
    int v70 = *v65;
    if (!*((void *)v65 - 1))
    {
      if (!v70) {
        break;
      }
      int v69 = 0;
    }
    v65 += 3;
    double v71 = (double)v68 - *(double *)v10;
    double v72 = (double)v69 - *((double *)v10 + 1);
    double v73 = (double)v70 - *((double *)v10 + 2);
    double v74 = 1.0 / sqrt(v72 * v72 + v71 * v71 + v73 * v73);
    v63[v62] = (double)v79[v62] * 0.190293673
             - v74
             * (v72 * -(v8[1] - (double)*(v66 - 1) * 0.190293673)
              + v71 * -(*v8 - (double)*(v66 - 2) * 0.190293673)
              + v73 * -(v8[2] - (double)*v66 * 0.190293673))
             - v8[3];
    *(v64 - 2) = v71 * v74;
    *(v64 - 1) = v72 * v74;
    double *v64 = v73 * v74;
    v64 += 7;
    ++v62;
    v66 += 3;
  }
  while (v62 != 128);
  uint64_t v75 = 0;
  double v76 = 0.0;
  do
  {
    if (v83[v75]) {
      double v76 = v76 + v63[v75] * v63[v75];
    }
    ++v75;
  }
  while (v75 != 128);
  double v77 = (double)v16 * 4.0;
  if (v16 >= 5) {
    double v77 = 400.0;
  }
  if (v76 > v77)
  {
    int v78 = 4;
LABEL_60:
    uint64_t result = 0;
    v67[156] = v78;
    return result;
  }
  return 1;
}

uint64_t CAP_LSQ4_Core(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  *(void *)(a3 + 32) = 0x426D1A94A2000000;
  uint64_t v4 = a3 + 32;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(void *)(a3 + 48) = 0x426D1A94A2000000;
  *(void *)(a3 + 72) = 0x426D1A94A2000000;
  *(void *)(a3 + 104) = 0x426D1A94A2000000;
  uint64_t v5 = a2 + (*(_DWORD *)(a3 + 152) >= 0);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v15 = 0;
    unsigned int v7 = (double *)(a1 + 16);
    do
    {
      if (v6 == *(_DWORD *)(a3 + 152)) {
        double v8 = 0.0;
      }
      else {
        double v8 = 1.0;
      }
      float64x2_t v19 = vnegq_f64(*(float64x2_t *)(v7 - 2));
      double v9 = *v7;
      v7 += 3;
      double v20 = -v9;
      double v21 = v8;
      uint64_t v10 = *(void *)(a3 + 168);
      uint64_t v22 = *(void *)(*(void *)(a3 + 160) + 8 * v6);
      umeas(v4, 4u, *(double *)(v10 + 8 * v6++), v19.f64, v18, v17, (double *)&v15, 1.0e20);
    }
    while (v5 != v6);
  }
  ud2var(v4, 4u, 1, 4u, v16);
  if (v16[0] > 1000000000.0) {
    return 0;
  }
  uint64_t v12 = 1;
  while (v12 != 4)
  {
    double v13 = v16[v12++];
    if (v13 > 1000000000.0)
    {
      if ((unint64_t)(v12 - 2) < 3) {
        return 0;
      }
      break;
    }
  }
  long long v14 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)a3 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a3 + 16) = v14;
  return 1;
}

uint64_t CompPr_LSQ4(double (*a1)[3], double *a2, int a3, double *a4, int *a5, unsigned int *a6, double *a7)
{
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v96 = v9;
  long long v98 = v10;
  uint64_t v12 = v11;
  unsigned int v13 = v8;
  uint64_t v15 = v14;
  uint64_t v16 = v7;
  uint64_t v124 = *MEMORY[0x263EF8340];
  uint64_t v112 = 0;
  memset(v111, 0, sizeof(v111));
  long long v110 = 0u;
  long long v109 = 0u;
  long long v114 = v108;
  long long v115 = __b;
  unsigned int v113 = -1;
  dword_26A9CC270 = 0;
  memset(v116, 0, sizeof(v116));
  unint64_t v17 = v8;
  long long v117 = 0u;
  long long v118 = 0u;
  double v119 = 0.0;
  int v100 = v8;
  long long v97 = v18;
  if (v8 < 1)
  {
    __b[v8] = 5.0;
    unsigned int v113 = v8;
    int v36 = v8;
  }
  else
  {
    memset_pattern16(__b, &unk_263D822F0, 8 * v8);
    double v19 = 5.0;
    if (v13 < 5 || (double v19 = 25.0, v13 < 9))
    {
      __b[v17] = v19;
      unsigned int v113 = v13;
    }
    uint64_t v20 = 0;
    double v21 = *(double *)v12;
    float64x2_t v22 = *(float64x2_t *)(v12 + 8);
    double v23 = *(double *)(v12 + 24);
    do
    {
      uint64_t v24 = v16 + 24 * v20;
      double v25 = *(double *)v24;
      double v26 = *(double *)v24 - v21;
      *(double *)long long v106 = v26;
      float64x2_t v27 = *(float64x2_t *)(v24 + 8);
      float64x2_t v28 = vsubq_f64(v27, v22);
      *(float64x2_t *)&v106[8] = v28;
      double v29 = 0.0;
      uint64_t v30 = 2;
      do
      {
        double v29 = v29 + *(double *)&v106[8 * v30] * *(double *)&v106[8 * v30];
        unint64_t v31 = v30-- + 1;
      }
      while (v31 > 1);
      uint64_t v32 = 0;
      int v33 = &v120[3 * v20];
      double v34 = sqrt(v29);
      *(double *)int v33 = v26 / v34;
      *(float64x2_t *)(v33 + 1) = vdivq_f64(v28, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v34, 0));
      double v121 = -0.0000729211515 * v27.f64[0];
      double v122 = v25 * 0.0000729211515;
      double v123 = 0.0;
      double v35 = 0.0;
      do
      {
        double v35 = v35 + *(double *)((char *)&v121 + v32) * *(double *)&v106[v32];
        v32 += 8;
      }
      while (v32 != 24);
      v108[v20] = *(double *)(v15 + 8 * v20) - (v34 + v35 * -0.00000000333564095) - v23;
      ++v20;
    }
    while (v20 != v17);
    int v36 = v100;
  }
  unsigned int v37 = 0;
  int v102 = 0;
  double v99 = (double)v36 * 25.0;
  double v38 = 0.0;
  while (1)
  {
    unsigned int v103 = v37;
    uint64_t v39 = v113;
    if ((v113 & 0x80000000) == 0)
    {
      int v40 = v114;
      *(void *)long long v104 = 0;
      *(void *)long long v105 = 0;
      *(_OWORD *)long long v106 = *(_OWORD *)v12;
      *(void *)&v106[16] = *(void *)(v12 + 16);
      ECEF2Geo((double *)v106, (uint64_t)&WGS84_Datum, (uint64_t)&v121);
      double v42 = v122;
      double v43 = -6.28318531;
      long long v101 = v40;
      if (v122 >= 3.14159265 || (double v43 = 6.28318531, v122 < -3.14159265))
      {
        double v42 = v122 + v43;
        double v122 = v122 + v43;
      }
      double v44 = (double *)&v120[3 * v39];
      LODWORD(v41) = vcvtd_n_s64_f64(v121, 0xFuLL);
      uint64_t v45 = Taylor_sin_cos(v41, &v105[1], v105);
      LODWORD(v45) = vcvtd_n_s64_f64(v42, 0xFuLL);
      Taylor_sin_cos(v45, &v104[1], v104);
      double v46 = (double)(v104[1] * v105[0]);
      double *v44 = (double)(v105[0] * v104[0]) * 9.31322575e-10;
      v44[1] = v46 * 9.31322575e-10;
      v44[2] = (double)v105[1] * 0.0000305175781;
      int v36 = v100;
      v101[v39] = v123;
    }
    if ((CAP_LSQ4_Core((uint64_t)v120, v36, (uint64_t)&v109) & 1) == 0)
    {
      uint64_t result = 0;
      *long long v98 = v103 + 1;
      dword_26A9CC270 = 2;
      return result;
    }
    double v47 = *((double *)&v109 + 1);
    double v48 = *(double *)&v110;
    if (*((double *)&v110 + 1) > 1.0e10
      || *(double *)&v109 > 1.0e10
      || *((double *)&v109 + 1) > 1.0e10
      || *(double *)&v110 > 1.0e10)
    {
      EvLog_v("CompPR_LSQ4: StateVec Innovation Out Of Range! %f %f %f %f", *((double *)&v110 + 1), *(double *)&v109, *((double *)&v109 + 1), *(double *)&v110);
      return 0;
    }
    double v49 = *(double *)(v12 + 16);
    double v50 = *((double *)&v110 + 1) + *(double *)(v12 + 24);
    double v51 = *(double *)(v12 + 8);
    double v52 = *(double *)&v109 + *(double *)v12;
    double v53 = *((double *)&v109 + 1) + v51;
    *(double *)uint64_t v12 = v52;
    *(double *)(v12 + 8) = v47 + v51;
    double v54 = v48 + v49;
    *(double *)(v12 + 16) = v48 + v49;
    *(double *)(v12 + 24) = v50;
    if (v36 >= 1) {
      break;
    }
    double v69 = 0.0;
    unsigned int v56 = v103;
    if (v103) {
      goto LABEL_36;
    }
LABEL_46:
    unsigned int v76 = v56 + 1;
    if (v56 <= 3)
    {
      unsigned int v37 = v56 + 1;
      double v38 = v69;
      if (v102 != 2) {
        continue;
      }
    }
    goto LABEL_51;
  }
  uint64_t v55 = 0;
  unsigned int v56 = v103;
  do
  {
    double v57 = (double *)(v16 + 24 * v55);
    double v58 = *v57;
    double v59 = v57[1];
    double v60 = *v57 - v52;
    *(double *)long long v106 = v60;
    *(double *)&v106[8] = v59 - v53;
    double v61 = v57[2] - v54;
    *(double *)&v106[16] = v61;
    double v62 = 0.0;
    uint64_t v63 = 2;
    do
    {
      double v62 = v62 + *(double *)&v106[8 * v63] * *(double *)&v106[8 * v63];
      unint64_t v64 = v63-- + 1;
    }
    while (v64 > 1);
    uint64_t v65 = 0;
    BOOL v66 = (double *)&v120[3 * v55];
    double v67 = sqrt(v62);
    *BOOL v66 = v60 / v67;
    v66[1] = (v59 - v53) / v67;
    v66[2] = v61 / v67;
    double v121 = v59 * -0.0000729211515;
    double v122 = v58 * 0.0000729211515;
    double v123 = 0.0;
    double v68 = 0.0;
    do
    {
      double v68 = v68 + *(double *)((char *)&v121 + v65) * *(double *)&v106[v65];
      v65 += 8;
    }
    while (v65 != 24);
    v108[v55] = *(double *)(v15 + 8 * v55) - (v67 + v68 * -0.00000000333564095) - v50;
    ++v55;
  }
  while (v55 != v17);
  double v69 = 0.0;
  int v70 = v108;
  unint64_t v71 = v17;
  do
  {
    double v72 = *v70++;
    double v69 = v69 + v72 * v72;
    --v71;
  }
  while (v71);
  if (!v103) {
    goto LABEL_46;
  }
LABEL_36:
  if (v69 >= v99 && v69 * 8.0 <= v38)
  {
    if (v69 * 128.0 > v38)
    {
      if (v102 == 1) {
        int v74 = 2;
      }
      else {
        int v74 = 1;
      }
      int v102 = v74;
    }
    goto LABEL_46;
  }
  unsigned int v76 = v56 + 1;
LABEL_51:
  *long long v98 = v76;
  double v121 = v52;
  double v122 = v53;
  double v123 = v54;
  ECEF2Geo(&v121, (uint64_t)&WGS84_Datum, (uint64_t)v97);
  double v77 = v97[1];
  if (v77 >= 3.14159265)
  {
    double v78 = -6.28318531;
LABEL_55:
    double v77 = v77 + v78;
    v97[1] = v77;
  }
  else if (v77 < -3.14159265)
  {
    double v78 = 6.28318531;
    goto LABEL_55;
  }
  __double2 v79 = __sincos_stret(*v97);
  __double2 v80 = __sincos_stret(v77);
  v116[0] = -(v79.__sinval * v80.__cosval);
  v116[1] = -(v79.__sinval * v80.__sinval);
  v116[2] = v79.__cosval;
  v116[3] = -v80.__sinval;
  long long v117 = *(unint64_t *)&v80.__cosval;
  *(double *)&long long v118 = -(v79.__cosval * v80.__cosval);
  *((double *)&v118 + 1) = -(v79.__cosval * v80.__sinval);
  double v119 = -v79.__sinval;
  if (v100 < 1)
  {
    char v82 = 1;
    char v89 = 1;
  }
  else
  {
    unint64_t v81 = 0;
    char v82 = 1;
    do
    {
      uint64_t v83 = 2;
      do
      {
        *(double *)&v106[8 * v83] = *(double *)(v16 + 8 * v83) - *(double *)(v12 + 8 * v83);
        unint64_t v84 = v83-- + 1;
      }
      while (v84 > 1);
      double v85 = -(v79.__cosval * v80.__sinval) * *(double *)&v106[8]
          + -(v79.__cosval * v80.__cosval) * *(double *)v106
          + -v79.__sinval * *(double *)&v106[16];
      if (v85 > 0.0)
      {
        double v86 = 0.0;
        uint64_t v87 = 2;
        do
        {
          double v86 = v86 + *(double *)&v106[8 * v87] * *(double *)&v106[8 * v87];
          unint64_t v88 = v87-- + 1;
        }
        while (v88 > 1);
        if (-v85 / sqrt(v86) < -0.087155743) {
          char v82 = 0;
        }
      }
      char v89 = v82;
      if ((v82 & 1) == 0) {
        break;
      }
      ++v81;
      v16 += 24;
    }
    while (v81 < v17);
  }
  int v90 = v82 & 1;
  if ((v89 & (v69 > 225000000.0)) != 0) {
    int v91 = 0;
  }
  else {
    int v91 = v90;
  }
  if (v100 <= 5 && v91)
  {
    Comp_NEDvar_UDU((uint64_t)v111, 4u, 0, (double (*)[3])v116, (double *)v106);
    int v92 = 0;
    if (*(double *)&v106[16] < 100000000.0)
    {
      int v93 = (int)v97[2];
      int v94 = 1000 * U4sqrt((int)*(double *)&v106[16]);
      if (v94 <= 500) {
        int v94 = 500;
      }
      if (v94 + 18000 > v93 && -500 - v94 < v93) {
        int v92 = v91;
      }
      else {
        int v92 = 0;
      }
    }
    int v91 = v92;
  }
  if (v91)
  {
    *uint64_t v96 = v69;
    return 1;
  }
  return 0;
}

void *GNSS_Init_p_list(void)
{
  g_GN_GPS_Data_p_list = 0u;
  xmmword_26AA2DEA8 = 0u;
  *((void *)&g_GN_GPS_Data_p_list + 1) = &g_DB_BB_TTick;
  qword_26AA2DE18 = (uint64_t)&g_DB_Raw_Meas;
  qword_26AA2DE20 = (uint64_t)&g_DB_SV_Subframes;
  unk_26AA2DE28 = &g_DB_SV_AzEl;
  qword_26AA2DE30 = (uint64_t)&g_DB_Acq_Aid_Table;
  qword_26AA2DE38 = (uint64_t)&g_DB_Time_Sync;
  qword_26AA2DE40 = (uint64_t)&g_DB_SV_Nav_Mess;
  *(void *)&xmmword_26AA2DE48 = &g_DB_Chan_Reset;
  *((void *)&xmmword_26AA2DE48 + 1) = &g_DB_Sys_Status;
  qword_26AA2DE58 = (uint64_t)&g_DB_Nav_Soln;
  qword_26AA2DE60 = (uint64_t)&g_DB_SV_State_Table;
  *(void *)&xmmword_26AA2DE68 = &g_DB_Track_Meas;
  *((void *)&xmmword_26AA2DE68 + 1) = &g_DB_Sensor;
  qword_26AA2DE78 = (uint64_t)&g_G5K_ME_SD;
  qword_26AA2DE80 = (uint64_t)&g_SV_Gen_Meas_SD;
  *(void *)&xmmword_26AA2DE88 = &g_Nav_Kalman_SD;
  *((void *)&xmmword_26AA2DE88 + 1) = &g_SV_Data_Decode_SD;
  unk_26AA2DE98 = &g_SV_State_Update_SD;
  qword_26AA2DEA0 = (uint64_t)&g_Pre_Positioning_SD;
  *((void *)&xmmword_26AA2DEA8 + 1) = &g_Nav_Kalman_WD;
  unk_26AA2DEB8 = &g_SV_Data_Decode_WD;
  qword_26AA2DEC0 = (uint64_t)&g_SV_State_Update_WD;
  unk_26AA2DEC8 = 0;
  qword_26AA2DED0 = (uint64_t)&g_GNSS_Debug_Data;
  qword_26AA2DED8 = (uint64_t)&g_GN_GNSS_IntVersion;
  qword_26AA2DEE0 = (uint64_t)&g_GN_GNSS_Config;
  qword_26AA2DEE8 = (uint64_t)&g_GN_GNSS_Nav_Data;
  qword_26AA2DEF0 = (uint64_t)&g_GN_GNSS_Dbg_Data;
  qword_26AA2DEF8 = (uint64_t)&g_NV_Ram;
  qword_26AA2DC18 = (uint64_t)&g_CBuff_Meas;
  unk_26AA2DC20 = &g_CBuff_Ctrl;
  g_CB_Meas = (uint64_t)&g_CBuff_Meas;
  unk_26AA2DC10 = &g_CBuff_Meas;
  qword_26AA2DF00 = (uint64_t)&g_NA_Ram;
  qword_26AA2DF08 = (uint64_t)&g_CB_Meas;
  qword_26AA2DC38 = (uint64_t)&g_CBuff_Ctrl;
  unk_26AA2DC40 = &g_CBuff_NMEA;
  g_CB_Ctrl = (uint64_t)&g_CBuff_Ctrl;
  unk_26AA2DC30 = &g_CBuff_Ctrl;
  qword_26AA2DC58 = (uint64_t)&g_CBuff_NMEA;
  unk_26AA2DC60 = (char *)&g_CBuff_NMEA + 14336;
  g_CB_NMEA = (uint64_t)&g_CBuff_NMEA;
  unk_26AA2DC50 = &g_CBuff_NMEA;
  qword_26AA2DF10 = (uint64_t)&g_CB_Ctrl;
  qword_26AA2DF18 = (uint64_t)&g_CB_NMEA;
  qword_26AA2DDF0 = (uint64_t)&g_CBuff_NDbg;
  qword_26AA2DDF8 = (uint64_t)&g_CBuff_ELog;
  g_CB_NDbg = (uint64_t)&g_CBuff_NDbg;
  *(void *)&dword_26AA2DDE8 = &g_CBuff_NDbg;
  qword_26AA2DDD0 = (uint64_t)&g_CBuff_ELog;
  qword_26AA2DDD8 = (uint64_t)&g_CBuff_GDbg;
  g_CB_ELog = (uint64_t)&g_CBuff_ELog;
  *(void *)&dword_26AA2DDC8 = &g_CBuff_ELog;
  qword_26AA2DF20 = (uint64_t)&g_CB_NDbg;
  qword_26AA2DF28 = (uint64_t)&g_CB_ELog;
  qword_26AA2DC78 = (uint64_t)&g_CBuff_GDbg;
  qword_26AA2DC80 = (uint64_t)&g_CB_Meas;
  g_CB_GDbg = (uint64_t)&g_CBuff_GDbg;
  *(void *)&dword_26AA2DC70 = &g_CBuff_GDbg;
  qword_26AA2DF30 = (uint64_t)&g_CB_GDbg;
  LODWORD(g_GN_GPS_Data_p_list) = 2;
  p_apuint64_t i = (uint64_t)&g_GN_GPS_Data_p_list;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;

  return memcpy(&GN_GPS_Data_p_list_reference, &g_GN_GPS_Data_p_list, 0x130uLL);
}

void *GNSS_Clear_DataAreas(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v202 = *MEMORY[0x263EF8340];
  bzero(v201, 0x6E50uLL);
  uint64_t v1 = 568;
  do
  {
    double v2 = (char *)v201 + v1;
    *(void *)double v2 = 0;
    *((_WORD *)v2 + 4) = 0;
    *(void *)(v2 + 12) = 0;
    *((void *)v2 + 6) = 0;
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0;
    v1 += 56;
    *(void *)(v2 + 38) = 0;
  }
  while (v2 + 56 != (char *)&v201[483] + 8);
  uint64_t v3 = -4608;
  do
  {
    uint64_t v4 = (char *)&v201[771] + v3 + 8;
    v4[32] = 0;
    *(_OWORD *)uint64_t v4 = 0uLL;
    *((_OWORD *)v4 + 1) = 0uLL;
    v3 += 36;
  }
  while (v3);
  uint64_t v5 = -15872;
  do
  {
    uint64_t v6 = (_OWORD *)((char *)&v201[1763] + v5 + 8);
    *(_OWORD *)((char *)v6 + 105) = 0uLL;
    v6[5] = 0uLL;
    v6[6] = 0uLL;
    v6[3] = 0uLL;
    v6[4] = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    _OWORD *v6 = 0uLL;
    v5 += 124;
  }
  while (v5);
  *(void *)((char *)&v201[1764] + 12) = 0;
  DWORD1(v201[1765]) = 0;
  *((void *)&v201[1763] + 1) = 0;
  *(void *)&v201[1764] = 0;
  WORD4(v201[1764]) = 0;
  memcpy(&g_G5K_ME_SD, v201, 0x6E58uLL);
  qword_26AA000C8 = (uint64_t)&g_G5K_ME_SD;
  bzero(&g_SV_Gen_Meas_SD, 0xC70uLL);
  bzero(v201, 0xBBA8uLL);
  uint64_t v7 = 5580;
  do
  {
    int v8 = (char *)v201 + v7;
    *(void *)int v8 = 0;
    *((_WORD *)v8 + 4) = 0;
    *((_DWORD *)v8 + 3) = 0;
    v8[16] = 0;
    *((_DWORD *)v8 + 5) = 0;
    v7 += 28;
    v8[24] = 0;
  }
  while (v8 + 28 != (char *)&v201[373] + 4);
  *(_OWORD *)((char *)&v201[397] + 4) = 0u;
  *(_OWORD *)((char *)&v201[398] + 4) = 0u;
  *(_OWORD *)((char *)&v201[395] + 4) = 0u;
  *(_OWORD *)((char *)&v201[396] + 4) = 0u;
  *(_OWORD *)((char *)&v201[393] + 4) = 0u;
  *(_OWORD *)((char *)&v201[394] + 4) = 0u;
  *(_OWORD *)((char *)&v201[391] + 4) = 0u;
  *(_OWORD *)((char *)&v201[392] + 4) = 0u;
  *(_OWORD *)((char *)&v201[389] + 4) = 0u;
  *(_OWORD *)((char *)&v201[390] + 4) = 0u;
  *(_OWORD *)((char *)&v201[387] + 4) = 0u;
  *(_OWORD *)((char *)&v201[388] + 4) = 0u;
  *(_OWORD *)((char *)&v201[385] + 4) = 0u;
  *(_OWORD *)((char *)&v201[386] + 4) = 0u;
  *(_OWORD *)((char *)&v201[383] + 4) = 0u;
  *(_OWORD *)((char *)&v201[384] + 4) = 0u;
  *(_OWORD *)((char *)&v201[381] + 4) = 0u;
  *(_OWORD *)((char *)&v201[382] + 4) = 0u;
  *(_OWORD *)((char *)&v201[379] + 4) = 0u;
  *(_OWORD *)((char *)&v201[380] + 4) = 0u;
  *(_OWORD *)((char *)&v201[377] + 4) = 0u;
  *(_OWORD *)((char *)&v201[378] + 4) = 0u;
  *(_OWORD *)((char *)&v201[375] + 4) = 0u;
  *(_OWORD *)((char *)&v201[376] + 4) = 0u;
  *(_OWORD *)((char *)&v201[373] + 4) = 0u;
  *(_OWORD *)((char *)&v201[374] + 4) = 0u;
  *(_OWORD *)((char *)&v201[398] + 15) = 0u;
  memset(&v201[400], 0, 245);
  bzero((char *)&v201[415] + 6, 0xA1B0uLL);
  memcpy(&g_SV_Data_Decode_SD, v201, 0xBBA6uLL);
  bzero(v201, 0x10EF0uLL);
  *(void *)((char *)&v201[1] + 4) = 0x500000002;
  *(void *)((char *)&v201[8] + 12) = 0;
  *(_OWORD *)((char *)&v201[9] + 4) = 0u;
  *(_OWORD *)((char *)&v201[10] + 8) = 0u;
  *(void *)((char *)&v201[11] + 5) = 0;
  memset(&v201[19], 0, 20);
  *(_OWORD *)((char *)&v201[20] + 8) = 0u;
  DWORD2(v201[21]) = 0;
  memset(&v201[2], 0, 105);
  memset(&v201[12], 0, 54);
  *(_OWORD *)((char *)&v201[16] + 8) = 0u;
  *(_OWORD *)((char *)&v201[17] + 8) = 0u;
  DWORD2(v201[18]) = 0;
  *(_OWORD *)((char *)&v201[15] + 8) = 0u;
  bzero(&v201[22], 0x54CuLL);
  memset(&v201[107], 0, 24);
  DWORD2(v201[108]) = -1;
  *(_OWORD *)((char *)&v201[109] + 8) = 0u;
  *(void *)((char *)&v201[110] + 5) = 0;
  *(void *)&v201[109] = 0;
  memset(&v201[111], 0, 65);
  LODWORD(v201[116]) = -1;
  *(_OWORD *)((char *)&v201[116] + 8) = 0u;
  *(_OWORD *)((char *)&v201[117] + 8) = 0u;
  *(_OWORD *)((char *)&v201[118] + 8) = 0u;
  *(_DWORD *)((char *)&v201[119] + 7) = 0;
  uint64_t v9 = 1920;
  do
  {
    uint64_t v10 = (char *)v201 + v9;
    *(_DWORD *)uint64_t v10 = 0;
    *(_OWORD *)(v10 + 8) = 0uLL;
    *(_OWORD *)(v10 + 24) = 0uLL;
    v9 += 40;
  }
  while (v10 + 40 != (char *)&v201[440]);
  uint64_t v11 = 7040;
  do
  {
    uint64_t v12 = (char *)v201 + v11;
    *(_DWORD *)uint64_t v12 = 0;
    *(_OWORD *)(v12 + 8) = 0uLL;
    *(_OWORD *)(v12 + 24) = 0uLL;
    v11 += 40;
  }
  while (v12 + 40 != (char *)&v201[760]);
  DWORD2(v201[963]) = 0;
  *(void *)&v201[964] = 0;
  DWORD2(v201[964]) = 0;
  *(void *)&v201[965] = 0;
  DWORD2(v201[965]) = 0;
  *(void *)&v201[1257] = 0;
  BYTE8(v201[1257]) = 0;
  *(void *)&v201[1258] = 0;
  BYTE8(v201[1258]) = 0;
  *(void *)&v201[1701] = 0;
  DWORD2(v201[1701]) = 0;
  *(void *)&v201[1708] = 0;
  DWORD2(v201[1708]) = 0;
  *((void *)&v201[1725] + 1) = 0;
  LOBYTE(v201[1726]) = 0;
  memset(&v201[1721], 0, 65);
  *((void *)&v201[1731] + 1) = 0;
  LOBYTE(v201[1732]) = 0;
  DWORD2(v201[1726]) = 0;
  memset(&v201[1727], 0, 65);
  BYTE8(v201[1732]) = 0;
  BYTE8(v201[4255]) = 0;
  *(void *)((char *)&v201[4261] + 4) = 0;
  *(void *)((char *)&v201[4270] + 4) = 0;
  bzero(&v201[4271], 0x400uLL);
  bzero(&v201[760], 0xCB5uLL);
  memset(&v201[966], 0, 156);
  bzero(&v201[976], 0x118BuLL);
  bzero(&v201[1259], 0x1B5CuLL);
  memset(&v201[1697], 0, 25);
  *(_OWORD *)((char *)&v201[1698] + 12) = 0u;
  *(_OWORD *)((char *)&v201[1699] + 12) = 0u;
  memset(&v201[1702], 0, 19);
  *(_OWORD *)((char *)&v201[1703] + 4) = 0u;
  *(void *)((char *)&v201[1704] + 2) = 0;
  *(void *)((char *)&v201[1704] + 12) = 0;
  *(_OWORD *)((char *)&v201[1705] + 4) = 0u;
  *(_OWORD *)((char *)&v201[1706] + 8) = 0u;
  BYTE8(v201[1707]) = 0;
  memset(&v201[1709], 0, 188);
  bzero((char *)&v201[1732] + 12, 0x9D68uLL);
  *((void *)&v201[4251] + 1) = 0;
  memset(&v201[4252], 0, 17);
  memset(&v201[4254], 0, 21);
  *((void *)&v201[4253] + 1) = 0;
  memset(&v201[4256], 0, 81);
  memset(&v201[4262], 0, 73);
  memset(&v201[4267], 0, 49);
  g_Nav_Kalman_SD = v201[0];
  dword_26A9A5908 = v201[1];
  unk_26A9A590C = *(void *)((char *)&v201[1] + 4);
  memcpy(&unk_26A9A5914, (char *)&v201[1] + 12, 0x10ED4uLL);
  g_SV_State_Update_SD = 0u;
  unk_26AA135C8 = 0u;
  xmmword_26AA135D8 = 0u;
  unk_26AA135E8 = 0u;
  xmmword_26AA135F8 = 0u;
  unk_26AA13608 = 0u;
  xmmword_26AA13618 = 0u;
  unk_26AA13628 = 0u;
  xmmword_26AA13638 = 0u;
  unk_26AA13648 = 0u;
  xmmword_26AA13658 = 0u;
  unk_26AA13668 = 0u;
  xmmword_26AA13678 = 0u;
  unk_26AA13688 = 0u;
  xmmword_26AA13698 = 0u;
  unk_26AA136A8 = 0u;
  xmmword_26AA136B8 = 0u;
  unk_26AA136C8 = 0u;
  xmmword_26AA136D8 = 0u;
  unk_26AA136E8 = 0u;
  xmmword_26AA136F8 = 0u;
  unk_26AA13708 = 0u;
  xmmword_26AA13718 = 0u;
  unk_26AA13728 = 0u;
  xmmword_26AA13738 = 0u;
  *(_DWORD *)((char *)&xmmword_26AA13738 + 15) = 0;
  byte_26AA13780 = 0;
  xmmword_26AA13760 = 0u;
  unk_26AA13770 = 0u;
  g_Pre_Positioning_SD = 0u;
  g_SV_Data_Decode_WD = 0u;
  unk_26AA13798 = 0u;
  xmmword_26AA137A8 = 0u;
  unk_26AA137B8 = 0u;
  xmmword_26AA137C8 = 0u;
  unk_26AA137D8 = 0u;
  xmmword_26AA137E8 = 0u;
  unk_26AA137F8 = 0u;
  xmmword_26AA13808 = 0u;
  unk_26AA13818 = 0u;
  xmmword_26AA13828 = 0u;
  *(_DWORD *)((char *)&xmmword_26AA13828 + 15) = 0;
  memset(v200, 0, 28);
  long long v199 = 0u;
  long long v198 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  long long v194 = 0u;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  bzero(v189, 0x50BuLL);
  memset(&v188[152], 0, 52);
  memset(&v188[116], 0, 135);
  memset(&v188[72], 0, 171);
  memset(v188, 0, 273);
  bzero(v187, 0x120BuLL);
  bzero(v186, 0x3A38uLL);
  bzero(v185, 0x3A38uLL);
  bzero(v201, 0x5B68uLL);
  memset(v184, 0, sizeof(v184));
  LOWORD(v183) = 0;
  BYTE2(v183) = 0;
  memset(v182, 0, 56);
  LOWORD(v181) = 0;
  BYTE2(v181) = 0;
  memset(v180, 0, 56);
  BYTE2(v179) = 0;
  LOWORD(v179) = 0;
  memset(v178, 0, 56);
  BYTE2(v177) = 0;
  LOWORD(v177) = 0;
  memset(v176, 0, sizeof(v176));
  BYTE2(v175) = 0;
  LOWORD(v175) = 0;
  memset(v174, 0, 56);
  BYTE2(v173) = 0;
  LOWORD(v173) = 0;
  memset(&v172[15], 0, 104);
  memset((char *)&v172[14] + 4, 0, 12);
  memset(&v172[10], 0, 53);
  memset((char *)&v172[9] + 4, 0, 12);
  memset(&v172[5], 0, 53);
  memset((char *)&v172[4] + 4, 0, 12);
  memset(v172, 0, 61);
  BYTE2(v171) = 0;
  LOWORD(v171) = 0;
  memset(v170, 0, 56);
  BYTE2(v169) = 0;
  LOWORD(v169) = 0;
  memset(&v168[7], 0, 56);
  memset((char *)&v168[6] + 4, 0, 12);
  memset(&v168[2], 0, 61);
  v168[0] = 0uLL;
  *(void *)((char *)&v168[1] + 5) = 0;
  *(void *)&v168[1] = 0;
  memset(v167, 0, 36);
  BYTE2(v166) = 0;
  LOWORD(v166) = 0;
  memset(&v165[39], 0, 112);
  memset((char *)&v165[38] + 4, 0, 12);
  memset(&v165[31], 0, 102);
  memset(v165, 0, 495);
  memset(&v164[2], 0, 229);
  memset(v157, 0, sizeof(v157));
  *(_DWORD *)((char *)v156 + 3) = 0;
  v156[0] = 0;
  memset(&v188[117], 0, 131);
  *((void *)&v183 + 1) = 0;
  *(void *)((char *)&v183 + 3) = 0;
  *((void *)&v181 + 1) = 0;
  *(void *)((char *)&v181 + 3) = 0;
  *((void *)&v179 + 1) = 0;
  *(void *)((char *)&v179 + 3) = 0;
  *((void *)&v177 + 1) = 0;
  *(void *)((char *)&v177 + 3) = 0;
  *((void *)&v175 + 1) = 0;
  *(void *)((char *)&v175 + 3) = 0;
  *((void *)&v173 + 1) = 0;
  *(void *)((char *)&v173 + 3) = 0;
  *((void *)&v171 + 1) = 0;
  *(void *)((char *)&v171 + 3) = 0;
  *((void *)&v169 + 1) = 0;
  *(void *)((char *)&v169 + 3) = 0;
  *((void *)&v166 + 1) = 0;
  *(void *)((char *)&v166 + 3) = 0;
  long long v155 = 0uLL;
  HIBYTE(v155) = 0;
  memset(v164, 0, 25);
  long long v163 = 0u;
  long long v162 = 0u;
  long long v161 = 0u;
  long long v190 = 0uLL;
  DWORD2(v191) = 0;
  *(void *)&long long v191 = 0;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  memset(v200, 0, 25);
  bzero(&v189[2], 0x509uLL);
  memset((char *)&v188[153] + 3, 0, 45);
  memset((char *)&v188[72] + 2, 0, 160);
  *(_OWORD *)((char *)&v188[110] + 3) = 0u;
  *(_OWORD *)((char *)&v188[64] + 1) = 0u;
  *(_OWORD *)((char *)v188 + 3) = 0u;
  *(_OWORD *)((char *)&v188[4] + 3) = 0u;
  *(_OWORD *)((char *)&v188[8] + 3) = 0u;
  *(_OWORD *)((char *)&v188[12] + 3) = 0u;
  *(_OWORD *)((char *)&v188[16] + 3) = 0u;
  *(_OWORD *)((char *)&v188[20] + 3) = 0u;
  *(_OWORD *)((char *)&v188[24] + 3) = 0u;
  *(_OWORD *)((char *)&v188[28] + 3) = 0u;
  *(_OWORD *)((char *)&v188[32] + 3) = 0u;
  *(_OWORD *)((char *)&v188[36] + 3) = 0u;
  *(_OWORD *)((char *)&v188[40] + 3) = 0u;
  *(_OWORD *)((char *)&v188[44] + 3) = 0u;
  *(_OWORD *)((char *)&v188[48] + 3) = 0u;
  *(_OWORD *)((char *)&v188[52] + 3) = 0u;
  *(_OWORD *)((char *)&v188[56] + 3) = 0u;
  *(_OWORD *)((char *)&v188[60] + 3) = 0u;
  bzero(&v187[6], 0x1205uLL);
  bzero(&v186[3], 0x3A35uLL);
  bzero(&v185[3], 0x3A35uLL);
  bzero((char *)v201 + 3, 0x5B65uLL);
  memset(&v184[1], 0, 19);
  memset((char *)v182 + 3, 0, 48);
  *(void *)&v182[3] = 0;
  memset((char *)v180 + 3, 0, 48);
  *(void *)&v180[3] = 0;
  memset((char *)v178 + 3, 0, 48);
  *(void *)&v178[3] = 0;
  memset((char *)v176 + 3, 0, 96);
  v176[6] = 0u;
  memset((char *)v174 + 3, 0, 53);
  memset((char *)&v172[18] + 3, 0, 48);
  *(void *)&v172[21] = 0;
  memset((char *)&v172[16] + 15, 0, 17);
  memset((char *)&v172[15] + 7, 0, 17);
  memset((char *)&v172[10] + 4, 0, 49);
  memset((char *)&v172[5] + 4, 0, 49);
  memset((char *)v172 + 4, 0, 57);
  memset((char *)v170 + 3, 0, 53);
  memset((char *)&v168[7] + 3, 0, 53);
  memset((char *)&v168[2] + 4, 0, 57);
  *(_OWORD *)((char *)v168 + 12) = 0uLL;
  *(void *)((char *)v168 + 4) = 0;
  BYTE12(v168[1]) = 0;
  *(_OWORD *)((char *)v167 + 7) = 0uLL;
  *(void *)((char *)&v167[1] + 12) = 0;
  *(void *)((char *)&v167[1] + 7) = 0;
  memset((char *)&v165[39] + 3, 0, 109);
  memset((char *)&v165[31] + 4, 0, 98);
  *(_OWORD *)((char *)&v165[29] + 15) = 0u;
  *(_OWORD *)((char *)&v165[29] + 5) = 0u;
  bzero(v160, 0x314uLL);
  __int16 v159 = 0;
  long long v158 = 0uLL;
  bzero((char *)&v156[1] + 3, 0x3E51uLL);
  xmmword_26A9B6868 = v198;
  unk_26A9B6878 = v199;
  xmmword_26A9B6888 = v200[0];
  *(long long *)((char *)&xmmword_26A9B6888 + 12) = *(_OWORD *)((char *)v200 + 12);
  xmmword_26A9B6828 = v194;
  unk_26A9B6838 = v195;
  xmmword_26A9B6848 = v196;
  unk_26A9B6858 = v197;
  g_Nav_Kalman_WD = v190;
  unk_26A9B67F8 = v191;
  xmmword_26A9B6808 = v192;
  unk_26A9B6818 = v193;
  word_26A9B68AC = 0;
  unk_26A9B68A4 = 0;
  memcpy(&unk_26A9B68AE, v189, 0x50BuLL);
  xmmword_26A9B6DB9 = *(_OWORD *)&v188[152];
  unk_26A9B6DC9 = *(_OWORD *)&v188[156];
  xmmword_26A9B6DD9 = *(_OWORD *)&v188[160];
  dword_26A9B6DE9 = v188[164];
  byte_26A9B6DED = 0;
  word_26A9B6DEE = 0;
  dword_26A9B6DF0 = 0;
  xmmword_26A9B6E54 = *(_OWORD *)&v188[140];
  unk_26A9B6E64 = *(_OWORD *)&v188[144];
  unk_26A9B6E73 = *(void *)((char *)&v188[147] + 3);
  xmmword_26A9B6E14 = *(_OWORD *)&v188[124];
  unk_26A9B6E24 = *(_OWORD *)&v188[128];
  xmmword_26A9B6E34 = *(_OWORD *)&v188[132];
  unk_26A9B6E44 = *(_OWORD *)&v188[136];
  xmmword_26A9B6DF4 = *(_OWORD *)&v188[116];
  *(_OWORD *)algn_26A9B6E04 = *(_OWORD *)&v188[120];
  *(_DWORD *)((char *)&qword_26A9B6E7B + 7) = 0;
  qword_26A9B6E7B = 0;
  xmmword_26A9B6F06 = *(_OWORD *)&v188[104];
  unk_26A9B6F16 = *(_OWORD *)&v188[108];
  unk_26A9B6F21 = *(_OWORD *)((char *)&v188[110] + 3);
  xmmword_26A9B6EC6 = *(_OWORD *)&v188[88];
  unk_26A9B6ED6 = *(_OWORD *)&v188[92];
  xmmword_26A9B6EE6 = *(_OWORD *)&v188[96];
  unk_26A9B6EF6 = *(_OWORD *)&v188[100];
  xmmword_26A9B6E86 = *(_OWORD *)&v188[72];
  unk_26A9B6E96 = *(_OWORD *)&v188[76];
  xmmword_26A9B6EA6 = *(_OWORD *)&v188[80];
  unk_26A9B6EB6 = *(_OWORD *)&v188[84];
  memcpy(&unk_26A9B6F31, v188, 0x111uLL);
  memcpy(&unk_26A9B7042, v187, 0x120BuLL);
  memcpy((char *)&g_Nav_Kalman_WD + 6757, v186, 0x3A38uLL);
  memcpy((char *)&g_Nav_Kalman_WD + 21661, v185, 0x3A38uLL);
  memcpy((char *)&g_Nav_Kalman_WD + 36565, v201, 0x5B68uLL);
  unsigned int v13 = (char *)&g_Nav_Kalman_WD + 59965;
  *(_OWORD *)unsigned int v13 = *(_OWORD *)v184;
  *((_DWORD *)v13 + 4) = *(_DWORD *)&v184[16];
  *(long long *)((char *)&g_Nav_Kalman_WD + 59985) = v183;
  uint64_t v14 = (char *)&g_Nav_Kalman_WD + 60001;
  long long v15 = v182[1];
  *(_OWORD *)uint64_t v14 = v182[0];
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v182[2];
  *((void *)v14 + 6) = *(void *)&v182[3];
  *(long long *)((char *)&g_Nav_Kalman_WD + 60057) = v181;
  uint64_t v16 = (char *)&g_Nav_Kalman_WD + 60073;
  long long v17 = v180[0];
  long long v18 = v180[1];
  long long v19 = v180[2];
  *((void *)v16 + 6) = *(void *)&v180[3];
  *((_OWORD *)v16 + 1) = v18;
  *((_OWORD *)v16 + 2) = v19;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60129) = v179;
  *(_OWORD *)uint64_t v16 = v17;
  uint64_t v20 = (char *)&g_Nav_Kalman_WD + 60145;
  *((void *)v20 + 6) = *(void *)&v178[3];
  long long v21 = v178[2];
  long long v22 = v178[0];
  *((_OWORD *)v20 + 1) = v178[1];
  *((_OWORD *)v20 + 2) = v21;
  *(_OWORD *)uint64_t v20 = v22;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60201) = v177;
  double v23 = (long long *)((char *)&g_Nav_Kalman_WD + 60217);
  long long v24 = v176[1];
  *double v23 = v176[0];
  v23[1] = v24;
  long long v25 = v176[2];
  long long v26 = v176[3];
  long long v27 = v176[6];
  long long v28 = v176[4];
  v23[5] = v176[5];
  v23[6] = v27;
  v23[3] = v26;
  v23[4] = v28;
  v23[2] = v25;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60329) = v175;
  double v29 = (char *)&g_Nav_Kalman_WD + 60345;
  long long v30 = v174[0];
  long long v31 = v174[1];
  long long v32 = v174[2];
  *((void *)v29 + 6) = *(void *)&v174[3];
  *((_OWORD *)v29 + 1) = v31;
  *((_OWORD *)v29 + 2) = v32;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60401) = v173;
  *(_OWORD *)double v29 = v30;
  int v33 = (char *)&g_Nav_Kalman_WD + 60417;
  long long v34 = v172[18];
  long long v35 = v172[19];
  long long v36 = v172[20];
  *((void *)v33 + 6) = *(void *)&v172[21];
  *((_OWORD *)v33 + 1) = v35;
  *((_OWORD *)v33 + 2) = v36;
  *(_OWORD *)int v33 = v34;
  unsigned int v37 = (char *)&g_Nav_Kalman_WD + 60473;
  v37[2] = 0;
  *(_WORD *)unsigned int v37 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15119) = 0;
  *((unsigned char *)&g_Nav_Kalman_WD + 60480) = 0;
  double v38 = (char *)&g_Nav_Kalman_WD + 60481;
  long long v39 = *(_OWORD *)((char *)&v172[16] + 8);
  *((void *)v38 + 2) = *((void *)&v172[17] + 1);
  *(_OWORD *)double v38 = v39;
  int v40 = (char *)&g_Nav_Kalman_WD + 60505;
  long long v41 = v172[15];
  *((void *)v40 + 2) = *(void *)&v172[16];
  *(_OWORD *)int v40 = v41;
  double v42 = (char *)&g_Nav_Kalman_WD + 60529;
  uint64_t v43 = *(void *)((char *)&v172[14] + 4);
  *((_DWORD *)v42 + 2) = HIDWORD(v172[14]);
  *(void *)double v42 = v43;
  double v44 = (char *)&g_Nav_Kalman_WD + 60541;
  v44[2] = 0;
  *(_WORD *)double v44 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15136) = 0;
  uint64_t v45 = (char *)&g_Nav_Kalman_WD + 60548;
  long long v46 = v172[10];
  long long v47 = v172[11];
  long long v48 = v172[12];
  *(void *)(v45 + 45) = *(void *)((char *)&v172[12] + 13);
  *((_OWORD *)v45 + 1) = v47;
  *((_OWORD *)v45 + 2) = v48;
  *(_OWORD *)uint64_t v45 = v46;
  double v49 = (char *)&g_Nav_Kalman_WD + 60601;
  uint64_t v50 = *(void *)((char *)&v172[9] + 4);
  *((_DWORD *)v49 + 2) = HIDWORD(v172[9]);
  *(void *)double v49 = v50;
  double v51 = (char *)&g_Nav_Kalman_WD + 60613;
  v51[2] = 0;
  *(_WORD *)double v51 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15154) = 0;
  double v52 = (char *)&g_Nav_Kalman_WD + 60620;
  long long v53 = v172[5];
  long long v54 = v172[6];
  long long v55 = v172[7];
  *(void *)(v52 + 45) = *(void *)((char *)&v172[7] + 13);
  *((_OWORD *)v52 + 1) = v54;
  *((_OWORD *)v52 + 2) = v55;
  *(_OWORD *)double v52 = v53;
  unsigned int v56 = (char *)&g_Nav_Kalman_WD + 60673;
  uint64_t v57 = *(void *)((char *)&v172[4] + 4);
  *((_DWORD *)v56 + 2) = HIDWORD(v172[4]);
  *(void *)unsigned int v56 = v57;
  double v58 = (char *)&g_Nav_Kalman_WD + 60685;
  v58[2] = 0;
  *(_WORD *)double v58 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15172) = 0;
  double v59 = (long long *)((char *)&g_Nav_Kalman_WD + 60692);
  long long v60 = v172[0];
  long long v61 = v172[1];
  long long v62 = v172[2];
  *(_OWORD *)((char *)v59 + 45) = *(_OWORD *)((char *)&v172[2] + 13);
  v59[1] = v61;
  v59[2] = v62;
  *double v59 = v60;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60753) = v171;
  uint64_t v63 = (char *)&g_Nav_Kalman_WD + 60769;
  long long v64 = v170[0];
  long long v65 = v170[1];
  long long v66 = v170[2];
  *((void *)v63 + 6) = *(void *)&v170[3];
  *((_OWORD *)v63 + 1) = v65;
  *((_OWORD *)v63 + 2) = v66;
  *(_OWORD *)uint64_t v63 = v64;
  *(long long *)((char *)&g_Nav_Kalman_WD + 60825) = v169;
  double v67 = (char *)&g_Nav_Kalman_WD + 60841;
  long long v68 = v168[7];
  long long v69 = v168[8];
  long long v70 = v168[9];
  *((void *)v67 + 6) = *(void *)&v168[10];
  *((_OWORD *)v67 + 1) = v69;
  *((_OWORD *)v67 + 2) = v70;
  *(_OWORD *)double v67 = v68;
  unint64_t v71 = (char *)&g_Nav_Kalman_WD + 60897;
  uint64_t v72 = *(void *)((char *)&v168[6] + 4);
  *((_DWORD *)v71 + 2) = HIDWORD(v168[6]);
  *(void *)unint64_t v71 = v72;
  double v73 = (char *)&g_Nav_Kalman_WD + 60909;
  v73[2] = 0;
  *(_WORD *)double v73 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15228) = 0;
  int v74 = (long long *)((char *)&g_Nav_Kalman_WD + 60916);
  long long v75 = v168[2];
  long long v76 = v168[3];
  long long v77 = v168[4];
  *(_OWORD *)((char *)v74 + 45) = *(_OWORD *)((char *)&v168[4] + 13);
  v74[1] = v76;
  v74[2] = v77;
  *int v74 = v75;
  double v78 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 60977);
  *(_DWORD *)((char *)v78 + 3) = 0;
  *double v78 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15246) = 0;
  __double2 v79 = (long long *)((char *)&g_Nav_Kalman_WD + 60988);
  long long v80 = v168[0];
  *(_OWORD *)((char *)v79 + 13) = *(_OWORD *)((char *)v168 + 13);
  *__double2 v79 = v80;
  unint64_t v81 = (char *)&g_Nav_Kalman_WD + 61017;
  long long v82 = v167[0];
  long long v83 = v167[1];
  *((_DWORD *)v81 + 8) = v167[2];
  *(_OWORD *)unint64_t v81 = v82;
  *((_OWORD *)v81 + 1) = v83;
  unint64_t v84 = (char *)&g_Nav_Kalman_WD + 61053;
  v84[2] = 0;
  *((unsigned char *)&g_Nav_Kalman_WD + 61056) = 0;
  *(long long *)((char *)&g_Nav_Kalman_WD + 61057) = v166;
  *(_WORD *)unint64_t v84 = 0;
  double v85 = (long long *)((char *)&g_Nav_Kalman_WD + 61073);
  long long v86 = v165[40];
  *double v85 = v165[39];
  v85[1] = v86;
  long long v87 = v165[41];
  long long v88 = v165[42];
  long long v89 = v165[45];
  long long v90 = v165[43];
  v85[5] = v165[44];
  v85[6] = v89;
  v85[3] = v88;
  v85[4] = v90;
  v85[2] = v87;
  int v91 = (char *)&g_Nav_Kalman_WD + 61185;
  uint64_t v92 = *(void *)((char *)&v165[38] + 4);
  *((_DWORD *)v91 + 2) = HIDWORD(v165[38]);
  *(void *)int v91 = v92;
  int v93 = (char *)&g_Nav_Kalman_WD + 61197;
  v93[2] = 0;
  *(_WORD *)int v93 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15300) = 0;
  int v94 = (char *)&g_Nav_Kalman_WD + 61204;
  long long v95 = v165[32];
  *(_OWORD *)int v94 = v165[31];
  *((_OWORD *)v94 + 1) = v95;
  long long v96 = v165[33];
  long long v97 = v165[34];
  long long v98 = v165[35];
  long long v99 = v165[36];
  *(void *)(v94 + 94) = *(void *)((char *)&v165[36] + 14);
  *((_OWORD *)v94 + 4) = v98;
  *((_OWORD *)v94 + 5) = v99;
  *((_OWORD *)v94 + 2) = v96;
  *((_OWORD *)v94 + 3) = v97;
  int v100 = (void *)((char *)&g_Nav_Kalman_WD + 61306);
  *(void *)((char *)v100 + 6) = 0;
  *int v100 = 0;
  long long v101 = (char *)&g_Nav_Kalman_WD + 61304;
  *(_DWORD *)(v101 + 31) = 0;
  *((_OWORD *)v101 + 1) = v155;
  memcpy((char *)&g_Nav_Kalman_WD + 61339, v165, 0x1EFuLL);
  int v102 = (char *)&g_Nav_Kalman_WD + 61834;
  long long v103 = v164[15];
  *((_OWORD *)v102 + 12) = v164[14];
  *((_OWORD *)v102 + 13) = v103;
  long long v104 = v164[11];
  *((_OWORD *)v102 + 8) = v164[10];
  *((_OWORD *)v102 + 9) = v104;
  long long v105 = v164[13];
  *((_OWORD *)v102 + 10) = v164[12];
  *((_OWORD *)v102 + 11) = v105;
  long long v106 = v164[7];
  *((_OWORD *)v102 + 4) = v164[6];
  *((_OWORD *)v102 + 5) = v106;
  long long v107 = v164[9];
  *((_OWORD *)v102 + 6) = v164[8];
  *((_OWORD *)v102 + 7) = v107;
  long long v108 = v164[3];
  *(_OWORD *)int v102 = v164[2];
  *((_OWORD *)v102 + 1) = v108;
  long long v109 = v164[5];
  *((_OWORD *)v102 + 2) = v164[4];
  *((_OWORD *)v102 + 3) = v109;
  long long v110 = v161;
  xmmword_26A9C5A68 = v162;
  xmmword_26A9C5A78 = v163;
  xmmword_26A9C5A88 = v164[0];
  long long v111 = &g_Nav_Kalman_WD + 3877;
  *(long long *)((char *)v111 + 89) = *(_OWORD *)((char *)v164 + 9);
  uint64_t v112 = *(void *)((char *)&v164[15] + 13);
  *((unsigned char *)&g_Nav_Kalman_WD + 62063) = 0;
  *(void *)(v102 + 221) = v112;
  xmmword_26A9C5A58 = v110;
  unsigned int v113 = (char *)&g_Nav_Kalman_WD + 62137;
  *(_WORD *)unsigned int v113 = 0;
  v113[2] = 0;
  *((unsigned char *)v111 + 108) = 0;
  long long v114 = (char *)&g_Nav_Kalman_WD + 62141;
  v114[2] = 0;
  *(_WORD *)long long v114 = 0;
  *((_DWORD *)v111 + 28) = 0;
  *((unsigned char *)v111 + 116) = 0;
  long long v115 = (char *)&g_Nav_Kalman_WD + 62149;
  *(_WORD *)long long v115 = 0;
  v115[2] = 0;
  *((_DWORD *)v111 + 30) = 0;
  *((unsigned char *)v111 + 124) = 0;
  long long v116 = (char *)&g_Nav_Kalman_WD + 62157;
  *(_WORD *)long long v116 = 0;
  v116[2] = 0;
  *((_DWORD *)v111 + 32) = 0;
  *((unsigned char *)v111 + 132) = 0;
  long long v117 = (char *)&g_Nav_Kalman_WD + 62165;
  v117[2] = 0;
  *(_WORD *)long long v117 = 0;
  *((_DWORD *)v111 + 34) = 0;
  *((unsigned char *)v111 + 140) = 0;
  long long v118 = (char *)&g_Nav_Kalman_WD + 62173;
  v118[2] = 0;
  *(_WORD *)long long v118 = 0;
  *((_DWORD *)v111 + 36) = 0;
  *((unsigned char *)v111 + 148) = 0;
  double v119 = (char *)&g_Nav_Kalman_WD + 62181;
  v119[2] = 0;
  *(_WORD *)double v119 = 0;
  *((_DWORD *)v111 + 38) = 0;
  *((unsigned char *)v111 + 156) = 0;
  long long v120 = (char *)&g_Nav_Kalman_WD + 62189;
  v120[2] = 0;
  *(_WORD *)long long v120 = 0;
  *((_DWORD *)v111 + 40) = 0;
  *((unsigned char *)v111 + 164) = 0;
  double v121 = (char *)&g_Nav_Kalman_WD + 62197;
  v121[2] = 0;
  *(_WORD *)double v121 = 0;
  *((_DWORD *)v111 + 42) = 0;
  *((unsigned char *)v111 + 172) = 0;
  double v122 = (char *)&g_Nav_Kalman_WD + 62205;
  v122[2] = 0;
  *(_WORD *)double v122 = 0;
  *((_DWORD *)v111 + 44) = 0;
  *((unsigned char *)v111 + 180) = 0;
  double v123 = (char *)&g_Nav_Kalman_WD + 62213;
  v123[2] = 0;
  *(_WORD *)double v123 = 0;
  *((_DWORD *)v111 + 46) = 0;
  *((unsigned char *)v111 + 188) = 0;
  uint64_t v124 = (char *)&g_Nav_Kalman_WD + 62221;
  v124[2] = 0;
  *(_WORD *)uint64_t v124 = 0;
  *((_DWORD *)v111 + 48) = 0;
  *((unsigned char *)v111 + 196) = 0;
  long long v125 = (char *)&g_Nav_Kalman_WD + 62229;
  v125[2] = 0;
  *(_WORD *)long long v125 = 0;
  *((_DWORD *)v111 + 50) = 0;
  *((unsigned char *)v111 + 204) = 0;
  long long v126 = (char *)&g_Nav_Kalman_WD + 62237;
  v126[2] = 0;
  *(_WORD *)long long v126 = 0;
  *((_DWORD *)v111 + 52) = 0;
  *((unsigned char *)v111 + 212) = 0;
  long long v127 = (char *)&g_Nav_Kalman_WD + 62245;
  v127[2] = 0;
  *(_WORD *)long long v127 = 0;
  *((_DWORD *)v111 + 54) = 0;
  *((unsigned char *)v111 + 220) = 0;
  long long v128 = (char *)&g_Nav_Kalman_WD + 62253;
  v128[2] = 0;
  *(_WORD *)long long v128 = 0;
  *((_DWORD *)v111 + 56) = 0;
  *((unsigned char *)v111 + 228) = 0;
  long long v129 = (char *)&g_Nav_Kalman_WD + 62261;
  v129[2] = 0;
  *(_WORD *)long long v129 = 0;
  *((_DWORD *)v111 + 58) = 0;
  *((unsigned char *)v111 + 236) = 0;
  long long v130 = (char *)&g_Nav_Kalman_WD + 62269;
  v130[2] = 0;
  *(_WORD *)long long v130 = 0;
  *((_DWORD *)v111 + 60) = 0;
  *((unsigned char *)v111 + 244) = 0;
  long long v131 = (char *)&g_Nav_Kalman_WD + 62277;
  v131[2] = 0;
  *(_WORD *)long long v131 = 0;
  *((_DWORD *)v111 + 62) = 0;
  *((unsigned char *)v111 + 252) = 0;
  double v132 = (char *)&g_Nav_Kalman_WD + 62285;
  v132[2] = 0;
  *(_WORD *)double v132 = 0;
  *((_DWORD *)v111 + 64) = 0;
  *((unsigned char *)v111 + 260) = 0;
  long long v133 = (char *)&g_Nav_Kalman_WD + 62293;
  v133[2] = 0;
  *(_WORD *)long long v133 = 0;
  *((_DWORD *)v111 + 66) = 0;
  *((unsigned char *)v111 + 268) = 0;
  long long v134 = (char *)&g_Nav_Kalman_WD + 62301;
  v134[2] = 0;
  *(_WORD *)long long v134 = 0;
  *((_DWORD *)v111 + 68) = 0;
  *((unsigned char *)v111 + 276) = 0;
  double v135 = (char *)&g_Nav_Kalman_WD + 62309;
  v135[2] = 0;
  *(_WORD *)double v135 = 0;
  *((_DWORD *)v111 + 70) = 0;
  *((unsigned char *)v111 + 284) = 0;
  uint64_t v136 = (char *)&g_Nav_Kalman_WD + 62317;
  v136[2] = 0;
  *(_WORD *)uint64_t v136 = 0;
  *((_DWORD *)v111 + 72) = 0;
  *((unsigned char *)v111 + 292) = 0;
  double v137 = (char *)&g_Nav_Kalman_WD + 62325;
  v137[2] = 0;
  *(_WORD *)double v137 = 0;
  *((_DWORD *)v111 + 74) = 0;
  *((unsigned char *)v111 + 300) = 0;
  double v138 = (char *)&g_Nav_Kalman_WD + 62333;
  v138[2] = 0;
  *(_WORD *)double v138 = 0;
  *((_DWORD *)v111 + 76) = 0;
  *((unsigned char *)v111 + 308) = 0;
  long long v139 = (char *)&g_Nav_Kalman_WD + 62341;
  v139[2] = 0;
  *(_WORD *)long long v139 = 0;
  *((_DWORD *)v111 + 78) = 0;
  *((unsigned char *)v111 + 316) = 0;
  uint64_t v140 = (char *)&g_Nav_Kalman_WD + 62349;
  v140[2] = 0;
  *(_WORD *)uint64_t v140 = 0;
  *((_DWORD *)v111 + 80) = 0;
  *((unsigned char *)v111 + 324) = 0;
  double v141 = (char *)&g_Nav_Kalman_WD + 62357;
  double v141[2] = 0;
  *(_WORD *)double v141 = 0;
  *((_DWORD *)v111 + 82) = 0;
  *((unsigned char *)v111 + 332) = 0;
  uint64_t v142 = (char *)&g_Nav_Kalman_WD + 62365;
  v142[2] = 0;
  *(_WORD *)uint64_t v142 = 0;
  *((_DWORD *)v111 + 84) = 0;
  *((unsigned char *)v111 + 340) = 0;
  double v143 = (char *)&g_Nav_Kalman_WD + 62373;
  v143[2] = 0;
  *(_WORD *)double v143 = 0;
  *((_DWORD *)v111 + 86) = 0;
  *((unsigned char *)v111 + 348) = 0;
  double v144 = (char *)&g_Nav_Kalman_WD + 62381;
  v144[2] = 0;
  *(_WORD *)double v144 = 0;
  *((_DWORD *)v111 + 88) = 0;
  *((unsigned char *)v111 + 356) = 0;
  uint64_t v145 = (char *)&g_Nav_Kalman_WD + 62389;
  v145[2] = 0;
  *(_WORD *)uint64_t v145 = 0;
  *((_DWORD *)v111 + 90) = 0;
  *((unsigned char *)v111 + 364) = 0;
  double v146 = (char *)&g_Nav_Kalman_WD + 62397;
  v146[2] = 0;
  *(_WORD *)double v146 = 0;
  *((_DWORD *)v111 + 92) = 0;
  *((unsigned char *)v111 + 372) = 0;
  double v147 = (char *)&g_Nav_Kalman_WD + 62405;
  v147[2] = 0;
  *(_WORD *)double v147 = 0;
  *((void *)v111 + 47) = 0;
  memcpy(&g_Nav_Kalman_WD + 3901, v160, 0x314uLL);
  double v148 = (char *)&g_Nav_Kalman_WD + 63196;
  *((void *)v148 + 1) = 0;
  *((_DWORD *)v148 + 4) = 0;
  xmmword_26A9C5ED8 = v158;
  double v149 = &g_Nav_Kalman_WD + 3952;
  *(_WORD *)double v149 = v159;
  memcpy((char *)&g_Nav_Kalman_WD + 63234, v157, 0x142uLL);
  double v150 = &g_Nav_Kalman_WD + 3972;
  *(long long *)((char *)v150 + 24) = 0u;
  *(long long *)((char *)v150 + 40) = 0u;
  *(long long *)((char *)v150 + 56) = 0u;
  *(long long *)((char *)v150 + 8) = 0u;
  *(long long *)((char *)v149 + 424) = 0u;
  *(long long *)((char *)v149 + 472) = 0u;
  *(long long *)((char *)v149 + 456) = 0u;
  *((_DWORD *)&g_Nav_Kalman_WD + 15889) = 0;
  *((unsigned char *)&unk_26A9B6970 + 63232) = 0;
  double v151 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63625);
  *double v151 = 0;
  *(_DWORD *)((char *)v151 + 3) = 0;
  *((void *)&unk_26A9B6978 + 7904) = 0;
  *((unsigned char *)&unk_26A9B6980 + 63232) = 0;
  double v152 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63641);
  *(_DWORD *)((char *)v152 + 3) = 0;
  *double v152 = 0;
  *((void *)&unk_26A9B6988 + 7904) = 0;
  *((unsigned char *)&unk_26A9B69D0 + 63232) = 0;
  *(long long *)((char *)v149 + 440) = 0u;
  std::string v153 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63721);
  *(_DWORD *)((char *)v153 + 3) = 0;
  *std::string v153 = 0;
  *((void *)&unk_26A9B69D8 + 7904) = 0;
  *((unsigned char *)&unk_26A9B69E0 + 63232) = 0;
  memcpy((char *)&g_Nav_Kalman_WD + 63737, v156, 0x3E58uLL);
  dword_26A9C9F39 = 0;
  *(int *)((char *)&dword_26A9C9F39 + 3) = 0;
  xmmword_26A9C9F40 = xmmword_263D822A0;
  unk_26A9C9F50 = xmmword_263D822B0;
  qword_26A9C9F60 = 0;
  g_SV_State_Update_WD = 0;
  *(void *)algn_26AA13844 = 0;
  memset(&v156[256], 0, 400);
  *(int *)((char *)&dword_26AA13DE9 + 3) = 0;
  dword_26AA13DE9 = 0;
  dword_26AA13E39 = 0;
  *(int *)((char *)&dword_26AA13E39 + 3) = 0;
  *(_DWORD *)unsigned int v189 = 0;
  *(_DWORD *)&v189[3] = 0;
  memset(v186, 0, 322);
  dword_26AA13FF1 = 0;
  *(int *)((char *)&dword_26AA13FF1 + 3) = 0;
  dword_26AA14001 = 0;
  *(int *)((char *)&dword_26AA14001 + 3) = 0;
  dword_26AA14051 = 0;
  *(int *)((char *)&dword_26AA14051 + 3) = 0;
  *(_DWORD *)&v160[3] = 0;
  *(_DWORD *)double v160 = 0;
  memset(v185, 0, 322);
  *(int *)((char *)&dword_26AA14209 + 3) = 0;
  dword_26AA14209 = 0;
  dword_26AA14219 = 0;
  *(int *)((char *)&dword_26AA14219 + 3) = 0;
  dword_26AA14269 = 0;
  *(int *)((char *)&dword_26AA14269 + 3) = 0;
  LODWORD(v165[0]) = 0;
  *(_DWORD *)((char *)v165 + 3) = 0;
  memset(v187, 0, 322);
  dword_26AA14421 = 0;
  *(int *)((char *)&dword_26AA14421 + 3) = 0;
  dword_26AA14431 = 0;
  *(int *)((char *)&dword_26AA14431 + 3) = 0;
  *(int *)((char *)&dword_26AA14481 + 3) = 0;
  dword_26AA14481 = 0;
  LODWORD(v201[0]) = 0;
  *(_DWORD *)((char *)v201 + 3) = 0;
  byte_26AA13E38 = 0;
  unk_26AA13E28 = 0u;
  unk_26AA13E18 = 0u;
  unk_26AA13E08 = 0u;
  unk_26AA13DF8 = 0u;
  byte_26AA13FF0 = 0;
  xmmword_26AA13FE0 = 0u;
  xmmword_26AA13FD0 = 0u;
  xmmword_26AA13FC0 = 0u;
  xmmword_26AA13FB0 = 0u;
  xmmword_26AA14010 = 0u;
  xmmword_26AA14020 = 0u;
  xmmword_26AA14030 = 0u;
  xmmword_26AA14040 = 0u;
  byte_26AA14050 = 0;
  byte_26AA14208 = 0;
  unk_26AA141F8 = 0u;
  unk_26AA141E8 = 0u;
  unk_26AA141D8 = 0u;
  unk_26AA141C8 = 0u;
  unk_26AA14228 = 0u;
  unk_26AA14238 = 0u;
  unk_26AA14248 = 0u;
  unk_26AA14258 = 0u;
  byte_26AA14268 = 0;
  byte_26AA14420 = 0;
  xmmword_26AA14410 = 0u;
  xmmword_26AA14400 = 0u;
  xmmword_26AA143F0 = 0u;
  xmmword_26AA143E0 = 0u;
  xmmword_26AA14440 = 0u;
  xmmword_26AA14450 = 0u;
  xmmword_26AA14460 = 0u;
  xmmword_26AA14470 = 0u;
  byte_26AA14480 = 0;
  bzero(v156, 0x402uLL);
  memset(&v189[7], 0, 26);
  memset(&v160[7], 0, 26);
  *(_OWORD *)((char *)v165 + 7) = 0uLL;
  *(void *)((char *)&v165[1] + 7) = 0;
  *(_WORD *)((char *)&v165[1] + 15) = 0;
  bzero((char *)v201 + 7, 0x824uLL);
  memcpy(&g_GNSS_Debug_Data, v156, 0x590uLL);
  qword_26AA13DE0 = 0;
  byte_26AA13DE8 = 0;
  qword_26AA13DF0 = 0;
  qword_26AA13E40 = 0;
  byte_26AA13E48 = 0;
  xmmword_26AA13E49 = *(_OWORD *)v189;
  unk_26AA13E59 = *(_OWORD *)&v189[16];
  byte_26AA13E69 = v189[32];
  memcpy(&unk_26AA13E6A, v186, 0x142uLL);
  dword_26AA13FAC = 0;
  qword_26AA13FF8 = 0;
  byte_26AA14000 = 0;
  qword_26AA14008 = 0;
  qword_26AA14058 = 0;
  byte_26AA14060 = 0;
  xmmword_26AA14061 = *(_OWORD *)v160;
  unk_26AA14071 = *(_OWORD *)&v160[16];
  byte_26AA14081 = v160[32];
  memcpy(&unk_26AA14082, v185, 0x142uLL);
  dword_26AA141C4 = 0;
  qword_26AA14210 = 0;
  byte_26AA14218 = 0;
  qword_26AA14220 = 0;
  qword_26AA14270 = 0;
  byte_26AA14278 = 0;
  xmmword_26AA14279 = v165[0];
  unk_26AA14289 = v165[1];
  byte_26AA14299 = v165[2];
  memcpy(&unk_26AA1429A, v187, 0x142uLL);
  dword_26AA143DC = 0;
  qword_26AA14428 = 0;
  byte_26AA14430 = 0;
  qword_26AA14438 = 0;
  qword_26AA14488 = 0;
  byte_26AA14490 = 0;
  return memcpy(&unk_26AA14491, v201, 0x82BuLL);
}

char *GNSS_Log_p_list_Ptr_Mismatch(char *result, const void *a2, const void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2 != a3)
  {
    uint64_t v4 = v18;
    uint64_t v16 = v18;
    long long v17 = &v19;
    v15[1] = v18;
    char v5 = 69;
    uint64_t v6 = 1u;
    do
    {
      v15[0] = v4 + 1;
      char *v4 = v5;
      uint64_t v4 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        uint64_t v4 = v16;
        v15[0] = v16;
      }
      char v5 = aErrorPListCorr[v6++];
    }
    while (v6 != 30);
    char v7 = *result;
    if (*result)
    {
      int v8 = (unsigned __int8 *)(result + 1);
      do
      {
        v15[0] = v4 + 1;
        char *v4 = v7;
        uint64_t v4 = (char *)v15[0];
        if (v15[0] >= (unint64_t)v17)
        {
          uint64_t v4 = v16;
          v15[0] = v16;
        }
        int v9 = *v8++;
        char v7 = v9;
      }
      while (v9);
    }
    uint64_t v10 = 0;
    char v11 = 58;
    do
    {
      v15[0] = v4 + 1;
      char *v4 = v11;
      uint64_t v4 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        uint64_t v4 = v16;
        v15[0] = v16;
      }
      char v11 = asc_263D7F60D[++v10];
    }
    while (v10 != 2);
    sprintf_p((uint64_t)v15, (unint64_t)a2);
    uint64_t v12 = 0;
    char v13 = 32;
    uint64_t v14 = (char *)v15[0];
    do
    {
      v15[0] = v14 + 1;
      *uint64_t v14 = v13;
      uint64_t v14 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        uint64_t v14 = v16;
        v15[0] = v16;
      }
      char v13 = asc_263D7F610[++v12];
    }
    while (v12 != 4);
    sprintf_p((uint64_t)v15, (unint64_t)a3);
    *(unsigned char *)v15[0] = 0;
    return EvCrt_v("%s", v18);
  }
  return result;
}

const void **GNSS_Validate_p_list(const void **result, const char *a2)
{
  uint64_t v3 = result;
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = result[1];
  if (v4 != (const void *)qword_26AA2DC98
    || result[2] != (const void *)qword_26AA2DCA0
    || result[3] != (const void *)qword_26AA2DCA8
    || result[4] != (const void *)qword_26AA2DCB0
    || result[5] != (const void *)qword_26AA2DCB8
    || result[6] != (const void *)qword_26AA2DCC0
    || result[7] != (const void *)qword_26AA2DCC8
    || result[8] != (const void *)qword_26AA2DCD0
    || result[9] != (const void *)qword_26AA2DCD8
    || result[10] != (const void *)qword_26AA2DCE0
    || result[11] != (const void *)qword_26AA2DCE8
    || result[12] != (const void *)qword_26AA2DCF0
    || result[13] != (const void *)qword_26AA2DCF8
    || result[14] != (const void *)qword_26AA2DD00
    || result[15] != (const void *)qword_26AA2DD08
    || result[16] != (const void *)qword_26AA2DD10
    || result[17] != (const void *)qword_26AA2DD18
    || result[18] != (const void *)qword_26AA2DD20
    || result[19] != (const void *)qword_26AA2DD28
    || result[21] != (const void *)qword_26AA2DD38
    || result[22] != (const void *)qword_26AA2DD40
    || result[23] != (const void *)qword_26AA2DD48
    || result[25] != (const void *)qword_26AA2DD58
    || result[26] != (const void *)qword_26AA2DD60
    || result[27] != (const void *)qword_26AA2DD68
    || result[28] != (const void *)qword_26AA2DD70
    || result[29] != (const void *)qword_26AA2DD78
    || result[30] != (const void *)qword_26AA2DD80
    || result[31] != (const void *)qword_26AA2DD88
    || result[32] != (const void *)qword_26AA2DD90
    || result[33] != (const void *)qword_26AA2DD98
    || result[34] != (const void *)qword_26AA2DDA0
    || result[35] != (const void *)qword_26AA2DDA8
    || result[36] != (const void *)qword_26AA2DDB0
    || result[37] != (const void *)qword_26AA2DDB8)
  {
    GNSS_Log_p_list_Ptr_Mismatch("DBtt", v4, (const void *)qword_26AA2DC98);
    GNSS_Log_p_list_Ptr_Mismatch("DBrm", v3[2], (const void *)qword_26AA2DCA0);
    GNSS_Log_p_list_Ptr_Mismatch("DBsf", v3[3], (const void *)qword_26AA2DCA8);
    GNSS_Log_p_list_Ptr_Mismatch("DBae", v3[4], (const void *)qword_26AA2DCB0);
    GNSS_Log_p_list_Ptr_Mismatch("DBaa", v3[5], (const void *)qword_26AA2DCB8);
    GNSS_Log_p_list_Ptr_Mismatch("DBts", v3[6], (const void *)qword_26AA2DCC0);
    GNSS_Log_p_list_Ptr_Mismatch("DBnm", v3[7], (const void *)qword_26AA2DCC8);
    GNSS_Log_p_list_Ptr_Mismatch("DBcr", v3[8], (const void *)qword_26AA2DCD0);
    GNSS_Log_p_list_Ptr_Mismatch("DBss", v3[9], (const void *)qword_26AA2DCD8);
    GNSS_Log_p_list_Ptr_Mismatch("DBns", v3[10], (const void *)qword_26AA2DCE0);
    GNSS_Log_p_list_Ptr_Mismatch("DBst", v3[11], (const void *)qword_26AA2DCE8);
    GNSS_Log_p_list_Ptr_Mismatch("DBtm", v3[12], (const void *)qword_26AA2DCF0);
    GNSS_Log_p_list_Ptr_Mismatch("DBsn", v3[13], (const void *)qword_26AA2DCF8);
    GNSS_Log_p_list_Ptr_Mismatch("MEsd", v3[14], (const void *)qword_26AA2DD00);
    GNSS_Log_p_list_Ptr_Mismatch("GMsd", v3[15], (const void *)qword_26AA2DD08);
    GNSS_Log_p_list_Ptr_Mismatch("NKsd", v3[16], (const void *)qword_26AA2DD10);
    GNSS_Log_p_list_Ptr_Mismatch("DDsd", v3[17], (const void *)qword_26AA2DD18);
    GNSS_Log_p_list_Ptr_Mismatch("STsd", v3[18], (const void *)qword_26AA2DD20);
    GNSS_Log_p_list_Ptr_Mismatch("PPsd", v3[19], (const void *)qword_26AA2DD28);
    GNSS_Log_p_list_Ptr_Mismatch("NKwd", v3[21], (const void *)qword_26AA2DD38);
    GNSS_Log_p_list_Ptr_Mismatch("DDwd", v3[22], (const void *)qword_26AA2DD40);
    GNSS_Log_p_list_Ptr_Mismatch("STwd", v3[23], (const void *)qword_26AA2DD48);
    GNSS_Log_p_list_Ptr_Mismatch("GNdd", v3[25], (const void *)qword_26AA2DD58);
    GNSS_Log_p_list_Ptr_Mismatch("Vers", v3[26], (const void *)qword_26AA2DD60);
    GNSS_Log_p_list_Ptr_Mismatch("GNcf", v3[27], (const void *)qword_26AA2DD68);
    GNSS_Log_p_list_Ptr_Mismatch("GNnd", v3[28], (const void *)qword_26AA2DD70);
    GNSS_Log_p_list_Ptr_Mismatch("GNdd", v3[29], (const void *)qword_26AA2DD78);
    GNSS_Log_p_list_Ptr_Mismatch("NVrm", v3[30], (const void *)qword_26AA2DD80);
    GNSS_Log_p_list_Ptr_Mismatch("NArm", v3[31], (const void *)qword_26AA2DD88);
    GNSS_Log_p_list_Ptr_Mismatch("Meas", v3[32], (const void *)qword_26AA2DD90);
    GNSS_Log_p_list_Ptr_Mismatch("Ctrl", v3[33], (const void *)qword_26AA2DD98);
    GNSS_Log_p_list_Ptr_Mismatch("NMEA", v3[34], (const void *)qword_26AA2DDA0);
    GNSS_Log_p_list_Ptr_Mismatch("NDbg", v3[35], (const void *)qword_26AA2DDA8);
    GNSS_Log_p_list_Ptr_Mismatch("ELog", v3[36], (const void *)qword_26AA2DDB0);
    GNSS_Log_p_list_Ptr_Mismatch("GDbg", v3[37], (const void *)qword_26AA2DDB8);
    strlcpy(__dst, a2, 0x69uLL);
    strlcat(__dst, ": p_list DB corrupted!", 0x80uLL);
    return (const void **)gn_report_assertion_failure(__dst);
  }
  return result;
}

double Inc_Local_Time(int a1, int a2, double *a3, __int16 *a4)
{
  int v4 = 1000 * a2;
  double v5 = *a3 * 1000.0;
  double v6 = -0.5;
  if (v5 > 0.0) {
    double v6 = 0.5;
  }
  double v7 = v5 + v6;
  if (v7 <= 2147483650.0)
  {
    if (v7 >= -2147483650.0) {
      int v8 = (int)v7;
    }
    else {
      int v8 = 0x80000000;
    }
  }
  else
  {
    int v8 = 0x7FFFFFFF;
  }
  int v9 = v8 + a1;
  if (v9 >= v4)
  {
    __int16 v10 = *a4;
    do
    {
      v9 -= v4;
      ++v10;
    }
    while (v9 >= v4);
    *a4 = v10;
  }
  if (v9 < 0)
  {
    __int16 v11 = *a4;
    do
    {
      v9 += v4;
      --v11;
    }
    while (v9 < 0);
    *a4 = v11;
  }
  double result = (double)v9 * 0.001;
  *a3 = result;
  return result;
}

uint64_t RtiPayloadCodec::DecodeFromHexData(RtiPayloadCodec::Payload *a1, void *a2, _DWORD *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = a2[1] - *a2;
  if (v6 == 112)
  {
    unint64_t v7 = 6;
  }
  else
  {
    if (v6 != 128)
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid RTI file size! Received file size is [%lu]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 69, "DecodeFromHexData", a2[1] - *a2);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      return 9;
    }
    unint64_t v7 = 7;
  }
  std::vector<RtiPayloadCodec::Payload>::resize(a1, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *((void *)a1 + 1);
  while (1)
  {
    if (v8 == v9) {
      return 1;
    }
    if (XofIntegralType<unsigned long long>::DecodeFromHexData(v8, a2, a3) != 1
      || XofIntegralType<unsigned long long>::DecodeFromHexData(v8 + 56, a2, a3) != 1)
    {
      break;
    }
    v8 += 112;
  }
  return 5;
}

void std::vector<RtiPayloadCodec::Payload>::resize(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  uint64_t v3 = *((void *)a1 + 1);
  unint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((v3 - *(void *)a1) >> 4);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<RtiPayloadCodec::Payload>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *(void *)a1 + 112 * a2;
    while (v3 != v7)
    {
      v3 -= 112;
      std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100]((uint64_t)a1 + 16, v3);
    }
    *((void *)a1 + 1) = v7;
  }
}

uint64_t RtiDataCodec::Decode(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (RtiDataCodec::VerifyCRC(a1, (uint64_t)a2) != 1) {
    return 4;
  }
  if (XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)a1, a2, a3) != 1
    || XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 32), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 64), a2, a3) != 1
    || RtiPayloadCodec::DecodeFromHexData((RtiPayloadCodec::Payload *)(a1 + 104), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 128), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 168), a2, a3) != 1)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v8 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI Data Decode Failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNC", 87, "Decode");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    return 5;
  }
  if (a2[1] - *a2 != *a3)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid data length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 69, "Decode");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 5;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RtiVer,%u,FileGpsWeek,%u,FileGpsTow,%u,FileCRC,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "Decode", *(unsigned __int16 *)(a1 + 6), *(unsigned __int16 *)(a1 + 38), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 180));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  return 1;
}

uint64_t RtiDataCodec::VerifyCRC(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v12 = *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 4;
  std::string::basic_string[abi:ne180100]<0>(&__p, "rtiCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v9, &__p, 0, -1, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v9, (void *)a2, &v12) == 1)
  {
    int CRC32 = CRCGenerator::GetCRC32((void *)a2, 0, *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 4);
    if (v9[3] == CRC32)
    {
      uint64_t v4 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid CRC in the RTI file!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 69, "VerifyCRC");
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      uint64_t v4 = 4;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode RTI CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 69, "VerifyCRC");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    uint64_t v4 = 5;
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  return v4;
}

void sub_263D4C01C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RtiDataCodec::DecodeRtiFormatVersion(uint64_t a1, void *a2, _WORD *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (RtiDataCodec::VerifyCRC(a1, (uint64_t)a2) != 1) {
    return 5;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v10, &__p, 1, 3, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  int v8 = 0;
  if (XofIntegralType<unsigned short>::DecodeFromHexData(v10, a2, &v8) == 1)
  {
    *a3 = v10[3];
    uint64_t v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode RTI format version!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "DecodeRtiFormatVersion");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    uint64_t v5 = 5;
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  return v5;
}

void sub_263D4C1C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::__append(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v4 = (uint64_t)a1 + 16;
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 4) >= a2)
  {
    return std::vector<RtiPayloadCodec::Payload>::__construct_at_end(a1, a2);
  }
  else
  {
    uint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((v7 - *(void *)a1) >> 4);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x249249249249249) {
      std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x6DB6DB6DB6DB6DB7 * ((v5 - *(void *)a1) >> 4);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x124924924924924) {
      unint64_t v11 = 0x249249249249249;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v29 = v4;
    if (v11) {
      char v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>(v4, v11);
    }
    else {
      char v12 = 0;
    }
    uint64_t v14 = (RtiPayloadCodec::Payload *)&v12[112 * v8];
    long long v26 = v12;
    v27.i64[0] = (uint64_t)v14;
    v27.i64[1] = (uint64_t)v14;
    long long v28 = &v12[112 * v11];
    uint64_t v15 = 112 * a2;
    uint64_t v16 = (_OWORD *)((char *)v14 + 112 * a2);
    do
    {
      *((_OWORD *)v14 + 5) = 0u;
      *((_OWORD *)v14 + 6) = 0u;
      *((_OWORD *)v14 + 3) = 0u;
      *((_OWORD *)v14 + 4) = 0u;
      *((_OWORD *)v14 + 1) = 0u;
      *((_OWORD *)v14 + 2) = 0u;
      *(_OWORD *)uint64_t v14 = 0u;
      RtiPayloadCodec::Payload::Payload(v14);
      uint64_t v14 = (RtiPayloadCodec::Payload *)((char *)v14 + 112);
      v15 -= 112;
    }
    while (v15);
    uint64_t v17 = *(void *)a1;
    unint64_t v18 = *((void *)a1 + 1);
    uint64_t v19 = v27.i64[0];
    if (v18 == *(void *)a1)
    {
      int64x2_t v24 = vdupq_n_s64(v18);
    }
    else
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 96);
        *(_OWORD *)(v19 - 112) = *(_OWORD *)(v18 - 112);
        *(_OWORD *)(v19 - 96) = v20;
        long long v21 = *(_OWORD *)(v18 - 80);
        *(void *)(v19 - 64) = *(void *)(v18 - 64);
        *(_OWORD *)(v19 - 80) = v21;
        *(void *)(v18 - 72) = 0;
        *(void *)(v18 - 64) = 0;
        *(void *)(v18 - 80) = 0;
        long long v22 = *(_OWORD *)(v18 - 56);
        *(_OWORD *)(v19 - 40) = *(_OWORD *)(v18 - 40);
        *(_OWORD *)(v19 - 56) = v22;
        long long v23 = *(_OWORD *)(v18 - 24);
        *(void *)(v19 - 8) = *(void *)(v18 - 8);
        *(_OWORD *)(v19 - 24) = v23;
        v19 -= 112;
        *(void *)(v18 - 16) = 0;
        *(void *)(v18 - 8) = 0;
        *(void *)(v18 - 24) = 0;
        v18 -= 112;
      }
      while (v18 != v17);
      int64x2_t v24 = *(int64x2_t *)a1;
    }
    *(void *)a1 = v19;
    *((void *)a1 + 1) = v16;
    int64x2_t v27 = v24;
    long long v25 = (char *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v28;
    long long v28 = v25;
    long long v26 = (char *)v24.i64[0];
    return (RtiPayloadCodec::Payload *)std::__split_buffer<RtiPayloadCodec::Payload>::~__split_buffer((uint64_t)&v26);
  }
}

void sub_263D4C42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::__construct_at_end(RtiPayloadCodec::Payload *result, uint64_t a2)
{
  double v2 = result;
  uint64_t v3 = (RtiPayloadCodec::Payload *)*((void *)result + 1);
  if (a2)
  {
    uint64_t v4 = (RtiPayloadCodec::Payload *)((char *)v3 + 112 * a2);
    uint64_t v5 = 112 * a2;
    do
    {
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      *(_OWORD *)uint64_t v3 = 0u;
      double result = RtiPayloadCodec::Payload::Payload(v3);
      uint64_t v3 = (RtiPayloadCodec::Payload *)((char *)v3 + 112);
      v5 -= 112;
    }
    while (v5);
    uint64_t v3 = v4;
  }
  *((void *)v2 + 1) = v3;
  return result;
}

void sub_263D4C4E8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

RtiPayloadCodec::Payload *RtiPayloadCodec::Payload::Payload(RtiPayloadCodec::Payload *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v9, "L1CADoNotUseBitMask");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v10, &v9, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "L5DoNotUseBitMask");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v6, &__p, 0, -1, 0);
  long long v2 = v10[1];
  *(_OWORD *)this = v10[0];
  *((_OWORD *)this + 1) = v2;
  *((_OWORD *)this + 2) = v11;
  long long v3 = v6[1];
  *(_OWORD *)((char *)this + 56) = v6[0];
  *((void *)this + 6) = v12;
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  *(_OWORD *)((char *)this + 72) = v3;
  *(_OWORD *)((char *)this + 88) = v7;
  *((void *)this + 13) = v8;
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v12) < 0) {
      operator delete((void *)v11);
    }
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  return this;
}

void sub_263D4C60C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 25) < 0) {
    operator delete(*(void **)(v28 - 48));
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(112 * a2);
}

uint64_t std::__split_buffer<RtiPayloadCodec::Payload>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)(a1 + 16) = i - 112;
    std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100](v4, i - 112);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::vector(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  if (a2)
  {
    std::vector<RtiPayloadCodec::Payload>::__vallocate[abi:ne180100](a1, a2);
    std::vector<RtiPayloadCodec::Payload>::__construct_at_end(a1, a2);
  }
  return a1;
}

void sub_263D4C818(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<RtiPayloadCodec::Payload>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

void GLON_Alm_Calc_ECEF_PosVel(double *a1, double *a2, double *a3, int a4)
{
  double v8 = a1[4];
  if (v8 > 3.14159265)
  {
    do
      double v8 = v8 + -6.28318531;
    while (v8 > 3.14159265);
    a1[4] = v8;
  }
  if (v8 < -3.14159265)
  {
    do
      double v8 = v8 + 6.28318531;
    while (v8 < -3.14159265);
    a1[4] = v8;
  }
  double v9 = a1[1];
  long double v10 = v8;
  do
  {
    double v11 = v10;
    long double v10 = v8 + v9 * sin(v10);
  }
  while (vabdd_f64(v11, v10) > 2.22044605e-15);
  double v12 = sqrt(1.0 - v9 * v9);
  __double2 v13 = __sincos_stret(v10);
  double v14 = atan2(v12 * v13.__sinval, v13.__cosval - v9);
  double v15 = v14 + a1[5];
  double v16 = (1.0 - v9 * v13.__cosval) * *a1;
  double v17 = sqrt(398600.44 / *a1);
  __double2 v18 = __sincos_stret(v14);
  double v19 = v18.__sinval * (v9 * v17) / v12;
  double v20 = (v9 * v18.__cosval + 1.0) * v17 / v12;
  __double2 v21 = __sincos_stret(v15);
  __double2 v22 = __sincos_stret(a1[2]);
  __double2 v23 = __sincos_stret(a1[3]);
  double v24 = -(v21.__sinval * v22.__sinval) * v23.__cosval + v21.__cosval * v22.__cosval;
  double v25 = v21.__sinval * v22.__cosval * v23.__cosval + v21.__cosval * v22.__sinval;
  *a2 = v16 * v24;
  a2[1] = v16 * v25;
  a2[2] = v16 * v21.__sinval * v23.__sinval;
  *a3 = v19 * v24 - v20 * (v21.__cosval * v22.__sinval * v23.__cosval + v21.__sinval * v22.__cosval);
  a3[1] = v19 * v25 - v20 * (-(v21.__cosval * v22.__cosval) * v23.__cosval + v21.__sinval * v22.__sinval);
  a3[2] = v23.__sinval * (v21.__cosval * v20) + v21.__sinval * v19 * v23.__sinval;
  __double2 v26 = __sincos_stret((double)(a4 % 86400 - 10800) * 0.00007292115);
  double v27 = a2[1];
  double v28 = v26.__sinval * v27 + *a2 * v26.__cosval;
  double v29 = v26.__cosval * v27 - *a2 * v26.__sinval;
  *a2 = v28;
  a2[1] = v29;
  double v30 = a3[1];
  double v31 = v26.__cosval * v30 - *a3 * v26.__sinval;
  *a3 = v26.__sinval * v30 + *a3 * v26.__cosval + v29 * 0.00007292115;
  a3[1] = v31 + v28 * -0.00007292115;
  uint64_t v32 = 2;
  do
  {
    a2[v32] = a2[v32] * 1000.0;
    unint64_t v33 = v32-- + 1;
  }
  while (v33 > 1);
  uint64_t v34 = 2;
  do
  {
    a3[v34] = a3[v34] * 1000.0;
    unint64_t v35 = v34-- + 1;
  }
  while (v35 > 1);
}

BOOL Hal35_Is_HW_SPI_EN_Default(void)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_Is_HW_SPI_EN_Default");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceNameMatching("baseband");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (!MatchingService)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v12 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOServiceGetMatchingService - failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "HAL", 69, "Hal35_Is_HW_SPI_EN_Default");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0;
  }
  CFDataRef v4 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"gnss-comms-interface", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (!v4)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v13 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: gnss-comms-interface property not found\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "HAL", 87, "Hal35_Is_HW_SPI_EN_Default");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    CFRelease(0);
    return 0;
  }
  CFDataRef v5 = v4;
  BytePtr = CFDataGetBytePtr(v4);
  int v7 = *BytePtr;
  BOOL v8 = v7 == 2;
  if (g_LbsOsaTrace_Config >= 3)
  {
    double v9 = (unsigned __int8 *)BytePtr;
    bzero(__str, 0x3C6uLL);
    double v10 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
    double v11 = "PCIe";
    if (v7 == 2) {
      double v11 = "SPI";
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GNSS Comms Interface property variable %d, %s\n", (unint64_t)v10, "HAL", 77, "Hal35_Is_HW_SPI_EN_Default", *v9, v11);
    gnssOsa_PrintLog(__str, 3, 1, 0);
  }
  CFRelease(v5);
  return v8;
}

void Hal35_Set_SPI_InUse(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  g_IsSPIEnabled = a1;
  if (a1)
  {
    if (g_LbsOsaTrace_Config < 3) {
      return;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ******* SPI transport in use **********\n");
  }
  else
  {
    if (g_LbsOsaTrace_Config < 3) {
      return;
    }
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ******* PCIe<->NOC transport in use **********\n");
  }
  gnssOsa_PrintLog(__str, 3, 1, 0);
}

BOOL Hal35_InitSPI(void)
{
  kern_return_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void, void, uint64_t *);
  CFUUIDRef v16;
  CFUUIDBytes v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  SInt32 theScore;
  char __str[966];
  uint64_t v25;

  double v25 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: enter\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceNameMatching("gnss");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (!MatchingService)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOServiceGetMatchingService - failed\n");
      goto LABEL_9;
    }
    return 0;
  }
  if (IORegistryEntryGetChildEntry(MatchingService, "IOService", (io_registry_entry_t *)&_MergedGlobals_9))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IORegistryEntryGetChildEntry - failed\n");
LABEL_9:
      gnssOsa_PrintLog(__str, 1, 1, 0);
      return 0;
    }
    return 0;
  }
  theScore = 0;
  io_service_t v6 = _MergedGlobals_9;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x31u, 0x68u, 0xB0u, 0x8Eu, 0xE5u, 0x7Du, 0x4Eu, 4u, 0x92u, 0xC9u, 0xC0u, 0x15u, 0xB8u, 0xB0u, 0xE9u, 0xABu);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  double v10 = IOCreatePlugInInterfaceForService(v6, v8, v9, (IOCFPlugInInterface ***)&pp_IOCFPluginInterface, &theScore);
  BOOL v4 = v10 == 0;
  if (v10)
  {
    if (!g_LbsOsaTrace_Config) {
      return v4;
    }
    bzero(__str, 0x3C6uLL);
    double v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOCreatePlugInInterfaceForService - failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "HAL", 69, "Hal35_InitSPI");
    uint64_t v12 = 1;
LABEL_25:
    gnssOsa_PrintLog(__str, v12, 1, 0);
    return v4;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOCreatePlugInInterfaceForService success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  double v14 = pp_IOCFPluginInterface;
  double v15 = *(void (**)(uint64_t, void, void, uint64_t *))(*(void *)pp_IOCFPluginInterface + 8);
  uint64_t v16 = CFUUIDGetConstantUUIDWithBytes(v7, 0xE8u, 0x77u, 0xCDu, 0x61u, 0x8Du, 0x30u, 0x46u, 0x2Du, 0xA3u, 0xB7u, 0xB0u, 0x11u, 0x5Au, 0x2Cu, 0xF8u, 0xA8u);
  double v17 = CFUUIDGetUUIDBytes(v16);
  v15(v14, *(void *)&v17.byte0, *(void *)&v17.byte8, &pp_GNSSPassthroughInterface);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    __double2 v18 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: QueryInterface done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  (*(void (**)(uint64_t))(*(void *)pp_IOCFPluginInterface + 24))(pp_IOCFPluginInterface);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    double v19 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Release done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  double v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  qword_26AA36340 = (uint64_t)dispatch_queue_create("com.gnss.libindusSPI", v20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)pp_GNSSPassthroughInterface + 64))(pp_GNSSPassthroughInterface, qword_26AA36340);
  (*(void (**)(uint64_t, void, void))(*(void *)pp_GNSSPassthroughInterface + 72))(pp_GNSSPassthroughInterface, Hal35_SPI_ReadCallback, 0);
  (*(void (**)(uint64_t, void, void))(*(void *)pp_GNSSPassthroughInterface + 88))(pp_GNSSPassthroughInterface, Hal32_eventCallback, 0);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    __double2 v21 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  Hal35_Set_SPI_InUse(1);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    __double2 v22 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Callback set\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "HAL", 73, "Hal35_SetSPIReadCallback");
    uint64_t v12 = 4;
    goto LABEL_25;
  }
  return v4;
}

void Hal35_SPI_ReadCallback(void *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (g_LbsOsaTrace_Config > 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: zx%c%c%c %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "HAL", 68, "Hal35_SPI_ReadCallback", a2[2], a2[3], a2[4], a3);
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
    Hal02_SPI_ReadCb(a2, a3);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: error\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 69, "Hal35_SPI_ReadCallback");
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void Hal32_eventCallback(void *a1, int a2, void *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %d - evnet\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal32_eventCallback", a2);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

uint64_t Hal35_DeInitSPI(void)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (pp_IOCFPluginInterface)
  {
    IODestroyPlugInInterface((IOCFPlugInInterface **)pp_IOCFPluginInterface);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IODestroyPlugInInterface Done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_DeInitSPI");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  pp_IOCFPluginInterface = 0;
  pp_GNSSPassthroughInterface = 0;
  Hal35_Set_SPI_InUse(0);
  return 1;
}

uint64_t Hal35_SPIWrite(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = a2;
  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *, void))(*(void *)pp_GNSSPassthroughInterface + 80))(pp_GNSSPassthroughInterface, a1, a2))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: write error\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "HAL", 69, "Hal35_SPIWrite");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0xFFFFFFFFLL;
  }
  else if (g_LbsOsaTrace_Config > 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: zx%c%c%c %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 68, "Hal35_SPIWrite", a1[2], a1[3], a1[4], v4);
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  return v2;
}

void gnss::GnssAdaptDevice::injectAssistancePosition(uint64_t a1, char a2, int a3, uint64_t a4, int a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (*(void *)(a7 + 24))
  {
    uint64_t v25 = *a6;
    __double2 v26 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice24injectAssistancePositionEddbdddddNS_11ReliabilityEyNS_18PositionAssistTypeERKNS_20PositionAssistOriginENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v29, a7);
    *(double *)&v29[4] = a8;
    *(double *)&v29[5] = a9;
    char v32 = a2;
    *(double *)&v29[6] = a10;
    *(double *)&v29[7] = a11;
    *(double *)&v29[8] = a12;
    *(double *)&v29[9] = a13;
    *(double *)&v29[10] = a14;
    int v30 = a3;
    int v31 = a5;
    v29[11] = a4;
    v29[12] = v25;
    dispatch_async(v26, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v29);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v27 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 69, "injectAssistancePosition", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice24injectAssistancePositionEddbdddddNS_11ReliabilityEyNS_18PositionAssistTypeERKNS_20PositionAssistOriginENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "injectAssistancePosition_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((unsigned char *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v65, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v65, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v65);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v12 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "injectAssistancePosition_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v13 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    unint64_t v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    uint64_t v5 = 84;
    if (!*(unsigned char *)(a1 + 152)) {
      uint64_t v5 = 70;
    }
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Lat,%f,Long,%f,Alt,%f,AltValid,%c,VUncert,%f,SemiMajHUnc,%f,SemiMinHUnc,%f,SemiMajAzmHUnc,%f,MachContTimeNs,%llu,Rel,%d,PosType,%u,mHash,%llu\n", v4, "ADP", 73, "injectAssistancePosition_block_invoke", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v5, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(void *)(a1 + 128), *(_DWORD *)(a1 + 144), *(_DWORD *)(a1 + 148),
      *(void *)(a1 + 136));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  double v6 = *(double *)(a1 + 72);
  if (v6 > 90.0 || v6 < -90.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v64, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v64, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v64);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v14 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lat,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 72));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  double v7 = *(double *)(a1 + 80);
  if (v7 > 180.0 || v7 < -180.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v63, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v63, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v63);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v16 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Long,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 80));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v17 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  char v8 = *(unsigned char *)(a1 + 152);
  if (v8)
  {
    double v9 = *(double *)(a1 + 88);
    if (v9 > 100000.0 || v9 < -100000.0)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v62, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v62, (uint64_t)"injectAssistancePosition_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v62);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v21 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Height,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 88));
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v22 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 68, "injectAssistancePosition_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
      return;
    }
  }
  if (*(double *)(a1 + 96) < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v61, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v61, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v61);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v10 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx VUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 96));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  double v18 = *(double *)(a1 + 104);
  if (v18 < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v60, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v60, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v60);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v19 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMajHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 104));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v20 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  double v23 = *(double *)(a1 + 112);
  if (v23 < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v59, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v59, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v59);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v24 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMinHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 112));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v25 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  double v26 = *(double *)(a1 + 120);
  if (v26 < 0.0 || v26 > 360.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v58, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v58, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v58);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v30 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMajAzmHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 120));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v31 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  double v50 = *(double *)(a1 + 96);
  uint64_t v51 = 0x500000000;
  uint64_t v52 = 0;
  if (fabs(v7 + 180.0) < 2.22044605e-16) {
    double v7 = v7 + 360.0;
  }
  *((double *)&v43 + 1) = v6;
  double v44 = v7;
  double v27 = *(double *)(a1 + 88);
  char v48 = v8;
  double v49 = v27;
  double v45 = v18;
  double v46 = v23;
  double v28 = v26 + -360.0;
  if (v26 <= 180.0) {
    double v28 = v26;
  }
  __int16 v47 = (int)v28;
  LODWORD(v43) = (*(void *)(a1 + 128) + 500000) / 0xF4240uLL;
  int v29 = *(_DWORD *)(a1 + 144);
  if (v29 <= 24)
  {
    if (v29)
    {
      if (v29 != 10) {
        goto LABEL_71;
      }
      int v29 = 1;
    }
  }
  else
  {
    switch(v29)
    {
      case 25:
        int v29 = 2;
        break;
      case 50:
        int v29 = 3;
        break;
      case 75:
        int v29 = 4;
        break;
      default:
LABEL_71:
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v57, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v57, (uint64_t)"injectAssistancePosition_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v57);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v41 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v41), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(_DWORD *)(a1 + 144));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v42 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
    }
  }
  LODWORD(v51) = v29;
  if (*(_DWORD *)(a1 + 148) >= 3u)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v56, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v56, (uint64_t)"injectAssistancePosition_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v56);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v38 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx PosType,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v38), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(_DWORD *)(a1 + 148));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v39 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v39), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
  else
  {
    int v53 = *(_DWORD *)(a1 + 148);
    uint64_t v52 = *(void *)(a1 + 136);
    int v32 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
    uint64_t v33 = a1 + 40;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v55, v33);
    gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v32, (uint64_t)v55);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v55);
    unsigned int v34 = GNS_EaWgs84RefPos(v32, &v43);
    if (v34 != 1)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v54, v33);
      gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v34, (uint64_t)v54, "injectAssistancePosition_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v54);
      gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v32);
      if (!g_LbsOsaTrace_Config) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v40 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaWgs84RefPos,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v40), "ADP", 69, "injectAssistancePosition_block_invoke", 257, v34);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config < 5) {
        return;
      }
LABEL_64:
      bzero(__str, 0x3C6uLL);
      uint64_t v37 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v37), "ADP", 68, "injectAssistancePosition_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
      return;
    }
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v35 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      uint64_t v36 = 84;
      if (!v48) {
        uint64_t v36 = 70;
      }
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Lat,%f,Long,%f,Ht,%f,HtPresent,%c,RmsHeight,%f,RmsSemiMaj,%f,RmsSemiMin,%f,RmsSemiMajBrg,%hd,SrcHash,%llu\n", v35, "ADP", 68, "injectAssistancePosition_block_invoke", *((double *)&v43 + 1), v44, v49, v36, v50, v45, v46, v47, v52);
      gnssOsa_PrintLog(__str, 5, 1, 0);
      if (g_LbsOsaTrace_Config >= 5) {
        goto LABEL_64;
      }
    }
  }
}

void sub_263D4EC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
}

void gnss::GnssAdaptDevice::injectAssistanceTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a5 + 24))
  {
    char v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice20injectAssistanceTimeEyyyNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_25_1;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v11, a5);
    v11[4] = a2;
    v11[5] = a3;
    v11[6] = a4;
    dispatch_async(v8, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v11);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v9 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "injectAssistanceTime", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice20injectAssistanceTimeEyyyNSt3__18functionIFvNS_6ResultEEEE_block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "injectAssistanceTime_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*(unsigned char *)(v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GpsTimeNS,%llu,UncNS,%llu,MachContTimeNs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "injectAssistanceTime_block_invoke", a1[9], a1[10], a1[11]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    unint64_t v5 = a1[10];
    if (v5)
    {
      DWORD2(v17) = 0x7FFFFFFF;
      int v18 = -1;
      unint64_t v6 = a1[9];
      WORD6(v17) = v6 / 0x2260FF9290000;
      if (v6 % 0x2260FF9290000 < 0xF424000000000)
      {
        LODWORD(v17) = v6 % 0x2260FF9290000 / 0xF4240;
        if (v5 < 0xF42400000)
        {
          if (v5 >= 0xF4240)
          {
            WORD2(v17) = v5 / 0xF4240;
          }
          else
          {
            WORD2(v17) = 1;
            if (g_LbsOsaTrace_Config >= 4)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v14 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RefTimeUncMs < 1ms\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 73, "injectAssistanceTime_block_invoke");
              gnssOsa_PrintLog(__str, 4, 1, 0);
            }
          }
        }
        else
        {
          WORD2(v17) = -1;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v13 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RefTimeUncMs > 65535ms\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 73, "injectAssistanceTime_block_invoke");
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
        int v19 = (a1[11] + 500000) / 0xF4240uLL;
        GNS_AsstGpsRefTime(0, 5, &v17);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v15 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Wk,%u,Tow,%u,TowUnc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 68, "injectAssistanceTime_block_invoke", WORD6(v17), v17, WORD2(v17));
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)(a1 + 5));
        gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse(v2, 1u, (uint64_t)v20, "injectAssistanceTime_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v20);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v16 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "injectAssistanceTime_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
      else
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)(a1 + 5));
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v21, (uint64_t)"injectAssistanceTime_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v21);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v7 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Calc GpsTow invalid\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "injectAssistanceTime_block_invoke", 515);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v8 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 68, "injectAssistanceTime_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
    }
    else
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)(a1 + 5));
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v22, (uint64_t)"injectAssistanceTime_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v22);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RefTimeUnc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "injectAssistanceTime_block_invoke", 515);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v12 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 68, "injectAssistanceTime_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)(a1 + 5));
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 7, (uint64_t)v23, (uint64_t)"injectAssistanceTime_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v23);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "injectAssistanceTime_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v10 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 68, "injectAssistanceTime_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D4F604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceAlongTrackVelocity(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a3 + 24))
  {
    uint64_t v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice31setAssistanceAlongTrackVelocityEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_32;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v11, a3);
    v11[4] = a2;
    *(double *)&v11[5] = a4;
    *(double *)&v11[6] = a5;
    dispatch_async(v8, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v11);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v9 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceAlongTrackVelocity", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice31setAssistanceAlongTrackVelocityEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,VAlongTrack,%f,VAlongTrackUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceAlongTrackVelocity_block_invoke", *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    double v5 = *(double *)(a1 + 80);
    if (v5 > 100.0 || v5 < 0.0 || (double v6 = *(double *)(a1 + 88), v6 <= 0.0))
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v22, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v22, (uint64_t)"setAssistanceAlongTrackVelocity_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v22);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v13 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx VAlongTrack,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 514, *(double *)(a1 + 80));
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v14 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
    else
    {
      unint64_t v7 = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
      LODWORD(v18) = v7;
      *((double *)&v18 + 1) = v5;
      double v19 = v6;
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v8 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,Vel,%f,RmsVel,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke", v7, v5, v6);
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
      int v9 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
      uint64_t v10 = a1 + 40;
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v21, v10);
      gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v9, (uint64_t)v21);
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v21);
      unsigned int v11 = GNS_EaAlongTrackVel(v9, &v18);
      if (v11 == 1)
      {
        if (g_LbsOsaTrace_Config >= 5)
        {
LABEL_13:
          bzero(__str, 0x3C6uLL);
          uint64_t v12 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
      else
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v20, v10);
        gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v11, (uint64_t)v20, "setAssistanceAlongTrackVelocity_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v20);
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v9);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx LongTrackVel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 257, v11);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5) {
            goto LABEL_13;
          }
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v23, (uint64_t)"setAssistanceAlongTrackVelocity_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v23);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v15 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v16 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D4FDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceDem(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a3 + 24))
  {
    uint64_t v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice16setAssistanceDemEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_40;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v11, a3);
    v11[4] = a2;
    *(double *)&v11[5] = a4;
    *(double *)&v11[6] = a5;
    dispatch_async(v8, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v11);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v9 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceDem", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice16setAssistanceDemEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceDem_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,EllipAlt,%f,AltUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceDem_block_invoke", *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    double v5 = *(double *)(a1 + 80);
    if (v5 > 9000.0 || v5 < -500.0)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v25, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v25, (uint64_t)"setAssistanceDem_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v25);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EllipAlt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceDem_block_invoke", 514, *(double *)(a1 + 80));
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v16 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "setAssistanceDem_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
    else
    {
      double v6 = *(double *)(a1 + 88);
      if (v6 <= 0.0 || v6 > 9000.0)
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v24, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v24, (uint64_t)"setAssistanceDem_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v24);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx AltUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "setAssistanceDem_block_invoke", 514, *(double *)(a1 + 88));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "setAssistanceDem_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
      else
      {
        int v21 = 0;
        LODWORD(v19) = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
        *((double *)&v19 + 1) = v5;
        double v20 = v6;
        int v7 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
        uint64_t v8 = a1 + 40;
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v7, (uint64_t)v23);
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v23);
        unsigned int v9 = GNS_EaAltitude(v7, &v19);
        if (v9 != 1)
        {
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v22, v8);
          gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v9, (uint64_t)v22, "setAssistanceDem_block_invoke");
          std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v22);
          gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v7);
          if (!g_LbsOsaTrace_Config) {
            return;
          }
          bzero(__str, 0x3C6uLL);
          uint64_t v10 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaAltitude,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 69, "setAssistanceDem_block_invoke", 257, v9);
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v11 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,Alt,%f,RmsAlt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 68, "setAssistanceDem_block_invoke", v19, *((double *)&v19 + 1), v20);
          gnssOsa_PrintLog(__str, 5, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v12 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 68, "setAssistanceDem_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v26, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v26, (uint64_t)"setAssistanceDem_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v26);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v13 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceDem_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v14 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 68, "setAssistanceDem_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D50654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceMapVector(uint64_t a1, uint64_t a2, char a3, char a4, char a5, char a6, char a7, char a8, double a9, double a10, double a11, double a12, double a13, double a14, uint64_t a15)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*(void *)(a15 + 24))
  {
    uint64_t v28 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice22setAssistanceMapVectorEyddbddddbbbbbNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_50;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v31, a15);
    v31[4] = a2;
    *(double *)&v31[5] = a9;
    *(double *)&v31[6] = a10;
    char v32 = a3;
    *(double *)&v31[7] = a11;
    *(double *)&v31[8] = a12;
    *(double *)&v31[9] = a13;
    *(double *)&v31[10] = a14;
    char v33 = a4;
    char v34 = a5;
    char v35 = a6;
    char v36 = a7;
    char v37 = a8;
    dispatch_async(v28, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v31);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v29 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "setAssistanceMapVector", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice22setAssistanceMapVectorEyddbddddbbbbbNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMapVector_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      if (*(unsigned char *)(a1 + 133)) {
        uint64_t v5 = 84;
      }
      else {
        uint64_t v5 = 70;
      }
      if (*(unsigned char *)(a1 + 132)) {
        uint64_t v6 = 84;
      }
      else {
        uint64_t v6 = 70;
      }
      if (*(unsigned char *)(a1 + 131)) {
        uint64_t v7 = 84;
      }
      else {
        uint64_t v7 = 70;
      }
      if (*(unsigned char *)(a1 + 130)) {
        uint64_t v8 = 84;
      }
      else {
        uint64_t v8 = 70;
      }
      if (*(unsigned char *)(a1 + 129)) {
        uint64_t v9 = 84;
      }
      else {
        uint64_t v9 = 70;
      }
      if (*(unsigned char *)(a1 + 128)) {
        uint64_t v10 = 84;
      }
      else {
        uint64_t v10 = 70;
      }
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,SegStartLat,%f,SegStartLong,%f,AltValid,%c,SegStartAltWgs84,%f,SegLenM,%f,SegDirDeg,%f,SegWidM,%f,Freeway,%c,Railway,%c,OneWayRoad,%c,Tunnel,%c,Bridge,%c\n", v4, "ADP", 73, "setAssistanceMapVector_block_invoke", *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v10, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), v9, v8, v7,
        v6,
        v5);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    double v11 = *(double *)(a1 + 80);
    if (v11 > 90.0 || v11 < -90.0)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v61, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v61, (uint64_t)"setAssistanceMapVector_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v61);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v20 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lat,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 80));
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v21 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "setAssistanceMapVector_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
    else
    {
      double v12 = *(double *)(a1 + 88);
      if (v12 > 180.0 || v12 < -180.0)
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v60, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v60, (uint64_t)"setAssistanceMapVector_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v60);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v22 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Long,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 88));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v23 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 68, "setAssistanceMapVector_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
      else
      {
        int v13 = *(unsigned __int8 *)(a1 + 128);
        if (*(unsigned char *)(a1 + 128) && ((double v14 = *(double *)(a1 + 96), v14 > 100000.0) || v14 < -100000.0))
        {
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v59, a1 + 40);
          gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v59, (uint64_t)"setAssistanceMapVector_block_invoke");
          std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v59);
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v28 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Alt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 96));
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v29 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 68, "setAssistanceMapVector_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
        }
        else
        {
          double v15 = *(double *)(a1 + 104);
          if (v15 <= 100000.0)
          {
            double v24 = *(double *)(a1 + 112);
            if (v24 < 0.0 || v24 > 360.0)
            {
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v57, a1 + 40);
              gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v57, (uint64_t)"setAssistanceMapVector_block_invoke");
              std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v57);
              if (g_LbsOsaTrace_Config)
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v30 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dir,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 112));
                gnssOsa_PrintLog(__str, 1, 1, 0);
                if (g_LbsOsaTrace_Config >= 5)
                {
                  bzero(__str, 0x3C6uLL);
                  uint64_t v31 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 68, "setAssistanceMapVector_block_invoke");
                  gnssOsa_PrintLog(__str, 5, 1, 0);
                }
              }
            }
            else
            {
              double v25 = *(double *)(a1 + 120);
              if (v25 <= 100000.0)
              {
                unint64_t v32 = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
                int v46 = v32;
                if (fabs(v12 + 180.0) >= 2.22044605e-16) {
                  double v33 = v12;
                }
                else {
                  double v33 = v12 + 360.0;
                }
                double v47 = v11;
                double v48 = v33;
                double v34 = *(double *)(a1 + 96);
                double v49 = v34;
                char v50 = v13;
                double v51 = v24;
                double v52 = v15;
                double v53 = v25;
                LODWORD(v12) = *(_DWORD *)(a1 + 129);
                int16x8_t v35 = (int16x8_t)vmovl_u8(*(uint8x8_t *)&v12);
                *(int8x8_t *)v35.i8 = vext_s8(*(int8x8_t *)v35.i8, *(int8x8_t *)v35.i8, 6uLL);
                unsigned __int32 v54 = vmovn_s16(v35).u32[0];
                int v36 = *(unsigned __int8 *)(a1 + 133);
                char v55 = *(unsigned char *)(a1 + 133);
                int v37 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
                uint64_t v38 = a1 + 40;
                std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v45, v38);
                gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v37, (uint64_t)v45);
                std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v45);
                if (g_LbsOsaTrace_Config >= 5)
                {
                  bzero(__str, 0x3C6uLL);
                  double v39 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
                  uint64_t v40 = 84;
                  if (!v13) {
                    uint64_t v40 = 70;
                  }
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,StartLat,%f,StartLong,%f,StartAlt,%f,HtAvail,%c,Dir,%f,Len,%f,Width,%f,Bridge,%d\n", (unint64_t)v39, "ADP", 68, "setAssistanceMapVector_block_invoke", v32, v11, v33, v34, v40, v24, v15, v25, v36);
                  gnssOsa_PrintLog(__str, 5, 1, 0);
                }
                unsigned int v41 = GNS_EaMapVectorSeg(v37, (uint64_t)&v46);
                if (v41 != 1)
                {
                  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v44, v38);
                  gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v41, (uint64_t)v44, "setAssistanceMapVector_block_invoke");
                  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v44);
                  gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v37);
                  if (!g_LbsOsaTrace_Config) {
                    return;
                  }
                  bzero(__str, 0x3C6uLL);
                  uint64_t v42 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaMapVectorSeg,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "ADP", 69, "setAssistanceMapVector_block_invoke", 257, v41);
                  gnssOsa_PrintLog(__str, 1, 1, 0);
                }
                if (g_LbsOsaTrace_Config >= 5)
                {
                  bzero(__str, 0x3C6uLL);
                  uint64_t v43 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v43), "ADP", 68, "setAssistanceMapVector_block_invoke");
                  gnssOsa_PrintLog(__str, 5, 1, 0);
                }
              }
              else
              {
                std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v56, a1 + 40);
                gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v56, (uint64_t)"setAssistanceMapVector_block_invoke");
                std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v56);
                if (g_LbsOsaTrace_Config)
                {
                  bzero(__str, 0x3C6uLL);
                  uint64_t v26 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Width,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 120));
                  gnssOsa_PrintLog(__str, 1, 1, 0);
                  if (g_LbsOsaTrace_Config >= 5)
                  {
                    bzero(__str, 0x3C6uLL);
                    uint64_t v27 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 68, "setAssistanceMapVector_block_invoke");
                    gnssOsa_PrintLog(__str, 5, 1, 0);
                  }
                }
              }
            }
          }
          else
          {
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v58, a1 + 40);
            gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v58, (uint64_t)"setAssistanceMapVector_block_invoke");
            std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v58);
            if (g_LbsOsaTrace_Config)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v16 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Len,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 104));
              gnssOsa_PrintLog(__str, 1, 1, 0);
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                uint64_t v17 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 68, "setAssistanceMapVector_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
            }
          }
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v62, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v62, (uint64_t)"setAssistanceMapVector_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v62);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v18 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 69, "setAssistanceMapVector_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v19 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 68, "setAssistanceMapVector_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D51500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
}

void gnss::GnssAdaptDevice::setAssistanceMotionActivityContext(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a6 + 24))
  {
    uint64_t v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS_21MotionActivityContextENS_11MovingStateENS_11ReliabilityENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_59;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v13, a6);
    v13[4] = a2;
    int v14 = a3;
    int v15 = a4;
    int v16 = a5;
    dispatch_async(v10, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v13);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceMotionActivityContext", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS_21MotionActivityContextENS_11MovingStateENS_11ReliabilityENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((unsigned char *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v35, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v35, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v35);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v10 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,Ctxt,%u,MovState,%u,Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceMotionActivityContext_block_invoke", *(void *)(a1 + 72), *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  unint64_t v5 = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
  LODWORD(v27) = v5;
  uint64_t v25 = v5;
  uint64_t v6 = *(int *)(a1 + 80);
  if (v6 >= 9)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Context,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 80));
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v34, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
    double v12 = v34;
    goto LABEL_37;
  }
  int v7 = dword_263D85218[v6];
  HIDWORD(v27) = v7;
  int v8 = *(_DWORD *)(a1 + 88);
  if (v8 <= 24)
  {
    if (v8)
    {
      if (v8 == 10) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else
  {
    switch(v8)
    {
      case 75:
        int v8 = 3;
        break;
      case 50:
        int v8 = 2;
        break;
      case 25:
LABEL_11:
        int v8 = 1;
        break;
      default:
LABEL_20:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v13 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 88));
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v33, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v33, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
        double v12 = v33;
        goto LABEL_37;
    }
  }
  int v28 = v8;
  int v26 = v8;
  unsigned int v14 = *(_DWORD *)(a1 + 84);
  if (v14 >= 4)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v22 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Moving State,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 84));
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v32, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v32, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
    double v12 = v32;
LABEL_37:
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v12);
    return;
  }
  HIDWORD(v25) = *(_DWORD *)(a1 + 84);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v15 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ActCtx,%u,MovState,%u,Rel,%u,TimeMs,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke", v7, v14, v8, v5);
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  unsigned int v16 = GNS_EaUsrActCtxt(++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key, &v27);
  if (v16 == 1)
  {
    int v17 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
    uint64_t v18 = a1 + 40;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v30, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v17, (uint64_t)v30);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v30);
    unsigned int v19 = GNS_EaDevMovState(v17, &v25);
    if (v19 != 1)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v29, v18);
      gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v19, (uint64_t)v29, "setAssistanceMotionActivityContext_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v29);
      gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v17);
      if (!g_LbsOsaTrace_Config) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v20 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaDevMovState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v19);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v31, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v16, (uint64_t)v31, "setAssistanceMotionActivityContext_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v31);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v23 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaUsrActCtxt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v16);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v24 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D51F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceMountState(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a4 + 24))
  {
    uint64_t v6 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS_16DeviceMountStateENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_66;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v9, a4);
    unsigned int v9[4] = a2;
    int v10 = a3;
    dispatch_async(v6, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v9);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v7 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "setAssistanceMountState", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS_16DeviceMountStateENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMountState_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,MtState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceMountState_block_invoke", *(void *)(a1 + 72), *(_DWORD *)(a1 + 80));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    LODWORD(v17) = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
    uint64_t v5 = *(int *)(a1 + 80);
    if (v5 >= 3)
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v14 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MountState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "setAssistanceMountState_block_invoke", 515, *(_DWORD *)(a1 + 80));
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v21, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v21, (uint64_t)"setAssistanceMountState_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v21);
    }
    else
    {
      int v6 = dword_263D8523C[v5];
      int v7 = dword_263D85248[v5];
      HIDWORD(v17) = v6;
      int v18 = v7;
      int v8 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
      uint64_t v9 = a1 + 40;
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v20, v9);
      gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v8, (uint64_t)v20);
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v20);
      unsigned int v10 = GNS_EaFixedInVehicle(v8, &v17);
      if (v10 == 1)
      {
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v11 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,FivInd,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 68, "setAssistanceMountState_block_invoke", v17, HIDWORD(v17));
          gnssOsa_PrintLog(__str, 5, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
LABEL_20:
            bzero(__str, 0x3C6uLL);
            uint64_t v16 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "setAssistanceMountState_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
      else
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v19, v9);
        gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v10, (uint64_t)v19, "setAssistanceMountState_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v19);
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v8);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v15 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixedInVeh,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceMountState_block_invoke", 257, v10);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5) {
            goto LABEL_20;
          }
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v22, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v22, (uint64_t)"setAssistanceMountState_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v22);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v12 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "setAssistanceMountState_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v13 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 68, "setAssistanceMountState_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D52694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceSignalEnvironment(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a3 + 24))
  {
    uint64_t v4 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS_21SignalEnvironmentTypeENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_73;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v7, a3);
    int v8 = a2;
    dispatch_async(v4, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v7);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 69, "setAssistanceSignalEnvironment", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS_21SignalEnvironmentTypeENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceSignalEnvironment_block_invoke", *(_DWORD *)(a1 + 72));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    uint64_t v5 = *(int *)(a1 + 72);
    if (v5 >= 7)
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 515, *(_DWORD *)(a1 + 72));
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v18, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v18, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v18);
    }
    else
    {
      unsigned int v6 = dword_263D85254[v5];
      int v7 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
      uint64_t v8 = a1 + 40;
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v17, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v7, (uint64_t)v17);
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v17);
      unsigned int v9 = GNS_EaSigEnvSev(v7, v6);
      if (v9 != 1)
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v16, v8);
        gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v9, (uint64_t)v16, "setAssistanceSignalEnvironment_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v16);
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v7);
        if (!g_LbsOsaTrace_Config) {
          return;
        }
        bzero(__str, 0x3C6uLL);
        uint64_t v10 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SigEnvSev,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 257, v9);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SESInd,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke", v6);
        gnssOsa_PrintLog(__str, 5, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v12 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v19, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v19, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v19);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v13 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v14 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D52D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceSpeedConstraint(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a3 + 24))
  {
    uint64_t v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice28setAssistanceSpeedConstraintEydddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_80;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v13, a3);
    v13[4] = a2;
    *(double *)&void v13[5] = a4;
    *(double *)&v13[6] = a5;
    *(double *)&v13[7] = a6;
    dispatch_async(v10, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v13);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceSpeedConstraint", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice28setAssistanceSpeedConstraintEydddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((unsigned char *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,DurSec,%f,SpeedLwrBound,%f,SpeedUprBound,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceSpeedConstraint_block_invoke", *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    double v5 = *(double *)(a1 + 80);
    if (v5 <= 86400.0)
    {
      double v6 = *(double *)(a1 + 88);
      if (v6 >= 0.0)
      {
        double v11 = *(double *)(a1 + 96);
        if (v11 >= v6 && v11 >= 0.0 && v11 <= 100.0)
        {
          unint64_t v13 = (*(void *)(a1 + 72) + 500000) / 0xF4240uLL;
          unsigned int v14 = (v5 * 1000.0);
          *(void *)&long long v21 = __PAIR64__(v14, v13);
          *((double *)&v21 + 1) = v6;
          double v22 = v11;
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v15 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,DurMs,%d,SpeedL,%f,SpeedU,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke", v13, v14, v6, v11);
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
          int v16 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
          uint64_t v17 = a1 + 40;
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v24, v17);
          gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v16, (uint64_t)v24);
          std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v24);
          unsigned int v18 = GNS_EaSpeedConstraint(v16, &v21);
          if (v18 == 1)
          {
            if (g_LbsOsaTrace_Config < 5) {
              return;
            }
          }
          else
          {
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, v17);
            gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v18, (uint64_t)v23, "setAssistanceSpeedConstraint_block_invoke");
            std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v23);
            gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v16);
            if (!g_LbsOsaTrace_Config) {
              return;
            }
            bzero(__str, 0x3C6uLL);
            uint64_t v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SpeedConstraint,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 257, v18);
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config < 5) {
              return;
            }
          }
          bzero(__str, 0x3C6uLL);
          uint64_t v19 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
          return;
        }
      }
    }
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MachContiTimeNs,%llu,Dur,%f,SpeedLwrBound,%f,SpeedUprBound,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 514, *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v25, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v25, (uint64_t)"setAssistanceSpeedConstraint_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v25);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v8 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v26, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v26, (uint64_t)"setAssistanceSpeedConstraint_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v26);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 1302);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v10 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D53568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::startTimeTransferSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(void *)(a3 + 24))
  {
    if (!g_LbsOsaTrace_Config) {
      return;
    }
    goto LABEL_7;
  }
  if (*(void *)(a4 + 24))
  {
    double v6 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice24startTimeTransferSessionENSt3__18functionIFvNS_6ResultENS_16TimeTransferDataEEEENS2_IFvS3_EEES8__block_invoke;
    block[3] = &__block_descriptor_tmp_85;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)v9, a2);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v10, a3);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v11, a4);
    dispatch_async(v6, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v11);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v10);
    std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v9);
    return;
  }
  if (g_LbsOsaTrace_Config)
  {
LABEL_7:
    bzero(__str, 0x3C6uLL);
    uint64_t v7 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "startTimeTransferSession", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void sub_263D537C0(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN4gnss15GnssAdaptDevice24startTimeTransferSessionENSt3__18functionIFvNS_6ResultENS_16TimeTransferDataEEEENS2_IFvS3_EEES8__block_invoke(uint64_t a1)
{
  v27[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "startTimeTransferSession_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*(void *)(a1 + 64))
  {
    if (*(unsigned char *)(v2 + 88))
    {
      if (*(unsigned char *)(v2 + 92))
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v22, a1 + 72);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 0, (uint64_t)v22, (uint64_t)"startTimeTransferSession_block_invoke");
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v22);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v4 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMark\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 69, "startTimeTransferSession_block_invoke", 2056);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v5 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 68, "startTimeTransferSession_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
      }
      else
      {
        std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)__str, a1 + 40);
        uint64_t v10 = v2 + 296;
        if (__str != (char *)(v2 + 296))
        {
          double v11 = v26;
          uint64_t v12 = *(void *)(v2 + 320);
          if (v26 == __str)
          {
            if (v12 == v10)
            {
              (*(void (**)(char *, void *))(*(void *)__str + 24))(__str, v27);
              (*(void (**)(char *))(*(void *)v26 + 32))(v26);
              int v26 = 0;
              (*(void (**)(void, char *))(**(void **)(v2 + 320) + 24))(*(void *)(v2 + 320), __str);
              (*(void (**)(void))(**(void **)(v2 + 320) + 32))(*(void *)(v2 + 320));
              *(void *)(v2 + 320) = 0;
              int v26 = __str;
              (*(void (**)(void *, uint64_t))(v27[0] + 24))(v27, v2 + 296);
              (*(void (**)(void *))(v27[0] + 32))(v27);
            }
            else
            {
              (*(void (**)(char *, uint64_t))(*(void *)__str + 24))(__str, v2 + 296);
              (*(void (**)(char *))(*(void *)v26 + 32))(v26);
              int v26 = *(char **)(v2 + 320);
            }
            *(void *)(v2 + 320) = v10;
          }
          else if (v12 == v10)
          {
            (*(void (**)(uint64_t, char *))(*(void *)v10 + 24))(v2 + 296, __str);
            (*(void (**)(void))(**(void **)(v2 + 320) + 32))(*(void *)(v2 + 320));
            *(void *)(v2 + 320) = v26;
            int v26 = __str;
          }
          else
          {
            int v26 = *(char **)(v2 + 320);
            *(void *)(v2 + 320) = v11;
          }
        }
        std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](__str);
        _DWORD v20[3] = 0;
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v21, a1 + 104);
        gnss::GnssAdaptDevice::Ga07_10AddRespHndlToGnmLUT(v2, 18, (uint64_t)v20);
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v21);
        std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v20);
        unsigned int started = Gnm_StartTimeMarkSesion((uint64_t)gnss::GnssAdaptDevice::Ga03_03GnssTimeMarkDataCallBack);
        if (started)
        {
          uint64_t v14 = *(void *)(v2 + 320);
          *(void *)(v2 + 320) = 0;
          if (v14 == v10)
          {
            (*(void (**)(uint64_t))(*(void *)v10 + 32))(v2 + 296);
          }
          else if (v14)
          {
            (*(void (**)(uint64_t))(*(void *)v14 + 40))(v14);
          }
          gnss::GnssAdaptDevice::Ga07_11HandleGnmStatusResponses(v2, started, 0x12u);
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v17 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMark,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "startTimeTransferSession_block_invoke", 2049, started);
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v18 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "startTimeTransferSession_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
        }
        else
        {
          *(unsigned char *)(v2 + 92) = 1;
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v19, a1 + 72);
          gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 1, (uint64_t)v19, (uint64_t)"startTimeTransferSession_block_invoke");
          std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v19);
          if (g_LbsOsaTrace_Config > 3)
          {
            bzero(__str, 0x3C6uLL);
            uint64_t v15 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Started\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 73, "startTimeTransferSession_block_invoke");
            gnssOsa_PrintLog(__str, 4, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              uint64_t v16 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "startTimeTransferSession_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
        }
      }
    }
    else
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, a1 + 72);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 0, (uint64_t)v23, (uint64_t)"startTimeTransferSession_block_invoke");
      std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v23);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v8 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 69, "startTimeTransferSession_block_invoke", 1302);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          uint64_t v9 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 68, "startTimeTransferSession_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
    }
  }
  else
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v24, a1 + 72);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v24, (uint64_t)"startTimeTransferSession_block_invoke");
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v24);
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DataCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "startTimeTransferSession_block_invoke", 258);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 68, "startTimeTransferSession_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
  }
}

void sub_263D540D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::Ga03_03GnssTimeMarkDataCallBack(gnss::GnssAdaptDevice *a1, char *a2)
{
  char v3 = (char)a1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t DeviceInstance = gnss::GnssAdaptDevice::Ga00_00GetDeviceInstance(a1);
  if (DeviceInstance)
  {
    uint64_t v6 = DeviceInstance;
    memset(&v31[4], 0, 17);
    *(_OWORD *)((char *)v30 + 1) = 0uLL;
    *(_WORD *)((char *)&v30[1] + 1) = 0;
    if (a2)
    {
      char v7 = *a2;
      char v5 = a2[1];
      __int16 v8 = *((_WORD *)a2 + 1);
      *(_OWORD *)uint64_t v31 = *(_OWORD *)(a2 + 4);
      *(void *)&v31[13] = *(void *)(a2 + 17);
      *(_DWORD *)uint64_t v14 = *(_DWORD *)(a2 + 25);
      *(_DWORD *)&v14[3] = *((_DWORD *)a2 + 7);
      uint64_t v9 = *((void *)a2 + 4);
      int v10 = *((_DWORD *)a2 + 10);
      char v11 = a2[44];
      *(_DWORD *)((char *)v30 + 15) = *((_DWORD *)a2 + 15);
      v30[0] = *(_OWORD *)(a2 + 45);
    }
    else
    {
      char v7 = g_LbsOsaTrace_Config;
      uint64_t v9 = 0;
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMarkData\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback", 770);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        char v11 = 0;
        int v10 = 0;
        __int16 v8 = 0;
        char v7 = 0;
      }
      else
      {
        char v11 = 0;
        int v10 = 0;
        __int16 v8 = 0;
      }
      char v3 = 11;
    }
    uint64_t v13 = *(NSObject **)(v6 + 152);
    *(void *)long long __str = MEMORY[0x263EF8330];
    uint64_t v16 = 0x40000000;
    uint64_t v17 = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke;
    uint64_t v18 = &__block_descriptor_tmp_117;
    uint64_t v19 = v6;
    char v29 = v3;
    char v20 = v7;
    char v21 = v5;
    __int16 v22 = v8;
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v31;
    *(void *)&v23[13] = *(void *)&v31[13];
    *(_DWORD *)uint64_t v24 = *(_DWORD *)v14;
    *(_DWORD *)&v24[3] = *(_DWORD *)&v14[3];
    uint64_t v25 = v9;
    int v26 = v10;
    char v27 = v11;
    *(_DWORD *)&v28[15] = *(_DWORD *)((char *)v30 + 15);
    *(_OWORD *)uint64_t v28 = v30[0];
    dispatch_async(v13, __str);
  }
}

uint64_t __copy_helper_block_e8_40c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE72c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE104c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](a1 + 104, a2 + 104);
}

void sub_263D543F8(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *__destroy_helper_block_e8_40c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE72c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE104c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE(void *a1)
{
  uint64_t v2 = a1 + 9;
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](a1 + 13);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v2);

  return std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](a1 + 5);
}

void gnss::GnssAdaptDevice::stopTimeTransferSession(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 24))
  {
    uint64_t v2 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice23stopTimeTransferSessionENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_88;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v5, a2);
    dispatch_async(v2, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v5);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 69, "stopTimeTransferSession", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void *___ZN4gnss15GnssAdaptDevice23stopTimeTransferSessionENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  v3[4] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  *(unsigned char *)(v1 + 92) = 0;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v3, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 1, (uint64_t)v3, (uint64_t)"stopTimeTransferSession_block_invoke");
  return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v3);
}

void sub_263D54668(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::Ga03_00RegisterGnsEaStatusResponse(gnss::GnssAdaptDevice *a1, uint64_t a2, int *a3)
{
  int v4 = (int)a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t DeviceInstance = gnss::GnssAdaptDevice::Ga00_00GetDeviceInstance(a1);
  if (DeviceInstance)
  {
    uint64_t v6 = DeviceInstance;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse", v4);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (!a3)
    {
      if (!g_LbsOsaTrace_Config) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MsgData,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "Ga03_01HandleGnsEaStatusResponse", 770, v4);
      int v10 = 1;
      goto LABEL_10;
    }
    int v8 = a3[1];
    if (v8 == 3)
    {
      if (g_LbsOsaTrace_Config < 4) {
        return;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Resp rcvd for E_gnsEA_DATA_UAC\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse");
      int v10 = 4;
LABEL_10:
      gnssOsa_PrintLog(__str, v10, 1, 0);
      return;
    }
    int v12 = *a3;
    int v13 = a3[2];
    uint64_t v14 = *(NSObject **)(v6 + 152);
    *(void *)long long __str = MEMORY[0x263EF8330];
    uint64_t v16 = 0x40000000;
    uint64_t v17 = ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke;
    uint64_t v18 = &__block_descriptor_tmp_98;
    uint64_t v19 = v6;
    int v20 = v12;
    int v21 = v8;
    int v22 = v13;
    dispatch_async(v14, __str);
  }
}

void *___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v28 = 0;
  uint64_t v2 = v1 + 128;
  uint64_t v3 = *(void *)(v1 + 128);
  if (!v3) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 40);
  uint64_t v6 = v1 + 128;
  uint64_t v7 = *(void *)(v1 + 128);
  do
  {
    unsigned int v8 = *(_DWORD *)(v7 + 32);
    BOOL v9 = v8 >= v5;
    if (v8 >= v5) {
      int v10 = (uint64_t *)v7;
    }
    else {
      int v10 = (uint64_t *)(v7 + 8);
    }
    if (v9) {
      uint64_t v6 = v7;
    }
    uint64_t v7 = *v10;
  }
  while (*v10);
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_12:
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnsStatusRespLut Hdl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v27);
  }
  uint64_t v12 = v1 + 128;
  do
  {
    unsigned int v13 = *(_DWORD *)(v3 + 32);
    BOOL v14 = v13 >= v5;
    if (v13 >= v5) {
      uint64_t v15 = (uint64_t *)v3;
    }
    else {
      uint64_t v15 = (uint64_t *)(v3 + 8);
    }
    if (v14) {
      uint64_t v12 = v3;
    }
    uint64_t v3 = *v15;
  }
  while (*v15);
  if (v12 == v2 || v5 < *(_DWORD *)(v12 + 32)) {
    uint64_t v12 = v1 + 128;
  }
  std::function<void ()(gnss::Result)>::operator=(v27, v12 + 40);
  std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::__remove_node_pointer((uint64_t **)(v1 + 120), (uint64_t *)v6);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100]((void *)(v6 + 40));
  operator delete((void *)v6);
  if (v28)
  {
    int v16 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
    if (*(_DWORD *)(a1 + 44) != 1) {
      goto LABEL_34;
    }
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v17 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ExtPosAssist Accepted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
        gnssOsa_PrintLog(__str, 4, 1, 0);
        goto LABEL_34;
      }
    }
    else if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v19 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ExtPosAssist Rejected\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
      gnssOsa_PrintLog(__str, 4, 1, 0);
LABEL_34:
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v20 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ea Type,%u,ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke", *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 40));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
    }
    int v21 = *(NSObject **)(v1 + 160);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke_2;
    block[3] = &__block_descriptor_tmp_97;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v24, (uint64_t)v27);
    int v25 = v16;
    dispatch_async(v21, block);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v24);
    return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v27);
  }
  if (g_LbsOsaTrace_Config >= 2)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v18 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx API type,%u ID,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770, *(unsigned __int8 *)(a1 + 44), *(_DWORD *)(a1 + 40));
    gnssOsa_PrintLog(__str, 2, 1, 0);
  }
  return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v27);
}

void sub_263D54D0C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100]((void *)(v1 - 88));
  _Unwind_Resume(a1);
}

uint64_t ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke_2(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 64);
  uint64_t v2 = a1 + 32;

  return std::function<void ()(gnss::Result)>::operator()(v2, v1);
}

void *___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke(uint64_t a1)
{
  v76[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)v76, v2 + 296);
  if (v76[3])
  {
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v3 = *(NSObject **)(v2 + 160);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 1174405120;
      block[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2;
      block[3] = &__block_descriptor_tmp_101;
      int v4 = v66;
      std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)v66, (uint64_t)v76);
      v66[32] = 0;
      uint64_t v67 = 0;
      int v68 = -1082130432;
      char v69 = 0;
      int v70 = 0;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v71 = -1;
      uint64_t v74 = 0;
      dispatch_async(v3, block);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v5 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status Unavailable\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
LABEL_15:
      int v16 = v4;
LABEL_16:
      std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v16);
      return std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v76);
    }
    int v7 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      double v8 = *(double *)(a1 + 56);
      unint64_t v9 = (unint64_t)(*(double *)(a1 + 48) * 1000000.0) + 604800000000000 * *(__int16 *)(a1 + 42);
      uint64_t v38 = *(void *)(a1 + 88);
      uint64_t v39 = *(void *)(a1 + 96);
      if (v8 * 1000000.0 <= 3.40282347e38)
      {
        float v11 = v8 * 1000000.0;
        char v10 = 1;
      }
      else
      {
        char v10 = 1;
        float v11 = 3.4028e38;
      }
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      unint64_t v9 = 0;
      char v10 = 0;
      float v11 = -1.0;
    }
    uint64_t v12 = 1000000 * *(unsigned int *)(a1 + 80);
    double v13 = *(double *)(a1 + 72);
    if (v13 > 2147483650.0)
    {
      BOOL v14 = *(NSObject **)(v2 + 160);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 1174405120;
      v53[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_103;
      v53[3] = &__block_descriptor_tmp_106_0;
      int v4 = v54;
      std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)v54, (uint64_t)v76);
      v54[32] = v10;
      unint64_t v55 = v9;
      float v56 = v11;
      char v57 = 0;
      int v58 = 0;
      uint64_t v59 = v12;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      uint64_t v63 = v38;
      uint64_t v64 = v39;
      dispatch_async(v14, v53);
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UTCorr,%.9f \n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v13);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      goto LABEL_15;
    }
    double v18 = -0.5;
    if (v13 > 0.0) {
      double v18 = 0.5;
    }
    int v19 = (int)(v13 + v18);
    uint64_t v20 = &unk_26A9CB000;
    unsigned int v21 = g_LbsOsaTrace_Config;
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v22 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTCCorr %.9f,LeapSec,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 68, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v13, v19);
      gnssOsa_PrintLog(__str, 5, 1, 0);
      uint64_t v20 = &unk_26A9CB000;
      unsigned int v21 = g_LbsOsaTrace_Config;
    }
    double v23 = v13 - (double)(unint64_t)v13;
    if (v23 > 0.0000005 && v23 < 0.9999995 && v21 >= 2)
    {
      bzero(__str, 0x3C6uLL);
      uint64_t v25 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UtcCorr beyond 500ns from seconds boundary,%.9f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 87, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770, v13);
      gnssOsa_PrintLog(__str, 2, 1, 0);
      uint64_t v20 = &unk_26A9CB000;
    }
    if (*(unsigned char *)(a1 + 64)) {
      BOOL v26 = *(unsigned char *)(a1 + 40) != 0;
    }
    else {
      BOOL v26 = 0;
    }
    unsigned int v27 = *(unsigned __int8 *)(a1 + 84);
    if (v27 >= 6)
    {
      if (g_LbsOsaTrace_Config < 4)
      {
        char v28 = v10;
        unsigned int v27 = 0;
      }
      else
      {
        bzero(__str, 0x3C6uLL);
        uint64_t v29 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid TimeMark Qual\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke");
        gnssOsa_PrintLog(__str, 4, 1, 0);
        char v28 = v10;
        unsigned int v27 = 0;
        uint64_t v20 = (_DWORD *)&unk_26A9CB000;
      }
    }
    else
    {
      char v28 = v10;
    }
    unsigned int v30 = *(unsigned __int16 *)(a1 + 86);
    int v31 = v30 & 0x11 | (8 * ((v30 >> 1) & 1)) | (v30 >> 4) & 6 | (v30 >> 2) & 0x20;
    unsigned int v32 = v20[782];
    if ((v30 & 8) != 0)
    {
      if (!v32)
      {
LABEL_47:
        uint64_t v37 = *(NSObject **)(v2 + 160);
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 1174405120;
        v40[2] = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_113;
        v40[3] = &__block_descriptor_tmp_116;
        std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100]((uint64_t)v41, (uint64_t)v76);
        v41[32] = v28;
        unint64_t v42 = v9;
        float v43 = v11;
        BOOL v44 = v26;
        int v45 = v19;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v46 = v12;
        unsigned int v49 = v27;
        int v50 = v31;
        uint64_t v51 = v38;
        uint64_t v52 = v39;
        dispatch_async(v37, v40);
        int v16 = v41;
        goto LABEL_16;
      }
      bzero(__str, 0x3C6uLL);
      uint64_t v33 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Constel E_GNM_GNSSID_MODGPS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
      gnssOsa_PrintLog(__str, 1, 1, 0);
      unsigned int v32 = g_LbsOsaTrace_Config;
    }
    if (v32 >= 4)
    {
      bzero(__str, 0x3C6uLL);
      unint64_t v34 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      uint64_t v35 = 70;
      if (v26) {
        uint64_t v36 = 84;
      }
      else {
        uint64_t v36 = 70;
      }
      if (v7) {
        uint64_t v35 = 84;
      }
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: WkValid,%c,TimeNs,%llu,TimeUncNs,%f,ClkNs,%llu,LeapSecValid,%c,LeapSec,%d,Qual,%u,ConstUsed,%u,BCTNs,%llu,BCTUncNs,%llu\n", v34, "ADP", 73, "Ga03_02HandleTimeMarkDataCallback_block_invoke", v35, v9, v11, v12, v36, v19, v27, v31, v38, v39);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    goto LABEL_47;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    uint64_t v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeTransferDataCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback_block_invoke", 770);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v76);
}

void sub_263D55574(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100]((void *)(v1 - 144));
  _Unwind_Resume(a1);
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2(uint64_t a1)
{
  return std::function<void ()(gnss::Result,gnss::TimeTransferData)>::operator()(*(void *)(a1 + 56), 8);
}

uint64_t std::function<void ()(gnss::Result,gnss::TimeTransferData)>::operator()(uint64_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v3 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)a1 + 48))(a1, &v3);
}

uint64_t __copy_helper_block_e8_32c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 32;
  uint64_t v3 = a1 + 32;

  return std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100](v3, v2);
}

void *__destroy_helper_block_e8_32c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 32);

  return std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::~__value_func[abi:ne180100](v1);
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_103(uint64_t a1)
{
  return std::function<void ()(gnss::Result,gnss::TimeTransferData)>::operator()(*(void *)(a1 + 56), 8);
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_113(uint64_t a1)
{
  return std::function<void ()(gnss::Result,gnss::TimeTransferData)>::operator()(*(void *)(a1 + 56), 1);
}

uint64_t std::__function::__value_func<void ()(gnss::Result,gnss::TimeTransferData)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t NK_Reflection_Rejection_Ped(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3 + 27136;
  if (a4[468])
  {
    if (*(_DWORD *)v4)
    {
      if (!*((unsigned char *)a4 + 1488)
        && *(double *)(a3 + 27520) <= 6.0
        && (*(_DWORD *)(a3 + 20) - 4) >= 5
        && *((unsigned __int8 *)a4 + 1881) > 0xEu)
      {
        uint64_t v9 = result;
        if (!*(_WORD *)(result + 248)
          || (double v10 = *(double *)(result + 80), v10 >= -10.0) && v10 <= 70.0 && fabs(*(double *)(result + 120)) <= 2.5)
        {
          long long v97 = (double *)(a4 + 15492);
          long long v99 = (char *)a4 + 21659;
          long long v98 = (char *)a4 + 6755;
          int v7 = (unsigned char *)(a3 + 27732);
          if (!*(unsigned char *)(a3 + 27732))
          {
            *(_WORD *)(a3 + 27732) = 1;
            bzero((void *)(a3 + 28080), 0x9C00uLL);
            *(void *)&long long v11 = -1;
            *((void *)&v11 + 1) = -1;
            *(_OWORD *)(a3 + 28064) = v11;
            *(_OWORD *)(a3 + 28038) = v11;
            *(_OWORD *)(a3 + 28054) = v11;
            *(_OWORD *)(a3 + 28006) = v11;
            *(_OWORD *)(a3 + 28022) = v11;
            *(_OWORD *)(a3 + 27974) = v11;
            *(_OWORD *)(a3 + 27990) = v11;
            *(_OWORD *)(a3 + 27942) = v11;
            *(_OWORD *)(a3 + 27958) = v11;
            *(_OWORD *)(a3 + 27910) = v11;
            *(_OWORD *)(a3 + 27926) = v11;
            *(_OWORD *)(a3 + 27878) = v11;
            *(_OWORD *)(a3 + 27894) = v11;
            *(_OWORD *)(a3 + 27846) = v11;
            *(_OWORD *)(a3 + 27862) = v11;
            *(_OWORD *)(a3 + 27814) = v11;
            *(_OWORD *)(a3 + 27830) = v11;
            *(_OWORD *)(a3 + 27782) = v11;
            *(_OWORD *)(a3 + 27798) = v11;
            *(_OWORD *)(a3 + 27750) = v11;
            *(_OWORD *)(a3 + 27766) = v11;
            *(_OWORD *)(a3 + 27734) = v11;
          }
          uint64_t v12 = 0;
          v100[0] = 0;
          *(void *)&long long v13 = -1;
          *((void *)&v13 + 1) = -1;
          v102[6] = v13;
          v102[7] = v13;
          v102[4] = v13;
          v102[5] = v13;
          uint64_t v14 = a3 + 27952;
          v102[2] = v13;
          v102[3] = v13;
          v102[0] = v13;
          v102[1] = v13;
          while (1)
          {
            int v15 = *(_DWORD *)(a2 + 4 * v12 + 96);
            double result = Is_Legal(v15);
            if (result) {
              BOOL v16 = v15 == 7;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16
              && (v15 != 4 || BYTE2(v15) - 59 >= 0xFFFFFFCB)
              && *((unsigned char *)a4 + v12 + 6808)
              && *((unsigned char *)a4 + v12 + 21712)
              && *((unsigned char *)a4 + v12 + 57))
            {
              if (*((unsigned char *)a4 + v12 + 63904) && *((unsigned char *)a4 + v12 + 63776))
              {
                double result = GNSS_Id_To_Num_Prn_Idx(v15);
                uint64_t v17 = (unsigned char *)(a3 + (int)result + 27734);
                unsigned int v18 = *v17;
                if (v18 == 255)
                {
                  if (*(unsigned __int8 *)(v4 + 597) == 128)
                  {
                    double result = (uint64_t)EvLog("NK_Reflection_Rejection_Ped: No space");
LABEL_52:
                    if ((int)v100[0] < 4) {
                      goto LABEL_8;
                    }
                    VecMedian8(v101, v100[0]);
                    uint64_t v24 = 0;
                    double v26 = -v25;
                    uint64_t v27 = a3 + 28112;
                    uint64_t v28 = a3 + 28304;
                    uint64_t v29 = a3 + 28312;
                    unsigned int v30 = (void *)(a3 + 28320);
                    double result = 28080;
                    long long v95 = a4 + 1688;
                    int v94 = a4 + 5414;
                    while (2)
                    {
                      int v31 = (unsigned char *)(a3 + v24 + 27952);
                      uint64_t v32 = *v31;
                      if (v32 != 255)
                      {
                        uint64_t v33 = *((unsigned __int8 *)v102 + v24);
                        if (v33 == 255)
                        {
                          unint64_t v42 = (int *)(a3 + 312 * v24 + 28080);
                          if (*v42 >= 1
                            && (float v43 = (unsigned int *)(a3 + 312 * v24 + 28084), *v43)
                            && *(_DWORD *)(a3 + 312 * v24 + 4 * (*v42 - 1) + 28112)
                            && (unsigned int v44 = *a4,
                                10 * *(_DWORD *)(v9 + 1660) + 300000 + *(_DWORD *)(a3 + 312 * v24 + 28112) > *a4))
                          {
                            *(double *)(a3 + 312 * v24 + 28104) = *(double *)(a3 + 312 * v24 + 28104)
                                                                + v26 * ((double)(int)(v44 - *v43) * 0.001);
                            unsigned int *v43 = v44;
                          }
                          else
                          {
                            *(void *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)unint64_t v42 = 0uLL;
                            *(unsigned char *)(a3 + v32 + 27734) = -1;
                            *int v31 = -1;
                            --*(unsigned char *)(v4 + 597);
                          }
                        }
                        else
                        {
                          unint64_t v34 = (unsigned int *)(a3 + 312 * v24 + 28080);
                          uint64_t v35 = *v34;
                          if (!v35)
                          {
                            *(void *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)unint64_t v34 = 0uLL;
                            *unint64_t v34 = 1;
                            unsigned int v45 = *a4;
                            uint64_t v46 = a3 + 312 * v24;
                            *(_DWORD *)(v46 + 28084) = *a4;
                            *(void *)(v46 + 28088) = *(void *)&a4[2 * v33 + 16040];
                            *(_DWORD *)(v46 + 28112) = v45;
                            *(void *)(v46 + 28152) = 0;
                            *(void *)(v46 + 28096) = *(void *)(a2 + 8 * v33 + 3424);
                            goto LABEL_115;
                          }
                          uint64_t v36 = (int)v35 - 1;
                          unsigned int v37 = *a4;
                          int v38 = *(_DWORD *)(a3 + 312 * v24 + 4 * v36 + 28112);
                          int v39 = *a4 - v38;
                          if (v39 > 300000)
                          {
                            uint64_t v40 = a3 + 312 * v24;
                            *(void *)(v40 + 28384) = 0;
                            *(_OWORD *)(v40 + 28352) = 0uLL;
                            *(_OWORD *)(v40 + 28368) = 0uLL;
                            *(_OWORD *)(v40 + 28320) = 0uLL;
                            *(_OWORD *)(v40 + 28336) = 0uLL;
                            *(_OWORD *)(v40 + 28288) = 0uLL;
                            *(_OWORD *)(v40 + 28304) = 0uLL;
                            *(_OWORD *)(v40 + 28256) = 0uLL;
                            *(_OWORD *)(v40 + 28272) = 0uLL;
                            *(_OWORD *)(v40 + 28224) = 0uLL;
                            *(_OWORD *)(v40 + 28240) = 0uLL;
                            *(_OWORD *)(v40 + 28192) = 0uLL;
                            *(_OWORD *)(v40 + 28208) = 0uLL;
                            *(_OWORD *)(v40 + 28160) = 0uLL;
                            *(_OWORD *)(v40 + 28176) = 0uLL;
                            *(_OWORD *)(v40 + 28128) = 0uLL;
                            *(_OWORD *)(v40 + 28144) = 0uLL;
                            *(_OWORD *)(v40 + 28096) = 0uLL;
                            *(_OWORD *)(v40 + 28112) = 0uLL;
                            *(_OWORD *)unint64_t v34 = 0uLL;
                            *unint64_t v34 = 1;
                            unsigned int v41 = *a4;
                            *(_DWORD *)(v40 + 28084) = *a4;
                            *(void *)(v40 + 28088) = *(void *)&a4[2 * v33 + 16040];
                            *(_DWORD *)(v40 + 28112) = v41;
                            *(void *)(v40 + 28152) = 0;
                            *(void *)(v40 + 28096) = *(void *)(a2 + 8 * v33 + 3424);
                            goto LABEL_115;
                          }
                          uint64_t v47 = a2 + 8 * v33;
                          uint64_t v48 = a3 + 312 * v24;
                          double v49 = *(double *)(v48 + 28096);
                          if (vabdd_f64(*(double *)(v47 + 3424), v49) > 149896.229)
                          {
                            *(void *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)unint64_t v34 = 0uLL;
                            goto LABEL_115;
                          }
                          uint64_t v50 = a3 + 312 * v24;
                          uint64_t v51 = (unsigned int *)(v50 + 28084);
                          int v52 = *(_DWORD *)(v50 + 28084);
                          double v53 = *(double *)(v50 + 28104) + v26 * ((double)(int)(v37 - v52) * 0.001);
                          *(double *)(v50 + 28104) = v53;
                          if (*(unsigned char *)(v4 + 114))
                          {
                            double v54 = 1.5;
                            double v55 = 0.15;
                            if (*(double *)(a3 + 27520) > 1.5)
                            {
                              if (*v97 >= 0.15) {
                                double v55 = *v97;
                              }
                              else {
                                double v55 = 0.15;
                              }
                              double v54 = *(double *)(a3 + 27520);
                            }
                          }
                          else
                          {
                            double v54 = 1.5;
                            double v55 = 0.15;
                          }
                          double v56 = (double)v39;
                          double v57 = (double)v39 * 0.001;
                          long long v96 = (double *)&a4[2 * v33 + 16040];
                          double v58 = v57 * ((*(double *)(v50 + 28088) + *v96) * 0.5);
                          double v59 = *(double *)(a3 + 40 * v33 + 1936);
                          double v60 = v57 * (v55 * 3.0 + v59 * v54);
                          *(void *)int v100 = v47 + 3424;
                          double v61 = *(double *)(v47 + 3424);
                          double v62 = v61 - (v49 + v53 + v58 + v60 + 50.0);
                          BOOL v63 = v62 >= 1000.0 || v62 <= 0.0;
                          int v64 = 2;
                          if (v63) {
                            int v65 = 0;
                          }
                          else {
                            int v65 = 2;
                          }
                          if ((v65 - 1) < 0x1D)
                          {
LABEL_82:
                            *uint64_t v51 = v37;
                            v95[v33 + 142] = v64;
                            ++v98[1];
                            *((unsigned char *)v95 + v33 + 312) = 0;
                            --*v98;
                            v94[v33 + 142] = v64;
                            ++v99[1];
                            *((unsigned char *)v94 + v33 + 312) = 0;
                            --*v99;
                            goto LABEL_115;
                          }
                          if ((int)v35 <= 1) {
                            goto LABEL_113;
                          }
                          uint64_t v66 = 0;
                          int v67 = v35 - 1;
                          while (*(_DWORD *)(v27 + 4 * v66) < v37 - 10 * *(_DWORD *)(v9 + 1660))
                          {
                            ++v66;
                            --v67;
                            if (v35 == v66) {
                              goto LABEL_98;
                            }
                          }
                          if ((int)v36 <= (int)v66)
                          {
                            int v68 = 1;
                            double v70 = v49;
                          }
                          else
                          {
                            int v68 = v35 - v66;
                            double v69 = 0.0;
                            double v70 = v49;
                            double v71 = v49;
                            long long v72 = (double *)(v28 + 8 * v35);
                            do
                            {
                              double v69 = v69 + *(v72 - 10) + *v72;
                              double v71 = v71 - *(v72 - 20);
                              double v70 = v69 + v70 + v71;
                              --v72;
                              --v67;
                            }
                            while (v67);
                          }
                          double v73 = v61 - (50.0 / (double)v68 + v60 + v58 + v53 + v70 / (double)v68 + 20.0);
                          if (v73 < 1000.0 && v73 > 0.0) {
                            int v65 = 3;
                          }
LABEL_98:
                          if ((int)v35 < 6 || v52 != v38 || v65) {
                            goto LABEL_108;
                          }
                          if (v55 <= 0.75) {
                            double v75 = 2.25;
                          }
                          else {
                            double v75 = v55 * 3.0;
                          }
                          double v76 = v53 + v58;
                          double v77 = v49 + v53 + v58 - v61;
                          double v78 = v77 * v56;
                          double v79 = v56 * v56;
                          uint64_t v80 = v36 - 1;
                          unint64_t v81 = (double *)(v29 + 8 * v36);
                          int v82 = 1;
                          double v83 = v49;
                          do
                          {
                            double v76 = v76 + *(v81 - 10) + *v81;
                            double v84 = (double)(int)(v37 - *(_DWORD *)(a3 + 312 * v24 + 4 * v80 + 28112));
                            double v83 = v83 - *(v81 - 20);
                            double v85 = v76 + v83 - v61;
                            ++v82;
                            double v56 = v56 + v84;
                            double v79 = v79 + v84 * v84;
                            double v77 = v77 + v85;
                            double v78 = v78 + v85 * v84;
                            --v80;
                            --v81;
                          }
                          while (v35 != v82);
                          double v86 = (double)(int)v35 * v79 - v56 * v56;
                          if (v86 > 0.0)
                          {
                            int v65 = 4 * ((v77 * -v56 + (double)(int)v35 * v78) * -1000.0 / v86 > v75 + v59 * v54);
LABEL_108:
                            int v64 = v65;
                            if ((v65 - 1) <= 0x1C) {
                              goto LABEL_82;
                            }
                          }
                          if (v35 == 10)
                          {
                            uint64_t v87 = 0;
                            long long v88 = v30;
                            long long v89 = *(double **)v100;
                            do
                            {
                              *(_DWORD *)(v27 + v87) = *(_DWORD *)(v27 + v87 + 4);
                              *(v88 - 21) = *(v88 - 20);
                              *(v88 - 11) = *(v88 - 10);
                              *(v88 - 1) = *v88;
                              v87 += 4;
                              ++v88;
                            }
                            while (v87 != 36);
                            unsigned int v37 = *a4;
                            double v61 = *v89;
                            LODWORD(v35) = 9;
                          }
                          else
                          {
LABEL_113:
                            long long v89 = *(double **)v100;
                          }
                          long long v90 = (void *)(v50 + 28104);
                          int v91 = (void *)(v50 + 28088);
                          *unint64_t v34 = v35 + 1;
                          *uint64_t v51 = v37;
                          uint64_t v92 = a3 + 312 * v24 + 28080;
                          *(_DWORD *)(v92 + 4 * (int)v35 + 32) = v37;
                          uint64_t v93 = v92 + 8 * (int)v35;
                          *(double *)(v93 + 72) = v61 - v49;
                          *(double *)(v48 + 28096) = *v89;
                          *(void *)(v93 + 152) = *v90;
                          *(double *)(v93 + 232) = v58;
                          void *v90 = 0;
                          void *v91 = *(void *)v96;
                        }
                      }
LABEL_115:
                      ++v24;
                      v27 += 312;
                      v28 += 312;
                      v29 += 312;
                      v30 += 39;
                      if (v24 == 128) {
                        return result;
                      }
                      continue;
                    }
                  }
                  uint64_t v19 = 0;
                  while (*(unsigned __int8 *)(v14 + v19) != 255)
                  {
                    if (++v19 == 128)
                    {
                      double result = (uint64_t)EvCrt_v("NK_Reflection_Rejection_Ped: CODING ERROR");
                      goto LABEL_8;
                    }
                  }
                  *(unsigned char *)(v14 + v19) = result;
                  unsigned char *v17 = v19;
                  ++*(unsigned char *)(v4 + 597);
                  unsigned int v18 = *v17;
                }
                *((unsigned char *)v102 + v18) = v12;
                if (*(unsigned __int8 *)(a2 + v12 + 1760) >= 0x13u && *(int *)(a3 + 40 * v12 + 1920) >= 45)
                {
                  double v20 = *(double *)(a2 + 8 * v12 + 4448) + *(double *)&a4[2 * v12 + 16040];
                  unsigned int v21 = v100[0];
                  if (v100[0])
                  {
                    if ((int)v100[0] < 1)
                    {
LABEL_45:
                      unsigned int v21 = v100[0];
                      v101[v100[0]] = v20;
                    }
                    else
                    {
                      uint64_t v22 = 0;
                      uint64_t v23 = v100[0];
                      while (v20 >= v101[v22])
                      {
                        if (v100[0] == ++v22) {
                          goto LABEL_45;
                        }
                      }
                      if ((int)v100[0] > (int)v22)
                      {
                        do
                        {
                          v101[v23] = v101[v23 - 1];
                          --v23;
                        }
                        while (v23 > v22);
                      }
                      v101[v22] = v20;
                      unsigned int v21 = v100[0];
                    }
                  }
                  else
                  {
                    v101[0] = *(double *)(a2 + 8 * v12 + 4448) + *(double *)&a4[2 * v12 + 16040];
                  }
                  v100[0] = v21 + 1;
                }
              }
              else
              {
                double result = (uint64_t)EvLog("NK_Reflection_Rejection_Ped: No SAPE data");
              }
            }
            if (++v12 == 128) {
              goto LABEL_52;
            }
          }
        }
      }
    }
  }
  int v7 = (unsigned char *)(a3 + 27732);
LABEL_8:
  unsigned char *v7 = 0;
  return result;
}

const void **SV_Gen_Meas_Update_Wrapper(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  v21[528] = *MEMORY[0x263EF8340];
  uint64_t v2 = -4608;
  do
  {
    uint64_t v3 = &__dst[v2];
    *((_OWORD *)v3 + 289) = 0uLL;
    *((_OWORD *)v3 + 288) = 0uLL;
    __dst[v2 + 4640] = 0;
    v2 += 36;
  }
  while (v2);
  uint64_t v4 = 4608;
  do
  {
    uint64_t v5 = &__dst[v4];
    *(void *)uint64_t v5 = 0;
    *((_WORD *)v5 + 4) = 0;
    *(void *)(v5 + 12) = 0;
    *((void *)v5 + 6) = 0;
    *((void *)v5 + 3) = 0;
    *((void *)v5 + 4) = 0;
    v4 += 56;
    *(void *)(v5 + 38) = 0;
  }
  while (v5 + 56 != (char *)v10);
  *(void *)((char *)v10 + 5) = 0;
  v10[0] = 0;
  uint64_t v6 = 11792;
  do
  {
    int v7 = &__dst[v6];
    *(_DWORD *)int v7 = 0;
    void v7[4] = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = 0;
    v7[24] = 0;
    *(void *)(v7 + 34) = 0;
    *(void *)(v7 + 26) = 0;
    v6 += 48;
    *(_DWORD *)(v7 + 42) = 0;
  }
  while (v7 + 48 != (char *)&v11);
  int v11 = 0;
  char v12 = 0;
  __int16 v15 = 0;
  long long v13 = 0u;
  char v14 = 0;
  char v19 = 0;
  uint64_t v16 = 0;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  bzero(&v20, 0x20CuLL);
  bzero(v21, 0x1080uLL);
  GNSS_Validate_p_list((const void **)v1, "SV_Gen_Meas_Update_Wrapper: Entry");
  *(void *)(v1 + 160) = __dst;
  SV_Gen_Meas(*(void *)(v1 + 120), __dst, *(int **)(v1 + 200), *(void *)(v1 + 80), *(void *)(v1 + 16), *(void *)(v1 + 72), *(void *)(v1 + 40), *(void *)(v1 + 56), *(void *)(v1 + 48), *(void *)(v1 + 96), *(void *)(v1 + 64));
  *(void *)(v1 + 160) = 0;
  return GNSS_Validate_p_list((const void **)v1, "SV_Gen_Meas_Update_Wrapper:  Exit");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x270EF4008](interface);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x270F967E0]();
}

uint64_t TelephonyBasebandGNSSTrapTrigger()
{
  return MEMORY[0x270F967F0]();
}

uint64_t TelephonyBasebandGNSSWakeTrigger()
{
  return MEMORY[0x270F967F8]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x270F96820]();
}

uint64_t TelephonyBasebandRegisterForEvents()
{
  return MEMORY[0x270F96848]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__double cosval = v2;
  result.__sinval = v1;
  return result;
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x270EDAE40](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x270EDAEE8](a1, a2, a3);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x270EDB040](a1, *(void *)&a2, a3);
}

int sched_get_priority_max(int a1)
{
  return MEMORY[0x270EDB310](*(void *)&a1);
}

int sched_get_priority_min(int a1)
{
  return MEMORY[0x270EDB318](*(void *)&a1);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}