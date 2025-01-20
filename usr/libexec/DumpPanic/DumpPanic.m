uint64_t ccaes_arm_encrypt_cbc(uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  BOOL v15;
  int8x16_t v17;

  if (a3)
  {
    v5 = *(unsigned int *)(result + 240);
    if (v5 == 160 || v5 == 192 || v5 == 224)
    {
      do
      {
        v6 = v5 - 16;
        a4 += 16;
        _Q2 = *(int8x16_t *)result;
        v7 = (int8x16_t *)(result + 16);
        do
        {
          __asm
          {
            AESE            V0.16B, V2.16B
            AESMC           V0.16B, V0.16B
          }
          _Q2 = *v7++;
          v15 = v6 <= 16;
          v6 -= 16;
        }
        while (!v15);
        __asm { AESE            V0.16B, V2.16B }
        v17 = veorq_s8(_Q0, *v7);
        result = (uint64_t)v7->i64 - v5;
        *a5++ = v17;
        v15 = a3-- <= 1;
      }
      while (!v15);
      result = 0;
      *a2 = v17;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

uint64_t ccentropy_rng_init(void *a1, uint64_t a2)
{
  BOOL v5 = timingsafe_enable_if_supported();
  *a1 = &off_1000348C0;
  a1[1] = a2;
  cc_disable_dit_with_sb((unsigned int *)&v5);
  return 0;
}

uint64_t sub_100004790(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t sub_1000047A0(unint64_t *a1, uint64_t a2, int a3, int a4)
{
  v4 = &byte_100029DC0;
  *(_DWORD *)(a2 + 240) = 16 * a4;
  if (a3 == 6)
  {
    unint64_t v15 = *a1;
    unint64_t v16 = a1[1];
    v14 = (uint64_t *)(a1 + 2);
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = v16;
    v17 = (uint64_t *)(a2 + 16);
    uint64_t v18 = *v14;
    uint64_t *v17 = *v14;
    v19 = (unint64_t *)(v17 + 1);
    int v20 = 4 * a4 - 2;
    do
    {
      HIDWORD(v21) = HIDWORD(v18);
      LODWORD(v21) = HIDWORD(v18);
      unsigned int v22 = *v4++;
      uint64_t result = v22;
      uint64_t v23 = (byte_100029DCC[BYTE5(v18)] | (byte_100029DCC[(v21 >> 8) >> 24] << 24) | (byte_100029DCC[((v21 >> 8) >> 16)] << 16) | (byte_100029DCC[(unsigned __int16)(HIDWORD(v18) >> 8) >> 8] << 8)) ^ v22;
      v15 ^= v23 ^ ((v15 ^ v23) << 32);
      v16 ^= HIDWORD(v15) ^ ((v16 ^ HIDWORD(v15)) << 32);
      v18 ^= HIDWORD(v16) ^ ((v18 ^ HIDWORD(v16)) << 32);
      unint64_t *v19 = v15;
      v19[1] = v16;
      v24 = v19 + 2;
      void *v24 = v18;
      v19 = v24 + 1;
      BOOL v13 = __OFSUB__(v20, 6);
      v20 -= 6;
    }
    while (!((v20 < 0) ^ v13 | (v20 == 0)));
  }
  else if (a3 == 8)
  {
    unint64_t v26 = *a1;
    unint64_t v27 = a1[1];
    v25 = a1 + 2;
    *(void *)a2 = v26;
    *(void *)(a2 + 8) = v27;
    v28 = (unint64_t *)(a2 + 16);
    unint64_t v29 = *v25;
    unint64_t v30 = v25[1];
    unint64_t *v28 = *v25;
    v28[1] = v30;
    v31 = v28 + 2;
    int v32 = 4 * a4 - 4;
    do
    {
      HIDWORD(v33) = HIDWORD(v30);
      LODWORD(v33) = HIDWORD(v30);
      unsigned int v34 = *v4++;
      uint64_t result = v34;
      uint64_t v35 = (byte_100029DCC[BYTE5(v30)] | (byte_100029DCC[(v33 >> 8) >> 24] << 24) | (byte_100029DCC[((v33 >> 8) >> 16)] << 16) | (byte_100029DCC[(unsigned __int16)(HIDWORD(v30) >> 8) >> 8] << 8)) ^ v34;
      v26 ^= v35 ^ ((v26 ^ v35) << 32);
      v27 ^= HIDWORD(v26) ^ ((v27 ^ HIDWORD(v26)) << 32);
      unint64_t *v31 = v26;
      v31[1] = v27;
      v36 = v31 + 2;
      int v37 = v32 - 4;
      if (!v37) {
        break;
      }
      uint64_t result = byte_100029DCC[HIBYTE(HIDWORD(v27))];
      uint64_t v38 = byte_100029DCC[BYTE4(v27)] | (result << 24) | (byte_100029DCC[BYTE6(v27)] << 16) | (byte_100029DCC[BYTE5(v27)] << 8);
      v29 ^= v38 ^ ((v29 ^ v38) << 32);
      v30 ^= HIDWORD(v29) ^ ((v30 ^ HIDWORD(v29)) << 32);
      unint64_t *v36 = v29;
      v36[1] = v30;
      v31 = v36 + 2;
      BOOL v13 = __OFSUB__(v37, 4);
      int v32 = v37 - 4;
    }
    while (!((v32 < 0) ^ v13 | (v32 == 0)));
  }
  else
  {
    unint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    *(void *)a2 = *a1;
    *(void *)(a2 + 8) = v6;
    v7 = (unint64_t *)(a2 + 16);
    int v8 = 4 * a4;
    do
    {
      HIDWORD(v9) = HIDWORD(v6);
      LODWORD(v9) = HIDWORD(v6);
      unsigned int v11 = *v4++;
      uint64_t result = v11;
      uint64_t v12 = (byte_100029DCC[BYTE5(v6)] | (byte_100029DCC[(v9 >> 8) >> 24] << 24) | (byte_100029DCC[((v9 >> 8) >> 16)] << 16) | (byte_100029DCC[(unsigned __int16)(HIDWORD(v6) >> 8) >> 8] << 8)) ^ v11;
      v5 ^= v12 ^ ((v5 ^ v12) << 32);
      v6 ^= HIDWORD(v5) ^ ((v6 ^ HIDWORD(v5)) << 32);
      unint64_t *v7 = v5;
      v7[1] = v6;
      v7 += 2;
      BOOL v13 = __OFSUB__(v8, 4);
      v8 -= 4;
    }
    while (!((v8 < 0) ^ v13 | (v8 == 0)));
  }
  return result;
}

uint64_t ccaes_arm_encrypt_key128(unint64_t *a1, uint64_t a2)
{
  return sub_1000047A0(a1, a2, 4, 10);
}

uint64_t ccaes_arm_encrypt_key192(unint64_t *a1, uint64_t a2)
{
  return sub_1000047A0(a1, a2, 6, 12);
}

uint64_t ccaes_arm_encrypt_key256(unint64_t *a1, uint64_t a2)
{
  return sub_1000047A0(a1, a2, 8, 14);
}

__n128 sub_1000049C0(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000047A0(a1, a2, a3, a4);
  v4 = (__n128 *)(a2 + 16);
  uint64_t v5 = a4 - 1;
  do
  {
    --v5;
    _Q0 = *v4;
    __asm { AESIMC          V0.16B, V0.16B }
    *v4++ = result;
  }
  while (!(_NF ^ _VF | _ZF));
  return result;
}

double ccaes_arm_decrypt_key128(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000049C0(a1, a2, 4, 10).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key192(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000049C0(a1, a2, 6, 12).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key256(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000049C0(a1, a2, 8, 14).n128_u64[0];
  return result;
}

uint64_t ccaes_arm_encrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_encrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_encrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_encrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t ccaes_arm_decrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_decrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_decrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_decrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t *ccrng_prng(_DWORD *a1)
{
  BOOL v3 = timingsafe_enable_if_supported();
  pthread_once(&stru_100039AA0, (void (*)(void))sub_100004BA8);
  if (a1) {
    *a1 = 0;
  }
  cc_disable_dit_with_sb((unsigned int *)&v3);
  return &qword_100039BB0;
}

uint64_t sub_100004BA8()
{
  if (ccrng_process_init((uint64_t)&off_100039BC0, sub_100004C68, (uint64_t (**)(void, uint64_t, _OWORD *))&ccrng_getentropy))cc_abort(); {
  uint64_t result = pthread_atfork((void (*)(void))sub_100004CB4, (void (*)(void))sub_100004CE4, (void (*)(void))sub_100004D14);
  }
  if (result) {
    cc_abort();
  }
  qword_100039BB0 = (uint64_t)sub_100004D44;
  return result;
}

uint64_t *ccrng(_DWORD *a1)
{
  return &qword_100039BB0;
}

uint64_t sub_100004C68()
{
  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  if (clock_gettime(_CLOCK_MONOTONIC, &v1)) {
    cc_abort();
  }
  return v1.tv_nsec + 1000000000 * v1.tv_sec;
}

uint64_t sub_100004CB4()
{
  uint64_t result = ccrng_process_atfork_prepare((os_unfair_lock_s *)&off_100039BC0);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_100004CE4()
{
  uint64_t result = ccrng_process_atfork_parent((os_unfair_lock_s *)&off_100039BC0);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_100004D14()
{
  uint64_t result = ccrng_process_atfork_child((uint64_t)&off_100039BC0);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_100004D44()
{
  uint64_t result = off_100039BC0();
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_100004D78(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0) {
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  return 4294967289;
}

uint64_t ccec_mult_blinded_ws(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v10 = *a2;
  unint64_t v11 = ccn_bitlen_internal(*a2, a4);
  if (v11 > cczp_bitlen((uint64_t)a2)) {
    return 4294967289;
  }
  uint64_t v17 = 1;
  if (a6)
  {
    uint64_t result = (*a6)(a6, 8, &v17);
    if (result) {
      return result;
    }
    uint64_t v13 = v17 | 0x80000000;
  }
  else
  {
    uint64_t v13 = 2147483649;
  }
  uint64_t v17 = v13;
  uint64_t v14 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v10);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v10);
  ccn_mux_seed_mask(v17);
  uint64_t v17 = v17;
  uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
  if (!result)
  {
    uint64_t v16 = 0;
    ccn_divmod_ws(a1, v10, a4, v10, v15, 1, (char *)&v16, (uint64_t)&v17);
    cczp_bitlen((uint64_t)a2);
    uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
    if (!result)
    {
      uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
      if (!result)
      {
        ccec_full_add_ws(a1, (uint64_t)a2);
        uint64_t result = 0;
      }
    }
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t sub_100004F9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0) {
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  return 4294967289;
}

uint64_t ccecdh_compute_shared_secret_ws(uint64_t a1, unint64_t **a2, unint64_t **a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v11 = *a2;
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v12 = 3 * **a2;
  uint64_t v13 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v15 = *a4;
  *a4 = 0;
  unint64_t v16 = ccn_write_uint_size_internal(*v11, v11 + 3);
  if (v15 < v16
    || *a2 != *a3
    || (unint64_t v17 = v16,
        ccec_validate_point_and_projectify_ws(a1, (uint64_t *)v11, (uint64_t)v14, (uint64_t)(a3 + 2)))
    || ccec_validate_scalar(v11, (uint64_t)&a2[3 * **a2 + 2])
    || ccec_mult_blinded_ws(a1, v11, (uint64_t)v13, (uint64_t)&a2[3 * **a2 + 2], (uint64_t)v14, a6)
    || !ccec_is_point_projective_ws(a1, v11)
    || ccec_affinify_x_only_ws(a1, (uint64_t *)v11, (uint64_t)v13, (uint64_t)v13))
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  else
  {
    ccn_write_uint_padded_ct_internal(*v11, v13, v17, a5);
    uint64_t v18 = 0;
    *a4 = v17;
  }
  cc_clear(24 * *v11, v13);
  cc_clear(24 * *v11, v14);
  *(void *)(a1 + 16) = v21;
  return v18;
}

void *ccaes_cbc_encrypt_mode()
{
  return &ccaes_arm_cbc_encrypt_mode;
}

uint64_t ccec_generate_scalar_fips_retry_ws(uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *), void *a4)
{
  unint64_t v8 = a2 + 4;
  uint64_t v9 = (uint64_t)&a2[5 * *a2 + 4];
  uint64_t v10 = cczp_n(v9);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v13 = (void *)cczp_prime(v9);
  ccn_set(v10, v12, v13);
  *v12 &= ~1uLL;
  uint64_t v14 = 100;
  while (1)
  {
    uint64_t v15 = cczp_bitlen((uint64_t)&v8[5 * *a2]);
    uint64_t result = ccn_random_bits_fips(v15, a4, a3);
    if (result) {
      break;
    }
    if ((ccn_cmp_internal(v10, a4, v12) & 0x80000000) != 0)
    {
      ccn_add1_ws(a1, v10, a4, a4, 1);
      uint64_t result = 0;
      break;
    }
    if (!--v14)
    {
      uint64_t result = 4294967281;
      break;
    }
  }
  *(void *)(a1 + 16) = v11;
  return result;
}

uint64_t ccn_cond_swap(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v10 = *a4 ^ *a3;
    *a3 ^= result;
    uint64_t v11 = *a4 ^ result;
    *a4 = v11;
    uint64_t v12 = *a3 ^ v10 & 0x5555555555555555;
    uint64_t v13 = v11 ^ v10 & 0x5555555555555555;
    uint64_t v14 = v10 & i;
    *a3++ = v12 ^ v14 ^ result;
    *a4++ = v13 ^ v14 ^ result;
  }
  return result;
}

uint64_t *ccaes_ctr_crypt_mode()
{
  unint64_t v0 = ((*(void *)ccaes_ecb_encrypt_mode() + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
  timespec v1 = ccaes_ecb_encrypt_mode();
  qword_10003A500 = v0;
  unk_10003A508 = xmmword_100029ED0;
  qword_10003A518 = (uint64_t)ccmode_ctr_init;
  qword_10003A520 = (uint64_t)ccmode_ctr_setctr;
  qword_10003A528 = (uint64_t)ccaes_vng_ctr_crypt;
  unk_10003A530 = v1;
  return &qword_10003A500;
}

void *ccaes_ecb_encrypt_mode()
{
  return &ccaes_arm_ecb_encrypt_mode;
}

uint64_t ccrng_schedule_read(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return 3;
  }
  uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
  *(unsigned char *)(a1 + 8) = result == 3;
  return result;
}

uint64_t ccrng_schedule_notify_reseed(unsigned char *a1)
{
  a1[8] = 0;
  return (*(uint64_t (**)(unsigned char *))(*(void *)a1 + 8))(a1);
}

uint64_t ccrng_schedule_atomic_flag_init(uint64_t result)
{
  *(void *)uint64_t result = off_100034930;
  *(unsigned char *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 1;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_set(uint64_t result)
{
  *(_DWORD *)(result + 16) = 3;
  return result;
}

uint64_t ccrng_schedule_timer_init(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  *(void *)a1 = off_100034940;
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  uint64_t result = a2();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = off_100034950;
  *(unsigned char *)(result + 8) = 0;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t sub_1000054A8(uint64_t result)
{
  return result;
}

uint64_t sub_1000054BC(uint64_t a1)
{
  if ((unint64_t)((*(uint64_t (**)(void))(a1 + 16))() - *(void *)(a1 + 32)) < *(void *)(a1 + 24)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_1000054F8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 16))();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100005524(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v2 + 8))
  {
    unsigned int v3 = 3;
  }
  else
  {
    unsigned int v3 = (**(uint64_t (***)(void))v2)(*(void *)(a1 + 16));
    *(unsigned char *)(v2 + 8) = v3 == 3;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(unsigned char *)(v4 + 8))
  {
    LODWORD(result) = 3;
  }
  else
  {
    LODWORD(result) = (**(uint64_t (***)(uint64_t))v4)(v4);
    *(unsigned char *)(v4 + 8) = result == 3;
  }
  if (v3 <= result) {
    return result;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000055B8(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 16);
  v2[8] = 0;
  (*(void (**)(unsigned char *))(*(void *)v2 + 8))(v2);
  unsigned int v3 = *(unsigned char **)(a1 + 24);
  v3[8] = 0;
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)v3 + 8);

  return v4();
}

uint64_t ccn_n_asm(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *a2++;
      ++v3;
      if (v4) {
        uint64_t result = v3;
      }
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t ccaes_vng_ctr_crypt(void *a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a1[1];
  if (a2)
  {
    unint64_t v10 = a2;
    uint64_t v11 = *a1;
    unint64_t v12 = (unint64_t)(*(void *)(*a1 + 8) + 7) >> 3;
    uint64_t v13 = a1 + 2;
    uint64_t v14 = (int8x16_t *)&a1[2 * v12 + 2];
    uint64_t v15 = (int8x16_t *)&a1[v12 + 2];
    unint64_t v16 = &a1[v12];
    while (1)
    {
      if (v7 == 16)
      {
        if (v10 >= 0x10)
        {
          aes_ctr_crypt(a3, a4, v10 & 0xFFFFFFFFFFFFFFF0, v15, v14, a6);
          a4 = (int8x16_t *)((char *)a4 + (v10 & 0xFFFFFFFFFFFFFFF0));
          a3 = (int8x16_t *)((char *)a3 + (v10 & 0xFFFFFFFFFFFFFFF0));
          v10 &= 0xFu;
        }
        (*(void (**)(int8x16_t *, uint64_t, int8x16_t *, void *))(v11 + 24))(v14, 1, v15, a1 + 2);
        uint64_t v17 = 31;
        do
        {
          if ((unint64_t)(v17 - 15) < 9) {
            break;
          }
          __int16 v18 = (*((unsigned char *)v16 + v17--))++ + 1;
        }
        while ((v18 & 0x100) != 0);
        uint64_t v7 = 0;
        uint64_t v19 = 0;
        if (!v10) {
          break;
        }
      }
      uint64_t v20 = 0;
      do
      {
        uint64_t v21 = v20 + 1;
        a4->i8[v20] = *((unsigned char *)v13 + v7 + v20) ^ a3->i8[v20];
        BOOL v22 = (unint64_t)(v20 + 1 + v7) > 0xF || v10 - 1 == v20;
        ++v20;
      }
      while (!v22);
      v7 += v21;
      a3 = (int8x16_t *)((char *)a3 + v21);
      a4 = (int8x16_t *)((char *)a4 + v21);
      v10 -= v21;
      if (!v10) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    uint64_t v19 = v7;
  }
  a1[1] = v19;
  return 0;
}

void *cczp_to_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);

  return ccn_set(v6, a3, a4);
}

uint64_t cczp_to_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 56))();
}

void cc_try_abort()
{
}

uint64_t cc_try_abort_if (uint64_t result)
{
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t sizeof_struct_ccec_full_ctx()
{
  return 16;
}

unint64_t cczp_negate(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = cczp_n(a1);
  BOOL v7 = ccn_n(v6, a3) != 0;
  unint64_t v8 = (uint64_t *)cczp_prime(a1);

  return ccn_cond_rsub(v6, v7, a2, a3, v8);
}

unint64_t cczp_cond_negate(uint64_t a1, unsigned __int8 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8 = cczp_n(a1);
  uint64_t v9 = (ccn_n(v8, a4) != 0) & a2;
  unint64_t v10 = (uint64_t *)cczp_prime(a1);

  return ccn_cond_rsub(v8, v9, a3, a4, v10);
}

void *cczp_from_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);

  return ccn_set(v6, a3, a4);
}

uint64_t cczp_from_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 64))();
}

unint64_t ccn_mul1_asm(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0;
  if (a1)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4) >> 64;
    *a2++ = v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned long long v8 = v6 * (unsigned __int128)a4 + __PAIR128__(v7 * a4, v4);
    unint64_t v4 = (__CFADD__(__CFADD__(v6 * a4, v4), (v6 * (unsigned __int128)a4) >> 64) | __CFADD__(v7 * a4, *((void *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v8;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    BOOL v9 = a1 < 4;
    a1 -= 4;
    if (v9) {
      break;
    }
    unint64_t v11 = *a3;
    unint64_t v12 = a3[1];
    unint64_t v10 = a3 + 2;
    unint64_t v14 = *v10;
    unint64_t v15 = v10[1];
    a3 = v10 + 2;
    uint64_t v16 = (v12 * (unsigned __int128)a4) >> 64;
    BOOL v17 = __CFADD__(__CFADD__(v11 * a4, v4), (v11 * (unsigned __int128)a4) >> 64);
    unsigned long long v13 = v11 * (unsigned __int128)a4 + __PAIR128__(v12 * a4, v4);
    *(_OWORD *)a2 = v13;
    __int16 v18 = a2 + 2;
    uint64_t v19 = (v14 * (unsigned __int128)a4) >> 64;
    uint64_t v20 = v16 + (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4;
    uint64_t v22 = __CFADD__(v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1)), v14 * a4) | __CFADD__(v16, (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4);
    BOOL v17 = __CFADD__(v22, v19);
    uint64_t v21 = v22 + v19;
    unint64_t v4 = (v17 | __CFADD__(v15 * a4, v21)) + ((v15 * (unsigned __int128)a4) >> 64);
    *__int16 v18 = v20;
    v18[1] = v15 * a4 + v21;
    a2 = v18 + 2;
  }
  return v4;
}

uint64_t ccdigest_internal(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  size_t v8 = (*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19) & 0xFFFFFFFFFFFFFFF8;
  BOOL v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
  ccdigest_init_internal(a1, v9);
  ccdigest_update_internal((unint64_t *)a1, v9, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v9, a4);
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12, v9);
}

uint64_t ccdigest(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  BOOL v9 = timingsafe_enable_if_supported();
  ccdigest_internal(a1, a2, a3, a4);
  return cc_disable_dit_with_sb((unsigned int *)&v9);
}

uint64_t ccdigest_final_64be(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = (uint64_t)a2 + v7 + 8;
  if (v6 <= *(unsigned int *)(v8 + v6)) {
    *(_DWORD *)(v8 + v6) = 0;
  }
  size_t v9 = (v7 + v6 + 19) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v10, v9);
  memcpy(v10, a2, v7 + v6 + 12);
  uint64_t v11 = (char *)v10 + v7;
  uint64_t v12 = (uint64_t)v10 + v7 + 8;
  unsigned long long v13 = (char *)(v12 + v6);
  uint64_t v14 = *(unsigned int *)(v12 + v6);
  *v10 += (8 * v14);
  *(_DWORD *)(v12 + v6) = v14 + 1;
  *(unsigned char *)(v12 + v14) = 0x80;
  unint64_t v15 = *(unsigned int *)(v12 + v6);
  if (v15 < 0x39)
  {
    if (v15 == 56) {
      goto LABEL_9;
    }
  }
  else
  {
    if (v15 <= 0x3F)
    {
      do
      {
        *(_DWORD *)unsigned long long v13 = v15 + 1;
        *(unsigned char *)(v12 + v15) = 0;
        unint64_t v15 = *(unsigned int *)v13;
      }
      while (v15 < 0x40);
    }
    (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1);
    unint64_t v15 = 0;
    uint64_t v11 = (char *)v10 + *(void *)(a1 + 8);
    uint64_t v12 = (uint64_t)(v11 + 8);
    unsigned long long v13 = &v11[*(void *)(a1 + 16) + 8];
    *(_DWORD *)unsigned long long v13 = 0;
  }
  do
  {
    *(_DWORD *)unsigned long long v13 = v15 + 1;
    *(unsigned char *)(v12 + v15) = 0;
    unint64_t v15 = *(unsigned int *)v13;
  }
  while (v15 < 0x38);
LABEL_9:
  *((void *)v11 + 8) = bswap64(*v10);
  (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1);
  if (*(void *)a1 >= 4uLL)
  {
    unsigned int v16 = 0;
    unint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      *(_DWORD *)(a3 + v16) = bswap32(*((_DWORD *)v10 + v17 + 2));
      unint64_t v17 = v18++;
      v16 += 4;
    }
    while (v17 < *(void *)a1 >> 2);
  }
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12, v10);
}

void *ccdigest_init_internal(uint64_t a1, void *a2)
{
  uint64_t result = memcpy(a2 + 1, *(const void **)(a1 + 40), *(void *)(a1 + 8));
  *a2 = 0;
  *(_DWORD *)((char *)a2 + *(void *)(a1 + 8) + *(void *)(a1 + 16) + 8) = 0;
  return result;
}

unint64_t *ccdigest_update_internal(unint64_t *result, void *a2, size_t a3, char *__src)
{
  size_t v5 = a3;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (uint64_t)a2 + result[1] + 8;
  if (v8 <= *(unsigned int *)(v9 + v8)) {
    *(_DWORD *)(v9 + v8) = 0;
  }
  if (a3)
  {
    unint64_t v10 = a2 + 1;
    do
    {
      size_t v11 = v7[2];
      uint64_t v12 = (char *)v10 + v7[1];
      uint64_t v13 = *(unsigned int *)&v12[v11];
      if (v5 > v11 && v13 == 0)
      {
        if (v11 == 128)
        {
          size_t v22 = v5 >> 7;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFF80;
        }
        else if (v11 == 64)
        {
          size_t v22 = v5 >> 6;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFFC0;
        }
        else
        {
          size_t v22 = v5 / v11;
          size_t v16 = v5 / v11 * v11;
        }
        uint64_t result = (unint64_t *)((uint64_t (*)(void *, size_t, char *))v7[6])(a2 + 1, v22, __src);
        *a2 += 8 * v16;
      }
      else
      {
        size_t v15 = v11 - v13;
        if (v15 >= v5) {
          size_t v16 = v5;
        }
        else {
          size_t v16 = v15;
        }
        uint64_t result = (unint64_t *)memcpy(&v12[v13], __src, v16);
        unint64_t v17 = v7[2];
        unsigned int v18 = (char *)v10 + v7[1];
        uint64_t v19 = (*(_DWORD *)&v18[v17] + v16);
        *(_DWORD *)&v18[v17] = v19;
        if (v17 == v19)
        {
          uint64_t result = (unint64_t *)((uint64_t (*)(void *, uint64_t))v7[6])(a2 + 1, 1);
          unint64_t v20 = v7[2];
          uint64_t v21 = (char *)v10 + v7[1];
          *a2 += (8 * *(_DWORD *)&v21[v20]);
          *(_DWORD *)&v21[v20] = 0;
        }
      }
      __src += v16;
      v5 -= v16;
    }
    while (v5);
  }
  return result;
}

void *ccdrbg_factory_nistctr(void *result, uint64_t a2)
{
  *uint64_t result = 88;
  result[1] = sub_100005F10;
  result[3] = sub_100006110;
  result[2] = sub_100006358;
  result[4] = sub_1000064A4;
  result[5] = a2;
  result[6] = sub_1000064E4;
  return result;
}

uint64_t sub_100005F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(uint64_t **)(a1 + 40);
  cc_clear(0x58uLL, (void *)a2);
  uint64_t v18 = *v12;
  rsize_t v19 = v12[1];
  *(void *)(a2 + 56) = *v12;
  *(void *)(a2 + 64) = v19;
  *(_DWORD *)(a2 + 72) = *((_DWORD *)v12 + 4);
  uint64_t v20 = v12[3];
  *(void *)(a2 + 80) = v20;
  if (v19 >= 0x21 || *(void *)(v18 + 16) != 16) {
    cc_try_abort();
  }
  if (!v20)
  {
    if (v19 + 16 >= a7 && v19 + 16 == a3)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long __s = 0u;
      __memcpy_chk();
      for (; a7; --a7)
        *((unsigned char *)&v26 + a7 + 7) ^= *(unsigned char *)(a8 - 1 + a7);
      goto LABEL_8;
    }
    uint64_t v21 = 4294967233;
LABEL_16:
    cc_clear(0x20uLL, (void *)a2);
    cc_clear(0x10uLL, (void *)(a2 + 32));
    uint64_t v23 = -1;
    goto LABEL_9;
  }
  uint64_t v21 = 4294967233;
  if ((unint64_t)(a3 - 65537) < 0xFFFFFFFFFFFF000FLL || a7 > 0x10000) {
    goto LABEL_16;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long __s = 0u;
  HIBYTE(v26) = HIBYTE(a8);
  uint64_t v22 = sub_100006508(a2, &__s, 3u, v13, v14, v15, v16, v17, a3);
  if (v22)
  {
    uint64_t v21 = v22;
    goto LABEL_16;
  }
  rsize_t v19 = *(void *)(a2 + 64);
LABEL_8:
  cc_clear(v19, (void *)a2);
  cc_clear(0x10uLL, (void *)(a2 + 32));
  sub_1000065CC(a2, (uint64_t)&__s);
  uint64_t v21 = 0;
  uint64_t v23 = 1;
LABEL_9:
  *(void *)(a2 + 48) = v23;
  cc_clear(0x30uLL, &__s);
  return v21;
}

uint64_t sub_100006110(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  memset(__s, 0, sizeof(__s));
  v23[0] = 0;
  v23[1] = 0;
  size_t v8 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)v22 - v8;
  bzero((char *)v22 - v8, v8);
  if (a2 > 0x10000) {
    goto LABEL_22;
  }
  if (*(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL)
  {
    uint64_t v16 = 4294967234;
    goto LABEL_21;
  }
  if (!a4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 80))
  {
    if (a4 <= 0x10000)
    {
      uint64_t v15 = sub_100006508(a1, __s, 1u, v10, v11, v12, v13, v14, a4);
      if (v15)
      {
        uint64_t v16 = v15;
        goto LABEL_21;
      }
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v16 = 4294967233;
    goto LABEL_21;
  }
  if (*(void *)(a1 + 64) + 16 < a4) {
    goto LABEL_22;
  }
  cc_clear(0x30uLL, __s);
  __memcpy_chk();
LABEL_11:
  sub_1000065CC(a1, (uint64_t)__s);
LABEL_12:
  v22[1] = v22;
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  for (uint64_t i = -(int)a2 & 0xFLL; a2; a2 -= v18)
  {
    if (a2 >= 0x80) {
      uint64_t v18 = 128;
    }
    else {
      uint64_t v18 = a2;
    }
    ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v9, v18, (uint64_t)&unk_100029EE0, a3);
    a3 += v18;
  }
  ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v9, i, (uint64_t)&unk_100029EE0, (uint64_t)v23);
  cc_clear(i, v23);
  if (a4) {
    rsize_t v19 = __s;
  }
  else {
    rsize_t v19 = &unk_100029EE0;
  }
  sub_100006694(a1, (uint64_t)v9, (uint64_t)v19);
  rsize_t v20 = ccctr_context_size(*(void *)(a1 + 56));
  cc_clear(v20, v9);
  uint64_t v16 = 0;
  ++*(void *)(a1 + 48);
LABEL_21:
  cc_clear(0x30uLL, __s);
  return v16;
}

uint64_t sub_100006358(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a4;
  memset(__s, 0, sizeof(__s));
  if (!a1[10])
  {
    unint64_t v14 = a1[8] + 16;
    if (v14 < a4 || v14 != a2) {
      return 4294967233;
    }
    __memcpy_chk();
    for (; v9; --v9)
      *((unsigned char *)&v16 + v9 + 7) ^= *(unsigned char *)(a5 - 1 + v9);
    goto LABEL_6;
  }
  uint64_t v11 = 4294967233;
  if (a2 <= 0x10000 && a4 <= 0x10000 && *(void *)(a1[7] + 16) <= a2)
  {
    HIBYTE(v16) = HIBYTE(a5);
    uint64_t v12 = sub_100006508((uint64_t)a1, __s, 2u, a4, a5, a6, a7, a8, a2);
    if (v12)
    {
      uint64_t v11 = v12;
      goto LABEL_7;
    }
LABEL_6:
    sub_1000065CC((uint64_t)a1, (uint64_t)__s);
    uint64_t v11 = 0;
    a1[6] = 1;
LABEL_7:
    cc_clear(a1[8] + 16, __s);
  }
  return v11;
}

uint64_t sub_1000064A4(char *__s)
{
  cc_clear(0x20uLL, __s);
  uint64_t result = cc_clear(0x10uLL, __s + 32);
  *((void *)__s + 6) = -1;
  return result;
}

BOOL sub_1000064E4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL;
}

uint64_t sub_100006508(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  uint64_t v15 = &a9;
  if (a3)
  {
    uint64_t v10 = a3;
    uint64_t v11 = (uint64_t *)v16 + 1;
    uint64_t v12 = a3;
    do
    {
      uint64_t v13 = v15;
      *uint64_t v11 = *v15;
      v15 += 2;
      *(v11 - 1) = v13[1];
      v11 += 2;
      --v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return ccdrbg_df_derive_keys(*(uint64_t (***)(void))(a1 + 80), v10, (uint64_t)v16, *(void *)(a1 + 64) + 16, a2);
}

uint64_t sub_1000065CC(uint64_t a1, uint64_t a2)
{
  size_t v4 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  size_t v5 = (char *)&v8 - v4;
  bzero((char *)&v8 - v4, v4);
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  sub_100006694(a1, (uint64_t)v5, a2);
  rsize_t v6 = ccctr_context_size(*(void *)(a1 + 56));
  return cc_clear(v6, v5);
}

uint64_t sub_100006694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ccctr_update_internal(*(void *)(a1 + 56), a2, *(void *)(a1 + 64), a3, a1);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = a3 + *(void *)(a1 + 64);

  return ccctr_update_internal(v6, a2, 16, v7, a1 + 32);
}

uint64_t ccec_affinify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4)) {
    return 4294967289;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccec_affinify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 80))();
}

uint64_t ccec_affinify_x_only_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4)) {
    return 4294967289;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  cczp_sqr_ws(a1, (uint64_t)a2);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccn_sqr_ws(uint64_t a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * a2);
  uint64_t result = ccn_mul1(a2 - 1, v9 + 8, a4 + 1, *a4);
  *(void *)(v9 + 8 * a2) = result;
  long long v11 = *a4;
  *a3 = *a4 * *a4;
  unint64_t v12 = *(void *)(v9 + 8);
  if (__CFADD__((unsigned __int128)(v11 * v11) >> 64, 2 * v12)) {
    uint64_t v13 = (v12 >> 63) + 1;
  }
  else {
    uint64_t v13 = v12 >> 63;
  }
  a3[1] = (__PAIR128__(2, v11) * v11) >> 64;
  unint64_t v14 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v9 + 8 * a2 + 8;
    uint64_t v17 = (unint64_t *)(v9 + 24);
    uint64_t v18 = a3 + 3;
    do
    {
      uint64_t result = ccn_addmul1(v14, v17, &a4[v15 + 2], a4[v15 + 1]);
      *(void *)(v16 + v15 * 8) = result;
      unint64_t v19 = a4[v15 + 1];
      uint64_t v20 = (v19 * (unsigned __int128)v19) >> 64;
      unint64_t v21 = v19 * v19;
      BOOL v22 = __CFADD__(v21, v13);
      unint64_t v23 = v21 + v13;
      if (v22) {
        ++v20;
      }
      unint64_t v24 = *(v17 - 1);
      *(v18 - 1) = v23 + 2 * v24;
      unint64_t v25 = *v17;
      v17 += 2;
      uint64_t v26 = v25 >> 63;
      BOOL v22 = __CFADD__(v20, 2 * v25);
      uint64_t v27 = v20 + 2 * v25;
      if (v22) {
        uint64_t v28 = v26 + 1;
      }
      else {
        uint64_t v28 = v26;
      }
      BOOL v22 = __CFADD__(__CFADD__(v23, 2 * v24), v27) | __CFADD__(v24 >> 63, __CFADD__(v23, 2 * v24) + v27);
      unint64_t v29 = (v24 >> 63) + __CFADD__(v23, 2 * v24) + v27;
      if (v22) {
        uint64_t v13 = v28 + 1;
      }
      else {
        uint64_t v13 = v28;
      }
      *uint64_t v18 = v29;
      v18 += 2;
      ++v15;
      --v14;
    }
    while (v14 != -1);
  }
  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccn_p256_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

uint64_t ccec_double_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_export_pub(uint64_t *a1, char *a2)
{
  unint64_t v3 = (unint64_t *)(a1 + 2);
  uint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  return ccec_export_affine_point_public_value(v4, 1, v3, &v6, a2);
}

uint64_t ccec_add_normalized_ws(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  if (a6) {
    cczp_add_ws(a1, (uint64_t)a2);
  }
  else {
    cczp_sub_ws(a1, (uint64_t)a2);
  }
  if (ccn_n(v9, v10) || ccn_n(v9, v11))
  {
    if (ccn_n(v9, v10) || !ccn_n(v9, v11))
    {
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t result = cczp_div2_ws(a1, (uint64_t)a2, (int8x16_t *)&a3[v9], &a3[v9]);
    }
    else
    {
      ccn_seti(v9, a3, 1);
      cczp_to_ws(a1, (uint64_t)a2);
      ccn_set(v9, &a3[v9], a3);
      uint64_t result = cc_clear(8 * v9, &a3[2 * v9]);
    }
  }
  else
  {
    uint64_t result = ccec_double_ws(a1, a2);
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_full_add_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    ccn_set(v11, &a3[8 * *a2], &a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }
  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 0);
  }
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_add_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = cczp_n((uint64_t)a2);
  uint64_t v16 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  sub_100007888(a1, (uint64_t)a2);
  sub_100007888(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  uint64_t v7 = cczp_n((uint64_t)a2);
  uint64_t v8 = *a2;
  uint64_t v9 = &a3[*a2];
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  ccn_set(v7, v10, v9);
  cczp_from_ws(a1, (uint64_t)a2);
  BOOL v12 = ccn_n(v7, v11) == 1 && *v11 == 1;
  uint64_t v13 = &a3[2 * v8];
  if (ccn_n(v7, a3)) {
    BOOL v12 = 0;
  }
  char v14 = v12 & (ccn_n(v7, v13) == 0);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  ccn_mux(v7, v14, a3, (uint64_t *)v10, a3);
  uint64_t result = ccn_mux(v7, v14, v9, (uint64_t *)v10, v9);
  *(void *)(a1 + 16) = v16;
  return result;
}

uint64_t sub_100007888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = cczp_n(a2);
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  uint64_t result = cczp_mul_ws(a1, a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_full_add_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 88))();
}

int8x16_t *aes_ctr_crypt(int8x16_t *a1, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6)
{
  int v6 = a5[15].i32[0];
  BOOL v8 = __OFSUB__(a3, 128);
  BOOL v7 = a3 - 128 < 0;
  uint64_t v9 = a3 - 128;
  if (v7 != v8) {
    return sub_100007E4C(a1, a2, v9, a4, a5, a6, v6);
  }
  else {
    return (int8x16_t *)sub_100007A00(a1, a2, v9, (uint64_t)a4, a5, a6, v6);
  }
}

uint64_t sub_100007A00(_OWORD *a1, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6, int a7)
{
  do
  {
    int64x2_t v8 = vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, v8))));
    _Q20 = *a5;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[1];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[2];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[3];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[4];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[5];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[6];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[7];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[8];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[9];
    int8x16_t v167 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[10];
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[11];
      int8x16_t v167 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[12];
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[13];
        int8x16_t v167 = a5[14];
      }
    }
    int8x16_t v235 = *(int8x16_t *)a1;
    int8x16_t v236 = *((int8x16_t *)a1 + 1);
    int8x16_t v237 = *((int8x16_t *)a1 + 2);
    int8x16_t v238 = *((int8x16_t *)a1 + 3);
    v234 = a1 + 4;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESE            V23.16B, V20.16B
      AESE            V24.16B, V20.16B
      AESE            V25.16B, V20.16B
    }
    int8x16_t v243 = veorq_s8(v235, veorq_s8(_Q22, v167));
    int8x16_t v244 = veorq_s8(v236, veorq_s8(_Q23, v167));
    int8x16_t v245 = veorq_s8(v237, veorq_s8(_Q24, v167));
    int8x16_t v246 = veorq_s8(v238, veorq_s8(_Q25, v167));
    int8x16_t v247 = *(int8x16_t *)v234;
    int8x16_t v248 = *((int8x16_t *)v234 + 1);
    int8x16_t v249 = *((int8x16_t *)v234 + 2);
    int8x16_t v250 = *((int8x16_t *)v234 + 3);
    a1 = v234 + 4;
    __asm
    {
      AESE            V26.16B, V20.16B
      AESE            V27.16B, V20.16B
      AESE            V28.16B, V20.16B
      AESE            V29.16B, V20.16B
    }
    *a2 = v243;
    a2[1] = v244;
    a2[2] = v245;
    a2[3] = v246;
    v255 = a2 + 4;
    int8x16_t *v255 = veorq_s8(v247, veorq_s8(_Q26, v167));
    v255[1] = veorq_s8(v248, veorq_s8(_Q27, v167));
    v255[2] = veorq_s8(v249, veorq_s8(_Q28, v167));
    v255[3] = veorq_s8(v250, veorq_s8(_Q29, v167));
    a2 = v255 + 4;
    _VF = __OFSUB__(a3, 128);
    _NF = a3 - 128 < 0;
    a3 -= 128;
  }
  while (_NF == _VF);
  return sub_100007E4C();
}

int8x16_t *sub_100007E4C(int8x16_t *result, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6, int a7)
{
  BOOL v10 = a3 < -112;
  for (uint64_t i = a3 + 112; !v10; i -= 16)
  {
    _Q4 = *a5;
    _Q5 = a5[1];
    _Q6 = a5[2];
    int64x2_t v9 = vaddq_s64(v7, v9);
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[3];
    _Q5 = a5[4];
    _Q6 = a5[5];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[6];
    _Q5 = a5[7];
    _Q6 = a5[8];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q20 = a5[9];
    _Q21 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V7.16B, V20.16B
        AESMC           V7.16B, V7.16B
        AESE            V7.16B, V21.16B
        AESMC           V7.16B, V7.16B
      }
      _Q20 = a5[11];
      _Q21 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V7.16B, V20.16B
          AESMC           V7.16B, V7.16B
          AESE            V7.16B, V21.16B
          AESMC           V7.16B, V7.16B
        }
        _Q20 = a5[13];
        _Q21 = a5[14];
      }
    }
    __asm { AESE            V7.16B, V20.16B }
    int8x16_t v54 = *result++;
    *a2++ = veorq_s8(v54, veorq_s8(_Q7, _Q21));
    BOOL v10 = i < 16;
  }
  *a4 = vqtbl1q_s8((int8x16_t)v9, v8);
  return result;
}

uint64_t ccec_affine_point_from_x_ws(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  if ((ccn_cmp_internal(*a2, a4, a2 + 3) & 0x80000000) != 0)
  {
    cczp_to_ws(a1, (uint64_t)a2);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_sub_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    uint64_t result = cczp_sqrt_ws(a1, (uint64_t)a2);
    if (!result)
    {
      cczp_from_ws(a1, (uint64_t)a2);
      cczp_from_ws(a1, (uint64_t)a2);
      uint64_t result = 0;
    }
  }
  else
  {
    uint64_t result = 4294967289;
  }
  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccec_mult_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned char *a4, unint64_t a5, uint64_t *a6)
{
  BOOL v12 = a2 + 4;
  if (cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) < a5) {
    return 4294967289;
  }
  v51 = a3;
  __src = a4;
  int8x16_t v54 = v12;
  uint64_t v14 = *a2;
  unint64_t v15 = (a5 + 63) >> 6;
  uint64_t v53 = *(void *)(a1 + 16);
  uint64_t v16 = 3 * *a2;
  uint64_t v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v16);
  uint64_t v18 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  BOOL v55 = ccn_n(v14, a6) == 0;
  if (a5 + 63 >= 0x40) {
    ccn_set((a5 + 63) >> 6, v18, a4);
  }
  ccn_zero(v14 - v15, (char *)v18 + 8 * v15);
  v18->i64[v15 - 1] &= 0xFFFFFFFFFFFFFFFFLL >> -(char)a5;
  unint64_t v50 = (a5 + 63) >> 6;
  v57 = v18;
  ccn_shift_right(v50, v18, v18, v55);
  ccec_double_ws(a1, a2);
  ccn_mux(3 * v14, !v55, v17, a6, v17);
  if (!ccn_n(v14, v17))
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  if (cczp_bitlen((uint64_t)&v54[5 * *a2]) >= a5)
  {
    uint64_t v19 = *a2;
    if (ccn_n(*a2, v17))
    {
      uint64_t v47 = v16;
      uint64_t v45 = *(void *)(a1 + 16);
      uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v49 = v19;
      unint64_t v21 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v56 = 2 * v19;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v23 = *a2;
      uint64_t v42 = *(void *)(a1 + 16);
      __dst = (void *)v22;
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      v46 = v17;
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t v24 = a1;
      uint64_t v25 = a1;
      uint64_t v26 = (uint64_t *)v20;
      cczp_sub_ws(v24, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_add_ws(v25, (uint64_t)a2);
      cczp_sub_ws(v25, (uint64_t)a2);
      uint64_t v48 = v25;
      *(void *)(v25 + 16) = v42;
      uint64_t v27 = v18;
      unint64_t v28 = *(unint64_t *)((char *)v18->i64 + (((a5 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (a5
                                                                                                 - 1);
      char v29 = v28 & 1;
      unsigned __int8 v30 = !(v28 & 1);
      unint64_t v31 = a5 - 2;
      if (a5 == 2)
      {
        char v43 = !(v28 & 1);
        LOBYTE(v32) = v28 & 1;
      }
      else
      {
        LOBYTE(v32) = v28 & 1;
        do
        {
          char v33 = v32;
          uint64_t v32 = (*(unint64_t *)((char *)v27->i64 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v31) & 1;
          cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
          ccn_cond_swap(v56, v32 ^ v33 | v29 ^ 1, v26, v21);
          sub_1000088DC(v25, a2);
          sub_100008B2C(v25, a2);
          unsigned __int8 v30 = v32 & (v29 ^ 1);
          uint64_t v27 = v18;
          v29 |= v32;
          --v31;
        }
        while (v31);
        char v43 = v29 ^ 1;
      }
      cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
      ccn_cond_swap(v56, v27->i8[0] & 1 ^ v32, v26, v21);
      sub_1000088DC(v25, a2);
      ccn_set(v56, __dst, v21);
      uint64_t v41 = v27->i64[0] & 1;
      ccn_cond_swap(v56, v27->i8[0] & 1, v26, v21);
      unsigned int v34 = v26;
      a1 = v25;
      uint64_t v35 = v51;
      uint64_t v40 = *(void *)(v25 + 16);
      cczp_sub_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      *(void *)(v25 + 16) = v40;
      ccn_cond_swap(v56, v41, v34, v21);
      sub_100008B2C(v25, a2);
      ccn_mux(v56, v41, v34, v21, v34);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      v36 = (unint64_t *)cczp_prime((uint64_t)&v54[5 * *a2]);
      ccn_sub1(v49, __dst, v36, 1uLL);
      unsigned __int8 v37 = (ccn_cmpn_internal(v50, v57, v49, __dst) & 1) == 0;
      BOOL is_point_at_infinity = ccec_is_point_at_infinity(a2, (uint64_t)v46);
      ccn_mux(3 * v49, v43 | is_point_at_infinity | v37, v35, v46, v35);
      cczp_cond_negate((uint64_t)a2, v37, &v35[*a2], (unint64_t *)&v35[*a2]);
      char v39 = v43 & ~v57->i32[0] & 1;
      ccn_cond_clear(v49, v39, &v51[2 * *a2]);
      ccn_seti(v49, v34, 1);
      cczp_to_ws(v48, (uint64_t)a2);
      ccn_mux(v49, v39, v35, v34, v35);
      ccn_mux(v49, v39, &v35[*a2], v34, &v35[*a2]);
      *(void *)(v48 + 16) = v45;
      ccec_full_add_ws(v48, (uint64_t)a2);
      ccn_mux(v47, *__src & v55, v35, v46, v35);
      uint64_t result = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t result = 4294967289;
LABEL_16:
  *(void *)(a1 + 16) = v53;
  return result;
}

uint64_t ccec_mult_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 96))();
}

uint64_t sub_1000088DC(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_100008B2C(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t ccn_addmul1_asm(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0;
  if (a1)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4 + *a2) >> 64;
    *a2++ += v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned long long v8 = *(_OWORD *)a2 + __PAIR128__(v7 * a4, v4);
    unsigned long long v9 = v8 + v6 * (unsigned __int128)a4;
    unint64_t v4 = (__CFADD__(__CFADD__((void)v8, v6 * a4), *((void *)&v8 + 1)) | __CFADD__((v6* (unsigned __int128)a4) >> 64, *((void *)&v9 + 1)))+ (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v7 * a4, *((void *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v9;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    BOOL v10 = a1 < 4;
    a1 -= 4;
    if (v10) {
      break;
    }
    unint64_t v11 = a2[2];
    unint64_t v12 = a2[3];
    unint64_t v14 = *a3;
    unint64_t v15 = a3[1];
    uint64_t v13 = a3 + 2;
    unint64_t v16 = *v13;
    unint64_t v17 = v13[1];
    a3 = v13 + 2;
    uint64_t v18 = (v15 * (unsigned __int128)a4) >> 64;
    unsigned long long v19 = *(_OWORD *)a2 + __PAIR128__(v15 * a4, v4);
    BOOL v20 = __CFADD__(__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1)), v11);
    unint64_t v21 = (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1))) + v11;
    v20 |= __CFADD__(v18, v21);
    v21 += v18;
    BOOL v23 = v20;
    BOOL v20 = __CFADD__(v20, v12);
    unint64_t v22 = v23 + v12;
    v20 |= __CFADD__(v17 * a4, v22);
    v22 += v17 * a4;
    uint64_t v24 = v20 + ((v17 * (unsigned __int128)a4) >> 64);
    unsigned long long v25 = v19 + v14 * (unsigned __int128)a4;
    *(_OWORD *)a2 = v25;
    uint64_t v26 = a2 + 2;
    uint64_t v27 = (v16 * (unsigned __int128)a4) >> 64;
    uint64_t v29 = __CFADD__(__CFADD__((void)v19, v14 * a4), *((void *)&v19 + 1)) | __CFADD__((v14* (unsigned __int128)a4) >> 64, *((void *)&v25 + 1));
    BOOL v20 = __CFADD__(v29, v21);
    uint64_t v28 = v29 + v21;
    uint64_t v31 = v20 | __CFADD__(v16 * a4, v28);
    BOOL v20 = __CFADD__(v31, v22);
    uint64_t v30 = v31 + v22;
    unint64_t v4 = (v20 | __CFADD__(v27, v30)) + v24;
    *uint64_t v26 = v16 * a4 + v28;
    v26[1] = v27 + v30;
    a2 = v26 + 2;
  }
  return v4;
}

uint64_t (**ccec_projectify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(void, unint64_t, uint64_t)))(void, unint64_t, uint64_t)
{
  unint64_t v5 = a5;
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5)
  {
    uint64_t v10 = cczp_bitlen((uint64_t)a2);
    unint64_t v5 = (uint64_t (**)(void, unint64_t, uint64_t))ccn_random_bits(v10 - 1, a3 + 16 * *a2, v5);
    ccn_set_bit(a3 + 16 * *a2, v10 - 2, 1);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
  }
  else
  {
    ccn_seti(*a2, (void *)(a3 + 16 * *a2), 1);
    cczp_to_ws(a1, (uint64_t)a2);
  }
  cczp_to_ws(a1, (uint64_t)a2);
  cczp_to_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return v5;
}

uint64_t ccec_projectify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 72))();
}

unint64_t cc_cmp_safe_internal(uint64_t a1, char *a2, char *a3)
{
  if (!a1) {
    return 1;
  }
  unsigned __int8 v3 = 0;
  do
  {
    char v5 = *a2++;
    char v4 = v5;
    char v6 = *a3++;
    v3 |= v6 ^ v4;
    --a1;
  }
  while (a1);
  return ((unint64_t)v3 + 0xFFFFFFFF) >> 32;
}

uint64_t ccec_x963_export(int a1, char *a2, uint64_t *a3)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v6 = ccec_export_pub(a3, a2);
  uint64_t v7 = v6;
  if (a1 && !v6)
  {
    uint64_t v8 = *a3;
    unint64_t v9 = *(void *)*a3;
    unint64_t v10 = (unint64_t)(cczp_bitlen(*a3 + 40 * v9 + 32) + 7) >> 3;
    uint64_t v11 = cczp_bitlen(v8);
    int v12 = ccn_write_uint_padded_ct_internal(v9, (unint64_t *)&a3[3 * v9 + 2], v10, &a2[((unint64_t)(v11 + 7) >> 2) | 1]);
    uint64_t v7 = v12 & (v12 >> 31);
  }
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v7;
}

uint64_t ccec_x963_import_priv_ws(uint64_t a1, unint64_t *a2, unint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  unsigned int v5 = *a4;
  BOOL v6 = v5 > 7;
  int v7 = (1 << v5) & 0xD0;
  if (v6 || v7 == 0) {
    return 4294967289;
  }
  BOOL v14 = a2 + 4;
  if (a3 < (unint64_t)(cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) + 7) >> 3) {
    return 4294967289;
  }
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = cczp_bitlen((uint64_t)&v14[5 * *a2]);
  uint64_t result = ccec_x963_import_pub_ws(a1, a2, a3 - ((unint64_t)(v16 + 7) >> 3), a4, a5);
  if (!result)
  {
    unint64_t v18 = *a2;
    uint64_t v19 = (uint64_t)&a5[3 * **a5 + 2];
    unint64_t v20 = (unint64_t)(cczp_bitlen((uint64_t)&v14[5 * *a2]) + 7) >> 3;
    uint64_t v21 = cczp_bitlen((uint64_t)a2);
    uint64_t result = ccn_read_uint_internal(v18, v19, v20, &a4[((unint64_t)(v21 + 7) >> 2) | 1]);
  }
  *(void *)(a1 + 16) = v15;
  return result;
}

uint64_t ccec_x963_import_priv(unint64_t *a1, unint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0;
  v12[3] = cc_ws_alloc;
  uint64_t v13 = cc_ws_free;
  if (v8)
  {
    uint64_t v10 = ccec_x963_import_priv_ws((uint64_t)v12, a1, a2, a3, a4);
    v13((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 4294967283;
  }
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v10;
}

uint64_t ccec_x963_import_pub_ws(uint64_t a1, unint64_t *a2, uint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  if (!a3) {
    return 4294967289;
  }
  if (a3 == 1)
  {
    int v10 = *a4;
    if (!*a4) {
      return 4294967136;
    }
  }
  else
  {
    int v10 = *a4;
  }
  unsigned int v12 = v10 - 2;
  if (v12 > 5 || ((0x37u >> v12) & 1) == 0) {
    return 4294967289;
  }
  int v13 = dword_100029F60[(char)v12];
  uint64_t v14 = *(void *)(a1 + 16);
  *a5 = a2;
  uint64_t result = ccec_import_affine_point_ws(a1, a2, v13, a3, a4, a5 + 2);
  if (!result)
  {
    ccn_seti(*a2, &a5[2 * **a5 + 2], 1);
    uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * *a2);
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, (uint64_t *)a2, v15, (uint64_t)(a5 + 2));
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_x963_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  uint64_t v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0;
  v12[3] = cc_ws_alloc;
  int v13 = cc_ws_free;
  if (!v8) {
    return 4294967283;
  }
  uint64_t v10 = ccec_x963_import_pub_ws((uint64_t)v12, a1, a2, a3, a4);
  v13((uint64_t)v12);
  return v10;
}

uint64_t ccrng_crypto_generate(uint64_t a1, rsize_t a2, char *a3)
{
  if (!a2) {
    return 0;
  }
  rsize_t v6 = a2;
  int v7 = a3;
  while (1)
  {
    uint64_t v8 = *(os_unfair_lock_s **)(a1 + 24);
    if (v8)
    {
      os_unfair_lock_lock(v8);
      uint64_t v9 = *(const os_unfair_lock **)(a1 + 24);
      if (v9) {
        os_unfair_lock_assert_owner(v9);
      }
    }
    memset(v29, 0, sizeof(v29));
    rsize_t v10 = *(void *)(a1 + 56);
    int v11 = ccrng_schedule_read(*(void *)(a1 + 16));
    if (v11 == 1) {
      goto LABEL_13;
    }
    int v12 = v11;
    uint64_t seed = ccentropy_get_seed(*(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 8), v10, (uint64_t)v29);
    if (seed == -10) {
      break;
    }
    uint64_t v14 = seed;
    if (seed) {
      goto LABEL_40;
    }
    uint64_t v15 = sub_100009624((void *)a1, v10, (uint64_t)v29, 0, 0);
    if (v15)
    {
      uint64_t v14 = v15;
LABEL_40:
      cc_clear(v10, v29);
      goto LABEL_36;
    }
    ccrng_schedule_notify_reseed(*(unsigned char **)(a1 + 16));
    cc_clear(v10, v29);
LABEL_13:
    if (v6 >= *(void *)(a1 + 48)) {
      unint64_t v16 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v16 = v6;
    }
    unint64_t v17 = *(const os_unfair_lock **)(a1 + 24);
    if (v17) {
      os_unfair_lock_assert_owner(v17);
    }
    if (a2 <= 0xB && (unint64_t v18 = *(void *)(a1 + 64), v18 >= v16))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = *(void *)(a1 + 80);
      BOOL v23 = (void *)(v21 + v22);
      uint64_t v24 = v21 + v18;
      unint64_t v25 = v24 - (v21 + v22);
      if (v25 >= v16) {
        size_t v26 = v16;
      }
      else {
        size_t v26 = v24 - (v21 + v22);
      }
      memcpy(v7, (const void *)(v21 + v22), v26);
      cc_clear(v26, v23);
      *(void *)(a1 + 80) += v26;
      if (v25 < v16)
      {
        uint64_t v19 = sub_1000096DC((void *)a1, *(void *)(a1 + 64), *(void *)(a1 + 72));
        if (v19)
        {
LABEL_41:
          uint64_t v14 = v19;
          goto LABEL_36;
        }
        memcpy(&v7[v26], *(const void **)(a1 + 72), v16 - v26);
        cc_clear(v16 - v26, *(void **)(a1 + 72));
        *(void *)(a1 + 80) = v16 - v26;
      }
    }
    else
    {
      uint64_t v19 = sub_1000096DC((void *)a1, v16, (uint64_t)v7);
      if (v19) {
        goto LABEL_41;
      }
    }
    unint64_t v20 = *(os_unfair_lock_s **)(a1 + 24);
    if (v20) {
      os_unfair_lock_unlock(v20);
    }
    v7 += v16;
    v6 -= v16;
    if (!v6) {
      return 0;
    }
  }
  if (v12 == 2) {
    goto LABEL_13;
  }
  if (v12 == 3) {
    uint64_t v14 = 4294967134;
  }
  else {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
LABEL_36:
  uint64_t v28 = *(os_unfair_lock_s **)(a1 + 24);
  if (v28) {
    os_unfair_lock_unlock(v28);
  }
  cc_clear(a2, a3);
  return v14;
}

uint64_t sub_100009624(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  rsize_t v10 = (const os_unfair_lock *)a1[3];
  if (v10) {
    os_unfair_lock_assert_owner(v10);
  }
  uint64_t result = ccdrbg_reseed(a1[4], a1[5], a2, a3, a4, a5);
  if (!result) {
    a1[10] = a1[8];
  }
  return result;
}

uint64_t ccrng_crypto_init(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a8 > 0x40) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a1 = j__ccrng_crypto_generate;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = a6;
  a1[6] = a7;
  a1[7] = a8;
  a1[8] = a9;
  a1[9] = a10;
  a1[10] = a9;
  return result;
}

uint64_t sub_1000096DC(void *a1, uint64_t a2, uint64_t a3)
{
  rsize_t v6 = (const os_unfair_lock *)a1[3];
  if (v6) {
    os_unfair_lock_assert_owner(v6);
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];

  return ccdrbg_generate(v7, v8, a2, a3, 0, 0);
}

uint64_t cczp_inv_default_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = cczp_n(a2);
  uint64_t v9 = cczp_prime(v6);
  if ((ccn_cmp_internal(v8, a4, v9) & 0x80000000) == 0) {
    return 4294967289;
  }
  uint64_t v46 = *(void *)(a1 + 16);
  long long __s = a3;
  int v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  int v12 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  cczp_from_ws(a1, v6);
  int v13 = (void *)cczp_prime(v6);
  ccn_set(v8, v12, v13);
  uint64_t v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v53 = v14;
  ccn_seti(v8, v14, 1);
  uint64_t __n = 8 * v8;
  int8x16_t v54 = v15;
  cc_clear(8 * v8, v15);
  v52 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  unint64_t v16 = (v8 << 7) | 0x1E;
  if (v16 != 30)
  {
    uint64_t v17 = 0;
    unint64_t v49 = v8 - 1;
    unint64_t v50 = v16 / 0x1F;
    unint64_t v48 = v8 - 2;
    v51 = (void *)v6;
    uint64_t v56 = v8;
    do
    {
      uint64_t v18 = v11[v49];
      uint64_t v19 = v12[v49];
      uint64_t v55 = v17;
      if (v8 >= 2)
      {
        unint64_t v20 = v48;
        do
        {
          char v21 = __clz(v19 | v18 | 1);
          char v22 = (((v19 | v18) >> 63) - v21 + 64) & -(uint64_t)(((v19 | v18 | ((v19 | (unint64_t)v18) >> 32))
                                                             + 0xFFFFFFFF) >> 32);
          uint64_t v18 = (v11[v20] >> v22) | (v18 << v21);
          uint64_t v19 = (v12[v20--] >> v22) | (v19 << v21);
        }
        while (v20 < v8);
      }
      unint64_t v23 = 0;
      uint64_t v24 = 0;
      unint64_t v25 = v18 & 0xFFFFFFFF80000000 | *v11 & 0x7FFFFFFFLL;
      unint64_t v26 = v19 & 0xFFFFFFFF80000000 | *v12 & 0x7FFFFFFFLL;
      uint64_t v27 = 31;
      uint64_t v28 = 0x80000000;
      unint64_t v29 = 0x80000000;
      do
      {
        unint64_t v30 = v25 & 1;
        unint64_t v31 = v25 >> !(v25 & 1);
        unint64_t v32 = v31 ^ v26;
        unint64_t v33 = v25 & ((((v31 - v26) ^ v31 | v31 ^ v26) ^ v31) >> 63);
        uint64_t v34 = -(uint64_t)v33;
        unint64_t v35 = v26 & -(uint64_t)v33--;
        unint64_t v36 = v33 & v31 | v35;
        unint64_t v26 = v32 ^ v36;
        unint64_t v37 = v33 & v29 | v24 & v34;
        v24 ^= v29 ^ v37;
        unint64_t v38 = v33 & v23 | v28 & v34;
        v28 ^= v23 ^ v38;
        unint64_t v25 = (v36 - (v26 & -(uint64_t)v30)) >> v30;
        unint64_t v29 = (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1);
        unint64_t v23 = (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1);
        --v27;
      }
      while (v27);
      uint64_t v39 = a1;
      unint64_t v40 = sub_100009B74(a1, v8, v52, v11, (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1), v12, (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1));
      unint64_t v41 = sub_100009B74(v39, v56, v12, v11, v24, v12, v28);
      ccn_set(v56, v11, v52);
      unint64_t v42 = v40 - 1;
      uint64_t v43 = -(uint64_t)v40;
      a1 = v39;
      uint64_t v44 = v42 & v23 | v43 & -(uint64_t)v23;
      uint64_t v6 = (uint64_t)v51;
      unint64_t v8 = v56;
      sub_100009CF4(v39, v51, v52, v53, v42 & v29 | v43 & -(uint64_t)v29, v54, v44);
      sub_100009CF4(v39, v51, v54, v53, (v41 - 1) & v24 | -(uint64_t)v41 & -v24, v54, (v41 - 1) & v28 | -(uint64_t)v41 & -v28);
      ccn_set(v56, v53, v52);
      uint64_t v17 = v55 + 1;
    }
    while (v55 + 1 != v50);
  }
  if (ccn_n(v8, v12) == 1 && *v12 == 1)
  {
    cczp_to_ws(a1, v6);
    uint64_t result = 0;
  }
  else
  {
    cc_clear(__n, __s);
    uint64_t result = 4294967289;
  }
  *(void *)(a1 + 16) = v46;
  return result;
}

unint64_t sub_100009B74(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v13 = a2 + 1;
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2 + 1);
  uint64_t v15 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  if (a2) {
    ccn_set(a2, v14, a4);
  }
  ccn_zero(1, (char *)v14 + 8 * a2);
  ccn_cond_neg(v13, a5 < 0, v14->i64, v14->i64);
  if (a2) {
    ccn_set(a2, v15, a6);
  }
  ccn_zero(1, &v15[8 * a2]);
  ccn_cond_neg(v13, a7 < 0, (uint64_t *)v15, (uint64_t *)v15);
  ccn_mul1(v13, v14, v14, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  ccn_addmul1(v13, v14, v15, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  unint64_t v16 = (unint64_t)v14->i64[a2] >> 63;
  ccn_cond_neg(v13, v14->i64[a2] < 0, v14->i64, v14->i64);
  ccn_shift_right(v13, v14, v14, 31);
  ccn_set(a2, a3, v14);
  *(void *)(a1 + 16) = v19;
  return v16;
}

uint64_t sub_100009CF4(uint64_t a1, void *a2, void *a3, unint64_t *a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12 = cczp_n((uint64_t)a2);
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v13 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v14 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  cczp_cond_negate((uint64_t)a2, a5 < 0, v13->i64, a4);
  cczp_cond_negate((uint64_t)a2, a7 < 0, v14, a6);
  v13->i64[v12] = ccn_mul1(v12, v13, v13, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  v13->i64[v12] += ccn_addmul1(v12, v13, v14, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  uint64_t v15 = cczp_prime((uint64_t)a2);
  v13->i64[v12] += ccn_addmul1(v12, v13, v15, (LODWORD(a2[*a2 + 3]) * v13->i32[0]) & 0x7FFFFFFF);
  ccn_shift_right(v12 + 1, v13, v13, 31);
  ccn_set(v12, a3, v13);
  unint64_t v16 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v17 = ccn_subn(v12 + 1, v13, v13->i64, v12, v16);
  uint64_t result = ccn_mux(v12, v17, (uint64_t *)a3, (uint64_t *)a3, v13->i64);
  *(void *)(a1 + 16) = v21;
  return result;
}

uint64_t cczp_inv_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 40))();
}

uint64_t cczp_n(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cczp_bitlen(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccn_mul(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result *= -8;
    char v4 = (unint64_t *)(a2 - result);
    uint64_t v5 = a3 - result;
    uint64_t v6 = a4 - result;
    uint64_t v7 = result;
    uint64_t v8 = result;
    unint64_t v9 = 0;
    unint64_t v10 = *(void *)(v6 + result);
    do
    {
      unsigned long long v11 = *(unint64_t *)(v5 + v8) * (unsigned __int128)v10 + v9;
      *(unint64_t *)((char *)v4 + v8) = v11;
      unint64_t v9 = *((void *)&v11 + 1);
      v8 += 8;
    }
    while (v8);
    while (1)
    {
      unint64_t *v4 = v9;
      v7 += 8;
      if (!v7) {
        break;
      }
      ++v4;
      uint64_t v12 = result;
      unint64_t v9 = 0;
      unint64_t v13 = *(void *)(v6 + v7);
      do
      {
        unsigned long long v14 = *(unint64_t *)(v5 + v12) * (unsigned __int128)v13 + v9 + *(unint64_t *)((char *)v4 + v12);
        *(unint64_t *)((char *)v4 + v12) = v14;
        unint64_t v9 = *((void *)&v14 + 1);
        v12 += 8;
      }
      while (v12);
    }
  }
  return result;
}

uint64_t ccmode_ctr_init(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 48);
  *a2 = v8;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, void *, uint64_t))(a1 + 32))(a1, a2, a5);
  return v9;
}

uint64_t ccn_cmpn_public_value(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a1;
  }
  if (a1 >= a3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a4;
  }
  if (a1 <= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a1;
  }
  if (a1 < a3) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 1;
  }
  unsigned int v8 = ccn_cmp_public_value(v4, a2, a4);
  if (ccn_n(v6 - v4, v5 + 8 * v4)) {
    return v7;
  }
  else {
    return v8;
  }
}

uint64_t cczp_sqrt_tonelli_shanks_precomp_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12 = cczp_n(a2);
  uint64_t v23 = *(void *)(a1 + 16);
  unint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unsigned long long v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, a6);
  uint64_t v18 = v23;
  if (!result)
  {
    ccn_seti(v12, v16, 1);
    unint64_t v25 = v16;
    cczp_to_ws(a1, a2);
    ccn_set(v12, v15, a7);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    if (a5 >= 2)
    {
      while (1)
      {
        ccn_set(v12, v14, v13);
        if (a5 - 1 < 2) {
          break;
        }
        uint64_t v19 = 2;
        do
        {
          cczp_sqr_ws(a1, a2);
          ++v19;
        }
        while (a5 != v19);
        char v20 = ccn_cmp_internal(v12, v14, v25) & 1;
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, a3, (uint64_t *)v14, a3);
        cczp_sqr_ws(a1, a2);
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
        --a5;
      }
      char v21 = ccn_cmp_internal(v12, v14, v25) & 1;
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, a3, (uint64_t *)v14, a3);
      cczp_sqr_ws(a1, a2);
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
    }
    cczp_sqr_ws(a1, a2);
    if (ccn_cmp_internal(v12, v14, a4)) {
      uint64_t result = 4294967289;
    }
    else {
      uint64_t result = 0;
    }
    uint64_t v18 = v23;
  }
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_sqrt_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = ~*(_DWORD *)cczp_prime(a2) & 3;
  uint64_t v9 = cczp_n(a2);
  uint64_t v10 = *(void *)(a1 + 16);
  unsigned long long v11 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  uint64_t v12 = (void *)cczp_prime(a2);
  if (v8)
  {
    ccn_set(v9, v11, v12);
    v11->i64[0] &= ~1uLL;
    unint64_t v14 = ccn_trailing_zeros(v9, (uint64_t)v11);
    ccn_shift_right_multi(v9, v11, v11, v14);
    uint64_t v15 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_sub1(v9, v15, (unint64_t *)v11, 1uLL);
    ccn_shift_right(v9, v15, v15, 1);
    unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_seti(v9, v16, 1);
    while (cczp_is_quadratic_residue_ws(a1, a2, v16) == 1)
      ccn_add1_ws(a1, v9, v16, v16, 1);
    uint64_t result = cczp_power_fast_ws(a1, a2, v16, v16, (uint64_t)v11);
    if (!result) {
      uint64_t result = cczp_sqrt_tonelli_shanks_precomp_ws(a1, a2, a3, a4, v14, (uint64_t)v15, v16);
    }
  }
  else
  {
    ccn_add1_ws(a1, v9, v11, (uint64_t *)v12, 1);
    ccn_shift_right(v9, v11, v11, 2);
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v11);
    if (!result)
    {
      cczp_sqr_ws(a1, a2);
      if (ccn_cmp_internal(v9, v11, a4)) {
        uint64_t result = 4294967289;
      }
      else {
        uint64_t result = 0;
      }
    }
  }
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sqrt_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 48))();
}

BOOL ccec_is_point_projective_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  BOOL result = ccn_cmp_internal(v4, v7, v6) == 0;
  *(void *)(a1 + 16) = v5;
  return result;
}

BOOL ccec_is_point_at_infinity(void *a1, uint64_t a2)
{
  return ccn_n(*a1, a2 + 16 * *a1) == 0;
}

uint64_t ccentropy_get_seed(uint64_t (***a1)(void, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  BOOL v8 = timingsafe_enable_if_supported();
  uint64_t v6 = (**a1)(a1, a2, a3);
  cc_disable_dit_with_sb((unsigned int *)&v8);
  return v6;
}

uint64_t ccec_make_pub_from_priv_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t a4, uint64_t a5, uint64_t **a6)
{
  *a6 = a2;
  uint64_t v12 = *a2;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  if (ccec_validate_scalar(a2, a4))
  {
    uint64_t result = 4294967274;
    goto LABEL_10;
  }
  if (a5)
  {
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, a2, v14, a5);
    if (result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
    if (result) {
      goto LABEL_10;
    }
  }
  if (ccec_mult_blinded_ws(a1, (unint64_t *)a2, (uint64_t)(a6 + 2), a4, v14, a3))
  {
    uint64_t result = 4294967280;
  }
  else if (ccec_is_point_projective_ws(a1, a2))
  {
    if (ccec_affinify_ws(a1, (uint64_t)a2))
    {
      uint64_t result = 4294967279;
    }
    else
    {
      ccn_seti(v12, &a6[2 * **a6 + 2], 1);
      uint64_t result = 0;
    }
  }
  else
  {
    uint64_t result = 4294967277;
  }
LABEL_10:
  *(void *)(a1 + 16) = v13;
  return result;
}

BOOL ccn_add_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_add_asm(a2, a3, a4, a5);
}

BOOL ccn_add_asm(BOOL result, void *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL v4 = 0;
  if (result)
  {
    if (result)
    {
      uint64_t v6 = *a3++;
      uint64_t v5 = v6;
      uint64_t v7 = *a4++;
      BOOL v4 = __CFADD__(v5, v7);
      *a2++ = v5 + v7;
    }
    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      uint64_t v10 = *a4;
      uint64_t v11 = a4[1];
      a4 += 2;
      uint64_t v13 = v4 + v8;
      BOOL v4 = __CFADD__(v4, v8) | __CFADD__(v10, v13);
      uint64_t v12 = v10 + v13;
      uint64_t v14 = v4 + v9;
      BOOL v4 = __CFADD__(v4, v9) | __CFADD__(v11, v14);
      *a2 = v12;
      a2[1] = v11 + v14;
      a2 += 2;
    }
    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      char v17 = a3 + 2;
      uint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      char v20 = a4 + 2;
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      uint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        uint64_t v30 = v4 + v18;
        BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v30);
        uint64_t v29 = v21 + v30;
        uint64_t v32 = v4 + v19;
        BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v32);
        uint64_t v31 = v22 + v32;
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        uint64_t v35 = v4 + v24;
        BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v35);
        uint64_t v34 = v27 + v35;
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        uint64_t v37 = v4 + v25;
        BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v37);
        uint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        void *v36 = v34;
        v36[1] = v28 + v37;
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        uint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }
      uint64_t v40 = v4 + v18;
      BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v40);
      uint64_t v39 = v21 + v40;
      uint64_t v42 = v4 + v19;
      BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v42);
      uint64_t v41 = v22 + v42;
      uint64_t v44 = v4 + v24;
      BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v44);
      uint64_t v43 = v27 + v44;
      uint64_t v45 = v4 + v25;
      BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v45);
      *a2 = v39;
      a2[1] = v41;
      uint64_t v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v28 + v45;
    }
    return v4;
  }
  return result;
}

BOOL ccn_add1_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (a2) {
    return ccn_add1_asm(a2, a3, a4, a5);
  }
  else {
    return a5;
  }
}

uint64_t ccecdh_pairwise_consistency_check_ws(uint64_t a1, unint64_t **a2, uint64_t a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  uint64_t v6 = (uint64_t *)*a2;
  unint64_t v7 = **a2;
  uint64_t v28 = *(void *)(a1 + 16);
  uint64_t v8 = (unint64_t **)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, (4 * (v7 & 0x7FFFFFFFFFFFFFFLL)) | 2);
  *uint64_t v8 = (unint64_t *)v6;
  uint64_t v9 = *v6;
  uint64_t v10 = (uint64_t)&v8[3 * *v6 + 2];
  ccn_set(1, (void *)v10, &unk_100029F78);
  ccn_zero(v9 - 1, (void *)(v10 + 8));
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *v6);
  uint64_t v13 = v28;
  uint64_t result = sub_10000AC90(a1, v6, v12, (uint64_t)&v8[3 * **v8 + 2]);
  if (!result)
  {
    uint64_t result = ccec_affinify_ws(a1, (uint64_t)v6);
    *(void *)(a1 + 16) = v11;
    if (result) {
      goto LABEL_15;
    }
    BOOL v15 = v8 + 2;
    unint64_t v16 = (unint64_t)(cczp_bitlen((uint64_t)v6) + 7) >> 3;
    unint64_t v29 = v16;
    char v17 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v7);
    uint64_t v18 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v7);
    cc_clear(v16, v17);
    cc_clear(v16, v18);
    uint64_t result = ccecdh_compute_shared_secret_ws(a1, a2, v8, &v29, (char *)v17, a4);
    if (result) {
      goto LABEL_15;
    }
    if (!v29) {
      goto LABEL_14;
    }
    uint64_t v19 = 0;
    int v20 = 0;
    do
      v20 |= v17[v19++];
    while (v29 != v19);
    if (!v20) {
      goto LABEL_14;
    }
    uint64_t v21 = *v8;
    unint64_t v22 = **v8;
    uint64_t v23 = *(void *)(a1 + 16);
    uint64_t v24 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 24))(a1);
    uint64_t result = sub_10000AC90(a1, (uint64_t *)v21, v24, (uint64_t)&v15[3 * v22]);
    uint64_t v13 = v28;
    if (!result)
    {
      uint64_t v25 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v22);
      uint64_t result = ccec_affinify_x_only_ws(a1, (uint64_t *)v21, (uint64_t)v25, (uint64_t)v24);
      if (!result)
      {
        uint64_t v26 = cczp_bitlen((uint64_t)v21);
        ccn_write_uint_padded_internal(v22, v25, (unint64_t)(v26 + 7) >> 3, (char *)v18);
        *(void *)(a1 + 16) = v23;
        if (v29 == v16)
        {
          if (cc_cmp_safe_internal(v16, (char *)v17, (char *)v18)) {
            uint64_t result = 4294967278;
          }
          else {
            uint64_t result = 0;
          }
          goto LABEL_15;
        }
LABEL_14:
        uint64_t result = 4294967278;
LABEL_15:
        uint64_t v13 = v28;
      }
    }
  }
  *(void *)(a1 + 16) = v13;
  return result;
}

uint64_t sub_10000AC90(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = 3 * *a2;
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v12 = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!v12)
  {
    ccn_set(v10, a3, v11);
    uint64_t v13 = ccn_bitlen_internal(v8, a4);
    if (v13 != 1)
    {
      unint64_t v14 = v13 - 2;
      do
      {
        ccec_double_ws(a1, a2);
        if ((*(void *)(a4 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14)) {
          ccec_full_add_normalized_ws(a1, a2, (char *)a3, (uint64_t)a3, (char *)v11);
        }
        --v14;
      }
      while (v14 != -1);
    }
  }
  *(void *)(a1 + 16) = v9;
  return v12;
}

uint64_t ccn_mux(uint64_t result, char a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v5 = qword_100039AB0 ^ (qword_100039AB0 << 13) ^ ((qword_100039AB0 ^ (unint64_t)(qword_100039AB0 << 13)) >> 7);
  uint64_t v6 = v5 ^ (v5 << 17);
  qword_100039AB0 = v6;
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * v6)); result; --result)
  {
    uint64_t v9 = *a4++;
    uint64_t v8 = v9;
    uint64_t v10 = *a5++;
    *a3 = v10 ^ v6;
    *a3++ = (v10 ^ v8) & 0x5555555555555555 ^ v10 ^ v6 ^ (v10 ^ v8) & i ^ v6;
  }
  return result;
}

uint64_t ccn_mux_next_mask()
{
  unint64_t v0 = qword_100039AB0 ^ (qword_100039AB0 << 13) ^ ((qword_100039AB0 ^ (unint64_t)(qword_100039AB0 << 13)) >> 7);
  uint64_t result = v0 ^ (v0 << 17);
  qword_100039AB0 = result;
  return result;
}

uint64_t ccn_mux_seed_mask(uint64_t result)
{
  qword_100039AB0 ^= result;
  return result;
}

uint64_t cczp_power_fast_ws(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = ccn_bitlen_internal(v10, a5);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v10);
    ccn_set(v10, v13, a4);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 1)) & 1;
    if ((v12 & 1) == 0) {
      uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 2)) & 1 | (2 * v14);
    }
    ccn_set(v10, a3, &v13[8 * (v14 - 1) * v10]);
    if ((v12 | 0xFFFFFFFFFFFFFFFELL) + v12)
    {
      unint64_t v15 = v12 + (v12 | 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        cczp_sqr_ws(a1, a2);
        cczp_sqr_ws(a1, a2);
        if ((*(void *)(a5 + (((v15 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 - 1)) & 1 | (2 * ((*(void *)(a5 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1))) {
          cczp_mul_ws(a1, a2);
        }
        v15 -= 2;
      }
      while (v15 != -1);
    }
    *(void *)(a1 + 16) = v17;
  }
  else
  {
    ccn_seti(v10, a3, 1);
    cczp_to_ws(a1, a2);
  }
  return 0;
}

unint64_t ccn_bitlen_public_value(unint64_t result, unint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    uint64_t v3 = 64;
    do
    {
      unint64_t v4 = *a2++;
      uint64_t result = ((((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32) - 1) & result | (v3 - __clz(v4 | 1)) & -(uint64_t)(((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32);
      v3 += 64;
      --v2;
    }
    while (v2);
  }
  return result;
}

void cc_abort()
{
}

uint64_t ccn_mul_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ccn_mul(a2, a3, a4, a5);
}

uint64_t ccn_divmod_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v12 = ccn_n(a6, a8);
  unint64_t v13 = a2 - v12;
  uint64_t v50 = *(void *)(a1 + 16);
  uint64_t v14 = v12 + 1;
  unint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  unint64_t v16 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v59 = a1;
  uint64_t v17 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v15[v12] = 0;
  uint64_t v57 = v12 - 1;
  unint64_t v18 = __clz(*(void *)(a8 + 8 * (v12 - 1)));
  ccn_shift_left(v12, (uint64_t)v15, a8, v18, v19);
  int v20 = -(int)v18;
  unint64_t v60 = v18;
  unint64_t v21 = v18 + 0xFFFFFFFF;
  if (v12) {
    ccn_set(v12, v16, (void *)(a3 + 8 * v13));
  }
  uint64_t v53 = -(uint64_t)HIDWORD(v21);
  char v54 = v20 & 0x3F;
  ccn_zero(1, (char *)v16 + 8 * v12);
  ccn_shift_left(v14, (uint64_t)v16, (uint64_t)v16, v60, v22);
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = v15[v57];
  uint64_t v27 = -v26;
  unint64_t v29 = (unsigned __int128)-(__int128)__PAIR128__(v28, v26) >> 64;
  uint64_t v30 = 65;
  unint64_t v31 = v26;
  do
  {
    unsigned long long v32 = __PAIR128__(v29, v27) - __PAIR128__(v31, v23);
    unint64_t v33 = (unint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63;
    uint64_t v34 = v29 & ((uint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63);
    uint64_t v27 = (v33 - 1) & v32 | v27 & (*((uint64_t *)&v32 + 1) >> 63);
    *((void *)&v35 + 1) = v25;
    *(void *)&long long v35 = v24;
    uint64_t v25 = v35 >> 63;
    *((void *)&v35 + 1) = v24;
    *(void *)&long long v35 = *((void *)&v32 + 1);
    unint64_t v29 = (v33 != 0 ? 0 : *((void *)&v32 + 1)) | v34;
    uint64_t v24 = (v35 >> 63) ^ 1;
    *((void *)&v35 + 1) = v31;
    *(void *)&long long v35 = v23;
    unint64_t v23 = v35 >> 1;
    v31 >>= 1;
    --v30;
  }
  while (v30);
  unint64_t v56 = (v24 + 2) | ((((HIDWORD(v15[v57]) ^ 0x80000000 | v15[v57]) + 0xFFFFFFFF) >> 32) - 1);
  size_t v52 = 8 * v12;
  uint64_t v58 = v12;
  unint64_t v36 = (void *)(a3 - 8 * v12 + 8 * a2);
  unint64_t v37 = v13;
  do
  {
    unint64_t v38 = v13;
    uint64_t v39 = *v36 << v60;
    v16->i64[0] = v39;
    if (v37) {
      v16->i64[0] = ((*(v36 - 1) & (unint64_t)v53) >> v54) | v39;
    }
    unint64_t v40 = v16->u64[v58];
    uint64_t v41 = v16->i64[v57];
    uint64_t v63 = v15[v57];
    unint64_t v42 = ((__PAIR128__(v40, v41) - (unint64_t)v63) >> 64) + ((v40 * (unsigned __int128)v56) >> 64) + 2;
    if (v42 < v40) {
      unint64_t v42 = -1;
    }
    unint64_t v62 = v42;
    v65[0] = 0;
    v65[1] = 0;
    ccn_mul(1, (uint64_t)v65, (uint64_t)&v62, (uint64_t)&v63);
    v64[0] = v41;
    v64[1] = v40;
    BOOL v43 = ccn_sub_ws(0, 2, v65, v64, (unint64_t *)v65);
    v62 -= 2 * v43;
    BOOL v44 = ccn_add1_ws(0, 2, v65, v65, v63);
    unint64_t v45 = v62 + v44;
    v17[v58] = ccn_mul1(v58, v17, v15, v62 + v44);
    BOOL v46 = ccn_sub_ws(v59, v14, v16, v16->i64, v17);
    uint64_t v47 = v46 - ccn_cond_add(v14, v46, v16->i64, v16->i64, v15);
    uint64_t result = ccn_cond_add(v14, v47, v16->i64, v16->i64, v15);
    if (a5 && v37 < a4) {
      *(void *)(a5 + 8 * v37) = v45 - (v46 + v47);
    }
    if (v37) {
      uint64_t result = (uint64_t)memmove(&v16->u64[1], v16, v52);
    }
    --v37;
    --v36;
    unint64_t v13 = v38;
  }
  while (v37 <= v38);
  if (a5 && a4 > v38 + 1) {
    uint64_t result = cc_clear(8 * (a4 - (v38 + 1)), (void *)(a5 + 8 * (v38 + 1)));
  }
  if (a7)
  {
    ccn_shift_right(v58, v16, v16, v60);
    if (v58) {
      ccn_set(v58, a7, v16);
    }
    uint64_t result = ccn_zero(a6 - v58, &a7[8 * v58]);
  }
  *(void *)(v59 + 16) = v50;
  return result;
}

uint64_t cccbc_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t cccbc_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
}

uint64_t ccmode_ctr_setctr(int a1, void *a2, void *__src)
{
  uint64_t v3 = *a2;
  a2[1] = *(void *)(*a2 + 8);
  memcpy((char *)a2 + ((*(void *)(v3 + 8) + 7) & 0xFFFFFFFFFFFFFFF8) + 16, __src, *(void *)(v3 + 8));
  return 0;
}

uint64_t ccn_random_bits(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, unint64_t, uint64_t))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  uint64_t result = (*a3)(a3, 8 * v5, a2);
  if (!result) {
    *(void *)(a2 + 8 * v5 - 8) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return result;
}

uint64_t ccn_random_bits_fips(uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  if ((unint64_t)(a1 + 63) > 0x7F)
  {
    uint64_t v6 = (*a3)(a3, 8 * v5, a2);
  }
  else
  {
    int v9 = 0;
    uint64_t __src = 0;
    uint64_t v6 = (*a3)(a3, 12uLL, &__src);
    memcpy(a2, &__src, 8 * v5);
    cc_clear(8 * v5, &__src);
  }
  if (!v6) {
    *((void *)a2 + v5 - 1) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return v6;
}

uint64_t ccn_read_uint_public_value(unint64_t a1, void *a2, unint64_t a3, unsigned __int8 *a4)
{
  unint64_t v4 = 8 * a1;
  if (a3 > 8 * a1)
  {
    int v5 = 0;
    unint64_t v6 = a3 - v4;
    unint64_t v7 = a4;
    do
    {
      int v8 = *v7++;
      v5 |= v8;
      --a3;
    }
    while (a3 > v4);
    if (v5) {
      return 4294967289;
    }
    a4 += v6;
    a3 = 8 * a1;
  }
  if (a3 < 8)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = ((a3 - 8) >> 3) + 1;
    uint64_t v11 = a2;
    unint64_t v12 = v10;
    do
    {
      *v11++ = bswap64(*(void *)&a4[a3 - 8]);
      a3 -= 8;
      --v12;
    }
    while (v12);
  }
  if (a3)
  {
    unint64_t v13 = 0;
    uint64_t v14 = -(uint64_t)a3;
    do
      unint64_t v13 = a4[a3 + v14] | (v13 << 8);
    while (!__CFADD__(v14++, 1));
    a2[v10++] = v13;
  }
  if (v10 < a1) {
    bzero(&a2[v10], v4 - 8 * v10);
  }
  return 0;
}

void *ccn_set(uint64_t a1, void *__dst, void *__src)
{
  return memmove(__dst, __src, 8 * a1);
}

uint64_t ccrng_process_init(uint64_t a1, uint64_t (*a2)(void), uint64_t (**a3)(void, uint64_t, _OWORD *))
{
  uint64_t v6 = a1 + 128;
  ccrng_schedule_timer_init(a1 + 128, a2, 5000000000);
  ccrng_schedule_atomic_flag_init(a1 + 168);
  ccrng_schedule_tree_init(a1 + 96, v6, a1 + 168);
  uint64_t result = cc_lock_init((_DWORD *)(a1 + 208));
  if (!result)
  {
    uint64_t result = ccentropy_rng_init((void *)(a1 + 192), (uint64_t)a3);
    if (!result)
    {
      int v8 = ccaes_cbc_encrypt_mode();
      uint64_t result = ccdrbg_df_bc_init_internal((void *)(a1 + 224), v8, 0x20uLL);
      if (!result)
      {
        int v9 = ccaes_ctr_crypt_mode();
        long long v10 = xmmword_100029F80;
        DWORD2(v10) = 1;
        uint64_t v11 = a1 + 224;
        ccdrbg_factory_nistctr((void *)(a1 + 768), (uint64_t)&v9);
        memset(v13, 0, sizeof(v13));
        uint64_t result = (*a3)(a3, 32, v13);
        if (!result)
        {
          a2();
          strcpy(v12, "corecrypto process rng");
          uint64_t result = ccdrbg_init_internal(a1 + 768);
          if (!result)
          {
            uint64_t result = ccrng_crypto_init((void *)(a1 + 8), a1 + 192, a1 + 96, a1 + 208, a1 + 768, a1 + 824, 4096, 0x20uLL, 256, a1 + 2104);
            if (!result) {
              *(void *)a1 = sub_10000B978;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000B978(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 8);
}

uint64_t ccrng_process_atfork_prepare(os_unfair_lock_s *a1)
{
  return 0;
}

uint64_t ccrng_process_atfork_parent(os_unfair_lock_s *a1)
{
  return 0;
}

uint64_t ccrng_process_atfork_child(uint64_t a1)
{
  return cc_lock_init((_DWORD *)(a1 + 208));
}

uint64_t ccn_shift_right(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result) {
    return ccn_shift_right_asm(result, a2, a3, a4);
  }
  return result;
}

uint64_t ccn_shift_right_multi(uint64_t a1, int8x16_t *a2, int8x16_t *a3, unint64_t a4)
{
  uint64_t result = ccn_shift_right(a1, a2, a3, a4 & 0x3F);
  if (a1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        v9 |= ((((v10 ^ (v8 + (a4 >> 6)) | ((v10 ^ (v8 + (a4 >> 6))) >> 32))
               + 0xFFFFFFFF) >> 32)
             - 1) & a2->i64[v10];
        ++v10;
      }
      while (a1 != v10);
      a2->i64[v8++] = v9;
    }
    while (v8 != a1);
  }
  return result;
}

BOOL ccn_sub_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, unint64_t *a5)
{
  return ccn_sub_asm(a2, a3, a4, a5);
}

BOOL ccn_sub_asm(BOOL result, void *a2, uint64_t *a3, unint64_t *a4)
{
  _BOOL1 v4 = 1;
  if (result)
  {
    if (result)
    {
      unint64_t v6 = *a3++;
      unint64_t v5 = v6;
      unint64_t v7 = *a4++;
      _BOOL1 v4 = v5 >= v7;
      *a2++ = v5 - v7;
    }
    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      unint64_t v10 = *a4;
      unint64_t v11 = a4[1];
      a4 += 2;
      _BOOL1 v13 = v4;
      _BOOL1 v4 = __CFSUB__(v8, v10, v4);
      uint64_t v12 = v8 - (v10 + !v13);
      _BOOL1 v14 = v4;
      _BOOL1 v4 = __CFSUB__(v9, v11, v4);
      *a2 = v12;
      a2[1] = v9 - (v11 + !v14);
      a2 += 2;
    }
    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      uint64_t v17 = a3 + 2;
      unint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      int v20 = (uint64_t *)(a4 + 2);
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      unint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        _BOOL1 v30 = v4;
        _BOOL1 v4 = __CFSUB__(v18, v21, v4);
        uint64_t v29 = v18 - (v21 + !v30);
        _BOOL1 v32 = v4;
        _BOOL1 v4 = __CFSUB__(v19, v22, v4);
        uint64_t v31 = v19 - (v22 + !v32);
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        _BOOL1 v35 = v4;
        _BOOL1 v4 = __CFSUB__(v24, v27, v4);
        uint64_t v34 = v24 - (v27 + !v35);
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        _BOOL1 v37 = v4;
        _BOOL1 v4 = __CFSUB__(v25, v28, v4);
        unint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        void *v36 = v34;
        v36[1] = v25 - (v28 + !v37);
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        unint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }
      _BOOL1 v40 = v4;
      _BOOL1 v4 = __CFSUB__(v18, v21, v4);
      uint64_t v39 = v18 - (v21 + !v40);
      _BOOL1 v42 = v4;
      _BOOL1 v4 = __CFSUB__(v19, v22, v4);
      uint64_t v41 = v19 - (v22 + !v42);
      _BOOL1 v44 = v4;
      _BOOL1 v4 = __CFSUB__(v24, v27, v4);
      uint64_t v43 = v24 - (v27 + !v44);
      _BOOL1 v45 = v4;
      _BOOL1 v4 = __CFSUB__(v25, v28, v4);
      *a2 = v39;
      a2[1] = v41;
      BOOL v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v25 - (v28 + !v45);
    }
    return !v4;
  }
  return result;
}

unint64_t ccn_sub1(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  for (; a1; --a1)
  {
    unint64_t v4 = *a3++;
    unsigned long long v5 = v4 - (unsigned __int128)a4;
    *a2++ = v5;
    a4 = *((void *)&v5 + 1) >> 63;
  }
  return a4;
}

unint64_t ccn_write_uint_size_internal(unint64_t a1, unint64_t *a2)
{
  return (ccn_bitlen_public_value(a1, a2) + 7) >> 3;
}

uint64_t ccn_write_uint_padded_ct_internal(unint64_t a1, unint64_t *a2, unint64_t a3, char *__s)
{
  if (a3 > 0x7FFFFFFE) {
    return 4294967289;
  }
  unint64_t v6 = 8 * a1;
  if (8 * a1 > 0x7FFFFFFE) {
    return 4294967289;
  }
  unint64_t v7 = __s;
  unint64_t v8 = a3;
  unint64_t v10 = a3 - v6;
  if (a3 <= v6)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    cc_clear(a3 - v6, __s);
    v7 += v10;
    unint64_t v8 = v6;
  }
  unint64_t v11 = ccn_bitlen_public_value(a1, a2);
  if (v8 < (v11 + 7) >> 3) {
    return 4294967289;
  }
  uint64_t result = v10 + v8 - ((v11 + 7) >> 3);
  if (v8 < 8)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = ((v8 - 8) >> 3) + 1;
    _BOOL1 v13 = a2;
    unint64_t v14 = v12;
    do
    {
      unint64_t v15 = *v13++;
      *(void *)&v7[v8 - 8] = bswap64(v15);
      v8 -= 8;
      --v14;
    }
    while (v14);
  }
  if (v8)
  {
    unint64_t v16 = a2[v12];
    uint64_t v17 = &v7[v8 - 1];
    do
    {
      *v17-- = v16;
      v16 >>= 8;
      --v8;
    }
    while (v8);
  }
  return result;
}

unint64_t ccn_write_uint_public_value(unint64_t a1, unint64_t *a2, unint64_t a3, uint64_t a4)
{
  unint64_t result = ccn_bitlen_public_value(a1, a2);
  unint64_t v9 = (result + 7) >> 3;
  if (v9 >= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = (result + 7) >> 3;
  }
  uint64_t v11 = a4 + v10;
  unint64_t v12 = v9 - v10;
  unint64_t v13 = v12 >> 3;
  unint64_t v14 = v12 & 7;
  unint64_t v15 = a2[v12 >> 3] >> (8 * (v12 & 7u));
  if (v10 >= 8)
  {
    do
    {
      unint64_t v16 = v10 - 8;
      unint64_t v17 = v14 - 8;
      do
      {
        *(unsigned char *)--uint64_t v11 = v15;
        v15 >>= 8;
      }
      while (!__CFADD__(v17++, 1));
      if (v13 + 1 < a1) {
        unint64_t v15 = a2[++v13];
      }
      unint64_t v10 = v16 + v14;
      unint64_t v14 = 0;
    }
    while (v10 > 7);
  }
  if (v10)
  {
    uint64_t v19 = (unsigned char *)(v11 - 1);
    do
    {
      *v19-- = v15;
      v15 >>= 8;
      --v10;
    }
    while (v10);
  }
  return result;
}

BOOL ccn_add1_asm(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4)
{
  if (!a1) {
    return a4;
  }
  uint64_t v5 = *a3;
  unint64_t v4 = a3 + 1;
  BOOL v6 = __CFADD__(v5, a4);
  *a2 = v5 + a4;
  for (uint64_t i = a2 + 1; --a1; ++i)
  {
    uint64_t v8 = *v4++;
    BOOL v9 = v6;
    BOOL v6 = __CFADD__(v6, v8);
    *uint64_t i = v9 + v8;
  }
  return v6;
}

uint64_t ccn_cond_neg(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  uint64_t v9 = __ROR8__(0x5555555555555555, a2 | (2 * result));
  if (a1)
  {
    BOOL v10 = 1;
    do
    {
      uint64_t v12 = *a4++;
      uint64_t v11 = v12;
      BOOL v13 = v10 + ~v12;
      BOOL v10 = __CFADD__(v10, ~v12);
      uint64_t v14 = v11 ^ v13;
      uint64_t v15 = v11 ^ result;
      *a3 = v15;
      *a3++ = v14 & v9 ^ v14 & 0x5555555555555555 ^ v15 ^ result;
      --a1;
    }
    while (a1);
  }
  return result;
}

unint64_t ccec_compressed_x962_export_pub_size(uint64_t a1)
{
  return ((unint64_t)(cczp_bitlen(a1) + 7) >> 3) + 1;
}

uint64_t sizeof_cc_unit()
{
  return 8;
}

BOOL ccec_validate_pub(uint64_t **a1)
{
  BOOL v19 = timingsafe_enable_if_supported();
  unint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unint64_t v4 = sizeof_cc_unit();
  unint64_t v5 = 5 * v3 + (v4 + 7) / v4 + 3;
  if (v5 <= 7 * v3) {
    unint64_t v5 = 7 * v3;
  }
  BOOL v6 = cc_malloc_clear(8 * (v5 + 3 * v3));
  v15[0] = v6;
  uint64_t v7 = *v2;
  unint64_t v8 = sizeof_cc_unit();
  unint64_t v9 = 5 * v7 + (v8 + 7) / v8 + 3;
  if (v9 <= 7 * v7) {
    unint64_t v9 = 7 * v7;
  }
  v15[1] = v9 + 3 * v7;
  uint64_t v16 = 0;
  unint64_t v17 = cc_ws_alloc;
  uint64_t v18 = cc_ws_free;
  if (v6)
  {
    BOOL v10 = *a1;
    uint64_t v11 = cc_ws_alloc(v15, 3 * **a1);
    int v12 = ccec_validate_point_and_projectify_ws((uint64_t)v15, v10, v11, (uint64_t)(a1 + 2));
    uint64_t v16 = 0;
    v18((uint64_t)v15);
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  cc_disable_dit_with_sb((unsigned int *)&v19);
  return v13;
}

uint64_t cc_lock_init(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

unint64_t ccn_subn(uint64_t a1, void *a2, uint64_t *a3, BOOL a4, unint64_t *a5)
{
  uint64_t v5 = a1 - a4;
  BOOL v6 = &a2[a4];
  uint64_t v7 = (unint64_t *)&a3[a4];
  unint64_t v8 = ccn_sub_ws(0, a4, a2, a3, a5);

  return ccn_sub1(v5, v6, v7, v8);
}

uint64_t ccec_validate_scalar(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = cczp_prime((uint64_t)&a1[5 * *a1 + 4]);
  if ((ccn_cmp_internal(v4, a2, v5) & 0x80000000) == 0) {
    return 0xFFFFFFFFLL;
  }
  if (ccn_n(*a1, a2)) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

int32x4_t *AccelerateCrypto_SHA256_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v4 = *a3;
    int8x16_t v5 = a3[1];
    int8x16_t v6 = a3[2];
    int8x16_t v7 = a3[3];
    uint64_t v3 = a3 + 4;
    _Q1 = (int32x4_t)vrev32q_s8(v5);
    int32x4_t v9 = *result;
    _Q2 = (int32x4_t)vrev32q_s8(v6);
    _Q17 = result[1];
    _Q3 = (int32x4_t)vrev32q_s8(v7);
    _Q18 = *result;
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v4), (int32x4_t)xmmword_10000C0A0);
    _Q5 = vaddq_s32(_Q1, (int32x4_t)xmmword_10000C0B0);
    _Q19 = _Q17;
    _Q6 = vaddq_s32(_Q2, (int32x4_t)xmmword_10000C0C0);
    _Q7 = vaddq_s32(_Q3, (int32x4_t)xmmword_10000C0D0);
    BOOL v19 = &xmmword_10000C0E0;
    int v20 = 3;
    do
    {
      _Q20 = _Q18;
      int32x4_t v22 = (int32x4_t)*v19;
      __asm { SHA256SU0       V0.4S, V1.4S }
      int32x4_t v28 = (int32x4_t)v19[1];
      __asm { SHA256H         Q18, Q19, V4.4S }
      int32x4_t v30 = (int32x4_t)v19[2];
      __asm { SHA256SU1       V0.4S, V2.4S, V3.4S }
      int32x4_t v32 = (int32x4_t)v19[3];
      __asm { SHA256H2        Q19, Q20, V4.4S }
      v19 += 4;
      _Q4 = vaddq_s32(_Q0, v22);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V1.4S, V2.4S
        SHA256H         Q18, Q19, V5.4S
        SHA256SU1       V1.4S, V3.4S, V0.4S
        SHA256H2        Q19, Q20, V5.4S
      }
      _Q5 = vaddq_s32(_Q1, v28);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V2.4S, V3.4S
        SHA256H         Q18, Q19, V6.4S
        SHA256SU1       V2.4S, V0.4S, V1.4S
        SHA256H2        Q19, Q20, V6.4S
      }
      _Q6 = vaddq_s32(_Q2, v30);
      --v20;
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V3.4S, V0.4S
        SHA256H         Q18, Q19, V7.4S
        SHA256SU1       V3.4S, V1.4S, V2.4S
        SHA256H2        Q19, Q20, V7.4S
      }
      _Q7 = vaddq_s32(_Q3, v32);
    }
    while (!(_NF ^ _VF | _ZF));
    BOOL v44 = a2 <= 1;
    uint64_t v45 = a2 - 1;
    if (!v44)
    {
      BOOL v46 = (int32x4_t *)(v19 - 16);
      do
      {
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V4.4S }
        int8x16_t v49 = v3[1];
        int8x16_t v50 = v3[2];
        __asm { SHA256H2        Q19, Q20, V4.4S }
        int8x16_t v52 = v3[3];
        _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(*v3), *v46);
        _Q20 = _Q18;
        v3 += 4;
        __asm { SHA256H         Q18, Q19, V5.4S }
        _Q1 = (int32x4_t)vrev32q_s8(v49);
        __asm { SHA256H2        Q19, Q20, V5.4S }
        _Q5 = vaddq_s32(_Q1, v46[1]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V6.4S }
        _Q2 = (int32x4_t)vrev32q_s8(v50);
        __asm { SHA256H2        Q19, Q20, V6.4S }
        _Q6 = vaddq_s32(_Q2, v46[2]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V7.4S }
        _Q3 = (int32x4_t)vrev32q_s8(v52);
        __asm { SHA256H2        Q19, Q20, V7.4S }
        _Q7 = vaddq_s32(_Q3, v46[3]);
        int32x4_t v9 = vaddq_s32(v9, _Q18);
        _Q17 = vaddq_s32(_Q17, _Q19);
        _Q20 = v9;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[4]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[5]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[6]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[7]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[8]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[9]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[10]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[11]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[12]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[13]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[14]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[15]);
        BOOL v44 = v45-- <= 1;
      }
      while (!v44);
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V4.4S
      SHA256H2        Q19, Q20, V4.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V5.4S
      SHA256H2        Q19, Q20, V5.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V6.4S
      SHA256H2        Q19, Q20, V6.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V7.4S
      SHA256H2        Q19, Q20, V7.4S
    }
    *uint64_t result = vaddq_s32(v9, _Q18);
    result[1] = vaddq_s32(_Q17, _Q19);
  }
  return result;
}

uint64_t ccec_import_affine_point_ws(uint64_t a1, unint64_t *a2, int a3, uint64_t a4, unsigned __int8 *a5, void *a6)
{
  if (!a4) {
    return 4294967289;
  }
  unint64_t v11 = *a2;
  if (a4 == 1 && !*a5) {
    return 4294967136;
  }
  switch(a3)
  {
    case 4:
      uint64_t v12 = 4294967124;
      if (a4 != (unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) {
        return v12;
      }
      goto LABEL_20;
    case 1:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4) {
        return 4294967126;
      }
      uint64_t v12 = 4294967126;
      if (*a5 != 4) {
        return v12;
      }
LABEL_20:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v11);
      if (a3 == 4) {
        uint64_t v16 = a5;
      }
      else {
        uint64_t v16 = a5 + 1;
      }
      uint64_t v17 = cczp_bitlen((uint64_t)a2);
      uint64_t uint_public_value = ccn_read_uint_public_value(v11, a6, (unint64_t)(v17 + 7) >> 3, v16);
      if (uint_public_value) {
        goto LABEL_38;
      }
      if (ccn_cmp_public_value(v11, a6, a2 + 3) == -1)
      {
        if ((a3 - 3) <= 1)
        {
          uint64_t uint_public_value = ccec_affine_point_from_x_ws(a1, a2, (uint64_t)a6, (uint64_t)a6);
          if (!uint_public_value)
          {
            cczp_negate((uint64_t)a2, v15, &a6[*a2]);
            BOOL v19 = &a6[*a2];
            if (a3 == 4) {
              unsigned int v20 = ccn_cmp_public_value(v11, v15, v19) >> 31;
            }
            else {
              LOBYTE(v20) = (*v19 & 1) != (*a5 & 1);
            }
            ccn_mux(v11, v20, v19, v15, v19);
            goto LABEL_35;
          }
LABEL_38:
          uint64_t v12 = uint_public_value;
          goto LABEL_36;
        }
        unint64_t v21 = &a5[((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) + 1];
        int32x4_t v22 = &a6[*a2];
        uint64_t v23 = cczp_bitlen((uint64_t)a2);
        uint64_t v12 = ccn_read_uint_public_value(v11, v22, (unint64_t)(v23 + 7) >> 3, v21);
        if (!v12)
        {
          if (a3 != 2 || (a6[*a2] & 1) == (*a5 & 1))
          {
LABEL_35:
            uint64_t v12 = 0;
            goto LABEL_36;
          }
          uint64_t v12 = 4294967125;
        }
      }
LABEL_36:
      *(void *)(a1 + 16) = v14;
      return v12;
    case 2:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4) {
        return 4294967125;
      }
      unsigned int v13 = *a5 - 8;
      uint64_t v12 = 4294967125;
      goto LABEL_19;
  }
  if (a3 != 3) {
    return 4294967289;
  }
  if (ccec_compressed_x962_export_pub_size((uint64_t)a2) != a4) {
    return 4294967135;
  }
  unsigned int v13 = *a5 - 4;
  uint64_t v12 = 4294967135;
LABEL_19:
  if (v13 >= 0xFFFFFFFE) {
    goto LABEL_20;
  }
  return v12;
}

int8x16_t gcm_init(int8x16_t *a1, int8x16_t *a2, double a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  int32x4_t v8 = (int32x4_t)vqtbl1q_s8(*a2, *(int8x16_t *)qword_10000CDC0);
  int8x16_t v9 = veorq_s8(a8, a8);
  int8x16_t v10 = veorq_s8(vandq_s8(vextq_s8(*(int8x16_t *)&qword_10000CDC0[2], *(int8x16_t *)&qword_10000CDC0[2], 8uLL), (int8x16_t)vshrq_n_s32(vdupq_laneq_s32(v8, 3), 0x1FuLL)), vorrq_s8(vextq_s8(v9, (int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x3FuLL), 8uLL), (int8x16_t)vshlq_n_s64((int64x2_t)v8, 1uLL)));
  *a1 = v10;
  a1[8] = veorq_s8(v10, vextq_s8(v10, v10, 8uLL));
  int8x16_t v11 = (int8x16_t)vmull_high_p64((uint64x2_t)v10, (uint64x2_t)v10);
  int8x16_t v12 = (int8x16_t)vmull_p64(v10.u64[0], v10.u64[0]);
  int8x16_t v13 = veorq_s8(v12, veorq_s8(v11, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0])));
  int8x16_t v14 = veorq_s8(vextq_s8(v9, v13, 8uLL), v12);
  int8x16_t v15 = veorq_s8(vextq_s8(v14, v14, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v14.u64[0]));
  int8x16_t v16 = veorq_s8(veorq_s8(vextq_s8(v13, v9, 8uLL), v11), veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0])));
  a1[1] = v16;
  a1[9] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL));
  v13.i64[0] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL)).u64[0];
  int8x16_t v17 = (int8x16_t)vmull_high_p64((uint64x2_t)v16, (uint64x2_t)v10);
  int8x16_t v18 = (int8x16_t)vmull_p64(v16.u64[0], v10.u64[0]);
  int8x16_t v19 = veorq_s8(v18, veorq_s8(v17, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v13.u64[0])));
  int8x16_t v20 = veorq_s8(vextq_s8(v9, v19, 8uLL), v18);
  int8x16_t v21 = veorq_s8(vextq_s8(v20, v20, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v20.u64[0]));
  int8x16_t v22 = veorq_s8(veorq_s8(vextq_s8(v19, v9, 8uLL), v17), veorq_s8(vextq_s8(v21, v21, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v21.u64[0])));
  a1[2] = v22;
  a1[10] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL));
  v19.i64[0] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL)).u64[0];
  int8x16_t v23 = (int8x16_t)vmull_high_p64((uint64x2_t)v22, (uint64x2_t)v10);
  int8x16_t v24 = (int8x16_t)vmull_p64(v22.u64[0], v10.u64[0]);
  int8x16_t v25 = veorq_s8(v24, veorq_s8(v23, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v19.u64[0])));
  int8x16_t v26 = veorq_s8(vextq_s8(v9, v25, 8uLL), v24);
  int8x16_t v27 = veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v26.u64[0]));
  int8x16_t v28 = veorq_s8(veorq_s8(vextq_s8(v25, v9, 8uLL), v23), veorq_s8(vextq_s8(v27, v27, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v27.u64[0])));
  a1[3] = v28;
  a1[11] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL));
  v25.i64[0] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0];
  int8x16_t v29 = (int8x16_t)vmull_high_p64((uint64x2_t)v28, (uint64x2_t)v10);
  int8x16_t v30 = (int8x16_t)vmull_p64(v28.u64[0], v10.u64[0]);
  int8x16_t v31 = veorq_s8(v30, veorq_s8(v29, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v25.u64[0])));
  int8x16_t v32 = veorq_s8(vextq_s8(v9, v31, 8uLL), v30);
  int8x16_t v33 = veorq_s8(vextq_s8(v32, v32, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v32.u64[0]));
  int8x16_t v34 = veorq_s8(veorq_s8(vextq_s8(v31, v9, 8uLL), v29), veorq_s8(vextq_s8(v33, v33, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v33.u64[0])));
  a1[4] = v34;
  a1[12] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL));
  v31.i64[0] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL)).u64[0];
  int8x16_t v35 = (int8x16_t)vmull_high_p64((uint64x2_t)v34, (uint64x2_t)v10);
  int8x16_t v36 = (int8x16_t)vmull_p64(v34.u64[0], v10.u64[0]);
  int8x16_t v37 = veorq_s8(v36, veorq_s8(v35, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v31.u64[0])));
  int8x16_t v38 = veorq_s8(vextq_s8(v9, v37, 8uLL), v36);
  int8x16_t v39 = veorq_s8(vextq_s8(v38, v38, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v38.u64[0]));
  int8x16_t v40 = veorq_s8(veorq_s8(vextq_s8(v37, v9, 8uLL), v35), veorq_s8(vextq_s8(v39, v39, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v39.u64[0])));
  a1[5] = v40;
  a1[13] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL));
  v37.i64[0] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL)).u64[0];
  int8x16_t v41 = (int8x16_t)vmull_high_p64((uint64x2_t)v40, (uint64x2_t)v10);
  int8x16_t v42 = (int8x16_t)vmull_p64(v40.u64[0], v10.u64[0]);
  int8x16_t v43 = veorq_s8(v42, veorq_s8(v41, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v37.u64[0])));
  int8x16_t v44 = veorq_s8(vextq_s8(v9, v43, 8uLL), v42);
  int8x16_t v45 = veorq_s8(vextq_s8(v44, v44, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v44.u64[0]));
  int8x16_t v46 = veorq_s8(veorq_s8(vextq_s8(v43, v9, 8uLL), v41), veorq_s8(vextq_s8(v45, v45, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v45.u64[0])));
  a1[6] = v46;
  a1[14] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL));
  v43.i64[0] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL)).u64[0];
  int8x16_t v47 = (int8x16_t)vmull_high_p64((uint64x2_t)v46, (uint64x2_t)v10);
  int8x16_t v48 = (int8x16_t)vmull_p64(v46.u64[0], v10.u64[0]);
  int8x16_t v49 = veorq_s8(v48, veorq_s8(v47, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v43.u64[0])));
  int8x16_t v50 = veorq_s8(vextq_s8(v9, v49, 8uLL), v48);
  int8x16_t v51 = veorq_s8(vextq_s8(v50, v50, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v50.u64[0]));
  int8x16_t result = veorq_s8(veorq_s8(vextq_s8(v49, v9, 8uLL), v47), veorq_s8(vextq_s8(v51, v51, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v51.u64[0])));
  a1[7] = result;
  a1[15] = veorq_s8(result, vextq_s8(result, result, 8uLL));
  return result;
}

int8x16_t gcm_gmult(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, double a4, double a5, double a6, double a7, double a8, int8x16_t a9)
{
  int8x16_t v9 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000CDC0);
  int8x16_t v10 = veorq_s8(a9, a9);
  unint64_t v11 = veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0];
  int8x16_t v12 = (int8x16_t)vmull_high_p64((uint64x2_t)v9, *a2);
  int8x16_t v13 = (int8x16_t)vmull_p64(v9.u64[0], a2->i64[0]);
  int8x16_t v14 = veorq_s8(v13, veorq_s8(v12, (int8x16_t)vmull_p64(veorq_s8(*(int8x16_t *)a2, vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)).u64[0], v11)));
  int8x16_t v15 = veorq_s8(vextq_s8(v10, v14, 8uLL), v13);
  int8x16_t v16 = veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0]));
  int8x16_t result = vqtbl1q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v10, 8uLL), v12), veorq_s8(vextq_s8(v16, v16, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v16.u64[0]))), *(int8x16_t *)qword_10000CDC0);
  *a3 = result;
  return result;
}

int8x16_t gcm_ghash(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, uint64_t a4)
{
  int8x16_t v5 = veorq_s8(v4, v4);
  int8x16_t v6 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000CDC0);
  BOOL v7 = a4 < 128;
  for (uint64_t i = a4 - 128; !v7; i -= 128)
  {
    int8x16_t v9 = vqtbl1q_s8(a3[7], *(int8x16_t *)qword_10000CDC0);
    int8x16_t v10 = (int8x16_t)vmull_p64(a2->i64[0], v9.u64[0]);
    int8x16_t v11 = (int8x16_t)vmull_high_p64(*a2, (uint64x2_t)v9);
    int8x16_t v12 = (int8x16_t)vmull_p64(a2[8].u64[0], veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0]);
    int8x16_t v13 = vqtbl1q_s8(a3[6], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v14 = a2[1];
    int8x16_t v15 = veorq_s8(v10, (int8x16_t)vmull_p64(v14.u64[0], v13.u64[0]));
    int8x16_t v16 = veorq_s8(v11, (int8x16_t)vmull_high_p64(v14, (uint64x2_t)v13));
    int8x16_t v17 = veorq_s8(v12, (int8x16_t)vmull_p64(a2[9].u64[0], veorq_s8(v13, vextq_s8(v13, v13, 8uLL)).u64[0]));
    int8x16_t v18 = vqtbl1q_s8(a3[5], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v19 = a2[2];
    int8x16_t v20 = veorq_s8(v15, (int8x16_t)vmull_p64(v19.u64[0], v18.u64[0]));
    int8x16_t v21 = veorq_s8(v16, (int8x16_t)vmull_high_p64(v19, (uint64x2_t)v18));
    int8x16_t v22 = veorq_s8(v17, (int8x16_t)vmull_p64(a2[10].u64[0], veorq_s8(v18, vextq_s8(v18, v18, 8uLL)).u64[0]));
    int8x16_t v23 = vqtbl1q_s8(a3[4], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v24 = a2[3];
    int8x16_t v25 = veorq_s8(v20, (int8x16_t)vmull_p64(v24.u64[0], v23.u64[0]));
    int8x16_t v26 = veorq_s8(v21, (int8x16_t)vmull_high_p64(v24, (uint64x2_t)v23));
    int8x16_t v27 = veorq_s8(v22, (int8x16_t)vmull_p64(a2[11].u64[0], veorq_s8(v23, vextq_s8(v23, v23, 8uLL)).u64[0]));
    int8x16_t v28 = vqtbl1q_s8(a3[3], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v29 = a2[4];
    int8x16_t v30 = veorq_s8(v25, (int8x16_t)vmull_p64(v29.u64[0], v28.u64[0]));
    int8x16_t v31 = veorq_s8(v26, (int8x16_t)vmull_high_p64(v29, (uint64x2_t)v28));
    int8x16_t v32 = veorq_s8(v27, (int8x16_t)vmull_p64(a2[12].u64[0], veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0]));
    int8x16_t v33 = vqtbl1q_s8(a3[2], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v34 = a2[5];
    int8x16_t v35 = veorq_s8(v30, (int8x16_t)vmull_p64(v34.u64[0], v33.u64[0]));
    int8x16_t v36 = veorq_s8(v31, (int8x16_t)vmull_high_p64(v34, (uint64x2_t)v33));
    int8x16_t v37 = veorq_s8(v32, (int8x16_t)vmull_p64(a2[13].u64[0], veorq_s8(v33, vextq_s8(v33, v33, 8uLL)).u64[0]));
    int8x16_t v38 = vqtbl1q_s8(a3[1], *(int8x16_t *)qword_10000CDC0);
    uint64x2_t v39 = a2[6];
    int8x16_t v40 = veorq_s8(v35, (int8x16_t)vmull_p64(v39.u64[0], v38.u64[0]));
    int8x16_t v41 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v39, (uint64x2_t)v38));
    int8x16_t v42 = veorq_s8(v37, (int8x16_t)vmull_p64(a2[14].u64[0], veorq_s8(v38, vextq_s8(v38, v38, 8uLL)).u64[0]));
    uint64x2_t v43 = a2[7];
    int8x16_t v44 = veorq_s8(vqtbl1q_s8(*a3, *(int8x16_t *)qword_10000CDC0), v6);
    int8x16_t v45 = veorq_s8(v40, (int8x16_t)vmull_p64(v43.u64[0], v44.u64[0]));
    int8x16_t v46 = veorq_s8(v41, (int8x16_t)vmull_high_p64(v43, (uint64x2_t)v44));
    int8x16_t v47 = veorq_s8(v46, veorq_s8(v45, veorq_s8(v42, (int8x16_t)vmull_p64(a2[15].u64[0], veorq_s8(v44, vextq_s8(v44, v44, 8uLL)).u64[0]))));
    int8x16_t v48 = veorq_s8(v45, vextq_s8(v5, v47, 8uLL));
    int8x16_t v49 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v48.u64[0]), vextq_s8(v48, v48, 8uLL));
    int8x16_t v6 = veorq_s8(veorq_s8(v46, vextq_s8(v47, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v49.u64[0]), vextq_s8(v49, v49, 8uLL)));
    a3 += 8;
    BOOL v7 = i < 128;
  }
  BOOL v7 = i < -112;
  uint64_t v50 = i + 112;
  if (!v7)
  {
    int8x16_t v52 = *a3;
    int8x16_t v51 = a3 + 1;
    int8x16_t v53 = veorq_s8(v6, vqtbl1q_s8(v52, *(int8x16_t *)qword_10000CDC0));
    char v54 = (uint64x2_t *)((char *)a2 + v50);
    uint64x2_t v55 = *(uint64x2_t *)((char *)a2 + v50);
    int8x16_t v56 = (int8x16_t)vmull_p64(v53.u64[0], v55.u64[0]);
    int8x16_t v57 = (int8x16_t)vmull_high_p64((uint64x2_t)v53, v55);
    int8x16_t v58 = (int8x16_t)vmull_p64(veorq_s8(v53, vextq_s8(v53, v53, 8uLL)).u64[0], *(unint64_t *)((char *)a2[8].u64 + v50));
    BOOL v7 = v50 < 16;
    for (uint64_t j = v50 - 16; !v7; j -= 16)
    {
      --v54;
      int8x16_t v60 = *v51++;
      int8x16_t v61 = vqtbl1q_s8(v60, *(int8x16_t *)qword_10000CDC0);
      int8x16_t v56 = veorq_s8(v56, (int8x16_t)vmull_p64(v61.u64[0], v54->i64[0]));
      int8x16_t v57 = veorq_s8(v57, (int8x16_t)vmull_high_p64((uint64x2_t)v61, *v54));
      int8x16_t v58 = veorq_s8(v58, (int8x16_t)vmull_p64(veorq_s8(v61, vextq_s8(v61, v61, 8uLL)).u64[0], v54[8].u64[0]));
      BOOL v7 = j < 16;
    }
    int8x16_t v62 = veorq_s8(v57, veorq_s8(v56, v58));
    int8x16_t v63 = veorq_s8(v56, vextq_s8(v5, v62, 8uLL));
    int8x16_t v64 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v63.u64[0]), vextq_s8(v63, v63, 8uLL));
    int8x16_t v6 = veorq_s8(veorq_s8(v57, vextq_s8(v62, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v64.u64[0]), vextq_s8(v64, v64, 8uLL)));
  }
  int8x16_t result = vqtbl1q_s8(v6, *(int8x16_t *)qword_10000CDC0);
  *a1 = result;
  return result;
}

void *ccec_cp_256_asm()
{
  return &unk_1000349A8;
}

_OWORD *sub_10000CDEC(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p256(a3, a4, a5);
}

_OWORD *sub_10000CDFC(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p256(a3, a4, a4);
}

uint64_t sub_10000CE0C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v8 = 4;
  int8x16_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  int8x16_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  int8x16_t v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  ccn_mulmod_p256(v11, a4, a4);
  ccn_mulmod_p256(v10, v11, a4);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v9, v10, a4);
  ccn_mulmod_p256(v10, v9, v11);
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v8;
  }
  while (v8);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v12 = 8;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v12;
  }
  while (v12);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v13 = 16;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v13;
  }
  while (v13);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  ccn_set(4, v11, v10);
  int v14 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v14;
  }
  while (v14);
  ccn_mulmod_p256(v11, v11, a4);
  int v15 = 128;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v15;
  }
  while (v15);
  ccn_mulmod_p256(v11, v11, v10);
  int v16 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v16;
  }
  while (v16);
  ccn_mulmod_p256(v11, v11, v10);
  int v17 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v17;
  }
  while (v17);
  ccn_mulmod_p256(v10, v11, v9);
  ccn_mulmod_p256(v9, v10, a4);
  v19[0] = xmmword_100029F90;
  v19[1] = unk_100029FA0;
  ccn_mulmod_p256(v9, v9, (unint64_t *)v19);
  if (ccn_n(4, v9) == 1 && *v9 == 1)
  {
    ccn_set(4, a3, v10);
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = 4294967254;
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

_OWORD *sub_10000D0F8(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  v5[0] = xmmword_100029F90;
  v5[1] = unk_100029FA0;
  return ccn_mulmod_p256(a3, a4, (unint64_t *)v5);
}

uint64_t cczp_mm_redc_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = cczp_n((uint64_t)a2);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = a2[*a2 + 3];
    int8x16_t v11 = a4;
    uint64_t v12 = v8;
    do
    {
      uint64_t v13 = cczp_prime((uint64_t)a2);
      *int8x16_t v11 = ccn_addmul1(v9, v11, v13, *v11 * v10);
      ++v11;
      --v12;
    }
    while (v12);
  }
  BOOL v14 = ccn_add_ws(a1, v9, &a4[v9], &a4[v9], a4);
  int v15 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v16 = ccn_sub_ws(a1, v9, a4, &a4[v9], v15) ^ v14;

  return ccn_mux(v9, v16, a3, &a4[v9], a4);
}

uint64_t inc_uint(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = (unsigned char *)(a2 + result - 1);
    unint64_t v3 = 2;
    do
    {
      if (++*v2--) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v3 > a2;
      }
      ++v3;
    }
    while (!v5);
  }
  return result;
}

uint64_t ccn_cond_clear(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = *a3 ^ result;
    *a3 = v9;
    *a3++ = v9 ^ v8 & 0x5555555555555555 ^ v8 & i ^ result;
  }
  return result;
}

uint64_t ccn_shift_right_asm(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result)
  {
    unint64_t v4 = a3->i64[0];
    char v5 = 64 - a4;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(64 - a4);
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(-a4);
    BOOL v8 = result == 4;
    BOOL v9 = result < 4;
    result -= 4;
    if (!v9)
    {
      if (v8)
      {
        int8x16_t v13 = a3[1];
        *a2 = veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)a3, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(*a3, v13, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v13, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v13, v13, 8uLL).u64[0], v6));
        return result;
      }
      do
      {
        int8x16_t v10 = *a3;
        int8x16_t v11 = a3[1];
        a3 += 2;
        unint64_t v4 = a3->i64[0];
        v12.i64[0] = vextq_s8(v11, v11, 8uLL).u64[0];
        v12.i64[1] = a3->i64[0];
        *a2 = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v10, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v10, v11, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v7), (int8x16_t)vshlq_u64(v12, v6));
        a2 += 2;
        BOOL v9 = result <= 4;
        result -= 4;
      }
      while (!v9);
    }
    uint64_t v14 = result + 4;
    int v15 = &a3->u64[1];
    BOOL v16 = v14 == 2;
    BOOL v9 = v14 < 2;
    uint64_t result = v14 - 2;
    if (!v9)
    {
      if (v16)
      {
        uint64_t v19 = *v15 >> a4;
        a2->i64[0] = (v4 >> a4) | (*v15 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = v19;
        return result;
      }
      do
      {
        unint64_t v17 = *v15;
        unint64_t v18 = v15[1];
        v15 += 2;
        a2->i64[0] = (v4 >> a4) | (v17 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = (v17 >> a4) | (v18 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        ++a2;
        unint64_t v4 = v18;
        BOOL v9 = result <= 2;
        result -= 2;
      }
      while (!v9);
    }
    a2->i64[0] = v4 >> a4;
  }
  return result;
}

uint64_t ccn_set_bit(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1 << a2;
  uint64_t v4 = (a2 >> 3) & 0x1FFFFFFFFFFFFFF8;
  if (a3) {
    uint64_t v5 = *(void *)(result + v4) | v3;
  }
  else {
    uint64_t v5 = *(void *)(result + v4) & ~v3;
  }
  *(void *)(result + v4) = v5;
  return result;
}

uint64_t ccn_write_uint_padded_internal(unint64_t a1, unint64_t *a2, unint64_t a3, char *a4)
{
  LODWORD(result) = ccn_write_uint_padded_ct_internal(a1, a2, a3, a4);
  if ((result & 0x80000000) == 0) {
    return result;
  }
  ccn_write_uint_internal(a1, a2, a3, a4);
  return 0;
}

uint64_t ccn_zero(uint64_t a1, void *a2)
{
  return cc_clear(8 * a1, a2);
}

uint64_t ccn_seti(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = a3;
  return cc_clear(8 * a1 - 8, a2 + 1);
}

unint64_t ccn_cond_rsub(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  if (a1)
  {
    uint64_t v12 = 0;
    do
    {
      unint64_t v14 = *a4++;
      unint64_t v13 = v14;
      uint64_t v15 = *a5++;
      unsigned long long v16 = __PAIR128__(v12, v12) - v13;
      uint64_t v17 = v16 + v15;
      if (__CFADD__((void)v16, v15)) {
        uint64_t v18 = *((void *)&v16 + 1) + 1;
      }
      else {
        uint64_t v18 = (__PAIR128__(v12, v12) - v13) >> 64;
      }
      uint64_t v12 = v18 >> 63;
      uint64_t v19 = v13 ^ v17;
      uint64_t v20 = v13 ^ mask;
      *a3 = v20;
      *a3++ = v19 & v11 ^ v19 & 0x5555555555555555 ^ v20 ^ mask;
      --a1;
    }
    while (a1);
    unint64_t v21 = (unint64_t)v18 >> 63;
  }
  else
  {
    unint64_t v21 = 0;
  }
  return v21 & a2;
}

BOOL timingsafe_enable_if_supported()
{
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    BOOL v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) != 0;
    __asm { MSR             DIT, #1 }
  }
  else
  {
    BOOL v0 = 0;
  }
  if ((MEMORY[0xFFFFFC010] & 0x200000000000) != 0)
  {
    sub_10000D5EC();
  }
  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }
  return v0;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000) != 0) {
    __asm { MSR             DIT, #0 }
  }
  return result;
}

void sub_10000D5EC()
{
  __asm { SB }
}

uint64_t AccelerateCrypto_ecb_AES_encrypt(long long *a1, int a2, uint64_t a3, int8x16_t *a4)
{
  uint64_t v4 = *((unsigned int *)a1 + 60);
  _VF = __OFSUB__(a2, 4);
  int v6 = a2 - 4;
  for (int8x16_t i = *(int8x16_t *)((char *)a1 + v4); v6 < 0 == _VF; v6 -= 4)
  {
    _Q4 = *a1;
    uint64_t v9 = 16;
    a3 += 64;
    do
    {
      __asm
      {
        AESE            V0.16B, V4.16B
        AESMC           V0.16B, V0.16B
        AESE            V1.16B, V4.16B
        AESMC           V1.16B, V1.16B
        AESE            V2.16B, V4.16B
        AESMC           V2.16B, V2.16B
        AESE            V3.16B, V4.16B
        AESMC           V3.16B, V3.16B
      }
      _Q4 = a1[(unint64_t)v9 / 0x10];
      v9 += 16;
    }
    while (v9 < v4);
    __asm
    {
      AESE            V0.16B, V4.16B
      AESE            V1.16B, V4.16B
      AESE            V2.16B, V4.16B
      AESE            V3.16B, V4.16B
    }
    *a4 = veorq_s8(_Q0, i);
    a4[1] = veorq_s8(_Q1, i);
    a4[2] = veorq_s8(_Q2, i);
    a4[3] = veorq_s8(_Q3, i);
    a4 += 4;
    _VF = __OFSUB__(v6, 4);
  }
  int v25 = v6 & 3;
  if (v25)
  {
    do
    {
      _Q4 = *a1;
      uint64_t v27 = 16;
      a3 += 16;
      do
      {
        __asm
        {
          AESE            V0.16B, V4.16B
          AESMC           V0.16B, V0.16B
        }
        _Q4 = a1[(unint64_t)v27 / 0x10];
        v27 += 16;
      }
      while (v27 < v4);
      __asm { AESE            V0.16B, V4.16B }
      *a4++ = veorq_s8(_Q0, i);
      _VF = __OFSUB__(v25--, 1);
    }
    while (!((v25 < 0) ^ _VF | (v25 == 0)));
  }
  return 0;
}

unint64_t ccec_export_affine_point_size(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      unint64_t result = ((unint64_t)(cczp_bitlen(a1) + 7) >> 2) | 1;
      break;
    case 3:
      unint64_t result = ccec_compressed_x962_export_pub_size(a1);
      break;
    case 4:
      unint64_t result = (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

uint64_t ccec_export_affine_point_public_value(unint64_t *a1, int a2, unint64_t *a3, unint64_t *a4, char *a5)
{
  unint64_t v10 = ccec_export_affine_point_size((uint64_t)a1, a2);
  if (!v10) {
    return 4294967289;
  }
  if (*a4 < v10) {
    return 4294967133;
  }
  *a4 = v10;
  unsigned int v11 = a2 - 1;
  if ((a2 - 1) <= 2) {
    *a5 = 0x20604u >> (8 * v11);
  }
  unint64_t v12 = *a1;
  if (a2 == 4) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = a5 + 1;
  }
  uint64_t v14 = cczp_bitlen((uint64_t)a1);
  if ((ccn_write_uint_padded_ct_internal(v12, a3, (unint64_t)(v14 + 7) >> 3, v13) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v11 <= 1)
  {
    uint64_t v15 = &v13[(unint64_t)(cczp_bitlen((uint64_t)a1) + 7) >> 3];
    unsigned long long v16 = &a3[*a1];
    uint64_t v17 = cczp_bitlen((uint64_t)a1);
    if ((ccn_write_uint_padded_ct_internal(v12, v16, (unint64_t)(v17 + 7) >> 3, v15) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t result = 0;
  if ((a2 & 0xFFFFFFFE) == 2) {
    *a5 |= a3[*a1] & 1;
  }
  return result;
}

unint64_t ccn_trailing_zeros(unint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    unint64_t v3 = v2 - 1;
    uint64_t v4 = (v2 << 6) - 64;
    do
    {
      unint64_t v5 = *(void *)(a2 + 8 * v3);
      uint64_t result = ((((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32) - 1) & result | (__clz(__rbit64(v5 | 0x8000000000000000))
                                                                                       + v4) & -(uint64_t)(((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32);
      --v3;
      v4 -= 64;
    }
    while (v3 < v2);
  }
  return result;
}

double ccn_shift_left(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64x2_t a5)
{
  uint64_t v5 = a2 + 8 * a1;
  uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(a4);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(a4 - 64);
  BOOL v8 = (unint64_t *)(a3 + 8 * a1 - 8);
  BOOL v9 = a1 == 4;
  BOOL v10 = a1 < 4;
  uint64_t v11 = a1 - 4;
  if (!v10)
  {
    if (v9)
    {
      v16.i64[0] = 0;
      v16.i64[1] = *(v8 - 3);
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v16, v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 3), v6));
      int8x16_t v17 = veorq_s8((int8x16_t)vshlq_u64(*((uint64x2_t *)v8 - 1), v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = v17;
      return *(double *)a5.i64;
    }
    do
    {
      uint64x2_t v12 = *(uint64x2_t *)(v8 - 3);
      uint64x2_t v13 = *(uint64x2_t *)(v8 - 1);
      uint64x2_t v14 = *((uint64x2_t *)v8 - 2);
      uint64x2_t v15 = *((uint64x2_t *)v8 - 1);
      v8 -= 4;
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v14, v7), (int8x16_t)vshlq_u64(v12, v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = veorq_s8((int8x16_t)vshlq_u64(v15, v7), (int8x16_t)vshlq_u64(v13, v6));
      v5 -= 32;
      BOOL v10 = v11 <= 4;
      v11 -= 4;
    }
    while (!v10);
  }
  uint64_t v18 = v11 & 3;
  if (!v18) {
    return *(double *)a5.i64;
  }
  if (v18 == 3)
  {
    uint64x2_t v19 = *((uint64x2_t *)v8 - 1);
  }
  else
  {
    if ((v18 & 2) == 0) {
      goto LABEL_13;
    }
    v19.i64[0] = 0;
    v19.i64[1] = *(v8 - 1);
  }
  a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6), (int8x16_t)vshlq_u64(v19, v7));
  v8 -= 2;
  *(uint64x2_t *)(v5 - 16) = a5;
  v5 -= 16;
LABEL_13:
  if (v18)
  {
    a5.i64[0] = *v8;
    a5.i64[0] = vshlq_u64(a5, v6).u64[0];
    *(void *)(v5 - 8) = a5.i64[0];
  }
  return *(double *)a5.i64;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t ccn_cond_add(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  uint64_t v12 = 0;
  if (a1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v15 = *a4++;
      uint64_t v14 = v15;
      uint64_t v17 = *a5++;
      uint64_t v16 = v17;
      BOOL v18 = __CFADD__(v12, v14);
      uint64_t v19 = v12 + v14;
      if (v18) {
        uint64_t v13 = 1;
      }
      BOOL v18 = __CFADD__(v19, v16);
      uint64_t v20 = v19 + v16;
      if (v18) {
        uint64_t v12 = v13 + 1;
      }
      else {
        uint64_t v12 = v13;
      }
      uint64_t v21 = v14 ^ v20;
      uint64_t v22 = v14 ^ mask;
      *a3 = v22;
      *a3++ = v21 & v11 ^ v21 & 0x5555555555555555 ^ v22 ^ mask;
      uint64_t v13 = 0;
      --a1;
    }
    while (a1);
  }
  return v12 & a2;
}

uint64_t cczp_is_quadratic_residue_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = cczp_n(a2);
  uint64_t v7 = *(void *)(a1 + 16);
  BOOL v8 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  BOOL v9 = (void *)cczp_prime(a2);
  ccn_set(v6, v8, v9);
  v8->i64[0] &= ~1uLL;
  BOOL v10 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccn_shift_right(v6, v10, v8, 1);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unsigned int v12 = cczp_power_fast_ws(a1, a2, v11, a3, (uint64_t)v10);
  cczp_from_ws(a1, a2);
  BOOL v13 = ccn_n(v6, v11) == 1 && *v11 == 1;
  uint64_t result = v13 & ~(((v12 | ((unint64_t)(int)v12 >> 32)) + 0xFFFFFFFF) >> 32);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccdrbg_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t ccdrbg_reseed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccdrbg_generate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t cczp_add_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  uint64_t v12 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v11);
  LOBYTE(a5) = ccn_add_ws(a1, v11, a3, a4, a5);
  BOOL v13 = (unint64_t *)cczp_prime(a2);
  BOOL v14 = ccn_sub_ws(a1, v11, v12, a3, v13);
  uint64_t result = ccn_mux(v11, !v14 | a5, a3, v12, a3);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_add_ws(uint64_t a1, uint64_t a2)
{
  return (**(uint64_t (***)(void))(a2 + 16))();
}

uint64_t cczp_div2_ws(uint64_t a1, uint64_t a2, int8x16_t *a3, uint64_t *a4)
{
  uint64_t v7 = cczp_n(a2);
  uint64_t v8 = *a4 & 1;
  BOOL v9 = (uint64_t *)cczp_prime(a2);
  uint64_t v10 = ccn_cond_add(v7, v8, a3->i64, a4, v9);
  uint64_t result = ccn_shift_right(v7, a3, a3, 1);
  a3->i64[v7 - 1] |= v10 << 63;
  return result;
}

uint64_t cczp_modn_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, char *a5)
{
  unint64_t v10 = cczp_n((uint64_t)a2);
  uint64_t v11 = v10;
  if ((a4 - 1) / v10 <= 1) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = (a4 - 1) / v10;
  }
  uint64_t v17 = a4;
  uint64_t v18 = *(void *)(a1 + 16);
  BOOL v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v19 = a5;
  ccn_set(v11, v13, a5);
  unint64_t v14 = v12 - 1;
  if (v12 != 1)
  {
    uint64_t v15 = &v19[8 * v11];
    do
    {
      ccn_set(v11, &v13[8 * v11], v15);
      cczp_mm_redc_ws(a1, a2, (uint64_t *)v13, (uint64_t *)v13);
      v15 += 8 * v11;
      --v14;
    }
    while (v14);
  }
  if (v17 != v12 * v11) {
    ccn_set(v17 - v12 * v11, &v13[8 * v11], &v19[8 * v12 * v11]);
  }
  ccn_zero(v11 - (v17 - v12 * v11), &v13[8 * v11 + 8 * (v17 - v12 * v11)]);
  cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
  do
  {
    ccn_mul_ws(a1, v11, (uint64_t)v13, (uint64_t)a3, (uint64_t)&a2[*a2 + 4]);
    uint64_t result = cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
    --v12;
  }
  while (v12);
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_mod_default_ws(uint64_t a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v8 = 2 * cczp_n((uint64_t)a2);

  return cczp_modn_ws(a1, a2, a3, v8, a4);
}

uint64_t cczp_mod_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 32))();
}

uint64_t cczp_mul_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v12 = cczp_n(a2);
  ccn_mul_ws(a1, v12, v11, a4, a5);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t cczp_mul_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 16))();
}

_OWORD *ccn_mulmod_p256(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  unint64_t v9 = *a3;
  unint64_t v10 = a3[1];
  uint64_t v8 = a3 + 2;
  unint64_t v11 = *v8;
  unint64_t v12 = v8[1];
  unint64_t v13 = v4 * v9;
  uint64_t v14 = (v5 * (unsigned __int128)v9) >> 64;
  uint64_t v15 = *v3 * v9;
  uint64_t v16 = (v6 * (unsigned __int128)v9) >> 64;
  unint64_t v18 = v9;
  uint64_t v17 = (__PAIR128__(v5, v4) * v9) >> 64;
  _BOOL1 v19 = __CFADD__(__CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9), v14);
  uint64_t v20 = __CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9) + v14;
  v19 |= __CFADD__(v15, v20);
  v20 += v15;
  uint64_t v21 = (v7 * (unsigned __int128)v9) >> 64;
  uint64_t v22 = (v7 * (unsigned __int128)v10) >> 64;
  BOOL v24 = v19;
  _BOOL1 v19 = __CFADD__(v19, v16);
  uint64_t v23 = v24 + v16;
  v19 |= __CFADD__(v7 * v9, v23);
  v23 += v7 * v9;
  BOOL v26 = v19;
  _BOOL1 v19 = __CFADD__(v19, v21);
  uint64_t v25 = v26 + v21;
  v19 |= __CFADD__(v7 * v10, v25);
  v25 += v7 * v10;
  uint64_t v27 = v7 * *v8;
  uint64_t v28 = (v7 * (unsigned __int128)v11) >> 64;
  BOOL v30 = v19;
  _BOOL1 v19 = __CFADD__(v19, v22);
  uint64_t v29 = v30 + v22;
  v19 |= __CFADD__(v27, v29);
  v29 += v27;
  BOOL v32 = v19;
  _BOOL1 v19 = __CFADD__(v19, v28);
  uint64_t v31 = v32 + v28;
  v19 |= __CFADD__(v7 * v12, v31);
  v31 += v7 * v12;
  uint64_t v33 = v19 + ((v7 * (unsigned __int128)v12) >> 64);
  uint64_t v34 = (v4 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v17, v4 * v10);
  uint64_t v35 = (__PAIR128__(v10, v18) * __PAIR128__(v5, v4)) >> 64;
  BOOL v37 = v19;
  _BOOL1 v19 = __CFADD__(v19, v20);
  uint64_t v36 = v37 + v20;
  v19 |= __CFADD__(v34, v36);
  v36 += v34;
  uint64_t v38 = (v6 * (unsigned __int128)v10) >> 64;
  BOOL v40 = v19;
  _BOOL1 v19 = __CFADD__(v19, v23);
  uint64_t v39 = v40 + v23;
  v19 |= __CFADD__(v6 * v10, v39);
  v39 += v6 * v10;
  BOOL v42 = v19;
  _BOOL1 v19 = __CFADD__(v19, v25);
  uint64_t v41 = v42 + v25;
  v19 |= __CFADD__(v38, v41);
  v41 += v38;
  uint64_t v43 = (v6 * (unsigned __int128)v12) >> 64;
  BOOL v45 = v19;
  _BOOL1 v19 = __CFADD__(v19, v29);
  uint64_t v44 = v45 + v29;
  v19 |= __CFADD__(v6 * v12, v44);
  v44 += v6 * v12;
  BOOL v47 = v19;
  _BOOL1 v19 = __CFADD__(v19, v31);
  uint64_t v46 = v47 + v31;
  v19 |= __CFADD__(v43, v46);
  v46 += v43;
  uint64_t v48 = v19 + v33;
  uint64_t v49 = (v5 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v36, v5 * v10);
  uint64_t v50 = v36 + v5 * v10;
  BOOL v52 = v19;
  _BOOL1 v19 = __CFADD__(v19, v39);
  uint64_t v51 = v52 + v39;
  v19 |= __CFADD__(v49, v51);
  v51 += v49;
  uint64_t v53 = (v6 * (unsigned __int128)v11) >> 64;
  BOOL v55 = v19;
  _BOOL1 v19 = __CFADD__(v19, v41);
  uint64_t v54 = v55 + v41;
  v19 |= __CFADD__(v6 * v11, v54);
  v54 += v6 * v11;
  BOOL v57 = v19;
  _BOOL1 v19 = __CFADD__(v19, v44);
  uint64_t v56 = v57 + v44;
  v19 |= __CFADD__(v53, v56);
  v56 += v53;
  BOOL v58 = v19;
  uint64_t v59 = (v4 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v50, v4 * v11);
  uint64_t v60 = v50 + v4 * v11;
  BOOL v62 = v19;
  _BOOL1 v19 = __CFADD__(v19, v51);
  uint64_t v61 = v62 + v51;
  v19 |= __CFADD__(v59, v61);
  v61 += v59;
  uint64_t v63 = (v5 * (unsigned __int128)v12) >> 64;
  BOOL v65 = v19;
  _BOOL1 v19 = __CFADD__(v19, v54);
  uint64_t v64 = v65 + v54;
  v19 |= __CFADD__(v5 * v12, v64);
  v64 += v5 * v12;
  BOOL v67 = v19;
  _BOOL1 v19 = __CFADD__(v19, v56);
  uint64_t v66 = v67 + v56;
  v19 |= __CFADD__(v63, v66);
  v66 += v63;
  uint64_t v68 = v19 + v58;
  uint64_t v69 = (v5 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v61, v5 * v11);
  uint64_t v70 = v61 + v5 * v11;
  BOOL v72 = v19;
  _BOOL1 v19 = __CFADD__(v19, v64);
  uint64_t v71 = v72 + v64;
  v19 |= __CFADD__(v69, v71);
  v71 += v69;
  uint64_t v73 = v19;
  uint64_t v74 = (v4 * (unsigned __int128)v12) >> 64;
  _BOOL1 v19 = __CFADD__(v70, v4 * v12);
  uint64_t v75 = v70 + v4 * v12;
  BOOL v77 = v19;
  _BOOL1 v19 = __CFADD__(v19, v71);
  uint64_t v76 = v77 + v71;
  v19 |= __CFADD__(v74, v76);
  v76 += v74;
  BOOL v79 = v19;
  _BOOL1 v19 = __CFADD__(v19, v66);
  uint64_t v78 = v79 + v66;
  v19 |= __CFADD__(v73, v78);
  v78 += v73;
  BOOL v81 = v19;
  _BOOL1 v19 = __CFADD__(v19, v46);
  uint64_t v80 = v81 + v46;
  v19 |= __CFADD__(v68, v80);
  v80 += v68;
  uint64_t v82 = v19 + v48;
  _BOOL1 v19 = __CFADD__(v35, v13 << 32);
  unint64_t v83 = v35 + (v13 << 32);
  BOOL v85 = v19;
  _BOOL1 v19 = __CFADD__(v19, v60);
  uint64_t v84 = v85 + v60;
  v19 |= __CFADD__(HIDWORD(v13), v84);
  v84 += HIDWORD(v13);
  BOOL v87 = v19;
  _BOOL1 v19 = __CFADD__(v19, v75);
  uint64_t v86 = v87 + v75;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v13, v86);
  v86 += 0xFFFFFFFF00000001 * v13;
  uint64_t v88 = v19 + ((v13 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v84, v83 << 32);
  unint64_t v89 = v84 + (v83 << 32);
  BOOL v91 = v19;
  _BOOL1 v19 = __CFADD__(v19, v86);
  uint64_t v90 = v91 + v86;
  v19 |= __CFADD__(HIDWORD(v83), v90);
  v90 += HIDWORD(v83);
  BOOL v93 = v19;
  _BOOL1 v19 = __CFADD__(v19, v76);
  uint64_t v92 = v93 + v76;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v83, v92);
  v92 += 0xFFFFFFFF00000001 * v83;
  uint64_t v94 = v19 + ((v83 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v90, v89 << 32);
  unint64_t v95 = v90 + (v89 << 32);
  BOOL v97 = v19;
  _BOOL1 v19 = __CFADD__(v19, v92);
  uint64_t v96 = v97 + v92;
  v19 |= __CFADD__(HIDWORD(v89), v96);
  v96 += HIDWORD(v89);
  BOOL v99 = v19;
  _BOOL1 v19 = __CFADD__(v19, v78);
  uint64_t v98 = v99 + v78;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v89, v98);
  v98 += 0xFFFFFFFF00000001 * v89;
  uint64_t v100 = v19 + ((v89 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v96, v95 << 32);
  uint64_t v101 = v96 + (v95 << 32);
  BOOL v103 = v19;
  _BOOL1 v19 = __CFADD__(v19, v98);
  uint64_t v102 = v103 + v98;
  v19 |= __CFADD__(HIDWORD(v95), v102);
  v102 += HIDWORD(v95);
  BOOL v105 = v19;
  _BOOL1 v19 = __CFADD__(v19, v80);
  uint64_t v104 = v105 + v80;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v95, v104);
  v104 += 0xFFFFFFFF00000001 * v95;
  uint64_t v106 = v19 + ((v95 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v88, v101);
  uint64_t v107 = v88 + v101;
  BOOL v109 = v19;
  _BOOL1 v19 = __CFADD__(v19, v94);
  uint64_t v108 = v109 + v94;
  v19 |= __CFADD__(v102, v108);
  v108 += v102;
  BOOL v111 = v19;
  _BOOL1 v19 = __CFADD__(v19, v100);
  unint64_t v110 = v111 + v100;
  v19 |= __CFADD__(v104, v110);
  v110 += v104;
  BOOL v113 = v19;
  _BOOL1 v19 = __CFADD__(v19, v106);
  uint64_t v112 = v113 + v106;
  v19 |= __CFADD__(v82, v112);
  v112 += v82;
  BOOL v114 = v19;
  _BOOL1 v19 = __CFADD__(v107++, 1);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v108, 0xFFFFFFFFLL, v19);
  uint64_t v115 = v108 - (!v113 + 0xFFFFFFFFLL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = v110 >= !v19;
  unint64_t v116 = v110 - !v113;
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v112, 0xFFFFFFFF00000001, v19);
  BOOL v117 = v114 - !v19;
  uint64_t v118 = v114 - !v19;
  _BOOL1 v19 = __CFADD__(__CFADD__(v107, v117), v115);
  uint64_t v119 = __CFADD__(v107, v117) + v115;
  *a1 = v107 + v117;
  a1[1] = v118 + v119;
  uint64_t result = a1 + 2;
  *uint64_t result = __PAIR128__(v117 & 0xFFFFFFFF00000001, v19 | __CFADD__(v118, v119))
          + __PAIR128__(v112 - ((unint64_t)!v113 - 0xFFFFFFFF), v116);
  return result;
}

uint64_t cczp_sqr_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = cczp_n(a2);
  unint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v8);
  ccn_sqr_ws(a1, v8, v9, a4);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t cczp_sqr_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 24))();
}

uint64_t cczp_prime(uint64_t a1)
{
  return a1 + 24;
}

uint64_t cczp_sub_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  BOOL v12 = ccn_sub_ws(a1, v11, a3, a4, a5);
  unint64_t v13 = (uint64_t *)cczp_prime(a2);
  uint64_t result = ccn_cond_add(v11, v12, a3, a3, v13);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sub_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 8))();
}

uint64_t sub_10000E404(int a1, unint64_t a2, char *buffer)
{
  if (a2)
  {
    unint64_t v4 = a2;
    do
    {
      if (v4 >= 0x100) {
        size_t v5 = 256;
      }
      else {
        size_t v5 = v4;
      }
      if (getentropy(buffer, v5) == -1) {
        cc_abort();
      }
      buffer += v5;
      v4 -= v5;
    }
    while (v4);
  }
  return 0;
}

uint64_t ccecdh_generate_key_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = ccec_generate_key_internal_fips_ws(a1, a2, a3, a4);
  if (!result)
  {
    if (ccecdh_pairwise_consistency_check_ws(a1, (unint64_t **)a4, 0, a3)) {
      uint64_t result = 4294967278;
    }
    else {
      uint64_t result = 0;
    }
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccecdh_generate_key(uint64_t *a1, uint64_t (**a2)(void, uint64_t, uint64_t *), uint64_t **a3)
{
  BOOL v16 = timingsafe_enable_if_supported();
  uint64_t v6 = *a1;
  uint64_t v7 = sizeof_struct_ccec_full_ctx();
  unint64_t v8 = sizeof_cc_unit();
  v14[0] = cc_malloc_clear(8 * ((v7 + v8 + 4 * v6 * v8 - 1) / v8 - v6 + 32 * v6));
  uint64_t v9 = *a1;
  uint64_t v10 = sizeof_struct_ccec_full_ctx();
  unint64_t v11 = sizeof_cc_unit();
  v14[1] = (v10 + v11 + 4 * v9 * v11 - 1) / v11 - v9 + 32 * v9;
  v14[2] = 0;
  v14[3] = cc_ws_alloc;
  uint64_t v15 = cc_ws_free;
  if (v14[0])
  {
    uint64_t key_ws = ccecdh_generate_key_ws((uint64_t)v14, a1, a2, a3);
    v15((uint64_t)v14);
  }
  else
  {
    uint64_t key_ws = 4294967283;
  }
  cc_disable_dit_with_sb((unsigned int *)&v16);
  return key_ws;
}

void *ccsha256_di()
{
  return &ccsha256_vng_arm_di;
}

uint64_t ccdrbg_df_derive_keys(uint64_t (**a1)(void), uint64_t a2, uint64_t a3, rsize_t a4, void *a5)
{
  uint64_t v7 = (*a1)();
  if (v7) {
    cc_clear(a4, a5);
  }
  return v7;
}

uint64_t ccdrbg_df_bc_derive_keys(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, void *a5)
{
  BOOL v32 = a5;
  uint64_t v9 = *(void **)(a1 + 8);
  size_t v10 = (*v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v33 = (char *)&v31 - v10;
  bzero((char *)&v31 - v10, v10);
  size_t v11 = (v9[1] + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v12 = (char *)&v31 - v11;
  unsigned int v13 = 0;
  if (a2)
  {
    uint64_t v14 = (uint64_t *)(a3 + 8);
    uint64_t v15 = a2;
    do
    {
      uint64_t v16 = *v14;
      v14 += 2;
      v13 += v16;
      --v15;
    }
    while (v15);
  }
  bzero(v12, v11);
  __src[0] = 0;
  __src[1] = 0;
  unsigned int v43 = bswap32(v13);
  unsigned int v44 = bswap32(a4);
  long long v41 = xmmword_100029FD0;
  memset(v40, 0, sizeof(v40));
  uint64_t v17 = *(void *)(a1 + 16);
  v39[0] = 0;
  v39[1] = 0;
  unint64_t v37 = v17 + 16;
  if (v17 == -16)
  {
LABEL_13:
    uint64_t v23 = v33;
    uint64_t inited = cccbc_init_internal((uint64_t)v9);
    uint64_t v25 = v32;
    if (!inited)
    {
      if (!a4)
      {
LABEL_26:
        uint64_t v29 = 0;
        goto LABEL_27;
      }
      BOOL v26 = (void *)((char *)v40 + *(void *)(a1 + 16));
      while (1)
      {
        uint64_t v27 = (uint64_t)v26;
        cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
        BOOL v26 = a4 <= 0xF ? v39 : v25;
        uint64_t inited = cccbc_update_internal(*(void *)(a1 + 8), (uint64_t)v23, (uint64_t)v12, 1, v27, (uint64_t)v26);
        if (inited) {
          break;
        }
        if (a4 <= 0xF) {
          memcpy(v25, v26, a4);
        }
        if (a4 >= 0x10) {
          uint64_t v28 = 16;
        }
        else {
          uint64_t v28 = a4;
        }
        uint64_t v25 = (void *)((char *)v25 + v28);
        a4 -= v28;
        if (!a4) {
          goto LABEL_26;
        }
      }
    }
    uint64_t v29 = inited;
    goto LABEL_27;
  }
  uint64_t v36 = a2;
  unsigned int v18 = 0;
  unint64_t v19 = 0;
  size_t v34 = 16 - (((_BYTE)v13 + 8) & 0xF);
  uint64_t v35 = (size_t *)(a3 + 8);
  while (1)
  {
    cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
    LODWORD(__src[0]) = bswap32(v18);
    uint64_t v38 = 0;
    uint64_t v20 = sub_10000E934(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, 0x18uLL, (char *)__src);
    if (v20) {
      break;
    }
    uint64_t v21 = v35;
    uint64_t v22 = v36;
    if (v36)
    {
      do
      {
        uint64_t v20 = sub_10000E934(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, *v21, (char *)*(v21 - 1));
        if (v20) {
          goto LABEL_28;
        }
        v21 += 2;
      }
      while (--v22);
    }
    uint64_t v20 = sub_10000E934(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, v34, (char *)&v41);
    if (v20) {
      break;
    }
    ++v18;
    v19 += 16;
    if (v19 >= v37)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      goto LABEL_13;
    }
  }
LABEL_28:
  uint64_t v29 = v20;
  uint64_t v23 = v33;
LABEL_27:
  cc_clear(**(void **)(a1 + 8), v23);
  cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
  return v29;
}

uint64_t sub_10000E934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, size_t __n, char *__src)
{
  uint64_t v7 = __src;
  size_t v8 = __n;
  unint64_t v14 = 16 - *a5;
  if (*a5) {
    BOOL v15 = __n >= v14;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    memcpy((void *)(a4 + *a5), __src, 16 - *a5);
    uint64_t result = cccbc_update_internal(a1, a2, a3, 1, a4, a4);
    if (result) {
      return result;
    }
    v8 -= v14;
    v7 += v14;
    *a5 = 0;
  }
  if (v8 < 0x10)
  {
LABEL_11:
    if (v8)
    {
      memcpy((void *)(a4 + *a5), v7, v8);
      uint64_t result = 0;
      *a5 += v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = cccbc_update_internal(a1, a2, a3, 1, (uint64_t)v7, a4);
      if (result) {
        break;
      }
      v8 -= 16;
      v7 += 16;
      if (v8 <= 0xF) {
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t ccdrbg_df_bc_init_internal(void *a1, void *a2, unint64_t a3)
{
  uint64_t v3 = 4294967291;
  if (a3 <= 0x20 && *a2 <= 0x200uLL)
  {
    if (a2[1] == 16)
    {
      *a1 = ccdrbg_df_bc_derive_keys;
      a1[1] = a2;
      a1[2] = a3;
      return cccbc_init_internal((uint64_t)a2);
    }
    else
    {
      return 4294967291;
    }
  }
  return v3;
}

void *cc_malloc_clear(size_t a1)
{
  unint64_t v2 = malloc(a1);
  uint64_t v3 = v2;
  if (v2) {
    bzero(v2, a1);
  }
  return v3;
}

uint64_t cc_ws_alloc(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1 + 8 * v2;
  unint64_t v5 = v2 + a2;
  a1[2] = v5;
  cc_try_abort_if (v5 > v3);
  return v4;
}

void cc_ws_free(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

uint64_t ccctr_context_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccctr_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t ccctr_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
}

uint64_t ccec_generate_key_internal_fips_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v8 = *a2;
  *a4 = a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = cczp_bitlen((uint64_t)a2);
  uint64_t result = (*a3)(a3, ((unint64_t)(v11 + 62) >> 3) & 0x1FFFFFFFFFFFFFF8, (uint64_t *)v10);
  if (!result)
  {
    uint64_t result = ccec_generate_scalar_fips_retry_ws(a1, a2, (uint64_t (**)(void, unint64_t, void *))a3, &a4[3 * **a4 + 2]);
    if (!result) {
      uint64_t result = ccec_make_pub_from_priv_ws(a1, a2, a3, (uint64_t)&a4[3 * **a4 + 2], 0, a4);
    }
  }
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t ccec_validate_point_and_projectify_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp_internal(v8, v9, a4) < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *a2;
  uint64_t v11 = a4 + 8 * *a2;
  uint64_t v12 = cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp_internal(v10, v12, v11) < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!result)
  {
    if (ccec_is_point_ws(a1, a2, a3)) {
      return 0;
    }
    else {
      return 4294967289;
    }
  }
  return result;
}

uint64_t ccn_cmp_asm(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  if (result)
  {
    unint64_t v3 = result;
    uint64_t result = 0;
    do
    {
      unint64_t v5 = *a2++;
      unint64_t v4 = v5;
      unint64_t v6 = *a3++;
      BOOL v7 = v4 >= v6;
      if (v4 > v6) {
        uint64_t result = 1;
      }
      if (!v7) {
        uint64_t result = -1;
      }
    }
    while (v3-- > 1);
  }
  return result;
}

uint64_t cc_disable_dit_with_sb(unsigned int *a1)
{
  return timingsafe_restore_if_supported(*a1);
}

void sub_10000EDD4(id a1, int a2)
{
  unsigned int v2 = MKBGetDeviceLockState();
  if (v2 <= 7 && ((1 << v2) & 0xB9) != 0)
  {
    unint64_t v3 = qword_10003A538;
    dispatch_semaphore_signal(v3);
  }
}

id sub_10000EE2C(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  BOOL v7 = +[NSMutableDictionary dictionary];
  if (v5)
  {
    uint64_t v8 = [v5 path];
    [v7 setObject:v8 forKeyedSubscript:kOSALogOptionOverridePath];
  }
  if (a3 != 0.0)
  {
    uint64_t v9 = +[NSNumber numberWithDouble:a3];
    [v7 setObject:v9 forKeyedSubscript:kOSALogOptionCaptureTime];
  }
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:kOSALogOptionOverrideFilePrefix];
  }
  [v7 setObject:@"ips" forKeyedSubscript:kOSALogOptionOverrideFileExtension];

  return v7;
}

uint64_t sub_10000EF44(uint64_t a1, const char *a2, _DWORD *a3)
{
  if (!a1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  if (!a2)
  {
LABEL_18:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_19:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!a3) {
    goto LABEL_19;
  }
  *a3 = 0;
  *(_OWORD *)path = *(_OWORD *)"IODeviceTree:/";
  long long v17 = unk_10002A100;
  long long v18 = xmmword_10002A110;
  long long v19 = unk_10002A120;
  __strlcat_chk();
  io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMainPortDefault, path);
  CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v6)
  {
    uint64_t v11 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      BOOL v15 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error creating CFString %s", (uint8_t *)&v14, 0xCu);
    }
    return 0xFFFFFFFFLL;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v5, v6, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v5);
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (void *)CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID()) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = 0;
  }
  CFRelease(v8);
  IOObjectRelease(v5);
  if (v10)
  {
    id v13 = v10;
    *a3 = *(_DWORD *)[v13 bytes];
  }
  return 0;
}

BOOL sub_10000F120(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  io_registry_entry_t v5 = @"OK";
  CFStringRef v6 = @"Cancel";
  if (!v3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_16:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!v4) {
    goto LABEL_16;
  }
  v21[0] = kCFUserNotificationAlertHeaderKey;
  v21[1] = kCFUserNotificationAlertMessageKey;
  v22[0] = v3;
  v22[1] = v4;
  v21[2] = kCFUserNotificationDefaultButtonTitleKey;
  void v22[2] = @"OK";
  BOOL v7 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  uint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  [v8 setObject:@"Cancel" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  SInt32 error = 0;
  CFTypeID v9 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, (CFDictionaryRef)v8);
  BOOL v10 = (BOOL)v9;
  SInt32 v11 = error;
  if (v9 && !error)
  {
    CFOptionFlags responseFlags = 0;
    SInt32 v12 = CFUserNotificationReceiveResponse(v9, 0.0, &responseFlags);
    if (!v12)
    {
      CFRelease((CFTypeRef)v10);
      BOOL v10 = (responseFlags & 3) == 0;
      goto LABEL_12;
    }
    SInt32 v13 = v12;
    int v14 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v19 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get response for tap to radar notification with error: %d", buf, 8u);
    }
    goto LABEL_10;
  }
  BOOL v15 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    LODWORD(responseFlags) = 67109120;
    HIDWORD(responseFlags) = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to display tap to radar notification with error: %d", (uint8_t *)&responseFlags, 8u);
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    CFRelease((CFTypeRef)v10);
    BOOL v10 = 0;
  }
LABEL_12:

  return v10;
}

void sub_10000F3A8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9)
{
  id v16 = a1;
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  if (!v16)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  if (!v17)
  {
LABEL_29:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_30:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!v18) {
    goto LABEL_30;
  }
  BOOL v24 = v23;
  if (objc_opt_class())
  {
    id v51 = v16;
    BOOL v52 = v24;
    uint64_t v25 = objc_opt_new();
    id v48 = v17;
    [v25 setTitle:v17];
    [v25 setProblemDescription:v18];
    BOOL v26 = v22;
    id v50 = v21;
    id v46 = v20;
    id v47 = v19;
    id v27 = [objc_alloc((Class)RadarComponent) initWithName:v19 version:v20 identifier:[v21 integerValue]];
    [v25 setComponent:v27];

    [v25 setClassification:2];
    [v25 setAutoDiagnostics:1];
    [v25 setIsUserInitiated:a9];
    id v28 = objc_alloc_init((Class)NSMutableArray);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v49 = v26;
    id v29 = v26;
    id v30 = [v29 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v59;
      do
      {
        for (int8x16_t i = 0; i != v31; int8x16_t i = (char *)i + 1)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(v29);
          }
          size_t v34 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v58 + 1) + 8 * i)];
          [v28 addObject:v34];
        }
        id v31 = [v29 countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v31);
    }

    [v25 setAttachments:v28];
    id v35 = objc_alloc_init((Class)NSMutableArray);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v36 = v52;
    id v37 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v38; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(v36);
          }
          long long v41 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*((void *)&v54 + 1) + 8 * (void)j) intValue]);
          [v35 addObject:v41];
        }
        id v38 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v38);
    }

    [v25 setKeywords:v35];
    BOOL v42 = +[TapToRadarService shared];
    id v53 = 0;
    id v16 = v51;
    [v42 createDraft:v25 forProcessNamed:0 withDisplayReason:v51 error:&v53];
    id v43 = v53;

    unsigned int v44 = qword_10003A5D8;
    if (v43)
    {
      id v19 = v47;
      id v17 = v48;
      id v20 = v46;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to create draft in Tap-to-Radar: %@", buf, 0xCu);
      }
    }
    else
    {
      id v19 = v47;
      id v17 = v48;
      id v20 = v46;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Received confirmation that a Tap-to-Radar draft has been started", buf, 2u);
      }
    }

    id v22 = v49;
    id v21 = v50;
    BOOL v24 = v52;
  }
  else
  {
    BOOL v45 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "TapToRadarService does not exist and thus we cannot start a radar", buf, 2u);
    }
  }
}

uint64_t sub_10000F84C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F85C(uint64_t a1)
{
}

void sub_10000F864(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = qword_10003A5D8;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to launch DR with error: %@.", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DR launched.", (uint8_t *)&v5, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

uint64_t sub_10000F968()
{
  BOOL v0 = @"stress-rack";
  if (qword_10003A548 != -1) {
    dispatch_once(&qword_10003A548, &stru_100034BB8);
  }
  if (dword_10003A544)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_10003A544, @"stress-rack", 0, 0);

    if (CFProperty)
    {
      CFRelease(CFProperty);
      return 1;
    }
  }
  else
  {
    id v3 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "NVRAM is not supported on this system", v4, 2u);
    }
  }
  return 0;
}

void sub_10000FA54(id a1)
{
  dword_10003A544 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

id sub_10000FA88()
{
  size_t size = 0;
  int v0 = sysctlbyname("kern.bootargs", 0, &size, 0, 0);
  if (v0)
  {
    int v1 = v0;
    uint64_t v2 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v3 = 0;
      goto LABEL_4;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v1;
    CFTypeID v9 = "Failed to query the size of the boot-args. Error: %d";
    goto LABEL_16;
  }
  if (!size) {
    goto LABEL_3;
  }
  int v5 = malloc_type_malloc(size, 0x8EFEDAF2uLL);
  if (!v5)
  {
    uint64_t v10 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_WORD *)buf = 0;
    CFTypeID v9 = "Failed to allocate memory for the boot-args";
    SInt32 v11 = v10;
    uint32_t v12 = 2;
LABEL_17:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
    goto LABEL_3;
  }
  id v6 = v5;
  int v7 = sysctlbyname("kern.bootargs", v5, &size, 0, 0);
  if (v7)
  {
    int v8 = v7;
    free(v6);
    uint64_t v2 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v8;
    CFTypeID v9 = "Failed to query the boot-args. Error: %d";
LABEL_16:
    SInt32 v11 = v2;
    uint32_t v12 = 8;
    goto LABEL_17;
  }
  id v3 = +[NSString stringWithUTF8String:v6];
  free(v6);
LABEL_4:

  return v3;
}

uint64_t sub_10000FC50(void *a1, void *a2, unint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v6)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_25:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  int v7 = v6;

  if (!a3) {
    goto LABEL_25;
  }
  *a3 = 0;
  if (v5)
  {
    int v8 = +[NSString stringWithFormat:@"(?:^|[ \t\r\n])%@=(0x[a-fA-F0-9]+|-?[0-9]+)(?:[ \t\r\n]|$)", v7];
    id v25 = 0;
    CFTypeID v9 = +[NSRegularExpression regularExpressionWithPattern:v8 options:0 error:&v25];
    id v10 = v25;
    if (v10)
    {
      SInt32 v11 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create a regex matching expression: %@", buf, 0xCu);
      }
      uint64_t v12 = 0;
    }
    else
    {
      int v14 = [v9 firstMatchInString:v5 options:0 range:[v5 length]];
      int v15 = v14;
      if (v14)
      {
        id v16 = [v14 rangeAtIndex:1];
        [v5 substringWithRange:v16, v17];
        __endptr = 0;
        id v18 = objc_claimAutoreleasedReturnValue();
        unint64_t v19 = strtoull((const char *)[v18 UTF8String], &__endptr, 0);
        id v20 = __endptr;
        if (*__endptr)
        {
          id v21 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v7;
            __int16 v28 = 2080;
            id v29 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to parse the value of the '%@' boot-arg as an integer. Remainder = '%s'", buf, 0x16u);
          }
          uint64_t v12 = 0;
        }
        else
        {
          *a3 = v19;
          uint64_t v12 = 1;
        }
      }
      else
      {
        id v22 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v7;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "boot-args NVRAM variable does not have a '%@'=<value> arg", buf, 0xCu);
        }
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    SInt32 v13 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "boot-args NVRAM variable is either not set or inaccessible", buf, 2u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_10000FF54(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    dword_10003A550 = v2 != 0;
  }
}

uint64_t sub_10000FFB0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) | byte_10003A540) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_10003A568 = result;
  return result;
}

void sub_10000FFFC(void *a1, unsigned char *a2, uint64_t a3)
{
  id v5 = a1;
  if (a3 >= 1)
  {
    unint64_t v6 = (unint64_t)&a2[a3];
    int v7 = (int)a2;
    int v8 = a2;
    do
    {
      if (*v8 == 10)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v10 = v7 - a2;
          __int16 v11 = 2080;
          uint64_t v12 = a2;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%.*s", buf, 0x12u);
        }
        a2 = v8 + 1;
      }
      else if (!*v8)
      {
        break;
      }
      ++v8;
      ++v7;
    }
    while ((unint64_t)v8 < v6);
  }
}

BOOL sub_100010118(void *a1)
{
  id v1 = a1;
  id v2 = [v1 bytes];
  id v3 = [v1 length];

  int v4 = sysctlbyname("kern.coredump_encryption_key", 0, 0, v2, (size_t)v3);
  if (v4)
  {
    id v5 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      int v7 = v5;
      int v8 = *__error();
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to notify kernel of new public encryption key. Error: %{errno}d", (uint8_t *)v9, 8u);
    }
  }
  return v4 == 0;
}

void sub_100010228(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = v1;
    id v3 = [v2 stringByDeletingLastPathComponent];
    int v4 = +[NSFileManager defaultManager];
    unsigned __int8 v5 = [v4 fileExistsAtPath:v2];

    unint64_t v6 = v2;
    if ((v5 & 1) == 0)
    {
      int v7 = [v3 stringByAppendingPathComponent:@"Retired"];
      int v8 = [v2 lastPathComponent];
      unint64_t v6 = [v7 stringByAppendingPathComponent:v8];
    }
    CFTypeID v9 = +[NSFileManager defaultManager];
    unsigned __int8 v10 = [v9 fileExistsAtPath:v6];

    if ((v10 & 1) == 0)
    {
      __int16 v11 = [v2 stringByAppendingString:@".synced"];

      uint64_t v12 = +[NSFileManager defaultManager];
      unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

      if (v13)
      {
        unint64_t v6 = v11;
      }
      else
      {
        int v14 = [v3 stringByAppendingPathComponent:@"Retired"];
        int v15 = [v11 lastPathComponent];
        unint64_t v6 = [v14 stringByAppendingPathComponent:v15];
      }
    }
    id v16 = +[NSFileManager defaultManager];
    unsigned int v17 = [v16 fileExistsAtPath:v6];

    uint64_t v18 = qword_10003A5D8;
    BOOL v19 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        int v24 = 138412290;
        id v25 = v6;
        id v20 = "attempting to discard safe log at %@";
        id v21 = v18;
        uint32_t v22 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, v22);
      }
    }
    else if (v19)
    {
      LOWORD(v24) = 0;
      id v20 = "no safe log will be discarded";
      id v21 = v18;
      uint32_t v22 = 2;
      goto LABEL_13;
    }
    id v23 = v6;
    unlink((const char *)[v23 UTF8String]);
  }
}

void sub_100010490(id a1)
{
  CFStringRef v1 = (const __CFString *)MGCopyAnswer();
  if (!v1)
  {
    BOOL v4 = 0;
    goto LABEL_5;
  }
  CFStringRef v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFStringGetTypeID())
  {
    BOOL v4 = CFEqual(v2, @"AppleDisplay");
LABEL_5:
    byte_10003A569 = v4;
    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

__CFString *sub_100010514(const char *a1, unsigned int a2)
{
  if (a1)
  {
    if (a2) {
      CFStringRef v2 = (__CFString *)[objc_alloc((Class)NSString) initWithBytesNoCopy:a1 length:strnlen(a1, a2) encoding:4 freeWhenDone:0];
    }
    else {
      CFStringRef v2 = &stru_100035440;
    }
    return v2;
  }
  else
  {
    _os_assert_log();
    uint64_t result = (__CFString *)_os_crash();
    __break(1u);
  }
  return result;
}

void sub_1000108A4(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 40);
}

void sub_100010900(io_registry_entry_t a1)
{
  kern_return_t v1;
  kern_return_t v2;
  NSObject *v3;
  _DWORD v4[2];

  if (a1)
  {
    CFStringRef v1 = IORegistryEntrySetCFProperty(a1, @"IOPMUBootErrorClear", &off_1000378B0);
    if (v1)
    {
      CFStringRef v2 = v1;
      CFTypeID v3 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v4[0] = 67109120;
        v4[1] = v2;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "failed to clear PMU boot-properties with error: %d", (uint8_t *)v4, 8u);
      }
      if (qword_10003A558 != -1) {
        dispatch_once(&qword_10003A558, &stru_100034BD8);
      }
      if (!dword_10003A550)
      {
        if (os_variant_has_internal_diagnostics())
        {
          _os_crash();
          __break(1u);
        }
      }
    }
  }
}

id sub_100010A14(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  id result = a2[5];
  a1[5] = result;
  return result;
}

id sub_100010A80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  v5[0] = @"bootStage";
  v5[1] = @"type";
  uint64_t v2 = *(void *)(a1 + 32);
  v6[0] = v1;
  v6[1] = v2;
  CFTypeID v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

id sub_100010B14(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  uint64_t v2 = *(void **)(a1 + 40);
  CFTypeID v3 = *(void **)(a1 + 48);
  BOOL v4 = *(void **)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  id v6 = v1;
  id v7 = v2;
  id v8 = v3;
  id v9 = v4;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:v9 forKeyedSubscript:@"bootStage"];
  [v10 setObject:v7 forKeyedSubscript:@"panicCount"];

  [v10 setObject:v8 forKeyedSubscript:@"otherResetCount"];
  [v10 setObject:v9 forKeyedSubscript:@"bootStage"];

  [v10 setObject:v5 forKeyedSubscript:@"resetType"];
  [v10 setObject:off_100039B48 forKeyedSubscript:@"bootAppHash"];
  if ([v6 containsObject:@"backpow"]) {
    __int16 v11 = &__kCFBooleanTrue;
  }
  else {
    __int16 v11 = &__kCFBooleanFalse;
  }
  [v10 setObject:v11 forKeyedSubscript:@"backpow"];
  if ([v6 containsObject:@"btn_rst"]) {
    uint64_t v12 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v12 = &__kCFBooleanFalse;
  }
  [v10 setObject:v12 forKeyedSubscript:@"btn_rst"];
  if ([v6 containsObject:@"btn_shdn"]) {
    unsigned __int8 v13 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v13 = &__kCFBooleanFalse;
  }
  [v10 setObject:v13 forKeyedSubscript:@"btn_shdn"];
  if ([v6 containsObject:@"chg_pok_fall"]) {
    int v14 = &__kCFBooleanTrue;
  }
  else {
    int v14 = &__kCFBooleanFalse;
  }
  [v10 setObject:v14 forKeyedSubscript:@"chg_pok_fall"];
  if ([v6 containsObject:@"cpu_therm"]) {
    int v15 = &__kCFBooleanTrue;
  }
  else {
    int v15 = &__kCFBooleanFalse;
  }
  [v10 setObject:v15 forKeyedSubscript:@"cpu_therm"];
  if ([v6 containsObject:@"crash"]) {
    id v16 = &__kCFBooleanTrue;
  }
  else {
    id v16 = &__kCFBooleanFalse;
  }
  [v10 setObject:v16 forKeyedSubscript:@"crash"];
  if ([v6 containsObject:@"dbg_rst"]) {
    unsigned int v17 = &__kCFBooleanTrue;
  }
  else {
    unsigned int v17 = &__kCFBooleanFalse;
  }
  [v10 setObject:v17 forKeyedSubscript:@"dbg_rst"];
  if ([v6 containsObject:@"force_off"]) {
    uint64_t v18 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v18 = &__kCFBooleanFalse;
  }
  [v10 setObject:v18 forKeyedSubscript:@"force_off"];
  if ([v6 containsObject:@"gpu_therm"]) {
    BOOL v19 = &__kCFBooleanTrue;
  }
  else {
    BOOL v19 = &__kCFBooleanFalse;
  }
  [v10 setObject:v19 forKeyedSubscript:@"gpu_therm"];
  if ([v6 containsObject:@"ntc_shdn"]) {
    id v20 = &__kCFBooleanTrue;
  }
  else {
    id v20 = &__kCFBooleanFalse;
  }
  [v10 setObject:v20 forKeyedSubscript:@"ntc_shdn"];
  if ([v6 containsObject:@"oc"]) {
    id v21 = &__kCFBooleanTrue;
  }
  else {
    id v21 = &__kCFBooleanFalse;
  }
  [v10 setObject:v21 forKeyedSubscript:@"oc"];
  if ([v6 containsObject:@"ot"]) {
    uint32_t v22 = &__kCFBooleanTrue;
  }
  else {
    uint32_t v22 = &__kCFBooleanFalse;
  }
  [v10 setObject:v22 forKeyedSubscript:@"ot"];
  if ([v6 containsObject:@"ov"]) {
    id v23 = &__kCFBooleanTrue;
  }
  else {
    id v23 = &__kCFBooleanFalse;
  }
  [v10 setObject:v23 forKeyedSubscript:@"ov"];
  if ([v6 containsObject:@"por"]) {
    int v24 = &__kCFBooleanTrue;
  }
  else {
    int v24 = &__kCFBooleanFalse;
  }
  [v10 setObject:v24 forKeyedSubscript:@"por"];
  if ([v6 containsObject:@"remote_pmic"]) {
    id v25 = &__kCFBooleanTrue;
  }
  else {
    id v25 = &__kCFBooleanFalse;
  }
  [v10 setObject:v25 forKeyedSubscript:@"remote_pmic"];
  if ([v6 containsObject:@"rst"]) {
    BOOL v26 = &__kCFBooleanTrue;
  }
  else {
    BOOL v26 = &__kCFBooleanFalse;
  }
  [v10 setObject:v26 forKeyedSubscript:@"rst"];
  if ([v6 containsObject:@"sgpio"]) {
    id v27 = &__kCFBooleanTrue;
  }
  else {
    id v27 = &__kCFBooleanFalse;
  }
  [v10 setObject:v27 forKeyedSubscript:@"sgpio"];
  if ([v6 containsObject:@"sochot"]) {
    __int16 v28 = &__kCFBooleanTrue;
  }
  else {
    __int16 v28 = &__kCFBooleanFalse;
  }
  [v10 setObject:v28 forKeyedSubscript:@"sochot"];
  if ([v6 containsObject:@"spmi"]) {
    id v29 = &__kCFBooleanTrue;
  }
  else {
    id v29 = &__kCFBooleanFalse;
  }
  [v10 setObject:v29 forKeyedSubscript:@"spmi"];
  if ([v6 containsObject:@"sstate"]) {
    id v30 = &__kCFBooleanTrue;
  }
  else {
    id v30 = &__kCFBooleanFalse;
  }
  [v10 setObject:v30 forKeyedSubscript:@"sstate"];
  if ([v6 containsObject:@"timeout"]) {
    id v31 = &__kCFBooleanTrue;
  }
  else {
    id v31 = &__kCFBooleanFalse;
  }
  [v10 setObject:v31 forKeyedSubscript:@"timeout"];
  if ([v6 containsObject:@"upc_reset"]) {
    uint64_t v32 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v32 = &__kCFBooleanFalse;
  }
  [v10 setObject:v32 forKeyedSubscript:@"upc_reset"];
  if ([v6 containsObject:@"uv"]) {
    uint64_t v33 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v33 = &__kCFBooleanFalse;
  }
  [v10 setObject:v33 forKeyedSubscript:@"uv"];
  if ([v6 containsObject:@"vdd_hi_and_chg_pok"]) {
    size_t v34 = &__kCFBooleanTrue;
  }
  else {
    size_t v34 = &__kCFBooleanFalse;
  }
  [v10 setObject:v34 forKeyedSubscript:@"vdd_hi_and_chg_pok"];
  unsigned int v35 = [v6 containsObject:@"wdog"];

  if (v35) {
    id v36 = &__kCFBooleanTrue;
  }
  else {
    id v36 = &__kCFBooleanFalse;
  }
  [v10 setObject:v36 forKeyedSubscript:@"wdog"];

  return v10;
}

void sub_10001102C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[OSASystemConfiguration sharedInstance];
  id v6 = [v5 crashReporterKey];
  id v7 = OSADateFormat();
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 72) componentsJoinedByString:@" "];
  id v11 = [*(id *)(a1 + 64) unsignedIntValue];
  id v13 = +[NSString stringWithFormat:@"Incident Identifier: %@\nCrashReporter Key:   %@\nDate: %@\nReset count: %@\nBoot failure count: %@\nBoot faults: %@\nBoot stage: 0x%x\nBoot app: %@\nsocId: %x\nsocRevision: %x", v3, v6, v7, v8, v9, v10, v11, off_100039B48, *(unsigned int *)(a1 + 96), *(unsigned int *)(a1 + 100)];

  uint64_t v12 = [v13 dataUsingEncoding:4 allowLossyConversion:1];
  [v4 writeData:v12];
}

void sub_10001116C(uint64_t a1)
{
}

id sub_100011174(uint64_t a1, uint64_t a2)
{
  return sub_100010A14((void *)(a1 + 48), (id *)(a2 + 48));
}

void sub_100011180(uint64_t a1)
{
}

id sub_100011188(uint64_t a1, uint64_t a2)
{
  return sub_100010A14((void *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t sub_100011194()
{
  if (qword_10003A588 != -1) {
    dispatch_once(&qword_10003A588, &stru_100034D10);
  }
  return qword_10003A578;
}

void sub_1000111DC(id a1)
{
  LOWORD(qword_10003A578) = 0;
  BYTE2(qword_10003A578) = 0;
  qword_10003A580 = 0;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t v15 = 0;
    uint64_t v1 = sub_10000FA88();
    sub_10000FC50(v1, @"dumppanic", &v15);

    LOBYTE(qword_10003A578) = v15 & 1;
    if (v15)
    {
      uint64_t v2 = +[NSFileManager defaultManager];
      if ([v2 fileExistsAtPath:@"/var/tmp/dumppanic"])
      {
        id v14 = 0;
        unsigned __int8 v3 = [v2 removeItemAtPath:@"/var/tmp/dumppanic" error:&v14];
        id v4 = v14;
        if ((v3 & 1) == 0)
        {
          id v5 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = @"/var/tmp/dumppanic";
            __int16 v17 = 2112;
            id v18 = v4;
            _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to remove directory: %@ -> %@", buf, 0x16u);
          }
        }
      }
      else
      {
        id v4 = 0;
      }
      id v13 = v4;
      unsigned __int8 v6 = [v2 createDirectoryAtPath:@"/var/tmp/dumppanic" withIntermediateDirectories:1 attributes:0 error:&v13];
      id v7 = v13;

      if ((v6 & 1) == 0)
      {
        uint64_t v8 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"/var/tmp/dumppanic";
          __int16 v17 = 2112;
          id v18 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create directory: %@ -> %@", buf, 0x16u);
        }
      }
    }
    *(void *)buf = 0;
    uint64_t v9 = sub_10000FA88();
    int v10 = sub_10000FC50(v9, @"BATS_TESTPLAN_ID", (unint64_t *)buf);

    if (v10) {
      qword_10003A580 = *(void *)buf;
    }
    if (sub_10000F968())
    {
      char v11 = 1;
    }
    else
    {
      if (v10) {
        BOOL v12 = *(void *)buf == 0;
      }
      else {
        BOOL v12 = 1;
      }
      char v11 = !v12;
    }
    BYTE1(qword_10003A578) = v11;
    BYTE2(qword_10003A578) = (v15 & 2) != 0;
  }
}

BOOL sub_100011468(void *a1, const void *a2, size_t a3)
{
  id v5 = a1;
  if (!v5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  unsigned __int8 v6 = v5;

  if (!a2)
  {
LABEL_14:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_15:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!a3) {
    goto LABEL_15;
  }
  if (a3 > 0x240000)
  {
    id v7 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      size_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Paniclog data size (%llu bytes) size greater than max buffer size. Truncating.", (uint8_t *)&v12, 0xCu);
    }
    a3 = 2359296;
  }
  id v8 = [v6 path];
  uint64_t v9 = fopen((const char *)[v8 UTF8String], "w");

  if (v9)
  {
    fwrite(a2, a3, 1uLL, v9);
    fclose(v9);
  }
  else
  {
    int v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      size_t v13 = (size_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to open file: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v9 != 0;
}

uint64_t sub_10001161C(uint64_t a1)
{
  int v1 = a1;
  if ((a1 - 101) <= 0xFFFFFF9B)
  {
    +[NSString stringWithFormat:@"Implausible embedded panic header version: %d", a1];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    _os_crash();
    __break(1u);
  }
  if ((a1 - 1) < 6) {
    return *(unsigned int *)&asc_10002A130[4 * (a1 - 1)];
  }
  unsigned __int8 v3 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v5 = v1;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unknown embedded panic header version: %d", buf, 8u);
  }
  return 177;
}

__CFString *sub_100011718(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    unint64_t v4 = 0;
    int v5 = &stru_100035440;
    do
    {
      unsigned __int8 v6 = +[NSString stringWithFormat:@"%02hhx%02hhx", *(unsigned __int8 *)(a1 + v4), *(unsigned __int8 *)(a1 + v4 + 1)];
      id v7 = [(__CFString *)v5 stringByAppendingString:v6];

      v4 += 2;
      int v5 = v7;
    }
    while (v2 > v4);
  }
  else
  {
    id v7 = &stru_100035440;
  }

  return v7;
}

void sub_1000117E8(_DWORD *a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (a1[2] <= 4u)
  {
    *a4 = 0;
    uint64_t v5 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v20) = 0;
    unsigned __int8 v6 = "Extensible Paniclog not supported. Skipping.";
    id v7 = v5;
    uint32_t v8 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
    return;
  }
  int v12 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = *(_DWORD *)((char *)a1 + 161);
    int v14 = *(_DWORD *)((char *)a1 + 165);
    int v20 = 67109376;
    unsigned int v21 = v13;
    __int16 v22 = 1024;
    int v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Extensible Paniclog offset %u Length %u", (uint8_t *)&v20, 0xEu);
  }
  unsigned int v15 = *(_DWORD *)((char *)a1 + 165);
  if ((v15 - 1) >> 15)
  {
    uint64_t v19 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v20 = 67109120;
    unsigned int v21 = v15;
    unsigned __int8 v6 = "Did not find a valid ext paniclog. Found with length: %d";
    id v7 = v19;
    uint32_t v8 = 8;
    goto LABEL_15;
  }
  unint64_t v16 = *(unsigned int *)((char *)a1 + 161);
  __int16 v17 = qword_10003A5D8;
  if (v16 < a3 && v16 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      unsigned int v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "found ext paniclog with %u bytes", (uint8_t *)&v20, 8u);
      unint64_t v16 = *(unsigned int *)((char *)a1 + 161);
      unsigned int v15 = *(_DWORD *)((char *)a1 + 165);
    }
    *a4 = +[NSData dataWithBytesNoCopy:a2 + v16 length:v15 freeWhenDone:0];
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    int v20 = 67109376;
    unsigned int v21 = v15;
    __int16 v22 = 1024;
    int v23 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "invalid extensible paniclog eph_ext_paniclog_len %u eph_ext_paniclog_offset %u,", (uint8_t *)&v20, 0xEu);
  }
}

void sub_100011A48(_DWORD *a1, uint64_t a2, unint64_t a3, void *a4)
{
  unsigned int v8 = a1[2];
  uint64_t v9 = qword_10003A5D8;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v8 <= 5)
  {
    if (!v10) {
      return;
    }
    LOWORD(v21) = 0;
    char v11 = "Panic Initiator not supported. Skipping.";
    int v12 = v9;
    uint32_t v13 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v21, v13);
    return;
  }
  if (v10)
  {
    unsigned int v14 = *(_DWORD *)((char *)a1 + 169);
    int v15 = *(_DWORD *)((char *)a1 + 173);
    int v21 = 67109376;
    unsigned int v22 = v14;
    __int16 v23 = 1024;
    int v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Panic Initiator offset %u Length %u", (uint8_t *)&v21, 0xEu);
  }
  unsigned int v16 = *(_DWORD *)((char *)a1 + 173);
  if (v16 - 1 > 0xFF)
  {
    uint64_t v20 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v21 = 67109120;
    unsigned int v22 = v16;
    char v11 = "Did not find a valid panic initiator. Found with length: %d";
    int v12 = v20;
    uint32_t v13 = 8;
    goto LABEL_15;
  }
  unint64_t v17 = *(unsigned int *)((char *)a1 + 169);
  id v18 = qword_10003A5D8;
  if (v17 < a3 && v17 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109120;
      unsigned int v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "found panic initiator with %u bytes", (uint8_t *)&v21, 8u);
      unint64_t v17 = *(unsigned int *)((char *)a1 + 169);
      unsigned int v16 = *(_DWORD *)((char *)a1 + 173);
    }
    sub_100010514((const char *)(a2 + v17), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    int v21 = 67109376;
    unsigned int v22 = v16;
    __int16 v23 = 1024;
    int v24 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "invalid panic initiator eph_panic_initiator_len %u eph_panic_initiator_offset %u,", (uint8_t *)&v21, 0xEu);
  }
}

void sub_100011C84(unsigned int *a1, unint64_t a2, void *a3, void *a4, void *a5, PanicReport *a6, uint64_t *a7, void *a8, double a9, void *a10)
{
  id v14 = a3;
  int v15 = a5;
  id v16 = a8;
  unint64_t v17 = a10;
  id v18 = objc_opt_new();
  uint64_t v19 = +[NSString stringWithFormat:@"Source: %@", 0];
  [v18 addObject:v19];

  if (v15)
  {
    uint64_t v20 = +[NSString stringWithFormat:](NSString, @"OTA UUID: %.*s\n", [v15 length], objc_msgSend(v15, "bytes"));
    [v18 addObject:v20];
  }
  v285 = v16;
  v270 = v17;
  v288 = v18;
  v289 = a1;
  if (a1 && a2 >= 0xB1 && *a1 == 1179995723)
  {
    unint64_t v21 = (unint64_t)v14;
    v273 = 0;
    v274 = 0;
    unsigned int v22 = 0;
    unint64_t v23 = a2;
    int v24 = a1;
    goto LABEL_15;
  }
  unint64_t v21 = (unint64_t)v14;
  unsigned int v22 = 0;
  v273 = 0;
  unint64_t v23 = 0;
  int v24 = 0;
  if (!a1)
  {
    v274 = 0;
    goto LABEL_15;
  }
  v274 = 0;
  if (a2 >= 8)
  {
    if (*a1 != 1346717008)
    {
      BOOL v26 = +[NSString stringWithFormat:@"iBoot panic header magic invalid: found 0x%x, expected 0x%x", *a1, 1346717008];
      BOOL v65 = qword_10003A5D8;
      id v25 = (id)v21;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      [v18 addObject:v26];
      if (byte_10003A598) {
        uint64_t v66 = @"iBoot header contained bad magic (possible legacy panic data)";
      }
      else {
        uint64_t v66 = @"iBoot header contained bad magic";
      }
      id v29 = [(id)v21 path];
      sub_100014538(v66, v18, (uint64_t)a4, v29, a6, a7, a9);
      __int16 v28 = v285;
      goto LABEL_189;
    }
    id v25 = (id)v21;
    if (a1[1] - 6 <= 0xFFFFFFFA)
    {
      BOOL v26 = +[NSString stringWithFormat:@"iBoot panic header indicates invalid number of logs available (%d)", a1[1]];
      id v27 = qword_10003A5D8;
      __int16 v28 = v285;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      [v18 addObject:v26];
      id v29 = [v25 path];
      sub_100014538(@"iBoot header contains invalid number of logs", v18, (uint64_t)a4, v29, a6, a7, a9);
      goto LABEL_189;
    }
    uint64_t v82 = (id)qword_10003A5D8;
    __int16 v28 = v285;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v83 = a1[1];
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v83;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "iBoot panic header indicates %d panic logs available", (uint8_t *)&buf, 8u);
    }

    uint64_t v84 = a1[1];
    if (!v84) {
      goto LABEL_199;
    }
    unint64_t v280 = (unint64_t)v25;
    unsigned int v85 = 0;
    int v86 = 0;
    unsigned int v22 = 0;
    v273 = 0;
    v274 = 0;
    BOOL v87 = (Bytef **)(a1 + 6);
    while (1)
    {
      int v88 = *((_DWORD *)v87 - 4);
      switch(v88)
      {
        case 4:
          BOOL v91 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v92 = *v87;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v92;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Found SOCD container with length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v86;
          v273 = v87 - 2;
          break;
        case 2:
          BOOL v93 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v94 = *v87;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v94;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Found storage dump log of length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v86;
          v274 = v87 - 2;
          break;
        case 0:
          unint64_t v89 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v90 = *v87;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v90;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Found embedded panic log of length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v86;
          unsigned int v22 = v87 - 2;
          goto LABEL_85;
        default:
          unint64_t v95 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            int v96 = *((_DWORD *)v87 - 4);
            BOOL v97 = *v87;
            LODWORD(buf.next_in) = 67109376;
            HIDWORD(buf.next_in) = v96;
            LOWORD(buf.avail_in) = 2048;
            *(void *)((char *)&buf.avail_in + 2) = v97;
            _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Found panic log of unknown type (%d) length 0x%llx", (uint8_t *)&buf, 0x12u);
          }

          break;
      }
      a1 = v289;
LABEL_85:
      uint64_t v84 = a1[1];
      ++v85;
      v87 += 3;
      if (v85 >= v84)
      {
        __int16 v28 = v285;
        if (v86)
        {
          unint64_t v23 = 0;
          int v24 = 0;
          unint64_t v21 = v280;
          unint64_t v17 = v270;
          break;
        }
        unint64_t v17 = v270;
        id v18 = v288;
LABEL_199:
        BOOL v26 = +[NSString stringWithFormat:@"Unable to find usable panic log after traversing %d iBoot metadata logs", v84];
        v191 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
        }
        [v18 addObject:v26];
        id v29 = [v25 path];
        sub_100014538(@"No usable panic logs available from iBoot headers", v18, (uint64_t)a4, v29, a6, a7, a9);
LABEL_189:

        return;
      }
    }
  }
LABEL_15:
  v282 = (Bytef *)v23;
  char v30 = sub_100011194();
  char v31 = v30;
  if (v17 && (v30 & 1) != 0)
  {
    uint64_t v32 = +[NSURL fileURLWithPathComponents:&off_100037BC8];
    uint64_t v33 = v17;
    if (!sub_100011468(v32, [(__CFString *)v33 bytes], (size_t)[(__CFString *)v33 length]))
    {
      size_t v34 = (id)qword_10003A5D8;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v32;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "failed to write fallback data to file: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    a1 = v289;
  }
  id v281 = objc_alloc_init((Class)NSMutableDictionary);
  if (v22)
  {
    unsigned int v35 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = v22[2];
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found embedded panic log of length 0x%llx", (uint8_t *)&buf, 0xCu);
    }

    if (v31)
    {
      id v37 = +[NSURL fileURLWithPathComponents:&off_100037BE0];
      if (!sub_100011468(v37, &v22[1][(void)a1], (size_t)v22[2]))
      {
        id v38 = (id)qword_10003A5D8;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "failed to write embedded panic data to file: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    int v39 = *((_DWORD *)v22 + 1);
    if ((v39 & 2) != 0)
    {
      unint64_t v17 = @"BAD MAGIC! (flag set in iBoot panic header), no panic log available";
      BOOL v40 = (Bytef *)v288;
    }
    else
    {
      BOOL v40 = (Bytef *)v288;
      if ((v39 & 4) != 0)
      {
        long long v41 = +[NSString stringWithFormat:@"iBoot indicates CRC mismatch"];
        [v288 addObject:v41];
      }
      id v300 = 0;
      int v42 = sub_1000146DC((unsigned int *)v22, a2, &v300);
      unint64_t v17 = (__CFString *)v300;
      if (!v42)
      {
        v282 = v22[2];
        id v43 = (unsigned int *)&v22[1][(void)v289];
LABEL_42:
        id v25 = (id)v21;
        *(void *)a6->OSAStackShotReport_opaque = +[NSString stringWithFormat:@"%@\n%@", v17, 0];
        uint64_t v50 = 1;
        v271 = @"panic";
LABEL_43:
        uint64_t v49 = v282;
        goto LABEL_44;
      }
    }
    id v43 = v24;
    goto LABEL_42;
  }
  if (!v17)
  {
    uint64_t v50 = 0;
    v271 = @"panic";
    BOOL v40 = (Bytef *)v288;
    id v43 = v24;
    id v25 = (id)v21;
    goto LABEL_43;
  }
  unsigned int v44 = (void *)qword_10003A5D8;
  BOOL v40 = (Bytef *)v288;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v45 = v44;
    id v46 = (Bytef *)[(__CFString *)v17 length];
    LODWORD(buf.next_in) = 134217984;
    *(Bytef **)((char *)&buf.next_in + 4) = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Falling back to corefile embedded panic log of length 0x%lx", (uint8_t *)&buf, 0xCu);
  }
  id v47 = +[NSString stringWithFormat:@"DRAM panic log missing; corefile fallback log in use"];
  [v288 addObject:v47];

  id v48 = v17;
  id v43 = (unsigned int *)[(__CFString *)v48 bytes];
  uint64_t v49 = (Bytef *)[(__CFString *)v48 length];
  unint64_t v17 = 0;
  uint64_t v50 = 1;
  v271 = @"interrupted coredump panic";
  id v25 = (id)v21;
LABEL_44:
  v277 = v43;
  v279 = v25;
  v283 = v49;
  v268 = v15;
  int v258 = v50;
  if (!v43 || !v49)
  {

    int v265 = 0;
    long long v61 = 0;
    uint64_t v57 = 0;
    id v25 = 0;
    BOOL v40 = 0;
    id v62 = 0;
    int v15 = 0;
    id v63 = 0;
    CFStringRef v64 = @"embedded panic data not available";
    goto LABEL_105;
  }
  id v298 = 0;
  id v51 = v40;
  id v52 = v281;
  id v53 = v51;
  if (!v53)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_294;
  }
  long long v54 = v53;

  id v55 = v52;
  if (!v55)
  {
LABEL_294:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_295;
  }
  v269 = v55;

  id v299 = 0;
  long long v56 = qword_10003A5D8;
  v264 = v17;
  if ((unint64_t)v283 <= 0xB0)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "rejecting implausible buffer!", (uint8_t *)&buf, 2u);
    }
    int v265 = 0;
    v262 = 0;
    uint64_t v57 = 0;
    id v58 = 0;
    long long v59 = 0;
    uint64_t v50 = 0;
    long long v60 = 0;
LABEL_91:
    uint64_t v100 = v269;
    goto LABEL_103;
  }
  v261 = v54;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    uInt v67 = *v43;
    unsigned int v68 = v43[2];
    uint64_t v69 = *(Bytef **)(v43 + 3);
    LODWORD(v260) = v43[5];
    unsigned int v263 = v43[6];
    uint64_t v70 = (const char *)(v43 + 13);
    unsigned int v71 = v43[9];
    unsigned int v266 = v277[10];
    BOOL v72 = v56;
    sub_100010514(v70, 0x20u);
    uint64_t v73 = (internal_state *)objc_claimAutoreleasedReturnValue();
    sub_100010514((const char *)v277 + 84, 0x20u);
    uint64_t v74 = (voidpf (__cdecl *)(voidpf, uInt, uInt))objc_claimAutoreleasedReturnValue();
    uint64_t v75 = sub_100010514((const char *)v277 + 116, 0x25u);
    uint64_t v76 = *(void *)((char *)v277 + 153);
    LODWORD(buf.next_in) = 134220802;
    *(Bytef **)((char *)&buf.next_in + 4) = v283;
    *((_WORD *)&buf.avail_in + 2) = 1024;
    *(uInt *)((char *)&buf.avail_in + 6) = v67;
    WORD1(buf.total_in) = 1024;
    HIDWORD(buf.total_in) = v68;
    LOWORD(buf.next_out) = 2048;
    *(Bytef **)((char *)&buf.next_out + 2) = v69;
    HIWORD(buf.avail_out) = 1024;
    *(&buf.avail_out + 1) = v260;
    LOWORD(buf.total_out) = 1024;
    *(_DWORD *)((char *)&buf.total_out + 2) = v263;
    HIWORD(buf.total_out) = 1024;
    LODWORD(buf.msg) = v71;
    id v43 = v277;
    WORD2(buf.msg) = 1024;
    *(_DWORD *)((char *)&buf.msg + 6) = v266;
    WORD1(buf.state) = 2112;
    *(internal_state **)((char *)&buf.state + 4) = v73;
    WORD2(buf.zalloc) = 2112;
    *(alloc_func *)((char *)&buf.zalloc + 6) = v74;
    HIWORD(buf.zfree) = 2112;
    buf.opaque = v75;
    LOWORD(buf.data_type) = 2048;
    *(void *)((char *)&buf.data_type + 2) = v76;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "(embedded) length: %zu eph: magic %08X vers %u flags 0x%016llX panic_log offset %u, len %u, other_log offset %u, len %u, osversion: %@, macosversion: %@, bootsessionuuid: %@, roots_installed: %lld", (uint8_t *)&buf, 0x62u);
  }
  unint64_t v21 = *v43;
  if (v21 != 1179995723)
  {
    uint64_t v98 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "invalid eph_magic 0x%08X", (uint8_t *)&buf, 8u);
      unint64_t v21 = *v43;
    }
    BOOL v99 = +[NSString stringWithFormat:@"Embedded panic header contains invalid magic, expected 0x%x found 0x%x", 1179995723, v21];
    [(Bytef *)v54 addObject:v99];

    int v265 = 0;
    v262 = 0;
    uint64_t v57 = 0;
    id v58 = 0;
    long long v59 = 0;
    uint64_t v50 = 0;
    long long v60 = @"Embedded panic log header contained bad magic";
    goto LABEL_91;
  }
  BOOL v77 = *(id **)(v43 + 3);
  sub_100010514((const char *)v43 + 116, 0x25u);
  v260 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  sub_100010514((const char *)v43 + 52, 0x20u);
  id v78 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = *(void *)((char *)v43 + 153);
  v262 = v77;
  if (!v43[6])
  {
    uint64_t v81 = 0;
    goto LABEL_99;
  }
  BOOL v79 = v43;
  unsigned int v80 = v43[5];
  if (v80 < sub_10001161C(v79[2]))
  {
    uint64_t v81 = v79[6];
    id v43 = v79;
    long long v54 = v261;
LABEL_99:
    unint64_t v110 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      uInt v111 = v43[5];
      LODWORD(buf.next_in) = 67109632;
      HIDWORD(buf.next_in) = v81;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v111;
      *((_WORD *)&buf.avail_in + 3) = 2048;
      buf.total_in = (uLong)v283;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "invalid eph_panic_log_len %u eph_panic_log_offset %u, embedded_panic_length %lu", (uint8_t *)&buf, 0x18u);
      uint64_t v112 = v283;
      long long v54 = v261;
      uint64_t v81 = v43[6];
    }
    else
    {
      uint64_t v112 = v283;
    }
    uint64_t v50 = (uint64_t)v260;
    BOOL v113 = +[NSString stringWithFormat:@"Embedded panic header doesn't contain valid panic log: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu", v81, v43[5], v112];
    [(Bytef *)v54 addObject:v113];

    int v265 = 0;
    id v58 = 0;
    long long v60 = @"Embedded panic log header contains invalid panic log offset";
    uint64_t v100 = v269;
    long long v59 = v78;
    goto LABEL_103;
  }
  unint64_t v101 = v79[5];
  uint64_t v81 = v79[6];
  id v43 = v79;
  long long v54 = v261;
  if ((unint64_t)v283 <= v101) {
    goto LABEL_99;
  }
  uint64_t v102 = +[NSNumber numberWithUnsignedLongLong:v81];
  [v269 setObject:v102 forKey:@"PanicLogLengthInBytes"];

  BOOL v103 = +[NSNumber numberWithUnsignedLongLong:v43[10]];
  [v269 setObject:v103 forKey:@"OtherLogLengthInBytes"];

  uint64_t v104 = +[NSNumber numberWithUnsignedLongLong:v43[8]];
  [v269 setObject:v104 forKey:@"StackshotLengthInBytes"];

  BOOL v105 = v43;
  int v106 = v43[10] + v43[6] + v43[8];
  uint64_t v107 = v106 + sub_10001161C(v105[2]);
  uint64_t v108 = +[NSNumber numberWithUnsignedLongLong:v107];
  [v269 setObject:v108 forKey:@"UsedSizeInBytes"];

  *(void *)v302 = 0;
  if (sub_10000EF44((uint64_t)"chosen", "embedded-panic-log-size", v302))
  {
    BOOL v109 = qword_10003A5D8;
    long long v54 = v261;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "WARNING: unable to calculate panic region utilization", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (*(void *)v302)
    {
      v216 = +[NSNumber numberWithUnsignedLongLong:100 * (unint64_t)v107 / *(void *)v302];
      v217 = v269;
      [v269 setObject:v216 forKey:@"PercentUsed"];

      uint64_t v218 = *(void *)v302;
    }
    else
    {
      uint64_t v218 = 0;
      v217 = v269;
    }
    v220 = +[NSNumber numberWithUnsignedLongLong:v218];
    [v217 setObject:v220 forKey:@"PanicRegionSizeInBytes"];

    long long v54 = v261;
  }
  uint64_t v221 = v277[5];
  unint64_t v21 = v277[6];
  if ((unint64_t)&v283[-v221] < v21)
  {
    uint64_t v222 = (v283 - v221);
    v223 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v221;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_ERROR, "truncating eph_panic_log_offset %u, eph_panic_log_len %u (ignoring other log)", (uint8_t *)&buf, 0xEu);
      unint64_t v21 = v277[6];
    }
    long long v59 = v78;
    v224 = +[NSString stringWithFormat:@"Truncated panic string from 0x%x to 0x%x bytes (ignoring other log)", v21, v222];
    [(Bytef *)v54 addObject:v224];

    long long v60 = (__CFString *)[objc_alloc((Class)NSString) initWithBytesNoCopy:(char *)v277 + v277[5] length:v222 encoding:4 freeWhenDone:0];
    int v265 = 0;
    id v58 = 0;
    goto LABEL_278;
  }
  v225 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v21;
    _os_log_impl((void *)&_mh_execute_header, v225, OS_LOG_TYPE_DEFAULT, "found embedded panic log with %u bytes", (uint8_t *)&buf, 8u);
  }
  v226 = v277;
  v227 = (Bytef *)[objc_alloc((Class)NSString) initWithBytesNoCopy:(char *)v277 + v277[5] length:v277[6] encoding:4 freeWhenDone:0];
  long long v59 = v78;
  if (v227)
  {
    v267 = v227;
    v228 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.next_in) = 138412290;
      *(Bytef **)((char *)&buf.next_in + 4) = v267;
      _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "embedded panic string decoded: %@", (uint8_t *)&buf, 0xCu);
    }
    v226 = v277;
    v229 = v261;
  }
  else
  {
    v230 = +[NSString stringWithFormat:@"Parsed empty panic string from panic log buffer even though expected non-zero length: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu", v277[6], v277[5], v283];
    [(Bytef *)v261 addObject:v230];

    if (v277[6] < 0xF1)
    {
      v267 = 0;
      v229 = v261;
    }
    else
    {
      v229 = v261;
      v267 = (Bytef *)[objc_alloc((Class)NSString) initWithBytesNoCopy:(char *)v277 + v277[5] length:240 encoding:4 freeWhenDone:0];
      if (v267) {
        goto LABEL_257;
      }
    }
    unsigned int v231 = v277[6];
    if (v231 >= 0x64) {
      uint64_t v232 = 100;
    }
    else {
      uint64_t v232 = v231;
    }
    v233 = sub_100011718((uint64_t)v277 + v277[5], v232);
    v234 = +[NSString stringWithFormat:@"Prefix of panic string dumped as hex: %@", v233];
    [(Bytef *)v229 addObject:v234];
  }
LABEL_257:
  unint64_t v21 = v226[10];
  if (!v21)
  {
    int8x16_t v238 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEFAULT, "no 'other' log found in embedded panic log", (uint8_t *)&buf, 2u);
    }
    id v58 = 0;
    v239 = v277;
    goto LABEL_277;
  }
  unint64_t v235 = v226[9];
  unsigned int v236 = v226[6];
  if (v235 >= v236 + v226[5])
  {
    int8x16_t v237 = qword_10003A5D8;
    if ((unint64_t)v283 > v235)
    {
      if ((unint64_t)&v283[-v235] >= v21)
      {
        long long v59 = v78;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 67109120;
          HIDWORD(buf.next_in) = v21;
          _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_DEFAULT, "found other log with %u bytes", (uint8_t *)&buf, 8u);
        }
        id v242 = objc_alloc((Class)NSString);
        v239 = v277;
        uint64_t v244 = v277[10];
        int8x16_t v243 = (char *)v277 + v277[9];
      }
      else
      {
        long long v59 = v78;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 67109376;
          HIDWORD(buf.next_in) = v235;
          LOWORD(buf.avail_in) = 1024;
          *(uInt *)((char *)&buf.avail_in + 2) = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_ERROR, "truncating eph_other_log_offset %u, eph_other_log_len %u", (uint8_t *)&buf, 0xEu);
        }
        v240 = +[NSString stringWithFormat:@"truncated other string"];
        [(Bytef *)v229 addObject:v240];

        uint64_t v241 = v283 - v277[9];
        v239 = v277;
        id v242 = objc_alloc((Class)NSString);
        int8x16_t v243 = (char *)v239 + v239[9];
        uint64_t v244 = v241;
      }
      id v58 = [v242 initWithBytesNoCopy:v243 length:v244 encoding:4 freeWhenDone:0];
      goto LABEL_277;
    }
  }
  else
  {
    int8x16_t v237 = qword_10003A5D8;
  }
  if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.next_in) = 67109376;
    HIDWORD(buf.next_in) = v236;
    LOWORD(buf.avail_in) = 1024;
    *(uInt *)((char *)&buf.avail_in + 2) = v235;
    _os_log_error_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_ERROR, "invalid eph_panic_log_len %u eph_other_log_offset %u,", (uint8_t *)&buf, 0xEu);
  }
  id v58 = 0;
  v239 = v277;
  long long v59 = v78;
LABEL_277:
  long long v60 = (__CFString *)v267;
  sub_1000117E8(v239, (uint64_t)v239, (unint64_t)v283, &v299);
  sub_100011A48(v239, (uint64_t)v239, (unint64_t)v283, &v298);
  int v265 = 1;
  long long v54 = v261;
LABEL_278:
  if (!v60) {
    long long v60 = @"embedded panic data was failed to be parsed from panic buffer, check notes for more details";
  }
  uint64_t v100 = v269;
  uint64_t v50 = (uint64_t)v260;
LABEL_103:

  BOOL v114 = v60;
  id v115 = v58;
  id v63 = (__CFString *)v299;
  int v15 = (id *)v298;
  BOOL v40 = v59;
  id v25 = (id)v50;
  unint64_t v116 = v114;
  if (!v116)
  {
LABEL_295:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_296:
    v253 = v15[187];
    if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_ERROR, "Couldn't allocate a large enough (%zu bytes) buffer for inflating the compressed panic stackshot", (uint8_t *)&buf, 0xCu);
    }
LABEL_298:
    v192 = v283;
    v190 = v283;
    goto LABEL_236;
  }
  CFStringRef v64 = v116;

  *(void *)a6->OSAStackShotReport_opaque = +[NSString stringWithFormat:@"%@\n%@", v64, v115];
  id v62 = v115;
  long long v61 = v262;
LABEL_105:
  BOOL v117 = [PanicReport alloc];
  uint64_t v118 = +[NSNumber numberWithUnsignedLongLong:v57];
  v260 = (__CFString *)v64;
  v261 = v40;
  v269 = v62;
  uint64_t v119 = [(PanicReport *)v117 initWithPanicString:v64 otherString:v62 buildVersion:v40 panicFlags:v61 panicType:v271 incidentID:v25 rootsInstalled:v118];

  uint64_t v120 = sub_10000EE2C(v279, 0, a9);
  [(PanicReport *)v119 setSOCIdAndRev];
  [(PanicReport *)v119 setUtilizationInfo:v281];
  [(PanicReport *)v119 useStackshotBuffer:0 size:0 frontmostPids:0 atTime:a4 machTime:0xFFFFFFFFLL sequence:a9];
  [(PanicReport *)v119 addNotes:v288];
  [v288 removeAllObjects];
  [(PanicReport *)v119 useExtPaniclog:v63];
  v262 = v15;
  [(PanicReport *)v119 setPanicInitiator:v15];
  a4 = (void *)v120;
  __int16 v28 = v285;
  v121 = v289;
  if (([(PanicReport *)v119 saveWithOptions:v120] & 1) == 0)
  {
    v122 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "Failed to write initial safe panic log", (uint8_t *)&buf, 2u);
    }
  }
  v259 = v25;
  v264 = v63;
  v123 = [(PanicReport *)v119 logfile];
  v271 = (__CFString *)[v123 copy];

  uint64_t v50 = (uint64_t)objc_alloc_init((Class)NSMutableArray);
  long long v294 = 0u;
  long long v295 = 0u;
  long long v296 = 0u;
  long long v297 = 0u;
  id v124 = v285;
  id v125 = [v124 countByEnumeratingWithState:&v294 objects:v301 count:16];
  a6 = v119;
  if (v125)
  {
    id v126 = v125;
    uint64_t v127 = *(void *)v295;
    do
    {
      for (int8x16_t i = 0; i != v126; int8x16_t i = (char *)i + 1)
      {
        if (*(void *)v295 != v127) {
          objc_enumerationMutation(v124);
        }
        v129 = *(void **)(*((void *)&v294 + 1) + 8 * i);
        id v130 = objc_alloc_init((Class)NSMutableArray);
        v131 = sub_100015D7C(v129);
        int v132 = sub_100015D08(v129);
        v133 = [v129 base64EncodedStringWithOptions:0];
        if (v133) {
          [v130 addObject:v133];
        }
        if (v131) {
          [v130 addObject:v131];
        }
        [(id)v50 addObject:v130];
      }
      id v126 = [v124 countByEnumeratingWithState:&v294 objects:v301 count:16];
    }
    while (v126);
    id v25 = v279;
    uint64_t v119 = a6;
    __int16 v28 = v285;
    v121 = v289;
  }
  else
  {
    int v132 = 0;
    id v25 = v279;
  }

  v134 = v277;
  if (v273)
  {
    if ((*((unsigned char *)v273 + 4) & 2) == 0)
    {
      v135 = v121;
      id v293 = 0;
      int v136 = sub_1000146DC((unsigned int *)v273, a2, &v293);
      id v137 = v293;
      v138 = v137;
      if (v136)
      {
        v273 = (Bytef **)v137;
        [(PanicReport *)v119 useSocdContainer:v50];
        __int16 v28 = v285;
        id v25 = v279;
        if (!v132) {
          goto LABEL_131;
        }
      }
      else
      {
        v152 = +[NSData dataWithBytesNoCopy:&v273[1][(void)v135] length:*((unsigned int *)v273 + 4) freeWhenDone:0];
        uint64_t v153 = [v152 base64EncodedStringWithOptions:0];

        uint64_t v154 = v153;
        if (!v153)
        {
          uint64_t v154 = +[NSString stringWithFormat:@"Failed to base64 encode SOCD container of length %u", v273[2]];
        }
        v273 = (Bytef **)v154;
        if (v258)
        {
          uint64_t v119 = a6;
          [(PanicReport *)a6 useSocdNandContainer:v154];

          [(PanicReport *)a6 useSocdContainer:v50];
          __int16 v28 = v285;
          id v25 = v279;
          if ((v132 & 1) == 0) {
            goto LABEL_131;
          }
        }
        else
        {
          [v124 addObject:v152];
          v162 = sub_100015D7C(v152);
          uint64_t v163 = v154;
          char v164 = sub_100015D08(v152);
          id v165 = objc_alloc_init((Class)NSMutableArray);
          [v165 addObject:v163];
          [v165 addObject:v162];
          [(id)v50 addObject:v165];
          [(PanicReport *)a6 setPanicString:v162];

          __int16 v28 = v285;
          v134 = v277;

          uint64_t v119 = a6;
          [(PanicReport *)a6 useSocdContainer:v50];
          id v25 = v279;
          if ((v164 & 1) == 0) {
            goto LABEL_131;
          }
        }
      }
      goto LABEL_130;
    }
    [(PanicReport *)v119 useSocdContainer:v50];
    CFStringRef v139 = @"BAD MAGIC! (flag set in iBoot panic header), no SOCD container available";
  }
  else
  {
    [(PanicReport *)v119 useSocdContainer:v50];
    CFStringRef v139 = @"No valid SOCD nand container present";
  }
  v273 = (Bytef **)v139;
  if (v132)
  {
LABEL_130:
    v140 = off_100039B48;
    [(PanicReport *)v119 setForegroundAppHash:v140];
  }
LABEL_131:
  [(PanicReport *)v119 addNotes:v288];
  [v288 removeAllObjects];
  unsigned int v141 = [(PanicReport *)v119 saveWithOptions:a4];
  int v15 = (id *)&unk_10003A000;
  v142 = (id)qword_10003A5D8;
  v143 = v142;
  if (v141)
  {
    unint64_t v17 = v270;
    v144 = v274;
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Wrote log with SOCD data, discarding initial safe log", (uint8_t *)&buf, 2u);
    }

    sub_100010228(v271);
    v143 = [(PanicReport *)a6 logfile];
    v145 = [v143 copy];

    v271 = v145;
  }
  else
  {
    unint64_t v17 = v270;
    v144 = v274;
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "Failed to write panic log with SOCD data", (uint8_t *)&buf, 2u);
    }
  }

  if (v144)
  {
    id v146 = v25;
    if ((*((unsigned char *)v144 + 4) & 2) != 0)
    {
      v148 = (id)qword_10003A5D8;
      int v151 = v265;
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "No valid storage dump data found", (uint8_t *)&buf, 2u);
      }
      v149 = v269;
      v150 = a6;
    }
    else
    {
      id v292 = 0;
      int v147 = sub_1000146DC((unsigned int *)v144, a2, &v292);
      v148 = v292;
      if (v147)
      {
        [v288 addObject:v148];
        v149 = v269;
        v150 = a6;
      }
      else
      {
        if ((*((unsigned char *)v144 + 4) & 4) != 0)
        {
          v155 = +[NSString stringWithFormat:@"iBoot indicates storage dump CRC mismatch"];
          [v288 addObject:v155];
        }
        v156 = +[NSData dataWithBytesNoCopy:&v144[1][(void)v289] length:*((int *)v144 + 4) freeWhenDone:0];
        uint64_t v157 = [v156 base64EncodedStringWithOptions:0];

        v148 = v157;
        if (!v157) {
          v148 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to base64 encode storage dump of length %llu", v144[2]];
        }
        [(PanicReport *)a6 useStoragePanicData:v148];
        [(PanicReport *)a6 addNotes:v288];
        [v288 removeAllObjects];
        unsigned int v158 = [(PanicReport *)a6 saveWithOptions:a4];
        v159 = (id)qword_10003A5D8;
        v160 = v159;
        if (v158)
        {
          v149 = v269;
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "Wrote log with storage data, discarding initial safe log", (uint8_t *)&buf, 2u);
          }

          sub_100010228(v271);
          v160 = [(PanicReport *)a6 logfile];
          v161 = [v160 copy];

          v271 = v161;
          v150 = a6;
          int v15 = (id *)&unk_10003A000;
        }
        else
        {
          v149 = v269;
          if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_ERROR, "Failed to write panic log with storage data", (uint8_t *)&buf, 2u);
          }
          v150 = a6;
        }

        unint64_t v17 = v270;
      }
      int v151 = v265;
    }

    id v25 = v146;
    v134 = v277;
    if (!v151) {
      goto LABEL_168;
    }
  }
  else
  {
    v149 = v269;
    v150 = a6;
    if (!v265)
    {
LABEL_168:
      v166 = v15[187];
      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "no stackshot found", (uint8_t *)&buf, 2u);
      }
LABEL_175:

      v170 = [(PanicReport *)v150 logfile];
      *a7 = (uint64_t)[v170 copy];

      if (byte_10003A568)
      {
        v171 = v28;
        id v172 = [[PanicPatternMatchingSupport alloc] init:0];
        v173 = (void *)qword_10003A590;
        qword_10003A590 = (uint64_t)v172;

        v174 = (void *)qword_10003A590;
        if (qword_10003A590)
        {
          [(PanicReport *)v150 incidentID];
          v176 = v175 = v150;
          v177 = [(PanicReport *)v175 logType];
          uint64_t v178 = *a7;
          v179 = [(PanicReport *)v175 panicString];
          v180 = [v174 createPanicCriterials:v176 :v177 :v178 :v179];

          if (v180)
          {
            unsigned int v181 = [(id)qword_10003A590 lookForKnownPanic:v180];
            v182 = v15[187];
            if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
            {
              v183 = "Cannot find";
              if (v181) {
                v183 = "Found";
              }
              LODWORD(buf.next_in) = 136315138;
              *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v183;
              _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_INFO, "%s matched panic pattern", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v182 = v15[187];
            if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.next_in) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_ERROR, "Failed to create Panic Criterials object, bailing out pattern matching", (uint8_t *)&buf, 2u);
            }
          }
          v149 = v269;
          unint64_t v17 = v270;
          v150 = a6;
        }
        else
        {
          v180 = v15[187];
          if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_ERROR, "Failed to create PanicPatternMatchingSupport object, bailing out pattern matching", (uint8_t *)&buf, 2u);
          }
        }

        __int16 v28 = v171;
      }

      int v15 = v268;
      id v18 = v288;
      id v29 = v264;
      BOOL v26 = (Bytef *)v273;
      goto LABEL_189;
    }
  }
  if ((v134[3] & 2) == 0) {
    goto LABEL_168;
  }
  unsigned int v167 = v134[7];
  if (v167 < sub_10001161C(v134[2])
    || (unsigned int v168 = v134[8]) == 0
    || (uint64_t v169 = v134[7], (unint64_t)v283 < v169 + v168))
  {
    v166 = v15[187];
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      unsigned int v212 = v134[7];
      uInt v213 = v134[8];
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v212;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v213;
      _os_log_error_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "invalid eph_stackshot_offset %u, eph_stackshot_len %u", (uint8_t *)&buf, 0xEu);
    }
    goto LABEL_175;
  }
  +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)v134 + v169);
  id v184 = objc_claimAutoreleasedReturnValue();
  v185 = [v184 bytes];
  id v186 = [v184 length];

  int v187 = 0;
  if ((unint64_t)v186 >= 5)
  {
    if (*v185 == 1503811591) {
      int v187 = 1;
    }
    else {
      int v187 = 2 * (*v185 == 1129270608);
    }
  }
  v188 = v15[187];
  if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v187;
    _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_INFO, "panic stackshot is type %d", (uint8_t *)&buf, 8u);
  }

  id v189 = v184;
  unint64_t v21 = (unint64_t)v189;
  v149 = v269;
  if (v187 != 2)
  {
    v190 = (Bytef *)v189;
LABEL_285:

    v166 = v190;
    [(PanicReport *)a6 useStackshotBuffer:[v166 bytes] size:[v166 length] frontmostPids:0 atTime:mach_absolute_time() machTime:1 sequence:a9];
    [(PanicReport *)a6 addNotes:v288];
    [v288 removeAllObjects];
    unsigned int v250 = [(PanicReport *)a6 saveWithOptions:a4];
    v251 = v15[187];
    v252 = v251;
    if (v250)
    {
      __int16 v28 = v285;
      if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v271;
        _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "Discarding 'safe' log %@", (uint8_t *)&buf, 0xCu);
      }

      sub_100010228(v271);
    }
    else
    {
      __int16 v28 = v285;
      if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_ERROR, "Failed to write full panic log", (uint8_t *)&buf, 2u);
      }
    }
    v150 = a6;
    goto LABEL_175;
  }
  v192 = (Bytef *)v189;
  v193 = (uInt *)[(Bytef *)v192 bytes];
  id v194 = [(Bytef *)v192 length];
  uInt v195 = *v193;
  unsigned int v196 = *v193 & 0xFFFFFFF0;
  if (*v193 != 1129270608 || v196 == 32)
  {
    v214 = v15[187];
    if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
    {
      if (v196 == 32) {
        uInt v215 = 17;
      }
      else {
        uInt v215 = v195;
      }
      LODWORD(buf.next_in) = 136315394;
      *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)"decompress_stackshot";
      *((_WORD *)&buf.avail_in + 2) = 1024;
      *(uInt *)((char *)&buf.avail_in + 6) = v215;
      _os_log_error_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_ERROR, "invalid kcdata iter type in %s(): %d", (uint8_t *)&buf, 0x12u);
    }
LABEL_283:
    v190 = v192;
    goto LABEL_284;
  }
  v283 = v192;
  v290 = 0;
  uint64_t v197 = 0;
  v287 = 0;
  id v275 = v194;
  unint64_t v198 = (unint64_t)v193 + (void)v194;
  v278 = v193;
  unint64_t v199 = (unint64_t)v193 + v193[1] + 16;
  int v200 = 3;
  do
  {
    if (v199 + 16 > v198 || (unint64_t v201 = v199, v199 += 16 + *(unsigned int *)(v199 + 4), v199 > v198))
    {
      v219 = v15[187];
      if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_ERROR, "kcdata iterator was invalid while collecting compression metadata", (uint8_t *)&buf, 2u);
      }
      v192 = v283;
      v190 = v283;
      id v25 = v279;
LABEL_236:
      v149 = v269;
      unint64_t v17 = v270;
      goto LABEL_284;
    }
    unint64_t v202 = v201 + 16;
    if (!strcmp((const char *)(v201 + 16), "kcd_c_type"))
    {
      v290 = *(Bytef **)(v202 + 32);
    }
    else if (!strcmp((const char *)v202, "kcd_c_totalout"))
    {
      uint64_t v197 = *(void *)(v202 + 32);
    }
    else if (!strcmp((const char *)v202, "kcd_c_totalin"))
    {
      v287 = *(Bytef **)(v202 + 32);
    }
    --v200;
  }
  while (v200);
  v203 = v15[187];
  if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v290;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(void *)((char *)&buf.avail_in + 6) = v197;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v287;
    _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_INFO, "Compressed stackshot metadata: type: %lld totalout: %lld totalin %lld", (uint8_t *)&buf, 0x20u);
  }
  id v25 = v279;
  v149 = v269;
  unint64_t v17 = v270;
  if (v290 != (Bytef *)1 || !v197 || !v287)
  {
    int8x16_t v245 = v15[187];
    if (!os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
    {
LABEL_282:
      v192 = v283;
      goto LABEL_283;
    }
    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v290;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(void *)((char *)&buf.avail_in + 6) = v197;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v287;
    int8x16_t v246 = "Required metadata from compressed panic stackshot is unexpected: type: %lld totalout %lld totalin %lld";
    int8x16_t v247 = v245;
    uint32_t v248 = 32;
LABEL_309:
    _os_log_error_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_ERROR, v246, (uint8_t *)&buf, v248);
    goto LABEL_282;
  }
  uint64_t v204 = v197;
  int v205 = *(_DWORD *)v199;
  unsigned int v206 = *(_DWORD *)v199 & 0xFFFFFFF0;
  if (*(_DWORD *)v199 != 1503811591 || v206 == 32)
  {
    int8x16_t v249 = v15[187];
    if (!os_log_type_enabled(v249, OS_LOG_TYPE_ERROR)) {
      goto LABEL_282;
    }
    if (v206 == 32) {
      int v257 = 17;
    }
    else {
      int v257 = v205;
    }
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v257;
    int8x16_t v246 = "Compressed kcdata buffer doesn't contain a stackshot, iter_type is %d";
    int8x16_t v247 = v249;
    uint32_t v248 = 8;
    goto LABEL_309;
  }
  BOOL v40 = &v287[(unint64_t)v287 >> 3];
  v207 = (Bytef *)malloc_type_malloc((size_t)v40, 0x1CC7306DuLL);
  if (!v207) {
    goto LABEL_296;
  }
  v208 = v207;
  memset(&buf, 0, sizeof(buf));
  int v209 = inflateInit_(&buf, "1.2.12", 112);
  if (v209)
  {
    int v210 = v209;
    v211 = v15[187];
    if (os_log_type_enabled(v211, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v302 = 67109120;
      *(_DWORD *)&v302[4] = v210;
      _os_log_error_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_ERROR, "Failed to initialize the z_stream for this panic stackshot: rc = %d", v302, 8u);
    }
    free(v208);
    goto LABEL_298;
  }
  *(void *)v208 = 1503811591;
  *((void *)v208 + 1) = 0;
  unint64_t v254 = v199 + 16;
  buf.next_in = (Bytef *)(v199 + 16);
  buf.avail_in = v204;
  buf.next_out = v208 + 16;
  buf.avail_out = v40 - 16;
  int v291 = inflate(&buf, 4);
  if (v291 != 1)
  {
    v256 = v15[187];
    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v302 = 67109120;
      *(_DWORD *)&v302[4] = v291;
      _os_log_error_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_ERROR, "Failed to inflate the compresssed panic stackshot buffer: rc = %d", v302, 8u);
    }
    free(v208);
    v192 = v283;
    v190 = v283;
    id v25 = v279;
    v149 = v269;
    unint64_t v17 = v270;
LABEL_284:

    goto LABEL_285;
  }
  inflateEnd(&buf);
  size_t v255 = (size_t)v275 + (void)v278 - v254 - v204;
  if (v255 <= (unint64_t)&v40[-buf.total_out - 16])
  {
    memcpy(&v208[buf.total_out + 16], (const void *)(v254 + v204), v255);
    v190 = +[NSData dataWithBytesNoCopy:v208 length:v40];
    id v25 = v279;
    v149 = v269;
    unint64_t v17 = v270;
    v192 = v283;
    goto LABEL_284;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_100014538(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, double a7)
{
  id v13 = a1;
  id v14 = a4;
  id v15 = a2;
  id v16 = [[PanicReport alloc] initWithPanicString:v13 otherString:0 buildVersion:0 panicFlags:0 panicType:@"corrupt data" incidentID:0 rootsInstalled:0];
  [(PanicReport *)v16 useStackshotBuffer:0 size:0 frontmostPids:0 atTime:a3 machTime:0xFFFFFFFFLL sequence:a7];
  [(PanicReport *)v16 addNotes:v15];

  unint64_t v17 = +[NSURL fileURLWithPath:v14];

  id v18 = sub_10000EE2C(v17, 0, a7);
  LOBYTE(v15) = [(PanicReport *)v16 saveWithOptions:v18];

  if ((v15 & 1) == 0)
  {
    uint64_t v19 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to write out error panic log", buf, 2u);
    }
  }
  *a5 = [v13 copy];
  uint64_t v20 = [(PanicReport *)v16 logfile];
  *a6 = [v20 copy];
}

uint64_t sub_1000146DC(unsigned int *a1, unint64_t a2, void *a3)
{
  *a3 = 0;
  uint64_t v4 = *a1;
  if (v4)
  {
    if (v4 == 2)
    {
      unint64_t v5 = 8;
    }
    else
    {
      if (v4 != 4)
      {
        uint64_t result = _os_crash();
        __break(1u);
        return result;
      }
      unint64_t v5 = 20;
    }
  }
  else
  {
    unint64_t v5 = 44;
  }
  unint64_t v6 = *((void *)a1 + 2);
  if (v6 < v5)
  {
    id v7 = +[NSString stringWithFormat:@"invalid iBoot log metadata: (type %d) size invalid, found %llu, expected at least %lu", v4, v6, v5];
    *a3 = v7;
    unsigned int v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 138412290;
      id v13 = v7;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      return 0xFFFFFFFFLL;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *((void *)a1 + 1);
  if (v9 + v6 > a2)
  {
    id v10 = +[NSString stringWithFormat:@"invalid iBoot log metadata: (type %d) points outside of panic buffer : offset: %llu, size: %llu, bytes_read: %llu", v4, v9, v6, a2];
    *a3 = v10;
    unsigned int v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 138412290;
      id v13 = v10;
      goto LABEL_13;
    }
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t sub_100014878(void *a1)
{
  return 0;
}

size_t sub_100014894(uint64_t a1, void *__dst, size_t a3)
{
  size_t v3 = 0;
  if (!a3) {
    return v3;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (!v5) {
    return v3;
  }
  size_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    uint64_t v9 = *(const void **)(a1 + 32);
LABEL_12:
    if (v8 >= a3) {
      size_t v3 = a3;
    }
    else {
      size_t v3 = v8;
    }
    memcpy(__dst, v9, v3);
    size_t v14 = *(void *)(a1 + 40) - v3;
    *(void *)(a1 + 32) += v3;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 8) -= v3;
    return v3;
  }
  int v10 = *(_DWORD *)a1;
  vm_size_t v11 = (vm_page_size + v5 - 1) / vm_page_size * vm_page_size;
  if (*(void *)(a1 + 24) >= v11) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = *(void *)(a1 + 24);
  }
  unint64_t v13 = read(v10, *(void **)(a1 + 16), v12);
  if (v13 != -1)
  {
    size_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = *(const void **)(a1 + 16);
    if (v13 < v8) {
      size_t v8 = v13;
    }
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v8;
    goto LABEL_12;
  }
  id v16 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v17 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to read from kernelcore file.", v17, 2u);
  }
  return -1;
}

uint64_t sub_1000149B4(AEAContext *a1)
{
  uint64_t v2 = AAByteStreamClose(a1[1]);
  if (v2 == -1)
  {
    size_t v3 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to close AEA decrypt stream source.", v5, 2u);
    }
  }
  AEAContextDestroy(*a1);
  free(a1);
  return v2;
}

ssize_t sub_100014A50(uint64_t a1, void *a2, size_t a3)
{
  ssize_t v3 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), a2, a3);
  if (v3 == -1)
  {
    uint64_t v4 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to read from AEA decrypt stream source.", v6, 2u);
    }
  }
  return v3;
}

uint64_t sub_100014AD0(uint64_t a1)
{
  return 0;
}

uint64_t sub_100014B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  if (!a3 || *(unsigned char *)(a1 + 48)) {
    return result;
  }
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  while (1)
  {
    if (*(void *)(a1 + 32))
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    ssize_t v7 = AAByteStreamRead(*(AAByteStream *)a1, *(void **)(a1 + 56), 8uLL);
    if (v7 == -1) {
      break;
    }
    *(void *)(a1 + 24) = *(void *)(a1 + 56);
    *(void *)(a1 + 32) = v7;
    BOOL v6 = v7 == 0;
LABEL_8:
    compression_status v8 = compression_stream_process((compression_stream *)(a1 + 8), v6);
    if (v8)
    {
      if (v8 == COMPRESSION_STATUS_END)
      {
        *(unsigned char *)(a1 + 48) = 1;
      }
      else if (v8 == COMPRESSION_STATUS_ERROR)
      {
        uint64_t v9 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          __int16 v12 = 0;
          int v10 = "Failed to decode from lz4 stream source.";
          vm_size_t v11 = (uint8_t *)&v12;
          goto LABEL_21;
        }
        return -1;
      }
      return a3 - *(void *)(a1 + 16);
    }
    if (*(void *)(a1 + 16) != a3) {
      return a3 - *(void *)(a1 + 16);
    }
  }
  uint64_t v9 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)z_stream buf = 0;
    int v10 = "Failed to read from lz4 decode stream source.";
    vm_size_t v11 = buf;
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
  }
  return -1;
}

uint64_t sub_100014C4C(gzFile *a1)
{
  return 0;
}

z_size_t sub_100014C80(gzFile *a1, voidpc buf, z_size_t nitems)
{
  z_size_t v3 = nitems;
  if (nitems && gzfwrite(buf, 1uLL, nitems, *a1) != nitems)
  {
    int errnum = 0;
    uint64_t v5 = (void *)gzerror(*a1, &errnum);
    if (errnum == -1)
    {
      BOOL v6 = __error();
      uint64_t v5 = strerror(*v6);
    }
    ssize_t v7 = v5;
    compression_status v8 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)bufa = 136315138;
      __int16 v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to write to gzip output file with error: %s.", bufa, 0xCu);
    }
    return -1;
  }
  return v3;
}

uint64_t sub_100015090(void *a1, void *a2, int a3)
{
  id v5 = a1;
  if (a2)
  {
    BOOL v6 = v5;
    if ([v5 length])
    {
      *a2 = 0;
      id v7 = v6;
      int v8 = open((const char *)[v7 UTF8String], 0x20000000);
      if (v8 < 0)
      {
        if (*__error() == 2)
        {
          id v12 = v7;
          if (mkdir((const char *)[v12 UTF8String], a3) != -1)
          {
            uint64_t v13 = 1;
LABEL_18:

            return v13;
          }
          id v15 = __error();
          +[NSString stringWithFormat:@"Error creating directory at : %@ : %s", v12, strerror(*v15)];
        }
        else
        {
          size_t v14 = __error();
          +[NSString stringWithFormat:@"failed to open directory at path : %@ with error : %s", v7, strerror(*v14)];
        }
        uint64_t v13 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      int v9 = v8;
      memset(&v21, 0, sizeof(v21));
      if (fstat(v8, &v21))
      {
        int v10 = __error();
        id v19 = v7;
        uint64_t v20 = strerror(*v10);
        CFStringRef v11 = @"fstat of %@ failed with error: %s";
      }
      else
      {
        if ((v21.st_mode & 0xF000) == 0x4000)
        {
          if (v21.st_mode != a3)
          {
            if (fchmod(v9, a3))
            {
              unint64_t v17 = __error();
              id v19 = v7;
              uint64_t v20 = strerror(*v17);
              CFStringRef v11 = @"fchmod of path : %@ failed with error : %s";
              goto LABEL_14;
            }
            if (fchown(v9, 0, 0) == -1)
            {
              id v18 = __error();
              id v19 = v7;
              uint64_t v20 = strerror(*v18);
              CFStringRef v11 = @"fchown of path : %@ failed with error : %s";
              goto LABEL_14;
            }
          }
          uint64_t v13 = 1;
LABEL_15:
          close(v9);
          goto LABEL_18;
        }
        id v19 = v7;
        CFStringRef v11 = @"path exists but is not directory : %@";
      }
LABEL_14:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v19, v20);
      uint64_t v13 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

id sub_1000152C8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
  [v2 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  uint64_t v4 = [v1 lastPathComponent];
  if (![v4 containsString:@".core"])
  {
    int v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      goto LABEL_11;
    }
LABEL_12:
    CFStringRef v11 = 0;
    goto LABEL_14;
  }
  id v5 = (char *)[v1 rangeOfString:@".core"];
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  BOOL v6 = v5;
  id v7 = 0;
  do
  {
    int v8 = v7;
    unsigned int v9 = [v4 characterAtIndex:v7];
    if (v6 == v8) {
      break;
    }
    id v7 = v8 + 1;
  }
  while (v9 != 46);
  if (v8 == v6)
  {
    int v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unable to parse date from filename %@, skipping", (uint8_t *)&v14, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v12 = [v4 substringToIndex:v8];
  CFStringRef v11 = [v2 dateFromString:v12];

LABEL_14:

  return v11;
}

void sub_1000154D8(id a1)
{
  size_t size = 0;
  int v1 = sysctlbyname("kern.kdp_corefile", 0, &size, 0, 0);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)z_stream buf = 67109120;
    int v14 = v2;
    int v8 = "Failed to query the size of kdp_corefile. Error: %d";
    goto LABEL_13;
  }
  if (size)
  {
    uint64_t v4 = (char *)malloc_type_malloc(size, 0x79A79D99uLL);
    if (v4)
    {
      id v5 = v4;
      int v6 = sysctlbyname("kern.kdp_corefile", v4, &size, 0, 0);
      if (!v6)
      {
        off_100039BA0 = v5;
        return;
      }
      int v7 = v6;
      free(v5);
      uint64_t v3 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)z_stream buf = 67109120;
        int v14 = v7;
        int v8 = "Failed to query kdp_corefile. Error: %d";
LABEL_13:
        int v10 = v3;
        uint32_t v11 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v9 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        int v8 = "Failed to allocate memory for kdp_corefile buffer";
        int v10 = v9;
        uint32_t v11 = 2;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, buf, v11);
      }
    }
  }
}

id sub_100015670(const char *a1, const char *a2, char *a3, const char *a4, unsigned int a5)
{
  kern_return_t MatchingServices;
  kern_return_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  int v21;
  io_object_t v22;
  io_registry_entry_t v23;
  NSObject *v24;
  CFStringRef v25;
  int v26;
  CFBooleanRef CFProperty;
  CFBooleanRef v28;
  CFTypeID v29;
  int Value;
  NSObject *v31;
  BOOL v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  CFStringRef v37;
  CFStringRef v38;
  void *v39;
  CFStringRef v40;
  CFStringRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  CFTypeID v48;
  kern_return_t v49;
  kern_return_t v50;
  NSObject *v51;
  id v52;
  char *cStr;
  int v54;
  io_iterator_t existing;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  CFTypeID v60;
  uint64_t vars8;

  if (!a1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_67;
  }
  if (!a2)
  {
LABEL_67:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_68:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (!a3) {
    goto LABEL_68;
  }
  CFMutableDictionaryRef v10 = IOServiceMatching(a1);
  if (!v10)
  {
    id v19 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)z_stream buf = 0;
    id v16 = "Failed to create matching dict";
LABEL_64:
    unint64_t v17 = v19;
    id v18 = 2;
    goto LABEL_65;
  }
  uint32_t v11 = v10;
  id v12 = +[NSString stringWithUTF8String:a3];
  long long v56 = v12;
  CFDictionarySetValue(v11, @"IOPropertyExistsMatch", +[NSArray arrayWithObjects:&v56 count:1]);

  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v11, &existing);
  if (MatchingServices)
  {
    int v14 = MatchingServices;
    id v15 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 67109120;
      LODWORD(v58) = v14;
      id v16 = "Failed to get matching socd ioservices: 0x%x";
      unint64_t v17 = v15;
      id v18 = 8;
LABEL_65:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }
LABEL_9:
    id v52 = 0;
    goto LABEL_10;
  }
  if (!existing)
  {
    id v19 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)z_stream buf = 0;
    id v16 = "IOService match returned an empty iterator";
    goto LABEL_64;
  }
  cStr = a3;
  id v52 = objc_alloc_init((Class)NSMutableArray);
  if (a5 <= 1) {
    stat v21 = 1;
  }
  else {
    stat v21 = a5;
  }
  long long v54 = v21;
LABEL_18:
  if (IOIteratorIsValid(existing))
  {
    while (1)
    {
      unsigned int v22 = IOIteratorNext(existing);
      if (!v22)
      {
        if (!IOIteratorIsValid(existing))
        {
          IOIteratorReset(existing);
          [v52 removeAllObjects];
          goto LABEL_18;
        }
        goto LABEL_58;
      }
      unint64_t v23 = v22;
      if (a4)
      {
        int v24 = qword_10003A5C0;
        if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)z_stream buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for SOCD data collection to complete", buf, 2u);
        }
        id v25 = CFStringCreateWithCString(kCFAllocatorDefault, a4, 0x8000100u);
        BOOL v26 = v54;
        if (v25)
        {
          while (1)
          {
            CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v23, v25, kCFAllocatorDefault, 0);
            if (!CFProperty) {
              goto LABEL_38;
            }
            __int16 v28 = CFProperty;
            id v29 = CFGetTypeID(CFProperty);
            if (v29 != CFBooleanGetTypeID()) {
              break;
            }
            Value = CFBooleanGetValue(v28);
            CFRelease(v28);
            char v31 = qword_10003A5C0;
            uint64_t v32 = os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT);
            if (!Value)
            {
              if (v32)
              {
                *(_WORD *)z_stream buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOCD data collection is complete. Checking for data", buf, 2u);
              }
LABEL_38:
              CFRelease(v25);
              goto LABEL_39;
            }
            if (v32)
            {
              *(_WORD *)z_stream buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOCD data collection still in progress", buf, 2u);
            }
            usleep(0x186A0u);
            if (!(_BYTE)--v26) {
              goto LABEL_38;
            }
          }
          id v36 = (void *)qword_10003A5C0;
          if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          {
            id v47 = v36;
            id v48 = CFGetTypeID(v28);
            *(_DWORD *)z_stream buf = 136315394;
            id v58 = (void *)a4;
            long long v59 = 2048;
            long long v60 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s of unexpected type %lu", buf, 0x16u);
          }
          CFRelease(v28);
          CFRelease(v25);
        }
        else
        {
          uint64_t v33 = qword_10003A5C0;
          if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)z_stream buf = 136315138;
            id v58 = (void *)a4;
            size_t v34 = v33;
            unsigned int v35 = "Error creating CFString for key %s";
            goto LABEL_51;
          }
        }
        goto LABEL_53;
      }
LABEL_39:
      id v37 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (!v37) {
        break;
      }
      id v38 = v37;
      int v39 = (void *)IORegistryEntryCreateCFProperty(v23, v37, kCFAllocatorDefault, 0);
      CFRelease(v38);
      if (!v39)
      {
        unsigned int v44 = qword_10003A5C0;
        if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        *(_DWORD *)z_stream buf = 136315394;
        id v58 = (void *)a2;
        long long v59 = 2080;
        long long v60 = (CFTypeID)a1;
        size_t v34 = v44;
        unsigned int v35 = "Failed to read %s in %s. This most probably means there's just no SOCD data";
        BOOL v45 = 22;
        goto LABEL_52;
      }
      BOOL v40 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
      if (!v40)
      {
        id v46 = qword_10003A5C0;
        if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        *(_DWORD *)z_stream buf = 136315138;
        id v58 = cStr;
        size_t v34 = v46;
        unsigned int v35 = "Error creating CFString for key %s";
        goto LABEL_51;
      }
      long long v41 = v40;
      if (IORegistryEntrySetCFProperty(v23, v40, &off_1000378C8))
      {
        int v42 = qword_10003A5C0;
        if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)z_stream buf = 136315138;
          id v58 = cStr;
          size_t v34 = v42;
          unsigned int v35 = "Failed to write %s";
          goto LABEL_51;
        }
LABEL_53:
        int v39 = 0;
        goto LABEL_54;
      }
      CFRelease(v41);
      [v52 addObject:v39];
LABEL_54:
      IOObjectRelease(v23);
    }
    id v43 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)z_stream buf = 136315138;
    id v58 = (void *)a2;
    size_t v34 = v43;
    unsigned int v35 = "Error creating CFString for key %s";
LABEL_51:
    BOOL v45 = 12;
LABEL_52:
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, v45);
    goto LABEL_53;
  }
LABEL_58:
  uint64_t v49 = IOObjectRelease(existing);
  if (v49)
  {
    uint64_t v50 = v49;
    id v51 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 136315394;
      id v58 = (void *)a1;
      long long v59 = 1024;
      LODWORD(v60) = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to release socd ioservice (%s) iterator: 0x%x", buf, 0x12u);
    }
  }
LABEL_10:

  return v52;
}

uint64_t sub_100015D08(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    int v2 = v1;

    BOOL v3 = (unint64_t)[v2 length] >= 0x14
      && (*((unsigned char *)[v2 bytes] + 6) & 0x18) != 0;

    return v3;
  }
  else
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

__CFString *sub_100015D7C(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    _os_assert_log();
    uint64_t result = (__CFString *)_os_crash();
    __break(1u);
    return result;
  }
  int v2 = v1;

  if ((unint64_t)[v2 length] >= 0x14)
  {
    id v4 = v2;
    id v5 = [v4 bytes];
    char v6 = v5[6];
    char v7 = v5[5];
    BOOL v3 = +[NSMutableString stringWithString:@"SOCD report detected:"];
    if (sub_100015D08(v4))
    {
      [(__CFString *)v3 appendString:@" (AP watchdog expired)"];
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
    }
    if ((v6 & 6) != 0)
    {
      [(__CFString *)v3 appendString:@" (SMC panic)"];
      int v8 = 1;
    }
    if ((v7 & 0x18) != 0)
    {
      [(__CFString *)v3 appendString:@" (iBoot async abort)"];
      int v8 = 1;
    }
    if ((v7 & 6) != 0)
    {
      [(__CFString *)v3 appendString:@" (iBoot sync abort)"];
      if ((v7 & 0x60) == 0) {
        goto LABEL_17;
      }
    }
    else if ((v7 & 0x60) == 0)
    {
      if (v8) {
        goto LABEL_17;
      }
      CFStringRef v9 = @" (Unknown)";
      goto LABEL_16;
    }
    CFStringRef v9 = @" (iBoot panic)";
LABEL_16:
    [(__CFString *)v3 appendString:v9];
    goto LABEL_17;
  }
  BOOL v3 = @"SOCD report detected: socd buffer doesn't accommodate the socd header";
LABEL_17:

  return v3;
}

uint64_t sub_100015EDC(void *a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a1;
  id v10 = a4;
  if (!a2)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_41;
  }
  if (!a3)
  {
LABEL_41:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_42;
  }
  id v11 = v10;
  if (!v11)
  {
LABEL_42:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_43;
  }
  id v12 = v11;

  *a2 = 0;
  *a3 = 0;
  if (![v12 count])
  {
    uint64_t v25 = 1;
    goto LABEL_39;
  }
  BOOL v45 = a2;
  id v46 = a3;
  id v49 = objc_alloc_init((Class)NSMutableArray);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v47 = v12;
  obuint64_t j = v12;
  id v13 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    id v14 = v13;
    id v44 = v9;
    id v15 = 0;
    id v16 = 0;
    id v17 = 0;
    uint64_t v18 = *(void *)v52;
    do
    {
      id v19 = 0;
      uint64_t v20 = v15;
      stat v21 = v16;
      unsigned int v22 = v17;
      do
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v51 + 1) + 8 * (void)v19);

        id v23 = objc_alloc_init((Class)NSMutableArray);
        id v15 = sub_100015D7C(v17);

        int v24 = sub_100015D08(v17);
        id v16 = [v17 base64EncodedStringWithOptions:0];

        [v23 addObject:v16];
        [v23 addObject:v15];
        [v49 addObject:v23];

        id v19 = (char *)v19 + 1;
        uint64_t v20 = v15;
        stat v21 = v16;
        unsigned int v22 = v17;
      }
      while (v14 != v19);
      id v14 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v14);

    id v9 = v44;
  }
  else
  {
    id v15 = 0;
    id v16 = 0;
    int v24 = 0;
  }

  BOOL v26 = [PanicReport alloc];
  id v27 = [obj lastObject];
  if (!v27)
  {
LABEL_43:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  __int16 v28 = v27;

  id v29 = @"socd";
  if ((unint64_t)[v28 length] >= 0x14)
  {
    id v30 = v28;
    char v31 = [v30 bytes];
    char v32 = v31[6];
    char v33 = v31[5];
    unsigned int v34 = sub_100015D08(v30);
    CFStringRef v35 = @"socd-ap watchdog";
    if (v34)
    {
      unsigned int v36 = 2;
    }
    else
    {
      CFStringRef v35 = @"socd";
      unsigned int v36 = 1;
    }
    if ((v32 & 6) != 0) {
      CFStringRef v35 = @"socd-smc panic";
    }
    else {
      unsigned int v36 = v34;
    }
    if ((v33 & 0x18) != 0)
    {
      CFStringRef v35 = @"socd-iboot async abort";
      ++v36;
    }
    if ((v33 & 6) != 0)
    {
      CFStringRef v35 = @"socd-iboot sync abort";
      ++v36;
    }
    if ((v33 & 0x60) != 0)
    {
      CFStringRef v35 = @"socd-iboot panic";
      ++v36;
    }
    if (v36 <= 1) {
      id v29 = (__CFString *)v35;
    }
    else {
      id v29 = @"socd-multi";
    }
  }

  id v37 = v29;
  id v38 = [(PanicReport *)v26 initWithPanicString:v15 otherString:&stru_100035440 buildVersion:&stru_100035440 panicFlags:0 panicType:v37 incidentID:0 rootsInstalled:0];

  [(PanicReport *)v38 useSocdContainer:v49];
  [(PanicReport *)v38 setSOCIdAndRev];
  if (v24)
  {
    int v39 = off_100039B48;
    [(PanicReport *)v38 setForegroundAppHash:v39];
  }
  BOOL v40 = sub_10000EE2C(v9, 0, a5);
  uint64_t v25 = (uint64_t)[(PanicReport *)v38 saveWithOptions:v40];
  if (v25)
  {
    *BOOL v45 = v15;
    long long v41 = [(PanicReport *)v38 logfile];
    void *v46 = [v41 copy];
  }
  else
  {
    int v42 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to write panic file", buf, 2u);
    }
  }

  id v12 = v47;
LABEL_39:

  return v25;
}

id sub_100016D80(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new();
  id v82 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:];
  int v86 = v5;
  [v5 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  char v6 = objc_opt_new();
  unsigned int v83 = [v3 stringByAppendingPathComponent:@"staged"];
  char v7 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)z_stream buf = 138412546;
    id v114 = v4;
    __int16 v115 = 2112;
    id v116 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prune %@ core files in %@", buf, 0x16u);
  }
  int v8 = +[NSFileManager defaultManager];
  id v9 = [v8 enumeratorAtPath:v3];

  uint64_t v10 = objc_opt_new();
  unint64_t v89 = objc_opt_new();
  id v11 = (void *)v10;
  id v12 = (id)objc_opt_new();
  int v88 = v9;
  uint64_t v13 = [v9 nextObject];
  uint64_t v90 = v6;
  if (v13)
  {
    id v14 = (void *)v13;
    while (![v14 containsString:v4])
    {
LABEL_14:
      uint64_t v19 = [v88 nextObject];

      id v14 = (void *)v19;
      if (!v19) {
        goto LABEL_15;
      }
    }
    unsigned int v15 = [v14 containsString:@"staged"];
    id v16 = [v3 stringByAppendingPathComponent:v14];
    if (v15)
    {
      [v12 addObject:v16];
    }
    else
    {
      [v11 addObject:v16];

      id v17 = [v14 lastPathComponent];
      id v16 = sub_1000152C8(v17);

      if (v16)
      {
        uint64_t v18 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)z_stream buf = 138412290;
          id v114 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "found timestamp %@", buf, 0xCu);
        }
        char v6 = v90;
        [v90 addObject:v16];
        goto LABEL_13;
      }
    }
    char v6 = v90;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  id v84 = v11;
  unsigned int v85 = v4;
  id v92 = v3;
  if ((unint64_t)[v12 count] < 2)
  {
    stat v21 = v86;
  }
  else
  {
    uint64_t v20 = (void *)qword_10003A5D8;
    stat v21 = v86;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v80 = v20;
      id v81 = [v12 count];
      *(_DWORD *)z_stream buf = 134217984;
      id v114 = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Found %lu sets of cores under staged folder", buf, 0xCu);
    }
    unsigned int v22 = sub_100016D80(v83, v4);

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v12 = v22;
    id v23 = [v12 countByEnumeratingWithState:&v106 objects:v121 count:16];
    if (v23)
    {
      id v24 = v23;
      id v25 = 0;
      uint64_t v26 = *(void *)v107;
      do
      {
        id v27 = 0;
        __int16 v28 = v25;
        do
        {
          if (*(void *)v107 != v26) {
            objc_enumerationMutation(v12);
          }
          id v25 = *(id *)(*((void *)&v106 + 1) + 8 * (void)v27);

          id v29 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            id v114 = v25;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ left in pull in list", buf, 0xCu);
          }
          id v27 = (char *)v27 + 1;
          __int16 v28 = v25;
        }
        while (v24 != v27);
        id v24 = [v12 countByEnumeratingWithState:&v106 objects:v121 count:16];
      }
      while (v24);

      stat v21 = v86;
    }

    char v6 = v90;
  }
  [v6 sortUsingComparator:&stru_100034D50];
  if ([v12 count] && objc_msgSend(v6, "count"))
  {
    id v30 = (void *)qword_10003A5D8;
    id v87 = v12;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      char v31 = v30;
      id v32 = [v6 count];
      id v33 = [v12 count];
      *(_DWORD *)z_stream buf = 138413058;
      id v114 = v4;
      __int16 v115 = 2048;
      id v116 = v32;
      __int16 v117 = 1024;
      int v118 = 1;
      __int16 v119 = 2048;
      id v120 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Removing prior %@ corefiles, found %lu sets (policy limit %u, %lu set staged)", buf, 0x26u);
    }
    unint64_t v34 = 0;
LABEL_38:
    while ((unint64_t)[v6 count] > v34)
    {
      BOOL v40 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = v40;
        int v42 = [v6 objectAtIndex:0];
        id v43 = [v21 stringFromDate:v42];
        *(_DWORD *)z_stream buf = 138412290;
        id v114 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Removing cores from time %@", buf, 0xCu);

        char v6 = v90;
      }
      [v6 removeObjectAtIndex:0];
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v44 = v84;
    id v45 = [v44 countByEnumeratingWithState:&v102 objects:v112 count:16];
    id v46 = v92;
    if (v45)
    {
      id v47 = v45;
      id v48 = 0;
      uint64_t v49 = *(void *)v103;
      do
      {
        for (int8x16_t i = 0; i != v47; int8x16_t i = (char *)i + 1)
        {
          long long v51 = v48;
          if (*(void *)v103 != v49) {
            objc_enumerationMutation(v44);
          }
          id v48 = *(id *)(*((void *)&v102 + 1) + 8 * i);

          long long v52 = [v48 lastPathComponent];
          long long v53 = sub_1000152C8(v52);

          if (v53 && ([v90 containsObject:v53] & 1) == 0) {
            [v89 addObject:v48];
          }
        }
        id v47 = [v44 countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v47);

      stat v21 = v86;
    }

    [v44 removeObjectsInArray:v89];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v54 = v89;
    id v55 = [v54 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v55)
    {
      id v56 = v55;
      id v57 = 0;
      uint64_t v58 = *(void *)v99;
      do
      {
        long long v59 = 0;
        long long v60 = v57;
        do
        {
          if (*(void *)v99 != v58) {
            objc_enumerationMutation(v54);
          }
          id v57 = *(id *)(*((void *)&v98 + 1) + 8 * (void)v59);

          long long v61 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            id v114 = v57;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }
          id v62 = +[NSFileManager defaultManager];
          [v62 removeItemAtPath:v57 error:0];

          long long v59 = (char *)v59 + 1;
          long long v60 = v57;
        }
        while (v56 != v59);
        id v56 = [v54 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }
      while (v56);

      stat v21 = v86;
    }

    id v12 = v87;
    goto LABEL_64;
  }
  id v35 = [v6 count];
  unsigned int v36 = (void *)qword_10003A5D8;
  BOOL v37 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v35 >= 2)
  {
    id v87 = v12;
    unint64_t v34 = 1;
    if (v37)
    {
      id v38 = v36;
      id v39 = [v6 count];
      *(_DWORD *)z_stream buf = 138412802;
      id v114 = v4;
      __int16 v115 = 2048;
      id v116 = v39;
      __int16 v117 = 1024;
      int v118 = 1;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Removing prior %@ corefiles, found %lu sets (policy limit %u)", buf, 0x1Cu);
    }
    goto LABEL_38;
  }
  id v46 = v92;
  if (v37)
  {
    BOOL v77 = v36;
    id v78 = [v6 count];
    id v79 = [v12 count];
    *(_DWORD *)z_stream buf = 134218754;
    id v114 = v78;
    __int16 v115 = 2112;
    id v116 = v85;
    __int16 v117 = 1024;
    int v118 = 1;
    __int16 v119 = 2048;
    id v120 = v79;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Found %lu sets of %@ corefiles (policy limit %u, %lu set staged), not cleaning up", buf, 0x26u);
  }
LABEL_64:
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v63 = v12;
  id v64 = [v63 countByEnumeratingWithState:&v94 objects:v110 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = 0;
    id v67 = 0;
    uint64_t v91 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v65; uint64_t j = (char *)j + 1)
      {
        uint64_t v69 = v67;
        if (*(void *)v95 != v91) {
          objc_enumerationMutation(v63);
        }
        id v70 = *(id *)(*((void *)&v94 + 1) + 8 * (void)j);

        uint64_t v66 = [v63 objectAtIndex:0];

        unsigned int v71 = +[NSFileManager defaultManager];
        BOOL v72 = [v66 lastPathComponent];
        uint64_t v73 = [v46 stringByAppendingPathComponent:v72];
        id v93 = v69;
        unsigned __int8 v74 = [v71 moveItemAtPath:v66 toPath:v73 error:&v93];
        id v67 = v93;

        if ((v74 & 1) == 0)
        {
          uint64_t v75 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)z_stream buf = 138543618;
            id v114 = v66;
            __int16 v115 = 2114;
            id v116 = v67;
            _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Cannot move staged '%{public}@' to panics folder : %{public}@", buf, 0x16u);
          }
        }
        id v46 = v92;
      }
      id v65 = [v63 countByEnumeratingWithState:&v94 objects:v110 count:16];
    }
    while (v65);

    stat v21 = v86;
  }

  return v84;
}

int64_t sub_1000178F0(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

id sub_10001ACD4(double a1)
{
  int v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  if (qword_10003A570 != -1) {
    dispatch_once(&qword_10003A570, &stru_100034C18);
  }
  if (byte_10003A569)
  {
    id v4 = +[NSTimeZone timeZoneWithName:@"UTC"];
    [v2 setTimeZone:v4];
  }
  [v2 setLocale:v3];
  [v2 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a1];
  char v6 = [v2 stringFromDate:v5];

  return v6;
}

id sub_10001ADF8(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  id v80 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:];
  id v81 = v4;
  [v4 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  unsigned int v83 = objc_opt_new();
  long long v95 = v3;
  id v82 = [v3 stringByAppendingPathComponent:@"staged"];
  id v5 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)z_stream buf = 138412290;
    id v118 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prune core files in %@", buf, 0xCu);
  }
  if (a2)
  {
    unsigned int v92 = a2;
    char v6 = +[NSFileManager defaultManager];
    char v7 = [v6 enumeratorAtPath:v3];

    int v8 = +[NSMutableDictionary dictionary];
    uint64_t v91 = objc_opt_new();
    id v9 = +[NSMutableDictionary dictionary];
    id v84 = v7;
    uint64_t v10 = [v7 nextObject];
    if (v10)
    {
      id v11 = (void *)v10;
      id v93 = 0;
      id v12 = v83;
      do
      {
        unsigned __int8 v13 = [v11 containsString:@"staged"];
        if (v13)
        {
          id v14 = [v11 lastPathComponent];
          unsigned int v15 = sub_1000152C8(v14);

          id v16 = v9;
        }
        else
        {
          unsigned int v15 = sub_1000152C8(v11);
          id v16 = v8;
        }
        id v17 = v16;
        uint64_t v18 = v17;
        if (v15)
        {
          uint64_t v19 = [v17 objectForKeyedSubscript:v15];

          uint64_t v20 = (void *)v19;
          if (!v19) {
            uint64_t v20 = objc_opt_new();
          }
          stat v21 = [v95 stringByAppendingPathComponent:v11];
          [v20 addObject:v21];

          id v93 = v20;
          [v18 setObject:v20 forKeyedSubscript:v15];
          if ((v13 & 1) == 0) {
            [v83 addObject:v15];
          }
        }

        uint64_t v22 = [v7 nextObject];

        id v11 = (void *)v22;
      }
      while (v22);
    }
    else
    {
      id v93 = 0;
      id v12 = v83;
    }
    id v24 = v9;
    if ((unint64_t)[v9 count] < 2)
    {
      unsigned int v26 = v92;
    }
    else
    {
      id v25 = (void *)qword_10003A5A8;
      unsigned int v26 = v92;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        id v78 = v25;
        id v79 = [v9 count];
        *(_DWORD *)z_stream buf = 134217984;
        id v118 = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Found %lu sets of cores under staged folder", buf, 0xCu);
      }
      id v24 = sub_10001ADF8(v82, 1);
    }
    [v12 sortUsingComparator:&stru_100034DD8];
    id v87 = v24;
    id v27 = v93;
    if ([v24 count] && (unint64_t v28 = v26 - 1, (unint64_t)objc_msgSend(v12, "count") > v28))
    {
      id v29 = (void *)qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = v29;
        id v31 = [v12 count];
        id v32 = [v87 count];
        *(_DWORD *)z_stream buf = 134218496;
        id v118 = v31;
        __int16 v119 = 1024;
        *(_DWORD *)id v120 = v26;
        *(_WORD *)&v120[4] = 2048;
        *(void *)&v120[6] = v32;
        id v33 = "Removing prior corefiles, found %lu sets (policy limit %u, %lu set staged)";
        unint64_t v34 = v30;
        uint32_t v35 = 28;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
    else
    {
      id v36 = [v12 count];
      BOOL v37 = (void *)qword_10003A5A8;
      BOOL v38 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)v36 <= v26)
      {
        if (v38)
        {
          uint64_t v58 = v37;
          id v59 = [v12 count];
          id v60 = [v87 count];
          *(_DWORD *)z_stream buf = 134218496;
          id v118 = v59;
          __int16 v119 = 1024;
          *(_DWORD *)id v120 = v26;
          *(_WORD *)&v120[4] = 2048;
          *(void *)&v120[6] = v60;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Found %lu sets of corefiles (policy limit %u, %lu set staged), not cleaning up", buf, 0x1Cu);
        }
        goto LABEL_56;
      }
      unint64_t v28 = v26;
      if (v38)
      {
        id v30 = v37;
        id v39 = [v12 count];
        *(_DWORD *)z_stream buf = 134218240;
        id v118 = v39;
        __int16 v119 = 1024;
        *(_DWORD *)id v120 = v26;
        id v33 = "Removing prior corefiles, found %lu sets (policy limit %u)";
        unint64_t v34 = v30;
        uint32_t v35 = 18;
        goto LABEL_32;
      }
    }
    while ((unint64_t)[v12 count] > v28)
    {
      long long v111 = 0uLL;
      long long v112 = 0uLL;
      long long v109 = 0uLL;
      long long v110 = 0uLL;
      BOOL v40 = [v12 objectAtIndex:0];
      long long v41 = [v8 objectForKeyedSubscript:v40];

      id v42 = [v41 countByEnumeratingWithState:&v109 objects:v116 count:16];
      if (v42)
      {
        id v43 = v42;
        id v44 = 0;
        uint64_t v45 = *(void *)v110;
        do
        {
          id v46 = 0;
          id v47 = v44;
          do
          {
            if (*(void *)v110 != v45) {
              objc_enumerationMutation(v41);
            }
            id v44 = *(id *)(*((void *)&v109 + 1) + 8 * (void)v46);

            [v91 addObject:v44];
            id v46 = (char *)v46 + 1;
            id v47 = v44;
          }
          while (v43 != v46);
          id v43 = [v41 countByEnumeratingWithState:&v109 objects:v116 count:16];
        }
        while (v43);

        id v12 = v83;
      }

      id v48 = [v12 objectAtIndex:0];
      [v8 removeObjectForKey:v48];

      [v12 removeObjectAtIndex:0];
    }
    long long v107 = 0uLL;
    long long v108 = 0uLL;
    long long v105 = 0uLL;
    long long v106 = 0uLL;
    id v49 = v91;
    id v50 = [v49 countByEnumeratingWithState:&v105 objects:v115 count:16];
    if (v50)
    {
      id v51 = v50;
      id v52 = 0;
      uint64_t v53 = *(void *)v106;
      do
      {
        id v54 = 0;
        id v55 = v52;
        do
        {
          if (*(void *)v106 != v53) {
            objc_enumerationMutation(v49);
          }
          id v52 = *(id *)(*((void *)&v105 + 1) + 8 * (void)v54);

          id v56 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            id v118 = v52;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }
          id v57 = +[NSFileManager defaultManager];
          [v57 removeItemAtPath:v52 error:0];

          id v54 = (char *)v54 + 1;
          id v55 = v52;
        }
        while (v51 != v54);
        id v51 = [v49 countByEnumeratingWithState:&v105 objects:v115 count:16];
      }
      while (v51);
    }
    id v27 = v93;
LABEL_56:
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v61 = v87;
    obuint64_t j = [v87 allValues];
    id v89 = [obj countByEnumeratingWithState:&v101 objects:v114 count:16];
    id v62 = 0;
    if (v89)
    {
      uint64_t v88 = *(void *)v102;
      int v86 = v8;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v102 != v88) {
            objc_enumerationMutation(obj);
          }
          uint64_t v90 = v63;
          id v64 = *(id *)(*((void *)&v101 + 1) + 8 * v63);

          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v27 = v64;
          id v65 = [v27 countByEnumeratingWithState:&v97 objects:v113 count:16];
          if (v65)
          {
            id v66 = v65;
            id v94 = v27;
            id v67 = 0;
            uint64_t v68 = *(void *)v98;
            do
            {
              for (int8x16_t i = 0; i != v66; int8x16_t i = (char *)i + 1)
              {
                id v70 = v62;
                unsigned int v71 = v67;
                if (*(void *)v98 != v68) {
                  objc_enumerationMutation(v94);
                }
                id v67 = *(id *)(*((void *)&v97 + 1) + 8 * i);

                BOOL v72 = +[NSFileManager defaultManager];
                uint64_t v73 = [v67 lastPathComponent];
                unsigned __int8 v74 = [v95 stringByAppendingPathComponent:v73];
                id v96 = v70;
                unsigned __int8 v75 = [v72 moveItemAtPath:v67 toPath:v74 error:&v96];
                id v62 = v96;

                uint64_t v76 = qword_10003A5A8;
                if (v75)
                {
                  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)z_stream buf = 138543362;
                    id v118 = v67;
                    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Moved staged '%{public}@ to panics folder", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)z_stream buf = 138543618;
                  id v118 = v67;
                  __int16 v119 = 2114;
                  *(void *)id v120 = v62;
                  _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Cannot move staged '%{public}@' to panics folder : %{public}@", buf, 0x16u);
                }
              }
              id v66 = [v94 countByEnumeratingWithState:&v97 objects:v113 count:16];
            }
            while (v66);

            int v8 = v86;
            long long v61 = v87;
            id v27 = v94;
          }

          uint64_t v63 = v90 + 1;
        }
        while ((id)(v90 + 1) != v89);
        id v89 = [obj countByEnumeratingWithState:&v101 objects:v114 count:16];
      }
      while (v89);
    }

    goto LABEL_77;
  }
  id v23 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)z_stream buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not pruning because the policy limit is set to 0", buf, 2u);
  }
  int v8 = 0;
LABEL_77:

  return v8;
}

id sub_10001B8A8(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  int v7 = 0;
  [*(id *)(a1 + 32) getCoreDumpInfoWithIndex:*(void *)(a1 + 40) - 1 :&v9 :&v8 :&v7];
  v10[0] = @"CorefileDataSize";
  int v2 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v8 + v9) >> 20];
  v11[0] = v2;
  v10[1] = @"NumCores";
  id v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v11[1] = v3;
  v10[2] = @"DRAMSizeMB";
  if (qword_10003A5B8 != -1) {
    dispatch_once(&qword_10003A5B8, &stru_100034DF8);
  }
  id v4 = +[NSNumber numberWithInt:dword_10003A5B0];
  v11[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v5;
}

id sub_10001BA10(uint64_t a1)
{
  v9[0] = @"coreName";
  int v2 = +[NSString stringWithUTF8String:*(void *)(a1 + 32)];
  v10[0] = v2;
  v9[1] = @"coreSize";
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = +[NSNumber numberWithInt:v4];
  v10[1] = v5;
  _DWORD v9[2] = @"DRAMSizeMB";
  if (qword_10003A5B8 != -1) {
    dispatch_once(&qword_10003A5B8, &stru_100034DF8);
  }
  char v6 = +[NSNumber numberWithInt:dword_10003A5B0];
  v10[2] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

void sub_10001BB58(id a1)
{
  size_t v5 = 8;
  unint64_t v6 = 0;
  if (sysctlbyname("hw.memsize", &v6, &v5, 0, 0))
  {
    id v1 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      int v2 = v1;
      unsigned int v3 = __error();
      uint64_t v4 = strerror(*v3);
      *(_DWORD *)z_stream buf = 136315138;
      uint64_t v8 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "failed to query sysct hw.memsize: %s", buf, 0xCu);
    }
  }
  else
  {
    dword_10003A5B0 = v6 >> 20;
  }
}

int64_t sub_10001BC48(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

uint64_t start_0(uint64_t a1, uint64_t a2)
{
  kern_return_t MatchingServices;
  uint64_t v68;
  const char *v69;
  NSObject *v70;
  uint32_t v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  int *v76;
  char *v77;
  const char *v78;
  NSObject *v79;
  const char *v80;
  NSObject *v81;
  int *v82;
  char *v83;
  int v84;
  int v85;
  __darwin_ino64_t v86;
  int v87;
  const char *v88;
  dev_t v89;
  int v90;
  const char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  io_registry_entry_t v96;
  NSObject *v97;
  _UNKNOWN **v98;
  _UNKNOWN **v99;
  __CFString *v100;
  NSObject *v101;
  unint64_t v102;
  BOOL v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  __darwin_ino64_t v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  __darwin_time_t v114;
  void *v115;
  void *v116;
  void *v117;
  unsigned __int8 v118;
  NSObject *v119;
  const char *v120;
  NSObject *v121;
  io_registry_entry_t v122;
  void *v123;
  io_object_t v124;
  unsigned char *v125;
  CFTypeRef v126;
  BOOL v127;
  const char *v128;
  NSObject *v129;
  NSObject *v130;
  uint64_t v131;
  int Size;
  size_t v133;
  __CFString *v134;
  __CFString *v135;
  int PanicLogData;
  NSObject *v137;
  CFIndex AppIntegerValue;
  uint64_t v139;
  uint64_t v140;
  __CFDictionary *v141;
  io_service_t MatchingService;
  io_object_t v143;
  CFStringRef Value;
  CFBooleanRef v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  unsigned __int8 *v149;
  int v150;
  id v151;
  NSObject *v152;
  BOOL v153;
  const char *v154;
  NSObject *v155;
  uint32_t v156;
  NSObject *v157;
  int v158;
  NSObject *v159;
  NSObject *v160;
  NSObject *v161;
  int *v162;
  char *v163;
  NSObject *v164;
  BOOL v165;
  NSObject *v166;
  __CFString *v167;
  void *v168;
  __CFDictionary *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  __CFDictionary *v175;
  NSFileAttributeType v176;
  BOOL v177;
  NSObject *v178;
  unsigned __int8 v179;
  uint64_t v180;
  NSObject *v181;
  const char *v182;
  NSObject *v183;
  unsigned __int8 v184;
  uint64_t v185;
  NSObject *v186;
  NSObject *v187;
  void *v188;
  int v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  unsigned int *v194;
  unint64_t v195;
  void *v196;
  void *v197;
  unsigned int v198;
  int v199;
  unsigned int v200;
  uint64_t v201;
  id v202;
  CFStringRef v203;
  id v204;
  uint64_t v205;
  CFUUIDRef v206;
  __CFString *v207;
  void *v208;
  void *v209;
  NSObject *v210;
  NSObject *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  id v220;
  id v221;
  id v222;
  id v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  id v228;
  BOOL v229;
  char v230;
  int v231;
  BOOL v232;
  char v233;
  void *v234;
  void *v235;
  unsigned int v236;
  int v237;
  int v238;
  NSObject *v239;
  id v240;
  unint64_t v241;
  BOOL v242;
  int *v243;
  char *v244;
  NSObject *v245;
  void *v246;
  void *v247;
  __CFString *v248;
  __CFString *v249;
  void *v250;
  NSObject *v251;
  void *v252;
  id v253;
  __CFString *v254;
  ssize_t v255;
  void *v256;
  NSObject *v257;
  void *v258;
  NSObject *v259;
  int v260;
  int *v261;
  char *v262;
  io_iterator_t v263;
  uint64_t v264;
  const char *v265;
  NSObject *v266;
  uint32_t v267;
  NSObject *v268;
  void *v269;
  void *v270;
  id v271;
  CFStringRef v272;
  uint64_t v273;
  CFStringRef v274;
  PanicReport *v275;
  void *v276;
  unsigned int v277;
  NSObject *v278;
  NSObject *v279;
  NSObject *v280;
  id v281;
  void *v282;
  void *v283;
  unsigned int v284;
  id v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  id v290;
  void *v291;
  BOOL v292;
  NSObject *v293;
  void *v294;
  void *v295;
  int v296;
  dev_t st_dev;
  NSObject *v298;
  BOOL v299;
  void *v300;
  NSObject *v301;
  id v302;
  id v303;
  NSObject *v304;
  void *v305;
  id v306;
  CFStringRef v307;
  id v308;
  NSObject *v309;
  uint64_t v310;
  void *v311;
  id v312;
  id v313;
  void *v314;
  void *v315;
  id v316;
  void *v317;
  uint64_t v318;
  uint64_t j;
  char v320;
  char v321;
  UserCoreFileHandler *v322;
  UserCoreFileHandler *v323;
  NSObject *v324;
  id v325;
  __CFString *v326;
  FILE *v327;
  __CFString *v328;
  int *v329;
  void *v330;
  int v331;
  NSObject *v332;
  char *v333;
  NSObject *v334;
  int v335;
  CFStringRef v336;
  CFStringRef v337;
  id v338;
  uint64_t v339;
  void *k;
  int v341;
  __CFString *v342;
  void *v343;
  uint64_t v344;
  __CFString *v345;
  id v346;
  id v347;
  void *v348;
  NSObject *v349;
  void *v350;
  void *v351;
  void *v352;
  NSObject *v353;
  NSObject *v354;
  void *v355;
  KeyStore *v356;
  id v357;
  void *v358;
  NSObject *v359;
  uint64_t result;
  void *v361;
  const char *v362;
  CFStringRef v363;
  void *v364;
  unsigned int v365;
  NSObject *v366;
  id v367;
  id v368;
  void *v369;
  BOOL v370;
  __CFString *v371;
  NSObject *v372;
  int *v373;
  char *v374;
  int *v375;
  char *v376;
  NSObject *v377;
  int *v378;
  char *v379;
  NSObject *v380;
  int *v381;
  char *v382;
  void *v383;
  NSObject *v384;
  void *v385;
  void *v386;
  NSObject *v387;
  int v388;
  NSObject *v389;
  void *v390;
  char v391;
  id v392;
  NSObject *v393;
  NSObject *v394;
  id v395;
  id v396;
  uint64_t v397;
  NSObject *v398;
  id v399;
  id v400;
  uint64_t v401;
  id v402;
  void *v403;
  NSObject *v404;
  unsigned int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  int *v409;
  void *v410;
  int v411;
  NSObject *v412;
  char *v413;
  NSObject *v414;
  id v415;
  id v416;
  NSObject *v417;
  int *v418;
  char *v419;
  const char *v420;
  int *v421;
  char *v422;
  void *v423;
  id v424;
  id v425;
  id v426;
  uint64_t v427;
  void *m;
  void *v429;
  void *v430;
  void *v431;
  __CFString *v432;
  __CFString *v433;
  __CFString *v434;
  __CFString *v435;
  __CFString *v436;
  uint64_t v437;
  void *v438;
  CFStringRef v439;
  CFStringRef v440;
  NSObject *v441;
  NSObject *v442;
  int *v443;
  char *v444;
  void *v445;
  NSObject *v446;
  int v447;
  int *v448;
  char *v449;
  void *v450;
  __CFString *v451;
  void *v452;
  id v453;
  id v454;
  unsigned int v455;
  void *v456;
  __CFString *v457;
  id v458;
  __CFString *v459;
  id v460;
  __CFString *v461;
  unint64_t v462;
  void *v463;
  unsigned int *v464;
  void *v465;
  NSObject *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  uint64_t v471;
  id v472;
  id v473;
  id obj;
  id obja;
  id objb;
  NSObject *v477;
  id v478;
  id v479;
  id v480;
  id v481;
  id v482;
  id v483;
  id v484;
  id v485;
  id v486[6];
  _UNKNOWN **v487;
  _UNKNOWN **v488;
  _UNKNOWN **v489;
  __CFString *v490;
  uint64_t v491;
  id v492;
  uint8_t v493[8];
  id v494[6];
  uint64_t v495;
  CFMutableDictionaryRef properties[6];
  stat block;
  long long v498;
  long long v499;
  long long v500;
  long long v501;
  long long v502;
  unsigned char v503[31];
  id v504[2];
  id v505[2];
  unsigned char v506[26];
  __int16 v507;
  __CFString *v508;
  __int16 v509;
  unsigned char v510[10];
  uint8_t buf[32];
  long long v512;
  long long v513;

  v469 = +[DumpPanicArgParser withArgs:a2 count:a1];
  size_t v5 = v469;
  if ([v469 help])
  {
    [v469 usage];
    goto LABEL_3;
  }
  if (pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_707;
  }
  os_log_t v7 = os_log_create("com.apple.DumpPanic", "panicprocessing");
  uint64_t v8 = (void *)qword_10003A5D8;
  qword_10003A5D8 = (uint64_t)v7;

  if (!qword_10003A5D8)
  {
LABEL_707:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_708;
  }
  v502 = 0u;
  memset(v503, 0, sizeof(v503));
  v500 = 0u;
  v501 = 0u;
  v498 = 0u;
  v499 = 0u;
  memset(&block, 0, sizeof(block));
  *(void *)v506 = 255;
  if (sysctlbyname("hw.osenvironment", &block, (size_t *)v506, 0, 0))
  {
    uint64_t v9 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      id v81 = v9;
      id v82 = __error();
      unsigned int v83 = strerror(*v82);
      id v84 = *__error();
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = v83;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v84;
      _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "failed to look up hw.osenvironment: %s(%d)", buf, 0x12u);
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v11 = *(void *)&block.st_dev == 0x797265766F636572
       && *(void *)((char *)&block.st_dev + 3) == 0x736F797265766FLL;
    BOOL v10 = v11 || *(void *)&block.st_dev == 0x74736F6E67616964 && LODWORD(block.st_ino) == 7562089;
    unsigned __int8 v13 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 136315138;
      *(void *)&uint8_t buf[4] = &block;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "found hw.osenvironment: %s", buf, 0xCu);
    }
  }
  byte_10003A540 = v10;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  unsigned int v15 = (void *)qword_10003A538;
  qword_10003A538 = (uint64_t)v14;

  if (&_MKBGetDeviceLockState)
  {
    id v16 = dispatch_get_global_queue(0, 0);
    uint32_t v17 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&unk_100039AC0, v16, &stru_100034B98);

    if (v17)
    {
      uint64_t v18 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(block.st_dev) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to register for device lock state notification.", (uint8_t *)&block, 2u);
      }
    }
  }
  uint64_t v19 = v469;
  if ((objc_msgSend(v469, "force_run") & 1) == 0)
  {
    memset(&block, 0, sizeof(block));
    if (!lstat("/var/run/com.apple.DumpPanic.finishedThisBoot", &block))
    {
      uint64_t v22 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DumpPanic has already finished running for current boot", buf, 2u);
        uint64_t v22 = qword_10003A5D8;
      }
      uint64_t v6 = 0;
      size_t v5 = v469;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_581;
      }
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Use '-f/--force' to run DumpPanic manually", (uint8_t *)&block, 2u);
LABEL_3:
      uint64_t v6 = 0;
LABEL_581:

      return v6;
    }
    int v20 = *__error();
    stat v21 = qword_10003A5D8;
    if (v20 == 2)
    {
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No previous DumpPanic finish cookie", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v380 = v21;
      v381 = __error();
      v382 = strerror(*v381);
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = "/var/run/com.apple.DumpPanic.finishedThisBoot";
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v382;
      _os_log_error_impl((void *)&_mh_execute_header, v380, OS_LOG_TYPE_ERROR, "Failed to stat %s with error %s", buf, 0x16u);
    }
    uint64_t v19 = v469;
  }
  if (![v19 restoreos]) {
    goto LABEL_44;
  }
  io_registry_entry_t v23 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v23)
  {
    unint64_t v28 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error getting a reference to IODeviceTree:/options", (uint8_t *)&block, 2u);
    }
    uint64_t v6 = 1;
LABEL_580:
    size_t v5 = v469;
    goto LABEL_581;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v23, @"ota-uuid", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    id v25 = (void *)CFProperty;
    CFTypeID v26 = CFGetTypeID(CFProperty);
    if (v26 == CFDataGetTypeID())
    {
      id v27 = [v25 mutableCopy];
      [v27 appendBytes:&unk_10002A148 length:1];
      v460 = v27;
    }
    else
    {
      v460 = 0;
    }
    CFRelease(v25);
  }
  else
  {
LABEL_44:
    v460 = 0;
  }
  id v29 = (id)qword_10003A5D8;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "DumpPanic launched after boot to check for device panic data", (uint8_t *)&block, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  v457 = (__CFString *)mach_absolute_time();
  os_log_t v30 = os_log_create("com.apple.DumpPanic", "socd");
  id v31 = (void *)qword_10003A5C0;
  qword_10003A5C0 = (uint64_t)v30;

  if (qword_10003A5C0)
  {
    *(void *)z_stream buf = 0;
    id v32 = os_log_create("com.apple.osanalytics.preoslog", "default");
    os_log_t v33 = os_log_create("com.apple.osanalytics.preoslog", "buffer");
    v506[0] = 1;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Flush preoslog", (uint8_t *)&block, 2u);
    }
    if (sysctlbyname("kern.preoslog", 0, (size_t *)buf, v506, 1uLL))
    {
      if (*__error() == 2)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "kern.preoslog is not supported by this kernel", (uint8_t *)&block, 2u);
        }
      }
      else
      {
        id v36 = v32;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v375 = __error();
          v376 = strerror(*v375);
          block.st_dev = 136315138;
          *(void *)&block.st_mode = v376;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Couldn't obtain preoslog buffer size, result %s", (uint8_t *)&block, 0xCu);
        }
      }
      __error();
LABEL_69:

      rollAppleCareLogs();
      v471 = sub_100011194();
      unsigned __int8 v37 = [v469 restoreos];
      *(void *)&block.st_dev = _NSConcreteStackBlock;
      uint64_t v4 = 3221225472;
      block.st_ino = 3221225472;
      *(void *)&block.st_uid = sub_10000FFB0;
      *(void *)&block.st_rdev = &unk_100034BF8;
      LOBYTE(block.st_atimespec.tv_sec) = v37;
      if (qword_10003A560 == -1) {
        goto LABEL_70;
      }
      goto LABEL_709;
    }
    if (*(void *)buf)
    {
      unint64_t v34 = (char *)malloc_type_malloc(*(size_t *)buf, 0x891CCA11uLL);
      if (v34)
      {
        if (sysctlbyname("kern.preoslog", v34, (size_t *)buf, 0, 0))
        {
          uint32_t v35 = v32;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v421 = __error();
            v422 = strerror(*v421);
            block.st_dev = 136315138;
            *(void *)&block.st_mode = v422;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't obtain preoslog buffer, sysctl failed with result %s", (uint8_t *)&block, 0xCu);
          }

          goto LABEL_608;
        }
        unsigned int v85 = *(_DWORD *)v34;
        if (*(_DWORD *)v34 == 1280528208)
        {
          int v86 = *(void *)buf;
          if (*(void *)buf == *((_DWORD *)v34 + 1))
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v87 = v34[12];
              uint64_t v88 = "UNKNOWN";
              id v89 = *((_DWORD *)v34 + 2);
              if (v87 == 1) {
                uint64_t v88 = "macefi";
              }
              uint64_t v90 = v34[13];
              BOOL v11 = v87 == 0;
              block.st_dev = 134284547;
              uint64_t v91 = "iboot";
              if (!v11) {
                uint64_t v91 = v88;
              }
              *(void *)&block.st_mode = v34;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v86;
              HIWORD(block.st_gid) = 1024;
              block.st_rdev = v89;
              *((_WORD *)&block.st_rdev + 2) = 2080;
              *(void *)((char *)&block.st_rdev + 6) = v91;
              HIWORD(block.st_atimespec.tv_sec) = 1024;
              LODWORD(block.st_atimespec.tv_nsec) = v90;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Found a valid preoslog buffer at va %{private}p, size %zu bytes, write offset %d, source %s, wrapped %d", (uint8_t *)&block, 0x2Cu);
            }
            unsigned int v92 = v34 + 14;
            id v93 = (*((_DWORD *)v34 + 2) + 1);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(void *)&block.st_mode = v34 + 14;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v93;
              _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Lower buffer is at va %p, size %zu bytes", (uint8_t *)&block, 0x16u);
            }
            id v94 = *((unsigned int *)v34 + 1) - v93 - 14;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(void *)&block.st_mode = &v92[v93];
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v94;
              _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Upper buffer is at va %p, size %zu bytes", (uint8_t *)&block, 0x16u);
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Warning: preoslog log timestamps are not original, they are assigned later when the buffer is being flushed", (uint8_t *)&block, 2u);
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "preoslog dump begin", (uint8_t *)&block, 2u);
            }
            if (v34[13]) {
              sub_10000FFFC(v33, &v92[v93], v94);
            }
            sub_10000FFFC(v33, v34 + 14, v93);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "preoslog dump end", (uint8_t *)&block, 2u);
            }
            goto LABEL_608;
          }
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
LABEL_608:
            free(v34);
            goto LABEL_69;
          }
          LOWORD(block.st_dev) = 0;
          int v265 = "Buffer size returned by sysctl doesn't match buffer size recorded in the header, preoslog buffer is corrupted";
          unsigned int v266 = v32;
          v267 = 2;
        }
        else
        {
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            goto LABEL_608;
          }
          block.st_dev = 67109376;
          *(_DWORD *)&block.st_mode = 1280528208;
          LOWORD(block.st_ino) = 1024;
          *(_DWORD *)((char *)&block.st_ino + 2) = v85;
          int v265 = "Magic for preoslog buffer doesn't match, expected %08X, given %08X";
          unsigned int v266 = v32;
          v267 = 14;
        }
        _os_log_error_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_ERROR, v265, (uint8_t *)&block, v267);
        goto LABEL_608;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      LOWORD(block.st_dev) = 0;
      id v78 = "Failed to allocate memory for preoslog buffer";
    }
    else
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      LOWORD(block.st_dev) = 0;
      id v78 = "preoslog buffer size is 0";
    }
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v78, (uint8_t *)&block, 2u);
    goto LABEL_69;
  }
LABEL_708:
  _os_assert_log();
  _os_crash();
  __break(1u);
LABEL_709:
  dispatch_once(&qword_10003A560, &block);
LABEL_70:
  id v38 = +[NSMutableArray arrayWithCapacity:0];
  if (!v38)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_711;
  }
  v468 = v38;

  id v39 = sub_100015670("AppleDialogSPMIPMU", "IOPMUBootSOCD", "IOPMUBootSOCDClear", 0, 0);
  if (v39)
  {
    [v468 addObjectsFromArray:v39];
    BOOL v40 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(void *)&block.st_mode = @"AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "loaded socd data from: %@", (uint8_t *)&block, 0xCu);
    }
  }
  long long v41 = sub_100015670("AppleSMC", "socd-data", "remove-socd-data", "socd-data-in-progress", 0x32u);

  if (v41)
  {
    [v468 addObjectsFromArray:v41];
    id v42 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(void *)&block.st_mode = @"AppleSMC";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "loaded socd data from: %@", (uint8_t *)&block, 0xCu);
    }
  }
  BOOL v43 = [v468 count] == 0;

  id v44 = (id)qword_10003A5D8;
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
  if (v43)
  {
    if (v45)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "No socd data found in local device", (uint8_t *)&block, 2u);
    }
LABEL_98:

    goto LABEL_99;
  }
  if (v45)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "socd data found in local device", (uint8_t *)&block, 2u);
  }

  if (v471)
  {
    id v46 = +[NSURL fileURLWithPathComponents:&off_100037C28];
    id v47 = v468;
    id v48 = v46;
    if (!v48)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_718;
    }
    id v44 = v48;

    id v49 = v47;
    v512 = 0u;
    v513 = 0u;
    memset(buf, 0, sizeof(buf));
    obuint64_t j = v49;
    id v50 = [obj countByEnumeratingWithState:buf objects:&block count:16];
    if (v50)
    {
      uint64_t v51 = **(void **)&buf[16];
      while (2)
      {
        for (int8x16_t i = 0; i != v50; int8x16_t i = (char *)i + 1)
        {
          if (**(void **)&buf[16] != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = *(void **)(*(void *)&buf[8] + 8 * i);
          id v54 = [v44 path];
          id v55 = +[NSNumber numberWithInt:0];
          id v56 = [v55 stringValue];
          id v57 = [v54 stringByAppendingString:v56];
          LOBYTE(v53) = [v53 writeToFile:v57 atomically:1];

          if ((v53 & 1) == 0)
          {
            uint64_t v58 = qword_10003A5C0;
            if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v506 = 138412290;
              *(void *)&v506[4] = v44;
              _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "unable to write socd data to file: %@", v506, 0xCu);
            }

            id v59 = (id)qword_10003A5D8;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 138412290;
              *(void *)&block.st_mode = v44;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "failed to write socd data to file: %@", (uint8_t *)&block, 0xCu);
            }

            goto LABEL_98;
          }
        }
        id v50 = [obj countByEnumeratingWithState:buf objects:&block count:16];
        if (v50) {
          continue;
        }
        break;
      }
    }

    goto LABEL_98;
  }
LABEL_99:
  v487 = &off_100037898;
  v488 = &off_100037898;
  v489 = &off_100037898;
  id v60 = +[NSMutableArray arrayWithCapacity:0];
  v490 = v60;
  long long v61 = +[NSMutableArray arrayWithCapacity:0];
  v491 = (uint64_t)v61;
  id v62 = +[NSMutableArray arrayWithCapacity:0];
  v492 = v62;
  if (!access("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0))
  {
    BOOL v72 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "PMU fault data already processed this boot", (uint8_t *)&block, 2u);
    }
    goto LABEL_109;
  }
  if (*__error() != 2)
  {
    unsigned __int8 v74 = (void *)qword_10003A5D8;
    uint64_t v73 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_154;
    }
    unsigned __int8 v75 = v74;
    uint64_t v76 = __error();
    BOOL v77 = strerror(*v76);
    block.st_dev = 136315394;
    *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
    WORD2(block.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v77;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "failed to check whether PMU fault data has been processed using access(%s, O_RDONLY) returned: %s", (uint8_t *)&block, 0x16u);

    goto LABEL_120;
  }
  uint64_t v63 = IOServiceMatching("IOService");
  CFDictionaryRef v64 = v63;
  if (!v63)
  {
    id v79 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
LABEL_120:
      uint64_t v73 = 0;
      goto LABEL_154;
    }
    LOWORD(block.st_dev) = 0;
    id v80 = "Failed to allocate matching dictionary to match against PMU";
LABEL_660:
    _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, v80, (uint8_t *)&block, 2u);
    goto LABEL_120;
  }
  CFDictionarySetValue(v63, @"IOPropertyMatch", &off_100037AD8);
  LODWORD(obj) = IOServiceGetMatchingService(kIOMainPortDefault, v64);
  if (!obj)
  {
    id v79 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_120;
    }
    LOWORD(block.st_dev) = 0;
    id v80 = "Failed to locate primary PMU service";
    goto LABEL_660;
  }
  id v65 = IOServiceMatching("IOService");
  CFDictionaryRef v66 = v65;
  if (!v65)
  {
    long long v95 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(block.st_dev) = 0;
    uint64_t v69 = "Failed to allocate matching dictionary to match against PMU";
LABEL_693:
    id v70 = v95;
    unsigned int v71 = 2;
    goto LABEL_694;
  }
  CFDictionarySetValue(v65, @"IOPropertyMatch", &off_100037B00);
  *(_DWORD *)z_stream buf = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v66, (io_iterator_t *)buf);
  if (MatchingServices)
  {
    uint64_t v68 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      block.st_dev = 67109120;
      *(_DWORD *)&block.st_mode = MatchingServices;
      uint64_t v69 = "Failed to get matching PMU ioservices: 0x%x";
      id v70 = v68;
      unsigned int v71 = 8;
LABEL_694:
      _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, v69, (uint8_t *)&block, v71);
    }
LABEL_142:
    uint64_t v73 = 0;
    id v96 = obj;
    goto LABEL_143;
  }
  unsigned int v263 = *(_DWORD *)buf;
  if (!*(_DWORD *)buf)
  {
    long long v95 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    LOWORD(block.st_dev) = 0;
    uint64_t v69 = "IOService match returned an empty iterator for PMU services";
    goto LABEL_693;
  }
  id v96 = obj;
  while (IOIteratorIsValid(v263))
  {
    while (1)
    {
      v264 = IOIteratorNext(*(io_iterator_t *)buf);
      uint64_t v73 = v264;
      if (!v264) {
        break;
      }
      if (v264 != obj) {
        goto LABEL_143;
      }
    }
    if (IOIteratorIsValid(*(io_iterator_t *)buf)) {
      break;
    }
    IOIteratorReset(*(io_iterator_t *)buf);
    unsigned int v263 = *(_DWORD *)buf;
  }
  uint64_t v73 = 0;
LABEL_143:
  properties[0] = 0;
  if (!IORegistryEntryCreateCFProperties(v96, properties, kCFAllocatorDefault, 0))
  {
    CFDictionaryGetValue(properties[0], @"IOPMUBootErrorPanicCount");
    v487 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

    CFDictionaryGetValue(properties[0], @"IOPMUBootErrorFailCount");
    v488 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

    CFDictionaryGetValue(properties[0], @"IOPMUBootErrorStage");
    v489 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

    CFDictionaryGetValue(properties[0], @"IOPMUBootErrorAppName");
    long long v98 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    long long v99 = off_100039B48;
    off_100039B48 = v98;

    CFDictionaryGetValue(properties[0], @"IOPMUBootFaultInfo");
    long long v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v490 = v100;

    if (v73)
    {
      *(void *)z_stream buf = 0;
      if (IORegistryEntryCreateCFProperties(v73, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0))
      {
        long long v101 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "unable to read out auxiliary PMU properties", (uint8_t *)&block, 2u);
        }
        IOObjectRelease((io_object_t)obj);
        IOObjectRelease(v73);
        goto LABEL_153;
      }
      v397 = CFDictionaryGetValue(*(CFDictionaryRef *)buf, @"IOPMUBootFaultInfo");
      v491 = v397;

      v398 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 138412290;
        *(void *)&block.st_mode = v397;
        _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_DEFAULT, "read out auxiliary PMU fault data: boot fault info: %@", (uint8_t *)&block, 0xCu);
      }
    }
    v399 = objc_alloc_init((Class)NSMutableArray);
    v492 = v399;

    v512 = 0u;
    v513 = 0u;
    memset(buf, 0, sizeof(buf));
    v326 = v100;
    v400 = [(__CFString *)v326 countByEnumeratingWithState:buf objects:&block count:16];
    if (v400)
    {
      id v60 = 0;
      v401 = **(void **)&buf[16];
      v335 = -1;
      do
      {
        for (uint64_t j = 0; (id)j != v400; ++j)
        {
          if (**(void **)&buf[16] != v401) {
            objc_enumerationMutation(v326);
          }
          int v187 = *(id *)(*(void *)&buf[8] + 8 * j);

          id v60 = (__CFString *)v187;
          if ([v187 containsString:@","])
          {
            v402 = [v187 rangeOfString:@","];
            if (v402 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              _os_assert_log();
              _os_crash();
              __break(1u);
              goto LABEL_664;
            }
            v399 = v492;
            long long v100 = [(__CFString *)v60 substringToIndex:v402];
            [v492 addObject:v100];
          }
          else
          {
            v399 = v492;
            [v492 addObject:v60];
          }
        }
        v400 = [(__CFString *)v326 countByEnumeratingWithState:buf objects:&block count:16];
      }
      while (v400);
    }
    sub_100010900((io_registry_entry_t)obj);
    sub_100010900(v73);
    IOObjectRelease((io_object_t)obj);
    if (v73) {
      IOObjectRelease(v73);
    }
    v403 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v404 = v403;
      v405 = [v487 intValue];
      v406 = [v488 intValue];
      v407 = [v489 intValue];
      v408 = [off_100039B48 intValue];
      *(_DWORD *)v506 = 67110402;
      *(_DWORD *)&v506[4] = v405;
      *(_WORD *)&v506[8] = 1024;
      *(_DWORD *)&v506[10] = v406;
      *(_WORD *)&v506[14] = 1024;
      *(_DWORD *)&v506[16] = v407;
      *(_WORD *)&v506[20] = 1024;
      *(_DWORD *)&v506[22] = v408;
      v507 = 2112;
      v508 = v490;
      v509 = 2112;
      *(void *)v510 = v399;
      _os_log_impl((void *)&_mh_execute_header, v404, OS_LOG_TYPE_DEFAULT, "read out PMU fault data: resetCount: %d, bootFailCount: %d, boot stage: 0x%x, boot app hash: %d, boot faults: %@, universal boot faults: %@:", v506, 0x2Eu);
    }
    if ((creat("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0x100u) & 0x80000000) == 0) {
      goto LABEL_643;
    }
    v409 = __error();
    v410 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v411 = *v409;
      v412 = v410;
      v413 = strerror(v411);
      *(_DWORD *)v506 = 136315394;
      *(void *)&v506[4] = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
      *(_WORD *)&v506[12] = 2080;
      *(void *)&v506[14] = v413;
      _os_log_error_impl((void *)&_mh_execute_header, v412, OS_LOG_TYPE_ERROR, "failed to creat() PMU fault data processed cookie at path %s with error %s", v506, 0x16u);

LABEL_643:
      uint64_t v73 = 1;
      goto LABEL_154;
    }
LABEL_109:
    uint64_t v73 = 1;
    goto LABEL_154;
  }
  long long v97 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "unable to read out primary PMU properties", (uint8_t *)&block, 2u);
  }
  IOObjectRelease((io_object_t)obj);
  if (v73)
  {
    IOObjectRelease(v73);
LABEL_153:
    uint64_t v73 = 0;
  }
LABEL_154:
  long long v102 = (unint64_t)(id)qword_10003A5D8;
  long long v103 = os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_DEFAULT);
  if (!v73)
  {
    if (v103)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v102, OS_LOG_TYPE_DEFAULT, "No boot fault data found in local device", (uint8_t *)&block, 2u);
    }
    goto LABEL_177;
  }
  if (v103)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v102, OS_LOG_TYPE_DEFAULT, "boot fault data found in local device", (uint8_t *)&block, 2u);
  }

  if (v471)
  {
    long long v104 = +[NSURL fileURLWithPathComponents:&off_100037C40];
    sub_100010A14(v486, (id *)&v487);
    long long v102 = v104;
    long long v105 = v486[0];
    if (v105)
    {
      long long v106 = v105;

      long long v107 = v486[1];
      if (v107)
      {
        long long v108 = (__darwin_ino64_t)v107;

        long long v109 = v486[2];
        if (v109)
        {
          long long v110 = v109;

          long long v111 = v486[3];
          if (v111)
          {
            long long v112 = v111;

            BOOL v113 = v486[5];
            if (v113)
            {
              id v114 = (__darwin_time_t)v113;

              *(void *)z_stream buf = @"resetCount";
              *(void *)&buf[8] = @"bootFailCount";
              *(void *)&block.st_dev = v106;
              block.st_ino = v108;
              *(void *)&uint8_t buf[16] = @"bootStage";
              *(void *)&buf[24] = @"rawBootFaults";
              *(void *)&block.st_uid = v110;
              *(void *)&block.st_rdev = v112;
              *(void *)&v512 = @"universalBootFaults";
              block.st_atimespec.tv_sec = v114;
              __int16 v115 = +[NSDictionary dictionaryWithObjects:&block forKeys:buf count:5];
              properties[0] = 0;
              id v116 = +[NSJSONSerialization dataWithJSONObject:v115 options:0 error:properties];
              uint64_t v73 = properties[0];
              if (v73 || !v116)
              {
                __int16 v119 = qword_10003A5D8;
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_174;
                }
                *(_DWORD *)v506 = 138412290;
                *(void *)&v506[4] = v73;
                id v120 = "unable to serialize json: %@";
              }
              else
              {
                __int16 v117 = [(id)v102 path];
                id v118 = [v116 writeToFile:v117 atomically:1];

                __int16 v119 = qword_10003A5D8;
                if (v118)
                {
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v506 = 138412290;
                    *(void *)&v506[4] = v102;
                    _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "wrote boot fault data to: %@", v506, 0xCu);
                  }

                  sub_1000108A4((uint64_t)v486);
LABEL_177:

                  goto LABEL_178;
                }
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                {
LABEL_174:

                  sub_1000108A4((uint64_t)v486);
                  v121 = (id)qword_10003A5D8;
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                  {
                    block.st_dev = 138412290;
                    *(void *)&block.st_mode = v102;
                    _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "failed to write boot fault data to file: %@", (uint8_t *)&block, 0xCu);
                  }

                  goto LABEL_177;
                }
                *(_DWORD *)v506 = 138412290;
                *(void *)&v506[4] = v102;
                id v120 = "unable to write json to file: %@";
              }
              _os_log_error_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, v120, v506, 0xCu);
              goto LABEL_174;
            }
LABEL_722:
            _os_assert_log();
            _os_crash();
            __break(1u);
            goto LABEL_723;
          }
LABEL_721:
          _os_assert_log();
          _os_crash();
          __break(1u);
          goto LABEL_722;
        }
LABEL_720:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_721;
      }
LABEL_719:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_720;
    }
LABEL_718:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_719;
  }
LABEL_178:
  memset(&block, 0, sizeof(block));
  v122 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  v123 = &unk_10003A000;
  id v124 = v122;
  id v125 = &unk_10003A000;
  if (!v122)
  {
    id v130 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "Error getting a reference to IODeviceTree:/defaults", buf, 2u);
    }
    goto LABEL_194;
  }
  id v126 = IORegistryEntryCreateCFProperty(v122, @"supported-legacy-panic-flow", kCFAllocatorDefault, 0);
  if (v126)
  {
    byte_10003A598 = 1;
    CFRelease(v126);
  }
  IOObjectRelease(v124);
  if ((byte_10003A598 & 1) == 0)
  {
    v131 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_194;
    }
    *(_WORD *)z_stream buf = 0;
    v128 = "Device tree indicates that device never supported legacy panic path";
LABEL_192:
    v129 = v131;
    goto LABEL_193;
  }
  if (!lstat("/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed", &block))
  {
    v131 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_194;
    }
    *(_WORD *)z_stream buf = 0;
    v128 = "Device supported legacy panic path, file marker found";
    goto LABEL_192;
  }
  long long v102 = *__error();
  uint64_t v73 = qword_10003A5D8;
  uint64_t v127 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v102 != 2)
  {
    if (v127)
    {
      uint64_t v73 = (uint64_t)(id)v73;
      int8x16_t v243 = __error();
      uint64_t v244 = strerror(*v243);
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v244;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v73, OS_LOG_TYPE_DEFAULT, "Failed to stat %s with error %s", buf, 0x16u);
    }
    goto LABEL_194;
  }
  if (v127)
  {
    *(_WORD *)z_stream buf = 0;
    v128 = "Device supported legacy panic path, no existing marker file found";
    v129 = v73;
LABEL_193:
    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, v128, buf, 2u);
  }
LABEL_194:
  if (!AppleNVMeDeviceSupportsPanicLogAccess())
  {
    v494[0] = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PanicDev", @"com.apple.DumpPanic", 0);
    if (AppIntegerValue >= 1) {
      CFStringRef v139 = AppIntegerValue;
    }
    else {
      CFStringRef v139 = 15;
    }
    v140 = 1;
    while (1)
    {
      unsigned int v141 = IOServiceMatching("IOMedia");
      *(void *)v506 = @"IOPropertyMatch";
      *(void *)z_stream buf = &off_100037B28;
      CFDictionarySetValue(v141, @"IOParentMatch", +[NSDictionary dictionaryWithObjects:buf forKeys:v506 count:1]);
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v141);
      v143 = MatchingService;
      if (MatchingService)
      {
        properties[0] = 0;
        if (IORegistryEntryCreateCFProperties(MatchingService, properties, kCFAllocatorDefault, 0))
        {
          IOObjectRelease(v143);
        }
        else
        {
          Value = (const __CFString *)CFDictionaryGetValue(properties[0], @"BSD Name");
          v145 = (const __CFBoolean *)CFDictionaryGetValue(properties[0], @"Whole");
          if (Value && v145 == kCFBooleanTrue)
          {
            CFStringGetCString(Value, &aDevRdiskx[6], 74, 0x8000100u);
            id v125 = (unsigned char *)&unk_10003A000;
            int8x16_t v245 = qword_10003A5D8;
            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 136315138;
              *(void *)&block.st_mode = aDevRdiskx;
              _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "Matched registered panic device: %s", (uint8_t *)&block, 0xCu);
            }
            CFRelease(properties[0]);
            IOObjectRelease(v143);
            int8x16_t v246 = +[NSString stringWithUTF8String:aDevRdiskx];
            int8x16_t v247 = +[NSURL fileURLWithPath:v246];

            if (!v247)
            {
LABEL_217:
              v123 = &unk_10003A000;
              int v147 = qword_10003A5D8;
              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(block.st_dev) = 0;
                _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "This device does not support the AppleNVMeDevice API and no paniclog block device was found.", (uint8_t *)&block, 2u);
              }
              v135 = 0;
              goto LABEL_220;
            }
            uint64_t v73 = v247;

            v494[0] = 0;
            uint32_t v248 = (__CFString *)malloc_type_valloc(0x240000uLL, 0x5D8CBCE0uLL);
            int8x16_t v249 = v248;
            if (v248)
            {
              bzero(v248, 0x240000uLL);
              v494[0] = 0;
              unsigned int v250 = (void *)qword_10003A5D8;
              id v60 = v249;
              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
              {
                v251 = v250;
                v252 = [(id)v73 path];
                block.st_dev = 138412290;
                *(void *)&block.st_mode = v252;
                _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "Opening paniclog path '%@'\n", (uint8_t *)&block, 0xCu);
              }
              v253 = [(id)v73 path];
              LODWORD(v133) = open((const char *)[v253 UTF8String], 0);

              if ((v133 & 0x80000000) != 0)
              {
                v369 = (void *)qword_10003A5D8;
                v370 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR);
                v371 = v60;
                if (v370)
                {
                  v442 = v369;
                  v443 = __error();
                  v444 = strerror(*v443);
                  v445 = [(id)v73 path];
                  block.st_dev = 136315394;
                  *(void *)&block.st_mode = v444;
                  WORD2(block.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v445;
                  _os_log_error_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_ERROR, "ERROR: '%s' when opening '%@'", (uint8_t *)&block, 0x16u);

                  v371 = v60;
                }
                free(v371);
                unint64_t v254 = 0;
                goto LABEL_658;
              }
              unint64_t v254 = v60;
              size_t v255 = pread(v133, v60, 0x240000uLL, 0);
              v256 = (void *)v255;
              if (v255 == -1)
              {
                if (*__error() == 22)
                {
                  v383 = (void *)qword_10003A5D8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                  {
                    v384 = v383;
                    v385 = [(id)v73 path];
                    block.st_dev = 138412290;
                    *(void *)&block.st_mode = v385;
                    _os_log_impl((void *)&_mh_execute_header, v384, OS_LOG_TYPE_DEFAULT, "No panic data detected from '%@'", (uint8_t *)&block, 0xCu);

                    unint64_t v254 = v60;
                  }
                  free(v254);
                  unint64_t v254 = 0;
                  goto LABEL_657;
                }
              }
              else if ((v255 & 0x8000000000000000) == 0)
              {
                int v257 = qword_10003A5D8;
                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                {
                  block.st_dev = 134217984;
                  *(void *)&block.st_mode = v256;
                  _os_log_impl((void *)&_mh_execute_header, v257, OS_LOG_TYPE_DEFAULT, "Read %ld bytes from panic device", (uint8_t *)&block, 0xCu);
                }
                v494[0] = v256;
                LODWORD(properties[0]) = 0;
                if (ioctl(v133, 0x40046418uLL, properties))
                {
                  int v258 = (void *)qword_10003A5D8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                  {
                    v259 = v258;
                    v260 = *__error();
                    v261 = __error();
                    v262 = strerror(*v261);
                    block.st_dev = 67109378;
                    *(_DWORD *)&block.st_mode = v260;
                    LOWORD(block.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v262;
                    _os_log_error_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_ERROR, "Failed to query disk block size -- DKIOCGETBLOCKSIZE failed with %d : %s", (uint8_t *)&block, 0x12u);

                    goto LABEL_606;
                  }
LABEL_657:
                  close(v133);
LABEL_658:

                  v123 = &unk_10003A000;
                  v135 = v254;
LABEL_220:
                  v148 = v494[0];
                  if (v494[0])
                  {
                    v149 = 0;
                    v150 = 0;
                    do
                      v150 |= (v149++)[(void)v135];
                    while (v494[0] != v149);
                    if (v494[0] >= (id)8 && v150) {
                      goto LABEL_235;
                    }
                  }
                  free(v135);
                  int v151 = v494[0];
                  if (v494[0])
                  {
                    v152 = *((void *)v123 + 187);
                    uint64_t v153 = os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT);
                    if ((unint64_t)v151 <= 7)
                    {
                      if (v153)
                      {
                        block.st_dev = 134218240;
                        *(void *)&block.st_mode = v151;
                        WORD2(block.st_ino) = 2048;
                        *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 8;
                        uint64_t v154 = "%llu bytes were read from the file or device, but at least %lu are required to fit the iB"
                               "oot panic header.";
                        v155 = v152;
                        v156 = 22;
                        goto LABEL_233;
                      }
LABEL_234:
                      v135 = 0;
                      v148 = 0;
LABEL_235:
                      v464 = (unsigned int *)v135;
                      v466 = v148;
                      if (v125[1432] == 1)
                      {
                        if (mkdir("/var/root/Library/Application Support/DumpPanic/", 0x1A4u) && *__error() != 17)
                        {
                          v160 = *((void *)v123 + 187);
                          if (!os_log_type_enabled(v160, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_245;
                          }
                          v161 = v160;
                          v162 = __error();
                          uint64_t v163 = strerror(*v162);
                          block.st_dev = 136315394;
                          *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/";
                          WORD2(block.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v163;
                          _os_log_error_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_ERROR, "Failed to create directory: %s with error: %s", (uint8_t *)&block, 0x16u);
                        }
                        else
                        {
                          unsigned int v158 = open_dprotected_np("/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed", 520, 4, 0, 420);
                          v159 = *((void *)v123 + 187);
                          if (v158 != -1)
                          {
                            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 136315138;
                              *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                              _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "Created legacy panic data marker file: %s", (uint8_t *)&block, 0xCu);
                            }
                            close(v158);
                            goto LABEL_245;
                          }
                          if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_245;
                          }
                          v417 = v159;
                          v418 = __error();
                          v419 = strerror(*v418);
                          block.st_dev = 136315394;
                          *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                          WORD2(block.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v419;
                          _os_log_error_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_ERROR, "Failed to create file: %s with error: %s", (uint8_t *)&block, 0x16u);
                        }
                        v123 = &unk_10003A000;
                      }
LABEL_245:
                      char v164 = *((id *)v123 + 187);
                      id v165 = os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT);
                      if (v135)
                      {
                        if (v165)
                        {
                          block.st_dev = 134217984;
                          *(void *)&block.st_mode = v148;
                          _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "0x%llx bytes of paniclog data found in local device", (uint8_t *)&block, 0xCu);
                        }

                        if ((v471 & 1) != 0 && v148)
                        {
                          char v164 = +[NSURL fileURLWithPathComponents:&off_100037C58];
                          if (!sub_100011468(v164, v135, (size_t)v148))
                          {
                            v166 = (id)qword_10003A5D8;
                            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 138412290;
                              *(void *)&block.st_mode = v164;
                              _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "failed to write paniclog data to file: %@", (uint8_t *)&block, 0xCu);
                            }
                          }
                          goto LABEL_256;
                        }
                      }
                      else
                      {
                        if (v165)
                        {
                          LOWORD(block.st_dev) = 0;
                          _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "No paniclog data found in local device", (uint8_t *)&block, 2u);
                        }
LABEL_256:
                      }
                      v470 = +[NSMutableArray array];
                      unsigned int v167 = @"/private/var/db/DumpPanic";
                      unsigned int v168 = +[NSFileManager defaultManager];
                      properties[0] = 0;
                      v467 = [v168 contentsOfDirectoryAtPath:@"/private/var/db/DumpPanic" error:properties];
                      uint64_t v169 = properties[0];
                      if (!v467)
                      {
                        id v186 = qword_10003A5D8;
                        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                        {
                          block.st_dev = 138412290;
                          *(void *)&block.st_mode = v169;
                          _os_log_error_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, "Failed to enumerate the contents of the sandbox directory: %@", (uint8_t *)&block, 0xCu);
                        }
                        goto LABEL_282;
                      }
                      v512 = 0u;
                      v513 = 0u;
                      memset(buf, 0, sizeof(buf));
                      obja = v467;
                      v170 = [obja countByEnumeratingWithState:buf objects:&block count:16];
                      if (!v170) {
                        goto LABEL_279;
                      }
                      v171 = **(void **)&buf[16];
                      while (2)
                      {
                        id v172 = 0;
LABEL_261:
                        if (**(void **)&buf[16] != v171) {
                          objc_enumerationMutation(obja);
                        }
                        v173 = +[NSString stringWithFormat:@"%@/%@", @"/private/var/db/DumpPanic", *(void *)(*(void *)&buf[8] + 8 * v172)];
                        v494[0] = v169;
                        v174 = [v168 attributesOfItemAtPath:v173 error:v494];
                        v175 = (__CFDictionary *)v494[0];

                        if (v174)
                        {
                          v176 = [v174 fileType];
                          v177 = v176 == NSFileTypeDirectory;

                          if (v177)
                          {
                            uint64_t v169 = v175;
                          }
                          else
                          {
                            uint64_t v178 = qword_10003A5D8;
                            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v506 = 138412290;
                              *(void *)&v506[4] = v173;
                              _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "Removing non-directory entry '%@'", v506, 0xCu);
                            }
                            v504[0] = v175;
                            v179 = [v168 removeItemAtPath:v173 error:v504];
                            uint64_t v169 = (__CFDictionary *)v504[0];

                            if ((v179 & 1) == 0)
                            {
                              v180 = qword_10003A5D8;
                              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)v506 = 138412546;
                                *(void *)&v506[4] = v173;
                                *(_WORD *)&v506[12] = 2112;
                                *(void *)&v506[14] = v169;
                                unsigned int v181 = v180;
                                v182 = "Failed to remove non-directory entry '%@'. Error: %@";
                                goto LABEL_275;
                              }
                            }
                          }
                        }
                        else
                        {
                          v183 = qword_10003A5D8;
                          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v506 = 138412546;
                            *(void *)&v506[4] = v173;
                            *(_WORD *)&v506[12] = 2112;
                            *(void *)&v506[14] = v175;
                            _os_log_error_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "Failed to gather the file attributes for '%@'. Error: %@", v506, 0x16u);
                          }
                          v505[0] = v175;
                          id v184 = [v168 removeItemAtPath:v173 error:v505];
                          uint64_t v169 = (__CFDictionary *)v505[0];

                          if ((v184 & 1) == 0)
                          {
                            v185 = qword_10003A5D8;
                            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v506 = 138412546;
                              *(void *)&v506[4] = v173;
                              *(_WORD *)&v506[12] = 2112;
                              *(void *)&v506[14] = v169;
                              unsigned int v181 = v185;
                              v182 = "Failed to remove inaccessible entry '%@'. Error: %@";
LABEL_275:
                              _os_log_error_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_ERROR, v182, v506, 0x16u);
                            }
                          }
                        }

                        if (v170 == (id)++v172)
                        {
                          v170 = [obja countByEnumeratingWithState:buf objects:&block count:16];
                          if (!v170)
                          {
LABEL_279:

LABEL_282:
                            if (!v467)
                            {
                              v463 = 0;
                              v193 = &unk_10003A000;
                              id v194 = v464;
                              uInt v195 = (unint64_t)v148;
                              goto LABEL_302;
                            }
                            if (qword_10003A5A0 != -1) {
                              goto LABEL_714;
                            }
                            while (2)
                            {
                              v188 = +[CoreFileHandler coreFileWithCoreFilePath:off_100039BA0 :1 :0 :qword_10003A5D8];
                              if (v188)
                              {
                                id v189 = _os_feature_enabled_impl();
                                if (v189) {
                                  v190 = "/private/var/db/DumpPanic/Coredumps";
                                }
                                else {
                                  v190 = "/private/var/mobile/Library/Logs/CrashReporter/Panics";
                                }
                                if (v189) {
                                  v191 = 1;
                                }
                                else {
                                  v191 = 3;
                                }
                                v192 = [v188 saveKernelCoreToDisk:v190 :v191 :0 :0 :Current];
                                if (v192) {
                                  [v470 addObjectsFromArray:v192];
                                }
                                if (v466 || sub_10000F968() && !os_parse_boot_arg_int())
                                {
                                  v463 = 0;
                                }
                                else
                                {
                                  free(v464);
                                  v463 = [v188 getPanicRegion];
                                  v464 = 0;
                                }
                              }
                              else
                              {
                                v463 = 0;
                              }

                              v193 = &unk_10003A000;
                              id v194 = v464;
                              uInt v195 = (unint64_t)v466;
LABEL_302:
                              if (v195 || v463)
                              {
                                unsigned int v196 = [v469 output_dir];
                                v484 = 0;
                                v485 = 0;
                                sub_100011C84(v194, v195, v196, v457, v460, (PanicReport *)&v485, (uint64_t *)&v484, v468, Current, v463);
                                v473 = v485;
                                v466 = v484;
                              }
                              else
                              {
                                v473 = 0;
                                v466 = 0;
                              }
                              sub_100010A14(&v479, (id *)&v487);
                              [v469 output_dir];
                              objb = (id)objc_claimAutoreleasedReturnValue();
                              sub_100010A14(v506, &v479);
                              uint64_t v197 = *(void **)v506;
                              unint64_t v198 = [*(id *)v506 intValue];
                              unint64_t v199 = [*(id *)&v506[8] intValue] + v198;
                              if (v199 > 1)
                              {
                                int v200 = 8;
                                goto LABEL_318;
                              }
                              unint64_t v201 = *(void *)&v510[2];
                              if ([*(id *)&v510[2] count])
                              {
                                unint64_t v202 = [objc_alloc((Class)NSMutableArray) initWithArray:v201];
                                if ([v202 containsObject:@"rst"]) {
                                  [v202 removeObject:@"rst"];
                                }
                                if ([v202 count] && (unint64_t)objc_msgSend(v202, "count") <= 1)
                                {
                                  if ([v202 containsObject:@"wdog"])
                                  {
                                    int v200 = [*(id *)&v506[16] intValue] == 227;
                                  }
                                  else if ([v202 containsObject:@"uv"])
                                  {
                                    int v200 = 2;
                                  }
                                  else if ([v202 containsObject:@"ov"])
                                  {
                                    int v200 = 3;
                                  }
                                  else if ([v202 containsObject:@"ot"])
                                  {
                                    int v200 = 5;
                                  }
                                  else if ([v202 containsObject:@"crash"])
                                  {
                                    int v200 = 4;
                                  }
                                  else
                                  {
                                    if (v199)
                                    {
                                      v441 = qword_10003A5D8;
                                      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                      {
                                        block.st_dev = 138412290;
                                        *(void *)&block.st_mode = v201;
                                        _os_log_error_impl((void *)&_mh_execute_header, v441, OS_LOG_TYPE_ERROR, "bootFaults contained uncategorized PMU fault(s) : %@", (uint8_t *)&block, 0xCu);
                                      }
                                      goto LABEL_313;
                                    }
                                    int v200 = 7;
                                  }
                                }
                                else
                                {
LABEL_313:
                                  int v200 = 8;
                                }
                              }
                              else if ([v197 intValue] == 1)
                              {
                                int v200 = 6;
                              }
                              else
                              {
                                int v200 = 8;
                              }
LABEL_318:
                              sub_1000108A4((uint64_t)v506);
                              sub_100010A14(properties, &v479);
                              if (&_AnalyticsSendEventLazy)
                              {
                                if (v200 > 7) {
                                  v203 = @"unknown";
                                }
                                else {
                                  v203 = *(&off_100034CD0 + v200);
                                }
                                *(void *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904;
                                *(void *)&block.st_uid = sub_100010A80;
                                *(void *)&block.st_rdev = &unk_100034CA0;
                                sub_100010A14(&block.st_atimespec.tv_nsec, (id *)properties);
                                block.st_atimespec.tv_sec = (__darwin_time_t)v203;
                                AnalyticsSendEventLazy();
                                *(void *)z_stream buf = _NSConcreteStackBlock;
                                *(void *)&buf[8] = 3254779904;
                                *(void *)&uint8_t buf[16] = sub_100010B14;
                                *(void *)&buf[24] = &unk_100034CA0;
                                *(void *)&v512 = v203;
                                sub_100010A14((void *)&v512 + 1, (id *)properties);
                                AnalyticsSendEventLazy();
                                sub_1000108A4((uint64_t)&v512 + 8);

                                sub_1000108A4((uint64_t)&block.st_atimespec.tv_nsec);
                              }
                              sub_1000108A4((uint64_t)properties);
                              uint64_t v204 = v479;
                              if ([v479 intValue]
                                || [v480 intValue])
                              {
                                int v205 = CFAbsoluteTimeGetCurrent();
                                unsigned int v206 = CFUUIDCreate(kCFAllocatorDefault);
                                v207 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v206);
                                CFRelease(v206);
                                v495 = 0;
                                sub_10000EF44((uint64_t)"chosen", "chip-id", (_DWORD *)&v495 + 1);
                                sub_10000EF44((uint64_t)"arm-io", "chip-revision", &v495);
                                v504[0] = (id)kOSALogMetadataAppName;
                                v504[1] = (id)kOSALogMetadataIncidentID;
                                v505[0] = @"Reset count";
                                v505[1] = v207;
                                v208 = +[NSDictionary dictionaryWithObjects:v505 forKeys:v504 count:2];
                                int v209 = sub_10000EE2C(objb, @"ResetCounter", 0.0);
                                *(void *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904;
                                *(void *)&block.st_uid = sub_10001102C;
                                *(void *)&block.st_rdev = &unk_100034C68;
                                v459 = v207;
                                block.st_atimespec.tv_sec = (__darwin_time_t)v459;
                                block.st_atimespec.tv_nsec = v205;
                                sub_100010A14(&block.st_mtimespec.tv_sec, &v479);
                                block.st_size_t size = __PAIR64__(v495, HIDWORD(v495));
                                v465 = +[OSALog createForSubmission:@"115" metadata:v208 options:v209 error:0 writing:&block];

                                int v210 = (id)qword_10003A5D8;
                                v211 = v210;
                                if (v465)
                                {
                                  if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
                                  {
                                    unsigned int v212 = [v465 filepath];
                                    *(_DWORD *)z_stream buf = 138412290;
                                    *(void *)&uint8_t buf[4] = v212;
                                    _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_INFO, "wrote ResetCounter log to disk: %@", buf, 0xCu);
                                  }
                                  v211 = [v465 filepath];
                                  v462 = (unint64_t)[v211 copy];
                                }
                                else
                                {
                                  if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)z_stream buf = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_ERROR, "failed to write ResetCounter log to disk", buf, 2u);
                                  }
                                  v462 = 0;
                                }

                                if ((MGGetBoolAnswer() & 1) == 0)
                                {
                                  *(void *)z_stream buf = @"115";
                                  *(void *)&buf[8] = v459;
                                  uInt v213 = [v204 stringValue];
                                  *(void *)&uint8_t buf[16] = v213;
                                  v214 = [v480 stringValue];
                                  *(void *)&buf[24] = v214;
                                  uInt v215 = [v481 stringValue];
                                  *(void *)&v512 = v215;
                                  v216 = [off_100039B48 stringValue];
                                  *((void *)&v512 + 1) = v216;
                                  v217 = [v482 componentsJoinedByString:@";"];
                                  *(void *)&v513 = v217;
                                  uint64_t v218 = +[NSArray arrayWithObjects:buf count:7];
                                  logForAppleCare();
                                }
                                v219 = objc_opt_new();
                                sub_100010A14(v494, &v479);
                                v472 = v219;
                                v220 = v494[0];
                                uint64_t v221 = v494[1];
                                uint64_t v222 = v494[2];
                                v223 = v494[5];
                                v224 = [v220 intValue];
                                v225 = [v221 intValue];
                                v226 = [v223 containsObject:@"wdog"];
                                v227 = [v223 containsObject:@"spmi"];
                                v228 = [v223 count];
                                v229 = [v222 intValue] == 224
                                    || [v222 intValue] == 225
                                    || [v222 intValue] == 229
                                    || [v222 intValue] == 230
                                    || [v222 intValue] == 231;
                                if (v228 == (id)1) {
                                  v230 = v226;
                                }
                                else {
                                  v230 = 0;
                                }
                                if ((v230 & 1) != 0
                                  || v226
                                  && ([v223 count] == (id)2
                                   && ([v223 containsObject:@"rst"] & 1) != 0
                                   || [v223 count] == (id)2
                                   && ([v223 containsObject:@"btn_shdn"] & 1) != 0))
                                {
                                  unsigned int v231 = 0;
                                }
                                else
                                {
                                  unsigned int v231 = v227 ^ 1 | v226;
                                }
                                if (v224) {
                                  uint64_t v232 = 0;
                                }
                                else {
                                  uint64_t v232 = v225 == 1;
                                }
                                if (!v232) {
                                  unsigned int v231 = 1;
                                }
                                if ((v231 ^ 1 | v229))
                                {
                                  v233 = !v229;
                                  if (!v472) {
                                    v233 = 1;
                                  }
                                  if ((v233 & 1) == 0)
                                  {
                                    v234 = [v494[3] componentsJoinedByString:@" "];
                                    unint64_t v235 = +[NSString stringWithFormat:@"iBoot panic-save unexpected reset, boot faults: %@", v234];

                                    [v472 addObject:v235];
                                  }
                                  unsigned int v236 = [v222 intValue];
                                  int8x16_t v237 = 0;
                                  int8x16_t v238 = 0;
                                  switch(v236)
                                  {
                                    case '@':
                                      int8x16_t v237 = 2;
                                      goto LABEL_418;
                                    case 'A':
                                      int8x16_t v237 = 8;
                                      goto LABEL_418;
                                    case 'B':
                                      int8x16_t v237 = 3;
                                      goto LABEL_418;
                                    case 'C':
                                      int8x16_t v237 = 5;
                                      goto LABEL_418;
                                    case 'D':
                                      int8x16_t v237 = 6;
                                      goto LABEL_418;
                                    case 'E':
                                      int8x16_t v237 = 9;
                                      goto LABEL_418;
                                    case 'F':
                                      int8x16_t v237 = 4;
                                      goto LABEL_418;
                                    case 'G':
                                      int8x16_t v237 = 7;
                                      goto LABEL_418;
                                    case 'H':
                                    case 'I':
                                    case 'J':
                                    case 'K':
                                    case 'L':
                                    case 'M':
                                    case 'N':
                                    case 'O':
                                      break;
                                    case 'P':
                                      int8x16_t v237 = 15;
                                      goto LABEL_418;
                                    default:
                                      int8x16_t v238 = 0;
                                      switch(v236)
                                      {
                                        case 0xE0u:
                                          int8x16_t v237 = 10;
                                          break;
                                        case 0xE1u:
                                          int8x16_t v237 = 11;
                                          break;
                                        case 0xE2u:
                                          goto LABEL_419;
                                        case 0xE3u:
                                          if (!v227) {
                                            goto LABEL_413;
                                          }
                                          int8x16_t v237 = 16;
                                          break;
                                        case 0xE4u:
                                          int8x16_t v237 = 17;
                                          break;
                                        case 0xE5u:
                                          int8x16_t v237 = 12;
                                          break;
                                        case 0xE6u:
                                          int8x16_t v237 = 13;
                                          break;
                                        case 0xE7u:
                                          int8x16_t v237 = 14;
                                          break;
                                        default:
                                          if (v236 != 255) {
                                            goto LABEL_419;
                                          }
                                          int8x16_t v237 = 1;
                                          break;
                                      }
LABEL_418:
                                      int8x16_t v238 = 1;
                                      break;
                                  }
                                }
                                else
                                {
LABEL_413:
                                  int8x16_t v237 = 0;
                                  int8x16_t v238 = 0;
                                }
LABEL_419:

                                sub_1000108A4((uint64_t)v494);
                                if (v238)
                                {
                                  v268 = (id)qword_10003A5D8;
                                  if (os_log_type_enabled(v268, OS_LOG_TYPE_INFO))
                                  {
                                    *(_WORD *)v493 = 0;
                                    _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_INFO, "detected interesting reset, promoting to panic", v493, 2u);
                                  }

                                  v269 = +[NSMutableString stringWithString:@"sys watchdog"];
                                  v270 = +[NSMutableString stringWithString:@"Unexpected uncategorized reset occurred"];
                                  v271 = v483;
                                  if ([v483 containsObject:@"wdog"])
                                  {
                                    v272 = @"Unexpected SoC (system) watchdog reset occurred";
                                    goto LABEL_427;
                                  }
                                  if ([v271 containsObject:@"spmi"])
                                  {
                                    v272 = @"Unexpected SPMI fault reset occurred";
LABEL_427:
                                    v273 = +[NSMutableString stringWithString:v272];

                                    v270 = (void *)v273;
                                  }
                                  switch(v237)
                                  {
                                    case 0:
                                      goto LABEL_740;
                                    case 2:
                                      [v269 appendString:@" panic start"];
                                      v274 = @" after panic called";
                                      goto LABEL_445;
                                    case 3:
                                      [v269 appendString:@" panic diags"];
                                      v274 = @" while panic diagnostics being saved";
                                      goto LABEL_445;
                                    case 4:
                                      [v269 appendString:@" panic diags complete"];
                                      v274 = @" after panic diagnostics were completed";
                                      goto LABEL_445;
                                    case 5:
                                      [v269 appendString:@" x86 panic diags"];
                                      v274 = @" while x86 panic diagnostics being saved";
                                      goto LABEL_445;
                                    case 6:
                                      [v269 appendString:@" panic DRAM flush"];
                                      v274 = @" while panic DRAM flush in progress";
                                      goto LABEL_445;
                                    case 7:
                                      [v269 appendString:@" panic save CE trigger"];
                                      v274 = @" after panic save CE trigger";
                                      goto LABEL_445;
                                    case 8:
                                      [v269 appendString:@" panic save chip reset"];
                                      v274 = @" after panic save chip reset initiated";
                                      goto LABEL_445;
                                    case 9:
                                      [v269 appendString:@" panic save x86 panic diags interrupted"];
                                      v274 = @" after panic save chip reset initiated and x86 panic diagnostics were interrupted";
                                      goto LABEL_445;
                                    case 10:
                                      [v269 appendString:@" iBoot panic save entry"];
                                      v274 = @" after iBoot panic save entry";
                                      goto LABEL_445;
                                    case 11:
                                      [v269 appendString:@" iBoot panic save reboot"];
                                      v274 = @" during iBoot panic save reboot";
                                      goto LABEL_445;
                                    case 12:
                                      [v269 appendString:@" iBoot panic save power init"];
                                      v274 = @" after iBoot panic save power init";
                                      goto LABEL_445;
                                    case 13:
                                      [v269 appendString:@" iBoot panic save memory init"];
                                      v274 = @" after iBoot panic save memory init";
                                      goto LABEL_445;
                                    case 14:
                                      [v269 appendString:@" iBoot panic save storage init"];
                                      v274 = @" after iBoot panic save storage init";
                                      goto LABEL_445;
                                    case 15:
                                      [v269 appendString:@" sleep/wake transition"];
                                      v274 = @" during sleep/wake transition";
                                      goto LABEL_445;
                                    case 16:
                                      [v269 appendString:@" AP Watchdog reboot"];
                                      v274 = @" after AP Watchdog reboot";
                                      goto LABEL_445;
                                    case 17:
                                      [v269 appendString:@" AP Watchdog expired"];
                                      v274 = @" after AP Watchdog expired";
LABEL_445:
                                      [v270 appendString:v274];
                                      break;
                                    default:
                                      break;
                                  }
                                  v240 = v270;
                                  id v275 = [[PanicReport alloc] initWithPanicString:v240 otherString:0 buildVersion:0 panicFlags:0 panicType:v269 incidentID:0 rootsInstalled:0];
                                  [(PanicReport *)v275 useStackshotBuffer:0 size:0 frontmostPids:0 atTime:v457 machTime:0xFFFFFFFFLL sequence:Current];
                                  [(PanicReport *)v275 setForegroundAppHash:off_100039B48];
                                  [(PanicReport *)v275 setSOCIdAndRev];
                                  if (v472 && [v472 count])
                                  {
                                    [(PanicReport *)v275 addNotes:v472];
                                    [v472 removeAllObjects];
                                  }
                                  v276 = sub_10000EE2C(objb, 0, Current);
                                  v277 = [(PanicReport *)v275 saveWithOptions:v276];

                                  if (v277)
                                  {
                                    v278 = [(PanicReport *)v275 logfile];
                                    uint64_t v241 = (unint64_t)[v278 copy];
                                  }
                                  else
                                  {
                                    v278 = (id)qword_10003A5D8;
                                    if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_WORD *)v493 = 0;
                                      _os_log_error_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_ERROR, "failed to write system watchdog reset panic log", v493, 2u);
                                    }
                                    uint64_t v241 = 0;
                                  }
                                }
                                else
                                {
                                  v240 = 0;
                                  uint64_t v241 = 0;
                                }
                                id v242 = (v462 | v241) != 0;

                                sub_1000108A4((uint64_t)&block.st_mtimespec);
                              }
                              else
                              {
                                v239 = *((void *)v193 + 187);
                                if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_DEFAULT, "Skipping writing ResetCounter log as no unexpected resets detected", (uint8_t *)&block, 2u);
                                }
                                v240 = 0;
                                v462 = 0;
                                uint64_t v241 = 0;
                                id v242 = 1;
                              }

                              sub_1000108A4((uint64_t)&v479);
                              v458 = v240;
                              v454 = (id)v462;
                              v464 = (unsigned int *)(id)v241;

                              if (!v242)
                              {
                                v279 = (id)qword_10003A5D8;
                                if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_ERROR, "Failed to write boot fault report", (uint8_t *)&block, 2u);
                                }
                              }
                              if (v466) {
                                v455 = [v466 containsString:@"forceReset"];
                              }
                              else {
                                v455 = 0;
                              }
                              if ([v473 length]
                                || [v466 length]
                                || ![v468 count])
                              {
LABEL_465:
                                unint64_t v280 = v466;
                              }
                              else
                              {
                                if (os_variant_has_internal_diagnostics())
                                {
                                  *(void *)&block.st_dev = 0;
                                  long long v295 = sub_10000FA88();
                                  long long v296 = sub_10000FC50(v295, @"debug", (unint64_t *)&block);

                                  if (v296)
                                  {
                                    st_dev = block.st_dev;
                                    id v298 = qword_10003A5D8;
                                    id v299 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
                                    if ((st_dev & 0x100000) == 0)
                                    {
                                      if (v299)
                                      {
                                        *(_WORD *)z_stream buf = 0;
                                        _os_log_impl((void *)&_mh_execute_header, v298, OS_LOG_TYPE_DEFAULT, "Machine configured to NOT reboot on a panic", buf, 2u);
                                      }
                                      goto LABEL_465;
                                    }
                                    if (v299)
                                    {
                                      *(_WORD *)z_stream buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v298, OS_LOG_TYPE_DEFAULT, "Machine configured to reboot on a panic", buf, 2u);
                                    }
                                  }
                                }
                                v389 = (id)qword_10003A5C0;
                                if (os_log_type_enabled(v389, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v389, OS_LOG_TYPE_DEFAULT, "Write a standalone socd panic report", (uint8_t *)&block, 2u);
                                }

                                v390 = [v469 output_dir];
                                v477 = v466;
                                v478 = v473;
                                v391 = sub_100015EDC(v390, &v478, &v477, v468, Current);
                                v392 = v478;

                                unint64_t v280 = v477;
                                if ((v391 & 1) == 0)
                                {
                                  v393 = (id)qword_10003A5C0;
                                  if (os_log_type_enabled(v393, OS_LOG_TYPE_ERROR))
                                  {
                                    LOWORD(block.st_dev) = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v393, OS_LOG_TYPE_ERROR, "Failed to write standalone socd panic report", (uint8_t *)&block, 2u);
                                  }
                                }
                                v473 = v392;
                              }
                              int v2 = v280;
                              if (qword_10003A5D0 != -1) {
LABEL_711:
                              }
                                dispatch_once(&qword_10003A5D0, &stru_100034E78);
                              id v281 = (id)qword_10003A5C8;
                              v282 = +[NSFileManager defaultManager];
                              v283 = +[NSString stringWithFormat:@"%s", "/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"];
                              v284 = [v282 fileExistsAtPath:v283];

                              if (v284)
                              {
                                v285 = v281;
                                v286 = +[NSURL fileURLWithPath:@"/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"];
                                *(void *)z_stream buf = 0;
                                v287 = +[NSData dataWithContentsOfURL:v286 options:0 error:buf];
                                v288 = *(id *)buf;

                                if (v287)
                                {
                                  *(void *)v506 = 0;
                                  v289 = +[NSPropertyListSerialization propertyListWithData:v287 options:0 format:0 error:v506];
                                  v290 = *(id *)v506;

                                  if (v289)
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      int v291 = [v289 objectForKey:v285];
                                      id v292 = v291 == 0;

                                      if (!v292)
                                      {

                                        id v293 = qword_10003A5D8;
                                        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                        {
                                          LOWORD(block.st_dev) = 0;
                                          _os_log_error_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_ERROR, "Found panic log breadcrumb with duplicated boot session uuid", (uint8_t *)&block, 2u);
                                        }
                                        goto LABEL_488;
                                      }
                                    }
                                    else
                                    {
                                      v304 = qword_10003A5D8;
                                      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                      {
                                        LOWORD(block.st_dev) = 0;
                                        _os_log_error_impl((void *)&_mh_execute_header, v304, OS_LOG_TYPE_ERROR, "Breadcrumb file contains invalid data", (uint8_t *)&block, 2u);
                                      }
                                    }
                                  }
                                  else
                                  {
                                    id v300 = (void *)qword_10003A5D8;
                                    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                    {
                                      v301 = v300;
                                      v302 = [v290 description];
                                      v303 = [v302 UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v303;
                                      _os_log_error_impl((void *)&_mh_execute_header, v301, OS_LOG_TYPE_ERROR, "Failed to parse breadcrumb with error : %s", (uint8_t *)&block, 0xCu);
                                    }
                                  }

                                  goto LABEL_488;
                                }
                                long long v294 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v394 = v294;
                                  v395 = [v288 description];
                                  v396 = [v395 UTF8String];
                                  block.st_dev = 136315138;
                                  *(void *)&block.st_mode = v396;
                                  _os_log_error_impl((void *)&_mh_execute_header, v394, OS_LOG_TYPE_ERROR, "Read from panic log breadcrumb failed due to %s", (uint8_t *)&block, 0xCu);
                                }
LABEL_488:
                                if (unlink("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"))
                                {
                                  v305 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    v377 = v305;
                                    v378 = __error();
                                    v379 = strerror(*v378);
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = v379;
                                    _os_log_error_impl((void *)&_mh_execute_header, v377, OS_LOG_TYPE_ERROR, "Failed to unlink prior stashed panic log breadcrumb %s", (uint8_t *)&block, 0xCu);
                                  }
                                }
                              }
                              v306 = objc_alloc((Class)NSDictionary);
                              if (v2) {
                                v307 = v2;
                              }
                              else {
                                v307 = &stru_100035440;
                              }
                              v308 = [v306 initWithObjectsAndKeys:v307, v281, 0];
                              v309 = qword_10003A5D8;
                              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                              {
                                block.st_dev = 138412546;
                                *(void *)&block.st_mode = v308;
                                WORD2(block.st_ino) = 2080;
                                *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)"/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb";
                                _os_log_impl((void *)&_mh_execute_header, v309, OS_LOG_TYPE_DEFAULT, "write %@ to %s", (uint8_t *)&block, 0x16u);
                              }
                              v310 = open("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb", 2561, 420);
                              if ((v310 & 0x80000000) != 0)
                              {
                                v315 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v372 = v315;
                                  v373 = __error();
                                  v374 = strerror(*v373);
                                  block.st_dev = 136315138;
                                  *(void *)&block.st_mode = v374;
                                  _os_log_error_impl((void *)&_mh_execute_header, v372, OS_LOG_TYPE_ERROR, "Failed to safely open file : %s", (uint8_t *)&block, 0xCu);
                                }
                                v313 = 0;
                              }
                              else
                              {
                                *(void *)z_stream buf = 0;
                                v311 = +[NSPropertyListSerialization dataWithPropertyList:v308 format:100 options:0 error:buf];
                                v312 = *(id *)buf;
                                if (v312)
                                {
                                  v313 = v312;
                                  v314 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    v366 = v314;
                                    v367 = [v313 description];
                                    v368 = [v367 UTF8String];
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = v368;
                                    _os_log_error_impl((void *)&_mh_execute_header, v366, OS_LOG_TYPE_ERROR, "Failed to construct panic log breadcrumb: %s", (uint8_t *)&block, 0xCu);
                                  }
                                  close(v310);
                                }
                                else
                                {
                                  v316 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v310 closeOnDealloc:0];
                                  *(void *)v506 = 0;
                                  [v316 writeData:v311 error:v506];
                                  v313 = *(id *)v506;
                                  if (v313)
                                  {
                                    v317 = (void *)qword_10003A5D8;
                                    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                    {
                                      v414 = v317;
                                      v415 = [v313 description];
                                      v416 = [v415 UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v416;
                                      _os_log_error_impl((void *)&_mh_execute_header, v414, OS_LOG_TYPE_ERROR, "Faled to write panic log breadcrumb: %s", (uint8_t *)&block, 0xCu);
                                    }
                                  }
                                  close(v310);
                                }
                              }

                              v318 = 0;
                              uint64_t j = 0;
                              v320 = 1;
                              do
                              {
                                v321 = v320;

                                v322 = [[UserCoreFileHandler alloc] initWithCoreFilePath:"launchd" :*((void *)&unk_100034E18 + 4 * v318 + 2)];
                                v323 = v322;
                                if (v322)
                                {
                                  uint64_t j = [(UserCoreFileHandler *)v322 saveUserSpaceCoreToDisk:Current];
                                  if (j)
                                  {
                                    [v470 addObject:j];
                                    v324 = (id)qword_10003A5D8;
                                    if (os_log_type_enabled(v324, OS_LOG_TYPE_DEFAULT))
                                    {
                                      v325 = [ (id) j UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v325;
                                      _os_log_impl((void *)&_mh_execute_header, v324, OS_LOG_TYPE_DEFAULT, "ready to submit %s", (uint8_t *)&block, 0xCu);
                                    }
                                  }
                                }
                                else
                                {
                                  uint64_t j = 0;
                                }

                                v320 = 0;
                                v318 = 1;
                              }
                              while ((v321 & 1) != 0);
                              v326 = v2;
                              if (creat("/var/run/com.apple.DumpPanic.finishedThisBoot", 0x100u) < 0)
                              {
                                v329 = __error();
                                v330 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v331 = *v329;
                                  v332 = v330;
                                  v333 = strerror(v331);
                                  block.st_dev = 136315394;
                                  *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                  WORD2(block.st_ino) = 2080;
                                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v333;
                                  _os_log_error_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_ERROR, "failed to creat() DumpPanicDone cookie at path %s with error %s", (uint8_t *)&block, 0x16u);
                                }
                              }
                              else
                              {
                                v327 = fopen("/var/run/com.apple.DumpPanic.finishedThisBoot", "w");
                                if (v327)
                                {
                                  v328 = v326;
                                  fwrite([(__CFString *)v328 UTF8String], (size_t)[(__CFString *)v328 length], 1uLL, v327);
                                  fclose(v327);
                                }
                                else
                                {
                                  v334 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                    _os_log_error_impl((void *)&_mh_execute_header, v334, OS_LOG_TYPE_ERROR, "Unable to open DumpPanicDone cookie at path: %s", (uint8_t *)&block, 0xCu);
                                  }
                                }
                              }
                              int v187 = (v2 == 0);

                              if (v464) {
                                v335 = v2 == 0;
                              }
                              else {
                                v335 = 0;
                              }
                              if (v335 == 1)
                              {
                                v326 = v464;
                                int v187 = v458;

                                v473 = v187;
                              }
                              v471 = +[NSMutableArray array];
                              v336 = @"864503";
                              if (v335) {
                                v336 = @"1111324";
                              }
                              if (v455) {
                                v337 = @"864502";
                              }
                              else {
                                v337 = v336;
                              }
                              [(id)v471 addObject:v337];
                              if (!v326 && ![v470 count])
                              {
LABEL_571:
                                if (v467)
                                {
                                  v356 = [KeyStore alloc];
                                  v357 = [(ReadOnlyKeyStore *)v356 init:qword_10003A5D8];
                                  v358 = v357;
                                  if (v357 && [v357 unlock])
                                  {
                                    [v358 RotateKeys:sub_100010118];
                                  }
                                  else
                                  {
                                    v359 = (id)qword_10003A5D8;
                                    if (os_log_type_enabled(v359, OS_LOG_TYPE_ERROR))
                                    {
                                      LOWORD(block.st_dev) = 0;
                                      _os_log_error_impl((void *)&_mh_execute_header, v359, OS_LOG_TYPE_ERROR, "Failed to unlock a keystore. Encryption not vailable.", (uint8_t *)&block, 2u);
                                    }
                                  }
                                }

                                sub_1000108A4((uint64_t)&v487);
                                uint64_t v6 = 0;
                                goto LABEL_580;
                              }
                              if (pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0))
                              {
                                _os_assert_log();
                                _os_crash();
                                __break(1u);
                                goto LABEL_713;
                              }
                              v461 = v326;
                              v457 = (__CFString *)v473;
                              int v187 = v470;
                              v453 = (id)v471;
                              obuint64_t j = +[NSMutableArray array];
                              if (v326) {
                                [obj addObject:v461];
                              }
                              if (v187) {
                                [obj addObjectsFromArray:v187];
                              }
                              v466 = v187;
                              if (MGGetBoolAnswer())
                              {
                                v512 = 0u;
                                v513 = 0u;
                                memset(buf, 0, sizeof(buf));
                                int v187 = v466;
                                v338 = [v187 countByEnumeratingWithState:buf objects:&block count:16];
                                if (v338)
                                {
                                  v339 = **(void **)&buf[16];
                                  while (2)
                                  {
                                    for (k = 0; k != v338; k = (char *)k + 1)
                                    {
                                      if (**(void **)&buf[16] != v339) {
                                        objc_enumerationMutation(v187);
                                      }
                                      if ([*(id *)(*(void *)&buf[8] + 8 * (void)k) rangeOfString:@"secure" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                                      {
                                        v341 = 1;
                                        goto LABEL_553;
                                      }
                                    }
                                    v338 = [v187 countByEnumeratingWithState:buf objects:&block count:16];
                                    if (v338) {
                                      continue;
                                    }
                                    break;
                                  }
                                }
                                v341 = 0;
LABEL_553:
                              }
                              else
                              {
                                v341 = 0;
                              }

                              if (_os_feature_enabled_impl())
                              {
                                v342 = v457;
                                v343 = v342;
                                if (v341)
                                {
                                  v344 = [(__CFString *)v342 stringByAppendingFormat:@"\n\n%@", @"[Warning: The attachments may contain privacy-sensitive sensor data.]"];

                                  v343 = (void *)v344;
                                }
                                int v187 = obj;
                                v345 = v461;
                                v346 = v343;
                                if (objc_opt_class())
                                {
                                  v347 = objc_alloc_init((Class)DiagnosticsReporterLaunchOptions);
                                  [v347 setFiles_to_attach:v187];
                                  [v347 setLog_path:v345];
                                  [v347 setPanic_string:v346];
                                  v348 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v349 = v348;
                                    v350 = [v347 files_to_attach];
                                    v351 = [v347 log_path];
                                    v352 = [v347 panic_string];
                                    block.st_dev = 138412802;
                                    *(void *)&block.st_mode = v350;
                                    WORD2(block.st_ino) = 2112;
                                    *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v351;
                                    HIWORD(block.st_gid) = 2112;
                                    *(void *)&block.st_rdev = v352;
                                    _os_log_impl((void *)&_mh_execute_header, v349, OS_LOG_TYPE_DEFAULT, "Launching DiagnosticsReporter with files to attach: %@, log_path: %@, and panic string: %@", (uint8_t *)&block, 0x20u);
                                  }
                                  *(void *)&block.st_dev = 0;
                                  block.st_ino = (__darwin_ino64_t)&block;
                                  *(void *)&block.st_uid = 0x3032000000;
                                  *(void *)&block.st_rdev = sub_10000F84C;
                                  block.st_atimespec.tv_sec = (__darwin_time_t)sub_10000F85C;
                                  block.st_atimespec.tv_nsec = (uint64_t)dispatch_group_create();
                                  dispatch_group_enter(*(dispatch_group_t *)(block.st_ino + 40));
                                  *(void *)z_stream buf = _NSConcreteStackBlock;
                                  *(void *)&buf[8] = v4;
                                  *(void *)&uint8_t buf[16] = sub_10000F864;
                                  *(void *)&buf[24] = &unk_100034C40;
                                  *(void *)&v512 = &block;
                                  +[OSADiagnosticsReporter launchAppWith:0 options:v347 completion:buf];
                                  v353 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_WORD *)v506 = 0;
                                    _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_DEFAULT, "Waiting for DR to launch.", v506, 2u);
                                  }
                                  dispatch_group_wait(*(dispatch_group_t *)(block.st_ino + 40), 0xFFFFFFFFFFFFFFFFLL);
                                  _Block_object_dispose(&block, 8);
                                }
                                else
                                {
                                  v354 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    LOWORD(block.st_dev) = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_ERROR, "OSADiagnosticsReporter does not exist and thus we cannot launch DR", (uint8_t *)&block, 2u);
                                  }
                                }

                                goto LABEL_570;
                              }
                              if (!os_variant_has_internal_diagnostics()) {
                                goto LABEL_570;
                              }
                              if (sub_10000F968())
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "Detected stress rack device, skipping prompting user for panic", (uint8_t *)&block, 2u);
                                }
                                goto LABEL_570;
                              }
                              if (!objc_opt_class())
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_ERROR, "TapToRadarServiceSettings does not exist and thus we cannot start a radar", (uint8_t *)&block, 2u);
                                }
                                goto LABEL_570;
                              }
                              v361 = +[TapToRadarService shared];
                              v452 = [v361 serviceSettings];

                              if ([v452 authorizationStatus] == (id)1)
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v362 = "TapToRadarService reports the user has turned off DumpPanic prompts, skipping p"
                                         "rompting user for panic";
                                  goto LABEL_596;
                                }
                                goto LABEL_702;
                              }
                              v363 = @"Your device has recovered from a panic";
                              if (v335) {
                                v363 = @"Your device has rebooted after an unexpected reset";
                              }
                              if (v455) {
                                long long v100 = @"Your device has rebooted after a force reset";
                              }
                              else {
                                long long v100 = (__CFString *)v363;
                              }
                              v364 = +[NSUserDefaults standardUserDefaults];
                              v365 = [v364 BOOLForKey:@"skipTTR"];

                              if (v365)
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v362 = "skipping launching TTR because of user defaults...";
LABEL_596:
                                  _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, v362, (uint8_t *)&block, 2u);
                                }
LABEL_702:

LABEL_570:
                                if (!pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0)) {
                                  goto LABEL_571;
                                }
LABEL_713:
                                _os_assert_log();
                                _os_crash();
                                __break(1u);
LABEL_714:
                                dispatch_once(&qword_10003A5A0, &stru_100034D30);
                                continue;
                              }
                              break;
                            }
                            int v187 = [v452 authorizationStatus];
                            if (v341)
                            {
                              v451 = [@"File a radar now?" stringByAppendingFormat:@"\n%@", @"[Warning: The attachments may contain privacy-sensitive sensor data.]"];
                            }
                            else
                            {
                              v451 = @"File a radar now?";
                            }
                            if (v187 == 2)
                            {
                              if (MGGetSInt32Answer() == 7)
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v420 = "skipping launching TTR because DumpPanic is currently rate limited...";
                                  goto LABEL_700;
                                }
                                goto LABEL_701;
                              }
LABEL_664:
                              if (!sub_10000F120(v100, v451))
                              {
                                int v187 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v420 = "skipping launching TTR...";
LABEL_700:
                                  _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, v420, (uint8_t *)&block, 2u);
                                }
LABEL_701:

                                goto LABEL_702;
                              }
                            }
                            if (v455)
                            {
                              v423 = +[NSFileManager defaultManager];
                              *(void *)v506 = 0;
                              v456 = [v423 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" error:v506];
                              v424 = *(id *)v506;
                              if (!v424)
                              {
                                v512 = 0u;
                                v513 = 0u;
                                memset(buf, 0, sizeof(buf));
                                v425 = v456;
                                v426 = [v425 countByEnumeratingWithState:buf objects:&block count:16];
                                v450 = v423;
                                if (v426)
                                {
                                  v427 = **(void **)&buf[16];
                                  do
                                  {
                                    for (m = 0; m != v426; m = (char *)m + 1)
                                    {
                                      if (**(void **)&buf[16] != v427) {
                                        objc_enumerationMutation(v425);
                                      }
                                      v429 = [@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" stringByAppendingPathComponent:*(void *)(*(void *)&buf[8] + 8 * (void)m)];
                                      [obj addObject:v429];
                                    }
                                    v426 = [v425 countByEnumeratingWithState:buf objects:&block count:16];
                                  }
                                  while (v426);
                                }

                                v423 = v450;
                              }
                              v430 = [obj componentsJoinedByString:@"\n"];
                              v431 = +[NSString stringWithFormat:@"I force reset my device while …\n\nExpected attachments:\n (sysdiagnose)\n%@", v430];

                              v432 = @"1028387";
                              v433 = @"Triage";
                              v434 = @"Force Resets";
                              v435 = @"it rebooted after a force reset";
                              v436 = @"device force reset";
                            }
                            else
                            {
                              if (v335) {
                                v436 = @"device unexpected reset";
                              }
                              else {
                                v436 = @"device panic";
                              }
                              if (v335) {
                                v435 = @"it rebooted after an unexpected reset";
                              }
                              else {
                                v435 = @"it recovered from a panic";
                              }
                              v437 = [obj componentsJoinedByString:@"\n"];
                              v438 = (void *)v437;
                              v439 = @"No panic log found";
                              if (v457) {
                                v439 = v457;
                              }
                              if (v335) {
                                v440 = @"My device unexpectedly reset while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@";
                              }
                              else {
                                v440 = @"My device panicked while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@";
                              }
                              v431 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v440, v439, v437);

                              if (v335)
                              {
                                v432 = @"1176064";
                                v433 = @"Triage";
                                v434 = @"Unexpected Resets";
                              }
                              else
                              {
                                v432 = @"609970";
                                v433 = @"iOS";
                                v434 = @"Panic Triage";
                              }
                            }
                            sub_10000F3A8(v435, v436, v431, v434, v433, v432, obj, v453, v187 == 2);

                            goto LABEL_701;
                          }
                          continue;
                        }
                        goto LABEL_261;
                      }
                    }
                    if (!v153) {
                      goto LABEL_234;
                    }
                    block.st_dev = 134217984;
                    *(void *)&block.st_mode = v151;
                    uint64_t v154 = "%llu bytes were read from the file or device, but it did not contain any paniclog data (buffe"
                           "r was all zeros).";
                    v155 = v152;
                    v156 = 12;
                  }
                  else
                  {
                    uint64_t v157 = *((void *)v123 + 187);
                    if (!os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_234;
                    }
                    LOWORD(block.st_dev) = 0;
                    uint64_t v154 = "No data was read from the file or device (buffer length was zero).";
                    v155 = v157;
                    v156 = 2;
                  }
LABEL_233:
                  _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, v154, (uint8_t *)&block, v156);
                  goto LABEL_234;
                }
                *(void *)z_stream buf = 0;
                *(void *)&buf[8] = LODWORD(properties[0]);
                *(void *)v506 = buf;
                *(void *)&v506[8] = 1;
                if (!ioctl(v133, 0x8010641FuLL, v506)) {
                  goto LABEL_657;
                }
                long long v102 = qword_10003A5D8;
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_657;
                }
LABEL_716:
                v446 = (id)v102;
                v447 = *__error();
                v448 = __error();
                v449 = strerror(*v448);
                block.st_dev = 67109378;
                *(_DWORD *)&block.st_mode = v447;
                LOWORD(block.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v449;
                _os_log_error_impl((void *)&_mh_execute_header, v446, OS_LOG_TYPE_ERROR, "Failed to unlink panic data -- DKIOCUNMAP failed with %d : %s", (uint8_t *)&block, 0x12u);

LABEL_606:
                unint64_t v254 = v60;
                goto LABEL_657;
              }
              v386 = (void *)qword_10003A5D8;
              if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_657;
              }
              v387 = v386;
              v388 = *__error();
              block.st_dev = 134218754;
              *(void *)&block.st_mode = v256;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 2359296;
              HIWORD(block.st_gid) = 2112;
              *(void *)&block.st_rdev = v73;
              LOWORD(block.st_atimespec.tv_sec) = 1024;
              *(_DWORD *)((char *)&block.st_atimespec.tv_sec + 2) = v388;
              _os_log_impl((void *)&_mh_execute_header, v387, OS_LOG_TYPE_DEFAULT, "Unexpected pread result (%zd of %zu bytes) of panic data (%@): errno %d", (uint8_t *)&block, 0x26u);

              goto LABEL_606;
            }
LABEL_723:
            _os_assert_log();
            PanicLogData = _os_crash();
            __break(1u);
LABEL_724:
            switch(PanicLogData)
            {
              case 1:
                _os_crash();
                __break(1u);
                return result;
              case 2:
                goto LABEL_733;
              case 3:
                goto LABEL_734;
              case 4:
                goto LABEL_735;
              case 5:
                goto LABEL_736;
              case 6:
                goto LABEL_737;
              case 7:
                goto LABEL_738;
              default:
                goto LABEL_732;
            }
          }
          CFRelease(properties[0]);
          IOObjectRelease(v143);
        }
      }
      id v146 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(void *)&block.st_mode = v140;
        _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "searching IORegistry again after %lds sleep", (uint8_t *)&block, 0xCu);
      }
      sleep(v140);
      v140 *= 2;
      if (v140 > v139)
      {
        id v125 = &unk_10003A000;
        goto LABEL_217;
      }
    }
  }
  *(void *)&block.st_dev = 0;
  Size = AppleNVMePanicLogGetSize();
  if (!Size)
  {
    if (*(void *)&block.st_dev <= 0x240000uLL) {
      v133 = 2359296;
    }
    else {
      v133 = *(void *)&block.st_dev;
    }
    v494[0] = 0;
    v134 = (__CFString *)malloc_type_valloc(v133, 0x2C8BCAC2uLL);
    v135 = v134;
    if (!v134)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_716;
    }
    bzero(v134, v133);
    PanicLogData = AppleNVMeReadPanicLogData();
    if (!PanicLogData)
    {
      id v137 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(id *)&block.st_mode = v494[0];
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "AppleNVMeReadPanicLogData successfully extracted %llu bytes of data.", (uint8_t *)&block, 0xCu);
      }
      goto LABEL_220;
    }
    goto LABEL_724;
  }
  switch(Size)
  {
    case 1:
      _os_crash();
      __break(1u);
      goto LABEL_728;
    case 2:
LABEL_728:
      _os_crash();
      __break(1u);
      goto LABEL_729;
    case 3:
LABEL_729:
      _os_crash();
      __break(1u);
      goto LABEL_730;
    case 6:
LABEL_730:
      _os_crash();
      __break(1u);
      goto LABEL_731;
    case 7:
LABEL_731:
      _os_crash();
      __break(1u);
LABEL_732:
      _os_crash();
      __break(1u);
LABEL_733:
      _os_crash();
      __break(1u);
LABEL_734:
      _os_crash();
      __break(1u);
LABEL_735:
      _os_crash();
      __break(1u);
LABEL_736:
      _os_crash();
      __break(1u);
LABEL_737:
      _os_crash();
      __break(1u);
LABEL_738:
      _os_crash();
      __break(1u);
      break;
    default:
      break;
  }
  _os_crash();
  __break(1u);
LABEL_740:
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void sub_100023FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_100024230(id a1)
{
  memset(v6, 0, sizeof(v6));
  size_t v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0))
  {
    id v1 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Failed to get kern.bootsessionuuid", v4, 2u);
    }
  }
  else
  {
    uint64_t v2 = +[NSString stringWithCString:v6 encoding:4];
    unsigned int v3 = (void *)qword_10003A5C8;
    qword_10003A5C8 = v2;
  }
}

void sub_10002612C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long buf)
{
  if (a2 == 1)
  {
    id v19 = objc_begin_catch(a1);
    int v20 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v19 name];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    stat v21 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      io_registry_entry_t v23 = [v19 reason];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Reason: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100026014);
  }
  _Unwind_Resume(a1);
}

id sub_100026AF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"type";
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_100026B74(id a1)
{
  return (NSDictionary *)&off_100037B50;
}

int AAByteStreamClose(AAByteStream s)
{
  return _AAByteStreamClose(s);
}

off_t AAByteStreamProcess(AAByteStream istream, AAByteStream ostream)
{
  return _AAByteStreamProcess(istream, ostream);
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  return _AAByteStreamRead(s, buf, nbyte);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return _AACustomByteStreamOpen();
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return _AAFileStreamOpenWithPath(path, open_flags, open_mode);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return _AEAContextCreateWithEncryptedStream(encrypted_stream);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return _AEAContextSetFieldBlob(context, field, representation, buf, buf_size);
}

AAByteStream AEADecryptionInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return _AEADecryptionInputStreamOpen(encrypted_stream, context, flags, n_threads);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t AppleNVMeDeviceSupportsPanicLogAccess()
{
  return _AppleNVMeDeviceSupportsPanicLogAccess();
}

uint64_t AppleNVMePanicLogGetSize()
{
  return _AppleNVMePanicLogGetSize();
}

uint64_t AppleNVMeReadPanicLogData()
{
  return _AppleNVMeReadPanicLogData();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSADateFormat()
{
  return _OSADateFormat();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

int creat(const char *a1, mode_t a2)
{
  return _creat(a1, a2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getentropy(void *buffer, size_t size)
{
  return _getentropy(buffer, size);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return _gzerror(file, errnum);
}

z_size_t gzfwrite(voidpc buf, z_size_t size, z_size_t nitems, gzFile file)
{
  return _gzfwrite(buf, size, nitems, file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return _gzopen(a1, a2);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return _gzwrite(file, buf, len);
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return _inflateInit_(strm, version, stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t logForAppleCare()
{
  return _logForAppleCare();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_aligned_alloc(alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_valloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mktemp(char *a1)
{
  return _mktemp(a1);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return _pthread_atfork(a1, a2, a3);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t rollAppleCareLogs()
{
  return _rollAppleCareLogs();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_codeSigningMonitor(void *a1, const char *a2, ...)
{
  return [a1 codeSigningMonitor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crashReporterKey(void *a1, const char *a2, ...)
{
  return [a1 crashReporterKey];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return [a1 filepath];
}

id objc_msgSend_getBuildVersionString(void *a1, const char *a2, ...)
{
  return [a1 getBuildVersionString];
}

id objc_msgSend_getCorefileLogEncryptionKey(void *a1, const char *a2, ...)
{
  return [a1 getCorefileLogEncryptionKey];
}

id objc_msgSend_getCorefileZeroRanges(void *a1, const char *a2, ...)
{
  return [a1 getCorefileZeroRanges];
}

id objc_msgSend_getNumCoreDumps(void *a1, const char *a2, ...)
{
  return [a1 getNumCoreDumps];
}

id objc_msgSend_getPanicCriterials(void *a1, const char *a2, ...)
{
  return [a1 getPanicCriterials];
}

id objc_msgSend_getPanicRegion(void *a1, const char *a2, ...)
{
  return [a1 getPanicRegion];
}

id objc_msgSend_getStatus(void *a1, const char *a2, ...)
{
  return [a1 getStatus];
}

id objc_msgSend_help(void *a1, const char *a2, ...)
{
  return [a1 help];
}

id objc_msgSend_incidentID(void *a1, const char *a2, ...)
{
  return [a1 incidentID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isPatternPayloadAvailable(void *a1, const char *a2, ...)
{
  return [a1 isPatternPayloadAvailable];
}

id objc_msgSend_kernelVersionDescription(void *a1, const char *a2, ...)
{
  return [a1 kernelVersionDescription];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logType(void *a1, const char *a2, ...)
{
  return [a1 logType];
}

id objc_msgSend_logfile(void *a1, const char *a2, ...)
{
  return [a1 logfile];
}

id objc_msgSend_modelCode(void *a1, const char *a2, ...)
{
  return [a1 modelCode];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_panicString(void *a1, const char *a2, ...)
{
  return [a1 panicString];
}

id objc_msgSend_parseExtPaniclog(void *a1, const char *a2, ...)
{
  return [a1 parseExtPaniclog];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_patternMatching(void *a1, const char *a2, ...)
{
  return [a1 patternMatching];
}

id objc_msgSend_privateKeyChecking(void *a1, const char *a2, ...)
{
  return [a1 privateKeyChecking];
}

id objc_msgSend_problemType(void *a1, const char *a2, ...)
{
  return [a1 problemType];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return [a1 productNameVersionBuildString];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reportUsedImages(void *a1, const char *a2, ...)
{
  return [a1 reportUsedImages];
}

id objc_msgSend_restoreos(void *a1, const char *a2, ...)
{
  return [a1 restoreos];
}

id objc_msgSend_serviceSettings(void *a1, const char *a2, ...)
{
  return [a1 serviceSettings];
}

id objc_msgSend_setSOCIdAndRev(void *a1, const char *a2, ...)
{
  return [a1 setSOCIdAndRev];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return [a1 sourcePath];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}