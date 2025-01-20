double static PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle.lines.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(void *)&result = 12;
  *(_OWORD *)a1 = xmmword_217BDCB10;
  *(_WORD *)(a1 + 16) = 0;
  return result;
}

double static PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle.dotted.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 10;
  *(_OWORD *)a1 = xmmword_217BDCB20;
  *(_WORD *)(a1 + 16) = -32511;
  return result;
}

uint64_t PhotoStyleDPad.Configuration.showDecorativeElements.getter()
{
  return *v0;
}

uint64_t PhotoStyleDPad.Configuration.showDecorativeElements.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.showDecorativeElements.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.visibleGridCount.getter()
{
  return *(double *)(v0 + 8);
}

void PhotoStyleDPad.Configuration.visibleGridCount.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.visibleGridCount.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.reachableGridCount.getter()
{
  return *(double *)(v0 + 16);
}

void PhotoStyleDPad.Configuration.reachableGridCount.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.reachableGridCount.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.padCornerRadius.getter()
{
  return *(double *)(v0 + 24);
}

void PhotoStyleDPad.Configuration.padCornerRadius.setter(double a1)
{
  *(double *)(v1 + 24) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.padCornerRadius.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.getter()
{
  return *(double *)(v0 + 32);
}

void PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.setter(double a1)
{
  *(double *)(v1 + 32) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.getter()
{
  return *(double *)(v0 + 40);
}

void PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.setter(double a1)
{
  *(double *)(v1 + 40) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.getter()
{
  return *(double *)(v0 + 48);
}

void PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.setter(double a1)
{
  *(double *)(v1 + 48) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.getter()
{
  return *(double *)(v0 + 56);
}

void PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.setter(double a1)
{
  *(double *)(v1 + 56) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.gridDotDimension.getter()
{
  return *(double *)(v0 + 64);
}

void PhotoStyleDPad.Configuration.gridDotDimension.setter(double a1)
{
  *(double *)(v1 + 64) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.gridDotDimension.modify())()
{
  return nullsub_1;
}

uint64_t PhotoStyleDPad.Configuration.useDepthEffects.getter()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t PhotoStyleDPad.Configuration.useDepthEffects.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 72) = result;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.useDepthEffects.modify())()
{
  return nullsub_1;
}

__n128 PhotoStyleDPad.Configuration.gridStyle.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int16 v2 = v1[6].n128_u16[0];
  __n128 result = v1[5];
  *a1 = result;
  a1[1].n128_u16[0] = v2;
  return result;
}

__n128 PhotoStyleDPad.Configuration.gridStyle.setter(__n128 *a1)
{
  unsigned __int16 v2 = a1[1].n128_u16[0];
  __n128 result = *a1;
  v1[5] = *a1;
  v1[6].n128_u16[0] = v2;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.gridStyle.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.getter()
{
  return *(double *)(v0 + 104);
}

void PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.setter(double a1)
{
  *(double *)(v1 + 104) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.getter()
{
  return *(double *)(v0 + 112);
}

void PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.setter(double a1)
{
  *(double *)(v1 + 112) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.getter()
{
  return *(double *)(v0 + 120);
}

void PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.setter(double a1)
{
  *(double *)(v1 + 120) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.modify())()
{
  return nullsub_1;
}

BOOL PhotoStyleDPad.Configuration.isDottedGridAnimated.getter()
{
  return (~*(unsigned __int16 *)(v0 + 96) & 0x8100) == 0;
}

BOOL sub_217B69290@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = PhotoStyleDPad.Configuration.isDottedGridAnimated.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217B692C0(unsigned __int8 *a1)
{
  return PhotoStyleDPad.Configuration.isDottedGridAnimated.setter(*a1);
}

uint64_t PhotoStyleDPad.Configuration.isDottedGridAnimated.setter(uint64_t result)
{
  if (*(__int16 *)(v1 + 96) < 0)
  {
    if (result) {
      __int16 v2 = -32512;
    }
    else {
      __int16 v2 = 0x8000;
    }
    *(_WORD *)(v1 + 96) = v2 & 0xFFFE | *(_WORD *)(v1 + 96) & 1;
  }
  return result;
}

unsigned char *(*PhotoStyleDPad.Configuration.isDottedGridAnimated.modify(uint64_t a1))(void *a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = (~*(unsigned __int16 *)(v1 + 96) & 0x8100) == 0;
  return sub_217B69348;
}

unsigned char *sub_217B69348(void *a1)
{
  uint64_t v3 = *a1;
  BOOL result = a1 + 1;
  uint64_t v2 = v3;
  int v4 = *(__int16 *)(v3 + 96);
  if (v4 < 0)
  {
    if (*result) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)(v2 + 96) = v5 & 0xFFFE | v4 & 1 | 0x8000;
  }
  return result;
}

BOOL PhotoStyleDPad.Configuration.snapIndicatorToGrid.getter()
{
  return (~*(unsigned __int16 *)(v0 + 96) & 0x8001) == 0;
}

BOOL sub_217B6938C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = PhotoStyleDPad.Configuration.snapIndicatorToGrid.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217B693BC(unsigned __int8 *a1)
{
  return PhotoStyleDPad.Configuration.snapIndicatorToGrid.setter(*a1);
}

uint64_t PhotoStyleDPad.Configuration.snapIndicatorToGrid.setter(uint64_t result)
{
  int v2 = *(__int16 *)(v1 + 96);
  if (v2 < 0) {
    *(_WORD *)(v1 + 96) = v2 & 0x100 | result & 1 | 0x8000;
  }
  return result;
}

unsigned __int8 *(*PhotoStyleDPad.Configuration.snapIndicatorToGrid.modify(uint64_t a1))(void *a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = (~*(unsigned __int16 *)(v1 + 96) & 0x8001) == 0;
  return sub_217B6943C;
}

unsigned __int8 *sub_217B6943C(void *a1)
{
  uint64_t v3 = *a1;
  BOOL result = (unsigned __int8 *)(a1 + 1);
  uint64_t v2 = v3;
  int v4 = *(__int16 *)(v3 + 96);
  if (v4 < 0) {
    *(_WORD *)(v2 + 96) = v4 & 0x100 | *result | 0x8000;
  }
  return result;
}

__n128 PhotoStyleDPad.Configuration.init(showDecorativeElements:visibleGridCount:reachableGridCount:padCornerRadius:valueIndicatorActiveDimension:valueIndicatorInactiveDimension:valueIndicatorActiveShadowRadius:defaultValueIndicatorDimension:gridDotDimension:useDepthEffects:gridStyle:edgeAntiAliasingSafetyInset:axisCollisionHapticsIntensity:gestureActivationHapticsIntensity:)@<Q0>(char a1@<W0>, char a2@<W1>, __n128 *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, long long a13, uint64_t a14)
{
  unsigned __int16 v14 = a3[1].n128_u16[0];
  *(unsigned char *)a4 = a1;
  *(double *)(a4 + 8) = a5;
  *(double *)(a4 + 16) = a6;
  *(double *)(a4 + 24) = a7;
  *(double *)(a4 + 32) = a8;
  *(double *)(a4 + 40) = a9;
  *(double *)(a4 + 48) = a10;
  *(double *)(a4 + 56) = a11;
  *(double *)(a4 + 64) = a12;
  *(unsigned char *)(a4 + 72) = a2;
  __n128 result = *a3;
  *(__n128 *)(a4 + 80) = *a3;
  *(_WORD *)(a4 + 96) = v14;
  *(_OWORD *)(a4 + 104) = a13;
  *(void *)(a4 + 120) = a14;
  return result;
}

void static PhotoStyleDPad.Configuration.mac.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(_OWORD *)(a1 + 8) = xmmword_217BDCB30;
  *(_OWORD *)(a1 + 24) = xmmword_217BDCB40;
  *(_OWORD *)(a1 + 40) = xmmword_217BDCB50;
  *(_OWORD *)(a1 + 56) = xmmword_217BDCB60;
  *(unsigned char *)(a1 + 72) = 1;
  *(_OWORD *)(a1 + 80) = xmmword_217BDCB70;
  *(_WORD *)(a1 + 96) = -32511;
  OUTLINED_FUNCTION_6(a1, (__n128)xmmword_217BDCB80);
}

void _s12PhotosUIEdit14PhotoStyleDPadV13ConfigurationV9automaticAEvgZ_0(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(_OWORD *)(a1 + 8) = xmmword_217BDCB90;
  *(_OWORD *)(a1 + 24) = xmmword_217BDCBA0;
  *(_OWORD *)(a1 + 40) = xmmword_217BDCB50;
  *(_OWORD *)(a1 + 56) = xmmword_217BDCB60;
  *(unsigned char *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 80) = xmmword_217BDCB20;
  *(_WORD *)(a1 + 96) = -32511;
  OUTLINED_FUNCTION_6(a1, (__n128)xmmword_217BDCBB0);
}

uint64_t PhotoStyleDPad.subscript.getter()
{
  memcpy(v2, (const void *)(v0 + 184), sizeof(v2));
  return swift_getAtKeyPath();
}

void sub_217B695B4()
{
  if ((~*(unsigned __int16 *)(v0 + 280) & 0x8001) != 0
    || (double v1 = *(double *)(v0 + 112),
        double v2 = *(double *)(v0 + 120),
        double v3 = *(double *)(v0 + 128),
        double v4 = *(double *)(v0 + 136),
        uint64_t v5 = *(void *)(v0 + 264),
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0),
        MEMORY[0x21D4575E0](&v9, v6),
        LOBYTE(v9) == 1))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E0);
    MEMORY[0x21D4575E0](&v9, v7);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E0);
    MEMORY[0x21D4575E0](&v9, v8);
    sub_217B7FF8C(v5, v1, v2, v3, v4, v9);
  }
}

void *PhotoStyleDPad.init(value:isActive:pulsingValueIndicator:defaultValue:minValue:maxValue:backgroundImage:backgroundColor:gradientImageName:staticDottedGridImage:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, double a14@<D4>, double a15@<D5>, double a16@<D6>, double a17@<D7>, long long a18, uint64_t a19, void *__src)
{
  *(void *)&long long v39 = a7;
  *((void *)&v39 + 1) = a8;
  *(double *)&long long v38 = a16;
  *((double *)&v38 + 1) = a17;
  memcpy(__dst, __src, sizeof(__dst));
  type metadata accessor for CGPoint(0);
  sub_217BD8750();
  long long v28 = v42[0];
  uint64_t v29 = *(void *)&v42[1];
  swift_retain();
  sub_217BD8750();
  char v30 = v42[0];
  uint64_t v31 = *((void *)&v42[0] + 1);
  swift_retain();
  sub_217BD7D90();
  sub_217B6F640();
  sub_217BD7DA0();
  swift_release();
  swift_release();
  sub_217BD7D90();
  sub_217BD8960();
  sub_217BD7DA0();
  swift_release();
  swift_release();
  uint64_t v32 = sub_217BD7D70();
  swift_release();
  swift_release();
  *(void *)&v42[0] = a1;
  *((void *)&v42[0] + 1) = a2;
  *(double *)&v42[1] = a10;
  *((double *)&v42[1] + 1) = a11;
  *(void *)&v42[2] = a3;
  *((void *)&v42[2] + 1) = a4;
  LOBYTE(v42[3]) = a5;
  BYTE1(v42[3]) = a6;
  *(_OWORD *)((char *)&v42[3] + 8) = v28;
  *((void *)&v42[4] + 1) = v29;
  LOBYTE(v42[5]) = v30;
  *((void *)&v42[5] + 1) = v31;
  *(double *)&v42[6] = a12;
  *((double *)&v42[6] + 1) = a13;
  *(double *)&v42[7] = a14;
  *((double *)&v42[7] + 1) = a15;
  v42[8] = v38;
  v42[9] = v39;
  v42[10] = a18;
  *(void *)&v42[11] = a19;
  memcpy((char *)&v42[11] + 8, __dst, 0x80uLL);
  *((void *)&v42[19] + 1) = v32;
  sub_217B6F698((uint64_t)v42);
  swift_release();
  swift_release();
  sub_217B6F754(v42);
  return memcpy(a9, v42, 0x140uLL);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t PhotoStyleDPad.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217BD7EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_217BD82D0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF10);
  MEMORY[0x270FA5388](v16 - 8);
  OUTLINED_FUNCTION_7();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF18);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5();
  uint64_t v21 = v20 - v19;
  memcpy(v28, v26, 0x140uLL);
  sub_217B69BD8((uint64_t)v28, v1);
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v15, *MEMORY[0x263F1A028], v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v21 + *(int *)(v18 + 44), v15, v9);
  sub_217B78A98(v1, v21, &qword_267BADF10);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  sub_217B78AE8(v1, &qword_267BADF10);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x263F18DC8], v2);
  v23 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BADF20) + 36));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF28);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v23 + *(int *)(v24 + 28), v8, v2);
  uint64_t *v23 = KeyPath;
  sub_217B78A98(v21, a1, &qword_267BADF18);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  return sub_217B78AE8(v21, &qword_267BADF18);
}

uint64_t sub_217B69BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADFA0);
  MEMORY[0x270FA5388](v60);
  uint64_t v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF90);
  MEMORY[0x270FA5388](v61);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF80);
  uint64_t v7 = MEMORY[0x270FA5388](v64);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v57 - v10;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1C0);
  MEMORY[0x270FA5388](v62);
  uint64_t v63 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1C8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v57 - v18;
  if (*(unsigned char *)(a1 + 256))
  {
    memcpy(v67, (const void *)a1, sizeof(v67));
    v58 = v11;
    sub_217B6A36C((uint64_t)v17);
    v67[0] = *(_OWORD *)(a1 + 32);
    LOBYTE(v67[1]) = *(unsigned char *)(a1 + 48);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
    MEMORY[0x21D4575E0](v66);
    if (LOBYTE(v66[0])) {
      double v29 = 0.995;
    }
    else {
      double v29 = 1.0;
    }
    v67[0] = *(_OWORD *)(a1 + 32);
    LOBYTE(v67[1]) = *(unsigned char *)(a1 + 48);
    MEMORY[0x21D4575E0](v66, v28);
    if (LOBYTE(v66[0])) {
      double v30 = 0.995;
    }
    else {
      double v30 = 1.0;
    }
    sub_217BD89D0();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    v35 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    uint64_t v59 = v13;
    v35(v4, v17, v13);
    v36 = &v4[*(int *)(v60 + 36)];
    *(double *)v36 = v29;
    *((double *)v36 + 1) = v30;
    *((void *)v36 + 2) = v32;
    *((void *)v36 + 3) = v34;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    v67[0] = *(_OWORD *)(a1 + 56);
    *(void *)&v67[1] = *(void *)(a1 + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D8);
    sub_217BD8760();
    double v37 = v66[0] * 0.0174532925;
    sub_217BD89D0();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    sub_217B78A98((uint64_t)v4, (uint64_t)v6, &qword_267BADFA0);
    v42 = &v6[*(int *)(v61 + 36)];
    *(double *)v42 = v37;
    long long v61 = xmmword_217BDCBC0;
    *(_OWORD *)(v42 + 8) = xmmword_217BDCBC0;
    *((void *)v42 + 3) = 0;
    *((void *)v42 + 4) = v39;
    *((void *)v42 + 5) = v41;
    *((_OWORD *)v42 + 3) = xmmword_217BDCBC0;
    sub_217B78AE8((uint64_t)v4, &qword_267BADFA0);
    v67[0] = *(_OWORD *)(a1 + 56);
    *(void *)&v67[1] = *(void *)(a1 + 72);
    sub_217BD8760();
    double v43 = v66[1] * 0.0174532925;
    sub_217BD89D0();
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    sub_217B78A98((uint64_t)v6, (uint64_t)v9, &qword_267BADF90);
    v48 = &v9[*(int *)(v64 + 36)];
    *(double *)v48 = v43;
    *((void *)v48 + 2) = 0;
    *((void *)v48 + 3) = 0;
    *((void *)v48 + 1) = 0xBFF0000000000000;
    *((void *)v48 + 4) = v45;
    *((void *)v48 + 5) = v47;
    *((_OWORD *)v48 + 3) = v61;
    sub_217B78AE8((uint64_t)v6, &qword_267BADF90);
    uint64_t v49 = (uint64_t)v58;
    sub_217B78B3C((uint64_t)v9, (uint64_t)v58, &qword_267BADF80);
    sub_217B78A98(v49, v63, &qword_267BADF80);
    swift_storeEnumTagMultiPayload();
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF58);
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF60);
    type metadata accessor for CGPoint(255);
    uint64_t v53 = v52;
    unint64_t v54 = sub_217B78CE4((uint64_t)&unk_267BADF68);
    unint64_t v55 = sub_217B71128((uint64_t)&unk_267BADF70);
    *(void *)&v67[0] = v51;
    *((void *)&v67[0] + 1) = v53;
    *(void *)&v67[1] = v54;
    *((void *)&v67[1] + 1) = v55;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *(void *)&v67[0] = v50;
    *((void *)&v67[0] + 1) = MEMORY[0x263F8D4F8];
    *(void *)&v67[1] = OpaqueTypeConformance2;
    *((void *)&v67[1] + 1) = MEMORY[0x263F8D510];
    swift_getOpaqueTypeConformance2();
    sub_217B78940((uint64_t)&unk_267BADF78);
    sub_217BD8260();
    return sub_217B78AE8(v49, &qword_267BADF80);
  }
  else
  {
    memcpy(v67, (const void *)a1, sizeof(v67));
    sub_217B6A36C((uint64_t)v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v63, v19, v13);
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF58);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF60);
    type metadata accessor for CGPoint(255);
    uint64_t v23 = v22;
    unint64_t v24 = sub_217B78CE4((uint64_t)&unk_267BADF68);
    unint64_t v25 = sub_217B71128((uint64_t)&unk_267BADF70);
    *(void *)&v67[0] = v21;
    *((void *)&v67[0] + 1) = v23;
    *(void *)&v67[1] = v24;
    *((void *)&v67[1] + 1) = v25;
    uint64_t v26 = swift_getOpaqueTypeConformance2();
    *(void *)&v67[0] = v20;
    *((void *)&v67[0] + 1) = MEMORY[0x263F8D4F8];
    *(void *)&v67[1] = v26;
    *((void *)&v67[1] + 1) = MEMORY[0x263F8D510];
    swift_getOpaqueTypeConformance2();
    sub_217B78940((uint64_t)&unk_267BADF78);
    sub_217BD8260();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

uint64_t sub_217B6A36C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_217BD7F20();
  uint64_t v29 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_217BD7F70();
  uint64_t v35 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF58);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v8);
  v27 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v40, v1, sizeof(v40));
  uint64_t v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), v1, 0x140uLL);
  v39[0] = sub_217B76BA8;
  v39[1] = v11;
  sub_217B6F698((uint64_t)v40);
  sub_217BD7F00();
  sub_217BD7F50();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v28 = v3 + 8;
  double v30 = v12;
  v12(v5, v2);
  long long v36 = v40[0];
  long long v37 = v40[1];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E0);
  MEMORY[0x21D4575E0](&v38, v13);
  long long v36 = v38;
  uint64_t v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), v40, 0x140uLL);
  sub_217B6F698((uint64_t)v40);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF60);
  type metadata accessor for CGPoint(0);
  uint64_t v17 = v16;
  unint64_t v18 = sub_217B78CE4((uint64_t)&unk_267BADF68);
  unint64_t v19 = sub_217B71128((uint64_t)&unk_267BADF70);
  sub_217BD8500();
  swift_release();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v35 + 8);
  v35 += 8;
  uint64_t v21 = v31;
  v20(v7, v31);
  swift_release();
  sub_217BD7F10();
  sub_217BD7F50();
  v30(v5, v29);
  long long v36 = v40[2];
  LOBYTE(v37) = v40[3];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](v39, v22);
  *(void *)&long long v36 = v15;
  *((void *)&v36 + 1) = v17;
  *(void *)&long long v37 = v18;
  *((void *)&v37 + 1) = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v32;
  unint64_t v24 = v27;
  sub_217BD8510();
  v20(v7, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v24, v23);
}

uint64_t sub_217B6A7F4()
{
  return sub_217BD8030();
}

uint64_t sub_217B6A818(uint64_t a1)
{
  sub_217BD7EC0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_217BD8040();
}

uint64_t sub_217B6A8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = sub_217BD88E0();
  v8[1] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1F8);
  sub_217B6A9D8(a2, a1, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_217BD7DB0();
  sub_217BD7DB0();
  sub_217BD88E0();
  sub_217BD7D50();
  sub_217B78A98((uint64_t)v8, a3, &qword_267BAE1F0);
  uint64_t v11 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE200) + 36));
  long long v12 = v14[1];
  *uint64_t v11 = v14[0];
  v11[1] = v12;
  v11[2] = v14[2];
  return sub_217B78AE8((uint64_t)v8, &qword_267BAE1F0);
}

uint64_t sub_217B6A9D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v150 = a3;
  uint64_t v151 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE208);
  uint64_t v146 = *(void *)(v4 - 8);
  uint64_t v147 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v145 = (uint64_t)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE210);
  uint64_t v149 = *(void *)(v142 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v142);
  v148 = (char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v152 = (char *)&v118 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE218);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v153 = (uint64_t)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v157 = (uint64_t)&v118 - v12;
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE220);
  uint64_t v13 = MEMORY[0x270FA5388](v144);
  uint64_t v158 = (uint64_t)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v156 = (uint64_t)&v118 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE228);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v143 = (uint64_t)&v118 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE230);
  MEMORY[0x270FA5388](v18);
  uint64_t v129 = (uint64_t)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE238);
  MEMORY[0x270FA5388](v126);
  uint64_t v128 = (uint64_t)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE240);
  MEMORY[0x270FA5388](v124);
  uint64_t v130 = (uint64_t)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE248);
  MEMORY[0x270FA5388](v125);
  uint64_t v132 = (uint64_t)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE250);
  MEMORY[0x270FA5388](v131);
  uint64_t v138 = (uint64_t)&v118 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE258);
  MEMORY[0x270FA5388](v134);
  uint64_t v137 = (uint64_t)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE260);
  MEMORY[0x270FA5388](v133);
  uint64_t v139 = (uint64_t)&v118 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE268);
  uint64_t v26 = MEMORY[0x270FA5388](v135);
  uint64_t v141 = (uint64_t)&v118 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v136 = (uint64_t)&v118 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v140 = (uint64_t)&v118 - v30;
  uint64_t v31 = sub_217BD7FD0();
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (double *)((char *)&v118 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE270);
  MEMORY[0x270FA5388](v120);
  uint64_t v35 = (char *)&v118 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE278);
  MEMORY[0x270FA5388](v121);
  long long v37 = (char *)&v118 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE280);
  MEMORY[0x270FA5388](v122);
  uint64_t v39 = (char *)&v118 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE288);
  uint64_t v41 = MEMORY[0x270FA5388](v40);
  uint64_t v127 = (uint64_t)&v118 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v45 = (char *)&v118 - v44;
  MEMORY[0x270FA5388](v43);
  uint64_t v123 = (uint64_t)&v118 - v46;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE290);
  uint64_t v48 = MEMORY[0x270FA5388](v47 - 8);
  uint64_t v154 = (uint64_t)&v118 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v48);
  uint64_t v155 = (uint64_t)&v118 - v50;
  if (*(unsigned char *)(a1 + 256))
  {
    double v53 = *(double *)(a1 + 208) + 3.0;
    unint64_t v54 = (char *)v33 + *(int *)(v31 + 20);
    uint64_t v118 = v40;
    uint64_t v119 = v18;
    uint64_t v55 = a1;
    uint64_t v56 = *MEMORY[0x263F19860];
    uint64_t v57 = sub_217BD81C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v54, v56, v57);
    *uint64_t v33 = v53;
    v33[1] = v53;
    sub_217BD8610();
    uint64_t v58 = sub_217BD8640();
    swift_release();
    uint64_t v59 = (void (*)(void))MEMORY[0x263F19048];
    sub_217B77568((uint64_t)v33, (uint64_t)v35, MEMORY[0x263F19048]);
    uint64_t v60 = (uint64_t *)&v35[*(int *)(v120 + 36)];
    *uint64_t v60 = v58;
    v60[1] = 0x4020000000000000;
    v60[2] = 0;
    v60[3] = 0;
    sub_217B775BC((uint64_t)v33, v59);
    sub_217BD89D0();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    sub_217B78A98((uint64_t)v35, (uint64_t)v37, &qword_267BAE270);
    uint64_t v65 = (int64x2_t *)&v37[*(int *)(v121 + 36)];
    *uint64_t v65 = vdupq_n_s64(0x3FF07AE147AE147BuLL);
    v65[1].i64[0] = v62;
    v65[1].i64[1] = v64;
    sub_217B78AE8((uint64_t)v35, &qword_267BAE270);
    long long v164 = *(_OWORD *)(a1 + 32);
    char v165 = *(unsigned char *)(a1 + 48);
    v160[0] = *(_OWORD *)(a1 + 32);
    LOBYTE(v160[1]) = *(unsigned char *)(a1 + 48);
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
    MEMORY[0x21D4575E0](v159);
    if (LOBYTE(v159[0])) {
      double v67 = 0.9;
    }
    else {
      double v67 = 0.5;
    }
    sub_217B78A98((uint64_t)v37, (uint64_t)v39, &qword_267BAE278);
    *(double *)&v39[*(int *)(v122 + 36)] = v67;
    sub_217B78AE8((uint64_t)v37, &qword_267BAE278);
    long long v162 = *(_OWORD *)(v55 + 56);
    uint64_t v163 = *(void *)(v55 + 72);
    v160[0] = *(_OWORD *)(v55 + 56);
    *(void *)&v160[1] = *(void *)(v55 + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D8);
    sub_217BD8760();
    double v68 = v159[0] * -7.0;
    v160[0] = v162;
    *(void *)&v160[1] = v163;
    sub_217BD8760();
    double v69 = v159[1] * -7.0;
    sub_217B78A98((uint64_t)v39, (uint64_t)v45, &qword_267BAE280);
    v70 = (double *)&v45[*(int *)(v118 + 36)];
    double *v70 = v68;
    v70[1] = v69;
    sub_217B78AE8((uint64_t)v39, &qword_267BAE280);
    uint64_t v71 = (uint64_t)v45;
    uint64_t v72 = v123;
    sub_217B78B3C(v71, v123, &qword_267BAE288);
    memcpy(v160, (const void *)v55, sizeof(v160));
    sub_217BD7DB0();
    uint64_t v73 = v143;
    sub_217B6BB14(v143);
    uint64_t v74 = v129;
    sub_217B78A98(v73, v129, &qword_267BAE228);
    *(void *)(v74 + *(int *)(v119 + 36)) = 0x4010000000000000;
    sub_217B78AE8(v73, &qword_267BAE228);
    uint64_t v75 = v128;
    sub_217B78A98(v74, v128, &qword_267BAE230);
    *(void *)(v75 + *(int *)(v126 + 36)) = 0x3FB999999999999ALL;
    sub_217B78AE8(v74, &qword_267BAE230);
    uint64_t v76 = v130;
    sub_217B78A98(v75, v130, &qword_267BAE238);
    uint64_t v77 = v76 + *(int *)(v124 + 36);
    *(void *)uint64_t v77 = 0x4049000000000000;
    *(unsigned char *)(v77 + 8) = 0;
    sub_217B78AE8(v75, &qword_267BAE238);
    sub_217BD89D0();
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v82 = v132;
    sub_217B78A98(v76, v132, &qword_267BAE240);
    v83 = (int64x2_t *)(v82 + *(int *)(v125 + 36));
    int64x2_t *v83 = vdupq_n_s64(0x3FEB333333333333uLL);
    v83[1].i64[0] = v79;
    v83[1].i64[1] = v81;
    sub_217B78AE8(v76, &qword_267BAE240);
    v160[0] = v164;
    LOBYTE(v160[1]) = v165;
    uint64_t v84 = v66;
    a1 = v55;
    MEMORY[0x21D4575E0](v159, v84);
    if (LOBYTE(v159[0])) {
      double v85 = 0.4;
    }
    else {
      double v85 = 0.1;
    }
    uint64_t v86 = v138;
    sub_217B78A98(v82, v138, &qword_267BAE248);
    *(double *)(v86 + *(int *)(v131 + 36)) = v85;
    sub_217B78AE8(v82, &qword_267BAE248);
    v160[0] = v162;
    *(void *)&v160[1] = v163;
    sub_217BD8760();
    double v87 = v159[0] * 7.0;
    v160[0] = v162;
    *(void *)&v160[1] = v163;
    sub_217BD8760();
    double v88 = v159[1] * 7.0;
    uint64_t v89 = v137;
    sub_217B78A98(v86, v137, &qword_267BAE250);
    v90 = (double *)(v89 + *(int *)(v134 + 36));
    double *v90 = v87;
    v90[1] = v88;
    sub_217B78AE8(v86, &qword_267BAE250);
    uint64_t v91 = *(void *)(a1 + 312);
    uint64_t v92 = v139;
    sub_217B78A98(v89, v139, &qword_267BAE258);
    *(void *)(v92 + *(int *)(v133 + 36)) = v91;
    swift_retain();
    sub_217B78AE8(v89, &qword_267BAE258);
    sub_217B78B3C(a1 + 144, (uint64_t)&v161, &qword_267BAE2F0);
    uint64_t v93 = v136;
    sub_217B78A98(v92, v136, &qword_267BAE260);
    sub_217B78B3C((uint64_t)&v161, v93 + *(int *)(v135 + 52), &qword_267BAE2F0);
    sub_217B76CF4(&v161);
    sub_217B78AE8(v92, &qword_267BAE260);
    uint64_t v94 = v140;
    sub_217B78B3C(v93, v140, &qword_267BAE268);
    uint64_t v95 = v127;
    sub_217B78A98(v72, v127, &qword_267BAE288);
    uint64_t v96 = v141;
    sub_217B78A98(v94, v141, &qword_267BAE268);
    uint64_t v97 = v154;
    sub_217B78A98(v95, v154, &qword_267BAE288);
    uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE2F8);
    sub_217B78A98(v96, v97 + *(int *)(v98 + 48), &qword_267BAE268);
    sub_217B78AE8(v94, &qword_267BAE268);
    sub_217B78AE8(v72, &qword_267BAE288);
    sub_217B78AE8(v96, &qword_267BAE268);
    sub_217B78AE8(v95, &qword_267BAE288);
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE298);
    __swift_storeEnumTagSinglePayload(v97, 0, 1, v99);
    sub_217B78B3C(v97, v155, &qword_267BAE290);
    uint64_t v52 = v73;
  }
  else
  {
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE298);
    __swift_storeEnumTagSinglePayload(v155, 1, 1, v51);
    uint64_t v52 = v143;
  }
  memcpy(v160, (const void *)a1, sizeof(v160));
  uint64_t v100 = v151;
  sub_217BD7DB0();
  sub_217B6BB14(v52);
  uint64_t v101 = v158;
  sub_217B78A98(v52, v158, &qword_267BAE228);
  *(void *)(v101 + *(int *)(v144 + 36)) = 0x3FF0000000000000;
  sub_217B78AE8(v52, &qword_267BAE228);
  sub_217B78B3C(v101, v156, &qword_267BAE220);
  sub_217B6C088(v100, v157);
  sub_217B6D954(a1, (uint64_t)v159);
  LOBYTE(v159[34]) = 0;
  memcpy(v160, (const void *)a1, sizeof(v160));
  sub_217BD7DB0();
  uint64_t v102 = v145;
  sub_217B6E388(v145, v103, v104);
  sub_217BD7CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE2A0);
  sub_217B76BBC();
  sub_217B78CE4((uint64_t)&unk_267BAE2E0);
  uint64_t v105 = v147;
  v106 = v148;
  sub_217BD8560();
  (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v102, v105);
  memcpy(v160, v159, 0x111uLL);
  sub_217B76C7C((uint64_t)v160);
  uint64_t v107 = v149;
  v108 = v152;
  uint64_t v109 = v142;
  (*(void (**)(char *, char *, uint64_t))(v149 + 32))(v152, v106, v142);
  uint64_t v110 = v154;
  sub_217B78A98(v155, v154, &qword_267BAE290);
  uint64_t v111 = v158;
  sub_217B78A98(v156, v158, &qword_267BAE220);
  uint64_t v112 = v153;
  sub_217B78A98(v157, v153, &qword_267BAE218);
  v113 = *(void (**)(char *, char *, uint64_t))(v107 + 16);
  v113(v106, v108, v109);
  uint64_t v114 = v150;
  sub_217B78A98(v110, v150, &qword_267BAE290);
  v115 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE2E8);
  sub_217B78A98(v111, v114 + v115[12], &qword_267BAE220);
  sub_217B78A98(v112, v114 + v115[16], &qword_267BAE218);
  v113((char *)(v114 + v115[20]), v106, v109);
  v116 = *(void (**)(char *, uint64_t))(v107 + 8);
  v116(v152, v109);
  sub_217B78AE8(v157, &qword_267BAE218);
  sub_217B78AE8(v156, &qword_267BAE220);
  sub_217B78AE8(v155, &qword_267BAE290);
  v116(v106, v109);
  sub_217B78AE8(v153, &qword_267BAE218);
  sub_217B78AE8(v158, &qword_267BAE220);
  return sub_217B78AE8(v154, &qword_267BAE290);
}

uint64_t sub_217B6BB14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v44 = a1;
  uint64_t v42 = sub_217BD7FD0() - 8;
  MEMORY[0x270FA5388](v42);
  uint64_t v4 = (uint64_t *)((char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_217BD7FC0() - 8;
  MEMORY[0x270FA5388](v43);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4C0);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4C8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v48, v2, 0x140uLL);
  *uint64_t v9 = sub_217BD88E0();
  v9[1] = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4D0);
  sub_217B6E898((uint64_t)v48, (uint64_t)v9 + *(int *)(v19 + 44));
  uint64_t v20 = v48[26];
  uint64_t v21 = v48[36];
  LOBYTE(v2) = sub_217BD8380();
  sub_217BD7C60();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_217B78A98((uint64_t)v9, (uint64_t)v13, &qword_267BAE4B8);
  uint64_t v30 = &v13[*(int *)(v11 + 44)];
  *uint64_t v30 = (char)v2;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_217B78AE8((uint64_t)v9, &qword_267BAE4B8);
  sub_217BD88E0();
  sub_217BD7D50();
  sub_217B78A98((uint64_t)v13, (uint64_t)v17, &qword_267BAE4C0);
  uint64_t v31 = &v17[*(int *)(v15 + 44)];
  long long v32 = v46;
  *(_OWORD *)uint64_t v31 = v45;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v47;
  sub_217B78AE8((uint64_t)v13, &qword_267BAE4C0);
  uint64_t v33 = (char *)v4 + *(int *)(v42 + 28);
  uint64_t v34 = *MEMORY[0x263F19860];
  uint64_t v35 = sub_217BD81C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v33, v34, v35);
  *uint64_t v4 = v20;
  v4[1] = v20;
  uint64_t v36 = (void (*)(void))MEMORY[0x263F19048];
  sub_217B77568((uint64_t)v4, (uint64_t)v6, MEMORY[0x263F19048]);
  *(void *)&v6[*(int *)(v43 + 28)] = v21;
  sub_217B775BC((uint64_t)v4, v36);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE228);
  uint64_t v38 = v44;
  uint64_t v39 = v44 + *(int *)(v37 + 36);
  uint64_t v40 = (void (*)(void))MEMORY[0x263F19028];
  sub_217B77568((uint64_t)v6, v39, MEMORY[0x263F19028]);
  *(_WORD *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4D8) + 36)) = 256;
  sub_217B78A98((uint64_t)v17, v38, &qword_267BAE4C8);
  sub_217B775BC((uint64_t)v6, v40);
  return sub_217B78AE8((uint64_t)v17, &qword_267BAE4C8);
}

uint64_t sub_217B6BF14(uint64_t TupleTypeMetadata, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      uint64_t v9 = v5;
      uint64_t v10 = v8;
      uint64_t v11 = a2;
      do
      {
        uint64_t v12 = *v9++;
        *v10++ = v12;
        --v11;
      }
      while (v11);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v15 = (int *)(v6 + 32);
    uint64_t v16 = a2;
    do
    {
      if (a2 == 1) {
        int v17 = 0;
      }
      else {
        int v17 = *v15;
      }
      uint64_t v19 = *v5++;
      uint64_t v18 = v19;
      uint64_t v20 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 16))(&v14[v17], v20);
      v15 += 4;
      --v16;
    }
    while (v16);
  }
  return sub_217BD89A0();
}

uint64_t sub_217B6C088@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v242 = a1;
  uint64_t v248 = a2;
  uint64_t v2 = sub_217BD86C0();
  uint64_t v231 = *(void *)(v2 - 8);
  uint64_t v232 = v2;
  MEMORY[0x270FA5388](v2);
  v230 = (char *)&v196 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE368);
  MEMORY[0x270FA5388](v206);
  *(void *)&double v208 = (char *)&v196 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v217 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE370);
  uint64_t v5 = MEMORY[0x270FA5388](v217);
  *(void *)&double v207 = (char *)&v196 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v209 = (uint64_t)&v196 - v7;
  v225 = (void (*)(char *, void, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE378);
  MEMORY[0x270FA5388](v225);
  uint64_t v228 = (uint64_t)&v196 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_217BD7FE0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v216 = (uint64_t)&v196 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE380);
  MEMORY[0x270FA5388](v202);
  v204 = (char *)&v196 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v223 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE388);
  uint64_t v12 = MEMORY[0x270FA5388](v223);
  uint64_t v203 = (uint64_t)&v196 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v205 = (uint64_t)&v196 - v14;
  uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE390);
  MEMORY[0x270FA5388](v241);
  v226 = (char *)&v196 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v239 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE398);
  MEMORY[0x270FA5388](v239);
  uint64_t v240 = (uint64_t)&v196 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3A0);
  MEMORY[0x270FA5388](v235);
  uint64_t v229 = (uint64_t)&v196 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3A8);
  uint64_t v221 = *(void *)(v18 - 8);
  uint64_t v222 = v18;
  MEMORY[0x270FA5388](v18);
  v220 = (char *)&v196 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3B0);
  uint64_t v20 = MEMORY[0x270FA5388](v219);
  uint64_t v224 = (uint64_t)&v196 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v218 = (char *)&v196 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v227 = (uint64_t)&v196 - v24;
  uint64_t v25 = (double *)sub_217BD8980();
  v237 = (void (**)(char *, void, double *))*((void *)v25 - 1);
  v238 = v25;
  MEMORY[0x270FA5388](v25);
  v236 = (char *)&v196 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v233 = sub_217BD8150();
  uint64_t v243 = *(void *)(v233 - 8);
  MEMORY[0x270FA5388](v233);
  v214 = (char *)&v196 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3B8);
  v244 = *(void **)(v234 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v234);
  v215 = (char *)&v196 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v213 = (char *)&v196 - v30;
  uint64_t v210 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3C0);
  MEMORY[0x270FA5388](v210);
  v212 = (char *)&v196 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3C8);
  uint64_t v32 = MEMORY[0x270FA5388](v211);
  uint64_t v34 = (char *)&v196 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v196 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v39 = (char *)&v196 - v38;
  uint64_t v247 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3D0);
  MEMORY[0x270FA5388](v247);
  uint64_t v41 = (char *)&v196 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v246 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3D8);
  MEMORY[0x270FA5388](v246);
  uint64_t v43 = (char *)&v196 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3E0);
  MEMORY[0x270FA5388](v44);
  long long v46 = (uint64_t *)((char *)&v196 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE3E8);
  uint64_t v48 = MEMORY[0x270FA5388](v47);
  uint64_t v50 = (char *)&v196 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = MEMORY[0x270FA5388](v48);
  unint64_t v54 = (char *)&v196 - v53;
  uint64_t v55 = *(void *)(v52 + 264);
  int v56 = *(__int16 *)(v52 + 280);
  uint64_t v245 = v51;
  if (v56 < 0)
  {
    v197 = v37;
    v198 = v34;
    uint64_t v65 = v230;
    uint64_t v66 = v231;
    uint64_t v67 = v232;
    v199 = v41;
    v200 = v39;
    v201 = v43;
    double v68 = *(double *)(v52 + 192);
    double v69 = *(double *)(v52 + 200);
    double v70 = *(double *)(v52 + 224);
    uint64_t v71 = *(void *)(v52 + 272);
    if ((v56 & 0x100) != 0)
    {
      long long v251 = *(_OWORD *)(v52 + 32);
      char v252 = *(unsigned char *)(v52 + 48);
      v250[0] = *(_OWORD *)(v52 + 32);
      LOBYTE(v250[1]) = *(unsigned char *)(v52 + 48);
      uint64_t v102 = (double *)v52;
      uint64_t v103 = v55;
      sub_217B6F698(v52);
      uint64_t v217 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
      MEMORY[0x21D4575E0](&v249);
      char v104 = v249;
      memcpy(v250, v102, sizeof(v250));
      sub_217B695B4();
      double v105 = v102[14];
      double v106 = v102[15];
      double v107 = v102[16] - v105;
      double v108 = v102[17] - v106;
      uint64_t v216 = *(void *)&v105;
      double v208 = v107;
      uint64_t v209 = *(void *)&v106;
      double v207 = v108;
      sub_217B7FFBC(v105, v106, v107, v108);
      double v109 = (double)v103;
      double v110 = 0.0;
      sub_217B80D44(0.0, 0.0, (double)v103, (double)v103);
      uint64_t v112 = v111;
      uint64_t v113 = v71;
      double v115 = v114;
      sub_217B6F754(v102);
      sub_217BD7DB0();
      double v116 = (v68 - v69) / v68;
      double v118 = v116 * v117 - v70;
      double v120 = v116 * v119 - v70;
      if (v118 >= 0.0) {
        double v121 = v118;
      }
      else {
        double v121 = 0.0;
      }
      if (v120 >= 0.0) {
        double v110 = v120;
      }
      char v122 = sub_217BD8380();
      LOBYTE(v250[0]) = 0;
      BYTE1(v250[0]) = v104;
      *((void *)&v250[0] + 1) = v112;
      *(double *)&v250[1] = v109 - v115;
      BYTE8(v250[1]) = 0;
      uint64_t v232 = v103;
      *(void *)&v250[2] = v103;
      *((void *)&v250[2] + 1) = v113;
      *(void *)&v250[3] = 0x3FD47AE147AE147BLL;
      BYTE8(v250[3]) = 0;
      LOBYTE(v250[4]) = v122;
      *((double *)&v250[4] + 1) = v110;
      *(double *)&v250[5] = v121;
      *((double *)&v250[5] + 1) = v110;
      *(double *)&v250[6] = v121;
      BYTE8(v250[6]) = 0;
      uint64_t v123 = v243;
      uint64_t v124 = *(void (**)(void))(v243 + 104);
      uint64_t v125 = v214;
      LODWORD(v228) = *MEMORY[0x263F19790];
      uint64_t v126 = v233;
      v225 = (void (*)(char *, void, uint64_t))v124;
      v226 = (char *)(v243 + 104);
      v124(v214);
      uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE458);
      unint64_t v128 = sub_217B77264();
      uint64_t v129 = v213;
      v230 = (char *)v128;
      uint64_t v231 = v127;
      sub_217BD84D0();
      uint64_t v130 = *(void (**)(char *, uint64_t))(v123 + 8);
      uint64_t v243 = v123 + 8;
      uint64_t v223 = (uint64_t)v130;
      v130(v125, v126);
      uint64_t v132 = v236;
      uint64_t v131 = v237;
      uint64_t v133 = v238;
      v237[13](v236, *MEMORY[0x263F1B9B0], v238);
      uint64_t v134 = (uint64_t)v212;
      ((void (**)(char *, char *, double *))v131)[2](&v212[*(int *)(v210 + 36)], v132, v133);
      uint64_t v135 = v244;
      uint64_t v136 = v234;
      ((void (*)(uint64_t, char *, uint64_t))v244[2])(v134, v129, v234);
      ((void (*)(char *, double *))v131[1])(v132, v133);
      uint64_t v137 = (void (**)(char *, void, double *))v135[1];
      v244 = v135 + 1;
      v237 = v137;
      ((void (*)(char *, uint64_t))v137)(v129, v136);
      uint64_t v138 = (uint64_t)v197;
      sub_217B78A98(v134, (uint64_t)v197, &qword_267BAE3C0);
      *(void *)(v138 + *(int *)(v211 + 36)) = 0x4000000000000000;
      sub_217B78AE8(v134, &qword_267BAE3C0);
      sub_217B78B3C(v138, (uint64_t)v200, &qword_267BAE3C8);
      v250[0] = v251;
      LOBYTE(v250[1]) = v252;
      sub_217B6F698((uint64_t)v102);
      uint64_t v139 = v217;
      MEMORY[0x21D4575E0](&v249, v217);
      char v140 = v249;
      v250[0] = v251;
      LOBYTE(v250[1]) = v252;
      MEMORY[0x21D4575E0](&v249, v139);
      v238 = v102;
      sub_217B6F754(v102);
      char v141 = v249;
      uint64_t v142 = 0;
      double v143 = 0.0;
      if ((v249 & 1) == 0)
      {
        uint64_t v144 = v238;
        memcpy(v250, v238, sizeof(v250));
        sub_217B6F698((uint64_t)v238);
        sub_217B695B4();
        sub_217B7FFBC(*(double *)&v216, *(double *)&v209, v208, v207);
        sub_217B80D44(0.0, 0.0, v109, v109);
        uint64_t v142 = v145;
        double v147 = v146;
        sub_217B6F754(v144);
        double v143 = v109 - v147;
      }
      sub_217BD7DB0();
      double v149 = v116 * v148 - v70;
      double v151 = v116 * v150 - v70;
      if (v149 >= 0.0) {
        double v152 = v149;
      }
      else {
        double v152 = 0.0;
      }
      if (v151 >= 0.0) {
        double v153 = v151;
      }
      else {
        double v153 = 0.0;
      }
      char v154 = sub_217BD8380();
      LOBYTE(v250[0]) = 1;
      BYTE1(v250[0]) = v140;
      *((void *)&v250[0] + 1) = v142;
      *(double *)&v250[1] = v143;
      BYTE8(v250[1]) = v141;
      uint64_t v155 = v233;
      *(void *)&v250[2] = v232;
      *((void *)&v250[2] + 1) = v113;
      *(void *)&v250[3] = 0x3FD47AE147AE147BLL;
      BYTE8(v250[3]) = 1;
      LOBYTE(v250[4]) = v154;
      *((double *)&v250[4] + 1) = v153;
      *(double *)&v250[5] = v152;
      *((double *)&v250[5] + 1) = v153;
      *(double *)&v250[6] = v152;
      BYTE8(v250[6]) = 0;
      v225(v125, v228, v233);
      uint64_t v156 = v215;
      uint64_t v158 = v230;
      uint64_t v157 = v231;
      sub_217BD84D0();
      ((void (*)(char *, uint64_t))v223)(v125, v155);
      uint64_t v159 = sub_217B6D7CC();
      MEMORY[0x270FA5388](v159);
      *(&v196 - 2) = (uint64_t)v238;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE490);
      *(void *)&v250[0] = v157;
      *((void *)&v250[0] + 1) = v158;
      swift_getOpaqueTypeConformance2();
      sub_217B774C8();
      v160 = v220;
      uint64_t v161 = v234;
      sub_217BD8590();
      swift_release();
      ((void (*)(char *, uint64_t))v237)(v156, v161);
      uint64_t v163 = v221;
      uint64_t v162 = v222;
      uint64_t v164 = (uint64_t)v218;
      (*(void (**)(char *, char *, uint64_t))(v221 + 16))(v218, v160, v222);
      *(void *)(v164 + *(int *)(v219 + 36)) = 0x4008000000000000;
      (*(void (**)(char *, uint64_t))(v163 + 8))(v160, v162);
      uint64_t v165 = v227;
      sub_217B78B3C(v164, v227, &qword_267BAE3B0);
      uint64_t v166 = (uint64_t)v200;
      uint64_t v167 = (uint64_t)v198;
      sub_217B78A98((uint64_t)v200, (uint64_t)v198, &qword_267BAE3C8);
      uint64_t v168 = v224;
      sub_217B78A98(v165, v224, &qword_267BAE3B0);
      uint64_t v169 = v229;
      sub_217B78A98(v167, v229, &qword_267BAE3C8);
      uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4B0);
      sub_217B78A98(v168, v169 + *(int *)(v170 + 48), &qword_267BAE3B0);
      sub_217B78AE8(v168, &qword_267BAE3B0);
      sub_217B78AE8(v167, &qword_267BAE3C8);
      sub_217B78A98(v169, v240, &qword_267BAE3A0);
      swift_storeEnumTagMultiPayload();
      sub_217B78CE4((uint64_t)&unk_267BAE468);
      sub_217B772E0();
      uint64_t v171 = (uint64_t)v199;
      sub_217BD8260();
      sub_217B78AE8(v169, &qword_267BAE3A0);
      sub_217B78AE8(v165, &qword_267BAE3B0);
      sub_217B78AE8(v166, &qword_267BAE3C8);
      uint64_t v172 = (uint64_t)v201;
    }
    else
    {
      uint64_t v72 = *(void **)(v52 + 176);
      if (v72)
      {
        v244 = v72;
        sub_217BD8690();
        uint64_t v73 = v67;
        (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, *MEMORY[0x263F1B4B8], v67);
        uint64_t v74 = sub_217BD86E0();
        swift_release();
        (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v73);
        sub_217BD7DB0();
        double v75 = (v68 - v69) / v68;
        double v77 = v75 * v76 - v70;
        double v79 = v75 * v78 - v70;
        if (v77 >= 0.0) {
          double v80 = v77;
        }
        else {
          double v80 = 0.0;
        }
        if (v79 >= 0.0) {
          double v81 = v79;
        }
        else {
          double v81 = 0.0;
        }
        char v82 = sub_217BD8380();
        char v83 = sub_217BD8380();
        sub_217BD7C60();
        uint64_t v85 = v84;
        uint64_t v87 = v86;
        uint64_t v89 = v88;
        uint64_t v91 = v90;
        uint64_t v92 = v236;
        uint64_t v93 = v237;
        uint64_t v94 = v238;
        v237[13](v236, *MEMORY[0x263F1B9B0], v238);
        uint64_t v95 = v216;
        ((void (**)(char *, char *, double *))v93)[2]((char *)v216, v92, v94);
        uint64_t v96 = *(void *)&v208;
        uint64_t v97 = (void (*)(void))MEMORY[0x263F190D8];
        sub_217B77568(v95, *(void *)&v208 + *(int *)(v206 + 36), MEMORY[0x263F190D8]);
        *(void *)uint64_t v96 = v74;
        *(void *)(v96 + 8) = 0;
        *(_WORD *)(v96 + 16) = 1;
        *(unsigned char *)(v96 + 24) = v82;
        *(double *)(v96 + 32) = v81;
        *(double *)(v96 + 40) = v80;
        *(double *)(v96 + 48) = v81;
        *(double *)(v96 + 56) = v80;
        *(unsigned char *)(v96 + 64) = 0;
        *(unsigned char *)(v96 + 72) = v83;
        *(void *)(v96 + 80) = v85;
        *(void *)(v96 + 88) = v87;
        *(void *)(v96 + 96) = v89;
        *(void *)(v96 + 104) = v91;
        *(unsigned char *)(v96 + 112) = 0;
        swift_retain();
        sub_217B775BC(v95, v97);
        ((void (*)(char *, double *))v93[1])(v92, v94);
        swift_release();
        uint64_t v98 = *(void *)&v207;
        sub_217B78A98(v96, *(uint64_t *)&v207, &qword_267BAE368);
        *(void *)(v98 + *(int *)(v217 + 36)) = 0x4000000000000000;
        sub_217B78AE8(v96, &qword_267BAE368);
        uint64_t v99 = &qword_267BAE370;
        uint64_t v100 = v209;
        sub_217B78B3C(v98, v209, &qword_267BAE370);
        sub_217B78A98(v100, v228, &qword_267BAE370);
        swift_storeEnumTagMultiPayload();
        sub_217B76FF8();
        sub_217B77198();
        uint64_t v101 = (uint64_t)v226;
        sub_217BD8260();
      }
      else
      {
        char v173 = *(unsigned char *)(v52 + 184) & 1;
        uint64_t v174 = v52;
        uint64_t v175 = v55;
        memcpy(v250, (const void *)v52, sizeof(v250));
        sub_217B6F698(v174);
        sub_217B695B4();
        sub_217B7FFBC(*(double *)(v174 + 112), *(double *)(v174 + 120), *(double *)(v174 + 128) - *(double *)(v174 + 112), *(double *)(v174 + 136) - *(double *)(v174 + 120));
        sub_217B80D44(0.0, 0.0, (double)v175, (double)v175);
        uint64_t v177 = v176;
        double v179 = v178;
        sub_217B6F754((void *)v174);
        sub_217BD7DB0();
        double v180 = (v68 - v69) / v68;
        double v182 = v180 * v181 - v70;
        double v184 = v180 * v183 - v70;
        if (v182 >= 0.0) {
          double v185 = v182;
        }
        else {
          double v185 = 0.0;
        }
        if (v184 >= 0.0) {
          double v186 = v184;
        }
        else {
          double v186 = 0.0;
        }
        char v187 = sub_217BD8380();
        v189 = v236;
        v188 = v237;
        v190 = v238;
        v237[13](v236, *MEMORY[0x263F1B9B0], v238);
        uint64_t v191 = v216;
        ((void (**)(char *, char *, double *))v188)[2]((char *)v216, v189, v190);
        uint64_t v192 = (uint64_t)v204;
        v193 = (void (*)(void))MEMORY[0x263F190D8];
        sub_217B77568(v191, (uint64_t)&v204[*(int *)(v202 + 36)], MEMORY[0x263F190D8]);
        *(_WORD *)uint64_t v192 = 0;
        *(void *)(v192 + 8) = v177;
        *(double *)(v192 + 16) = (double)v175 - v179;
        *(unsigned char *)(v192 + 24) = 0;
        *(void *)(v192 + 32) = v175;
        *(void *)(v192 + 40) = v71;
        *(void *)(v192 + 48) = 0x3FD47AE147AE147BLL;
        *(unsigned char *)(v192 + 56) = v173;
        *(unsigned char *)(v192 + 64) = v187;
        *(double *)(v192 + 72) = v186;
        *(double *)(v192 + 80) = v185;
        *(double *)(v192 + 88) = v186;
        *(double *)(v192 + 96) = v185;
        *(unsigned char *)(v192 + 104) = 0;
        sub_217B775BC(v191, v193);
        ((void (*)(char *, double *))v188[1])(v189, v190);
        uint64_t v194 = v203;
        sub_217B78A98(v192, v203, &qword_267BAE380);
        *(void *)(v194 + *(int *)(v223 + 36)) = 0x4000000000000000;
        sub_217B78AE8(v192, &qword_267BAE380);
        uint64_t v99 = &qword_267BAE388;
        uint64_t v100 = v205;
        sub_217B78B3C(v194, v205, &qword_267BAE388);
        sub_217B78A98(v100, v228, &qword_267BAE388);
        swift_storeEnumTagMultiPayload();
        sub_217B76FF8();
        sub_217B77198();
        uint64_t v101 = (uint64_t)v226;
        sub_217BD8260();
      }
      sub_217B78AE8(v100, v99);
      uint64_t v171 = (uint64_t)v199;
      sub_217B78A98(v101, v240, &qword_267BAE390);
      swift_storeEnumTagMultiPayload();
      sub_217B78CE4((uint64_t)&unk_267BAE468);
      sub_217B772E0();
      sub_217BD8260();
      sub_217B78AE8(v101, &qword_267BAE390);
      uint64_t v172 = (uint64_t)v201;
    }
    sub_217B78A98(v171, v172, &qword_267BAE3D0);
    swift_storeEnumTagMultiPayload();
    sub_217B7735C();
    sub_217B77420();
    sub_217BD8260();
    uint64_t v63 = v171;
    uint64_t v64 = &qword_267BAE3D0;
  }
  else
  {
    uint64_t v57 = *(void *)(v52 + 208);
    uint64_t v58 = (uint64_t *)((char *)v46 + *(int *)(v44 + 36));
    uint64_t v59 = v55;
    uint64_t v60 = (char *)v58 + *(int *)(sub_217BD7FD0() + 20);
    uint64_t v61 = *MEMORY[0x263F19860];
    uint64_t v62 = sub_217BD81C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v62 - 8) + 104))(v60, v61, v62);
    void *v58 = v57;
    v58[1] = v57;
    *long long v46 = v59;
    *(uint64_t *)((char *)v46 + *(int *)(v44 + 40)) = 0;
    sub_217B78A98((uint64_t)v46, (uint64_t)v50, &qword_267BAE3E0);
    *(void *)&v50[*(int *)(v245 + 36)] = 0x4000000000000000;
    sub_217B78AE8((uint64_t)v46, &qword_267BAE3E0);
    sub_217B78B3C((uint64_t)v50, (uint64_t)v54, &qword_267BAE3E8);
    sub_217B78A98((uint64_t)v54, (uint64_t)v43, &qword_267BAE3E8);
    swift_storeEnumTagMultiPayload();
    sub_217B7735C();
    sub_217B77420();
    sub_217BD8260();
    uint64_t v63 = (uint64_t)v54;
    uint64_t v64 = &qword_267BAE3E8;
  }
  return sub_217B78AE8(v63, v64);
}

uint64_t sub_217B6D7CC()
{
  return sub_217BD8940();
}

uint64_t sub_217B6D824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE490);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v14 = *(_OWORD *)(a2 + 32);
  char v15 = *(unsigned char *)(a2 + 48);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v16, v10);
  if ((_BYTE)v16) {
    double v11 = 0.0;
  }
  else {
    double v11 = 0.8;
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4A8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v9, a1, v12);
  *(double *)&v9[*(int *)(v7 + 44)] = v11;
  return sub_217B78B3C((uint64_t)v9, a3, &qword_267BAE490);
}

void sub_217B6D954(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v114 = a2;
  uint64_t v3 = sub_217BD85D0();
  MEMORY[0x270FA5388](v3);
  double v5 = *(double *)(a1 + 192);
  double v6 = *(double *)(a1 + 200);
  double v7 = *(double *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 240);
  double v117 = *(double *)(a1 + 216);
  uint64_t v118 = v8;
  uint64_t v9 = *(void *)(a1 + 264);
  int v10 = *(unsigned __int16 *)(a1 + 280);
  (*(void (**)(char *, void))(v11 + 104))((char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F1B388]);
  uint64_t v116 = sub_217BD8670();
  uint64_t v12 = *(void *)(a1 + 104);
  double v14 = *(double *)(a1 + 112);
  double v13 = *(double *)(a1 + 120);
  double v15 = *(double *)(a1 + 128);
  double v16 = *(double *)(a1 + 136);
  double v123 = *(double *)(a1 + 96);
  double v124 = v15;
  uint64_t v122 = v12;
  if ((~v10 & 0x8001) == 0) {
    sub_217B7FF8C(v9, v14, v13, v124, v16, v123);
  }
  sub_217BD7DB0();
  double v18 = v17;
  double v20 = v19;
  double v21 = (v5 - v6) / v5;
  double v22 = v21 * v17 - v7;
  double v120 = v21;
  double v125 = v7;
  double v23 = v21 * v20 - v7;
  double v24 = 0.0;
  if (v22 >= 0.0) {
    double v25 = v22;
  }
  else {
    double v25 = 0.0;
  }
  if (v23 >= 0.0) {
    double v24 = v23;
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  CGRect v130 = CGRectInset(*(CGRect *)(&v18 - 2), v25, v24);
  CGFloat x = v130.origin.x;
  v130.origin.CGFloat x = v14;
  CGFloat y = v130.origin.y;
  CGFloat width = v130.size.width;
  CGFloat height = v130.size.height;
  v130.size.CGFloat width = v124 - v130.origin.x;
  double v32 = v16 - v13;
  double v124 = v130.origin.x;
  double v121 = v130.size.width;
  sub_217B7FFBC(v130.origin.x, v13, v130.size.width, v32);
  double v115 = v33;
  double v35 = v34;
  v131.origin.CGFloat x = x;
  v131.origin.CGFloat y = y;
  v131.size.CGFloat width = width;
  v131.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v131);
  v132.origin.CGFloat x = x;
  v132.origin.CGFloat y = y;
  v132.size.CGFloat width = width;
  v132.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v132);
  if (MinX > MaxX)
  {
    __break(1u);
    goto LABEL_25;
  }
  double v119 = v32;
  double v113 = MaxX;
  v133.origin.CGFloat x = x;
  v133.origin.CGFloat y = y;
  v133.size.CGFloat width = width;
  v133.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v133);
  v134.origin.CGFloat x = x;
  v134.origin.CGFloat y = y;
  v134.size.CGFloat width = width;
  v134.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v134);
  double v112 = MinY;
  if (MinY > MaxY)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  double v109 = MaxY;
  double v110 = MinX;
  double v111 = v35;
  sub_217BD7D90();
  sub_217BD8930();
  sub_217BD8920();
  swift_release();
  sub_217BD7DA0();
  swift_release();
  swift_release();
  sub_217BD7D90();
  sub_217BD8940();
  sub_217BD7DA0();
  swift_release();
  swift_release();
  *(double *)&uint64_t v40 = COERCE_DOUBLE(sub_217BD7D70());
  swift_release();
  swift_release();
  *(void *)&v129[0] = 0;
  *((void *)&v129[0] + 1) = 0xE000000000000000;
  *(double *)uint64_t v127 = v123;
  v127[1] = v122;
  type metadata accessor for CGPoint(0);
  sub_217BD8D00();
  long long v41 = v129[0];
  memcpy(v129, (const void *)a1, 0x140uLL);
  int v100 = sub_217B6E0BC();
  v129[0] = *(_OWORD *)(a1 + 32);
  LOBYTE(v129[1]) = *(unsigned char *)(a1 + 48);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](v127, v42);
  int v99 = LOBYTE(v127[0]);
  double v123 = COERCE_DOUBLE(sub_217BD8630());
  uint64_t v43 = sub_217BD88E0();
  uint64_t v45 = v44;
  uint64_t v122 = sub_217BD88E0();
  uint64_t v108 = v46;
  sub_217B6E198(a1, (uint64_t *)v129);
  uint64_t v101 = *(void *)&v129[0];
  uint64_t v106 = *(void *)&v129[1];
  uint64_t v107 = *((void *)&v129[0] + 1);
  uint64_t v104 = *((void *)&v129[2] + 1);
  uint64_t v47 = *(void *)&v129[2];
  uint64_t v105 = *((void *)&v129[1] + 1);
  uint64_t v102 = *((void *)&v129[3] + 1);
  uint64_t v103 = *(void *)&v129[3];
  memcpy(v129, (const void *)a1, 0x140uLL);
  sub_217B695B4();
  sub_217BD7DB0();
  double v49 = v48;
  double v51 = v50;
  double v52 = v120 * v48 - v125;
  double v53 = v120 * v50 - v125;
  if (v52 >= 0.0) {
    double v54 = v52;
  }
  else {
    double v54 = 0.0;
  }
  if (v53 >= 0.0) {
    double v55 = v53;
  }
  else {
    double v55 = 0.0;
  }
  char v56 = *(unsigned char *)(a1 + 49);
  unsigned __int8 v126 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  CGRect v135 = CGRectInset(*(CGRect *)(&v49 - 2), v54, v55);
  CGFloat v59 = v135.origin.x;
  CGFloat v60 = v135.origin.y;
  CGFloat v61 = v135.size.width;
  CGFloat v62 = v135.size.height;
  sub_217B7FFBC(v124, v13, v121, v119);
  double v64 = v63;
  double v66 = v65;
  v136.origin.CGFloat x = v59;
  v136.origin.CGFloat y = v60;
  v136.size.CGFloat width = v61;
  v136.size.CGFloat height = v62;
  double v67 = CGRectGetMinX(v136);
  v137.origin.CGFloat x = v59;
  v137.origin.CGFloat y = v60;
  v137.size.CGFloat width = v61;
  v137.size.CGFloat height = v62;
  double v68 = CGRectGetMaxX(v137);
  if (v67 > v68) {
    goto LABEL_26;
  }
  double v69 = v68;
  double v124 = v66;
  v138.origin.CGFloat x = v59;
  v138.origin.CGFloat y = v60;
  v138.size.CGFloat width = v61;
  v138.size.CGFloat height = v62;
  double v70 = CGRectGetMinY(v138);
  v139.origin.CGFloat x = v59;
  v139.origin.CGFloat y = v60;
  v139.size.CGFloat width = v61;
  v139.size.CGFloat height = v62;
  double v71 = CGRectGetMaxY(v139);
  if (v70 > v71)
  {
LABEL_27:
    __break(1u);
    return;
  }
  double v72 = v67 + v64 * (v69 - v67);
  double v73 = 1.0;
  double v120 = v110 + v115 * (v113 - v110);
  double v121 = v112 + (1.0 - v111) * (v109 - v112);
  if (v99) {
    double v74 = v117;
  }
  else {
    double v74 = v125;
  }
  double v115 = v74;
  if ((v100 & 1) == 0) {
    double v73 = 0.0;
  }
  double v125 = v73;
  double v75 = v70 + (1.0 - v124) * (v71 - v70);
  uint64_t v76 = v47;
  uint64_t v97 = v45;
  uint64_t v98 = v47;
  double v117 = *(double *)&v40;
  double v124 = *((double *)&v41 + 1);
  uint64_t v77 = v45;
  double v119 = *(double *)&v41;
  unsigned __int8 v78 = v126;
  LODWORD(v113) = v126;
  memcpy(v129, (const void *)a1, 0x140uLL);
  char v79 = v56;
  sub_217B6E2BC();
  double v111 = v81;
  double v112 = v80;
  LOBYTE(v127[0]) = v56;
  *(double *)&v127[1] = v74;
  uint64_t v83 = v122;
  double v82 = v123;
  *(double *)&v127[2] = v123;
  v127[3] = 0x3FD6666666666666;
  LOBYTE(v127[4]) = v78;
  uint64_t v84 = v114;
  uint64_t v85 = v108;
  v127[5] = v122;
  v127[6] = v108;
  uint64_t v86 = v101;
  v127[7] = v101;
  uint64_t v88 = v106;
  uint64_t v87 = v107;
  v127[8] = v107;
  v127[9] = v106;
  uint64_t v89 = v104;
  uint64_t v90 = v105;
  v127[10] = v105;
  v127[11] = v76;
  uint64_t v92 = v102;
  uint64_t v91 = v103;
  v127[12] = v104;
  v127[13] = v103;
  v127[14] = v102;
  v127[15] = v43;
  v127[16] = v77;
  *(double *)&v127[17] = v72;
  *(double *)&v127[18] = v75;
  *(double *)&v127[19] = v80;
  *(double *)&v127[20] = v81;
  char v128 = 1;
  v127[21] = 0x4010000000000000;
  memcpy((void *)(v114 + 96), v127, 0xB0uLL);
  char v93 = v128;
  *(unsigned char *)uint64_t v84 = 0;
  *(void *)(v84 + 8) = v118;
  double v94 = v117;
  *(void *)(v84 + 16) = v116;
  *(void *)(v84 + 24) = 0;
  *(unsigned char *)(v84 + 32) = v93;
  double v95 = v121;
  *(double *)(v84 + 40) = v120;
  *(double *)(v84 + 48) = v95;
  double v96 = v119;
  *(double *)(v84 + 56) = v94;
  *(double *)(v84 + 64) = v96;
  *(double *)(v84 + 72) = v124;
  *(double *)(v84 + 80) = v125;
  *(void *)(v84 + 88) = 0x4008000000000000;
  LOBYTE(v129[0]) = v79;
  *((double *)v129 + 1) = v115;
  *(double *)&v129[1] = v82;
  *((void *)&v129[1] + 1) = 0x3FD6666666666666;
  LOBYTE(v129[2]) = LOBYTE(v113);
  *((void *)&v129[2] + 1) = v83;
  *(void *)&v129[3] = v85;
  *((void *)&v129[3] + 1) = v86;
  *(void *)&v129[4] = v87;
  *((void *)&v129[4] + 1) = v88;
  *(void *)&v129[5] = v90;
  *((void *)&v129[5] + 1) = v98;
  *(void *)&v129[6] = v89;
  *((void *)&v129[6] + 1) = v91;
  *(void *)&v129[7] = v92;
  *((void *)&v129[7] + 1) = v43;
  *(void *)&v129[8] = v97;
  *((double *)&v129[8] + 1) = v72;
  *(double *)&v129[9] = v75;
  *((double *)&v129[9] + 1) = v112;
  *(double *)&v129[10] = v111;
  *((void *)&v129[10] + 1) = 0x4010000000000000;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_217B76F60((uint64_t)v127);
  sub_217B76FAC((uint64_t)v129);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

uint64_t sub_217B6E0BC()
{
  if (*(unsigned char *)(v0 + 184) != 1) {
    return 0;
  }
  if ((~*(unsigned __int16 *)(v0 + 280) & 0x8001) != 0) {
    return 1;
  }
  double v1 = *(double *)(v0 + 96);
  double v2 = *(double *)(v0 + 112);
  double v3 = *(double *)(v0 + 120);
  double v4 = *(double *)(v0 + 128);
  double v5 = *(double *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 264);
  double v7 = sub_217B7FF8C(v6, v2, v3, v4, v5, (v2 + v4) * 0.5);
  double v9 = v8;
  BOOL v10 = sub_217B7FF8C(v6, v2, v3, v4, v5, v1) != v7;
  return v11 != v9 || v10;
}

uint64_t sub_217B6E198@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_217BD8630();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v9);
  uint64_t v5 = sub_217BD8640();
  swift_release();
  uint64_t v6 = *(void *)(a1 + 232);
  sub_217BD8610();
  MEMORY[0x21D4575E0](&v9, v4);
  uint64_t v7 = sub_217BD8640();
  uint64_t result = swift_release();
  *a2 = v5;
  a2[1] = v6;
  a2[2] = 0;
  a2[3] = 0;
  a2[4] = v7;
  a2[5] = 0x4014000000000000;
  a2[6] = 0;
  a2[7] = 0;
  return result;
}

void sub_217B6E2BC()
{
  if ((*(unsigned char *)(v0 + 256) & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D8);
    sub_217BD8760();
    sub_217B80040(-1.0, -1.0, 1.0, 1.0);
    double v2 = v1;
    double v4 = v3;
    uint64_t v5 = sub_217BD8760();
    MEMORY[0x21D457AA0](v5, v6, v7, v2, v4);
  }
}

uint64_t sub_217B6E388@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>)
{
  uint64_t v26 = a1;
  uint64_t v6 = sub_217BD8280();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE300);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE308);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  double v13 = (char *)&v27[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v27, v3, 0x140uLL);
  double v14 = (v27[24] - v27[25]) / v27[24];
  double v15 = v14 * a2 - v27[28];
  double v16 = v14 * a3 - v27[28];
  if (v15 >= 0.0) {
    double v17 = v15;
  }
  else {
    double v17 = 0.0;
  }
  if (v16 >= 0.0) {
    double v18 = v16;
  }
  else {
    double v18 = 0.0;
  }
  v28.origin.CGFloat x = 0.0;
  v28.origin.CGFloat y = 0.0;
  v28.size.CGFloat width = a2;
  v28.size.CGFloat height = a3;
  CGRect v29 = CGRectInset(v28, v17, v18);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  sub_217BD7F90();
  sub_217BD82B0();
  sub_217BD7C90();
  uint64_t v23 = swift_allocObject();
  memcpy((void *)(v23 + 16), v27, 0x140uLL);
  *(CGFloat *)(v23 + 336) = a2;
  *(CGFloat *)(v23 + 344) = a3;
  *(CGFloat *)(v23 + 352) = x;
  *(CGFloat *)(v23 + 360) = y;
  *(CGFloat *)(v23 + 368) = width;
  *(CGFloat *)(v23 + 376) = height;
  sub_217B6F698((uint64_t)v27);
  sub_217B78CE4((uint64_t)&unk_267BAE310);
  sub_217B76D3C();
  sub_217BD8810();
  swift_release();
  sub_217B78AE8((uint64_t)v9, &qword_267BAE300);
  uint64_t v24 = swift_allocObject();
  memcpy((void *)(v24 + 16), v27, 0x140uLL);
  sub_217B6F698((uint64_t)v27);
  sub_217B78CE4((uint64_t)&unk_267BAE330);
  sub_217BD8800();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

BOOL sub_217B6E704(double *a1, double *a2, _OWORD *a3)
{
  double v4 = *a1;
  double v5 = a1[1];
  double v6 = *a2;
  double v7 = a2[1];
  v10[0] = a3[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E8);
  sub_217BD8760();
  if (v11 == 1)
  {
    memcpy(v10, a3, sizeof(v10));
    return sub_217B6E7AC(v4, v5, v6, v7);
  }
  else
  {
    return 0;
  }
}

BOOL sub_217B6E7AC(double a1, double a2, double a3, double a4)
{
  if (a1 == a3 && a2 == a4) {
    return 0;
  }
  double v6 = (v4[17] + v4[15]) * 0.5;
  if (a1 == a3) {
    goto LABEL_6;
  }
  double v8 = (v4[16] + v4[14]) * 0.5;
  if (a1 < a3)
  {
    if (v8 > a1)
    {
      BOOL v9 = v8 <= a3;
      goto LABEL_17;
    }
LABEL_6:
    if (a2 != a4)
    {
      if (a2 >= a4)
      {
        if (v6 >= a4) {
          return v6 < a2;
        }
      }
      else if (v6 > a2)
      {
        return v6 <= a4;
      }
    }
    return 0;
  }
  if (v8 < a3) {
    goto LABEL_6;
  }
  BOOL v9 = v8 < a1;
LABEL_17:
  if (a2 == a4) {
    return v9;
  }
  if (a2 >= a4)
  {
    if (v6 < a4) {
      return v9;
    }
    BOOL result = v6 < a2;
    if (v9) {
      return 1;
    }
  }
  else
  {
    if (v6 <= a2) {
      return v9;
    }
    BOOL result = v6 <= a4;
    if (v9) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_217B6E898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v123 = a2;
  uint64_t v3 = sub_217BD8980();
  uint64_t v121 = *(void *)(v3 - 8);
  uint64_t v122 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  double v120 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4E0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v118 = (uint64_t)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_217BD85D0();
  uint64_t v110 = *(void *)(v111 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  double v109 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_217BD7FD0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v114 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4E8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v115 = (uint64_t)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4F0);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v119 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v117 = (uint64_t)&v92 - v11;
  uint64_t v104 = sub_217BD86C0();
  uint64_t v103 = *(void (***)(char *, uint64_t))(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v102 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE4F8);
  MEMORY[0x270FA5388](v105);
  double v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE500);
  MEMORY[0x270FA5388](v106);
  int v100 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE508);
  MEMORY[0x270FA5388](v16);
  double v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_217BD88D0();
  id v101 = *(id *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  double v21 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE510);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  double v25 = (char *)&v92 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v92 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE518);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v108 = (uint64_t)&v92 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  double v32 = (void (**)(char *, uint64_t))((char *)&v92 - v31);
  uint64_t v33 = a1;
  uint64_t v34 = *(void *)(a1 + 168);
  if (v34)
  {
    uint64_t v35 = v33;
    uint64_t v36 = *(void *)(v33 + 160);
    uint64_t v37 = self;
    swift_bridgeObjectRetain();
    id v38 = objc_msgSend(v37, sel_pe_bundle);
    sub_217BD86A0();
    uint64_t v39 = v103;
    uint64_t v40 = v102;
    uint64_t v41 = v104;
    ((void (*)(char *, void, uint64_t))v103[13])(v102, *MEMORY[0x263F1B4B8], v104);
    uint64_t v42 = sub_217BD86E0();
    swift_release();
    v39[1](v40, v41);
    uint64_t v43 = *(void *)(v35 + 312);
    *(void *)double v14 = v42;
    *((_WORD *)v14 + 4) = 0;
    *((void *)v14 + 2) = 0;
    *((_WORD *)v14 + 12) = 257;
    *((void *)v14 + 4) = v43;
    *((void *)v14 + 5) = v36;
    *((void *)v14 + 6) = v34;
    *((void *)v14 + 7) = 0x3FF0000000000000;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE530);
    sub_217B77614();
    sub_217B78CE4((uint64_t)&unk_267BAE560);
    sub_217BD8260();
  }
  else
  {
    double v95 = v14;
    double v96 = v18;
    uint64_t v98 = (uint64_t *)v25;
    uint64_t v104 = (uint64_t)v21;
    uint64_t v97 = v16;
    uint64_t v102 = (char *)v19;
    int v99 = v27;
    uint64_t v103 = (void (**)(char *, uint64_t))((char *)&v92 - v31);
    uint64_t v44 = v33;
    uint64_t v45 = *(void **)(v33 + 144);
    sub_217B78B3C(v33 + 152, (uint64_t)&v127, &qword_267BAE520);
    sub_217B78B3C((uint64_t)&v127, (uint64_t)&v128, &qword_267BAE520);
    uint64_t v46 = v128;
    double v94 = v45;
    if (v128)
    {
      id v47 = v45;
      sub_217B76CF4(&v127);
      uint64_t v48 = MEMORY[0x21D4574A0](v46);
    }
    else
    {
      id v47 = v45;
      uint64_t v48 = sub_217BD85F0();
    }
    uint64_t v93 = v48;
    double v49 = (void (**)(void, void, char *))v101;
    uint64_t v50 = v104;
    double v51 = v98;
    uint64_t v52 = (uint64_t)v100;
    uint64_t v104 = v44;
    uint64_t v53 = *(void *)(v44 + 312);
    id v101 = v47;
    swift_retain();
    uint64_t v54 = sub_217BD8620();
    sub_217BD88C0();
    char v55 = sub_217BD8380();
    uint64_t v56 = (uint64_t)v96;
    uint64_t v57 = v102;
    ((void (**)(char *, uint64_t, char *))v49)[2](v96, v50, v102);
    *(unsigned char *)(v56 + *(int *)(v97 + 36)) = v55;
    sub_217B78A98(v56, (uint64_t)v51 + *(int *)(v22 + 36), &qword_267BAE508);
    *double v51 = v54;
    swift_retain();
    sub_217B78AE8(v56, &qword_267BAE508);
    ((void (*)(uint64_t, char *))v49[1])(v50, v57);
    swift_release();
    uint64_t v58 = (uint64_t)v99;
    sub_217B78B3C((uint64_t)v51, (uint64_t)v99, &qword_267BAE510);
    sub_217B78A98(v58, (uint64_t)v51, &qword_267BAE510);
    CGFloat v59 = v94;
    uint64_t v60 = v93;
    *(void *)uint64_t v52 = v94;
    *(void *)(v52 + 8) = v60;
    *(unsigned char *)(v52 + 16) = 1;
    *(void *)(v52 + 24) = 0;
    *(_WORD *)(v52 + 32) = 257;
    *(void *)(v52 + 40) = 0x4000000000000000;
    *(void *)(v52 + 48) = v53;
    *(void *)(v52 + 56) = v59;
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE528);
    sub_217B78A98((uint64_t)v51, v52 + *(int *)(v61 + 48), &qword_267BAE510);
    *(void *)(v52 + *(int *)(v61 + 64)) = 0x3FF0000000000000;
    id v62 = v101;
    swift_retain_n();
    swift_retain_n();
    id v63 = v62;
    sub_217B78AE8((uint64_t)v51, &qword_267BAE510);
    swift_release();
    swift_release();

    sub_217B78A98(v52, (uint64_t)v95, &qword_267BAE500);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE530);
    sub_217B77614();
    sub_217B78CE4((uint64_t)&unk_267BAE560);
    double v32 = v103;
    sub_217BD8260();
    sub_217B78AE8(v52, &qword_267BAE500);
    sub_217B78AE8((uint64_t)v99, &qword_267BAE510);
    uint64_t v35 = v104;
    swift_release();
    swift_release();
  }
  uint64_t v64 = *(void *)(v35 + 208);
  double v65 = v114;
  double v66 = &v114[*(int *)(v107 + 20)];
  uint64_t v67 = *MEMORY[0x263F19860];
  uint64_t v68 = sub_217BD81C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v68 - 8) + 104))(v66, v67, v68);
  *double v65 = v64;
  v65[1] = v64;
  double v69 = v109;
  (*(void (**)(char *, void, uint64_t))(v110 + 104))(v109, *MEMORY[0x263F1B388], v111);
  uint64_t v70 = MEMORY[0x21D457480](v69, 0.38, 0.38, 0.38, 1.0);
  sub_217BD7D00();
  double v71 = (void (*)(void))MEMORY[0x263F19048];
  uint64_t v72 = v115;
  sub_217B77568((uint64_t)v65, v115, MEMORY[0x263F19048]);
  double v73 = *(double *)&v124 * 0.5;
  uint64_t v74 = v118;
  sub_217B77568((uint64_t)v65, v118, v71);
  *(double *)(v74 + *(int *)(sub_217BD7FC0() + 20)) = v73;
  uint64_t v75 = v74 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE568) + 36);
  long long v76 = v125;
  *(_OWORD *)uint64_t v75 = v124;
  *(_OWORD *)(v75 + 16) = v76;
  *(void *)(v75 + 32) = v126;
  uint64_t v77 = v116;
  *(void *)(v74 + *(int *)(v116 + 52)) = v70;
  *(_WORD *)(v74 + *(int *)(v77 + 56)) = 256;
  uint64_t v78 = sub_217BD88E0();
  uint64_t v80 = v79;
  uint64_t v81 = v72 + *(int *)(v112 + 68);
  double v82 = (uint64_t *)(v81 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE570) + 36));
  *double v82 = v78;
  v82[1] = v80;
  sub_217B78B3C(v74, v81, &qword_267BAE4E0);
  sub_217B775BC((uint64_t)v65, v71);
  uint64_t v84 = v120;
  uint64_t v83 = v121;
  uint64_t v85 = v122;
  (*(void (**)(char *, void, uint64_t))(v121 + 104))(v120, *MEMORY[0x263F1B9B0], v122);
  uint64_t v86 = (uint64_t)v119;
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(&v119[*(int *)(v113 + 36)], v84, v85);
  sub_217B78A98(v72, v86, &qword_267BAE4E8);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v85);
  sub_217B78AE8(v72, &qword_267BAE4E8);
  uint64_t v87 = v117;
  sub_217B78B3C(v86, v117, &qword_267BAE4F0);
  uint64_t v88 = v108;
  sub_217B78A98((uint64_t)v32, v108, &qword_267BAE518);
  sub_217B78A98(v87, v86, &qword_267BAE4F0);
  uint64_t v89 = v123;
  sub_217B78A98(v88, v123, &qword_267BAE518);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE578);
  sub_217B78A98(v86, v89 + *(int *)(v90 + 48), &qword_267BAE4F0);
  sub_217B78AE8(v87, &qword_267BAE4F0);
  sub_217B78AE8((uint64_t)v32, &qword_267BAE518);
  sub_217B78AE8(v86, &qword_267BAE4F0);
  return sub_217B78AE8(v88, &qword_267BAE518);
}

uint64_t sub_217B6F640()
{
  return sub_217BD8940();
}

uint64_t sub_217B6F698(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 144);
  double v2 = *(void **)(a1 + 152);
  id v4 = *(id *)(a1 + 176);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v5 = v3;
  id v6 = v2;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_217B6F754(void *a1)
{
  double v2 = (void *)a1[18];
  uint64_t v3 = (void *)a1[19];
  id v5 = (void *)a1[22];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_217B6F850()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B6F86C(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  uint64_t v72 = a1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE320);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_217BD7CC0();
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  id v63 = (char *)v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_217BD8A50();
  uint64_t v71 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  double v69 = (char *)v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_217BD8A80();
  uint64_t v68 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v67 = (char *)v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_217BD8AA0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v58 - v27;
  long long aBlock = *(_OWORD *)(a2 + 32);
  LOBYTE(v74) = *(unsigned char *)(a2 + 48);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v78, v29);
  double v65 = (double *)a2;
  if ((v78 & 1) == 0)
  {
    uint64_t v61 = v19;
    uint64_t v30 = sub_217B6F640();
    id v62 = v17;
    uint64_t v60 = v22;
    MEMORY[0x270FA5388](v30);
    v58[-2] = a2;
    sub_217BD7E50();
    v58[1] = 0;
    swift_release();
    uint64_t v17 = v62;
    sub_217B76E44();
    v58[0] = sub_217BD8C40();
    sub_217BD8A90();
    MEMORY[0x21D4578D0](v26, 0.2);
    CGFloat v59 = *(void (**)(char *, uint64_t))(v23 + 8);
    v59(v26, v22);
    uint64_t v31 = swift_allocObject();
    memcpy((void *)(v31 + 16), (const void *)a2, 0x140uLL);
    long long v76 = sub_217B76F1C;
    uint64_t v77 = v31;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v74 = sub_217B9E748;
    uint64_t v75 = &block_descriptor;
    double v32 = _Block_copy(&aBlock);
    sub_217B6F698(a2);
    swift_release();
    uint64_t v33 = v67;
    sub_217BD8A70();
    *(void *)&long long aBlock = MEMORY[0x263F8EE78];
    sub_217B71128((uint64_t)&unk_267BAE340);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE348);
    sub_217B78CE4((uint64_t)&unk_267BAE350);
    uint64_t v34 = v69;
    uint64_t v35 = v61;
    sub_217BD8CD0();
    uint64_t v36 = (void *)v58[0];
    MEMORY[0x21D457A50](v28, v33, v34, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v71 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v33, v70);
    v59(v28, v60);
  }
  sub_217B78A98(v72, (uint64_t)v17, &qword_267BAE320);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v40 = &qword_267BAE320;
    uint64_t v41 = (uint64_t)v17;
    return sub_217B78AE8(v41, v40);
  }
  char v37 = *v17;
  uint64_t v38 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE358) + 48);
  uint64_t v39 = &v17[v38];
  if ((v37 & 1) == 0 || __swift_getEnumTagSinglePayload((uint64_t)&v17[v38], 1, v66) == 1)
  {
    uint64_t v40 = (uint64_t *)&unk_267BAE360;
    uint64_t v41 = (uint64_t)v39;
    return sub_217B78AE8(v41, v40);
  }
  uint64_t v43 = v64;
  uint64_t v44 = v63;
  uint64_t v45 = v66;
  (*(void (**)(char *, unsigned char *, uint64_t))(v64 + 32))(v63, v39, v66);
  sub_217BD7CB0();
  sub_217B7FFBC(0.0, 0.0, a3, a4);
  sub_217B80D44(-1.0, -1.0, 2.0, 2.0);
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  sub_217BD7CB0();
  sub_217B7FFBC(a5, a6, a7, a8);
  uint64_t v50 = v65;
  double v51 = v65[15];
  double v52 = v65[17];
  sub_217B80D44(v65[14], v51, v65[16] - v65[14], v52 - v51);
  uint64_t v54 = v53;
  double v56 = v51 + v52 - v55;
  uint64_t v57 = sub_217BD8910();
  MEMORY[0x270FA5388](v57);
  v58[-6] = v50;
  v58[-5] = v54;
  *(double *)&v58[-4] = v56;
  v58[-3] = v47;
  v58[-2] = v49;
  sub_217BD7E50();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v44, v45);
}

uint64_t sub_217B7005C()
{
  return sub_217BD87D0();
}

void *sub_217B700BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E8);
  uint64_t result = (void *)sub_217BD8760();
  if ((v2 & 1) == 0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
    uint64_t result = MEMORY[0x21D4575E0](&v2, v1);
    if (v2 == 1)
    {
      LOBYTE(v2) = 1;
      return (void *)sub_217BD8770();
    }
  }
  return result;
}

uint64_t sub_217B70170(double *a1)
{
  return sub_217BD8770();
}

uint64_t sub_217B70240(uint64_t a1, uint64_t a2)
{
  __dst[0] = *(_OWORD *)(a2 + 80);
  v7[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1E8);
  sub_217BD8770();
  memcpy(__dst, (const void *)(a2 + 184), sizeof(__dst));
  sub_217B76DF4(&__dst[5], (uint64_t)&v6);
  sub_217B76DF4(&v6, (uint64_t)v7);
  if (v8 < 0) {
    v8 &= ~0x8000u;
  }
  uint64_t v3 = sub_217B6D7CC();
  MEMORY[0x270FA5388](v3);
  sub_217BD7E50();
  return swift_release();
}

void *sub_217B70354(void *a1)
{
  return sub_217B6F754(a1);
}

uint64_t destroy for PhotoStyleDPad(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  __int16 v8 = *(void **)(a2 + 144);
  uint64_t v7 = *(void **)(a2 + 152);
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  double v14 = *(void **)(a2 + 176);
  *(void *)(a1 + 176) = v14;
  memcpy((void *)(a1 + 184), (const void *)(a2 + 184), 0x80uLL);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v10 = v8;
  id v11 = v7;
  swift_bridgeObjectRetain();
  id v12 = v14;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v4 = *(void **)(a1 + 144);
  uint64_t v5 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v5;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 152);
  __int16 v8 = *(void **)(a2 + 152);
  *(void *)(a1 + 152) = v8;
  id v9 = v8;

  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a1 + 176);
  id v11 = *(void **)(a2 + 176);
  *(void *)(a1 + 176) = v11;
  id v12 = v11;

  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  long long v13 = *(_OWORD *)(a2 + 264);
  *(_WORD *)(a1 + 280) = *(_WORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = v13;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy320_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x140uLL);
}

uint64_t assignWithTake for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);

  uint64_t v5 = *(void **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);

  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 176);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);

  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  long long v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  long long v8 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v8;
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(_WORD *)(a1 + 280) = *(_WORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 320))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 320) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 320) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad()
{
}

void *__swift_memcpy128_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.Configuration(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3FFF && *(unsigned char *)(a1 + 128))
    {
      unsigned int v2 = *(_DWORD *)a1 + 16382;
    }
    else
    {
      unsigned int v2 = (*(_WORD *)(a1 + 96) & 0xFE | (*(unsigned __int16 *)(a1 + 96) >> 15) | (*(unsigned __int16 *)(a1 + 96) >> 1) & 0x3F00) ^ 0x3FFF;
      if (v2 >= 0x3FFE) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x3FFF;
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(void *)(result + 80) = 0;
      *(void *)(result + 88) = 0;
      *(_WORD *)(result + 96) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.Configuration()
{
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3FFF && *(unsigned char *)(a1 + 18))
    {
      unsigned int v2 = *(_DWORD *)a1 + 16382;
    }
    else
    {
      unsigned int v2 = (*(_WORD *)(a1 + 16) & 0xFE | (*(unsigned __int16 *)(a1 + 16) >> 15) | (*(unsigned __int16 *)(a1 + 16) >> 1) & 0x3F00) ^ 0x3FFF;
      if (v2 >= 0x3FFE) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x3FFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(_WORD *)(result + 16) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_217B70BD8(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 16) >> 15;
}

uint64_t sub_217B70BE4(uint64_t result)
{
  *(_WORD *)(result + 16) &= ~0x8000u;
  return result;
}

uint64_t sub_217B70BF4(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 16) = *(_WORD *)(result + 16) & 0x101 | (a2 << 15);
  return result;
}

void type metadata accessor for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle()
{
}

unint64_t sub_217B70C18()
{
  unint64_t result = qword_267BADF30;
  if (!qword_267BADF30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF20);
    sub_217B70D00();
    sub_217B78CE4((uint64_t)&unk_267BADFB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BADF30);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_217B70D00()
{
  unint64_t result = qword_267BADF38;
  if (!qword_267BADF38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF18);
    sub_217B7883C((uint64_t)&unk_267BADF40);
    sub_217B71128((uint64_t)&unk_267BADFA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BADF38);
  }
  return result;
}

unint64_t sub_217B70DE4()
{
  unint64_t result = qword_267BADF48;
  if (!qword_267BADF48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF50);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF60);
    type metadata accessor for CGPoint(255);
    sub_217B78CE4((uint64_t)&unk_267BADF68);
    sub_217B71128((uint64_t)&unk_267BADF70);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_217B78940((uint64_t)&unk_267BADF78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BADF48);
  }
  return result;
}

unint64_t sub_217B70F84()
{
  return sub_217B78940((uint64_t)&unk_267BADF88);
}

unint64_t sub_217B70FB4()
{
  unint64_t result = qword_267BADF98;
  if (!qword_267BADF98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADFA0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BADF60);
    type metadata accessor for CGPoint(255);
    sub_217B78CE4((uint64_t)&unk_267BADF68);
    sub_217B71128((uint64_t)&unk_267BADF70);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BADF98);
  }
  return result;
}

unint64_t sub_217B71128(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_9(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_217B71178(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217B71198(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_217B711E4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217B71204(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for PISemanticStyleCast(uint64_t a1)
{
}

uint64_t sub_217B71254()
{
  return swift_release();
}

uint64_t sub_217B7125C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_retain();
  return a1;
}

uint64_t sub_217B712A4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_217B71320(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t sub_217B71378(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B713B8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.ValueIndicator()
{
}

uint64_t _s12PhotosUIEdit14PhotoStyleDPadV13ConfigurationVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_217B71458(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[57])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B71494(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.DottedGrid()
{
}

uint64_t sub_217B714F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_217B714FC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_217B7159C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + 7;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v6 + ((v5 + 8) & ~v5)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v9 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v10 = ((unint64_t)a1 + v5 + 8) & ~v5;
    uint64_t v11 = ((unint64_t)a2 + v5 + 8) & ~v5;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v10, v11);
    *(void *)((v6 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v6 + v11) & 0xFFFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_217B716BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

void *sub_217B716F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 16;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v7, v8);
  *(void *)((*(void *)(v5 + 48) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_217B71798(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 24;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 24))(v7, v8);
  *(void *)((*(void *)(v5 + 40) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_217B71838(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_217B718D8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 40;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v7, v8);
  *(void *)((*(void *)(v5 + 24) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_217B71978(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (!a2) {
    return 0;
  }
  if (v6 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 8) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    int v9 = a2 - v6;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x217B71A9CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v6 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v6) {
    return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 8) & ~v7, v6, v4);
  }
  else {
    return 0;
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_217B71AD8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v11 = ((*(void *)(v7 + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    int v12 = a3 - v9;
    if (((*(_DWORD *)(v7 + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (v11) {
      int v16 = 1;
    }
    else {
      int v16 = a2 - v9;
    }
    if (v11)
    {
      int v17 = ~v9 + a2;
      bzero(a1, ((*(void *)(v8 + 64) + ((v10 + 8) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x217B71C90);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        unint64_t v18 = (unint64_t)&a1[v10 + 8] & ~v10;
        __swift_storeEnumTagSinglePayload(v18, a2, v9, v6);
      }
      return;
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for PhotoStyleDPad.SpiderGrid()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for PhotoStyleDPad.CompositeGradient()
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

uint64_t sub_217B71D1C(id *a1)
{
  return swift_release();
}

uint64_t sub_217B71D58(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t sub_217B71D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_217B71E10(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t sub_217B71E58(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 17))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B71E98(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.BackdropImage()
{
}

uint64_t sub_217B71EE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B71F00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *((void *)v1 + 2);
  swift_retain_n();
  double v4 = 1.0;
  sub_217BD7D00();
  uint64_t v5 = sub_217BD88E0();
  uint64_t v17 = v6;
  uint64_t v18 = v5;
  double v7 = *((double *)v1 + 3);
  int v8 = v1[32];
  sub_217BD88E0();
  sub_217BD7D50();
  int v9 = *v1;
  sub_217BD89D0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  if (v9 == 1)
  {
    sub_217BD8970();
    uint64_t v14 = sub_217BD8900();
    uint64_t result = swift_release();
    double v4 = 1.5;
  }
  else
  {
    uint64_t result = sub_217B6D7CC();
    uint64_t v14 = result;
  }
  double v16 = 0.0;
  if (!v8) {
    double v16 = v7;
  }
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = v20;
  *(void *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v23;
  *(void *)(a1 + 40) = v3;
  *(_WORD *)(a1 + 48) = 256;
  *(void *)(a1 + 56) = v3;
  *(_WORD *)(a1 + 64) = 256;
  *(void *)(a1 + 72) = v18;
  *(void *)(a1 + 80) = v17;
  *(double *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v24;
  *(unsigned char *)(a1 + 104) = v25;
  *(void *)(a1 + 112) = v26;
  *(unsigned char *)(a1 + 120) = v27;
  *(void *)(a1 + 128) = v28;
  *(void *)(a1 + 136) = v29;
  *(double *)(a1 + 144) = v4;
  *(double *)(a1 + 152) = v4;
  *(void *)(a1 + 160) = v11;
  *(void *)(a1 + 168) = v13;
  *(void *)(a1 + 176) = v14;
  *(unsigned char *)(a1 + 184) = v9;
  return result;
}

void *sub_217B720FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_217BD88E0();
  uint64_t v4 = v3;
  sub_217B72154((uint64_t)v6);
  *a1 = v2;
  a1[1] = v4;
  return memcpy(a1 + 2, v6, 0x80uLL);
}

double sub_217B72154@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217BD85D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE180);
  uint64_t v6 = swift_allocObject();
  long long v24 = xmmword_217BDCBD0;
  *(_OWORD *)(v6 + 16) = xmmword_217BDCBD0;
  uint64_t v7 = *MEMORY[0x263F1B388];
  int v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, v7, v2);
  MEMORY[0x21D457480](v5, 0.86, 0.86, 0.86, 1.0);
  *(void *)(v6 + 32) = sub_217BD8870();
  *(void *)(v6 + 40) = v9;
  sub_217BD8620();
  *(void *)(v6 + 48) = sub_217BD8870();
  *(void *)(v6 + 56) = v10;
  MEMORY[0x21D4576A0](v6);
  sub_217BD7E70();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v24;
  v8(v5, v7, v2);
  MEMORY[0x21D457480](v5, 0.93, 0.93, 0.93, 1.0);
  *(void *)(v11 + 32) = sub_217BD8870();
  *(void *)(v11 + 40) = v12;
  sub_217BD8620();
  *(void *)(v11 + 48) = sub_217BD8870();
  *(void *)(v11 + 56) = v13;
  MEMORY[0x21D4576A0](v11);
  sub_217BD7E70();
  uint64_t v14 = v28;
  long long v23 = v29;
  uint64_t v15 = v30;
  uint64_t v16 = v31;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v24;
  sub_217BD8620();
  *(void *)(v17 + 32) = sub_217BD8870();
  *(void *)(v17 + 40) = v18;
  v8(v5, v7, v2);
  MEMORY[0x21D457480](v5, 0.07, 0.07, 0.07, 1.0);
  *(void *)(v17 + 48) = sub_217BD8870();
  *(void *)(v17 + 56) = v19;
  MEMORY[0x21D4576A0](v17);
  sub_217BD89B0();
  sub_217BD89C0();
  sub_217BD7E70();
  uint64_t v20 = v32;
  *(void *)a1 = v25;
  *(_OWORD *)(a1 + 8) = v26;
  *(_OWORD *)(a1 + 24) = v27;
  *(void *)(a1 + 40) = v14;
  *(_OWORD *)(a1 + 48) = v23;
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v16;
  *(void *)(a1 + 80) = 0x3FE3333333333333;
  *(void *)(a1 + 88) = v20;
  double result = *(double *)&v33;
  long long v22 = v34;
  *(_OWORD *)(a1 + 96) = v33;
  *(_OWORD *)(a1 + 112) = v22;
  return result;
}

uint64_t sub_217B72498(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE140);
  uint64_t v5 = a1 + 16;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v5 + 8);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_217BD7D10();
  sub_217BD7EF0();
  uint64_t v22 = v4;
  uint64_t v23 = MEMORY[0x263F1B440];
  uint64_t v24 = MEMORY[0x263F1BA08];
  uint64_t v25 = v3;
  uint64_t v26 = MEMORY[0x263F1B420];
  uint64_t v27 = MEMORY[0x263F1BA00];
  sub_217BD8290();
  sub_217BD7FE0();
  sub_217BD7EF0();
  swift_getTupleTypeMetadata2();
  sub_217BD8990();
  swift_getWitnessTable();
  uint64_t v6 = sub_217BD87B0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v18[-v13];
  uint64_t v19 = v4;
  uint64_t v20 = v3;
  uint64_t v21 = v1;
  sub_217BD88E0();
  sub_217BD87A0();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_217B81604(v12, v6, WitnessTable);
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v16(v12, v6);
  sub_217B81604(v14, v6, WitnessTable);
  return ((uint64_t (*)(unsigned char *, uint64_t))v16)(v14, v6);
}

uint64_t sub_217B7271C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v79 = a4;
  uint64_t v74 = sub_217BD85D0();
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v71 = (char *)v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91[0] = a2;
  v91[1] = MEMORY[0x263F1B440];
  v91[2] = MEMORY[0x263F1BA08];
  v91[3] = a3;
  v91[4] = MEMORY[0x263F1B420];
  v91[5] = MEMORY[0x263F1BA00];
  uint64_t v73 = sub_217BD8290();
  uint64_t v78 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v70 = (char *)v57 - v7;
  sub_217BD7FE0();
  uint64_t v8 = sub_217BD7EF0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v76 = v8;
  uint64_t v77 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  double v69 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v75 = (char *)v57 - v12;
  uint64_t v13 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v68 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v64 = (char *)v57 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_217BD8980();
  uint64_t v19 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v21 = (char *)v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE140);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = a3;
  uint64_t v58 = AssociatedTypeWitness;
  uint64_t v59 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v60 = sub_217BD7D10();
  uint64_t v83 = sub_217BD7EF0();
  uint64_t v61 = *(void *)(v83 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)v57 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v85 = (char *)v57 - v27;
  uint64_t v28 = v84;
  uint64_t v29 = v13;
  sub_217B73090(v84, (uint64_t)v90);
  memcpy(v91, v90, 0xE0uLL);
  unsigned int v67 = *MEMORY[0x263F1B9B0];
  uint64_t v30 = *(void (**)(void))(v19 + 104);
  uint64_t v65 = v19 + 104;
  uint64_t v66 = (void (*)(char *, void, uint64_t))v30;
  uint64_t v31 = v82;
  v30(v21);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v18, v21, v31);
  uint64_t v32 = (void (*)(void))MEMORY[0x263F190D8];
  sub_217B77568((uint64_t)v18, (uint64_t)&v24[*(int *)(v22 + 36)], MEMORY[0x263F190D8]);
  memcpy(v24, v91, 0xE0uLL);
  sub_217B76860(v91);
  sub_217B775BC((uint64_t)v18, v32);
  long long v33 = *(void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v62 = v19 + 8;
  id v63 = v33;
  v33(v21, v31);
  sub_217B76974(v90);
  v57[1] = v29;
  v57[2] = (char *)v28 + *(int *)(type metadata accessor for PhotoStyleDPad.SpiderGrid() + 36);
  long long v34 = v64;
  sub_217BD7EA0();
  unint64_t v35 = sub_217B78940((uint64_t)&unk_267BAE148);
  uint64_t v36 = v81;
  uint64_t v37 = v58;
  sub_217BD85B0();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v34, v37);
  sub_217B78AE8((uint64_t)v24, &qword_267BAE140);
  uint64_t WitnessTable = swift_getWitnessTable();
  v89[4] = v35;
  v89[5] = WitnessTable;
  uint64_t v59 = MEMORY[0x263F18E48];
  uint64_t v39 = v83;
  uint64_t v60 = swift_getWitnessTable();
  sub_217B81604(v36, v39, v60);
  uint64_t v40 = v61;
  uint64_t v64 = *(char **)(v61 + 8);
  uint64_t v68 = v61 + 8;
  ((void (*)(char *, uint64_t))v64)(v36, v39);
  uint64_t v41 = v71;
  (*(void (**)(char *, void, uint64_t))(v72 + 104))(v71, *MEMORY[0x263F1B388], v74);
  v89[0] = MEMORY[0x21D457480](v41, 0.38, 0.38, 0.38, 1.0);
  sub_217B819A4();
  uint64_t v42 = v70;
  sub_217B819AC();
  swift_release();
  uint64_t v43 = v82;
  v66(v21, v67, v82);
  uint64_t v44 = v73;
  uint64_t v45 = swift_getWitnessTable();
  uint64_t v46 = v69;
  sub_217BD85A0();
  v63(v21, v43);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v42, v44);
  v89[2] = v45;
  v89[3] = MEMORY[0x263F190D0];
  uint64_t v47 = v76;
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v49 = v75;
  sub_217B81604(v46, v47, v48);
  uint64_t v50 = v77;
  double v51 = *(void (**)(char *, uint64_t))(v77 + 8);
  v51(v46, v47);
  double v52 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  uint64_t v53 = v81;
  uint64_t v54 = v83;
  v52(v81, v85, v83);
  v89[0] = v53;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v46, v49, v47);
  v89[1] = v46;
  v88[0] = v54;
  v88[1] = v47;
  uint64_t v86 = v60;
  uint64_t v87 = v48;
  sub_217B6BF14((uint64_t)v89, 2, (uint64_t)v88);
  v51(v49, v47);
  double v55 = (uint64_t (*)(char *, uint64_t))v64;
  ((void (*)(char *, uint64_t))v64)(v85, v54);
  v51(v46, v47);
  return v55(v53, v54);
}

uint64_t sub_217B73090@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_217BD85D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  uint64_t v9 = *(void (**)(void))(v5 + 104);
  LODWORD(v43) = *MEMORY[0x263F1B388];
  uint64_t v42 = (void (*)(char *, void, uint64_t))v9;
  v9(v7);
  uint64_t v47 = sub_217BD8670();
  sub_217BD7D00();
  uint64_t v10 = v51;
  uint64_t v11 = v52;
  uint64_t v12 = v53;
  uint64_t v45 = v54;
  uint64_t v13 = v55;
  uint64_t v37 = sub_217BD88E0();
  uint64_t v36 = v14;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v41 = 0;
  uint64_t v17 = 0;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v46 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v8;
  if ((v8 & 1) == 0)
  {
    v42(v7, v43, v4);
    uint64_t v46 = MEMORY[0x21D457480](v7, 0.92, 0.92, 0.96, 1.0);
    sub_217BD7D00();
    uint64_t v16 = v56;
    uint64_t v41 = v57;
    uint64_t v17 = v58;
    uint64_t v40 = v59;
    uint64_t v39 = v60;
    uint64_t v19 = sub_217BD88E0();
    uint64_t v21 = 0x3FE75C28F5C28F5CLL;
    uint64_t v18 = 256;
    uint64_t v15 = 2;
  }
  uint64_t v34 = v21;
  uint64_t v35 = v19;
  uint64_t v44 = v20;
  uint64_t v22 = v15;
  uint64_t v33 = v15;
  uint64_t v23 = v18;
  v42(v7, v43, v4);
  MEMORY[0x21D457480](v7, 0.92, 0.92, 0.96, 1.0);
  uint64_t v43 = sub_217BD8640();
  swift_release();
  *(_DWORD *)(a2 + 9) = *(_DWORD *)v50;
  *(_DWORD *)(a2 + 12) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a2 + 66) = *(_DWORD *)&v48[7];
  *(_WORD *)(a2 + 70) = v49;
  *(_DWORD *)(a2 + 209) = *(_DWORD *)v48;
  *(_DWORD *)(a2 + 212) = *(_DWORD *)&v48[3];
  *(void *)a2 = v38;
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v45;
  *(void *)(a2 + 48) = v13;
  *(void *)(a2 + 56) = v47;
  *(_WORD *)(a2 + 64) = 256;
  uint64_t v24 = v36;
  *(void *)(a2 + 72) = v37;
  *(void *)(a2 + 80) = v24;
  *(void *)(a2 + 88) = 0x3FD3333333333333;
  *(void *)(a2 + 96) = v22;
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = v16;
  uint64_t v25 = v16;
  uint64_t v26 = v41;
  *(void *)(a2 + 120) = v41;
  *(void *)(a2 + 128) = v17;
  uint64_t v27 = v40;
  uint64_t v28 = v39;
  *(void *)(a2 + 136) = v40;
  *(void *)(a2 + 144) = v28;
  *(void *)(a2 + 152) = v46;
  *(void *)(a2 + 160) = v23;
  uint64_t v29 = v44;
  *(void *)(a2 + 168) = v35;
  *(void *)(a2 + 176) = v29;
  *(void *)(a2 + 184) = v34;
  *(void *)(a2 + 192) = &unk_26C81E1F0;
  *(void *)(a2 + 200) = v43;
  *(unsigned char *)(a2 + 208) = 1;
  *(void *)(a2 + 216) = 0x3FD5C28F5C28F5C3;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v30 = v33;
  sub_217B76930(v33, 0, v25, v26, v17, v27);
  sub_217B76A40(v30, 0, v25, v26, v17, v27);
  swift_release();
  return swift_bridgeObjectRelease();
}

BOOL sub_217B73518(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_217B73528()
{
  return sub_217BD8E00();
}

uint64_t sub_217B73550()
{
  return sub_217BD8E10();
}

BOOL sub_217B7359C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_217B73518(*a1, *a2);
}

uint64_t sub_217B735A8()
{
  return sub_217B73550();
}

uint64_t sub_217B735B0()
{
  return sub_217B73528();
}

uint64_t sub_217B735B8()
{
  return sub_217BD8E10();
}

__n128 sub_217B735FC@<Q0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v4;
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
  __n128 result = *(__n128 *)(v1 + 41);
  *(__n128 *)(v3 + 57) = result;
  *a1 = sub_217B763B8;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v3;
  return result;
}

uint64_t sub_217B7365C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE098);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_217BD88E0();
  *((void *)v8 + 1) = v9;
  *((void *)v8 + 2) = 0;
  v8[24] = 0;
  *((void *)v8 + 4) = 0;
  v8[40] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0A0);
  sub_217B73784(a2, a1);
  sub_217BD7DB0();
  double v11 = (double)*(uint64_t *)(a2 + 32);
  double v12 = v10 * -0.5 / v11;
  sub_217BD7DB0();
  double v14 = v13 * -0.5 / v11;
  sub_217B78A98((uint64_t)v8, a3, &qword_267BAE098);
  uint64_t v15 = (double *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0A8) + 36));
  *uint64_t v15 = v12;
  v15[1] = v14;
  return sub_217B78AE8((uint64_t)v8, &qword_267BAE098);
}

uint64_t sub_217B73784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217BD7DD0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9)
  {
    __break(1u);
  }
  else if ((v10 & 0x8000000000000000) == 0)
  {
    v14[0] = 0;
    v14[1] = v10;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
    unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 73) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    double v12 = (_OWORD *)swift_allocObject();
    long long v13 = *(_OWORD *)(a1 + 16);
    v12[1] = *(_OWORD *)a1;
    v12[2] = v13;
    v12[3] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v12 + 57) = *(_OWORD *)(a1 + 41);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))((char *)v12 + v11, (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0B0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0B8);
    sub_217B76490();
    sub_217B78CE4((uint64_t)&unk_267BAE0D0);
    return sub_217BD87F0();
  }
  __break(1u);
  return result;
}

uint64_t sub_217B73984@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *a1;
  *(void *)a4 = 0;
  *(unsigned char *)(a4 + 8) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0B8);
  return sub_217B739E8(a2, v6, a3);
}

uint64_t sub_217B739E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217BD7DD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    v16[0] = 0;
    v16[1] = v12;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
    unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v14 = swift_allocObject();
    long long v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v14 + 32) = v15;
    *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v14 + 57) = *(_OWORD *)(a1 + 41);
    *(void *)(v14 + 80) = a2;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0B0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0D8);
    sub_217B76490();
    sub_217B7662C();
    return sub_217BD87F0();
  }
  __break(1u);
  return result;
}

uint64_t sub_217B73BCC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, BOOL a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE130);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  BOOL v13 = sub_217B73EC4(a3, *a1);
  sub_217B73EF8();
  uint64_t v15 = v14;
  sub_217BD88E0();
  sub_217BD7D50();
  LOBYTE(v25) = v13;
  *((void *)&v25 + 1) = v15;
  *(void *)&long long v26 = v29;
  BYTE8(v26) = v30;
  *(void *)&long long v27 = v31;
  BYTE8(v27) = v32;
  long long v28 = v33;
  sub_217B6D7CC();
  uint64_t v22 = a2;
  BOOL v23 = a3;
  uint64_t v24 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0F0);
  sub_217B78940((uint64_t)&unk_267BAE0F8);
  sub_217B78940((uint64_t)&unk_267BAE108);
  sub_217BD8590();
  swift_release();
  sub_217BD7DB0();
  sub_217BD7DB0();
  sub_217BD88E0();
  sub_217BD7D50();
  uint64_t v16 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v21, v11, v8);
  uint64_t v17 = (_OWORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0D8) + 36));
  long long v18 = v26;
  *uint64_t v17 = v25;
  v17[1] = v18;
  v17[2] = v27;
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

BOOL sub_217B73EC4(BOOL result, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 32);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else if (v5)
  {
    uint64_t v6 = v5 / 2;
    return v6 == result && v6 == a2;
  }
  else
  {
    return 0;
  }
  return result;
}

void sub_217B73EF8()
{
  if (*(unsigned char *)(v0 + 1))
  {
    sub_217B78B3C(v0 + 8, (uint64_t)v2, &qword_267BAE138);
    sub_217B78B3C((uint64_t)v2, (uint64_t)&v3, &qword_267BAE138);
    if ((v4 & 1) == 0)
    {
      double v1 = (double)*(uint64_t *)(v0 + 32);
      sub_217B7FFBC(0.0, 0.0, v1, v1);
      sub_217B7FFBC(0.0, 0.0, v1, v1);
      if (*(double *)(v0 + 48) < 0.0) {
        __break(1u);
      }
    }
  }
}

uint64_t sub_217B74008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE118);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE0F0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = 1.0;
  if (*(unsigned char *)a2 == 1)
  {
    if (sub_217B74220(a3, a4)) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.0;
    }
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE128);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v12, a1, v17);
  *(double *)&v12[*(int *)(v10 + 36)] = v16;
  if ((*(unsigned char *)(a2 + 1) & 1) == 0)
  {
    if (*(unsigned char *)(a2 + 56) & 1) != 0 && (sub_217B74220(a3, a4)) {
      double v19 = 0.6;
    }
    else {
      double v19 = 0.0;
    }
LABEL_19:
    sub_217B78A98((uint64_t)v12, (uint64_t)v15, &qword_267BAE118);
    *(double *)&v15[*(int *)(v13 + 36)] = v19;
    sub_217B78AE8((uint64_t)v12, &qword_267BAE118);
    return sub_217B78B3C((uint64_t)v15, a5, &qword_267BAE0F0);
  }
  uint64_t v20 = *(void *)(a2 + 32);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (!v21)
  {
    BOOL v23 = v22 / 2 == a4 || v22 / 2 == a3;
    double v24 = 0.5;
    if (!v23) {
      double v24 = 0.0;
    }
    if (v22) {
      double v19 = v24;
    }
    else {
      double v19 = 0.0;
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_217B74220(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(v2 + 1) & 1) == 0)
  {
    sub_217B78B3C(v2 + 8, (uint64_t)v8, &qword_267BAE138);
    uint64_t result = sub_217B78B3C((uint64_t)v8, (uint64_t)v9, &qword_267BAE138);
    if ((v10 & 1) == 0)
    {
      double v6 = round(v9[0]);
      if ((~*(void *)&v6 & 0x7FF0000000000000) != 0)
      {
        if (v6 > -9.22337204e18)
        {
          if (v6 < 9.22337204e18)
          {
            if ((uint64_t)v6 == a2) {
              return 1;
            }
            double v7 = round(v9[1]);
            if ((~*(void *)&v7 & 0x7FF0000000000000) != 0)
            {
              if (v7 > -9.22337204e18)
              {
                if (v7 < 9.22337204e18) {
                  return (uint64_t)v7 == a1;
                }
                goto LABEL_19;
              }
LABEL_18:
              __break(1u);
LABEL_19:
              __break(1u);
              return result;
            }
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  return 0;
}

uint64_t sub_217B74330()
{
  return sub_217BD84E0();
}

uint64_t sub_217B74350@<X0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE658);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  sub_217B74544(a1, (uint64_t)v21);
  double v10 = 0.0;
  if (a3 >= 0.0) {
    double v10 = a3;
  }
  if (a3 > 1.0) {
    double v10 = 1.0;
  }
  char v19 = v23;
  v18[0] = v21[0];
  v18[1] = v21[1];
  v18[2] = v21[2];
  v18[3] = v21[3];
  v18[4] = v21[4];
  v18[5] = v21[5];
  *(void *)&v18[6] = v22;
  BYTE8(v18[6]) = v23;
  __asm { FMOV            V2.2D, #0.5 }
  v18[7] = vmlaq_n_f64((float64x2_t)xmmword_217BDCBE0, _Q2, v10);
  sub_217B746E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE660);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE668);
  sub_217B78940((uint64_t)&unk_267BAE670);
  sub_217B783B4();
  sub_217BD8590();
  swift_release();
  memcpy(v20, v18, sizeof(v20));
  sub_217B78454((uint64_t)v20);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a2, v3, v6);
}

double sub_217B74544@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  sub_217BD8630();
  if (a1)
  {
    sub_217BD8640();
    swift_release();
    sub_217BD7D00();
    sub_217BD88E0();
    sub_217BD89D0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE6B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE6D0);
  sub_217B78314();
  sub_217B78CE4((uint64_t)&unk_267BAE6C8);
  sub_217BD8260();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  *(_OWORD *)(a2 + 64) = v9;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = v11;
  *(unsigned char *)(a2 + 104) = v12;
  return result;
}

uint64_t sub_217B746E4()
{
  return sub_217BD8940();
}

uint64_t sub_217B7473C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v6 = sub_217B747E4(a2, a4);
  sub_217BD89D0();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE6E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a3, a1, v11);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE668);
  uint64_t v13 = (double *)(a3 + *(int *)(result + 36));
  *uint64_t v13 = v6;
  v13[1] = v6;
  *((void *)v13 + 2) = v8;
  *((void *)v13 + 3) = v10;
  return result;
}

double sub_217B747E4(int a1, double a2)
{
  double v2 = -0.1;
  if (a2 >= -0.1) {
    double v2 = a2;
  }
  if (a2 > 1.0) {
    double v2 = 1.0;
  }
  double v3 = v2 * 3.5 + 1.0;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  BOOL v4 = a2 > 0.0;
  double result = v3 * 0.5;
  if (v3 * 0.5 < 1.0) {
    double result = 1.0;
  }
  if ((v4 & a1) == 0) {
    return v3;
  }
  return result;
}

uint64_t sub_217B74838@<X0>(uint64_t a1@<X8>)
{
  return sub_217B74350(*(unsigned char *)v1, a1, *(double *)(v1 + 8));
}

double sub_217B74844@<D0>(uint64_t a1@<X8>)
{
  sub_217BD8410();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_217B748B0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7 = a6 + 1;
  if (__OFADD__(a6, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v7 < 0)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a6 != -1)
  {
    uint64_t v13 = 0;
    do
    {
      if ((a7 & 1) != 0 || v13 && a6 != v13)
      {
        v16.origin.CGFloat x = a1;
        v16.origin.CGFloat y = a2;
        v16.size.CGFloat width = a3;
        v16.size.CGFloat height = a4;
        CGRectGetWidth(v16);
        v17.origin.CGFloat x = a1;
        v17.origin.CGFloat y = a2;
        v17.size.CGFloat width = a3;
        v17.size.CGFloat height = a4;
        CGRectGetHeight(v17);
        v18.origin.CGFloat x = a1;
        v18.origin.CGFloat y = a2;
        v18.size.CGFloat width = a3;
        v18.size.CGFloat height = a4;
        CGRectGetMinX(v18);
        sub_217BD83F0();
        v19.origin.CGFloat x = a1;
        v19.origin.CGFloat y = a2;
        v19.size.CGFloat width = a3;
        v19.size.CGFloat height = a4;
        CGRectGetMaxX(v19);
        sub_217BD8400();
        v20.origin.CGFloat x = a1;
        v20.origin.CGFloat y = a2;
        v20.size.CGFloat width = a3;
        v20.size.CGFloat height = a4;
        CGRectGetMinY(v20);
        sub_217BD83F0();
        v21.origin.CGFloat x = a1;
        v21.origin.CGFloat y = a2;
        v21.size.CGFloat width = a3;
        v21.size.CGFloat height = a4;
        CGRectGetMaxY(v21);
        uint64_t result = sub_217BD8400();
      }
      ++v13;
    }
    while (v7 != v13);
  }
  return result;
}

double sub_217B74A08@<D0>(uint64_t a1@<X8>)
{
  sub_217B74844((uint64_t)v4);
  double result = *(double *)v4;
  long long v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_217B74A5C()
{
  return MEMORY[0x270F047C8]();
}

uint64_t sub_217B74A74()
{
  return nullsub_1(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

void (*sub_217B74A84(void *a1))(void *a1)
{
  double v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_217BD7C40();
  return sub_217B74AF4;
}

void sub_217B74AF4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_217B74B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_217B78BB0();
  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t sub_217B74BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_217B78BB0();
  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t sub_217B74C08(uint64_t a1)
{
  unint64_t v2 = sub_217B78BB0();
  return MEMORY[0x270F047E0](a1, v2);
}

uint64_t sub_217B74C54()
{
  OUTLINED_FUNCTION_13();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  *(unsigned char *)(v4 + 32) = v0;
  *long long v3 = sub_217B78534;
  v3[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v4;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_217B74CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  v18[0] = a5;
  uint64_t v9 = sub_217BD7DD0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_217B78540(v12);
  swift_bridgeObjectRelease();
  v18[1] = v13;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  *(unsigned char *)(v15 + 32) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v14, (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_217B78764;
  *(void *)(v16 + 24) = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE6F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE6F8);
  sub_217B78CE4((uint64_t)&unk_267BAE700);
  sub_217B7883C((uint64_t)&unk_267BAE708);
  return sub_217BD87F0();
}

uint64_t sub_217B74F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v92 = a3;
  uint64_t v93 = a5;
  uint64_t v94 = a2;
  uint64_t v95 = a1;
  uint64_t v10 = sub_217BD8280();
  uint64_t v91 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_217BD7FD0();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (double *)((char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE748);
  MEMORY[0x270FA5388](v16 - 8);
  CGRect v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE738);
  MEMORY[0x270FA5388](v89);
  CGRect v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE728);
  MEMORY[0x270FA5388](v90);
  uint64_t v22 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE718);
  MEMORY[0x270FA5388](v23);
  long long v26 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 1) != 0
    && ((v27 = *(void *)(v94 + 16), BOOL v28 = v27 != 0, v29 = v27 - 1, v28) ? (v30 = v29 == v95) : (v30 = 0), v30))
  {
    return __swift_storeEnumTagSinglePayload(a6, 1, 1, v24);
  }
  else
  {
    uint64_t v87 = v24;
    uint64_t v88 = a6;
    uint64_t v31 = (char *)v15 + *(int *)(v13 + 20);
    uint64_t v32 = *MEMORY[0x263F19860];
    uint64_t v33 = sub_217BD81C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v31, v32, v33);
    *uint64_t v15 = a7;
    v15[1] = a7;
    uint64_t v34 = v92;
    swift_retain();
    sub_217BD7D00();
    uint64_t v35 = (void (*)(void))MEMORY[0x263F19048];
    sub_217B77568((uint64_t)v15, (uint64_t)v18, MEMORY[0x263F19048]);
    uint64_t v36 = &v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE758) + 36)];
    long long v37 = v97;
    *(_OWORD *)uint64_t v36 = v96;
    *((_OWORD *)v36 + 1) = v37;
    *((void *)v36 + 4) = v98;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE760);
    *(void *)&v18[*(int *)(v38 + 52)] = v34;
    *(_WORD *)&v18[*(int *)(v38 + 56)] = 256;
    uint64_t v39 = sub_217BD88E0();
    uint64_t v41 = v40;
    uint64_t v42 = (uint64_t *)&v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAE768) + 36)];
    uint64_t *v42 = v39;
    v42[1] = v41;
    sub_217B775BC((uint64_t)v15, v35);
    char v43 = sub_217BD8370();
    uint64_t result = sub_217BD7DB0();
    if (__OFSUB__(*(void *)(v94 + 16) - 1, v95))
    {
      __break(1u);
    }
    else
    {
      sub_217BD7C60();
      uint64_t v46 = v45;
      uint64_t v48 = v47;
      uint64_t v50 = v49;
      uint64_t v52 = v51;
      sub_217B78A98((uint64_t)v18, (uint64_t)v20, &qword_267BAE748);
      uint64_t v53 = &v20[*(int *)(v89 + 36)];
      *uint64_t v53 = v43;
      *((void *)v53 + 1) = v46;
      *((void *)v53 + 2) = v48;
      *((void *)v53 + 3) = v50;
      *((void *)v53 + 4) = v52;
      v53[40] = 0;
      sub_217B78AE8((uint64_t)v18, &qword_267BAE748);
      char v54 = sub_217BD83A0();
      sub_217BD7DB0();
      sub_217BD7C60();
      uint64_t v56 = v55;
      uint64_t v58 = v57;
      uint64_t v60 = v59;
      uint64_t v62 = v61;
      sub_217B78A98((uint64_t)v20, (uint64_t)v22, &qword_267BAE738);
      id v63 = &v22[*(int *)(v90 + 36)];
      *id v63 = v54;
      *((void *)v63 + 1) = v56;
      *((void *)v63 + 2) = v58;
      *((void *)v63 + 3) = v60;
      *((void *)v63 + 4) = v62;
      v63[40] = 0;
      sub_217B78AE8((uint64_t)v20, &qword_267BAE738);
      sub_217BD82B0();
      sub_217BD7DC0();
      CGFloat v65 = v64;
      CGFloat v67 = v66;
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      uint64_t v72 = *(void (**)(char *, uint64_t))(v91 + 8);
      v72(v12, v10);
      v100.origin.CGFloat x = v65;
      v100.origin.CGFloat y = v67;
      v100.size.CGFloat width = v69;
      v100.size.CGFloat height = v71;
      CGFloat MidX = CGRectGetMidX(v100);
      sub_217BD82B0();
      sub_217BD7DC0();
      CGFloat v75 = v74;
      CGFloat v77 = v76;
      CGFloat v79 = v78;
      CGFloat v81 = v80;
      v72(v12, v10);
      v101.origin.CGFloat x = v75;
      v101.origin.CGFloat y = v77;
      v101.size.CGFloat width = v79;
      v101.size.CGFloat height = v81;
      CGFloat MidY = CGRectGetMidY(v101);
      sub_217B78A98((uint64_t)v22, (uint64_t)v26, &qword_267BAE728);
      uint64_t v83 = v87;
      uint64_t v84 = (CGFloat *)&v26[*(int *)(v87 + 36)];
      *uint64_t v84 = MidX;
      v84[1] = MidY;
      sub_217B78AE8((uint64_t)v22, &qword_267BAE728);
      uint64_t v85 = v88;
      sub_217B78B3C((uint64_t)v26, v88, &qword_267BAE718);
      return __swift_storeEnumTagSinglePayload(v85, 0, 1, v83);
    }
  }
  return result;
}

uint64_t sub_217B75550()
{
  return sub_217B74C54();
}

uint64_t sub_217B7555C()
{
  OUTLINED_FUNCTION_13();
  *long long v3 = sub_217BD88E0();
  v3[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE188);
  return sub_217B755B0(v2, v1, v0, (uint64_t)v3 + *(int *)(v5 + 44));
}

uint64_t sub_217B755B0@<X0>(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v56 = a3;
  id v54 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE190);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_217BD7FE0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v52 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_217BD8980();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v50 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE198);
  MEMORY[0x270FA5388](v55);
  uint64_t v49 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1A0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  CGRect v18 = (char *)v44 - v17;
  uint64_t v19 = sub_217BD86C0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1A8);
  MEMORY[0x270FA5388](v23);
  long long v26 = (void *)((char *)v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    v44[1] = v24;
    uint64_t v45 = v18;
    uint64_t v46 = v8;
    uint64_t v47 = v6;
    uint64_t v48 = a4;
    id v54 = a1;
    sub_217BD8690();
    uint64_t v27 = *MEMORY[0x263F1B4B8];
    BOOL v28 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 104);
    v28(v22, v27, v19);
    v44[0] = sub_217BD86E0();
    swift_release();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
    v29(v22, v19);
    if (v56)
    {
      id v30 = v54;
      sub_217BD8690();
      v28(v22, v27, v19);
      uint64_t v31 = sub_217BD86E0();
      swift_release();
      v29(v22, v19);
      uint64_t v33 = v50;
      uint64_t v32 = v51;
      uint64_t v34 = v53;
      (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, *MEMORY[0x263F1B9A0], v53);
      uint64_t v35 = (uint64_t)v52;
      (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v52, v33, v34);
      uint64_t v36 = v55;
      uint64_t v37 = (uint64_t)v49;
      uint64_t v38 = (void (*)(void))MEMORY[0x263F190D8];
      sub_217B77568(v35, (uint64_t)&v49[*(int *)(v55 + 36)], MEMORY[0x263F190D8]);
      *(void *)uint64_t v37 = v31;
      *(_WORD *)(v37 + 8) = 0;
      swift_retain();
      sub_217B775BC(v35, v38);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
      swift_release();
      uint64_t v39 = (uint64_t)v45;
      sub_217B78B3C(v37, (uint64_t)v45, &qword_267BAE198);
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v40 = 1;
      uint64_t v39 = (uint64_t)v45;
      uint64_t v36 = v55;
    }
    __swift_storeEnumTagSinglePayload(v39, v40, 1, v36);
    sub_217B78A98(v39, (uint64_t)v16, &qword_267BAE1A0);
    uint64_t v42 = (uint64_t)v46;
    *uint64_t v46 = v44[0];
    *(_WORD *)(v42 + 8) = 0;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1B8);
    sub_217B78A98((uint64_t)v16, v42 + *(int *)(v43 + 48), &qword_267BAE1A0);
    swift_retain_n();
    sub_217B78AE8((uint64_t)v16, &qword_267BAE1A0);
    swift_release();
    sub_217B78A98(v42, (uint64_t)v26, &qword_267BAE190);
    swift_storeEnumTagMultiPayload();
    sub_217B78CE4((uint64_t)&unk_267BAE1B0);
    sub_217BD8260();

    sub_217B78AE8(v42, &qword_267BAE190);
    sub_217B78AE8(v39, &qword_267BAE1A0);
    return swift_release();
  }
  else
  {
    void *v26 = v54;
    swift_storeEnumTagMultiPayload();
    sub_217B78CE4((uint64_t)&unk_267BAE1B0);
    swift_retain();
    return sub_217BD8260();
  }
}

uint64_t sub_217B75C10()
{
  return sub_217B7555C();
}

uint64_t sub_217B75C1C()
{
  return sub_217BD7A40();
}

uint64_t sub_217B75C68()
{
  return sub_217BD7A30();
}

uint64_t sub_217B75CC0()
{
  return sub_217BD8E10();
}

uint64_t sub_217B75D28()
{
  return sub_217B76290(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_217B75D5C(uint64_t a1, id *a2)
{
  uint64_t result = sub_217BD8AF0();
  *a2 = 0;
  return result;
}

uint64_t sub_217B75DD8(uint64_t a1, id *a2)
{
  char v3 = sub_217BD8B00();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_217B75E58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217B75E80();
  *a1 = result;
  return result;
}

uint64_t sub_217B75E80()
{
  sub_217BD8B10();
  uint64_t v0 = sub_217BD8AE0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_217B75EB8()
{
  return sub_217B812D4();
}

uint64_t sub_217B75EC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA06B8](v4, v5, a3, WitnessTable);
}

unint64_t sub_217B75F30()
{
  return sub_217B71128((uint64_t)&unk_267BAE060);
}

unint64_t sub_217B75F78()
{
  return sub_217B71128((uint64_t)&unk_267BAE068);
}

uint64_t sub_217B75FC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B75FDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B76020()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B7603C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B76058@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_217BD8AE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217B760A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217B8135C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_217B760CC(uint64_t a1)
{
  unint64_t v2 = sub_217B71128((uint64_t)&unk_267BAE088);
  unint64_t v3 = sub_217B71128((uint64_t)&unk_267BAE090);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_217B76188()
{
  return sub_217B71128((uint64_t)&unk_267BAE070);
}

unint64_t sub_217B761D0()
{
  return sub_217B71128((uint64_t)&unk_267BAE078);
}

unint64_t sub_217B76218()
{
  return sub_217B71128((uint64_t)&unk_267BAE080);
}

uint64_t sub_217B76260()
{
  return sub_217B76290(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_217B76290(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_217BD8B10();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_217B762D0()
{
  return sub_217B762D8();
}

uint64_t sub_217B762D8()
{
  sub_217BD8B10();
  sub_217BD8B40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217B7632C()
{
  return sub_217B76334();
}

uint64_t sub_217B76334()
{
  sub_217BD8B10();
  sub_217BD8DF0();
  sub_217BD8B40();
  uint64_t v0 = sub_217BD8E10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_217B763A8()
{
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_217B763B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B7365C(a1, v2 + 16, a2);
}

uint64_t sub_217B763C0()
{
  sub_217BD7DD0();
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_8();
  v4(v3);
  return MEMORY[0x270FA0238](v1, v0, v2);
}

uint64_t sub_217B76438()
{
  uint64_t v3 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 73) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_217B73984(v0, v1 + 16, v5, v2);
}

unint64_t sub_217B76490()
{
  unint64_t result = qword_267BAE0C0;
  if (!qword_267BAE0C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE0B0);
    sub_217B7650C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE0C0);
  }
  return result;
}

unint64_t sub_217B7650C()
{
  unint64_t result = qword_267BAE0C8;
  if (!qword_267BAE0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE0C8);
  }
  return result;
}

uint64_t sub_217B76558()
{
  sub_217BD7DD0();
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_8();
  v4(v3);
  return MEMORY[0x270FA0238](v1, v0, v2);
}

uint64_t sub_217B765D0()
{
  uint64_t v3 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(v3);
  uint64_t v5 = *(void *)(v1 + 80);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_217B73BCC(v0, v1 + 16, v5, v6, v2);
}

unint64_t sub_217B7662C()
{
  unint64_t result = qword_267BAE0E0;
  if (!qword_267BAE0E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE0D8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE0E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE0F0);
    sub_217B78940((uint64_t)&unk_267BAE0F8);
    sub_217B78940((uint64_t)&unk_267BAE108);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE0E0);
  }
  return result;
}

unint64_t sub_217B7675C()
{
  unint64_t result = qword_267BAE100;
  if (!qword_267BAE100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE100);
  }
  return result;
}

unint64_t sub_217B767A8()
{
  unint64_t result = qword_267BAE110;
  if (!qword_267BAE110)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE118);
    sub_217B78CE4((uint64_t)&unk_267BAE120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE110);
  }
  return result;
}

uint64_t sub_217B76848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B74008(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_217B76854@<X0>(uint64_t a1@<X8>)
{
  return sub_217B7271C(*(uint64_t **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void *sub_217B76860(void *a1)
{
  uint64_t v2 = a1[14];
  uint64_t v7 = a1[13];
  uint64_t v8 = a1[12];
  uint64_t v3 = a1[15];
  uint64_t v4 = a1[16];
  uint64_t v5 = a1[17];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_217B76930(v8, v7, v2, v3, v4, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_217B76930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

void *sub_217B76974(void *a1)
{
  uint64_t v7 = a1[13];
  uint64_t v8 = a1[12];
  uint64_t v2 = a1[15];
  uint64_t v6 = a1[14];
  uint64_t v3 = a1[16];
  uint64_t v4 = a1[17];
  swift_release();
  swift_bridgeObjectRelease();
  sub_217B76A40(v8, v7, v6, v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_217B76A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_217B76A84()
{
  unint64_t result = qword_267BAE150;
  if (!qword_267BAE150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE158);
    sub_217B76B20((uint64_t)&unk_267BAE160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE150);
  }
  return result;
}

unint64_t sub_217B76B20(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_9(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_11(0, v4);
    sub_217B78CE4(v2);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_217B76BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B6A8B0(a1, v2 + 16, a2);
}

BOOL sub_217B76BB4(double *a1, double *a2)
{
  return sub_217B6E704(a1, a2, (_OWORD *)(v2 + 16));
}

unint64_t sub_217B76BBC()
{
  unint64_t result = qword_267BAE2A8;
  if (!qword_267BAE2A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE2A0);
    sub_217B76B20((uint64_t)&unk_267BAE2B0);
    sub_217B78CE4((uint64_t)&unk_267BAE2D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE2A8);
  }
  return result;
}

uint64_t sub_217B76C7C(uint64_t a1)
{
  return a1;
}

id *sub_217B76CF4(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_217B76D20()
{
  return objectdestroy_56Tm(384);
}

uint64_t sub_217B76D28(uint64_t a1)
{
  return sub_217B6F86C(a1, (uint64_t)(v1 + 2), v1[42], v1[43], v1[44], v1[45], v1[46], v1[47]);
}

unint64_t sub_217B76D3C()
{
  unint64_t result = qword_267BAE318;
  if (!qword_267BAE318)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE320);
    sub_217B71128((uint64_t)&unk_267BAE328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE318);
  }
  return result;
}

uint64_t sub_217B76DEC(uint64_t a1)
{
  return sub_217B70240(a1, v1 + 16);
}

uint64_t sub_217B76DF4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  *(_OWORD *)a2 = v2;
  return a2;
}

void *sub_217B76E0C()
{
  return sub_217B70354(*(void **)(v0 + 16));
}

uint64_t sub_217B76E28()
{
  return sub_217B7005C();
}

unint64_t sub_217B76E44()
{
  unint64_t result = qword_267BAE338;
  if (!qword_267BAE338)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BAE338);
  }
  return result;
}

uint64_t objectdestroy_56Tm(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

void *sub_217B76F1C()
{
  return sub_217B700BC();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_217B76F3C()
{
  return sub_217B70170(*(double **)(v0 + 16));
}

uint64_t sub_217B76F60(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B76FAC(uint64_t a1)
{
  return a1;
}

unint64_t sub_217B76FF8()
{
  unint64_t result = qword_267BAE3F0;
  if (!qword_267BAE3F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE370);
    sub_217B78940((uint64_t)&unk_267BAE3F8);
    sub_217B78CE4((uint64_t)&unk_267BAE430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE3F0);
  }
  return result;
}

unint64_t sub_217B770C4()
{
  return sub_217B78940((uint64_t)&unk_267BAE400);
}

unint64_t sub_217B770F4()
{
  return sub_217B78940((uint64_t)&unk_267BAE410);
}

unint64_t sub_217B77124()
{
  unint64_t result = qword_267BAE420;
  if (!qword_267BAE420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE420);
  }
  return result;
}

unint64_t sub_217B77198()
{
  unint64_t result = qword_267BAE440;
  if (!qword_267BAE440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE388);
    sub_217B78940((uint64_t)&unk_267BAE448);
    sub_217B78CE4((uint64_t)&unk_267BAE430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE440);
  }
  return result;
}

unint64_t sub_217B77264()
{
  return sub_217B78940((uint64_t)&unk_267BAE450);
}

unint64_t sub_217B77294()
{
  unint64_t result = qword_267BAE460;
  if (!qword_267BAE460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE460);
  }
  return result;
}

unint64_t sub_217B772E0()
{
  unint64_t result = qword_267BAE470;
  if (!qword_267BAE470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE390);
    sub_217B76FF8();
    sub_217B77198();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE470);
  }
  return result;
}

unint64_t sub_217B7735C()
{
  unint64_t result = qword_267BAE478;
  if (!qword_267BAE478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE3E8);
    sub_217B78CE4((uint64_t)&unk_267BAE480);
    sub_217B78CE4((uint64_t)&unk_267BAE430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE478);
  }
  return result;
}

unint64_t sub_217B77420()
{
  unint64_t result = qword_267BAE488;
  if (!qword_267BAE488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE3D0);
    sub_217B78CE4((uint64_t)&unk_267BAE468);
    sub_217B772E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE488);
  }
  return result;
}

uint64_t sub_217B774C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B6D824(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_217B774C8()
{
  unint64_t result = qword_267BAE498;
  if (!qword_267BAE498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE490);
    sub_217B78CE4((uint64_t)&unk_267BAE4A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE498);
  }
  return result;
}

uint64_t sub_217B77568(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_12();
  v5(v4);
  return a2;
}

uint64_t sub_217B775BC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_217B77614()
{
  unint64_t result = qword_267BAE538;
  if (!qword_267BAE538)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE530);
    sub_217B78CE4((uint64_t)&unk_267BAE540);
    sub_217B78CE4((uint64_t)&unk_267BAE550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE538);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for PEModelDeliveryPackage(uint64_t a1)
{
}

void type metadata accessor for PEModelDeliveryStage(uint64_t a1)
{
}

void sub_217B77744(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_217B7778C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[16])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B777D8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.GridDot()
{
}

uint64_t sub_217B77828()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_217B77864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_217B778A4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t sub_217B7790C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t sub_217B77954(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 17))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B77994(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.CoaxialRoundedRectangles()
{
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t sub_217B779F4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217B77A40(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.GridLines()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_217B77A9C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_217B77B24(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217B77BF0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_217B77C18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_217B77C20(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for PhotoStyleDPad.DottedGrid.Role()
{
}

unint64_t sub_217B77C3C()
{
  unint64_t result = qword_267BAE598;
  if (!qword_267BAE598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE5A0);
    sub_217B78940((uint64_t)&unk_267BAE5A8);
    sub_217B78CE4((uint64_t)&unk_267BAE5E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE598);
  }
  return result;
}

unint64_t sub_217B77D08()
{
  return sub_217B78940((uint64_t)&unk_267BAE5B8);
}

unint64_t sub_217B77D38()
{
  unint64_t result = qword_267BAE5C8;
  if (!qword_267BAE5C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE5D0);
    sub_217B78CE4((uint64_t)&unk_267BAE5D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE5C8);
  }
  return result;
}

unint64_t sub_217B77DD8()
{
  return sub_217B78CE4((uint64_t)&unk_267BAE5F8);
}

uint64_t sub_217B77E14()
{
  return swift_getWitnessTable();
}

unint64_t sub_217B77F88()
{
  return sub_217B78CE4((uint64_t)&unk_267BAE608);
}

unint64_t sub_217B77FC4()
{
  return sub_217B78CE4((uint64_t)&unk_267BAE618);
}

unint64_t sub_217B78004()
{
  unint64_t result = qword_267BAE628;
  if (!qword_267BAE628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE628);
  }
  return result;
}

unint64_t sub_217B78050()
{
  return sub_217B78CE4((uint64_t)&unk_267BAE630);
}

unint64_t sub_217B78090()
{
  unint64_t result = qword_267BAE640;
  if (!qword_267BAE640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE640);
  }
  return result;
}

unint64_t sub_217B780E0()
{
  unint64_t result = qword_267BAE648;
  if (!qword_267BAE648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE648);
  }
  return result;
}

unint64_t sub_217B78130()
{
  unint64_t result = qword_267BAE650;
  if (!qword_267BAE650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE650);
  }
  return result;
}

uint64_t sub_217B7817C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B78198()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B781B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B7473C(a1, *(unsigned __int8 *)(v2 + 16), a2, *(double *)(v2 + 24));
}

unint64_t sub_217B781C0()
{
  unint64_t result = qword_267BAE678;
  if (!qword_267BAE678)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE680);
    sub_217B7883C((uint64_t)&unk_267BAE688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE678);
  }
  return result;
}

unint64_t sub_217B78274()
{
  unint64_t result = qword_267BAE698;
  if (!qword_267BAE698)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE6A0);
    sub_217B78314();
    sub_217B78CE4((uint64_t)&unk_267BAE6C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE698);
  }
  return result;
}

unint64_t sub_217B78314()
{
  unint64_t result = qword_267BAE6A8;
  if (!qword_267BAE6A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE6B0);
    sub_217B78CE4((uint64_t)&unk_267BAE6B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE6A8);
  }
  return result;
}

unint64_t sub_217B783B4()
{
  unint64_t result = qword_267BAE6D8;
  if (!qword_267BAE6D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE668);
    sub_217B78CE4((uint64_t)&unk_267BAE6E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE6D8);
  }
  return result;
}

uint64_t sub_217B78454(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B784B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if ((a14 & 1) == 0) {
    swift_bridgeObjectRelease();
  }
  return swift_release();
}

uint64_t sub_217B784F4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_217B78534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B74CC8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32), a2);
}

uint64_t sub_217B78540(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unsigned int v6 = v2 + 4;
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (!v4)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE770);
        uint64_t v11 = (void *)swift_allocObject();
        uint64_t v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        unint64_t v13 = (unint64_t)(v11 + 4);
        unint64_t v14 = v2[3];
        unint64_t v15 = v14 >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= (unint64_t)&v2[2 * v15 + 4]) {
            memmove(v11 + 4, v2 + 4, 16 * v15);
          }
          v2[2] = 0;
        }
        unsigned int v6 = (void *)(v13 + 16 * v15);
        uint64_t v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - (v14 >> 1);
        unint64_t result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v17 = __OFSUB__(v4--, 1);
      if (v17) {
        break;
      }
      *unsigned int v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v4 = 0;
LABEL_21:
  unint64_t v18 = v2[3];
  if (v18 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_217B786B8()
{
  uint64_t v1 = sub_217BD7DD0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 33) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_217B78764(double a1)
{
  uint64_t v5 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(v5);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  char v9 = *(unsigned char *)(v2 + 32);
  uint64_t v10 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_217B74F34(v1, v7, v8, v9, v10, v3, a1);
}

uint64_t sub_217B787D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B78808(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(v1 + 16))(*(void *)a1, *(double *)(a1 + 8));
}

unint64_t sub_217B7883C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_9(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_11(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_217B78898()
{
  unint64_t result = qword_267BAE710;
  if (!qword_267BAE710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE718);
    sub_217B78940((uint64_t)&unk_267BAE720);
    sub_217B78A4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE710);
  }
  return result;
}

unint64_t sub_217B78940(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_9(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_11(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_217B789AC()
{
  unint64_t result = qword_267BAE730;
  if (!qword_267BAE730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE738);
    sub_217B78CE4((uint64_t)&unk_267BAE740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE730);
  }
  return result;
}

unint64_t sub_217B78A4C()
{
  unint64_t result = qword_267BAE750;
  if (!qword_267BAE750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE750);
  }
  return result;
}

uint64_t sub_217B78A98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_12();
  v5(v4);
  return a2;
}

uint64_t sub_217B78AE8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_217B78B3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_217B78B9C(uint64_t a1)
{
  return sub_217B748B0(*(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40), *(CGFloat *)(v1 + 48), *(CGFloat *)(v1 + 56), a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

unint64_t sub_217B78BB0()
{
  unint64_t result = qword_267BAE778;
  if (!qword_267BAE778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE778);
  }
  return result;
}

uint64_t sub_217B78BFC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_217B78CA8()
{
  return sub_217B78CE4((uint64_t)&unk_267BAE780);
}

unint64_t sub_217B78CE4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_9(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objectdestroy_56Tm(336);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  *(__n128 *)(a1 + 104) = a2;
  *(void *)(a1 + 120) = 0x3FE3333333333333;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v1 + v0;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_217BD7DD0();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

double PEPhotoStylePaletteSlider.value.getter()
{
  OUTLINED_FUNCTION_0_0();
  double v0 = sub_217B7B378();
  swift_release();
  return v0;
}

uint64_t PEPhotoStylePaletteSlider.value.setter(double a1)
{
  OUTLINED_FUNCTION_0_0();
  sub_217B7AC98(1, a1);
  return swift_release();
}

void sub_217B78F7C(double a1)
{
}

uint64_t PEPhotoStylePaletteSlider.colors.getter()
{
  return sub_217B793E8((uint64_t (*)(uint64_t))sub_217B79220);
}

uint64_t PEPhotoStylePaletteSlider.colors.setter()
{
  return swift_bridgeObjectRelease();
}

void sub_217B79118(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_colors);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_217B7C758(0, &qword_267BAE858);
    uint64_t v5 = sub_217BD8B70();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_217B79198(void *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    sub_217B7C758(0, &qword_267BAE858);
    uint64_t v3 = sub_217BD8B60();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setColors_);
}

uint64_t sub_217B79220()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_217B792C4()
{
  return swift_release();
}

uint64_t sub_217B79318()
{
  return swift_bridgeObjectRelease();
}

uint64_t PEPhotoStylePaletteSlider.gradientCast.getter()
{
  return sub_217B793E8((uint64_t (*)(uint64_t))sub_217B79538);
}

uint64_t sub_217B793E8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  uint64_t v3 = a1(v2);
  swift_release();
  return v3;
}

uint64_t PEPhotoStylePaletteSlider.gradientCast.setter(void *a1)
{
  return swift_release();
}

id sub_217B794FC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_gradientCast);
  *a2 = result;
  return result;
}

id sub_217B79538()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 40);
  return v1;
}

uint64_t sub_217B795E8(uint64_t a1, void *a2)
{
  return swift_release();
}

void sub_217B79634(void *a1)
{
}

uint64_t PEPhotoStylePaletteSlider.onValueChanged.getter()
{
  return sub_217B79E20((uint64_t (*)(uint64_t))sub_217B79998);
}

uint64_t sub_217B79770(uint64_t a1, double a2)
{
  uint64_t v3 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = swift_retain();
  v3(v4, a2);
  return swift_release();
}

uint64_t PEPhotoStylePaletteSlider.onValueChanged.setter()
{
  return sub_217B79EC8();
}

uint64_t sub_217B79818@<X0>(id *a1@<X0>, uint64_t (**a2)(double *a1)@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onValueChanged);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217B7CCD4;
  *(void *)(result + 24) = v4;
  *a2 = sub_217B7C72C;
  a2[1] = (uint64_t (*)(double *))result;
  return result;
}

void sub_217B798B4(uint64_t *a1, void **a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  v8[4] = sub_217B7C6F4;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217B79770;
  v8[3] = &block_descriptor_73;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setOnValueChanged_, v7);
  _Block_release(v7);
}

uint64_t sub_217B79998()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidBegin.getter()
{
  return sub_217B79E20((uint64_t (*)(uint64_t))sub_217B79C0C);
}

void sub_217B79AB4(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  char v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidBegin.setter()
{
  return sub_217B79EC8();
}

uint64_t sub_217B79B70@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onGestureDidBegin);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217B7CD34;
  *(void *)(result + 24) = v4;
  *a2 = sub_217B7CD4C;
  a2[1] = result;
  return result;
}

uint64_t sub_217B79C0C()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t sub_217B79CBC()
{
  return swift_release();
}

id sub_217B79D50(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  id v6 = a1;
  uint64_t v7 = a3();
  uint64_t v9 = v8;

  v12[4] = v7;
  v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_217B9E748;
  v12[3] = a4;
  uint64_t v10 = _Block_copy(v12);
  swift_release();
  return v10;
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidEnd.getter()
{
  return sub_217B79E20((uint64_t (*)(uint64_t))sub_217B7A0AC);
}

uint64_t sub_217B79E20(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  uint64_t v3 = a1(v2);
  swift_release();
  return v3;
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidEnd.setter()
{
  return sub_217B79EC8();
}

uint64_t sub_217B79EC8()
{
  OUTLINED_FUNCTION_0_0();
  sub_217B79CBC();
  return swift_release();
}

uint64_t sub_217B79F38@<X0>(id *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onGestureDidEnd);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217B7CD34;
  *(void *)(result + 24) = v4;
  *a2 = sub_217B7C6EC;
  a2[1] = (uint64_t (*)())result;
  return result;
}

void sub_217B79FD4(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  uint64_t v13 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v12;
  unint64_t v15 = *a2;
  v17[4] = a6;
  v17[5] = v14;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_217B9E748;
  v17[3] = a7;
  uint64_t v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v15, *a8, v16);
  _Block_release(v16);
}

uint64_t sub_217B7A0AC()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStylePaletteSlider.size.getter()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v0 = sub_217B7A244();
  swift_release();
  return v0;
}

uint64_t sub_217B7A1B0()
{
  return PEPhotoStylePaletteSlider.size.setter();
}

uint64_t PEPhotoStylePaletteSlider.size.setter()
{
  OUTLINED_FUNCTION_0_0();
  sub_217B7A2E8();
  return swift_release();
}

uint64_t sub_217B7A244()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  return *(void *)(v0 + 96);
}

uint64_t sub_217B7A2E8()
{
  return swift_release();
}

uint64_t (*PEPhotoStylePaletteSlider.size.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  *(void *)a1 = PEPhotoStylePaletteSlider.size.getter();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return sub_217B7A3C0;
}

uint64_t sub_217B7A3C0()
{
  return PEPhotoStylePaletteSlider.size.setter();
}

void __swiftcall PEPhotoStylePaletteSlider.init(value:)(PEPhotoStylePaletteSlider *__return_ptr retstr, Swift::Double value)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v3, sel_initWithValue_, value);
}

id PEPhotoStylePaletteSlider.init(value:)(double a1)
{
  id v3 = objc_msgSend(v1, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_retain();
  sub_217B7AC98(1, a1);
  swift_release();
  return v3;
}

void __swiftcall PEPhotoStylePaletteSlider.init(frame:)(PEPhotoStylePaletteSlider *__return_ptr retstr, __C::CGRect frame)
{
  OUTLINED_FUNCTION_2_0();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v5 = OUTLINED_FUNCTION_3_0();
  objc_msgSend(v3, v4, v5);
}

id PEPhotoStylePaletteSlider.init(frame:)()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = _s15IntegrationViewVMa(0);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = &v0[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets];
  *(_OWORD *)char v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  double v5 = (void *)*MEMORY[0x263F5D818];
  _s16IntegrationModelCMa(0);
  swift_allocObject();
  id v6 = v0;
  *(void *)&v6[OBJC_IVAR___PEPhotoStylePaletteSlider_paletteSliderModel] = sub_217B7B934(0, (uint64_t)v5, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, 0.0);
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  swift_retain();
  sub_217BD8840();
  id v7 = objc_allocWithZone((Class)type metadata accessor for TouchAreaPaddingHostingView(0));
  uint64_t v8 = (char *)sub_217B7BC40((uint64_t)v3);
  if (qword_267BADEA8 != -1) {
    swift_once();
  }
  long long v9 = xmmword_267BAE790;
  uint64_t v10 = qword_267BAE7A0;
  uint64_t v11 = unk_267BAE7A8;
  *(_OWORD *)char v4 = xmmword_267BAE790;
  *((void *)v4 + 2) = v10;
  *((void *)v4 + 3) = v11;
  v4[32] = 0;
  uint64_t v12 = &v8[qword_267BAE7C8];
  *(_OWORD *)uint64_t v12 = v9;
  *((void *)v12 + 2) = v10;
  *((void *)v12 + 3) = v11;
  *(void *)&v6[OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView] = v8;
  uint64_t v13 = v8;

  v19[0] = v6;
  v19[1] = PEPhotoStylePaletteSlider;
  double v14 = OUTLINED_FUNCTION_3_0();
  id v17 = objc_msgSendSuper2(v15, v16, v14);
  sub_217B7A7C4();

  return v17;
}

uint64_t sub_217B7A790(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_217B7BC40(a1);
}

void sub_217B7A7C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView;
  id v3 = *(id *)&v0[OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView];
  sub_217BD7E90();

  id v4 = *(id *)&v1[v2];
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v4);
  double v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE860);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_217BDD4E0;
  id v7 = objc_msgSend(v4, sel_topAnchor);
  id v8 = objc_msgSend(v1, sel_topAnchor);
  id v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(void *)(v6 + 32) = v9;
  id v10 = objc_msgSend(v4, sel_bottomAnchor);
  id v11 = objc_msgSend(v1, sel_bottomAnchor);
  id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(void *)(v6 + 40) = v12;
  id v13 = objc_msgSend(v4, sel_leadingAnchor);
  id v14 = objc_msgSend(v1, sel_leadingAnchor);
  id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  *(void *)(v6 + 48) = v15;
  id v16 = objc_msgSend(v4, sel_trailingAnchor);
  id v17 = objc_msgSend(v1, sel_trailingAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  *(void *)(v6 + 56) = v18;
  sub_217BD8B80();
  sub_217B7C758(0, &qword_267BAE868);
  id v19 = (id)sub_217BD8B60();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_activateConstraints_, v19);
}

void __swiftcall PEPhotoStylePaletteSlider.init(coder:)(PEPhotoStylePaletteSlider *__return_ptr retstr, NSCoder coder)
{
}

void PEPhotoStylePaletteSlider.init(coder:)()
{
  uint64_t v1 = &v0[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;

  sub_217BD8D40();
  __break(1u);
}

Swift::Bool __swiftcall PEPhotoStylePaletteSlider.point(inside:with:)(CGPoint inside, UIEvent_optional with)
{
  CGFloat y = inside.y;
  CGFloat x = inside.x;
  Swift::Bool result = objc_msgSend(v2, sel_bounds);
  if (v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets + 32])
  {
    __break(1u);
  }
  else
  {
    v11.origin.CGFloat x = UIEdgeInsetsInsetRect(v6, v7, v8, v9, *(double *)&v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets], *(double *)&v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets + 8]);
    v10.CGFloat x = x;
    v10.CGFloat y = y;
    return CGRectContainsPoint(v11, v10);
  }
  return result;
}

Swift::Void __swiftcall PEPhotoStylePaletteSlider.setValue(_:notifyObserver:)(Swift::Double _, Swift::Bool notifyObserver)
{
  OUTLINED_FUNCTION_0_0();
  sub_217B7AC98(notifyObserver, _);
  swift_release();
}

void sub_217B7AC98(char a1, double a2)
{
  if (vabdd_f64(a2, sub_217B7B378()) >= 2.22044605e-16)
  {
    sub_217B7B470();
    if (a1)
    {
      id v4 = (void (*)(double))sub_217B79998();
      v4(a2);
      swift_release();
    }
  }
}

uint64_t sub_217B7AD84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  double v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  double v7 = (char *)&v31 - v6;
  uint64_t v34 = type metadata accessor for PhotoStylePaletteSlider();
  MEMORY[0x270FA5388](v34);
  double v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE838);
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v38 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v35 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE840);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v36 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD8830();
  swift_getKeyPath();
  sub_217BD8850();
  swift_release();
  id v15 = *(void (**)(char *, uint64_t))(v2 + 8);
  v15(v7, v1);
  uint64_t v32 = *((void *)&v46 + 1);
  uint64_t v33 = v46;
  uint64_t v16 = v47;
  sub_217BD8830();
  swift_getKeyPath();
  sub_217BD8850();
  swift_release();
  v15(v5, v1);
  uint64_t v17 = v43;
  uint64_t v18 = v44;
  LOBYTE(v15) = v45;
  sub_217BD8820();
  id v19 = sub_217B79538();
  uint64_t v20 = PISemanticStyleCast.gradientColors.getter();
  swift_release();

  *((void *)v9 + 8) = 0;
  uint64_t v40 = 0;
  sub_217BD8750();
  uint64_t v21 = v42;
  *((void *)v9 + 9) = v41;
  *((void *)v9 + 10) = v21;
  uint64_t v22 = (uint64_t *)&v9[*(int *)(v34 + 36)];
  *uint64_t v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = v32;
  *(void *)double v9 = v33;
  *((void *)v9 + 1) = v23;
  *((void *)v9 + 2) = v16;
  *((_OWORD *)v9 + 3) = xmmword_217BDCBC0;
  *((void *)v9 + 3) = v17;
  *((void *)v9 + 4) = v18;
  v9[40] = (char)v15;
  swift_bridgeObjectRelease();
  *((void *)v9 + 8) = v20;
  sub_217B7C598(&qword_267BAE850, (void (*)(uint64_t))type metadata accessor for PhotoStylePaletteSlider);
  uint64_t v24 = v35;
  sub_217BD8530();
  sub_217B7C7F8((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  sub_217BD8820();
  sub_217B7A244();
  swift_release();
  sub_217BD8820();
  sub_217B7A244();
  swift_release();
  sub_217BD88E0();
  sub_217BD7D50();
  uint64_t v26 = (uint64_t)v36;
  uint64_t v25 = v37;
  uint64_t v27 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v36, v24, v38);
  BOOL v28 = (_OWORD *)(v26 + *(int *)(v13 + 44));
  long long v29 = v47;
  *BOOL v28 = v46;
  v28[1] = v29;
  v28[2] = v48;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v24, v27);
  return sub_217B7C5E0(v26, v39);
}

uint64_t sub_217B7B264()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_217B7B304()
{
  return swift_release();
}

double sub_217B7B378()
{
  swift_getKeyPath();
  sub_217B7C598(&qword_267BAE7C0, (void (*)(uint64_t))_s16IntegrationModelCMa);
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 16);
}

uint64_t sub_217B7B418()
{
  return sub_217B792C4();
}

uint64_t sub_217B7B434()
{
  return sub_217B795E8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t _s15IntegrationViewVMa(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAE820);
}

uint64_t sub_217B7B470()
{
  return swift_release();
}

uint64_t sub_217B7B4E8()
{
  return sub_217BD78C0();
}

uint64_t sub_217B7B5A4(uint64_t result, char a2)
{
  if ((result & 1) != (a2 & 1))
  {
    if (a2) {
      uint64_t v2 = (void (*)(void))sub_217B79C0C();
    }
    else {
      uint64_t v2 = (void (*)(void))sub_217B7A0AC();
    }
    v2();
    return swift_release();
  }
  return result;
}

uint64_t sub_217B7B60C(char a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = a1;
  char v3 = sub_217B7B264() & 1;
  return sub_217B7B5A4(v2, v3);
}

uint64_t sub_217B7B64C()
{
  return sub_217B79318();
}

uint64_t sub_217B7B678(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_217B7B6B4(id *a1)
{
}

void sub_217B7B6E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = a2;
  id v3 = a2;
}

uint64_t sub_217B7B714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217B7B750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217B7B78C@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X5>, void *a3@<X8>)
{
  uint64_t v5 = a1();
  uint64_t v7 = v6;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v5;
  *(void *)(result + 24) = v7;
  *a3 = a2;
  a3[1] = result;
  return result;
}

uint64_t sub_217B7B7F0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  swift_retain();
  return sub_217B79CBC();
}

uint64_t sub_217B7B870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 80) = a2;
  *(void *)(a1 + 88) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217B7B8AC()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = v1();
  *(void *)uint64_t v0 = result;
  *(void *)(v0 + 8) = v3;
  *(unsigned char *)(v0 + 16) = v4 & 1;
  return result;
}

uint64_t sub_217B7B8E0()
{
  return sub_217B7A2E8();
}

uint64_t _s16IntegrationModelCMa(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAE7E0);
}

uint64_t sub_217B7B934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  *(unsigned char *)(v9 + 24) = 0;
  *(void *)(v9 + 32) = 0;
  *(void *)(v9 + 96) = 0;
  *(void *)(v9 + 104) = 0;
  *(unsigned char *)(v9 + 112) = 1;
  sub_217BD7900();
  *(double *)(v9 + 16) = a9;
  swift_bridgeObjectRelease();
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  *(void *)(v9 + 48) = a3;
  *(void *)(v9 + 56) = a4;
  *(void *)(v9 + 64) = a5;
  *(void *)(v9 + 72) = a6;
  *(void *)(v9 + 80) = a7;
  *(void *)(v9 + 88) = a8;
  return v9;
}

uint64_t type metadata accessor for TouchAreaPaddingHostingView(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAE808);
}

uint64_t sub_217B7BA00(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217B7BA34()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo25PEPhotoStylePaletteSliderP33_BAD2206819EDFB03A5A5AC328C9B469516IntegrationModel___observationRegistrar;
  uint64_t v2 = sub_217BD7910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_217B7BAC0()
{
  uint64_t v0 = sub_217B7BA34();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

double sub_217B7BB14()
{
  double result = -18.0;
  __asm { FMOV            V1.2D, #-13.0 }
  xmmword_267BAE790 = _Q1;
  *(_OWORD *)&qword_267BAE7A0 = xmmword_217BDD4F0;
  return result;
}

BOOL sub_217B7BB7C(CGFloat a1, CGFloat a2)
{
  objc_msgSend(v2, sel_bounds);
  v11.origin.CGFloat x = UIEdgeInsetsInsetRect(v5, v6, v7, v8, *(double *)&v2[qword_267BAE7C8], *(double *)&v2[qword_267BAE7C8 + 8]);
  v10.CGFloat x = a1;
  v10.CGFloat y = a2;
  return CGRectContainsPoint(v11, v10);
}

BOOL sub_217B7BBD4(void *a1, CGFloat a2, CGFloat a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = a1;
  BOOL v10 = sub_217B7BB7C(a2, a3);

  return v10;
}

uint64_t sub_217B7BC40(uint64_t a1)
{
  uint64_t v3 = _s15IntegrationViewVMa(0);
  MEMORY[0x270FA5388](v3 - 8);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = (_OWORD *)(v1 + qword_267BAE7C8);
  long long v7 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *double v6 = *MEMORY[0x263F834E8];
  v6[1] = v7;
  sub_217B7C794(a1, (uint64_t)v5);
  uint64_t v8 = sub_217BD7E80();
  sub_217B7C7F8(a1, _s15IntegrationViewVMa);
  return v8;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

char *keypath_get_selector_value()
{
  return sel_value;
}

id sub_217B7BD2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_value);
  *a2 = v4;
  return result;
}

id sub_217B7BD60(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setValue_, *a1);
}

char *keypath_get_selector_colors()
{
  return sel_colors;
}

char *keypath_get_selector_gradientCast()
{
  return sel_gradientCast;
}

id sub_217B7BD98(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGradientCast_, *a1);
}

char *keypath_get_selector_onValueChanged()
{
  return sel_onValueChanged;
}

char *keypath_get_selector_onGestureDidBegin()
{
  return sel_onGestureDidBegin;
}

void sub_217B7BDD0(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_onGestureDidEnd()
{
  return sel_onGestureDidEnd;
}

void sub_217B7BE24(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_217B7BE68()
{
  return sub_217B7B8AC();
}

uint64_t sub_217B7BE98()
{
  return _s16IntegrationModelCMa(0);
}

uint64_t sub_217B7BEA0()
{
  uint64_t result = sub_217BD7910();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStylePaletteSlider(uint64_t a1)
{
  return sub_217B7C758(a1, &qword_267BAE7F0);
}

uint64_t sub_217B7BF8C()
{
  return swift_initClassMetadata2();
}

id sub_217B7BFD8(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[qword_267BAE7C8];
  long long v5 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)uint64_t v4 = *MEMORY[0x263F834E8];
  *((_OWORD *)v4 + 1) = v5;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id sub_217B7C048(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_217B7BFD8(a3);
}

id sub_217B7C070()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217B7C0A8()
{
  return type metadata accessor for TouchAreaPaddingHostingView(0);
}

uint64_t sub_217B7C0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  long long v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_217B7C120(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_217B7C188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_217B7C1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_217B7C258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_217B7C2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_217B7C328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B7C33C);
}

uint64_t sub_217B7C33C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_217B7C388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B7C39C);
}

uint64_t sub_217B7C39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE818);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_217B7C3EC()
{
  sub_217B7C478();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_217B7C478()
{
  if (!qword_267BAE830)
  {
    _s16IntegrationModelCMa(255);
    unint64_t v0 = sub_217BD8860();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BAE830);
    }
  }
}

uint64_t sub_217B7C4D0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_217B7C4EC()
{
  OUTLINED_FUNCTION_1_0();
  double *v0 = sub_217B78F78();
}

void sub_217B7C514(double *a1)
{
}

uint64_t sub_217B7C53C()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = sub_217B7B264();
  unsigned char *v0 = result & 1;
  return result;
}

uint64_t sub_217B7C568()
{
  return sub_217B7B304();
}

uint64_t sub_217B7C598(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217B7C5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B7C648()
{
  return sub_217B7B60C(*(unsigned char *)(v0 + 24));
}

uint64_t sub_217B7C67C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_217B7C6B4()
{
  return j__OUTLINED_FUNCTION_2_5(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_217B7C6D4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_217B7C6E4()
{
  return sub_217BA07FC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_217B7C6EC()
{
  return sub_217BA07D4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_217B7C6F4(double a1)
{
  uint64_t v2 = *(uint64_t (**)(double *))(v1 + 16);
  double v4 = a1;
  return v2(&v4);
}

uint64_t sub_217B7C72C(double *a1)
{
  return (*(uint64_t (**)(double))(v1 + 16))(*a1);
}

uint64_t sub_217B7C758(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_217B7C794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s15IntegrationViewVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B7C7F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_217B7C858()
{
  return sub_217B7B8AC();
}

__n128 sub_217B7C888()
{
  uint64_t v1 = *(__n128 **)(v0 + 16);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 40);
  __n128 result = *(__n128 *)(v0 + 24);
  v1[6] = result;
  v1[7].n128_u8[0] = v2;
  return result;
}

uint64_t sub_217B7C8A0@<X0>(void *a1@<X8>)
{
  return sub_217B7B78C(sub_217B7A0AC, (uint64_t)sub_217B7CD4C, a1);
}

uint64_t sub_217B7C8E8(uint64_t *a1)
{
  return sub_217B7B7F0(a1);
}

uint64_t sub_217B7C938()
{
  return sub_217B7B870(v0[2], v0[3], v0[4]);
}

uint64_t sub_217B7C958@<X0>(void *a1@<X8>)
{
  return sub_217B7B78C(sub_217B79C0C, (uint64_t)sub_217B7CD4C, a1);
}

uint64_t sub_217B7C9A0(uint64_t *a1)
{
  return sub_217B7B7F0(a1);
}

uint64_t sub_217B7C9F0()
{
  return sub_217B7B750(v0[2], v0[3], v0[4]);
}

uint64_t sub_217B7CA10()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B7CA48@<X0>(void *a1@<X8>)
{
  return sub_217B7B78C(sub_217B79998, (uint64_t)sub_217B7CCD8, a1);
}

uint64_t sub_217B7CA90(uint64_t *a1)
{
  return sub_217B7B7F0(a1);
}

uint64_t sub_217B7CAE0()
{
  return sub_217B7B714(v0[2], v0[3], v0[4]);
}

id sub_217B7CB00()
{
  OUTLINED_FUNCTION_1_0();
  id result = sub_217B79538();
  void *v0 = result;
  return result;
}

void sub_217B7CB2C()
{
  sub_217B7B6E0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_217B7CB48()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = sub_217B79220();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_217B7CB74()
{
  return sub_217B7B678(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_217B7CB90()
{
  OUTLINED_FUNCTION_1_0();
  double *v0 = sub_217B7B378();
}

uint64_t sub_217B7CBB8()
{
  return sub_217B7B470();
}

double sub_217B7CBE0()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 16) = result;
  return result;
}

unint64_t sub_217B7CBF4()
{
  unint64_t result = qword_267BAE870;
  if (!qword_267BAE870)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE840);
    type metadata accessor for PhotoStylePaletteSlider();
    sub_217B7C598(&qword_267BAE850, (void (*)(uint64_t))type metadata accessor for PhotoStylePaletteSlider);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE870);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_retain();
}

double OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t sub_217B7CD9C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (void *)(a1 + v9);
    CGRect v11 = (uint64_t *)((char *)a2 + v9);
    *(void *)(a1 + 80) = a2[10];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_217B7CF1C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_217BD7EC0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_217B7CFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_217BD7EC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_217B7D12C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_217B7FE68(a1 + v6, &qword_267BAE848);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_217B7D2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_217BD7EC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_217B7D3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_217B7FE68(a1 + v6, &qword_267BAE848);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_217BD7EC0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_217B7D530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B7D544);
}

uint64_t sub_217B7D544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
    uint64_t v9 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_217B7D5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B7D5E4);
}

uint64_t sub_217B7D5E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
    uint64_t v8 = v5 + *(int *)(a4 + 36);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotoStylePaletteSlider()
{
  uint64_t result = qword_267BAE880;
  if (!qword_267BAE880) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_217B7D6B0()
{
  sub_217B7D770();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_217B7D770()
{
  if (!qword_267BAE890)
  {
    sub_217BD7EC0();
    unint64_t v0 = sub_217BD7CE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BAE890);
    }
  }
}

uint64_t sub_217B7D7C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B7D7E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v27 = sub_217BD7F40();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD7F70();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v26 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PhotoStylePaletteSlider();
  uint64_t v11 = OUTLINED_FUNCTION_4_0(v10);
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B7FDC4((uint64_t)v1, (uint64_t)v16, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = swift_allocObject();
  sub_217B7F544((uint64_t)v16, v18 + v17);
  v31[4] = sub_217B7F5A8;
  v31[5] = v18;
  sub_217BD7F00();
  sub_217BD7F60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v27);
  uint64_t v19 = v1[1];
  uint64_t v20 = v1[2];
  v31[1] = *v1;
  v31[2] = v19;
  v31[3] = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE898);
  MEMORY[0x21D4575E0](v31, v21);
  sub_217B7FDC4((uint64_t)v1, (uint64_t)v16, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  uint64_t v22 = swift_allocObject();
  sub_217B7F544((uint64_t)v16, v22 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8A0);
  sub_217B7FD60(&qword_267BAE8A8, &qword_267BAE8A0);
  uint64_t v23 = v26;
  sub_217BD8500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v29);
  return swift_release();
}

uint64_t sub_217B7DAC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_217BD88F0();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8B0);
  return sub_217B7DB18(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

uint64_t sub_217B7DB18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v59[1] = a2;
  uint64_t v72 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8B8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v70 = v5;
  uint64_t v71 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v69 = (uint64_t)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8C0);
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8C8);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8D0);
  MEMORY[0x270FA5388](v63);
  uint64_t v60 = (uint64_t)v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8D8);
  uint64_t v73 = *(void *)(v68 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v68);
  CGFloat v65 = (char *)v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  CGFloat v67 = (char *)v59 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8E0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v66 = (uint64_t)v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (void *)((char *)v59 - v21);
  *uint64_t v22 = sub_217BD88F0();
  v22[1] = v23;
  uint64_t v61 = v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8E8);
  sub_217B7E20C(a1, a2, (uint64_t)v22 + *(int *)(v24 + 44));
  uint64_t v25 = sub_217BD8630();
  uint64_t v26 = sub_217BD88E0();
  uint64_t v28 = v27;
  sub_217BD8610();
  uint64_t v29 = sub_217BD8640();
  swift_release();
  LOBYTE(v22) = sub_217BD8380();
  sub_217BD7C60();
  char v76 = 0;
  v75[0] = v25;
  LOWORD(v75[1]) = 256;
  v75[2] = 0x3FD6666666666666;
  v75[3] = v29;
  v75[4] = 0x4010000000000000;
  memset(&v75[5], 0, 24);
  v75[8] = 0x4008000000000000;
  v75[9] = v26;
  v75[10] = v28;
  LOBYTE(v75[11]) = (_BYTE)v22;
  v75[12] = v30;
  v75[13] = v31;
  v75[14] = v32;
  v75[15] = v33;
  LOBYTE(v75[16]) = 0;
  sub_217B6F640();
  uint64_t v74 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8F8);
  sub_217B7F88C(&qword_267BAE900, &qword_267BAE8F0, (void (*)(void))sub_217B7F674);
  sub_217B7F7B4();
  sub_217BD8590();
  swift_release();
  memcpy(__dst, v75, 0x81uLL);
  sub_217B7F854((uint64_t)__dst);
  uint64_t v34 = v62;
  uint64_t v35 = v64;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v13, v9, v64);
  uint64_t v36 = &v13[*(int *)(v11 + 44)];
  *(void *)uint64_t v36 = 0xC024000000000000;
  v36[8] = 0;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
  sub_217BD7DB0();
  sub_217B7EA0C(v37, v38);
  uint64_t v40 = v39;
  uint64_t v41 = v60;
  sub_217B78A98((uint64_t)v13, v60, &qword_267BAE8C8);
  uint64_t v42 = (void *)(v41 + *(int *)(v63 + 36));
  void *v42 = v40;
  v42[1] = 0;
  sub_217B7FE68((uint64_t)v13, &qword_267BAE8C8);
  sub_217BD7DB0();
  uint64_t v43 = v69;
  sub_217B7EAAC(v69, v44, v45);
  sub_217BD7CF0();
  sub_217B7F88C(&qword_267BAE950, &qword_267BAE8D0, (void (*)(void))sub_217B7F908);
  sub_217B7FD60(&qword_267BAE970, &qword_267BAE8B8);
  long long v46 = v65;
  uint64_t v47 = v70;
  sub_217BD8560();
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v43, v47);
  sub_217B7FE68(v41, &qword_267BAE8D0);
  uint64_t v48 = v73;
  uint64_t v50 = v67;
  uint64_t v49 = v68;
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v67, v46, v68);
  uint64_t v51 = (uint64_t)v61;
  uint64_t v52 = v66;
  sub_217B78A98((uint64_t)v61, v66, &qword_267BAE8E0);
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  uint64_t v54 = v49;
  v53(v46, v50, v49);
  uint64_t v55 = v72;
  sub_217B78A98(v52, v72, &qword_267BAE8E0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE978);
  v53((char *)(v55 + *(int *)(v56 + 48)), v46, v54);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v73 + 8);
  v57(v50, v54);
  sub_217B7FE68(v51, &qword_267BAE8E0);
  v57(v46, v54);
  return sub_217B7FE68(v52, &qword_267BAE8E0);
}

uint64_t sub_217B7E20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v58 = a1;
  uint64_t v71 = a3;
  uint64_t v3 = sub_217BD82D0();
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v68 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9A0);
  MEMORY[0x270FA5388](v59);
  uint64_t v64 = (uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9A8);
  MEMORY[0x270FA5388](v61);
  uint64_t v65 = (uint64_t)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9B0);
  uint64_t v7 = MEMORY[0x270FA5388](v60);
  uint64_t v67 = (uint64_t)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v56 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v66 = (uint64_t)&v56 - v11;
  uint64_t v12 = sub_217BD87E0();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v57 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9B8);
  uint64_t v18 = v17 - 8;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v56 - v22;
  uint64_t v24 = *MEMORY[0x263F19868];
  uint64_t v25 = sub_217BD81C0();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104);
  v26(v16, v24, v25);
  uint64_t v27 = sub_217BD85F0();
  uint64_t v28 = (void (*)(void))MEMORY[0x263F1B7A0];
  sub_217B7FDC4((uint64_t)v16, (uint64_t)v21, MEMORY[0x263F1B7A0]);
  uint64_t v29 = (uint64_t *)&v21[*(int *)(v18 + 60)];
  *uint64_t v29 = v27;
  v29[1] = 2;
  uint64_t v30 = *(int *)(v18 + 64);
  uint64_t v31 = v58;
  *(_WORD *)&v21[v30] = 256;
  uint64_t v32 = v28;
  uint64_t v33 = (uint64_t)v23;
  uint64_t v34 = (uint64_t)v57;
  sub_217B7FE18((uint64_t)v16, v32);
  sub_217B78B3C((uint64_t)v21, v33, &qword_267BAE9B8);
  v26((char *)v34, v24, v25);
  if (!*(void *)(v31 + 64))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_217BDD830;
    *(void *)(v35 + 32) = sub_217BD85F0();
    *(void *)&long long v75 = v35;
    sub_217BD8B80();
  }
  swift_bridgeObjectRetain();
  sub_217BD89E0();
  sub_217BD89F0();
  uint64_t v36 = swift_bridgeObjectRetain();
  MEMORY[0x21D4576B0](v36);
  sub_217BD7E70();
  swift_bridgeObjectRelease();
  double v37 = (void (*)(void))MEMORY[0x263F1B7A0];
  uint64_t v38 = v64;
  sub_217B7FDC4(v34, v64, MEMORY[0x263F1B7A0]);
  uint64_t v39 = v59;
  uint64_t v40 = v38 + *(int *)(v59 + 52);
  long long v41 = v73;
  *(_OWORD *)uint64_t v40 = v72;
  *(_OWORD *)(v40 + 16) = v41;
  *(void *)(v40 + 32) = v74;
  *(_WORD *)(v38 + *(int *)(v39 + 56)) = 256;
  sub_217B7FE18(v34, v37);
  sub_217BD7DB0();
  sub_217B7EA0C(v42, v43);
  sub_217BD88E0();
  sub_217BD7D50();
  uint64_t v44 = v65;
  sub_217B78A98(v38, v65, &qword_267BAE9A0);
  double v45 = (_OWORD *)(v44 + *(int *)(v61 + 36));
  long long v46 = v76;
  *double v45 = v75;
  v45[1] = v46;
  v45[2] = v77;
  sub_217B7FE68(v38, &qword_267BAE9A0);
  uint64_t v47 = v68;
  sub_217BD82C0();
  uint64_t v48 = (uint64_t)v62;
  uint64_t v50 = v69;
  uint64_t v49 = v70;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(&v62[*(int *)(v60 + 36)], v47, v70);
  sub_217B78A98(v44, v48, &qword_267BAE9A8);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v49);
  sub_217B7FE68(v44, &qword_267BAE9A8);
  uint64_t v51 = v66;
  sub_217B78B3C(v48, v66, &qword_267BAE9B0);
  sub_217B78A98(v33, (uint64_t)v21, &qword_267BAE9B8);
  uint64_t v52 = v67;
  sub_217B78A98(v51, v67, &qword_267BAE9B0);
  uint64_t v53 = v71;
  sub_217B78A98((uint64_t)v21, v71, &qword_267BAE9B8);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C8);
  sub_217B78A98(v52, v53 + *(int *)(v54 + 48), &qword_267BAE9B0);
  sub_217B7FE68(v51, &qword_267BAE9B0);
  sub_217B7FE68(v33, &qword_267BAE9B8);
  sub_217B7FE68(v52, &qword_267BAE9B0);
  return sub_217B7FE68((uint64_t)v21, &qword_267BAE9B8);
}

uint64_t sub_217B7E8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE8F8);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  v21[1] = *(void *)(a2 + 24);
  v21[2] = v10;
  char v22 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v23, v12);
  if ((_BYTE)v23) {
    double v13 = 1.4;
  }
  else {
    double v13 = 1.0;
  }
  sub_217BD89D0();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE948);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v9, a1, v18);
  uint64_t v19 = &v9[*(int *)(v7 + 44)];
  *(double *)uint64_t v19 = v13;
  *((double *)v19 + 1) = v13;
  *((void *)v19 + 2) = v15;
  *((void *)v19 + 3) = v17;
  return sub_217B78B3C((uint64_t)v9, a3, &qword_267BAE8F8);
}

void *sub_217B7EA0C(double a1, double a2)
{
  double v3 = a1 - a2;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE898);
  uint64_t result = MEMORY[0x21D4575E0](&v9, v5);
  double v8 = *(double *)(v2 + 48);
  double v7 = *(double *)(v2 + 56);
  if (v8 > v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < 0.0) {
LABEL_8:
  }
    __break(1u);
  return result;
}

uint64_t sub_217B7EAAC@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v4 = v3;
  uint64_t v29 = a1;
  uint64_t v7 = type metadata accessor for PhotoStylePaletteSlider();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_217BD8280();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_217BD7CD0();
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE980);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD82B0();
  sub_217BD7C90();
  sub_217B7FDC4(v4, (uint64_t)v10, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = swift_allocObject();
  sub_217B7F544((uint64_t)v10, v20 + v19);
  uint64_t v21 = (double *)(v20 + ((v19 + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v21 = a2;
  v21[1] = a3;
  sub_217B7FBBC(&qword_267BAE988, MEMORY[0x263F185B8]);
  sub_217B7FBBC(&qword_267BAE328, MEMORY[0x263F18588]);
  sub_217BD8810();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  sub_217B7FDC4(v25[1], (uint64_t)v10, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  uint64_t v22 = swift_allocObject();
  sub_217B7F544((uint64_t)v10, v22 + v19);
  sub_217B7FD60(&qword_267BAE990, &qword_267BAE980);
  uint64_t v23 = v27;
  sub_217BD8800();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v18, v23);
}

BOOL sub_217B7EEB4(double *a1, double *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PhotoStylePaletteSlider();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (double *)((char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (double *)((char *)v25 - v11);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (double *)((char *)v25 - v13);
  double v15 = *a1;
  double v16 = *a2;
  uint64_t v17 = *(void *)(a3 + 32);
  char v18 = *(unsigned char *)(a3 + 40);
  v25[1] = *(void *)(a3 + 24);
  uint64_t v25[2] = v17;
  char v26 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v27, v19);
  if (v27 != 1) {
    return 0;
  }
  double v20 = *(double *)(a3 + 48);
  sub_217B7FDC4(a3, (uint64_t)v14, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  if (v15 == v20)
  {
    sub_217B7FE18((uint64_t)v14, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
    sub_217B7FDC4(a3, (uint64_t)v12, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  }
  else
  {
    double v23 = v14[6];
    sub_217B7FE18((uint64_t)v14, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
    sub_217B7FDC4(a3, (uint64_t)v12, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
    if (v16 == v23)
    {
      sub_217B7FE18((uint64_t)v12, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
      return 1;
    }
  }
  double v21 = v12[7];
  sub_217B7F544((uint64_t)v12, (uint64_t)v9);
  if (v15 == v21)
  {
    sub_217B7FE18((uint64_t)v9, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
    return 0;
  }
  double v24 = v9[7];
  sub_217B7FE18((uint64_t)v9, (void (*)(void))type metadata accessor for PhotoStylePaletteSlider);
  return v16 == v24;
}

void *sub_217B7F0E4(double a1, double a2, uint64_t a3, uint64_t *a4)
{
  v32[0] = sub_217BD7EC0();
  uint64_t v7 = *(void *)(v32[0] - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v32[0]);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v32 - v11;
  uint64_t v13 = a4[3];
  uint64_t v14 = a4[4];
  char v15 = *((unsigned char *)a4 + 40);
  uint64_t v33 = v13;
  uint64_t v34 = v14;
  LOBYTE(v35) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  MEMORY[0x21D4575E0](&v36);
  if ((LOBYTE(v36) & 1) == 0)
  {
    uint64_t v33 = v13;
    uint64_t v34 = v14;
    LOBYTE(v35) = v15;
    LOBYTE(v36) = 1;
    sub_217BD87D0();
    uint64_t v16 = a4[1];
    uint64_t v17 = a4[2];
    uint64_t v33 = *a4;
    uint64_t v34 = v16;
    uint64_t v35 = v17;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE898);
    uint64_t result = MEMORY[0x21D4575E0](&v36, v18);
    double v21 = *((double *)a4 + 6);
    double v20 = *((double *)a4 + 7);
    if (v21 > v20)
    {
LABEL_16:
      __break(1u);
      return result;
    }
    if (v36 >= v21) {
      double v21 = v36;
    }
    uint64_t v22 = a4[10];
    if (v20 >= v36) {
      double v20 = v21;
    }
    uint64_t v33 = a4[9];
    uint64_t v34 = v22;
    double v36 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE998);
    sub_217BD8770();
  }
  if (a1 - a2 >= 0.0) {
    double v23 = a1 - a2;
  }
  else {
    double v23 = 0.0;
  }
  uint64_t result = (void *)sub_217BD7CA0();
  if (v23 < 0.0)
  {
    __break(1u);
    goto LABEL_16;
  }
  double v25 = v24 / v23;
  type metadata accessor for PhotoStylePaletteSlider();
  sub_217B8C170();
  uint64_t v26 = v32[0];
  (*(void (**)(char *, void, void))(v7 + 104))(v10, *MEMORY[0x263F18DD0], v32[0]);
  char v27 = sub_217BD7EB0();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v28(v10, v26);
  v28(v12, v26);
  if (v27) {
    double v25 = -v25;
  }
  uint64_t v29 = a4[10];
  uint64_t v33 = a4[9];
  uint64_t v34 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE998);
  sub_217BD8760();
  double v30 = v25 + v36;
  uint64_t v31 = sub_217BD8970();
  MEMORY[0x270FA5388](v31);
  v32[-2] = a4;
  *(double *)&v32[-1] = v30;
  sub_217BD7E50();
  return (void *)swift_release();
}

uint64_t sub_217B7F3EC(uint64_t result)
{
  double v2 = *(double *)(result + 48);
  double v1 = *(double *)(result + 56);
  if (v2 > v1)
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE898);
    return sub_217BD87D0();
  }
  return result;
}

void *sub_217B7F468(uint64_t a1, uint64_t a2)
{
  LOBYTE(v7) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE1D0);
  sub_217BD87D0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE898);
  uint64_t result = MEMORY[0x21D4575E0](&v7, v3);
  double v6 = *(double *)(a2 + 48);
  double v5 = *(double *)(a2 + 56);
  if (v6 > v5)
  {
    __break(1u);
  }
  else
  {
    if (v7 >= v6) {
      double v6 = v7;
    }
    if (v5 >= v7) {
      double v5 = v6;
    }
    double v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE998);
    return (void *)sub_217BD8770();
  }
  return result;
}

uint64_t sub_217B7F544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoStylePaletteSlider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B7F5A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_1(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_217B7DAC0(a1, v7, a2);
}

BOOL sub_217B7F60C(double *a1, double *a2)
{
  uint64_t v5 = type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_1(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_217B7EEB4(a1, a2, v7);
}

uint64_t sub_217B7F66C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B7E8C0(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_217B7F674()
{
  unint64_t result = qword_267BAE908;
  if (!qword_267BAE908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE910);
    sub_217B7F714();
    sub_217B7FD60(&qword_267BAE928, &qword_267BAE930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE908);
  }
  return result;
}

unint64_t sub_217B7F714()
{
  unint64_t result = qword_267BAE918;
  if (!qword_267BAE918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE920);
    sub_217B7FD60(&qword_267BAE6C8, &qword_267BAE6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE918);
  }
  return result;
}

unint64_t sub_217B7F7B4()
{
  unint64_t result = qword_267BAE938;
  if (!qword_267BAE938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE8F8);
    sub_217B7FD60(&qword_267BAE940, &qword_267BAE948);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE938);
  }
  return result;
}

uint64_t sub_217B7F854(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B7F88C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_217B7F908()
{
  unint64_t result = qword_267BAE958;
  if (!qword_267BAE958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE8C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE8F0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAE8F8);
    sub_217B7F88C(&qword_267BAE900, &qword_267BAE8F0, (void (*)(void))sub_217B7F674);
    sub_217B7F7B4();
    swift_getOpaqueTypeConformance2();
    sub_217B7FD60(&qword_267BAE960, &qword_267BAE968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAE958);
  }
  return result;
}

uint64_t sub_217B7FA2C()
{
  type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217BD7EC0();
    OUTLINED_FUNCTION_3();
    uint64_t v5 = OUTLINED_FUNCTION_5_0();
    v6(v5);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, ((v4 + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

void *sub_217B7FB40(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_4_0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = (uint64_t *)(v1 + v8);
  uint64_t v10 = (double *)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  double v11 = *v10;
  double v12 = v10[1];
  return sub_217B7F0E4(v11, v12, a1, v9);
}

uint64_t sub_217B7FBBC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217BD7EC0();
    OUTLINED_FUNCTION_3();
    uint64_t v5 = OUTLINED_FUNCTION_5_0();
    v6(v5);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, ((v2 + 16) & ~v2) + v4, v2 | 7);
}

void *sub_217B7FD10(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PhotoStylePaletteSlider();
  OUTLINED_FUNCTION_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_217B7F468(a1, v5);
}

uint64_t sub_217B7FD60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217B7FDA4()
{
  return sub_217B7F3EC(*(void *)(v0 + 16));
}

uint64_t sub_217B7FDC4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_12();
  v5(v4);
  return a2;
}

uint64_t sub_217B7FE18(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_5_0();
  v4(v3);
  return a1;
}

uint64_t sub_217B7FE68(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_5_0();
  v4(v3);
  return a1;
}

uint64_t sub_217B7FEB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

double sub_217B7FF8C(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (a4 - a2) / (double)a1 * round(a6 / ((a4 - a2) / (double)a1));
}

void sub_217B7FFBC(double a1, double a2, double a3, double a4)
{
  OUTLINED_FUNCTION_15(*(CGRect *)&a1);
  if (v5 > OUTLINED_FUNCTION_19())
  {
    __break(1u);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_14();
  if (v4 > OUTLINED_FUNCTION_17()) {
LABEL_5:
  }
    __break(1u);
}

void sub_217B80040(double a1, double a2, double a3, double a4)
{
  if (a1 > a3)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (a2 > a4) {
LABEL_5:
  }
    __break(1u);
}

uint64_t PISemanticStyleCast.gradientColors.getter()
{
  uint64_t v2 = sub_217BD85D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v6)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_78;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_78:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    double v42 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v43 = OUTLINED_FUNCTION_0_1();
    v42(v43);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v44;
    uint64_t v45 = OUTLINED_FUNCTION_0_1();
    v42(v45);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v46;
    uint64_t v47 = OUTLINED_FUNCTION_0_1();
    v42(v47);
    v49.n128_u64[0] = 0x3FE2D0E560418937;
    v50.n128_u64[0] = 0x3FE7D70A3D70A3D7;
    v51.n128_u64[0] = 0x3FEB7CED916872B0;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v8)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_83;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_83:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_22();
    *(_OWORD *)(v41 + 16) = xmmword_217BDCBD0;
    uint64_t v53 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v54 = OUTLINED_FUNCTION_0_1();
    v53(v54);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v55;
    uint64_t v56 = OUTLINED_FUNCTION_0_1();
    v53(v56);
    v57.n128_u64[0] = 0x3FE6F9DB22D0E560;
    v58.n128_u64[0] = 0x3FE85A1CAC083127;
    v59.n128_u64[0] = 0x3FEC395810624DD3;
    v60.n128_u64[0] = 1.0;
    uint64_t v61 = v5;
LABEL_84:
    *(void *)(v41 + 40) = MEMORY[0x21D457480](v61, v57, v58, v59, v60);
    goto LABEL_81;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v10)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_86;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_86:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    uint64_t v62 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v63 = OUTLINED_FUNCTION_0_1();
    v62(v63);
    *(void *)(v41 + 32) = MEMORY[0x21D457480](v5, 1.0, 0.91, 0.91, 1.0);
    uint64_t v64 = OUTLINED_FUNCTION_0_1();
    v62(v64);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v65;
    uint64_t v66 = OUTLINED_FUNCTION_0_1();
    v62(v66);
    v49.n128_u64[0] = 0x3FEE1CAC083126E9;
    v50.n128_u64[0] = 0x3FE1B22D0E560419;
    v51.n128_u64[0] = 0x3FE374BC6A7EF9DBLL;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v12)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_88;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_88:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    uint64_t v67 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v68 = OUTLINED_FUNCTION_0_1();
    v67(v68);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v69;
    uint64_t v70 = OUTLINED_FUNCTION_0_1();
    v67(v70);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v71;
    uint64_t v72 = OUTLINED_FUNCTION_0_1();
    v67(v72);
    v49.n128_u64[0] = 0x3FEBBE76C8B43958;
    v50.n128_u64[0] = 0x3FE3126E978D4FDFLL;
    v51.n128_u64[0] = 0x3FCD0E5604189375;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v14)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_90;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_90:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    long long v73 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v74 = OUTLINED_FUNCTION_0_1();
    v73(v74);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v75;
    uint64_t v76 = OUTLINED_FUNCTION_0_1();
    v73(v76);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v77;
    uint64_t v78 = OUTLINED_FUNCTION_0_1();
    v73(v78);
    v50.n128_u64[0] = 0x3FE1D2F1A9FBE76DLL;
    v51.n128_u64[0] = 0x3FCE147AE147AE14;
    v49.n128_u64[0] = 1.0;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v16)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_92;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_92:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD830;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B388], v2);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v79;
    goto LABEL_81;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v18)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_94;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_94:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    double v80 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v81 = OUTLINED_FUNCTION_0_1();
    v80(v81);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v82;
    uint64_t v83 = OUTLINED_FUNCTION_0_1();
    v80(v83);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v84;
    uint64_t v85 = OUTLINED_FUNCTION_0_1();
    v80(v85);
    v49.n128_u64[0] = 0x3FEFDF3B645A1CACLL;
    v50.n128_u64[0] = 0x3FD395810624DD2FLL;
    v51.n128_u64[0] = 0x3FDCDD2F1A9FBE77;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v20)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_83;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1) {
    goto LABEL_83;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v22)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_98;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_98:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    uint64_t v86 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v87 = OUTLINED_FUNCTION_0_1();
    v86(v87);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v88;
    uint64_t v89 = OUTLINED_FUNCTION_0_1();
    v86(v89);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v90;
    uint64_t v91 = OUTLINED_FUNCTION_0_1();
    v86(v91);
    v49.n128_u64[0] = 0x3FEE7EF9DB22D0E5;
    v50.n128_u64[0] = 0x3FE9BA5E353F7CEELL;
    v51.n128_u64[0] = 0x3FE4D4FDF3B645A2;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v24)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_100;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_100:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    uint64_t v92 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v93 = OUTLINED_FUNCTION_0_1();
    v92(v93);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v94;
    uint64_t v95 = OUTLINED_FUNCTION_0_1();
    v92(v95);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 40) = v96;
    uint64_t v97 = OUTLINED_FUNCTION_0_1();
    v92(v97);
    v49.n128_u64[0] = 0x3F889374BC6A7EFALL;
    v50.n128_u64[0] = 0x3FE95810624DD2F2;
    v51.n128_u64[0] = 1.0;
    goto LABEL_79;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v26)
  {
    OUTLINED_FUNCTION_6_0();
    goto LABEL_102;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_102:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
    uint64_t v41 = OUTLINED_FUNCTION_8_0();
    *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
    uint64_t v98 = *(void (**)(uint64_t))(v3 + 104);
    uint64_t v99 = OUTLINED_FUNCTION_0_1();
    v98(v99);
    OUTLINED_FUNCTION_4_1();
    *(void *)(v41 + 32) = v100;
    uint64_t v101 = OUTLINED_FUNCTION_0_1();
    v98(v101);
    *(void *)(v41 + 40) = MEMORY[0x21D457480](v5, 0.953, 0.804, 0.651, 1.0);
    uint64_t v102 = OUTLINED_FUNCTION_0_1();
    v98(v102);
    v50.n128_u64[0] = 0x3FECFDF3B645A1CBLL;
    v51.n128_u64[0] = 0x3FE43126E978D4FELL;
    v48.n128_u64[0] = 1.0;
    uint64_t v52 = v5;
    v49.n128_u64[0] = 0x3FEE7EF9DB22D0E5;
    goto LABEL_80;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v28)
  {
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_1();
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0)
    {
      sub_217BD8B10();
      if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v30)
      {
        OUTLINED_FUNCTION_6_0();
      }
      else
      {
        OUTLINED_FUNCTION_1_1();
        OUTLINED_FUNCTION_5_1();
        swift_bridgeObjectRelease();
        if ((v1 & 1) == 0)
        {
          sub_217BD8B10();
          if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v32)
          {
            OUTLINED_FUNCTION_6_0();
          }
          else
          {
            OUTLINED_FUNCTION_1_1();
            OUTLINED_FUNCTION_5_1();
            swift_bridgeObjectRelease();
            if ((v1 & 1) == 0)
            {
              uint64_t v34 = sub_217BD8B10();
              uint64_t v36 = v35;
              if (v34 == sub_217BD8B10() && v36 == v37)
              {
                OUTLINED_FUNCTION_6_0();
              }
              else
              {
                char v39 = sub_217BD8D80();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v39 & 1) == 0) {
                  return MEMORY[0x263F8EE78];
                }
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
              uint64_t v41 = OUTLINED_FUNCTION_22();
              *(_OWORD *)(v41 + 16) = xmmword_217BDCBD0;
              double v119 = *(void (**)(uint64_t))(v3 + 104);
              uint64_t v120 = OUTLINED_FUNCTION_0_1();
              v119(v120);
              OUTLINED_FUNCTION_21();
              *(void *)(v41 + 32) = v121;
              uint64_t v122 = OUTLINED_FUNCTION_0_1();
              v119(v122);
              v57.n128_u64[0] = 0x3FE55810624DD2F2;
              goto LABEL_109;
            }
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
          uint64_t v41 = OUTLINED_FUNCTION_22();
          *(_OWORD *)(v41 + 16) = xmmword_217BDCBD0;
          uint64_t v115 = *(void (**)(uint64_t))(v3 + 104);
          uint64_t v116 = OUTLINED_FUNCTION_0_1();
          v115(v116);
          OUTLINED_FUNCTION_21();
          *(void *)(v41 + 32) = v117;
          uint64_t v118 = OUTLINED_FUNCTION_0_1();
          v115(v118);
          v57.n128_u64[0] = 0x3FED810624DD2F1BLL;
LABEL_109:
          v60.n128_u64[0] = 1.0;
          uint64_t v61 = v5;
          v58.n128_u64[0] = v57.n128_u64[0];
          v59.n128_u64[0] = v57.n128_u64[0];
          goto LABEL_84;
        }
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
      uint64_t v41 = OUTLINED_FUNCTION_8_0();
      *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
      double v109 = *(void (**)(uint64_t))(v3 + 104);
      uint64_t v110 = OUTLINED_FUNCTION_0_1();
      v109(v110);
      OUTLINED_FUNCTION_4_1();
      *(void *)(v41 + 32) = v111;
      uint64_t v112 = OUTLINED_FUNCTION_0_1();
      v109(v112);
      OUTLINED_FUNCTION_4_1();
      *(void *)(v41 + 40) = v113;
      uint64_t v114 = OUTLINED_FUNCTION_0_1();
      v109(v114);
      v49.n128_u64[0] = 0x3FE3333333333333;
      v50.n128_u64[0] = 0x3FE87AE147AE147BLL;
      v51.n128_u64[0] = 0x3FEC189374BC6A7FLL;
      goto LABEL_79;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE9C0);
  uint64_t v41 = OUTLINED_FUNCTION_8_0();
  *(_OWORD *)(v41 + 16) = xmmword_217BDD930;
  uint64_t v103 = *(void (**)(uint64_t))(v3 + 104);
  uint64_t v104 = OUTLINED_FUNCTION_0_1();
  v103(v104);
  OUTLINED_FUNCTION_4_1();
  *(void *)(v41 + 32) = v105;
  uint64_t v106 = OUTLINED_FUNCTION_0_1();
  v103(v106);
  OUTLINED_FUNCTION_4_1();
  *(void *)(v41 + 40) = v107;
  uint64_t v108 = OUTLINED_FUNCTION_0_1();
  v103(v108);
  v49.n128_u64[0] = 0x3FEE1CAC083126E9;
  v50.n128_u64[0] = 0x3FDBD70A3D70A3D7;
  v51.n128_u64[0] = 0x3FD5D2F1A9FBE76DLL;
LABEL_79:
  v48.n128_u64[0] = 1.0;
  uint64_t v52 = v5;
LABEL_80:
  *(void *)(v41 + 48) = MEMORY[0x21D457480](v52, v49, v50, v51, v48);
LABEL_81:
  uint64_t v124 = v41;
  sub_217BD8B80();
  return v124;
}

void sub_217B80D44(double a1, double a2, double a3, double a4)
{
  OUTLINED_FUNCTION_15(*(CGRect *)&a1);
  if (v5 > OUTLINED_FUNCTION_19())
  {
    __break(1u);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_14();
  if (v4 > OUTLINED_FUNCTION_17()) {
LABEL_5:
  }
    __break(1u);
}

unint64_t PISemanticStyleCast.gradientImageName.getter()
{
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_10_0() && v0 == v3)
  {
    OUTLINED_FUNCTION_13_0();
    return 0xD000000000000012;
  }
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRelease();
  if (v1) {
    return 0xD000000000000012;
  }
  sub_217BD8B10();
  if (v1 == OUTLINED_FUNCTION_10_0() && v0 == v5)
  {
    OUTLINED_FUNCTION_13_0();
    return 0xD000000000000010;
  }
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRelease();
  if (v1) {
    return 0xD000000000000010;
  }
  OUTLINED_FUNCTION_11_0();
  uint64_t v7 = 0x4152475F45534F52;
  sub_217BD8B10();
  if (v2 == OUTLINED_FUNCTION_12_0() && v1 == v9) {
    goto LABEL_82;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v2) {
    return v7;
  }
  uint64_t v7 = 0x4152475F444C4F47;
  sub_217BD8B10();
  if (v2 == OUTLINED_FUNCTION_12_0() && v1 == v11) {
    goto LABEL_82;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v2) {
    return v7;
  }
  uint64_t v7 = 0x52475F5245424D41;
  sub_217BD8B10();
  if (v2 == OUTLINED_FUNCTION_12_0() && v1 == v13)
  {
LABEL_82:
    OUTLINED_FUNCTION_6_0();
    return v7;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if (v2) {
    return v7;
  }
  sub_217BD8B10();
  if ("NEUTRAL_GRADIENT" == (char *)OUTLINED_FUNCTION_9_0() && v15 == 0x52475F5245424D41)
  {
    OUTLINED_FUNCTION_18();
    return 0xD000000000000011;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if ("NEUTRAL_GRADIENT") {
    return 0xD000000000000011;
  }
  sub_217BD8B10();
  if ("NEUTRAL_GRADIENT" == (char *)OUTLINED_FUNCTION_9_0() && v17 == 0x52475F5245424D41)
  {
    OUTLINED_FUNCTION_18();
    return 0xD000000000000010;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if ("NEUTRAL_GRADIENT") {
    return 0xD000000000000010;
  }
  sub_217BD8B10();
  if ("NEUTRAL_GRADIENT" == (char *)OUTLINED_FUNCTION_9_0() && v19 == 0x52475F5245424D41)
  {
    OUTLINED_FUNCTION_18();
    return 0xD000000000000010;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if ("NEUTRAL_GRADIENT") {
    return 0xD000000000000010;
  }
  sub_217BD8B10();
  if ("NEUTRAL_GRADIENT" == (char *)OUTLINED_FUNCTION_9_0() && v21 == 0x52475F5245424D41)
  {
    OUTLINED_FUNCTION_18();
    return 0xD000000000000011;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if ("NEUTRAL_GRADIENT") {
    return 0xD000000000000011;
  }
  sub_217BD8B10();
  if ("NEUTRAL_GRADIENT" == (char *)OUTLINED_FUNCTION_9_0() && v23 == 0x52475F5245424D41)
  {
    OUTLINED_FUNCTION_18();
    return 0xD000000000000011;
  }
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  if ("NEUTRAL_GRADIENT") {
    return 0xD000000000000011;
  }
  uint64_t v7 = 0x52475F5445495551;
  sub_217BD8B10();
  if (v2 == OUTLINED_FUNCTION_12_0() && v1 == v25) {
    goto LABEL_82;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    uint64_t v7 = 0x4152475F595A4F43;
    uint64_t v27 = sub_217BD8B10();
    uint64_t v29 = v28;
    if (v27 == sub_217BD8B10() && v29 == v30)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_0();
      return v7;
    }
    uint64_t v32 = v30;
    char v33 = sub_217BD8D80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_0();
    if ((v33 & 1) == 0)
    {
      sub_217BD8B10();
      if (v32 == OUTLINED_FUNCTION_10_0() && v29 == v34)
      {
        OUTLINED_FUNCTION_13_0();
      }
      else
      {
        OUTLINED_FUNCTION_7_0();
        OUTLINED_FUNCTION_20();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0)
        {
          sub_217BD8B10();
          if (v32 == OUTLINED_FUNCTION_10_0() && v29 == v36)
          {
            OUTLINED_FUNCTION_13_0();
          }
          else
          {
            OUTLINED_FUNCTION_7_0();
            OUTLINED_FUNCTION_20();
            swift_bridgeObjectRelease();
            if ((v32 & 1) == 0)
            {
              uint64_t v38 = sub_217BD8B10();
              uint64_t v40 = v39;
              if (v38 == sub_217BD8B10() && v40 == v41)
              {
                OUTLINED_FUNCTION_13_0();
              }
              else
              {
                char v43 = sub_217BD8D80();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v43 & 1) == 0) {
                  return 0;
                }
              }
              return 0xD000000000000012;
            }
          }
          return 0xD000000000000012;
        }
      }
      return 0xD000000000000011;
    }
  }
  return v7;
}

uint64_t sub_217B812D4()
{
  uint64_t v0 = sub_217BD8B10();
  uint64_t v2 = v1;
  if (v0 == sub_217BD8B10() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_217BD8D80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_217BD8D80();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_217BD8B10();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_217BD8D80();
}

void OUTLINED_FUNCTION_4_1()
{
  JUMPOUT(0x21D457480);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return MEMORY[0x270FA01F0](v0, 2);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_217BD8D80();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_217BD8B10();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_217BD8B10();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_217BD8B10();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return MEMORY[0x270FA01F0](v0, 2);
}

double OUTLINED_FUNCTION_14()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMinY(*(CGRect *)&v5);
}

double OUTLINED_FUNCTION_15(CGRect rect)
{
  return CGRectGetMinX(rect);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_17()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMaxY(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return MEMORY[0x270FA01F0](v0, 2);
}

double OUTLINED_FUNCTION_19()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMaxX(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_21()
{
  JUMPOUT(0x21D457480);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_allocObject();
}

uint64_t sub_217B81608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_217B81640(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217BD8250();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_217BD8260();
}

double sub_217B81738@<D0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = a1[1];
  long long v11 = *a1;
  long long v12 = v4;
  sub_217B959F4((uint64_t)&v11, (uint64_t)v14);
  uint64_t v13 = *((void *)&v12 + 1);
  long long v10 = a1[2];
  sub_217B95A50((uint64_t)v14);
  sub_217B95A84((uint64_t)&v13);
  sub_217B95AB0((uint64_t)&v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF50);
  sub_217B95954();
  sub_217BD8260();
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 48) = v9;
  return result;
}

uint64_t sub_217B81840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_217BD8250();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_217BD8260();
}

uint64_t sub_217B81938@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_217BD8CA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_217B819A4()
{
  return 1;
}

uint64_t sub_217B819AC()
{
  return sub_217B81B58();
}

uint64_t sub_217B819C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  char v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a1, a4);
  return sub_217BD7C70();
}

uint64_t sub_217B81B58()
{
  sub_217BD7D00();
  sub_217B8CFA0();
  return sub_217B94B34((uint64_t)v1);
}

void PhotoStyleValueLabels.body.getter()
{
  OUTLINED_FUNCTION_19_0();
  uint64_t v4 = v1;
  uint64_t v82 = v5;
  uint64_t v6 = sub_217BD87E0();
  uint64_t v7 = OUTLINED_FUNCTION_7_1(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_2();
  uint64_t v81 = v8;
  uint64_t v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  uint64_t v10 = OUTLINED_FUNCTION_7_1(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_2();
  uint64_t v66 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
  uint64_t v13 = OUTLINED_FUNCTION_7_1(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_2();
  uint64_t v79 = v14;
  uint64_t v84 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3_2();
  uint64_t v74 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA28);
  uint64_t v18 = OUTLINED_FUNCTION_7_1(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_6_1();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA30);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_10_1();
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA38);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA40);
  uint64_t v26 = OUTLINED_FUNCTION_7_1(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_5();
  uint64_t v29 = v28 - v27;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA48);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_4_2();
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA50);
  OUTLINED_FUNCTION_1_2();
  uint64_t v70 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_3_2();
  uint64_t v69 = v33;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA58);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_3_2();
  uint64_t v76 = v35;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA60);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_3_2();
  uint64_t v78 = v37;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA68);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_3_2();
  uint64_t v77 = v39;
  unsigned __int8 v40 = sub_217BD8340();
  unsigned __int8 v41 = sub_217BD8360();
  char v42 = sub_217BD8350();
  sub_217BD8350();
  if (sub_217BD8350() != v40) {
    char v42 = sub_217BD8350();
  }
  sub_217BD8350();
  if (sub_217BD8350() != v41) {
    char v42 = sub_217BD8350();
  }
  *uint64_t v2 = v42;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA70);
  sub_217B824EC((uint64_t)&v2[*(int *)(v43 + 44)]);
  char v44 = *(unsigned char *)(v4 + 25);
  sub_217B78A98((uint64_t)v2, v0, &qword_267BAEA28);
  *(unsigned char *)(v0 + *(int *)(v19 + 52)) = v44;
  sub_217B7FE68((uint64_t)v2, &qword_267BAEA28);
  sub_217BD7D80();
  sub_217BD8960();
  uint64_t v45 = sub_217BD7DA0();
  swift_release();
  swift_release();
  sub_217B78A98(v0, v24, &qword_267BAEA30);
  *(void *)(v24 + *(int *)(v83 + 36)) = v45;
  sub_217B7FE68(v0, &qword_267BAEA30);
  sub_217BD88E0();
  sub_217B82BB8(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v29, 0.0, 1, 28.0, 0);
  sub_217B7FE68(v24, &qword_267BAEA38);
  type metadata accessor for PhotoStyleValueLabels(0);
  sub_217B8C3CC(v74);
  id v46 = (id)PXMonospacedNumberFontWithSizeAndWeight();
  uint64_t v47 = sub_217BD83E0();
  sub_217B8DB1C(v74, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t KeyPath = swift_getKeyPath();
  sub_217B78A98(v29, v3, &qword_267BAEA40);
  __n128 v49 = (uint64_t *)(v3 + *(int *)(v68 + 36));
  *__n128 v49 = KeyPath;
  v49[1] = v47;
  sub_217B7FE68(v29, &qword_267BAEA40);
  sub_217BD83C0();
  sub_217B8D910();
  sub_217BD84B0();
  sub_217B7FE68(v3, &qword_267BAEA48);
  uint64_t v50 = swift_getKeyPath();
  sub_217BD88B0();
  uint64_t v51 = sub_217BD88D0();
  __swift_storeEnumTagSinglePayload(v79, 0, 1, v51);
  uint64_t v52 = (uint64_t *)(v76 + *(int *)(v67 + 36));
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAB8);
  sub_217B78A98(v79, (uint64_t)v52 + *(int *)(v53 + 28), &qword_267BAEA20);
  *uint64_t v52 = v50;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v76, v69, v72);
  sub_217B7FE68(v79, &qword_267BAEA20);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v72);
  sub_217B8C3CC(v74);
  sub_217B8DAC8(v74 + *(int *)(v84 + 24), v66, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_217B8DB1C(v74, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v54 = *MEMORY[0x263F19860];
  unsigned int v80 = *MEMORY[0x263F19860];
  uint64_t v55 = sub_217BD81C0();
  OUTLINED_FUNCTION_3();
  __n128 v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104);
  v57(v81, v54, v55);
  uint64_t v58 = v78 + *(int *)(v71 + 36);
  sub_217B8DAC8(v66, v58, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  uint64_t v59 = v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAC0) + 36);
  __n128 v60 = (void (*)(void))MEMORY[0x263F1B7A0];
  sub_217B8DAC8(v81, v59, MEMORY[0x263F1B7A0]);
  sub_217B78A98(v76, v78, &qword_267BAEA58);
  long long v73 = (void (*)(void))MEMORY[0x263F1B7A0];
  sub_217B8DB1C(v81, MEMORY[0x263F1B7A0]);
  sub_217B8DB1C(v66, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_217B7FE68(v76, &qword_267BAEA58);
  sub_217B8C3CC(v74);
  uint64_t v61 = v74 + *(int *)(v84 + 32);
  uint64_t v62 = *(void *)v61;
  char v63 = *(unsigned char *)(v61 + 8);
  sub_217B8DB1C(v74, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  v57(v81, v80, v55);
  uint64_t v64 = v77 + *(int *)(v75 + 36);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAC8);
  sub_217B8DAC8(v81, v64 + *(int *)(v65 + 36), v60);
  *(void *)uint64_t v64 = v62;
  *(unsigned char *)(v64 + 8) = v63;
  *(void *)(v64 + *(int *)(v65 + 40)) = 0x3FA999999999999ALL;
  sub_217B78A98(v78, v77, &qword_267BAEA60);
  sub_217B8DB1C(v81, v73);
  sub_217B7FE68(v78, &qword_267BAEA60);
  sub_217B9608C(v77, v82, &qword_267BAEA68);
  OUTLINED_FUNCTION_20_0();
}

uint64_t type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAEB30);
}

uint64_t type metadata accessor for PhotoStyleValueLabels.Configuration(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAEB20);
}

uint64_t sub_217B824EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF90);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v34 = (uint64_t)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v33 = (uint64_t)&v30 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v31 = (uint64_t)&v30 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v30 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v30 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v30 - v20;
  uint64_t v32 = (uint64_t)&v30 - v20;
  type metadata accessor for PhotoStyleValueLabels(0);
  sub_217B8C3CC((uint64_t)v6);
  sub_217B82898(v6, (uint64_t)v19);
  sub_217B8DB1C((uint64_t)v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B9608C((uint64_t)v19, (uint64_t)v21, &qword_267BAEF90);
  sub_217B8C3CC((uint64_t)v4);
  sub_217B8DAC8((uint64_t)v4, (uint64_t)v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  *uint64_t v6 = 1;
  sub_217B8DB1C((uint64_t)v4, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B82898(v6, (uint64_t)v16);
  sub_217B8DB1C((uint64_t)v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B9608C((uint64_t)v16, (uint64_t)v19, &qword_267BAEF90);
  sub_217B8C3CC((uint64_t)v4);
  sub_217B8DAC8((uint64_t)v4, (uint64_t)v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  *uint64_t v6 = 2;
  sub_217B8DB1C((uint64_t)v4, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v22 = v31;
  sub_217B82898(v6, v31);
  sub_217B8DB1C((uint64_t)v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B9608C(v22, (uint64_t)v16, &qword_267BAEF90);
  uint64_t v23 = v32;
  uint64_t v24 = v22;
  sub_217B78A98(v32, v22, &qword_267BAEF90);
  uint64_t v25 = v33;
  sub_217B78A98((uint64_t)v19, v33, &qword_267BAEF90);
  uint64_t v26 = v34;
  sub_217B78A98((uint64_t)v16, v34, &qword_267BAEF90);
  uint64_t v27 = v35;
  sub_217B78A98(v24, v35, &qword_267BAEF90);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF98);
  sub_217B78A98(v25, v27 + *(int *)(v28 + 48), &qword_267BAEF90);
  sub_217B78A98(v26, v27 + *(int *)(v28 + 64), &qword_267BAEF90);
  sub_217B7FE68((uint64_t)v16, &qword_267BAEF90);
  sub_217B7FE68((uint64_t)v19, &qword_267BAEF90);
  sub_217B7FE68(v23, &qword_267BAEF90);
  sub_217B7FE68(v26, &qword_267BAEF90);
  sub_217B7FE68(v25, &qword_267BAEF90);
  return sub_217B7FE68(v24, &qword_267BAEF90);
}

uint64_t sub_217B82898@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v38 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFA0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFA8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFB0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFB8);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v20 = *a1;
  uint64_t v21 = sub_217BD8140();
  uint64_t v22 = 0x4000000000000000;
  if (!v20) {
    uint64_t v22 = 0x4020000000000000;
  }
  *(void *)uint64_t v7 = v21;
  *((void *)v7 + 1) = v22;
  unsigned char v7[16] = 0;
  if (v20) {
    double v23 = 0.5;
  }
  else {
    double v23 = 1.0;
  }
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFC0);
  sub_217B82E1C(v3, a1, (uint64_t)&v7[*(int *)(v24 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  sub_217B78A98((uint64_t)v7, (uint64_t)v11, &qword_267BAEFA0);
  uint64_t v26 = &v11[*(int *)(v9 + 44)];
  *(void *)uint64_t v26 = KeyPath;
  *((double *)v26 + 1) = v23;
  sub_217B7FE68((uint64_t)v7, &qword_267BAEFA0);
  sub_217B78A98((uint64_t)v11, (uint64_t)v15, &qword_267BAEFA8);
  uint64_t v27 = &v15[*(int *)(v13 + 44)];
  *(void *)uint64_t v27 = 0;
  *((_WORD *)v27 + 4) = 1;
  sub_217B7FE68((uint64_t)v11, &qword_267BAEFA8);
  if (*a1) {
    uint64_t v28 = 0x4030000000000000;
  }
  else {
    uint64_t v28 = 0x4036000000000000;
  }
  char v29 = sub_217BD8380();
  sub_217B78A98((uint64_t)v15, (uint64_t)v19, &qword_267BAEFB0);
  uint64_t v30 = &v19[*(int *)(v17 + 44)];
  *uint64_t v30 = v29;
  *((void *)v30 + 1) = 0x4018000000000000;
  *((void *)v30 + 2) = v28;
  *(_OWORD *)(v30 + 24) = xmmword_217BDDB30;
  v30[40] = 0;
  sub_217B7FE68((uint64_t)v15, &qword_267BAEFB0);
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF90);
  uint64_t v33 = v38;
  uint64_t v34 = (uint64_t *)(v38 + *(int *)(v32 + 36));
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAED78);
  sub_217B8DAC8((uint64_t)a1, (uint64_t)v34 + *(int *)(v35 + 28), (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  *uint64_t v34 = v31;
  return sub_217B9608C((uint64_t)v19, v33, &qword_267BAEFB8);
}

void *sub_217B82BB8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_217BD8C10();
    double v23 = (void *)sub_217BD8330();
    sub_217BD7A90();
  }
  sub_217BD7FF0();
  sub_217B78A98(v13, a9, &qword_267BAEA38);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA40);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t type metadata accessor for PhotoStyleValueLabels(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAEB08);
}

uint64_t sub_217B82D78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
  MEMORY[0x270FA5388](v2 - 8);
  sub_217B78A98(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_267BAEA20);
  return sub_217BD8060();
}

BOOL sub_217B82E0C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_217B82E1C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v102 = a3;
  uint64_t v92 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  MEMORY[0x270FA5388](v92);
  uint64_t v94 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFC8);
  MEMORY[0x270FA5388](v96);
  uint64_t v93 = (uint64_t)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFD0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v87 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFD8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v95 = (uint64_t)&v87 - v16;
  uint64_t v17 = type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  int v20 = (uint64_t *)((char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v90 = (uint64_t)&v87 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v89 = (uint64_t)&v87 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v87 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (uint64_t *)((char *)&v87 - v29);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (uint64_t *)((char *)&v87 - v31);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFE0);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  uint64_t v101 = (uint64_t)&v87 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v87 - v36;
  uint64_t v99 = (uint64_t)&v87 - v36;
  uint64_t v100 = (void *)a1;
  char v38 = *(unsigned char *)(a1 + 24);
  uint64_t v97 = v11;
  uint64_t v98 = v15;
  if (v38)
  {
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFF0);
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 1, 1, v39);
    unsigned __int8 v40 = v100;
    uint64_t v41 = v102;
  }
  else
  {
    uint64_t v87 = v27;
    uint64_t v88 = v9;
    if (qword_267BADEB0 != -1) {
      swift_once();
    }
    uint64_t v42 = qword_267BB0EF8;
    uint64_t v43 = qword_267BB0F00;
    unsigned __int8 v40 = v100;
    uint64_t v44 = *v100;
    void v32[2] = 0;
    v32[3] = 0;
    uint64_t v45 = (uint64_t *)((char *)v32 + *(int *)(v17 + 28));
    *uint64_t v45 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    swift_storeEnumTagMultiPayload();
    uint64_t v46 = v17;
    uint64_t v47 = (uint64_t *)((char *)v32 + *(int *)(v17 + 32));
    *uint64_t v47 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    swift_storeEnumTagMultiPayload();
    *uint64_t v32 = v42;
    v32[1] = v43;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    void v32[2] = 0;
    v32[3] = 0;
    v32[4] = v44;
    if (qword_267BADEB8 != -1) {
      swift_once();
    }
    uint64_t v48 = qword_267BB0F08;
    uint64_t v49 = qword_267BB0F10;
    uint64_t v50 = v40[1];
    v30[2] = 0;
    v30[3] = 0;
    uint64_t v51 = (uint64_t *)((char *)v30 + *(int *)(v46 + 28));
    *uint64_t v51 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    uint64_t v52 = (uint64_t *)((char *)v30 + *(int *)(v46 + 32));
    *uint64_t v52 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    *uint64_t v30 = v48;
    v30[1] = v49;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v30[2] = 0;
    v30[3] = 0;
    v30[4] = v50;
    uint64_t v53 = (uint64_t)v87;
    sub_217B8DAC8((uint64_t)v32, (uint64_t)v87, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v54 = v89;
    sub_217B8DAC8((uint64_t)v30, v89, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v55 = v101;
    sub_217B8DAC8(v53, v101, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFE8);
    sub_217B8DAC8(v54, v55 + *(int *)(v56 + 48), (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_217B8DB1C((uint64_t)v30, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_217B8DB1C((uint64_t)v32, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_217B8DB1C(v54, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_217B8DB1C(v53, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFF0);
    __swift_storeEnumTagSinglePayload(v55, 0, 1, v57);
    sub_217B9608C(v55, v99, &qword_267BAEFE0);
    uint64_t v41 = v102;
    uint64_t v9 = v88;
    uint64_t v11 = v97;
    uint64_t v17 = v46;
  }
  if (*((unsigned char *)v40 + 25))
  {
    uint64_t v58 = 1;
    uint64_t v59 = v95;
    uint64_t v60 = v17;
  }
  else
  {
    if (qword_267BADEC0 != -1) {
      swift_once();
    }
    uint64_t v62 = qword_267BB0F18;
    uint64_t v61 = qword_267BB0F20;
    if (*v91 == 2) {
      unint64_t v63 = 0xD000000000000012;
    }
    else {
      unint64_t v63 = 0;
    }
    if (*v91 == 2) {
      unint64_t v64 = 0x8000000217BEA7C0;
    }
    else {
      unint64_t v64 = 0;
    }
    unsigned __int8 v40 = v100;
    uint64_t v65 = v100[2];
    v20[2] = 0;
    v20[3] = 0;
    uint64_t v66 = (uint64_t *)((char *)v20 + *(int *)(v17 + 28));
    *uint64_t v66 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    swift_storeEnumTagMultiPayload();
    uint64_t v67 = (uint64_t *)((char *)v20 + *(int *)(v17 + 32));
    *uint64_t v67 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    swift_storeEnumTagMultiPayload();
    *int v20 = v62;
    v20[1] = v61;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20[2] = v63;
    v20[3] = v64;
    v20[4] = v65;
    uint64_t v68 = v90;
    sub_217B95B2C((uint64_t)v20, v90, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v59 = v95;
    sub_217B95B2C(v68, v95, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    uint64_t v58 = 0;
    uint64_t v11 = v97;
    uint64_t v60 = v17;
    uint64_t v41 = v102;
  }
  uint64_t v69 = v41;
  uint64_t v70 = 1;
  __swift_storeEnumTagSinglePayload(v59, v58, 1, v60);
  uint64_t v71 = v96;
  if ((*((unsigned char *)v40 + 26) & 1) == 0)
  {
    uint64_t v73 = v40[4];
    uint64_t v72 = v40[5];
    uint64_t v74 = v94;
    *uint64_t v94 = *((unsigned char *)v40 + 27);
    v74[1] = v73;
    v74[2] = v72;
    v74[3] = 0x4018000000000000;
    uint64_t v103 = 0;
    swift_retain();
    sub_217BD8750();
    uint64_t v75 = v105;
    v74[4] = v104;
    v74[5] = v75;
    uint64_t v76 = v92;
    uint64_t v77 = (void *)((char *)v74 + *(int *)(v92 + 32));
    *uint64_t v77 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    swift_storeEnumTagMultiPayload();
    uint64_t v78 = (void *)((char *)v74 + *(int *)(v76 + 36));
    *uint64_t v78 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    swift_storeEnumTagMultiPayload();
    uint64_t v79 = v93;
    sub_217B8DAC8((uint64_t)v74, v93, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
    *(void *)(v79 + *(int *)(v71 + 36)) = 0x3FF0000000000000;
    sub_217B8DB1C((uint64_t)v74, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
    sub_217B9608C(v79, (uint64_t)v11, &qword_267BAEFC8);
    uint64_t v70 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, v70, 1, v71);
  uint64_t v80 = v99;
  uint64_t v81 = v101;
  sub_217B78A98(v99, v101, &qword_267BAEFE0);
  uint64_t v82 = v59;
  uint64_t v83 = v59;
  uint64_t v84 = (uint64_t)v98;
  sub_217B78A98(v82, (uint64_t)v98, &qword_267BAEFD8);
  sub_217B78A98((uint64_t)v11, (uint64_t)v9, &qword_267BAEFD0);
  sub_217B78A98(v81, v69, &qword_267BAEFE0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEFF8);
  sub_217B78A98(v84, v69 + *(int *)(v85 + 48), &qword_267BAEFD8);
  sub_217B78A98((uint64_t)v9, v69 + *(int *)(v85 + 64), &qword_267BAEFD0);
  sub_217B7FE68((uint64_t)v11, &qword_267BAEFD0);
  sub_217B7FE68(v83, &qword_267BAEFD8);
  sub_217B7FE68(v80, &qword_267BAEFE0);
  sub_217B7FE68((uint64_t)v9, &qword_267BAEFD0);
  sub_217B7FE68(v84, &qword_267BAEFD8);
  return sub_217B7FE68(v81, &qword_267BAEFE0);
}

void sub_217B837B0(uint64_t a1)
{
}

void sub_217B837D8(uint64_t a1)
{
}

void sub_217B83800(uint64_t a1)
{
}

void sub_217B83828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v7 = (void *)sub_217BD8AE0();
  id v8 = PELocalizedString(v7);

  uint64_t v9 = sub_217BD8B10();
  uint64_t v11 = v10;

  *a4 = v9;
  *a5 = v11;
}

uint64_t sub_217B838A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_217BD8190();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_217BD82F0();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEC0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEC8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEED0);
  uint64_t v25 = *(void *)(v13 - 8);
  uint64_t v26 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEED8);
  MEMORY[0x270FA5388](v29);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_217BD8140();
  *((void *)v9 + 1) = 0x4000000000000000;
  v9[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEE0);
  sub_217B83CDC((uint64_t *)v2, (uint64_t)&v9[*(int *)(v18 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  sub_217B78A98((uint64_t)v9, (uint64_t)v12, &qword_267BAEEC0);
  int v20 = &v12[*(int *)(v10 + 36)];
  *(void *)int v20 = KeyPath;
  *((void *)v20 + 1) = 1;
  v20[16] = 0;
  sub_217B7FE68((uint64_t)v9, &qword_267BAEEC0);
  sub_217BD82E0();
  unint64_t v21 = sub_217B95634();
  sub_217BD8540();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  sub_217B7FE68((uint64_t)v12, &qword_267BAEEC8);
  uint64_t v22 = *(void *)(v2 + 8);
  uint64_t v33 = *(void *)v2;
  uint64_t v34 = v22;
  uint64_t v31 = v10;
  unint64_t v32 = v21;
  swift_getOpaqueTypeConformance2();
  sub_217B95300();
  uint64_t v23 = v26;
  sub_217BD8520();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v23);
  sub_217BD8180();
  sub_217BD8170();
  uint64_t v33 = sub_217B85110(*(double *)(v2 + 32));
  sub_217BD8160();
  sub_217BD8170();
  sub_217BD81B0();
  sub_217BD7EE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_217B7FE68((uint64_t)v17, &qword_267BAEED8);
}

uint64_t sub_217B83CDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF08);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF10);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B83FC4(a1, (uint64_t)v36);
  uint64_t v34 = v36[1];
  uint64_t v35 = v36[0];
  uint64_t v32 = v36[3];
  uint64_t v33 = v36[2];
  uint64_t v31 = v36[4];
  int v30 = v37;
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_217B8C3CC((uint64_t)v17);
  uint64_t v18 = *((void *)v17 + 1);
  swift_retain();
  sub_217B8DB1C((uint64_t)v17, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v19 = sub_217BD81D0();
  uint64_t v20 = sub_217BD8130();
  sub_217B843B0((uint64_t)a1, (uint64_t)v7);
  unint64_t v21 = (uint64_t *)&v7[*(int *)(v5 + 44)];
  *unint64_t v21 = v19;
  v21[1] = v20;
  sub_217B78A98((uint64_t)v7, (uint64_t)v12 + *(int *)(v9 + 44), &qword_267BAEF08);
  *uint64_t v12 = -100;
  sub_217B7FE68((uint64_t)v7, &qword_267BAEF08);
  uint64_t v29 = v14;
  sub_217B9608C((uint64_t)v12, (uint64_t)v14, &qword_267BAEF10);
  sub_217B78A98((uint64_t)v14, (uint64_t)v12, &qword_267BAEF10);
  uint64_t v23 = v34;
  uint64_t v22 = v35;
  *(void *)a2 = v35;
  *(void *)(a2 + 8) = v23;
  uint64_t v24 = v32;
  LOBYTE(v9) = v33;
  *(void *)(a2 + 16) = v33;
  *(void *)(a2 + 24) = v24;
  uint64_t v25 = v31;
  *(void *)(a2 + 32) = v31;
  LOBYTE(v14) = v30;
  *(unsigned char *)(a2 + 40) = v30;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = 1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF18);
  sub_217B78A98((uint64_t)v12, a2 + *(int *)(v26 + 48), &qword_267BAEF10);
  sub_217B956F8(v22, v23, v9, v24, v25, (char)v14);
  swift_retain();
  sub_217B7FE68((uint64_t)v29, &qword_267BAEF10);
  sub_217B7FE68((uint64_t)v12, &qword_267BAEF10);
  sub_217B95758(v22, v23, v9, v24, v25, (char)v14);
  return swift_release();
}

double sub_217B83FC4@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = sub_217BD7EC0();
  uint64_t v4 = *(void *)(v33 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = sub_217BD86C0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF70);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1[3])
  {
    uint64_t v32 = a2;
    swift_bridgeObjectRetain();
    sub_217BD86B0();
    sub_217BD81E0();
    uint64_t v17 = sub_217BD81F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v17);
    sub_217BD86D0();
    swift_release();
    sub_217B7FE68((uint64_t)v16, &qword_267BAEF70);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
    uint64_t v18 = sub_217BD86E0();
    a2 = v32;
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
    sub_217B8C170();
    uint64_t v19 = v33;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F18DC8], v33);
    char v20 = sub_217BD7EB0();
    unint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
    v21(v7, v19);
    v21(v9, v19);
    uint64_t v22 = 0x4008000000000000;
    uint64_t v34 = v18;
    if ((v20 & 1) == 0) {
      uint64_t v22 = 0;
    }
    long long v35 = xmmword_217BDDB40;
    uint64_t v36 = v22;
    uint64_t v37 = 0;
    char v38 = 0;
  }
  else
  {
    uint64_t v23 = *a1;
    uint64_t v24 = a1[1];
    *(void *)&long long v39 = v23;
    *((void *)&v39 + 1) = v24;
    sub_217B95300();
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_217BD8460();
    *(void *)&long long v35 = v25;
    *((void *)&v35 + 1) = v26 & 1;
    uint64_t v36 = v27;
    uint64_t v37 = 0;
    char v38 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF78);
  sub_217B94DC8(&qword_267BAEF80, &qword_267BAEF78, (void (*)(void))sub_217B77124);
  sub_217BD8260();
  double result = *(double *)&v39;
  long long v29 = v40;
  uint64_t v30 = v41;
  char v31 = v42;
  *(_OWORD *)a2 = v39;
  *(_OWORD *)(a2 + 16) = v29;
  *(void *)(a2 + 32) = v30;
  *(unsigned char *)(a2 + 40) = v31;
  return result;
}

uint64_t sub_217B843B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v36 = a2;
  uint64_t v3 = sub_217BD7EC0();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v33 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF20);
  uint64_t v8 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF28);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF30);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_217BD8140();
  sub_217B847F8(a1, (uint64_t)v41);
  v42[200] = 0;
  memcpy(&v42[7], v41, 0xC0uLL);
  uint64_t v37 = v19;
  uint64_t v38 = 0;
  char v39 = 0;
  memcpy(v40, v42, sizeof(v40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF38);
  sub_217B7FD60(&qword_267BAEF40, &qword_267BAEF38);
  sub_217BD84F0();
  sub_217B957B8((uint64_t)v41);
  uint64_t v20 = v32;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v32);
  *(_WORD *)&v14[*(int *)(v12 + 44)] = 1;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_217B8C3CC((uint64_t)v7);
  uint64_t v21 = *((void *)v7 + 1);
  swift_retain();
  sub_217B8DB1C((uint64_t)v7, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B78A98((uint64_t)v14, (uint64_t)v18, &qword_267BAEF28);
  *(void *)&v18[*(int *)(v16 + 44)] = v21;
  sub_217B7FE68((uint64_t)v14, &qword_267BAEF28);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v33;
  uint64_t v23 = v34;
  uint64_t v25 = v35;
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, *MEMORY[0x263F18DC8], v35);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF48);
  uint64_t v27 = v36;
  uint64_t v28 = (uint64_t *)(v36 + *(int *)(v26 + 36));
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BADF28);
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))((char *)v28 + *(int *)(v29 + 28), v24, v25);
  *uint64_t v28 = KeyPath;
  sub_217B78A98((uint64_t)v18, v27, &qword_267BAEF30);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  return sub_217B7FE68((uint64_t)v18, &qword_267BAEF30);
}

uint64_t sub_217B847F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = sub_217BD8020();
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_217BD8190();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v84 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD81A0();
  uint64_t v86 = sub_217BD8450();
  uint64_t v85 = v13;
  LODWORD(v82) = v14;
  uint64_t v16 = v15;
  uint64_t v81 = sub_217B85110(*(double *)(a1 + 32));
  int v83 = sub_217BD8390();
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_217B8C3CC((uint64_t)v12);
  sub_217B8DB1C((uint64_t)v12, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217BD7C60();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_217B8C3CC((uint64_t)v12);
  int v25 = v12[*(int *)(v10 + 44)];
  sub_217B8DB1C((uint64_t)v12, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v87 = v16;
  if (v25 != 1)
  {
    sub_217BD8180();
    sub_217BD8170();
    double v45 = *(double *)(a1 + 32);
    uint64_t result = sub_217B85164(v45);
    if ((result & 0x8000000000000000) == 0 || (v29 = __OFSUB__(0, result), uint64_t result = -result, !v29))
    {
      uint64_t v106 = result;
      sub_217BD8160();
      sub_217BD8170();
      sub_217BD81B0();
      uint64_t v46 = sub_217BD8450();
      uint64_t v48 = v47;
      *(void *)&long long v88 = v46;
      *((void *)&v88 + 1) = v47;
      char v50 = v49 & 1;
      LOBYTE(v89) = v49 & 1;
      uint64_t v90 = v51;
      uint64_t v91 = 0;
      double v92 = v45;
      sub_217B95748(v46, v47, v49 & 1);
      swift_bridgeObjectRetain();
      sub_217B81738(&v88, (uint64_t)&v106);
      uint64_t v43 = v106;
      uint64_t v80 = v107;
      uint64_t v79 = v108;
      uint64_t v78 = v109;
      uint64_t v77 = v110;
      uint64_t v76 = v111;
      int v44 = v112;
      sub_217B957A8(v46, v48, v50);
      swift_bridgeObjectRelease();
      sub_217B957A8(v46, v48, v50);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  sub_217BD8180();
  sub_217BD8170();
  double v26 = *(double *)(a1 + 32);
  uint64_t result = sub_217B85164(v26);
  uint64_t v28 = a1;
  if (result < 0)
  {
    BOOL v29 = __OFSUB__(0, result);
    uint64_t result = -result;
    if (v29)
    {
      __break(1u);
      goto LABEL_15;
    }
  }
  uint64_t v106 = result;
  sub_217BD8160();
  sub_217BD8170();
  sub_217BD81B0();
  uint64_t v30 = sub_217BD8450();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  sub_217B85164(v26);
  uint64_t v35 = v78;
  sub_217BD8010();
  uint64_t v36 = sub_217BD8430();
  uint64_t v75 = v28;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41 & 1;
  sub_217B957A8(v30, v32, v34);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v35, v80);
  *(void *)&long long v88 = v36;
  *((void *)&v88 + 1) = v38;
  a1 = v75;
  uint64_t v89 = v42;
  uint64_t v90 = v40;
  double v92 = 0.0;
  uint64_t v91 = 0;
  char v93 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEF50);
  sub_217B95954();
  sub_217BD8260();
  uint64_t v43 = v106;
  uint64_t v80 = v107;
  uint64_t v79 = v108;
  uint64_t v78 = v109;
  uint64_t v77 = v110;
  uint64_t v76 = v111;
  int v44 = v112;
LABEL_8:
  LODWORD(v75) = v44;
  sub_217BD8180();
  sub_217BD8170();
  double v52 = *(double *)(a1 + 32);
  uint64_t v53 = sub_217B85110(v52) % 10;
  if (v53 < 0) {
    uint64_t v53 = -v53;
  }
  uint64_t v105 = v53;
  char v54 = v82 & 1;
  if (((v81 > 0) | (unint64_t)(v81 >> 63)) == 0xFFFFFFFFFFFFFFFFLL) {
    double v55 = 1.0;
  }
  else {
    double v55 = 0.0;
  }
  sub_217BD8160();
  sub_217BD8170();
  sub_217BD81B0();
  uint64_t v56 = sub_217BD8450();
  uint64_t v58 = v57;
  uint64_t v82 = v59;
  char v95 = v54;
  char v94 = v44;
  char v61 = v60 & 1;
  LODWORD(v84) = v60 & 1;
  char v104 = v54;
  char v62 = v54;
  char v101 = 0;
  char v99 = v44;
  char v97 = v61;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v103;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v103[3];
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v102;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v102[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v100;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v100[3];
  int v63 = *(_DWORD *)v98;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v98[3];
  *(_DWORD *)(a2 + 137) = v63;
  LOBYTE(v63) = v97;
  int v64 = *(_DWORD *)v96;
  *(_DWORD *)(a2 + 164) = *(_DWORD *)&v96[3];
  *(_DWORD *)(a2 + 161) = v64;
  uint64_t v65 = v86;
  uint64_t v66 = v85;
  *(void *)a2 = v86;
  *(void *)(a2 + 8) = v66;
  *(unsigned char *)(a2 + 16) = v54;
  *(void *)(a2 + 24) = v87;
  *(double *)(a2 + 32) = v55;
  *(unsigned char *)(a2 + 40) = v83;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v20;
  *(void *)(a2 + 64) = v22;
  *(void *)(a2 + 72) = v24;
  *(unsigned char *)(a2 + 80) = 0;
  uint64_t v67 = v80;
  *(void *)(a2 + 88) = v43;
  *(void *)(a2 + 96) = v67;
  char v68 = v79;
  uint64_t v69 = (uint64_t)v78;
  *(void *)(a2 + 104) = v79;
  *(void *)(a2 + 112) = v69;
  uint64_t v70 = v77;
  uint64_t v71 = v76;
  *(void *)(a2 + 120) = v77;
  *(void *)(a2 + 128) = v71;
  *(unsigned char *)(a2 + 136) = v44;
  *(void *)(a2 + 144) = v56;
  *(void *)(a2 + 152) = v57;
  uint64_t v72 = v56;
  *(unsigned char *)(a2 + 160) = v63;
  *(void *)(a2 + 168) = v59;
  *(void *)(a2 + 176) = 0;
  *(double *)(a2 + 184) = v52;
  sub_217B95748(v65, v66, v62);
  swift_bridgeObjectRetain();
  sub_217B958FC(v43, v67, v68, v69, v70, v71, v75);
  char v73 = (char)v84;
  sub_217B95748(v72, v58, (char)v84);
  swift_bridgeObjectRetain();
  sub_217B957A8(v72, v58, v73);
  swift_bridgeObjectRelease();
  sub_217B9588C(v43, v67, v68, v69, v70, v71, v94);
  sub_217B957A8(v86, v85, v95);
  return swift_bridgeObjectRelease();
}

uint64_t sub_217B85110(double a1)
{
  double v1 = round(a1 * 100.0);
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18) {
    return (uint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_217B85164(double a1)
{
  double v1 = round(a1 * 100.0);
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18) {
    return (uint64_t)v1 / 10;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_217B851C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDA0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDA8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B85314((uint64_t)v5, 0.0);
  sub_217B78A98((uint64_t)v5, (uint64_t)v8, &qword_267BAEDA0);
  sub_217B7FE68((uint64_t)v5, &qword_267BAEDA0);
  uint64_t v9 = sub_217BD88E0();
  uint64_t v11 = v10;
  uint64_t v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDB0) + 36);
  sub_217B85314(v12, *(double *)(v1 + 24));
  uint64_t v13 = (uint64_t *)(v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDB8) + 36));
  *uint64_t v13 = v9;
  v13[1] = v11;
  return sub_217B9608C((uint64_t)v8, a1, &qword_267BAEDA8);
}

uint64_t sub_217B85314@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v53 = a1;
  uint64_t v4 = sub_217BD7FB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v4);
  char v50 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDC0);
  uint64_t v10 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDC8);
  MEMORY[0x270FA5388](v44);
  int v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDD0);
  uint64_t v48 = *(void *)(v15 - 8);
  uint64_t v49 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDD8);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDE0);
  MEMORY[0x270FA5388](v47);
  uint64_t v46 = (uint64_t)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = (unsigned char *)v2;
  sub_217B8DAC8(v2, (uint64_t)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = swift_allocObject();
  sub_217B95B2C((uint64_t)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
  uint64_t v54 = v2;
  double v55 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDE8);
  sub_217B94CFC();
  sub_217BD8780();
  uint64_t v25 = v45;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v45);
  *(_OWORD *)&v14[*(int *)(v44 + 36)] = xmmword_217BDDB50;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  double v26 = v50;
  sub_217BD7FA0();
  sub_217B9505C();
  sub_217B94AA8(&qword_267BAEE70, MEMORY[0x263F18FD0]);
  uint64_t v27 = v51;
  sub_217BD84C0();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v26, v27);
  sub_217B7FE68((uint64_t)v14, &qword_267BAEDC8);
  uint64_t v28 = v43;
  LOBYTE(v27) = *v43;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = (v27 & 1) == 0;
  uint64_t v32 = v48;
  uint64_t v31 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v21, v17, v49);
  char v33 = (uint64_t *)&v21[*(int *)(v19 + 44)];
  *char v33 = KeyPath;
  v33[1] = (uint64_t)sub_217B951C4;
  v33[2] = v30;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v31);
  if (*v28) {
    double v34 = 1.0;
  }
  else {
    double v34 = 0.3;
  }
  uint64_t v35 = v46;
  sub_217B78A98((uint64_t)v21, v46, &qword_267BAEDD8);
  *(double *)(v35 + *(int *)(v47 + 36)) = v34;
  sub_217B7FE68((uint64_t)v21, &qword_267BAEDD8);
  uint64_t v36 = (void *)sub_217BD8AE0();
  id v37 = PELocalizedString(v36);

  uint64_t v38 = sub_217BD8B10();
  uint64_t v40 = v39;

  uint64_t v56 = v38;
  uint64_t v57 = v40;
  sub_217B94DC8(&qword_267BAEE78, &qword_267BAEDE0, (void (*)(void))sub_217B951DC);
  sub_217B95300();
  sub_217BD8520();
  swift_bridgeObjectRelease();
  return sub_217B7FE68(v35, &qword_267BAEDE0);
}

uint64_t sub_217B85988()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = sub_217BD8310();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_217BD8300();
  uint64_t v13 = v1;
  sub_217B8DAC8(v1, (uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_217B95B2C((uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v10 + v9, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.ResetButton);
  sub_217BD8950();
  sub_217BD7E40();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_217B85B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v56 = sub_217BD8320() - 8;
  MEMORY[0x270FA5388](v56);
  uint64_t v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_217BD8A40();
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  char v50 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_217BD8A20();
  uint64_t v57 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEA0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEE10);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEE00) - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v52 = (uint64_t)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_217BD86B0();
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  sub_217B8C3CC((uint64_t)v13);
  sub_217B8DB1C((uint64_t)v13, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217BD83C0();
  uint64_t v19 = sub_217BD83B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v19);
  uint64_t v48 = sub_217BD83D0();
  sub_217B7FE68((uint64_t)v10, &qword_267BAEEA0);
  uint64_t KeyPath = swift_getKeyPath();
  sub_217B8C3CC((uint64_t)v13);
  uint64_t v20 = *((void *)v13 + 1);
  swift_retain();
  sub_217B8DB1C((uint64_t)v13, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v59 = *(void *)(a1 + 32);
  uint64_t v60 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEA8);
  sub_217BD8760();
  uint64_t v22 = v61;
  uint64_t v46 = v7;
  sub_217BD8A10();
  LOBYTE(v13) = *(unsigned char *)a1;
  unint64_t v23 = v50;
  sub_217BD8A30();
  sub_217B94AA8(&qword_267BAEEB0, MEMORY[0x263F1BBB8]);
  uint64_t v24 = v51;
  sub_217BD8A00();
  uint64_t v25 = v55;
  uint64_t v26 = v56;
  uint64_t v27 = &v4[*(int *)(v56 + 28)];
  uint64_t v28 = (uint64_t)v4;
  uint64_t v29 = v53;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v27, v23, v55);
  *(unsigned char *)(v28 + *(int *)(v26 + 32)) = (_BYTE)v13;
  uint64_t v30 = v28;
  sub_217B8DAC8(v28, (uint64_t)&v17[*(int *)(v15 + 44)], MEMORY[0x263F1A4D0]);
  uint64_t v31 = v48;
  uint64_t v32 = KeyPath;
  *(void *)uint64_t v17 = v49;
  *((void *)v17 + 1) = v32;
  *((void *)v17 + 2) = v31;
  *((void *)v17 + 3) = v20;
  *((void *)v17 + 4) = v22;
  *(_OWORD *)(v17 + 40) = xmmword_217BDDB60;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_217B8DB1C(v30, MEMORY[0x263F1A4D0]);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v25);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v46, v24);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v20) = sub_217BD8380();
  sub_217BD7C60();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v52;
  sub_217B78A98((uint64_t)v17, v52, &qword_267BAEE10);
  uint64_t v42 = v41 + *(int *)(v54 + 44);
  *(unsigned char *)uint64_t v42 = v20;
  *(void *)(v42 + 8) = v34;
  *(void *)(v42 + 16) = v36;
  *(void *)(v42 + 24) = v38;
  *(void *)(v42 + 32) = v40;
  *(unsigned char *)(v42 + 40) = 0;
  sub_217B7FE68((uint64_t)v17, &qword_267BAEE10);
  uint64_t v43 = v58;
  sub_217B78A98(v41, v58, &qword_267BAEE00);
  *(unsigned char *)(v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BAEDE8) + 36)) = 0;
  return sub_217B7FE68(v41, &qword_267BAEE00);
}

uint64_t sub_217B86184(uint64_t a1)
{
  uint64_t v2 = sub_217BD7EC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v16 - v8;
  (*(void (**)(uint64_t))(a1 + 8))(v7);
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  sub_217B8C170();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F18DC8], v2);
  char v10 = sub_217BD7EB0();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v9, v2);
  double v12 = 6.28318531;
  if (v10) {
    double v12 = -6.28318531;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  *(double *)&v16[1] = v12;
  void v16[2] = v13;
  v16[3] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEA8);
  return sub_217BD8770();
}

uint64_t sub_217B86330()
{
  return sub_217BD8770();
}

uint64_t sub_217B86384()
{
  unint64_t v0 = sub_217B94C64();
  return MEMORY[0x270F00F10](&type metadata for PhotoStyleValueLabelsConfigurationKey, &type metadata for PhotoStyleValueLabelsConfigurationKey, v0);
}

uint64_t sub_217B863CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B8DAC8(a1, (uint64_t)v4, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  return sub_217B86468((uint64_t)v4);
}

uint64_t sub_217B86468(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  uint64_t v4 = OUTLINED_FUNCTION_7_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_1();
  sub_217B8DAC8(a1, v1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B94C64();
  sub_217BD8120();
  return sub_217B8DB1C(a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_217B86520@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217BD8190();
  MEMORY[0x270FA5388](v2 - 8);
  sub_217BD8180();
  sub_217BD8170();
  sub_217BD8160();
  sub_217BD8170();
  sub_217BD81B0();
  uint64_t v3 = sub_217BD8450();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  uint64_t v8 = sub_217BD8420();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_217B957A8(v3, v5, v7);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_217BD8440();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  sub_217B957A8(v8, v10, v12);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_217B866C4@<X0>(uint64_t a1@<X8>)
{
  return sub_217B86520(a1);
}

uint64_t sub_217B866CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v42 = a3;
  swift_getWitnessTable();
  sub_217BD82A0();
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t v56 = sub_217BD7C80();
  uint64_t v57 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(255);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v59 = sub_217B94AA8(&qword_267BAED58, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  uint64_t v38 = sub_217BD8790();
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v39 = sub_217BD8240();
  uint64_t v32 = sub_217BD7EF0();
  uint64_t v40 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v56 = v5;
  uint64_t v57 = MEMORY[0x263F18AF0];
  uint64_t v9 = MEMORY[0x263F1BA08];
  uint64_t WitnessTable = MEMORY[0x263F1BA08];
  uint64_t v59 = v4;
  uint64_t v10 = MEMORY[0x263F1BA00];
  uint64_t v60 = MEMORY[0x263F18AE0];
  uint64_t v61 = MEMORY[0x263F1BA00];
  sub_217BD8290();
  uint64_t v56 = v5;
  uint64_t v57 = MEMORY[0x263F1B440];
  uint64_t WitnessTable = v9;
  uint64_t v59 = v6;
  uint64_t v60 = MEMORY[0x263F1B420];
  uint64_t v61 = v10;
  sub_217BD7F80();
  sub_217BD8270();
  uint64_t v11 = sub_217BD8CA0();
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v54 = v12;
  uint64_t v55 = v13;
  uint64_t v53 = swift_getWitnessTable();
  uint64_t v34 = v11;
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v35 = sub_217BD8000();
  uint64_t v14 = sub_217BD7EF0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v31 - v19;
  uint64_t v21 = v5;
  uint64_t v46 = v5;
  uint64_t v47 = v4;
  uint64_t v22 = v36;
  uint64_t v48 = v36;
  uint64_t v23 = swift_getWitnessTable();
  sub_217BD88E0();
  sub_217BD8490();
  uint64_t v43 = v21;
  uint64_t v44 = v4;
  uint64_t v45 = v22;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v51 = v23;
  uint64_t v52 = v24;
  uint64_t v25 = v32;
  uint64_t v26 = swift_getWitnessTable();
  sub_217BD88E0();
  sub_217BD8580();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v25);
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v49 = v26;
  uint64_t v50 = v27;
  swift_getWitnessTable();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v28(v20, v18, v14);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v18, v14);
  v28(v42, v20, v14);
  return ((uint64_t (*)(char *, uint64_t))v29)(v20, v14);
}

uint64_t sub_217B86C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v28 = *(void *)(a3 + 8);
  uint64_t v31 = a2;
  uint64_t v32 = MEMORY[0x263F188A8];
  uint64_t v33 = v28;
  uint64_t v34 = MEMORY[0x263F18898];
  uint64_t v6 = sub_217BD7C80();
  uint64_t v23 = v6;
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v27 = (char *)&v23 - v7;
  uint64_t v8 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(255);
  uint64_t v26 = v8;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = WitnessTable;
  uint64_t v24 = sub_217B94AA8(&qword_267BAED58, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  uint64_t v31 = v6;
  uint64_t v32 = v8;
  uint64_t v33 = WitnessTable;
  uint64_t v34 = v24;
  uint64_t v10 = sub_217BD8790();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - v15;
  uint64_t v17 = type metadata accessor for BackgroundPlatter();
  uint64_t v31 = sub_217B86FA4(a1, v17);
  uint64_t v18 = v27;
  sub_217B819C4((uint64_t)&v31, 256, a2, MEMORY[0x263F188A8]);
  swift_release();
  uint64_t v19 = v23;
  sub_217BD8550();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v19);
  swift_getWitnessTable();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v20(v16, v14, v10);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v14, v10);
  v20(v30, v16, v10);
  return ((uint64_t (*)(char *, uint64_t))v21)(v16, v10);
}

uint64_t sub_217B86FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v30 = a1;
  uint64_t v2 = sub_217BD8980();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAED60);
  MEMORY[0x270FA5388](v29);
  uint64_t v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_217BD88D0();
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v17 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B8DAC8(v30, (uint64_t)v19, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = v27;
    sub_217B9608C((uint64_t)v19, (uint64_t)v16, &qword_267BAEA20);
    sub_217B78A98((uint64_t)v16, (uint64_t)v14, &qword_267BAEA20);
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v8) == 1)
    {
      type metadata accessor for BundleClass();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v22 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_217BD88A0();

      sub_217B7FE68((uint64_t)v14, &qword_267BAEA20);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v10, v14, v8);
    }
    uint64_t v24 = sub_217BD7D60();
    sub_217B7FE68((uint64_t)v16, &qword_267BAEA20);
  }
  else
  {
    swift_release();
    sub_217B87E18();
    uint64_t v23 = sub_217BD8640();
    swift_release();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B9D0], v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v7 + *(int *)(v29 + 36), v5, v2);
    *uint64_t v7 = v23;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_217B7FD60(&qword_267BAED68, &qword_267BAED60);
    return sub_217BD7D60();
  }
  return v24;
}

uint64_t sub_217B873EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v7 = *(void *)(a3 + 8);
  *(void *)&long long v91 = a2;
  *((void *)&v91 + 1) = MEMORY[0x263F1B440];
  uint64_t v8 = MEMORY[0x263F1BA08];
  *(void *)&long long v92 = MEMORY[0x263F1BA08];
  *((void *)&v92 + 1) = v7;
  v66[1] = v7;
  uint64_t v9 = MEMORY[0x263F1BA00];
  uint64_t v93 = MEMORY[0x263F1B420];
  uint64_t v94 = MEMORY[0x263F1BA00];
  uint64_t v10 = sub_217BD7F80();
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  char v68 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v67 = (char *)v66 - v13;
  *(void *)&long long v91 = a2;
  *((void *)&v91 + 1) = MEMORY[0x263F18AF0];
  *(void *)&long long v92 = v8;
  *((void *)&v92 + 1) = a3;
  uint64_t v73 = a3;
  uint64_t v93 = MEMORY[0x263F18AE0];
  uint64_t v94 = v9;
  uint64_t v14 = sub_217BD8290();
  uint64_t v71 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v70 = (char *)v66 - v18;
  uint64_t v19 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  id v22 = (char **)((char *)v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v66 - v23;
  uint64_t v75 = v10;
  uint64_t v25 = sub_217BD8270();
  uint64_t v77 = sub_217BD8CA0();
  uint64_t v26 = *(void *)(v77 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v77);
  uint64_t v72 = (char *)v66 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v74 = (uint64_t)v66 - v29;
  sub_217B8DAC8(a1, (uint64_t)v24, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_217B8DB1C((uint64_t)v24, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  uint64_t v76 = v26;
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for BackgroundPlatter();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE180);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_217BDDB70;
    sub_217BD8630();
    sub_217BD8640();
    swift_release();
    *(void *)(v31 + 32) = sub_217BD8870();
    *(void *)(v31 + 40) = v32;
    sub_217BD8620();
    *(void *)(v31 + 48) = sub_217BD8870();
    *(void *)(v31 + 56) = v33;
    sub_217BD8620();
    *(void *)(v31 + 64) = sub_217BD8870();
    *(void *)(v31 + 72) = v34;
    sub_217BD8630();
    sub_217BD8640();
    swift_release();
    *(void *)(v31 + 80) = sub_217BD8870();
    *(void *)(v31 + 88) = v35;
    MEMORY[0x21D4576A0](v31);
    sub_217BD7E70();
    long long v81 = v91;
    long long v82 = v92;
    uint64_t v83 = v93;
    sub_217B81B58();
    sub_217B94B08((uint64_t)&v91);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v37 = v71;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
    uint64_t v39 = v25;
    uint64_t v40 = v70;
    v38(v70, v17, v14);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v37 + 8);
    v41(v17, v14);
    v38(v17, v40, v14);
    uint64_t v42 = swift_getWitnessTable();
    uint64_t v43 = (uint64_t)v17;
    uint64_t v44 = (uint64_t)v72;
    sub_217B81640(v43, v14);
    v41((char *)v43, v14);
    v41(v40, v14);
    __swift_storeEnumTagSinglePayload(v44, 0, 1, v39);
    uint64_t v79 = WitnessTable;
    uint64_t v80 = v42;
    swift_getWitnessTable();
    uint64_t v45 = v74;
    sub_217B81938(v44, v74);
    uint64_t v46 = v76;
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
    uint64_t v48 = v77;
    v47(v44, v77);
    uint64_t v49 = v46;
    uint64_t v50 = v45;
  }
  else
  {
    uint64_t v51 = (uint64_t)v72;
    uint64_t v71 = v25;
    uint64_t v52 = v75;
    sub_217B8DAC8(a1, (uint64_t)v22, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_217B8DB1C((uint64_t)v22, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
      __swift_storeEnumTagSinglePayload(v51, 1, 1, v71);
      uint64_t v53 = swift_getWitnessTable();
      uint64_t v54 = swift_getWitnessTable();
      uint64_t v89 = v53;
      uint64_t v90 = v54;
    }
    else
    {
      uint64_t v70 = *v22;
      uint64_t v55 = v70;
      type metadata accessor for BackgroundPlatter();
      *(void *)&long long v91 = v55;
      uint64_t v56 = (uint64_t)v68;
      sub_217B81B58();
      uint64_t v57 = swift_getWitnessTable();
      uint64_t v58 = v69;
      uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 16);
      uint64_t v60 = v67;
      v59(v67, v56, v52);
      uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
      v61(v56, v52);
      v59((char *)v56, (uint64_t)v60, v52);
      uint64_t v62 = swift_getWitnessTable();
      sub_217B81840(v56, v14, v52);
      swift_release();
      v61(v56, v52);
      v61((uint64_t)v60, v52);
      __swift_storeEnumTagSinglePayload(v51, 0, 1, v71);
      uint64_t v84 = v62;
      uint64_t v85 = v57;
    }
    swift_getWitnessTable();
    uint64_t v50 = v74;
    sub_217B81938(v51, v74);
    uint64_t v49 = v76;
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
    uint64_t v48 = v77;
    v47(v51, v77);
  }
  uint64_t v63 = swift_getWitnessTable();
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v87 = v63;
  uint64_t v88 = v64;
  uint64_t v86 = swift_getWitnessTable();
  swift_getWitnessTable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v78, v50, v48);
  return ((uint64_t (*)(uint64_t, uint64_t))v47)(v50, v48);
}

uint64_t sub_217B87E18()
{
  uint64_t v1 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B8DAC8(v0, (uint64_t)v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_217BD8620();
    sub_217B8DB1C((uint64_t)v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  }
  else
  {
    sub_217B8DB1C((uint64_t)v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    id v5 = objc_msgSend(self, sel_systemBackgroundColor);
    return MEMORY[0x21D4573E0](v5);
  }
  return v4;
}

uint64_t sub_217B87F38()
{
  return sub_217BD7D40();
}

uint64_t sub_217B87F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  v17[2] = a1;
  uint64_t v18 = a3;
  swift_getWitnessTable();
  sub_217BD82A0();
  uint64_t v4 = *(void *)(a2 + 16);
  v17[0] = *(void *)(a2 + 24);
  uint64_t v31 = v4;
  uint64_t v32 = MEMORY[0x263F1B440];
  uint64_t v33 = v17[0];
  uint64_t v34 = MEMORY[0x263F1B420];
  sub_217BD7C80();
  sub_217BD7EF0();
  sub_217BD7FE0();
  sub_217BD7EF0();
  sub_217BD7EF0();
  sub_217BD8CA0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v30 = MEMORY[0x263F19730];
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = MEMORY[0x263F190D0];
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = MEMORY[0x263F18BF0];
  uint64_t v24 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_217BD8000();
  uint64_t v5 = sub_217BD7EF0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v19 = v4;
  uint64_t v20 = v17[0];
  uint64_t v21 = v17[1];
  uint64_t v12 = swift_getWitnessTable();
  sub_217BD88E0();
  sub_217BD8580();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  swift_getWitnessTable();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v14(v11, v9, v5);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v9, v5);
  v14(v18, v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v15)(v11, v5);
}

uint64_t sub_217B882CC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v67 = a3;
  uint64_t v62 = sub_217BD8980();
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v57 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87[0] = a1;
  v87[1] = MEMORY[0x263F1B440];
  v87[2] = a2;
  v87[3] = MEMORY[0x263F1B420];
  uint64_t v6 = sub_217BD7C80();
  uint64_t v53 = *(void (***)(char *, uint64_t))(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v51 - v7;
  uint64_t v9 = sub_217BD7EF0();
  uint64_t v59 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (char *)v51 - v10;
  sub_217BD7FE0();
  uint64_t v11 = sub_217BD7EF0();
  uint64_t v58 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v55 = (char *)v51 - v12;
  uint64_t v13 = sub_217BD7EF0();
  uint64_t v60 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v54 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v56 = (char *)v51 - v16;
  uint64_t v65 = sub_217BD8CA0();
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v65);
  uint64_t v19 = (char *)v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (void (**)(char *, uint64_t))((char *)v51 - v21);
  char v23 = *(unsigned char *)(v20 + 8);
  uint64_t v24 = MEMORY[0x263F18BF0];
  uint64_t v64 = v9;
  if ((v23 & 1) != 0 || *(double *)v20 <= 1.0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v13);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v43 = MEMORY[0x263F19730];
    uint64_t v86 = MEMORY[0x263F19730];
    uint64_t v83 = swift_getWitnessTable();
    uint64_t v35 = MEMORY[0x263F190D0];
    uint64_t v84 = MEMORY[0x263F190D0];
    uint64_t v81 = swift_getWitnessTable();
    uint64_t v82 = v24;
    swift_getWitnessTable();
    sub_217B81938((uint64_t)v19, (uint64_t)v22);
    uint64_t v44 = (uint64_t)v22;
    uint64_t v45 = v66;
    uint64_t v46 = v66;
  }
  else
  {
    v51[2] = v20;
    v51[3] = type metadata accessor for BrightnessMultiply();
    uint64_t v52 = v6;
    v87[0] = sub_217BD8630();
    sub_217B819C4((uint64_t)v87, 256, a1, MEMORY[0x263F1B440]);
    swift_release();
    uint64_t v25 = v52;
    uint64_t v26 = swift_getWitnessTable();
    sub_217BD84A0();
    v53[1](v8, v25);
    uint64_t v27 = *MEMORY[0x263F1B9B8];
    uint64_t v28 = v61;
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 104);
    uint64_t v30 = v57;
    uint64_t v53 = v22;
    uint64_t v31 = v62;
    v29(v57, v27, v62);
    uint64_t v72 = v26;
    uint64_t v73 = MEMORY[0x263F19730];
    v51[1] = MEMORY[0x263F18E48];
    uint64_t v32 = swift_getWitnessTable();
    uint64_t v33 = v55;
    uint64_t v34 = v63;
    sub_217BD85A0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v9);
    uint64_t v70 = v32;
    uint64_t v35 = MEMORY[0x263F190D0];
    uint64_t v71 = MEMORY[0x263F190D0];
    uint64_t v36 = swift_getWitnessTable();
    uint64_t v37 = v54;
    sub_217BD8570();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v11);
    uint64_t v68 = v36;
    uint64_t v69 = MEMORY[0x263F18BF0];
    uint64_t v63 = (char *)swift_getWitnessTable();
    uint64_t v38 = v60;
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
    uint64_t v40 = v56;
    v39(v56, v37, v13);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v38 + 8);
    uint64_t v42 = v37;
    uint64_t v43 = MEMORY[0x263F19730];
    v41(v42, v13);
    v39(v19, v40, v13);
    v41(v40, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v13);
    uint64_t v44 = (uint64_t)v53;
    sub_217B81938((uint64_t)v19, (uint64_t)v53);
    uint64_t v45 = v66;
    uint64_t v46 = v66;
  }
  uint64_t v47 = *(void (**)(char *, uint64_t))(v46 + 8);
  uint64_t v48 = v19;
  uint64_t v49 = v65;
  v47(v48, v65);
  uint64_t v79 = swift_getWitnessTable();
  uint64_t v80 = v43;
  uint64_t v77 = swift_getWitnessTable();
  uint64_t v78 = v35;
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v76 = MEMORY[0x263F18BF0];
  uint64_t v74 = swift_getWitnessTable();
  swift_getWitnessTable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v67, v44, v49);
  return ((uint64_t (*)(uint64_t, uint64_t))v47)(v44, v49);
}

uint64_t sub_217B88BE8()
{
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer(v0, qword_267BAE9D0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_267BAE9D0);
  if (qword_267BADED8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_267BAE9F0);
  return sub_217B8DAC8(v2, v1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_217B88C8C()
{
  if (qword_267BADEC8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  return __swift_project_value_buffer(v0, (uint64_t)qword_267BAE9D0);
}

uint64_t sub_217B88CF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217B88C8C();
  return sub_217B8DAC8(v2, a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_217B88D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_217B94AA8(&qword_267BAF038, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration);
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B88DC4()
{
  return sub_217BD8E00();
}

uint64_t sub_217B88DEC()
{
  return sub_217BD8E10();
}

BOOL sub_217B88E34(char *a1, char *a2)
{
  return sub_217B82E0C(*a1, *a2);
}

uint64_t sub_217B88E40()
{
  return sub_217B88DEC();
}

uint64_t sub_217B88E48()
{
  return sub_217B88DC4();
}

void sub_217B88E50()
{
  id v0 = objc_msgSend(self, sel_globalSettings);
  unsigned __int8 v1 = objc_msgSend(v0, sel_shouldUseFlipAnimationForValuePlatter);

  byte_267BAE9E8 = v1;
}

uint64_t sub_217B88EAC()
{
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer((uint64_t)v3, qword_267BAE9F0);
  uint64_t v4 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_267BAE9F0);
  uint64_t v5 = sub_217BD88D0();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v5);
  swift_storeEnumTagMultiPayload();
  id v6 = objc_msgSend(self, sel_labelColor);
  uint64_t v7 = MEMORY[0x21D4573E0](v6);
  if (qword_267BADED0 != -1) {
    swift_once();
  }
  char v8 = byte_267BAE9E8;
  *(unsigned char *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = v7;
  uint64_t result = sub_217B95B2C((uint64_t)v2, v4 + v3[6], (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  *(void *)(v4 + v3[7]) = 0x4028000000000000;
  uint64_t v10 = v4 + v3[8];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  *(unsigned char *)(v4 + v3[9]) = v8;
  return result;
}

uint64_t static PhotoStyleValueLabels.Configuration.glass.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_217B8920C(&qword_267BADED8, (uint64_t)qword_267BAE9F0, a1);
}

uint64_t sub_217B89058()
{
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (uint64_t *)((char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer((uint64_t)v3, qword_267BAEA08);
  uint64_t v4 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_267BAEA08);
  sub_217BD8650();
  uint64_t v5 = sub_217BD8640();
  swift_release();
  *uint64_t v2 = v5;
  swift_storeEnumTagMultiPayload();
  id v6 = objc_msgSend(self, sel_labelColor);
  uint64_t v7 = MEMORY[0x21D4573E0](v6);
  if (qword_267BADED0 != -1) {
    swift_once();
  }
  char v8 = byte_267BAE9E8;
  *(unsigned char *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = v7;
  uint64_t result = sub_217B95B2C((uint64_t)v2, v4 + v3[6], (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  *(void *)(v4 + v3[7]) = 0x4028000000000000;
  uint64_t v10 = v4 + v3[8];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  *(unsigned char *)(v4 + v3[9]) = v8;
  return result;
}

uint64_t static PhotoStyleValueLabels.Configuration.bordered.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_217B8920C(&qword_267BADEE0, (uint64_t)qword_267BAEA08, a1);
}

uint64_t sub_217B8920C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  return sub_217B8DAC8(v6, a3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

void static PhotoStyleValueLabels.Configuration.glass(textColor:extendedBrightness:)()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v1 = sub_217BD88D0();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = qword_267BADED0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_5_2();
}

void static PhotoStyleValueLabels.Configuration.bordered(textColor:extendedBrightness:)()
{
  OUTLINED_FUNCTION_17_0();
  swift_retain();
  sub_217BD8650();
  uint64_t v1 = sub_217BD8640();
  swift_release();
  uint64_t *v0 = v1;
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_storeEnumTagMultiPayload();
  if (qword_267BADED0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_5_2();
}

void PhotoStyleValueLabels.Configuration.BackgroundStyle.hash(into:)()
{
  OUTLINED_FUNCTION_19_0();
  uint64_t v2 = sub_217BD88D0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
  uint64_t v7 = OUTLINED_FUNCTION_7_1(v6);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v18 - v11;
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5();
  uint64_t v16 = v15 - v14;
  sub_217B8DAC8(v0, v15 - v14, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217B9608C(v16, (uint64_t)v12, &qword_267BAEA20);
    sub_217B78A98((uint64_t)v12, (uint64_t)v10, &qword_267BAEA20);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v2) == 1)
    {
      sub_217B7FE68((uint64_t)v12, &qword_267BAEA20);
      uint64_t v17 = (uint64_t)v10;
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1, v10, v2);
      v18[0] = 0;
      v18[1] = 0xE000000000000000;
      sub_217BD8D00();
      sub_217BD8B40();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
      uint64_t v17 = (uint64_t)v12;
    }
    sub_217B7FE68(v17, &qword_267BAEA20);
  }
  else
  {
    sub_217BD8600();
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
}

uint64_t static PhotoStyleValueLabels.Configuration.BackgroundStyle.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_2();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAD0);
  uint64_t v8 = OUTLINED_FUNCTION_7_1(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10_1();
  uint64_t v10 = v2 + *(int *)(v9 + 56);
  sub_217B8DAC8(a1, v2, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_217B8DAC8(a2, v10, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_217B8DAC8(v2, v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v11 = sub_217BD85E0();
      swift_release();
      swift_release();
      sub_217B8DB1C(v2, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
      return v11 & 1;
    }
    swift_release();
    goto LABEL_6;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
LABEL_6:
    sub_217B7FE68(v2, &qword_267BAEAD0);
    char v11 = 0;
    return v11 & 1;
  }
  sub_217B8DB1C(v10, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_217B8DB1C(v2, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  char v11 = 1;
  return v11 & 1;
}

uint64_t PhotoStyleValueLabels.Configuration.BackgroundStyle.hashValue.getter()
{
  return sub_217BD8E10();
}

uint64_t sub_217B89844()
{
  return sub_217BD8E10();
}

uint64_t static PhotoStyleValueLabels.Configuration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2
    || (sub_217BD85E0() & 1) == 0
    || (uint64_t v4 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0),
        (static PhotoStyleValueLabels.Configuration.BackgroundStyle.== infix(_:_:)((uint64_t)&a1[v4[6]], (uint64_t)&a2[v4[6]]) & 1) == 0)|| *(double *)&a1[v4[7]] != *(double *)&a2[v4[7]])
  {
LABEL_11:
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  uint64_t v5 = v4[8];
  uint64_t v6 = (double *)&a1[v5];
  unsigned __int8 v7 = a1[v5 + 8];
  uint64_t v8 = (double *)&a2[v5];
  int v9 = a2[v5 + 8];
  if ((v7 & 1) == 0)
  {
    if (*v6 != *v8) {
      LOBYTE(v9) = 1;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v9) {
LABEL_13:
  }
    LOBYTE(v9) = a1[v4[9]] ^ a2[v4[9]] ^ 1;
  return v9 & 1;
}

uint64_t sub_217B89960()
{
  return 0x4772657474616C70;
}

uint64_t sub_217B89980()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

double PEPhotoStyleValuesPlatterView.tone.getter()
{
  return sub_217B89D10((double (*)(uint64_t))sub_217B89A54);
}

uint64_t PEPhotoStyleValuesPlatterView.tone.setter()
{
  return sub_217B89DCC();
}

double sub_217B89A54()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 16);
}

double PEPhotoStyleValuesPlatterView.color.getter()
{
  return sub_217B89D10((double (*)(uint64_t))sub_217B89BB8);
}

uint64_t PEPhotoStyleValuesPlatterView.color.setter()
{
  return sub_217B89DCC();
}

double sub_217B89BB8()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 24);
}

uint64_t sub_217B89C58()
{
  return swift_release();
}

double PEPhotoStyleValuesPlatterView.palette.getter()
{
  return sub_217B89D10((double (*)(uint64_t))sub_217B89E20);
}

double sub_217B89D10(double (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  double v3 = a1(v2);
  swift_release();
  return v3;
}

uint64_t PEPhotoStyleValuesPlatterView.palette.setter()
{
  return sub_217B89DCC();
}

uint64_t sub_217B89DCC()
{
  return swift_release();
}

double sub_217B89E20()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 32);
}

uint64_t sub_217B89EC0()
{
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.getter()
{
  return sub_217B8A3E0((uint64_t (*)(uint64_t))sub_217B89FE4);
}

uint64_t PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.setter()
{
  return sub_217B8A490();
}

uint64_t sub_217B89FE4()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t PEPhotoStyleValuesPlatterView.hidePaletteLabel.getter()
{
  return sub_217B8A3E0((uint64_t (*)(uint64_t))sub_217B8A13C);
}

uint64_t PEPhotoStyleValuesPlatterView.hidePaletteLabel.setter()
{
  return sub_217B8A490();
}

uint64_t sub_217B8A13C()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t sub_217B8A1DC()
{
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.hideResetButton.getter()
{
  return sub_217B8A3E0((uint64_t (*)(uint64_t))sub_217B8A2F4);
}

uint64_t PEPhotoStyleValuesPlatterView.hideResetButton.setter()
{
  return sub_217B8A490();
}

uint64_t sub_217B8A2F4()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t PEPhotoStyleValuesPlatterView.isResetButtonEnabled.getter()
{
  return sub_217B8A3E0((uint64_t (*)(uint64_t))sub_217B8A4E4);
}

uint64_t sub_217B8A3E0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  LOBYTE(a1) = a1(v2);
  swift_release();
  return a1 & 1;
}

uint64_t PEPhotoStyleValuesPlatterView.isResetButtonEnabled.setter()
{
  return sub_217B8A490();
}

uint64_t sub_217B8A490()
{
  return swift_release();
}

uint64_t sub_217B8A4E4()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 43);
}

uint64_t sub_217B8A584()
{
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.resetAction.getter()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v0 = sub_217B8A97C();
  swift_release();
  return v0;
}

uint64_t PEPhotoStyleValuesPlatterView.resetAction.setter()
{
  return swift_release();
}

uint64_t sub_217B8A7FC@<X0>(id *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_resetAction);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217B7CD34;
  *(void *)(result + 24) = v4;
  *a2 = sub_217B7C6EC;
  a2[1] = (uint64_t (*)())result;
  return result;
}

void sub_217B8A898(uint64_t *a1, void **a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  v8[4] = sub_217B7C6E4;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217B9E748;
  v8[3] = &block_descriptor_81;
  unsigned __int8 v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setResetAction_, v7);
  _Block_release(v7);
}

uint64_t sub_217B8A97C()
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t sub_217B8AA2C()
{
  return swift_release();
}

uint64_t sub_217B8AA94()
{
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  sub_217B8ABE4(a1);
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.configuration.setter(uint64_t a1)
{
  return sub_217B8DB1C(a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_217B8ABE4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_217B94AA8(&qword_267BAEF88, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_217BD78D0();
  swift_release();
  uint64_t v3 = v1
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration;
  swift_beginAccess();
  return sub_217B8DAC8(v3, a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_217B8ACC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B8DAC8(a2, (uint64_t)v5, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  swift_retain();
  sub_217B8AD88((uint64_t)v5);
  return swift_release();
}

uint64_t sub_217B8AD88(uint64_t a1)
{
  return sub_217B8DB1C(a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
}

void (*PEPhotoStyleValuesPlatterView.configuration.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  uint64_t v3 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  OUTLINED_FUNCTION_7_1(v3);
  size_t v5 = *(void *)(v4 + 64);
  a1[1] = malloc(v5);
  uint64_t v6 = malloc(v5);
  a1[2] = v6;
  PEPhotoStyleValuesPlatterView.configuration.getter((uint64_t)v6);
  return sub_217B8AE94;
}

void sub_217B8AE94(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_217B8DAC8(*(void *)(a1 + 16), (uint64_t)v2, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
    PEPhotoStyleValuesPlatterView.configuration.setter((uint64_t)v2);
    sub_217B8DB1C((uint64_t)v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  }
  else
  {
    PEPhotoStyleValuesPlatterView.configuration.setter(*(void *)(a1 + 16));
  }
  free(v3);
  free(v2);
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(PEPhotoStyleValuesPlatterView *__return_ptr retstr, Swift::Double tone, Swift::Double color, Swift::Double palette)
{
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v7, sel_initWithTone_color_palette_, tone, color, palette);
}

id PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(double a1, double a2, double a3)
{
  uint64_t v8 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_2();
  uint64_t v10 = qword_267BADEE0;
  char v11 = v3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_267BAEA08);
  sub_217B8DAC8(v12, v4, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  _s16IntegrationModelCMa_0(0);
  swift_allocObject();
  uint64_t v13 = sub_217B8BAD0(0, 0, 0, v4, 0, (uint64_t)nullsub_1, 0, a1, a2, a3);
  *(void *)&v11[OBJC_IVAR___PEPhotoStyleValuesPlatterView_valueLabelsModel] = v13;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAE0));
  uint64_t v17 = v13;
  swift_retain();
  *(void *)&v11[OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController] = sub_217BD8220();

  v16.receiver = v11;
  v16.super_class = (Class)PEPhotoStyleValuesPlatterView;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_217B8B18C();

  return v14;
}

uint64_t sub_217B8B158(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_217B8BD94(a1);
}

void sub_217B8B18C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController;
  id v3 = *(id *)&v0[OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController];
  sub_217BD8200();

  id v4 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  size_t v5 = v4;
  id v6 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v6)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v7 = v6;
  objc_msgSend(v1, sel_addSubview_, v6);

  id v8 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v8);

  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v9 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE860);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_217BDD4E0;
  id v11 = objc_msgSend(v5, sel_topAnchor);
  id v12 = objc_msgSend(v1, sel_topAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(void *)(v10 + 32) = v13;
  id v14 = objc_msgSend(v5, sel_bottomAnchor);
  id v15 = objc_msgSend(v1, sel_bottomAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  *(void *)(v10 + 40) = v16;
  id v17 = objc_msgSend(v5, sel_leadingAnchor);
  id v18 = objc_msgSend(v1, sel_leadingAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  *(void *)(v10 + 48) = v19;
  id v20 = objc_msgSend(v5, sel_trailingAnchor);
  id v21 = objc_msgSend(v1, sel_trailingAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  *(void *)(v10 + 56) = v22;
  sub_217BD8B80();
  sub_217B7C758(0, &qword_267BAE868);
  id v23 = (id)sub_217BD8B60();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_activateConstraints_, v23);
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(coder:)(PEPhotoStyleValuesPlatterView_optional *__return_ptr retstr, NSCoder coder)
{
}

void PEPhotoStyleValuesPlatterView.init(coder:)()
{
}

uint64_t sub_217B8B590@<X0>(uint64_t a1@<X8>)
{
  v25[1] = a1;
  uint64_t v1 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PhotoStyleValueLabels(0);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  id v7 = (double *)((char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAED70);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = sub_217B89A54();
  double v12 = sub_217B89BB8();
  double v13 = sub_217B89E20();
  char v14 = sub_217B89FE4();
  char v15 = sub_217B8A13C();
  char v16 = sub_217B8A2F4();
  char v17 = sub_217B8A4E4();
  uint64_t v18 = sub_217B8A97C();
  *id v7 = v11;
  v7[1] = v12;
  v7[2] = v13;
  *((unsigned char *)v7 + 24) = v14 & 1;
  *((unsigned char *)v7 + 25) = v15 & 1;
  *((unsigned char *)v7 + 26) = v16 & 1;
  *((unsigned char *)v7 + 27) = v17 & 1;
  *((void *)v7 + 4) = v18;
  *((void *)v7 + 5) = v19;
  id v20 = (uint64_t *)((char *)v7 + *(int *)(v5 + 56));
  *id v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  swift_storeEnumTagMultiPayload();
  uint64_t KeyPath = swift_getKeyPath();
  sub_217B8ABE4((uint64_t)v3);
  id v22 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAED78);
  sub_217B8DAC8((uint64_t)v3, (uint64_t)v22 + *(int *)(v23 + 28), (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  *id v22 = KeyPath;
  sub_217B8DAC8((uint64_t)v7, (uint64_t)v10, (void (*)(void))type metadata accessor for PhotoStyleValueLabels);
  sub_217B8DB1C((uint64_t)v3, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_217B8DB1C((uint64_t)v7, (void (*)(void))type metadata accessor for PhotoStyleValueLabels);
  sub_217B94B94();
  sub_217BD8530();
  return sub_217B7FE68((uint64_t)v10, &qword_267BAED70);
}

uint64_t sub_217B8B838@<X0>(uint64_t a1@<X8>)
{
  return sub_217B8B590(a1);
}

uint64_t sub_217B8B840()
{
  return sub_217BD78C0();
}

uint64_t sub_217B8B8FC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_217B8A97C();
  uint64_t v4 = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = v4;
  *a1 = sub_217B7CD4C;
  a1[1] = result;
  return result;
}

uint64_t sub_217B8B960(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  swift_retain();
  return sub_217B8AA94();
}

uint64_t sub_217B8B9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  uint64_t v9 = OUTLINED_FUNCTION_7_1(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_2();
  sub_217B8DAC8(a1, v5, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  return a5(v5);
}

uint64_t sub_217B8BA64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration;
  swift_beginAccess();
  sub_217B95BEC(a2, v3);
  return swift_endAccess();
}

uint64_t sub_217B8BAD0(char a1, char a2, char a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10)
{
  sub_217BD7900();
  *(double *)(v10 + 16) = a8;
  *(double *)(v10 + 24) = a9;
  *(double *)(v10 + 32) = a10;
  *(unsigned char *)(v10 + 40) = a1;
  *(unsigned char *)(v10 + 41) = a2;
  *(unsigned char *)(v10 + 42) = a3;
  *(unsigned char *)(v10 + 43) = a5;
  *(void *)(v10 + 48) = a6;
  *(void *)(v10 + 56) = a7;
  sub_217B95B2C(a4, v10+ OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  return v10;
}

uint64_t sub_217B8BB94()
{
  swift_release();
  sub_217B8DB1C(v0+ OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  uint64_t v1 = v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel___observationRegistrar;
  uint64_t v2 = sub_217BD7910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_217B8BC24()
{
  uint64_t v0 = sub_217B8BB94();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(frame:)(PEPhotoStyleValuesPlatterView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

void PEPhotoStyleValuesPlatterView.init(frame:)()
{
}

uint64_t sub_217B8BD6C()
{
  return sub_217B819A4() & 1;
}

uint64_t sub_217B8BD94(uint64_t a1)
{
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + qword_267BAEB70);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v8 - v5, a1, v3);
  uint64_t v6 = sub_217BD8220();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v6;
}

void *sub_217B8BEB8(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_217B8BEFC(a1, a2);
}

void *sub_217B8BEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + qword_267BAEB70);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  id v7 = (void *)sub_217BD8210();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_217B8C034(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureDrawHostingController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_217B8C0CC(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_217B8C034(a3);
}

id sub_217B8C0F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureDrawHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_217B8C170()
{
  OUTLINED_FUNCTION_19_0();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = sub_217BD8100();
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_2();
  sub_217B78A98(v3, v2, &qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217BD7EC0();
    OUTLINED_FUNCTION_3();
    (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v5, v2);
  }
  else
  {
    os_log_type_t v12 = sub_217BD8C10();
    double v13 = sub_217BD8330();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = v16;
      *(_DWORD *)char v15 = 136315138;
      sub_217B8D0FC(0x694474756F79614CLL, 0xEF6E6F6974636572, &v17);
      sub_217BD8CB0();
      _os_log_impl(&dword_217B65000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D458AE0](v16, -1, -1);
      MEMORY[0x21D458AE0](v15, -1, -1);
    }

    sub_217BD80F0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
  }
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_217B8C3CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_217BD8100();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B78A98(v2, (uint64_t)v10, &qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_217B95B2C((uint64_t)v10, a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration);
  }
  os_log_type_t v12 = sub_217BD8C10();
  double v13 = sub_217BD8330();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v18[1] = a1;
    uint64_t v17 = v16;
    uint64_t v19 = v16;
    *(_DWORD *)char v15 = 136315138;
    void v18[2] = sub_217B8D0FC(0x72756769666E6F43, 0xED00006E6F697461, &v19);
    sub_217BD8CB0();
    _os_log_impl(&dword_217B65000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D458AE0](v17, -1, -1);
    MEMORY[0x21D458AE0](v15, -1, -1);
  }

  sub_217BD80F0();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_217B8C670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v47 = a5;
  LODWORD(v44) = a4;
  uint64_t v40 = a3;
  uint64_t v41 = a8;
  uint64_t v42 = a2;
  uint64_t v53 = a9;
  uint64_t v51 = a1;
  uint64_t v52 = a11;
  uint64_t v45 = *(void *)(a8 - 8);
  uint64_t v48 = a12;
  MEMORY[0x270FA5388](a1);
  uint64_t v43 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_217BD8240();
  uint64_t v15 = MEMORY[0x270FA5388](v49);
  uint64_t v46 = (char *)v34 - v16;
  uint64_t v39 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v37 = (char *)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v36 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v19 = sub_217BD7E30();
  MEMORY[0x270FA5388](v19);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v54 = v19;
  uint64_t v55 = a7;
  uint64_t v56 = WitnessTable;
  uint64_t v57 = v52;
  uint64_t v38 = sub_217BD7C80();
  MEMORY[0x270FA5388](v38);
  v34[1] = (char *)v34 - v20;
  uint64_t v21 = *(void *)(a6 - 8);
  id v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
  v34[0] = a6;
  v22(v53, v51, a6);
  sub_217BD7EA0();
  sub_217BD7E20();
  uint64_t v23 = v39;
  uint64_t v24 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v37, v42, a7);
  uint64_t v25 = a7;
  uint64_t v26 = v52;
  sub_217BD7C70();
  uint64_t v27 = v45;
  uint64_t v28 = v47;
  uint64_t v29 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, v47, v41);
  sub_217BD88E0();
  uint64_t v44 = v30;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
  uint64_t v31 = v34[0];
  (*(void (**)(uint64_t, void))(v21 + 8))(v51, v34[0]);
  uint64_t v32 = v48;
  sub_217BD8230();
  uint64_t v54 = v31;
  uint64_t v55 = v25;
  uint64_t v56 = v29;
  uint64_t v57 = v50;
  uint64_t v58 = v26;
  uint64_t v59 = v32;
  sub_217BD8290();
  return sub_217BD7ED0();
}

uint64_t sub_217B8CB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v46 = a5;
  int v43 = a4;
  uint64_t v39 = a3;
  uint64_t v41 = a2;
  uint64_t v49 = a9;
  uint64_t v50 = a1;
  v33[1] = a11;
  uint64_t v35 = a10;
  uint64_t v40 = a8;
  uint64_t v44 = *(void *)(a8 - 8);
  uint64_t v47 = a12;
  MEMORY[0x270FA5388](a1);
  uint64_t v42 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_217BD8240();
  uint64_t v15 = MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)v33 - v16;
  uint64_t v37 = *(void *)(a7 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void *)(a6 - 8);
  uint64_t v20 = v36;
  MEMORY[0x270FA5388](v17);
  id v22 = (char *)v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_217BD7E30();
  MEMORY[0x270FA5388](v23);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v51 = v23;
  uint64_t v52 = a7;
  uint64_t v25 = a7;
  uint64_t v53 = WitnessTable;
  uint64_t v54 = a11;
  uint64_t v38 = sub_217BD7C80();
  MEMORY[0x270FA5388](v38);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v34 = a6;
  v26(v22, v50, a6);
  sub_217BD7E20();
  uint64_t v27 = v37;
  uint64_t v28 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v19, v41, v25);
  sub_217BD7C70();
  uint64_t v29 = v44;
  uint64_t v30 = v46;
  uint64_t v31 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v42, v46, v40);
  sub_217BD88E0();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v25);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v50, v34);
  sub_217BD8230();
  return sub_217BD7ED0();
}

void sub_217B8CFA0()
{
  OUTLINED_FUNCTION_19_0();
  uint64_t v20 = v1;
  uint64_t v3 = v2;
  unsigned int v19 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_1_2();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v14 = v13 - v12;
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_10_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v0, v18, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v14, v8, v3);
  swift_bridgeObjectRetain();
  v20(v0, v14, v6, v19);
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_217B8D0FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_217B8D1D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_217B955D0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_217B955D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_217B8D1D0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_217B8D328((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_217BD8CC0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_217B8D400(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_217BD8CF0();
    if (!v8)
    {
      uint64_t result = sub_217BD8D30();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_217B8D328(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_217BD8D50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_217B8D400(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_217B8D498(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_217B8D674(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_217B8D674((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_217B8D498(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_217BD8B50();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_217B8D60C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_217BD8CE0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_217BD8D50();
  __break(1u);
LABEL_14:
  uint64_t result = sub_217BD8D30();
  __break(1u);
  return result;
}

void *sub_217B8D60C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_217B8D674(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEEB8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_217B8D824(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_217B8D74C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_217B8D74C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_217BD8D50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_217B8D824(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_217BD8D50();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_217B8D8B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217BD8090();
  *a1 = result;
  return result;
}

uint64_t sub_217B8D8E0()
{
  return sub_217BD80A0();
}

unint64_t sub_217B8D910()
{
  unint64_t result = qword_267BAEA78;
  if (!qword_267BAEA78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA48);
    sub_217B94DC8(&qword_267BAEA80, &qword_267BAEA40, (void (*)(void))sub_217B8D9DC);
    sub_217B7FD60(&qword_267BAEAA8, &qword_267BAEAB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEA78);
  }
  return result;
}

unint64_t sub_217B8D9DC()
{
  unint64_t result = qword_267BAEA88;
  if (!qword_267BAEA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA38);
    sub_217B7FD60(&qword_267BAEA90, &qword_267BAEA30);
    sub_217B7FD60(&qword_267BAEA98, &qword_267BAEAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEA88);
  }
  return result;
}

uint64_t sub_217B8DAA0()
{
  return sub_217BD8050();
}

uint64_t sub_217B8DAC8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_12();
  v5(v4);
  return a2;
}

uint64_t sub_217B8DB1C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_5_0();
  v4(v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_217B8DBA4()
{
  return sub_217B89EC0();
}

uint64_t sub_217B8DBE0()
{
  return sub_217B89EC0();
}

uint64_t sub_217B8DC1C()
{
  return sub_217B89EC0();
}

uint64_t sub_217B8DC58()
{
  return sub_217B8A584();
}

uint64_t sub_217B8DC90()
{
  return sub_217B8A584();
}

uint64_t sub_217B8DCC8()
{
  return sub_217B8A584();
}

uint64_t sub_217B8DD00()
{
  return sub_217B8A584();
}

uint64_t sub_217B8DD38()
{
  return sub_217B8AA2C();
}

uint64_t sub_217B8DD58()
{
  return sub_217B8ACC4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t _s16IntegrationModelCMa_0(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAEB58);
}

uint64_t sub_217B8DD94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B8DDB0()
{
  return sub_217B94AA8(&qword_267BAEAF0, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
}

char *keypath_get_selector_tone()
{
  return sel_tone;
}

id sub_217B8DE04(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_tone);
  void *v1 = v3;
  return result;
}

id sub_217B8DE34(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTone_, *a1);
}

char *keypath_get_selector_color()
{
  return sel_color;
}

id sub_217B8DE54(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_color);
  void *v1 = v3;
  return result;
}

id sub_217B8DE84(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColor_, *a1);
}

char *keypath_get_selector_palette()
{
  return sel_palette;
}

id sub_217B8DEA4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_palette);
  void *v1 = v3;
  return result;
}

id sub_217B8DED4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPalette_, *a1);
}

char *keypath_get_selector_hideToneAndColorLabels()
{
  return sel_hideToneAndColorLabels;
}

id sub_217B8DEF4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_hideToneAndColorLabels);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217B8DF24(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHideToneAndColorLabels_, *a1);
}

char *keypath_get_selector_hidePaletteLabel()
{
  return sel_hidePaletteLabel;
}

id sub_217B8DF44(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_hidePaletteLabel);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217B8DF74(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHidePaletteLabel_, *a1);
}

char *keypath_get_selector_hideResetButton()
{
  return sel_hideResetButton;
}

id sub_217B8DF94(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_hideResetButton);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217B8DFC4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHideResetButton_, *a1);
}

char *keypath_get_selector_isResetButtonEnabled()
{
  return sel_isResetButtonEnabled;
}

id sub_217B8DFE4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_isResetButtonEnabled);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217B8E014(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsResetButtonEnabled_, *a1);
}

char *keypath_get_selector_resetAction()
{
  return sel_resetAction;
}

uint64_t sub_217B8E03C@<X0>(uint64_t a1@<X8>)
{
  return PEPhotoStyleValuesPlatterView.configuration.getter(a1);
}

uint64_t sub_217B8E060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B8B9D0(a1, a2, a3, a4, PEPhotoStyleValuesPlatterView.configuration.setter);
}

void *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = a2[2];
    *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 + 6);
    uint64_t v5 = a2[5];
    v3[4] = a2[4];
    v3[5] = v5;
    uint64_t v6 = *(int *)(a3 + 48);
    int64_t v7 = (char *)v3 + v6;
    int64_t v8 = (char *)a2 + v6;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *int64_t v7 = *v8;
      *((void *)v7 + 1) = *((void *)v8 + 1);
      int64_t v9 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v10 = v9[6];
      size_t v11 = &v7[v10];
      uint64_t v12 = &v8[v10];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v13 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
      }
      else
      {
        *(void *)size_t v11 = *(void *)v12;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)&v7[v9[7]] = *(void *)&v8[v9[7]];
      uint64_t v16 = v9[8];
      uint64_t v17 = &v7[v16];
      uint64_t v18 = &v8[v16];
      *(void *)uint64_t v17 = *(void *)v18;
      v17[8] = v18[8];
      v7[v9[9]] = v8[v9[9]];
    }
    else
    {
      *(void *)int64_t v7 = *(void *)v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        uint64_t v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    uint64_t v6 = sub_217BD88D0();
    uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v6);
    if (!result)
    {
      int64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
      return v8(v5, v6);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(int *)(a3 + 48);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)uint64_t v6 = *(unsigned char *)v7;
    *(void *)(v6 + 8) = *(void *)(v7 + 8);
    int64_t v8 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v9 = v8[6];
    uint64_t v10 = (void *)(v6 + v9);
    size_t v11 = (void *)(v7 + v9);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(void *)(v6 + v8[7]) = *(void *)(v7 + v8[7]);
    uint64_t v14 = v8[8];
    uint64_t v15 = v6 + v14;
    uint64_t v16 = v7 + v14;
    *(void *)uint64_t v15 = *(void *)v16;
    *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
    *(unsigned char *)(v6 + v8[9]) = *(unsigned char *)(v7 + v8[9]);
  }
  else
  {
    *(void *)uint64_t v6 = *(void *)v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 48);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    sub_217B7FE68(a1 + v7, &qword_267BAEAF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
      *(void *)(v8 + 8) = *(void *)(v9 + 8);
      uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v11 = v10[6];
      uint64_t v12 = (void *)(v8 + v11);
      uint64_t v13 = (void *)(v9 + v11);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v14 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
        }
      }
      else
      {
        *uint64_t v12 = *v13;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)(v8 + v10[7]) = *(void *)(v9 + v10[7]);
      uint64_t v16 = v10[8];
      uint64_t v17 = v8 + v16;
      uint64_t v18 = v9 + v16;
      char v19 = *(unsigned char *)(v18 + 8);
      *(void *)uint64_t v17 = *(void *)v18;
      *(unsigned char *)(v17 + 8) = v19;
      *(unsigned char *)(v8 + v10[9]) = *(unsigned char *)(v9 + v10[9]);
    }
    else
    {
      *(void *)uint64_t v8 = *(void *)v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(int *)(a3 + 48);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)uint64_t v5 = *(unsigned char *)v6;
    v5[1] = v6[1];
    uint64_t v8 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v9 = v8[6];
    uint64_t v10 = (char *)v5 + v9;
    uint64_t v11 = (char *)v6 + v9;
    uint64_t v12 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    *(void *)((char *)v5 + v8[7]) = *(void *)((char *)v6 + v8[7]);
    uint64_t v15 = v8[8];
    uint64_t v16 = (char *)v5 + v15;
    uint64_t v17 = (char *)v6 + v15;
    *(void *)uint64_t v16 = *(void *)v17;
    v16[8] = v17[8];
    *((unsigned char *)v5 + v8[9]) = *((unsigned char *)v6 + v8[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 48);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_217B7FE68(a1 + v6, &qword_267BAEAF8);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)uint64_t v7 = *(unsigned char *)v8;
      v7[1] = v8[1];
      uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v11 = v10[6];
      uint64_t v12 = (char *)v7 + v11;
      uint64_t v13 = (char *)v8 + v11;
      uint64_t v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v15 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v15);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
      }
      *(void *)((char *)v7 + v10[7]) = *(void *)((char *)v8 + v10[7]);
      uint64_t v17 = v10[8];
      uint64_t v18 = (char *)v7 + v17;
      char v19 = (char *)v8 + v17;
      *(void *)uint64_t v18 = *(void *)v19;
      _OWORD v18[8] = v19[8];
      *((unsigned char *)v7 + v10[9]) = *((unsigned char *)v8 + v10[9]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B8ECC0);
}

uint64_t sub_217B8ECC0()
{
  OUTLINED_FUNCTION_15_0();
  if (v2) {
    return OUTLINED_FUNCTION_9_1(*(void *)(v0 + 32));
  }
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
  uint64_t v4 = OUTLINED_FUNCTION_24(*(int *)(v1 + 48));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t storeEnumTagSinglePayload for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B8ED44);
}

void sub_217B8ED44()
{
  OUTLINED_FUNCTION_8_1();
  if (v3)
  {
    *(void *)(v1 + 32) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
    uint64_t v5 = OUTLINED_FUNCTION_14_0(*(int *)(v4 + 48));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_217B8EDB4()
{
  sub_217B900D0(319, &qword_267BAEB18, type metadata accessor for PhotoStyleValueLabels.Configuration, MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels.Configuration(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[6];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
    *((unsigned char *)v4 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  }
  return v4;
}

uint64_t destroy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_217BD88D0();
    uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_217BD88D0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithCopy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_217B8DB1C(a1 + v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      }
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  *(unsigned char *)(v12 + 8) = *((unsigned char *)v13 + 8);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_217BD88D0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_217B8DB1C(a1 + v6, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    uint64_t v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B8F7A4);
}

uint64_t sub_217B8F7A4()
{
  OUTLINED_FUNCTION_15_0();
  if (v2) {
    return OUTLINED_FUNCTION_9_1(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_26();
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  uint64_t v4 = OUTLINED_FUNCTION_24(*(int *)(v1 + 24));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t storeEnumTagSinglePayload for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B8F824);
}

void sub_217B8F824()
{
  OUTLINED_FUNCTION_8_1();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    uint64_t v5 = OUTLINED_FUNCTION_14_0(*(int *)(v4 + 24));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

uint64_t sub_217B8F890()
{
  uint64_t result = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_217BD88D0();
    uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v2);
    if (!result)
    {
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
      return v4(a1, v2);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_217BD88D0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
    {
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
      memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_217B8DB1C((uint64_t)a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
      {
        uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_217BD88D0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_217B8DB1C((uint64_t)a1, (void (*)(void))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_217B8FFF8()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_217B90008()
{
  sub_217B900D0(319, &qword_267BAEB40, MEMORY[0x263F1B910], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_217B900D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t type metadata accessor for BundleClass()
{
  return self;
}

uint64_t sub_217B90158()
{
  return _s16IntegrationModelCMa_0(0);
}

uint64_t sub_217B90160()
{
  uint64_t result = type metadata accessor for PhotoStyleValueLabels.Configuration(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_217BD7910();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStyleValuesPlatterView(uint64_t a1)
{
  return sub_217B7C758(a1, &qword_267BAEB68);
}

uint64_t sub_217B90274()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SecureDrawHostingController()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_217B902D4()
{
  unint64_t result = qword_267BAEC00;
  if (!qword_267BAEC00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA68);
    sub_217B90374();
    sub_217B7FD60(qword_267BAEC28, &qword_267BAEAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEC00);
  }
  return result;
}

unint64_t sub_217B90374()
{
  unint64_t result = qword_267BAEC08;
  if (!qword_267BAEC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA60);
    sub_217B90414();
    sub_217B7FD60(&qword_267BAEC20, &qword_267BAEAC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEC08);
  }
  return result;
}

unint64_t sub_217B90414()
{
  unint64_t result = qword_267BAEC10;
  if (!qword_267BAEC10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEA48);
    sub_217B8D910();
    swift_getOpaqueTypeConformance2();
    sub_217B7FD60(&qword_267BAEC18, &qword_267BAEAB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEC10);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels.Configuration.SizeFamily(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PhotoStyleValueLabels.Configuration.SizeFamily(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217B9063CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_217B90664(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabels.Configuration.SizeFamily()
{
  return &type metadata for PhotoStyleValueLabels.Configuration.SizeFamily;
}

ValueMetadata *_s15IntegrationViewVMa_0()
{
  return &_s15IntegrationViewVN;
}

uint64_t sub_217B9068C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_217B90734(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + 7;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v6 + ((v5 + 9) & ~v5)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v9 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v10 = (a1 + v5 + 9) & ~v5;
    uint64_t v11 = ((unint64_t)a2 + v5 + 9) & ~v5;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v10, v11);
    *(void *)((v6 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v6 + v11) & 0xFFFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_217B9085C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

uint64_t sub_217B90898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 16;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 9 + a1) & ~v6;
  uint64_t v8 = (v6 + 9 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v7, v8);
  *(void *)((*(void *)(v5 + 48) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_217B90940(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 24;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 + 9 + a1) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 9) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v8, v9);
  *(void *)((*(void *)(v6 + 40) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v6 + 40) + 7 + v9) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_217B909E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 9 + a1) & ~v6;
  uint64_t v8 = (v6 + 9 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_217B90A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 40;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 9 + a1) & ~v6;
  uint64_t v8 = (v6 + 9 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v7, v8);
  *(void *)((*(void *)(v5 + 24) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_217B90B38(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (!a2) {
    return 0;
  }
  if (v6 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 9) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    int v9 = a2 - v6;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x217B90C5CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v6 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v6) {
    return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 9) & ~v7, v6, v4);
  }
  else {
    return 0;
  }
}

void sub_217B90C70(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v11 = ((*(void *)(v7 + 64) + ((v10 + 9) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    int v12 = a3 - v9;
    if (((*(_DWORD *)(v7 + 64) + ((v10 + 9) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (v11) {
      int v16 = 1;
    }
    else {
      int v16 = a2 - v9;
    }
    if (v11)
    {
      int v17 = ~v9 + a2;
      bzero(a1, ((*(void *)(v8 + 64) + ((v10 + 9) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x217B90E28);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        unint64_t v18 = (unint64_t)&a1[v10 + 9] & ~v10;
        __swift_storeEnumTagSinglePayload(v18, a2, v9, v6);
      }
      return;
  }
}

uint64_t type metadata accessor for BrightnessMultiply()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_217B90E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_217B90E70()
{
  uint64_t result = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_217B90F3C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = sub_217BD88D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84)) {
    size_t v8 = *(void *)(v7 + 64);
  }
  else {
    size_t v8 = *(void *)(v7 + 64) + 1;
  }
  if (v8 <= 8) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v12;
  uint64_t v14 = v9 + v12 + 1;
  unsigned int v15 = v12 | *(_DWORD *)(v7 + 80) & 0xF8;
  int v16 = (*(_DWORD *)(v7 + 80) | v12) & 0x100000;
  if (v15 > 7 || v16 != 0 || (v14 & (unint64_t)~v13) + *(void *)(*(void *)(v10 - 8) + 64) > 0x18)
  {
    uint64_t v19 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v19 + (((v15 | 7) + 16) & ~(unint64_t)(v15 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v20 = v6;
    unsigned int v21 = a2[v9];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v23 = v9;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *a2;
          goto LABEL_25;
        case 2:
          int v24 = *(unsigned __int16 *)a2;
          goto LABEL_25;
        case 3:
          int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_25;
        case 4:
          int v24 = *(_DWORD *)a2;
LABEL_25:
          if (v9 < 4) {
            unsigned int v21 = (v24 | (v22 << (8 * v9))) + 2;
          }
          else {
            unsigned int v21 = v24 + 2;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v25 = ~v13;
    if (v21 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v20);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v20);
      }
      *((unsigned char *)a1 + v9) = 1;
    }
    else
    {
      *a1 = *(void *)a2;
      *((unsigned char *)a1 + v9) = 0;
      swift_retain();
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((unint64_t)a1 + v14) & v25, (unint64_t)&a2[v14] & v25, v10);
  }
  return a1;
}

uint64_t sub_217B911C8(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = sub_217BD88D0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (*(_DWORD *)(v5 + 84)) {
    unint64_t v6 = *(void *)(v5 + 64);
  }
  else {
    unint64_t v6 = *(void *)(v5 + 64) + 1;
  }
  if (v6 <= 8) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  unsigned int v8 = a1[v7];
  unsigned int v9 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 4;
    }
    switch(v10)
    {
      case 1:
        int v11 = *a1;
        goto LABEL_16;
      case 2:
        int v11 = *(unsigned __int16 *)a1;
        goto LABEL_16;
      case 3:
        int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_16;
      case 4:
        int v11 = *(_DWORD *)a1;
LABEL_16:
        int v12 = (v11 | (v9 << (8 * v7))) + 2;
        unsigned int v8 = v11 + 2;
        if (v7 < 4) {
          unsigned int v8 = v12;
        }
        break;
      default:
        break;
    }
  }
  if (v8 == 1)
  {
    if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v4)) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, v4);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v13 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v14 = *(uint64_t (**)(unint64_t))(v13 + 8);
  unint64_t v15 = (unint64_t)&a1[v7 + 1 + *(unsigned __int8 *)(v13 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  return v14(v15);
}

void *sub_217B9137C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = sub_217BD88D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84)) {
    size_t v8 = *(void *)(v7 + 64);
  }
  else {
    size_t v8 = *(void *)(v7 + 64) + 1;
  }
  if (v8 <= 8) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = v8;
  }
  unsigned int v10 = a2[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a2;
        goto LABEL_16;
      case 2:
        int v13 = *(unsigned __int16 *)a2;
        goto LABEL_16;
      case 3:
        int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_16;
      case 4:
        int v13 = *(_DWORD *)a2;
LABEL_16:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    *((unsigned char *)a1 + v9) = 1;
  }
  else
  {
    *a1 = *(void *)a2;
    *((unsigned char *)a1 + v9) = 0;
    swift_retain();
  }
  uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 16))(((unint64_t)a1 + v9 + *(unsigned __int8 *)(v15 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (unint64_t)&a2[v9 + 1 + *(unsigned __int8 *)(v15 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

unsigned __int8 *sub_217B91578(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = sub_217BD88D0();
    uint64_t v7 = *(void *)(v6 - 8);
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    if (v8 <= 8) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = v8;
    }
    unsigned int v10 = a1[v9];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_17;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_17;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_17;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_17:
          if (v9 < 4) {
            unsigned int v10 = (v13 | (v11 << (8 * v9))) + 2;
          }
          else {
            unsigned int v10 = v13 + 2;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v14 = a2[v9];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v16 = v9;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_33;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_33;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_33;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_33:
          if (v9 < 4) {
            unsigned int v14 = (v17 | (v15 << (8 * v9))) + 2;
          }
          else {
            unsigned int v14 = v17 + 2;
          }
          break;
        default:
          break;
      }
    }
    if (v14 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      a1[v9] = 1;
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      a1[v9] = 0;
      swift_retain();
    }
  }
  uint64_t v18 = *(void *)(sub_217BD88D0() - 8);
  if (*(_DWORD *)(v18 + 84)) {
    unint64_t v19 = *(void *)(v18 + 64);
  }
  else {
    unint64_t v19 = *(void *)(v18 + 64) + 1;
  }
  if (v19 <= 8) {
    unint64_t v19 = 8;
  }
  uint64_t v20 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 24))((unint64_t)&a1[v19 + 1 + *(unsigned __int8 *)(v20 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (unint64_t)&a2[v19 + 1 + *(unsigned __int8 *)(v20 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

void *sub_217B918B4(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = sub_217BD88D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84)) {
    size_t v8 = *(void *)(v7 + 64);
  }
  else {
    size_t v8 = *(void *)(v7 + 64) + 1;
  }
  if (v8 <= 8) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = v8;
  }
  unsigned int v10 = a2[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a2;
        goto LABEL_16;
      case 2:
        int v13 = *(unsigned __int16 *)a2;
        goto LABEL_16;
      case 3:
        int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_16;
      case 4:
        int v13 = *(_DWORD *)a2;
LABEL_16:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      memcpy(a1, a2, v8);
      char v15 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v6);
      char v15 = 1;
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
  }
  else
  {
    char v15 = 0;
    *a1 = *(void *)a2;
  }
  *((unsigned char *)a1 + v9) = v15;
  uint64_t v16 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v16 + 32))(((unint64_t)a1 + v9 + *(unsigned __int8 *)(v16 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80), (unint64_t)&a2[v9 + 1 + *(unsigned __int8 *)(v16 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  return a1;
}

unsigned __int8 *sub_217B91AB0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = sub_217BD88D0();
    uint64_t v7 = *(void *)(v6 - 8);
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    if (v8 <= 8) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = v8;
    }
    unsigned int v10 = a1[v9];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_17;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_17;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_17;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_17:
          if (v9 < 4) {
            unsigned int v10 = (v13 | (v11 << (8 * v9))) + 2;
          }
          else {
            unsigned int v10 = v13 + 2;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6)) {
        (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
      }
    }
    else
    {
      swift_release();
    }
    unsigned int v14 = a2[v9];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v16 = v9;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_33;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_33;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_33;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_33:
          if (v9 < 4) {
            unsigned int v14 = (v17 | (v15 << (8 * v9))) + 2;
          }
          else {
            unsigned int v14 = v17 + 2;
          }
          break;
        default:
          break;
      }
    }
    if (v14 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
        char v18 = 1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v6);
        char v18 = 1;
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
    }
    else
    {
      char v18 = 0;
      *(void *)a1 = *(void *)a2;
    }
    a1[v9] = v18;
  }
  uint64_t v19 = *(void *)(sub_217BD88D0() - 8);
  if (*(_DWORD *)(v19 + 84)) {
    unint64_t v20 = *(void *)(v19 + 64);
  }
  else {
    unint64_t v20 = *(void *)(v19 + 64) + 1;
  }
  if (v20 <= 8) {
    unint64_t v20 = 8;
  }
  uint64_t v21 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v21 + 40))((unint64_t)&a1[v20 + 1 + *(unsigned __int8 *)(v21 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v21 + 80), (unint64_t)&a2[v20 + 1 + *(unsigned __int8 *)(v21 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  return a1;
}

uint64_t sub_217B91DEC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_217BD88D0() - 8);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= 0xFE) {
    unsigned int v10 = 254;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  if (*(_DWORD *)(v6 + 84)) {
    unint64_t v11 = *(void *)(v6 + 64);
  }
  else {
    unint64_t v11 = *(void *)(v6 + 64) + 1;
  }
  if (v11 <= 8) {
    unint64_t v11 = 8;
  }
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = v11 + v12 + 1;
  if (a2 <= v10) {
    goto LABEL_30;
  }
  uint64_t v15 = (v14 & ~v12) + v13;
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((a2 - v10 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v19 < 2)
    {
LABEL_30:
      if (v9 > 0xFE)
      {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v14) & ~v12, v9, v7);
      }
      else
      {
        unsigned int v23 = *((unsigned __int8 *)a1 + v11);
        if (v23 >= 2) {
          return (v23 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_30;
  }
LABEL_20:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = v15;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v10 + (v22 | v20) + 1;
}

void sub_217B92024(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(sub_217BD88D0() - 8);
  int v9 = *(_DWORD *)(v8 + 84);
  unint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(a4 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int *)(v12 + 84);
  if (v13 <= 0xFE) {
    unsigned int v14 = 254;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  if (v9) {
    unint64_t v15 = v10;
  }
  else {
    unint64_t v15 = v10 + 1;
  }
  if (v15 <= 8) {
    unint64_t v15 = 8;
  }
  uint64_t v16 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v17 = v15 + v16 + 1;
  size_t v18 = (v17 & ~v16) + *(void *)(v12 + 64);
  char v19 = 8 * v18;
  if (a3 <= v14)
  {
    int v20 = 0;
  }
  else if (v18 <= 3)
  {
    unsigned int v23 = ((a3 - v14 + ~(-1 << v19)) >> v19) + 1;
    if (HIWORD(v23))
    {
      int v20 = 4;
    }
    else if (v23 >= 0x100)
    {
      int v20 = 2;
    }
    else
    {
      int v20 = v23 > 1;
    }
  }
  else
  {
    int v20 = 1;
  }
  if (v14 < a2)
  {
    unsigned int v21 = ~v14 + a2;
    if (v18 < 4)
    {
      int v22 = (v21 >> v19) + 1;
      if (v18)
      {
        int v24 = v21 & ~(-1 << v19);
        bzero(a1, v18);
        if (v18 == 3)
        {
          *(_WORD *)a1 = v24;
          a1[2] = BYTE2(v24);
        }
        else if (v18 == 2)
        {
          *(_WORD *)a1 = v24;
        }
        else
        {
          *a1 = v24;
        }
      }
    }
    else
    {
      bzero(a1, v18);
      *(_DWORD *)a1 = v21;
      int v22 = 1;
    }
    switch(v20)
    {
      case 1:
        a1[v18] = v22;
        return;
      case 2:
        *(_WORD *)&a1[v18] = v22;
        return;
      case 3:
        goto LABEL_57;
      case 4:
        *(_DWORD *)&a1[v18] = v22;
        return;
      default:
        return;
    }
  }
  switch(v20)
  {
    case 1:
      a1[v18] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)&a1[v18] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_57:
      __break(1u);
      JUMPOUT(0x217B92358);
    case 4:
      *(_DWORD *)&a1[v18] = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        if (v13 > 0xFE)
        {
          __swift_storeEnumTagSinglePayload((unint64_t)&a1[v17] & ~v16, a2, v13, v11);
        }
        else if (a2 > 0xFE)
        {
          size_t v25 = (v15 + 1);
          if (v25 <= 3) {
            int v26 = ~(-1 << (8 * (v15 + 1)));
          }
          else {
            int v26 = -1;
          }
          if (v15 != -1)
          {
            int v27 = v26 & (a2 - 255);
            if (v25 <= 3) {
              int v28 = v15 + 1;
            }
            else {
              int v28 = 4;
            }
            bzero(a1, v25);
            switch(v28)
            {
              case 2:
                *(_WORD *)a1 = v27;
                break;
              case 3:
                *(_WORD *)a1 = v27;
                a1[2] = BYTE2(v27);
                break;
              case 4:
                *(_DWORD *)a1 = v27;
                break;
              default:
                *a1 = v27;
                break;
            }
          }
        }
        else
        {
          a1[v15] = -(char)a2;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for BackgroundPlatter()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_217B923A8(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (unsigned char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *((void *)v4 + 1) = a2[1];
    *((void *)v4 + 2) = v7;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v8 = *(int *)(a3 + 32);
    int v9 = &v4[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    *((void *)v4 + 5) = a2[5];
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *int v9 = *(unsigned char *)v10;
      *((void *)v9 + 1) = *(void *)(v10 + 8);
      uint64_t v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v12 = v11[6];
      uint64_t v13 = &v9[v12];
      unsigned int v14 = (void *)(v10 + v12);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v15 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
        }
      }
      else
      {
        *uint64_t v13 = *v14;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)&v9[v11[7]] = *(void *)(v10 + v11[7]);
      uint64_t v18 = v11[8];
      char v19 = &v9[v18];
      uint64_t v20 = v10 + v18;
      *(void *)char v19 = *(void *)v20;
      v19[8] = *(unsigned char *)(v20 + 8);
      v9[v11[9]] = *(unsigned char *)(v10 + v11[9]);
    }
    else
    {
      *(void *)int v9 = *(void *)v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = *(int *)(a3 + 36);
    int v22 = &v4[v21];
    unsigned int v23 = (uint64_t *)((char *)a2 + v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      *int v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_217B926C0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        uint64_t v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    uint64_t v6 = sub_217BD88D0();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_217BD7EC0();
    int v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_217B92844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = v3;
    *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
    *(void *)(v8 + 8) = *(void *)(v9 + 8);
    uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v11 = v10[6];
    uint64_t v12 = (void *)(v8 + v11);
    uint64_t v13 = (void *)(v9 + v11);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
      }
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    uint64_t v3 = v24;
    swift_storeEnumTagMultiPayload();
    *(void *)(v8 + v10[7]) = *(void *)(v9 + v10[7]);
    uint64_t v16 = v10[8];
    uint64_t v17 = v8 + v16;
    uint64_t v18 = v9 + v16;
    *(void *)uint64_t v17 = *(void *)v18;
    *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
    *(unsigned char *)(v8 + v10[9]) = *(unsigned char *)(v9 + v10[9]);
  }
  else
  {
    *(void *)uint64_t v8 = *(void *)v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = *(int *)(v3 + 36);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_217BD7EC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  else
  {
    *uint64_t v20 = *v21;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_217B92B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    sub_217B7FE68(a1 + v7, &qword_267BAEAF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
      *(void *)(v8 + 8) = *(void *)(v9 + 8);
      uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v11 = v10[6];
      uint64_t v12 = (void *)(v8 + v11);
      uint64_t v13 = (void *)(v9 + v11);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v14 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
        }
      }
      else
      {
        *uint64_t v12 = *v13;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)(v8 + v10[7]) = *(void *)(v9 + v10[7]);
      uint64_t v16 = v10[8];
      uint64_t v17 = v8 + v16;
      uint64_t v18 = v9 + v16;
      char v19 = *(unsigned char *)(v18 + 8);
      *(void *)uint64_t v17 = *(void *)v18;
      *(unsigned char *)(v17 + 8) = v19;
      *(unsigned char *)(v8 + v10[9]) = *(unsigned char *)(v9 + v10[9]);
    }
    else
    {
      *(void *)uint64_t v8 = *(void *)v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = *(int *)(a3 + 36);
    uint64_t v21 = (void *)(a1 + v20);
    uint64_t v22 = (void *)(a2 + v20);
    sub_217B7FE68(a1 + v20, &qword_267BAE848);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_217B92E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)uint64_t v7 = *(unsigned char *)v8;
    v7[1] = v8[1];
    uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v11 = v10[6];
    uint64_t v12 = (char *)v7 + v11;
    uint64_t v13 = (char *)v8 + v11;
    uint64_t v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      __dst = v12;
      uint64_t v15 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(__dst, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(__dst, v13, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
    *(void *)((char *)v7 + v10[7]) = *(void *)((char *)v8 + v10[7]);
    uint64_t v17 = v10[8];
    uint64_t v18 = (char *)v7 + v17;
    char v19 = (char *)v8 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    _OWORD v18[8] = v19[8];
    *((unsigned char *)v7 + v10[9]) = *((unsigned char *)v8 + v10[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v20 = *(int *)(a3 + 36);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_217BD7EC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  return a1;
}

uint64_t sub_217B930D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 32);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_217B7FE68(a1 + v6, &qword_267BAEAF8);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)uint64_t v7 = *(unsigned char *)v8;
      v7[1] = v8[1];
      uint64_t v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v11 = v10[6];
      uint64_t v12 = (char *)v7 + v11;
      uint64_t v13 = (char *)v8 + v11;
      uint64_t v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        __dst = v12;
        uint64_t v15 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(__dst, v13, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(__dst, v13, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v15);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
      }
      *(void *)((char *)v7 + v10[7]) = *(void *)((char *)v8 + v10[7]);
      uint64_t v17 = v10[8];
      uint64_t v18 = (char *)v7 + v17;
      char v19 = (char *)v8 + v17;
      *(void *)uint64_t v18 = *(void *)v19;
      _OWORD v18[8] = v19[8];
      *((unsigned char *)v7 + v10[9]) = *((unsigned char *)v8 + v10[9]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v20 = *(int *)(a3 + 36);
    uint64_t v21 = (void *)(a1 + v20);
    uint64_t v22 = (const void *)(a2 + v20);
    sub_217B7FE68(a1 + v20, &qword_267BAE848);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_217BD7EC0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_217B933D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B933EC);
}

uint64_t sub_217B933EC()
{
  OUTLINED_FUNCTION_15_0();
  if (v3) {
    return OUTLINED_FUNCTION_9_1(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
  OUTLINED_FUNCTION_2_3();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 32);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
    uint64_t v6 = *(int *)(v2 + 36);
  }
  uint64_t v7 = OUTLINED_FUNCTION_24(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_217B93484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B93498);
}

void sub_217B93498()
{
  OUTLINED_FUNCTION_8_1();
  if (v4)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
    OUTLINED_FUNCTION_2_3();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = *(int *)(v5 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
      uint64_t v8 = *(int *)(v5 + 36);
    }
    uint64_t v9 = OUTLINED_FUNCTION_14_0(v8);
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
}

uint64_t type metadata accessor for PhotoStyleValueLabels.ResetButton(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAED30);
}

void sub_217B93554()
{
  sub_217B900D0(319, &qword_267BAEB18, type metadata accessor for PhotoStyleValueLabels.Configuration, MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_217B900D0(319, (unint64_t *)&qword_267BAE890, MEMORY[0x263F18DD8], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_217B936AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v10 = *v11;
      *((void *)v10 + 1) = *((void *)v11 + 1);
      uint64_t v12 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v13 = v12[6];
      uint64_t v14 = &v10[v13];
      uint64_t v15 = &v11[v13];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v16 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
          __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
        }
      }
      else
      {
        *(void *)uint64_t v14 = *(void *)v15;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)&v10[v12[7]] = *(void *)&v11[v12[7]];
      uint64_t v19 = v12[8];
      uint64_t v20 = &v10[v19];
      uint64_t v21 = &v11[v19];
      *(void *)uint64_t v20 = *(void *)v21;
      v20[8] = v21[8];
      v10[v12[9]] = v11[v12[9]];
    }
    else
    {
      *(void *)uint64_t v10 = *(void *)v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = *(int *)(a3 + 32);
    uint64_t v23 = (uint64_t *)((char *)a1 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      void *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_217B939BC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        uint64_t v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    uint64_t v6 = sub_217BD88D0();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_217BD7EC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  else
  {
    return swift_release();
  }
}

void *sub_217B93B40(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = v3;
    *uint64_t v9 = *v10;
    *((void *)v9 + 1) = *((void *)v10 + 1);
    uint64_t v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v12 = v11[6];
    uint64_t v13 = &v9[v12];
    uint64_t v14 = &v10[v12];
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
      }
    }
    else
    {
      *(void *)uint64_t v13 = *(void *)v14;
      swift_retain();
    }
    uint64_t v3 = v25;
    swift_storeEnumTagMultiPayload();
    *(void *)&v9[v11[7]] = *(void *)&v10[v11[7]];
    uint64_t v17 = v11[8];
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    *(void *)uint64_t v18 = *(void *)v19;
    _OWORD v18[8] = v19[8];
    v9[v11[9]] = v10[v11[9]];
  }
  else
  {
    *(void *)uint64_t v9 = *(void *)v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = *(int *)(v3 + 32);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_217BD7EC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  }
  else
  {
    *uint64_t v21 = *v22;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_217B93DF8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_217B7FE68((uint64_t)a1 + v6, &qword_267BAEAF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v7 = *v8;
      *((void *)v7 + 1) = *((void *)v8 + 1);
      uint64_t v9 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v10 = v9[6];
      uint64_t v11 = &v7[v10];
      uint64_t v12 = &v8[v10];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v13 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
      }
      else
      {
        *(void *)uint64_t v11 = *(void *)v12;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(void *)&v7[v9[7]] = *(void *)&v8[v9[7]];
      uint64_t v15 = v9[8];
      uint64_t v16 = &v7[v15];
      uint64_t v17 = &v8[v15];
      char v18 = v17[8];
      *(void *)uint64_t v16 = *(void *)v17;
      v16[8] = v18;
      v7[v9[9]] = v8[v9[9]];
    }
    else
    {
      *(void *)uint64_t v7 = *(void *)v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = *(int *)(a3 + 32);
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    sub_217B7FE68((uint64_t)a1 + v19, &qword_267BAE848);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_217BD7EC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_217B940FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
    v8[1] = v9[1];
    uint64_t v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    uint64_t v12 = v11[6];
    uint64_t v13 = (char *)v8 + v12;
    uint64_t v14 = (char *)v9 + v12;
    uint64_t v15 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      __dst = v13;
      uint64_t v16 = sub_217BD88D0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v16))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
        memcpy(__dst, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(__dst, v14, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v16);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    *(void *)((char *)v8 + v11[7]) = *(void *)((char *)v9 + v11[7]);
    uint64_t v18 = v11[8];
    uint64_t v19 = (char *)v8 + v18;
    uint64_t v20 = (char *)v9 + v18;
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = v20[8];
    *((unsigned char *)v8 + v11[9]) = *((unsigned char *)v9 + v11[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v21 = *(int *)(a3 + 32);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_217BD7EC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  return a1;
}

void *sub_217B943B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_217B7FE68((uint64_t)a1 + v8, &qword_267BAEAF8);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v9 = *v10;
      *((void *)v9 + 1) = *((void *)v10 + 1);
      uint64_t v12 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      uint64_t v13 = v12[6];
      uint64_t v14 = &v9[v13];
      uint64_t v15 = &v10[v13];
      uint64_t v16 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        __dst = v14;
        uint64_t v17 = sub_217BD88D0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17))
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEA20);
          memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(__dst, v15, v17);
          __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v17);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      }
      *(void *)&v9[v12[7]] = *(void *)&v10[v12[7]];
      uint64_t v19 = v12[8];
      uint64_t v20 = &v9[v19];
      uint64_t v21 = &v10[v19];
      *(void *)uint64_t v20 = *(void *)v21;
      v20[8] = v21[8];
      v9[v12[9]] = v10[v12[9]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v22 = *(int *)(a3 + 32);
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    sub_217B7FE68((uint64_t)a1 + v22, &qword_267BAE848);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_217BD7EC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_217B946B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B946C8);
}

uint64_t sub_217B946C8()
{
  OUTLINED_FUNCTION_15_0();
  if (v3) {
    return OUTLINED_FUNCTION_9_1(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
  OUTLINED_FUNCTION_2_3();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 28);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
    uint64_t v6 = *(int *)(v2 + 32);
  }
  uint64_t v7 = OUTLINED_FUNCTION_24(v6);
  return __swift_getEnumTagSinglePayload(v7, v8, v9);
}

uint64_t sub_217B94760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B94774);
}

void sub_217B94774()
{
  OUTLINED_FUNCTION_8_1();
  if (v4)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEB00);
    OUTLINED_FUNCTION_2_3();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = *(int *)(v5 + 28);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE878);
      uint64_t v8 = *(int *)(v5 + 32);
    }
    uint64_t v9 = OUTLINED_FUNCTION_14_0(v8);
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
}

uint64_t type metadata accessor for PhotoStyleValueLabels.ValueLabel(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAED40);
}

void sub_217B94830()
{
  sub_217B900D0(319, &qword_267BAEB18, type metadata accessor for PhotoStyleValueLabels.Configuration, MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_217B900D0(319, (unint64_t *)&qword_267BAE890, MEMORY[0x263F18DD8], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_217B9497C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B94998()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B949B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_217B949D4()
{
  unint64_t result = qword_267BAED50;
  if (!qword_267BAED50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAED50);
  }
  return result;
}

uint64_t sub_217B94A20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B94A64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B94AA8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217B94AF0@<X0>(char *a1@<X8>)
{
  return sub_217B86C80(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_217B94AFC@<X0>(uint64_t a1@<X8>)
{
  return sub_217B873EC(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_217B94B08(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B94B34(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B94B60@<X0>(uint64_t a1@<X8>)
{
  return sub_217B882CC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_217B94B6C()
{
  return sub_217B86384();
}

unint64_t sub_217B94B94()
{
  unint64_t result = qword_267BAED80;
  if (!qword_267BAED80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAED70);
    sub_217B94AA8(&qword_267BAED88, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels);
    sub_217B7FD60(&qword_267BAED90, &qword_267BAED78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAED80);
  }
  return result;
}

unint64_t sub_217B94C64()
{
  unint64_t result = qword_267BAED98;
  if (!qword_267BAED98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAED98);
  }
  return result;
}

uint64_t sub_217B94CB4()
{
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  OUTLINED_FUNCTION_1(v0);
  return sub_217B85988();
}

uint64_t sub_217B94CF0@<X0>(uint64_t a1@<X8>)
{
  return sub_217B85B98(*(void *)(v1 + 16), a1);
}

unint64_t sub_217B94CFC()
{
  unint64_t result = qword_267BAEDF0;
  if (!qword_267BAEDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDE8);
    sub_217B94DC8(&qword_267BAEDF8, &qword_267BAEE00, (void (*)(void))sub_217B94E44);
    sub_217B7FD60(&qword_267BAE2D0, &qword_267BAE2D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEDF0);
  }
  return result;
}

uint64_t sub_217B94DC8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_217B94E44()
{
  unint64_t result = qword_267BAEE08;
  if (!qword_267BAEE08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEE10);
    sub_217B94DC8(&qword_267BAEE18, &qword_267BAEE20, (void (*)(void))sub_217B94F1C);
    sub_217B94AA8(&qword_267BAEE58, MEMORY[0x263F1A4D0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE08);
  }
  return result;
}

unint64_t sub_217B94F1C()
{
  unint64_t result = qword_267BAEE28;
  if (!qword_267BAEE28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEE30);
    sub_217B94FBC();
    sub_217B7FD60(&qword_267BAEE48, &qword_267BAEE50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE28);
  }
  return result;
}

unint64_t sub_217B94FBC()
{
  unint64_t result = qword_267BAEE38;
  if (!qword_267BAEE38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEE40);
    sub_217B7FD60(&qword_267BAEAA8, &qword_267BAEAB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE38);
  }
  return result;
}

unint64_t sub_217B9505C()
{
  unint64_t result = qword_267BAEE60;
  if (!qword_267BAEE60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDC8);
    sub_217B7FD60(&qword_267BAEE68, &qword_267BAEDC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE60);
  }
  return result;
}

uint64_t sub_217B950FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_217BD80D0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_217B95130()
{
  return sub_217BD80E0();
}

uint64_t sub_217B95160()
{
  uint64_t v0 = sub_217BD80B0();
  return OUTLINED_FUNCTION_18_0(v0);
}

uint64_t sub_217B9518C()
{
  return sub_217BD80C0();
}

uint64_t sub_217B951B4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_217B951C4(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_217B951DC()
{
  unint64_t result = qword_267BAEE80;
  if (!qword_267BAEE80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDD8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDC8);
    sub_217BD7FB0();
    sub_217B9505C();
    sub_217B94AA8(&qword_267BAEE70, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    sub_217B7FD60(&qword_267BAEE88, &qword_267BAEE90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE80);
  }
  return result;
}

unint64_t sub_217B95300()
{
  unint64_t result = qword_267BAEE98;
  if (!qword_267BAEE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEE98);
  }
  return result;
}

uint64_t sub_217B9534C()
{
  return sub_217B86184(*(void *)(v0 + 16));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAEAF8);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        uint64_t v6 = v5 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    uint64_t v7 = sub_217BD88D0();
    if (!__swift_getEnumTagSinglePayload(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217BD7EC0();
    OUTLINED_FUNCTION_3();
    uint64_t v8 = OUTLINED_FUNCTION_5_0();
    v9(v8);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_217B95540()
{
  uint64_t v0 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  OUTLINED_FUNCTION_1(v0);
  return sub_217B86330();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_217B955D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_217B95634()
{
  unint64_t result = qword_267BAEEE8;
  if (!qword_267BAEEE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEEC8);
    sub_217B7FD60(&qword_267BAEEF0, &qword_267BAEEC0);
    sub_217B7FD60(&qword_267BAEEF8, &qword_267BAEF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEEE8);
  }
  return result;
}

uint64_t sub_217B956F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_217B95748(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  else
  {
    return swift_retain();
  }
}

uint64_t sub_217B95748(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_217B95758(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_217B957A8(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_217B957A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_217B957B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v7 = *(void *)(a1 + 128);
  char v8 = *(unsigned char *)(a1 + 136);
  uint64_t v9 = *(void *)(a1 + 144);
  char v11 = *(unsigned char *)(a1 + 160);
  uint64_t v12 = *(void *)(a1 + 152);
  sub_217B957A8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_217B9588C(v2, v3, v4, v5, v6, v7, v8);
  sub_217B957A8(v9, v12, v11);
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_217B9588C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  sub_217B957A8(a1, a2, a3 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  if (a7)
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_217B958FC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  sub_217B95748(a1, a2, a3 & 1);
  if (a7) {
    swift_retain();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_217B95954()
{
  unint64_t result = qword_267BAEF58;
  if (!qword_267BAEF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEF50);
    sub_217B7FD60(&qword_267BAEF60, &qword_267BAEF68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAEF58);
  }
  return result;
}

uint64_t sub_217B959F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_217B95A50(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B95A84(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B95AB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B95ADC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_217B95B2C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_28();
  v5(v4);
  return a2;
}

uint64_t sub_217B95B80@<X0>(uint64_t a1@<X8>)
{
  return sub_217B8ABE4(a1);
}

uint64_t sub_217B95BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B8B9D0(a1, a2, a3, a4, sub_217B8AD88);
}

uint64_t sub_217B95BD0()
{
  return sub_217B8BA64(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_217B95BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B95C58()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B95C90()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = sub_217B8A4E4();
  return OUTLINED_FUNCTION_18_0(v0);
}

uint64_t sub_217B95CB8(unsigned __int8 *a1)
{
  return sub_217B8A1DC();
}

void sub_217B95CF8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 43) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_217B95D08()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = sub_217B8A2F4();
  return OUTLINED_FUNCTION_18_0(v0);
}

uint64_t sub_217B95D30(unsigned __int8 *a1)
{
  return sub_217B8A1DC();
}

void sub_217B95D70()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 42) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_217B95D80()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = sub_217B8A13C();
  return OUTLINED_FUNCTION_18_0(v0);
}

uint64_t sub_217B95DA8(unsigned __int8 *a1)
{
  return sub_217B8A1DC();
}

void sub_217B95DE8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 41) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_217B95DF8()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = sub_217B89FE4();
  return OUTLINED_FUNCTION_18_0(v0);
}

uint64_t sub_217B95E20(unsigned __int8 *a1)
{
  return sub_217B8A1DC();
}

void sub_217B95E60()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 40) = *(unsigned char *)(v0 + 24);
}

void sub_217B95E70()
{
  OUTLINED_FUNCTION_1_0();
  double *v0 = sub_217B89E20();
}

uint64_t sub_217B95E98()
{
  return sub_217B89C58();
}

double sub_217B95EDC()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 32) = result;
  return result;
}

void sub_217B95EEC()
{
  OUTLINED_FUNCTION_1_0();
  double *v0 = sub_217B89BB8();
}

uint64_t sub_217B95F14()
{
  return sub_217B89C58();
}

double sub_217B95F58()
{
  double result = *(double *)(v0 + 24);
  *(double *)(*(void *)(v0 + 16) + 24) = result;
  return result;
}

void sub_217B95F68()
{
  OUTLINED_FUNCTION_1_0();
  double *v0 = sub_217B89A54();
}

uint64_t sub_217B95F90()
{
  return sub_217B89C58();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_217B96038@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_217BD8070();
  *a1 = v3;
  return result;
}

uint64_t sub_217B96064()
{
  return sub_217BD8080();
}

uint64_t sub_217B9608C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_28();
  v5(v4);
  return a2;
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabelsConfigurationKey()
{
  return &type metadata for PhotoStyleValueLabelsConfigurationKey;
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabels.NumberSpaceMaintainer()
{
  return &type metadata for PhotoStyleValueLabels.NumberSpaceMaintainer;
}

uint64_t sub_217B960FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_217B96410()
{
  return swift_getWitnessTable();
}

uint64_t sub_217B96618()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_217B96678()
{
  unint64_t result = qword_267BAF000;
  if (!qword_267BAF000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDB0);
    sub_217B96718();
    sub_217B7FD60(&qword_267BAF028, &qword_267BAEDB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF000);
  }
  return result;
}

unint64_t sub_217B96718()
{
  unint64_t result = qword_267BAF008;
  if (!qword_267BAF008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDA8);
    sub_217B96794();
    sub_217B9686C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF008);
  }
  return result;
}

unint64_t sub_217B96794()
{
  unint64_t result = qword_267BAF010;
  if (!qword_267BAF010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEDA0);
    sub_217B94DC8(&qword_267BAEE78, &qword_267BAEDE0, (void (*)(void))sub_217B951DC);
    sub_217B94AA8(&qword_267BAF018, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF010);
  }
  return result;
}

unint64_t sub_217B9686C()
{
  unint64_t result = qword_267BAF020;
  if (!qword_267BAF020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF020);
  }
  return result;
}

unint64_t sub_217B968BC()
{
  unint64_t result = qword_267BAF030;
  if (!qword_267BAF030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEED8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAEEC8);
    sub_217B95634();
    swift_getOpaqueTypeConformance2();
    sub_217B94AA8(&qword_267BAF018, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF030);
  }
  return result;
}

uint64_t sub_217B9699C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B969B8()
{
  return MEMORY[0x263F1A820];
}

void OUTLINED_FUNCTION_5_2()
{
  char v5 = byte_267BAE9E8;
  *(unsigned char *)uint64_t v0 = 0;
  *(void *)(v0 + 8) = v4;
  *(void *)(v0 + v3[7]) = 0x4028000000000000;
  uint64_t v6 = v0 + v3[8];
  *(void *)uint64_t v6 = v2;
  *(unsigned char *)(v6 + 8) = v1 & 1;
  *(unsigned char *)(v0 + v3[9]) = v5;
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return type metadata accessor for PhotoStyleValueLabels.Configuration(0);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t result)
{
  unsigned char *v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_22_0(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_217BD7EF0();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_217BD7E50();
}

uint64_t sub_217B96C14()
{
  uint64_t v0 = sub_217BD7B70();
  __swift_allocate_value_buffer(v0, qword_267BAF040);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BAF040);
  return sub_217BD7B60();
}

uint64_t sub_217B96C98()
{
  uint64_t v0 = sub_217BD7B70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_217BD7AF0();
  __swift_allocate_value_buffer(v4, qword_267BAF058);
  __swift_project_value_buffer(v4, (uint64_t)qword_267BAF058);
  if (qword_267BADEE8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_267BAF040);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_217BD7AD0();
}

void sub_217B96DD4()
{
  algn_267BAF078[5] = 0;
  *(_WORD *)&algn_267BAF078[6] = -5120;
}

void sub_217B96E00()
{
  qword_267BAF080 = 0x69746E6961706E69;
  *(void *)algn_267BAF088 = 0xEA0000000000676ELL;
}

void sub_217B96E28()
{
  qword_267BAF090 = 0x656D656E69666572;
  *(void *)algn_267BAF098 = 0xEA0000000000746ELL;
}

id sub_217B96E50(uint64_t a1)
{
  uint64_t v3 = &v2[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
  *uint64_t v3 = 0;
  v3[1] = 0;
  *(void *)&v2[OBJC_IVAR___PEModelDeliveryManager_networkMonitor] = 0;
  *(void *)&v2[OBJC_IVAR___PEModelDeliveryManager_packageType] = a1;
  v2[OBJC_IVAR___PEModelDeliveryManager_isNetworkAvailable] = 1;
  switch(a1)
  {
    case 0:
      uint64_t v1 = type metadata accessor for PECleanupModelDeliveryHelper();
      uint64_t v4 = swift_allocObject();
      uint64_t v5 = (uint64_t *)&v2[OBJC_IVAR___PEModelDeliveryManager_packageHelper];
      uint64_t v6 = &off_26C81F5B8;
      break;
    case 1:
      type metadata accessor for PEDebugSimulatedModelDeliveryHelper();
      uint64_t v4 = OUTLINED_FUNCTION_33();
      __asm { FMOV            V0.2D, #4.0 }
      goto LABEL_6;
    case 2:
      type metadata accessor for PEDebugSimulatedModelDeliveryHelper();
      uint64_t v4 = OUTLINED_FUNCTION_33();
      _Q0 = xmmword_217BDE440;
LABEL_6:
      *(_OWORD *)(v4 + 16) = _Q0;
      *(_WORD *)(v4 + 32) = 0;
      goto LABEL_10;
    case 3:
      type metadata accessor for PEDebugSimulatedModelDeliveryHelper();
      uint64_t v4 = OUTLINED_FUNCTION_33();
      __asm { FMOV            V0.2D, #4.0 }
      *(_OWORD *)(v4 + 16) = _Q0;
      __int16 v13 = 1;
      goto LABEL_9;
    case 4:
      type metadata accessor for PEDebugSimulatedModelDeliveryHelper();
      uint64_t v4 = OUTLINED_FUNCTION_33();
      __asm { FMOV            V0.2D, #4.0 }
      *(_OWORD *)(v4 + 16) = _Q0;
      __int16 v13 = 256;
LABEL_9:
      *(_WORD *)(v4 + 32) = v13;
LABEL_10:
      uint64_t v5 = (uint64_t *)&v2[OBJC_IVAR___PEModelDeliveryManager_packageHelper];
      uint64_t v6 = &off_26C81F590;
      break;
    default:
      uint64_t v1 = type metadata accessor for PEEmptyModelDeliveryHelper();
      uint64_t v4 = swift_allocObject();
      uint64_t v5 = (uint64_t *)&v2[OBJC_IVAR___PEModelDeliveryManager_packageHelper];
      uint64_t v6 = &off_26C81F568;
      break;
  }
  v5[3] = v1;
  v5[4] = (uint64_t)v6;
  *uint64_t v5 = v4;
  uint64_t v15 = &v2[OBJC_IVAR___PEModelDeliveryManager_progressCallback];
  *uint64_t v15 = nullsub_1;
  v15[1] = 0;
  v2[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 0;
  v17.receiver = v2;
  v17.super_class = (Class)PEModelDeliveryManager;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t sub_217B9702C()
{
  uint64_t v1 = sub_217BD8A60();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  uint64_t v7 = v6 - v5;
  sub_217BD7BD0();
  swift_allocObject();
  *(void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_networkMonitor) = sub_217BD7BC0();
  swift_retain();
  swift_release();
  sub_217B7C758(0, (unint64_t *)&qword_267BAE338);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, *MEMORY[0x263F8F040], v1);
  char v8 = (void *)sub_217BD8C50();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  sub_217BD7BA0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_217B9DFA8((uint64_t)sub_217B9DFA0);
  sub_217BD7B90();
  swift_release();

  return swift_release_n();
}

void sub_217B971D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217BD7B80();
  uint64_t v87 = *(void *)(v4 - 8);
  uint64_t v88 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v73[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v91 = sub_217BD7C30();
  uint64_t v93 = *(void *)(v91 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v91);
  uint64_t v90 = &v73[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v89 = &v73[-v10];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  __int16 v13 = &v73[-v12];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v73[-v14];
  uint64_t v16 = sub_217BD7C10();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v73[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = &v73[-v21];
  swift_beginAccess();
  uint64_t v23 = MEMORY[0x21D458B90](a2 + 16);
  if (v23)
  {
    uint64_t v24 = (unsigned char *)v23;
    uint64_t v82 = v13;
    sub_217BD7C20();
    uint64_t v25 = *(void (**)(void))(v17 + 104);
    unsigned int v86 = *MEMORY[0x263F142F8];
    uint64_t v84 = (void (*)(unsigned char *, void, uint64_t))v25;
    uint64_t v85 = v17 + 104;
    v25(v20);
    char v26 = sub_217BD7C00();
    int v27 = *(void (**)(unsigned char *, uint64_t))(v17 + 8);
    v27(v20, v16);
    uint64_t v83 = v27;
    v27(v22, v16);
    uint64_t v92 = a1;
    if (v26)
    {
      uint64_t v80 = v6;
      uint64_t v81 = v24;
      if (qword_267BADEE8 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_217BD7B70();
      __swift_project_value_buffer(v28, (uint64_t)qword_267BAF040);
      uint64_t v29 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v93 + 16);
      uint64_t v30 = v91;
      v29(v15, a1, v91);
      v29(v82, a1, v30);
      uint64_t v31 = sub_217BD7B50();
      os_log_type_t v32 = sub_217BD8C20();
      int v33 = v32;
      os_log_t v79 = v31;
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v34 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 67109376;
        int v78 = v33;
        int v35 = sub_217BD7BE0() & 1;
        uint64_t v36 = *(void (**)(unsigned char *, uint64_t))(v93 + 8);
        uint64_t v76 = v93 + 8;
        uint64_t v77 = v36;
        v36(v15, v30);
        int v94 = v35;
        uint64_t v75 = &v95;
        sub_217BD8CB0();
        *(_WORD *)(v34 + 8) = 1024;
        uint64_t v37 = v87;
        uint64_t v38 = v88;
        uint64_t v6 = v80;
        (*(void (**)(unsigned char *, void, uint64_t))(v87 + 104))(v80, *MEMORY[0x263F141A8], v88);
        uint64_t v39 = v82;
        int v74 = sub_217BD7BF0();
        (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v6, v38);
        LODWORD(v37) = v74 & 1;
        v77(v39, v30);
        int v94 = v37;
        sub_217BD8CB0();
        uint64_t v40 = v79;
        _os_log_impl(&dword_217B65000, v79, (os_log_type_t)v78, "Network is connected; is expensive? %{BOOL}d usesCell: %{BOOL}d",
          (uint8_t *)v34,
          0xEu);
        MEMORY[0x21D458AE0](v34, -1, -1);
        uint64_t v24 = v81;
      }
      else
      {
        uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v93 + 8);
        v44(v82, v30);
        v44(v15, v30);
        uint64_t v6 = v80;
        uint64_t v24 = v81;
        uint64_t v40 = v79;
      }
    }
    else
    {
      if (qword_267BADEE8 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_217BD7B70();
      __swift_project_value_buffer(v41, (uint64_t)qword_267BAF040);
      uint64_t v40 = sub_217BD7B50();
      os_log_type_t v42 = sub_217BD8C20();
      if (os_log_type_enabled(v40, v42))
      {
        int v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v43 = 0;
        _os_log_impl(&dword_217B65000, v40, v42, "Network is not connected", v43, 2u);
        MEMORY[0x21D458AE0](v43, -1, -1);
      }
      uint64_t v30 = v91;
    }

    uint64_t v45 = v92;
    sub_217BD7C20();
    v84(v20, v86, v16);
    char v46 = sub_217BD7C00();
    uint64_t v47 = v83;
    v83(v20, v16);
    v47(v22, v16);
    uint64_t v48 = v93;
    uint64_t v49 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v93 + 16);
    uint64_t v50 = v89;
    v49(v89, v45, v30);
    if (v46) {
      char v51 = sub_217BD7BE0() ^ 1;
    }
    else {
      char v51 = 0;
    }
    uint64_t v52 = v90;
    uint64_t v53 = *(void (**)(unsigned char *, uint64_t))(v48 + 8);
    v53(v50, v30);
    v49(v52, v92, v30);
    if (v51)
    {
      uint64_t v55 = v87;
      uint64_t v54 = v88;
      (*(void (**)(unsigned char *, void, uint64_t))(v87 + 104))(v6, *MEMORY[0x263F141A8], v88);
      char v56 = sub_217BD7BF0();
      (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v6, v54);
      v53(v52, v30);
      if ((v56 & 1) == 0)
      {
        uint64_t v57 = OBJC_IVAR___PEModelDeliveryManager_isNetworkAvailable;
        if ((v24[OBJC_IVAR___PEModelDeliveryManager_isNetworkAvailable] & 1) == 0)
        {
          if (qword_267BADEE8 != -1) {
            swift_once();
          }
          uint64_t v58 = sub_217BD7B70();
          __swift_project_value_buffer(v58, (uint64_t)qword_267BAF040);
          uint64_t v59 = sub_217BD7B50();
          os_log_type_t v60 = sub_217BD8C20();
          if (os_log_type_enabled(v59, v60))
          {
            uint64_t v61 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v61 = 0;
            _os_log_impl(&dword_217B65000, v59, v60, "Resuming download", v61, 2u);
            MEMORY[0x21D458AE0](v61, -1, -1);
          }

          v24[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 0;
          v24[v57] = 1;
          uint64_t v62 = *(void (**)(void, void))&v24[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
          if (v62)
          {
            swift_retain();
            v62(0, 0);
            sub_217B9DDA8((uint64_t)v62);
          }
          sub_217B97B9C();
        }
LABEL_34:

        return;
      }
    }
    else
    {
      v53(v52, v30);
    }
    uint64_t v63 = OBJC_IVAR___PEModelDeliveryManager_isNetworkAvailable;
    if (v24[OBJC_IVAR___PEModelDeliveryManager_isNetworkAvailable] == 1)
    {
      if (qword_267BADEE8 != -1) {
        swift_once();
      }
      uint64_t v64 = sub_217BD7B70();
      __swift_project_value_buffer(v64, (uint64_t)qword_267BAF040);
      uint64_t v65 = sub_217BD7B50();
      os_log_type_t v66 = sub_217BD8C20();
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v67 = 0;
        _os_log_impl(&dword_217B65000, v65, v66, "Pausing download; showing error message", v67, 2u);
        MEMORY[0x21D458AE0](v67, -1, -1);
      }

      v24[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 6;
      v24[v63] = 0;
      uint64_t v68 = *(void (**)(void, id))&v24[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
      if (v68)
      {
        uint64_t v69 = sub_217BD8B10();
        uint64_t v71 = v70;
        objc_allocWithZone(MEMORY[0x263F087E8]);
        swift_retain();
        id v72 = sub_217B9D158(v69, v71, 3, 0);
        v68(0, v72);
        sub_217B9DDA8((uint64_t)v68);
      }
    }
    goto LABEL_34;
  }
}

uint64_t sub_217B97B9C()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF0E0);
  uint64_t v3 = OUTLINED_FUNCTION_7_1(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_1();
  uint64_t v4 = sub_217BD8BC0();
  uint64_t v5 = OUTLINED_FUNCTION_44();
  __swift_storeEnumTagSinglePayload(v5, v6, v7, v4);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v0;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v4);
  id v10 = v0;
  if (EnumTagSinglePayload == 1)
  {
    sub_217B9D720(v1, &qword_267BAF0E0);
  }
  else
  {
    sub_217BD8BB0();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_38();
    v11();
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_217BD8B90();
      swift_unknownObjectRelease();
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_267BAF1A0;
  *(void *)(v12 + 24) = v8;
  swift_task_create();
  return swift_release();
}

uint64_t sub_217B97D7C()
{
  uint64_t v1 = OBJC_IVAR___PEModelDeliveryManager_networkMonitor;
  if (*(void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_networkMonitor))
  {
    swift_retain();
    sub_217BD7BB0();
    swift_release();
    *(void *)(v0 + v1) = 0;
    return swift_release();
  }
  return result;
}

BOOL sub_217B97E38()
{
  return *(unsigned char *)(v0 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) == 4;
}

uint64_t sub_217B97E78()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_packageHelper), *(void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_packageHelper + 24));
  uint64_t v1 = OUTLINED_FUNCTION_27();
  return v2(v1) & 1;
}

void sub_217B97EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF0E0);
  uint64_t v12 = OUTLINED_FUNCTION_7_1(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_1();
  if (v6[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState])
  {
    if (qword_267BADEE8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_217BD7B70();
    __swift_project_value_buffer(v13, (uint64_t)qword_267BAF040);
    uint64_t v30 = v6;
    uint64_t v14 = sub_217BD7B50();
    os_log_type_t v15 = sub_217BD8C00();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446466;
      type metadata accessor for PEModelDeliveryPackage(0);
      uint64_t v17 = sub_217BD8B30();
      sub_217B8D0FC(v17, v18, &v31);
      sub_217BD8CB0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      uint64_t v19 = sub_217BD8B30();
      sub_217B8D0FC(v19, v20, &v31);
      sub_217BD8CB0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217B65000, v14, v15, "Package delivery manager %{public}s attempt to start download when state is %{public}s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_2_4();
    }
    else
    {
    }
  }
  else
  {
    uint64_t v21 = &v6[OBJC_IVAR___PEModelDeliveryManager_progressCallback];
    *(void *)uint64_t v21 = a1;
    *((void *)v21 + 1) = a2;
    swift_retain();
    swift_release();
    uint64_t v22 = &v6[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
    uint64_t v23 = *(void *)&v6[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
    *(void *)uint64_t v22 = a3;
    *((void *)v22 + 1) = a4;
    sub_217B9DDA8(v23);
    sub_217BD8BC0();
    uint64_t v24 = OUTLINED_FUNCTION_44();
    __swift_storeEnumTagSinglePayload(v24, v25, v26, v27);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v6;
    uint64_t v29 = v6;
    swift_retain();
    sub_217B98318(v5, (uint64_t)&unk_267BAF190, (uint64_t)v28);
    swift_release();
  }
}

uint64_t sub_217B98250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_217B98270, 0, 0);
}

uint64_t sub_217B98270()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR___PEModelDeliveryManager_packageHelper), *(void *)(v1 + OBJC_IVAR___PEModelDeliveryManager_packageHelper + 24));
  uint64_t v2 = OUTLINED_FUNCTION_27();
  if (v3(v2))
  {
    *(unsigned char *)(v1 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) = 2;
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) = 0;
    sub_217B9702C();
  }
  sub_217B97B9C();
  OUTLINED_FUNCTION_13_1();
  return v4();
}

uint64_t sub_217B98318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217BD8BC0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_217B9D720(a1, &qword_267BAF0E0);
  }
  else
  {
    sub_217BD8BB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_217BD8B90();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_217B98560(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_217BD7820();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_217B985D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_217B985F0, 0, 0);
}

uint64_t sub_217B985F0()
{
  uint64_t v36 = v1;
  uint64_t v2 = (void **)(v1 + 24);
  uint64_t v3 = *(unsigned char **)(v1 + 24);
  uint64_t v4 = (void *)(v1 + 16);
  uint64_t v5 = OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState;
  switch(v3[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState])
  {
    case 1:
      v3[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 2;
      sub_217B97B9C();
      break;
    case 2:
      v3[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 3;
      uint64_t v9 = *(void *)&v3[OBJC_IVAR___PEModelDeliveryManager_progressCallback];
      swift_retain();
      ((void (*)(uint64_t, double))v9)(1, 1.0);
      swift_release();
      __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR___PEModelDeliveryManager_packageHelper], *(void *)&v3[OBJC_IVAR___PEModelDeliveryManager_packageHelper + 24]);
      uint64_t v10 = swift_allocObject();
      OUTLINED_FUNCTION_59(v10);
      uint64_t v11 = *(void (**)(void))(v9 + 32);
      uint64_t v12 = v3;
      OUTLINED_FUNCTION_57();
      v11();
      goto LABEL_5;
    case 3:
      v3[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 4;
      uint64_t v13 = (uint64_t *)&v3[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
      uint64_t v14 = *(void (**)(uint64_t))&v3[OBJC_IVAR___PEModelDeliveryManager_updateHandler];
      if (v14)
      {
        swift_retain();
        uint64_t v15 = OUTLINED_FUNCTION_42();
        v14(v15);
        sub_217B9DDA8((uint64_t)v14);
        uint64_t v16 = *v13;
      }
      else
      {
        uint64_t v16 = 0;
      }
      *uint64_t v13 = 0;
      v13[1] = 0;
      sub_217B9DDA8(v16);
      break;
    case 4:
      objc_msgSend(*(id *)(v1 + 24), sel_stopNetworkMonitoring);
      break;
    case 5:
    case 6:
      break;
    default:
      v3[OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState] = 1;
      __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR___PEModelDeliveryManager_packageHelper], *(void *)&v3[OBJC_IVAR___PEModelDeliveryManager_packageHelper + 24]);
      uint64_t v6 = swift_allocObject();
      OUTLINED_FUNCTION_59(v6);
      uint64_t v7 = *(void (**)(void))(v0 + 24);
      uint64_t v8 = v3;
      OUTLINED_FUNCTION_57();
      v7();
LABEL_5:
      uint64_t v5 = v34;
      swift_release();
      break;
  }
  if (qword_267BADEE8 != -1) {
    swift_once();
  }
  uint64_t v17 = *v2;
  uint64_t v18 = sub_217BD7B70();
  __swift_project_value_buffer(v18, (uint64_t)qword_267BAF040);
  id v19 = v17;
  unint64_t v20 = sub_217BD7B50();
  os_log_type_t v21 = sub_217BD8C20();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = (char *)*v2;
  if (v22)
  {
    os_log_type_t type = v21;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136446466;
    *uint64_t v4 = *(void *)&v23[OBJC_IVAR___PEModelDeliveryManager_packageType];
    type metadata accessor for PEModelDeliveryPackage(0);
    uint64_t v25 = sub_217BD8B20();
    uint64_t v27 = sub_217B8D0FC(v25, v26, &v35);
    OUTLINED_FUNCTION_68(v27);

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    *(unsigned char *)uint64_t v4 = v3[v5];
    uint64_t v28 = sub_217BD8B20();
    uint64_t v30 = sub_217B8D0FC(v28, v29, &v35);
    OUTLINED_FUNCTION_68(v30);

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217B65000, v20, type, "Model delivery manager for %{public}s entered stage: %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
  }
  else
  {
  }
  OUTLINED_FUNCTION_13_1();
  return v31();
}

void sub_217B989F8(char a1, uint64_t a2, double a3)
{
  switch(a1)
  {
    case 1:
      *(unsigned char *)(a2 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) = 2;
      sub_217B97B9C();
      break;
    case 2:
      uint64_t v6 = *(void (**)(void, id))(a2 + OBJC_IVAR___PEModelDeliveryManager_updateHandler);
      if (v6)
      {
        uint64_t v7 = sub_217BD8B10();
        uint64_t v9 = v8;
        objc_allocWithZone(MEMORY[0x263F087E8]);
        swift_retain();
        id v10 = sub_217B9D158(v7, v9, 1, 0);
        v6(0, v10);
        sub_217B9DDA8((uint64_t)v6);
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) = 5;
      break;
    case 3:
      return;
    case 4:
      uint64_t v11 = OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState;
      if (*(unsigned char *)(a2 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) != 6)
      {
        uint64_t v12 = *(void (**)(void, id))(a2 + OBJC_IVAR___PEModelDeliveryManager_updateHandler);
        if (v12)
        {
          uint64_t v13 = sub_217BD8B10();
          uint64_t v15 = v14;
          objc_allocWithZone(MEMORY[0x263F087E8]);
          swift_retain();
          id v16 = sub_217B9D158(v13, v15, 2, 0);
          v12(0, v16);
          sub_217B9DDA8((uint64_t)v12);
        }
        *(unsigned char *)(a2 + v11) = 5;
      }
      break;
    default:
      uint64_t v5 = *(void (**)(void, double))(a2 + OBJC_IVAR___PEModelDeliveryManager_progressCallback);
      swift_retain();
      v5(0, a3);
      swift_release();
      break;
  }
}

uint64_t sub_217B98C28(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return sub_217B97B9C();
  }
  *(unsigned char *)(a3 + OBJC_IVAR___PEModelDeliveryManager_deliveryManagerState) = 5;
  uint64_t v3 = *(void (**)(void, uint64_t))(a3 + OBJC_IVAR___PEModelDeliveryManager_updateHandler);
  if (v3)
  {
    swift_retain();
    v3(0, a2);
    return sub_217B9DDA8((uint64_t)v3);
  }
  return result;
}

uint64_t sub_217B98CC8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_packageHelper + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_packageHelper + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___PEModelDeliveryManager_packageHelper), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

void __swiftcall PEModelDeliveryManager.init()(PEModelDeliveryManager *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void PEModelDeliveryManager.init()()
{
}

uint64_t type metadata accessor for PEModelDeliveryManager(uint64_t a1)
{
  return sub_217B7C758(a1, &qword_267BAF0D8);
}

uint64_t sub_217B98EA4()
{
  uint64_t v162 = sub_217BD79D0();
  OUTLINED_FUNCTION_0();
  uint64_t v161 = v0;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_5();
  uint64_t v160 = v3 - v2;
  uint64_t v4 = sub_217BD7890();
  OUTLINED_FUNCTION_0();
  char v173 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_64();
  uint64_t v172 = v7;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_12_2();
  uint64_t v171 = v9;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_12_2();
  uint64_t v169 = v11;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v19);
  os_log_type_t v21 = (char *)&v156 - v20;
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF170);
  OUTLINED_FUNCTION_0();
  uint64_t v163 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_5();
  uint64_t v26 = v25 - v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF178);
  uint64_t v28 = OUTLINED_FUNCTION_7_1(v27);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_64();
  uint64_t v170 = v29;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_5_3();
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v156 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)&v156 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&v156 - v40;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_12_2();
  uint64_t v176 = v42;
  OUTLINED_FUNCTION_8_2();
  uint64_t v44 = MEMORY[0x270FA5388](v43);
  char v46 = (char *)&v156 - v45;
  uint64_t v47 = MEMORY[0x270FA5388](v44);
  uint64_t v49 = (char *)&v156 - v48;
  uint64_t v50 = MEMORY[0x270FA5388](v47);
  uint64_t v52 = (char *)&v156 - v51;
  MEMORY[0x270FA5388](v50);
  uint64_t v177 = (uint64_t)&v156 - v53;
  __swift_storeEnumTagSinglePayload((uint64_t)&v156 - v53, 1, 1, v4);
  uint64_t v175 = v52;
  uint64_t v54 = OUTLINED_FUNCTION_44();
  __swift_storeEnumTagSinglePayload(v54, v55, v56, v4);
  uint64_t v174 = v49;
  uint64_t v57 = OUTLINED_FUNCTION_48();
  __swift_storeEnumTagSinglePayload(v57, v58, v59, v4);
  sub_217BD7960();
  __swift_project_boxed_opaque_existential_1(v179, v179[3]);
  sub_217BD79A0();
  uint64_t v60 = (uint64_t)v41;
  uint64_t v156 = v38;
  uint64_t v157 = v35;
  uint64_t v61 = sub_217BD7980();
  MEMORY[0x21D4567E0](v61);
  OUTLINED_FUNCTION_38();
  v62();
  sub_217BD7840();
  sub_217BD7880();
  swift_bridgeObjectRelease();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v4);
  uint64_t v64 = (uint8_t *)v4;
  uint64_t v159 = v26;
  uint64_t v158 = v21;
  if (EnumTagSinglePayload == 1)
  {
    sub_217B9D720((uint64_t)v46, &qword_267BAF178);
    uint64_t v65 = v173;
    uint64_t v66 = (uint64_t)v174;
    uint64_t v67 = v177;
  }
  else
  {
    uint64_t v65 = v173;
    OUTLINED_FUNCTION_10_2();
    v68();
    sub_217BD7860();
    uint64_t v67 = v177;
    sub_217B9D720(v177, &qword_267BAF178);
    uint64_t v69 = OUTLINED_FUNCTION_22_1();
    sub_217B9D774(v69, v67);
    OUTLINED_FUNCTION_36();
    uint64_t v70 = (uint64_t)v175;
    sub_217B9D720((uint64_t)v175, &qword_267BAF178);
    uint64_t v71 = OUTLINED_FUNCTION_22_1();
    sub_217B9D774(v71, v70);
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_19_1();
    v72();
    uint64_t v66 = (uint64_t)v174;
    sub_217B9D720((uint64_t)v174, &qword_267BAF178);
    uint64_t v73 = OUTLINED_FUNCTION_22_1();
    sub_217B9D774(v73, v66);
  }
  sub_217B9D6B8(v67, v60);
  OUTLINED_FUNCTION_11_1(v60);
  uint64_t v74 = v164;
  if (v100)
  {
    sub_217B9D720(v60, &qword_267BAF178);
    uint64_t v75 = (uint64_t)v175;
    if (qword_267BADEE8 != -1) {
      swift_once();
    }
    uint64_t v76 = sub_217BD7B70();
    __swift_project_value_buffer(v76, (uint64_t)qword_267BAF040);
    uint64_t v77 = (void *)sub_217BD7B50();
    os_log_type_t v78 = sub_217BD8C00();
    if (OUTLINED_FUNCTION_47(v78))
    {
      *(_WORD *)OUTLINED_FUNCTION_14_1() = 0;
      OUTLINED_FUNCTION_34(&dword_217B65000, v79, v80, "Could not get the segmentation model url");
      OUTLINED_FUNCTION_2_4();
    }
  }
  else
  {
    OUTLINED_FUNCTION_10_2();
    v81();
    if (qword_267BADEE8 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_217BD7B70();
    __swift_project_value_buffer(v82, (uint64_t)qword_267BAF040);
    OUTLINED_FUNCTION_16_0();
    v83();
    uint64_t v84 = sub_217BD7B50();
    os_log_type_t v85 = sub_217BD8C20();
    if (os_log_type_enabled(v84, v85))
    {
      unsigned int v86 = (uint8_t *)OUTLINED_FUNCTION_25_0();
      uint64_t v178 = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)unsigned int v86 = 136315138;
      uint64_t v64 = v86 + 4;
      uint64_t v87 = sub_217BD7840();
      uint64_t v89 = OUTLINED_FUNCTION_67(v87, v88);
      OUTLINED_FUNCTION_40(v89);
      uint64_t v65 = v173;
      sub_217BD8CB0();
      swift_bridgeObjectRelease();
      uint64_t v90 = (void (*)(void))*((void *)v65 + 1);
      OUTLINED_FUNCTION_3_3();
      v90();
      _os_log_impl(&dword_217B65000, v84, v85, "Segmentation URL is: %s", v86, 0xCu);
      OUTLINED_FUNCTION_52();
      uint64_t v66 = (uint64_t)v174;
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_2_4();

      OUTLINED_FUNCTION_3_3();
      v90();
      uint64_t v67 = v177;
    }
    else
    {

      uint64_t v91 = (void (*)(void))*((void *)v65 + 1);
      OUTLINED_FUNCTION_3_3();
      v91();
      ((void (*)(uint64_t, uint8_t *))v91)(v74, v64);
    }
    uint64_t v75 = (uint64_t)v175;
  }
  uint64_t v92 = v165;
  uint64_t v93 = (uint64_t)v156;
  sub_217B9D6B8(v75, (uint64_t)v156);
  OUTLINED_FUNCTION_11_1(v93);
  if (v100)
  {
    sub_217B9D720(v93, &qword_267BAF178);
    OUTLINED_FUNCTION_55();
    if (!v100) {
      swift_once();
    }
    uint64_t v94 = sub_217BD7B70();
    __swift_project_value_buffer(v94, (uint64_t)qword_267BAF040);
    char v95 = (void *)sub_217BD7B50();
    os_log_type_t v96 = sub_217BD8C00();
    if (OUTLINED_FUNCTION_47(v96))
    {
      *(_WORD *)OUTLINED_FUNCTION_14_1() = 0;
      OUTLINED_FUNCTION_34(&dword_217B65000, v97, v98, "Could not get the inpainting model url");
      OUTLINED_FUNCTION_2_4();
    }
  }
  else
  {
    OUTLINED_FUNCTION_10_2();
    v99();
    OUTLINED_FUNCTION_55();
    if (!v100) {
      swift_once();
    }
    uint64_t v101 = sub_217BD7B70();
    __swift_project_value_buffer(v101, (uint64_t)qword_267BAF040);
    OUTLINED_FUNCTION_16_0();
    v102();
    uint64_t v103 = (void *)sub_217BD7B50();
    os_log_type_t v104 = sub_217BD8C20();
    if (OUTLINED_FUNCTION_43(v104))
    {
      uint64_t v105 = (_DWORD *)OUTLINED_FUNCTION_25_0();
      uint64_t v178 = OUTLINED_FUNCTION_23_0();
      *uint64_t v105 = 136315138;
      uint64_t v106 = sub_217BD7840();
      uint64_t v108 = OUTLINED_FUNCTION_67(v106, v107);
      OUTLINED_FUNCTION_66(v108);
      sub_217BD8CB0();
      swift_bridgeObjectRelease();
      double v109 = (void (*)(void))*((void *)v65 + 1);
      OUTLINED_FUNCTION_3_3();
      v109();
      OUTLINED_FUNCTION_63(&dword_217B65000, v110, v111, "Inpainting URL is: %s");
      swift_arrayDestroy();
      uint64_t v75 = (uint64_t)v175;
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_2_4();

      OUTLINED_FUNCTION_3_3();
      v109();
      uint64_t v66 = (uint64_t)v174;
    }
    else
    {

      unsigned __int8 v112 = (void (*)(void))*((void *)v65 + 1);
      OUTLINED_FUNCTION_3_3();
      v112();
      ((void (*)(uint64_t, uint8_t *))v112)(v92, v64);
    }
    uint64_t v67 = v177;
  }
  uint64_t v113 = (uint64_t)v157;
  sub_217B9D6B8(v66, (uint64_t)v157);
  OUTLINED_FUNCTION_11_1(v113);
  if (v100)
  {
    sub_217B9D720(v113, &qword_267BAF178);
    OUTLINED_FUNCTION_55();
    if (!v100) {
      swift_once();
    }
    uint64_t v114 = sub_217BD7B70();
    __swift_project_value_buffer(v114, (uint64_t)qword_267BAF040);
    uint64_t v115 = (void *)sub_217BD7B50();
    os_log_type_t v116 = sub_217BD8C00();
    BOOL v117 = OUTLINED_FUNCTION_47(v116);
    uint64_t v118 = v163;
    uint64_t v119 = v171;
    if (v117)
    {
      *(_WORD *)OUTLINED_FUNCTION_14_1() = 0;
      OUTLINED_FUNCTION_34(&dword_217B65000, v120, v121, "Could not get the refinement model url");
      OUTLINED_FUNCTION_2_4();
    }

    OUTLINED_FUNCTION_19_1();
    v122();
    (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v159, v166);
    goto LABEL_37;
  }
  OUTLINED_FUNCTION_10_2();
  v138();
  OUTLINED_FUNCTION_55();
  if (!v139) {
    swift_once();
  }
  uint64_t v140 = sub_217BD7B70();
  __swift_project_value_buffer(v140, (uint64_t)qword_267BAF040);
  OUTLINED_FUNCTION_16_0();
  v141();
  uint64_t v142 = (void *)sub_217BD7B50();
  os_log_type_t v143 = sub_217BD8C20();
  if (OUTLINED_FUNCTION_43(v143))
  {
    uint64_t v144 = (_DWORD *)OUTLINED_FUNCTION_25_0();
    uint64_t v178 = OUTLINED_FUNCTION_23_0();
    *uint64_t v144 = 136315138;
    char v173 = v144 + 1;
    uint64_t v145 = sub_217BD7840();
    uint64_t v147 = OUTLINED_FUNCTION_67(v145, v146);
    OUTLINED_FUNCTION_66(v147);
    sub_217BD8CB0();
    swift_bridgeObjectRelease();
    double v148 = (void (*)(void))*((void *)v65 + 1);
    OUTLINED_FUNCTION_3_3();
    v148();
    OUTLINED_FUNCTION_63(&dword_217B65000, v149, v150, "Refinement URL is: %s");
    swift_arrayDestroy();
    uint64_t v75 = (uint64_t)v175;
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();

    OUTLINED_FUNCTION_3_3();
    v148();
    OUTLINED_FUNCTION_3_3();
    v148();
    uint64_t v66 = (uint64_t)v174;
    uint64_t v151 = OUTLINED_FUNCTION_30_0();
    v152(v151);
    uint64_t v119 = v171;
    uint64_t v67 = v177;
LABEL_37:
    uint64_t v123 = v169;
    goto LABEL_38;
  }

  double v153 = (void (*)(void))*((void *)v65 + 1);
  OUTLINED_FUNCTION_3_3();
  v153();
  OUTLINED_FUNCTION_3_3();
  v153();
  OUTLINED_FUNCTION_3_3();
  v153();
  uint64_t v154 = OUTLINED_FUNCTION_30_0();
  v155(v154);
  uint64_t v67 = v177;
  uint64_t v123 = v169;
  uint64_t v119 = v171;
LABEL_38:
  uint64_t v178 = MEMORY[0x263F8EE80];
  uint64_t v124 = v167;
  sub_217B9D6B8(v67, v167);
  OUTLINED_FUNCTION_11_1(v124);
  if (v100)
  {
    long long v125 = (void (**)(uint64_t, uint8_t *))v65;
    sub_217B9D720(v124, &qword_267BAF178);
  }
  else
  {
    OUTLINED_FUNCTION_10_2();
    v126();
    if (qword_267BADEF8 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_16_0();
    v127();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_31_0();
    long long v125 = (void (**)(uint64_t, uint8_t *))v65;
    (*((void (**)(uint64_t, uint8_t *))v65 + 1))(v123, v64);
    uint64_t v67 = v177;
  }
  uint64_t v128 = v168;
  sub_217B9D6B8(v75, v168);
  OUTLINED_FUNCTION_11_1(v128);
  if (v100)
  {
    sub_217B9D720(v128, &qword_267BAF178);
    uint64_t v129 = v125;
  }
  else
  {
    uint64_t v129 = v125;
    OUTLINED_FUNCTION_10_2();
    v130();
    if (qword_267BADF00 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_16_0();
    v131();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_31_0();
    v125[1](v119, v64);
  }
  uint64_t v132 = v170;
  sub_217B9D6B8(v66, v170);
  OUTLINED_FUNCTION_11_1(v132);
  uint64_t v133 = v172;
  if (v100)
  {
    sub_217B9D720(v66, &qword_267BAF178);
    uint64_t v66 = v75;
    uint64_t v75 = v67;
    uint64_t v67 = v132;
  }
  else
  {
    OUTLINED_FUNCTION_10_2();
    v134();
    if (qword_267BADF08 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_16_0();
    v135();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_31_0();
    v129[1](v133, v64);
  }
  sub_217B9D720(v66, &qword_267BAF178);
  sub_217B9D720(v75, &qword_267BAF178);
  sub_217B9D720(v67, &qword_267BAF178);
  uint64_t v136 = v178;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v179);
  return v136;
}

uint64_t sub_217B99FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF178);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_217BD7890();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v9) == 1)
  {
    sub_217B9D720(a1, &qword_267BAF178);
    sub_217B9D7DC(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    return sub_217B9D720((uint64_t)v8, &qword_267BAF178);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    sub_217B9D954((uint64_t)v12, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_217B9A188@<X0>(uint64_t *a1@<X8>)
{
  sub_217BD7960();
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  a1[3] = v2;
  a1[4] = *(void *)(v3 + 8);
  __swift_allocate_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_54();
  (*(void (**)(void))(v4 + 16))();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

uint64_t sub_217B9A21C()
{
  sub_217B9A188(v2);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v1[3] = swift_getAssociatedTypeWitness();
  v1[4] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v1);
  sub_217BD79A0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return 1;
}

uint64_t sub_217B9A2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF0E0);
  uint64_t v6 = OUTLINED_FUNCTION_7_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_217BD8BC0();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = a1;
  v11[6] = a2;
  swift_retain();
  swift_retain();
  sub_217B98318(v9, (uint64_t)&unk_267BAF138, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_217B9A3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  uint64_t v7 = sub_217BD7A10();
  v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF140);
  v6[20] = v8;
  v6[21] = *(void *)(v8 - 8);
  v6[22] = swift_task_alloc();
  uint64_t v9 = sub_217BD7B00();
  v6[23] = v9;
  v6[24] = *(void *)(v9 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v10 = sub_217BD79B0();
  v6[26] = v10;
  v6[27] = *(void *)(v10 - 8);
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  uint64_t v11 = sub_217BD7A00();
  v6[30] = v11;
  v6[31] = *(void *)(v11 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF148);
  v6[35] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF150);
  v6[36] = v12;
  v6[37] = *(void *)(v12 - 8);
  v6[38] = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF158);
  v6[39] = v13;
  v6[40] = *(void *)(v13 - 8);
  v6[41] = swift_task_alloc();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF160);
  v6[42] = v14;
  v6[43] = *(void *)(v14 - 8);
  v6[44] = swift_task_alloc();
  uint64_t v15 = sub_217BD7970();
  v6[45] = v15;
  v6[46] = *(void *)(v15 - 8);
  v6[47] = swift_task_alloc();
  uint64_t v16 = sub_217BD7AC0();
  v6[48] = v16;
  v6[49] = *(void *)(v16 - 8);
  v6[50] = swift_task_alloc();
  v6[51] = swift_task_alloc();
  v6[52] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217B9A878, 0, 0);
}

uint64_t sub_217B9A878()
{
  if (qword_267BADEF0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_217BD7AF0();
  *(void *)(v0 + 424) = __swift_project_value_buffer(v1, (uint64_t)qword_267BAF058);
  sub_217BD7AE0();
  sub_217BD7AA0();
  uint64_t v2 = sub_217BD7AE0();
  os_signpost_type_t v3 = sub_217BD8C70();
  if (sub_217BD8C90())
  {
    uint64_t v4 = (uint8_t *)OUTLINED_FUNCTION_14_1();
    *(_WORD *)uint64_t v4 = 0;
    os_signpost_id_t v5 = sub_217BD7AB0();
    _os_signpost_emit_with_name_impl(&dword_217B65000, v2, v3, v5, "modelDownload", "", v4, 2u);
    OUTLINED_FUNCTION_2_4();
  }
  uint64_t v7 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 416);
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v0 + 392);

  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  *(void *)(v0 + 432) = v10;
  *(void *)(v0 + 440) = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v7, v6, v8);
  sub_217BD7B30();
  swift_allocObject();
  *(void *)(v0 + 448) = sub_217BD7B20();
  sub_217B9A188((uint64_t *)(v0 + 16));
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_217BD7990();
  sub_217BD7950();
  OUTLINED_FUNCTION_19_1();
  v11();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF168);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_217BDD830;
  sub_217B9D59C(v0 + 16, v12 + 32);
  sub_217BD7930();
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_217BDD830;
  sub_217B9D59C(v0 + 16, v13 + 32);
  sub_217BD7940();
  swift_bridgeObjectRelease();
  sub_217BD8BD0();
  *(_DWORD *)(v0 + 488) = *MEMORY[0x263F560F0];
  *(_DWORD *)(v0 + 492) = *MEMORY[0x263F560F8];
  *(_DWORD *)(v0 + 496) = *MEMORY[0x263F560E0];
  *(_DWORD *)(v0 + 500) = *MEMORY[0x263F560D8];
  *(_DWORD *)(v0 + 504) = *MEMORY[0x263F90238];
  *(_DWORD *)(v0 + 508) = *MEMORY[0x263F56170];
  *(_DWORD *)(v0 + 512) = *MEMORY[0x263F56168];
  *(_DWORD *)(v0 + 516) = *MEMORY[0x263F56178];
  *(_DWORD *)(v0 + 520) = *MEMORY[0x263F56160];
  *(unsigned char *)(v0 + 524) = 0;
  uint64_t v14 = swift_task_alloc();
  uint64_t v15 = (void *)OUTLINED_FUNCTION_50(v14);
  *uint64_t v15 = v16;
  v15[1] = sub_217B9AF00;
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA1F68]();
}

uint64_t sub_217B9AF00()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_217B9AFC8()
{
  uint64_t v117 = v0;
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 240);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    char v3 = *(unsigned char *)(v0 + 524);
    OUTLINED_FUNCTION_19_1();
    v4();
    if (v3 & 1) == 0 && (sub_217B9A21C())
    {
      if (qword_267BADEE8 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_217BD7B70();
      __swift_project_value_buffer(v5, (uint64_t)qword_267BAF040);
      uint64_t v6 = (void *)sub_217BD7B50();
      os_log_type_t v7 = sub_217BD8C20();
      if (OUTLINED_FUNCTION_24_0(v7))
      {
        uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_14_1();
        OUTLINED_FUNCTION_62(v8);
        OUTLINED_FUNCTION_26_0(&dword_217B65000, v9, v10, "Stream finished without receiving a .complete status, but model is available. Continuing with loading");
        OUTLINED_FUNCTION_2_4();
      }
      uint64_t v11 = *(void (**)(uint64_t))(v0 + 112);

      uint64_t v12 = OUTLINED_FUNCTION_46();
      v11(v12);
    }
    uint64_t v14 = *(void *)(v0 + 344);
    uint64_t v13 = *(void *)(v0 + 352);
    uint64_t v16 = *(void *)(v0 + 328);
    uint64_t v15 = *(void *)(v0 + 336);
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v17 = *(void *)(v0 + 320);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    OUTLINED_FUNCTION_35();
    v19();
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    OUTLINED_FUNCTION_21_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_13_1();
    return v20();
  }
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 248) + 32))(*(void *)(v0 + 272), v1, v2);
  if (qword_267BADEE8 != -1) {
    swift_once();
  }
  uint64_t v22 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 256);
  uint64_t v24 = sub_217BD7B70();
  *(void *)(v0 + 464) = __swift_project_value_buffer(v24, (uint64_t)qword_267BAF040);
  uint64_t v25 = *(void (**)(void))(v22 + 16);
  OUTLINED_FUNCTION_65();
  v25();
  OUTLINED_FUNCTION_65();
  v25();
  uint64_t v26 = sub_217BD7B50();
  os_log_type_t v27 = sub_217BD8C20();
  BOOL v28 = OUTLINED_FUNCTION_43(v27);
  uint64_t v29 = *(void *)(v0 + 256);
  uint64_t v30 = *(void *)(v0 + 240);
  uint64_t v31 = *(void *)(v0 + 248);
  if (v28)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v116 = OUTLINED_FUNCTION_23_0();
    *(_DWORD *)uint64_t v32 = 136446466;
    sub_217BD79E0();
    uint64_t v33 = sub_217BD8B30();
    *(void *)(v32 + 4) = sub_217B8D0FC(v33, v34, &v116);
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void (**)(void))(v31 + 8);
    OUTLINED_FUNCTION_35();
    v35();
    *(_WORD *)(v32 + 12) = 2048;
    sub_217BD79F0();
    *(void *)(v32 + 14) = v36;
    OUTLINED_FUNCTION_35();
    v35();
    _os_log_impl(&dword_217B65000, v26, (os_log_type_t)v23, "Cleanup Resource Download Status: %{public}s / Progress: %f", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
  }
  else
  {
    uint64_t v35 = *(void (**)(void))(v31 + 8);
    OUTLINED_FUNCTION_35();
    v35();
    ((void (*)(uint64_t, uint64_t))v35)(v29, v30);
  }

  *(void *)(v0 + 472) = v35;
  int v37 = *(_DWORD *)(v0 + 488);
  uint64_t v39 = *(void *)(v0 + 216);
  uint64_t v38 = *(void *)(v0 + 224);
  uint64_t v40 = *(void *)(v0 + 208);
  sub_217BD79E0();
  int v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 88))(v38, v40);
  if (v41 == v37)
  {
    int v42 = *(_DWORD *)(v0 + 508);
    uint64_t v43 = *(void *)(v0 + 224);
    uint64_t v45 = *(void *)(v0 + 144);
    uint64_t v44 = *(void *)(v0 + 152);
    uint64_t v46 = *(void *)(v0 + 128);
    uint64_t v47 = *(void *)(v0 + 136);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 216) + 96))(v43, *(void *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v44, v43, v46);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v45, v44, v46);
    int v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 88))(v45, v46);
    if (v48 == v42)
    {
      uint64_t v49 = sub_217BD7B50();
      os_log_type_t v50 = sub_217BD8C20();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)OUTLINED_FUNCTION_14_1();
        *(_WORD *)uint64_t v51 = 0;
        _os_log_impl(&dword_217B65000, v49, v50, "Cleanup Resource Not Downloading", v51, 2u);
        OUTLINED_FUNCTION_2_4();

        OUTLINED_FUNCTION_35();
        v52();
        OUTLINED_FUNCTION_60();
        OUTLINED_FUNCTION_19_1();
        v35();
        goto LABEL_52;
      }

      OUTLINED_FUNCTION_35();
      v74();
      uint64_t v66 = OUTLINED_FUNCTION_60();
    }
    else
    {
      if (v48 != *(_DWORD *)(v0 + 512))
      {
        if (v48 == *(_DWORD *)(v0 + 516))
        {
          (*(void (**)(uint64_t, double))(v0 + 112))(3, 0.0);
        }
        else
        {
          if (v48 != *(_DWORD *)(v0 + 520))
          {
            uint64_t v107 = *(void *)(v0 + 144);
            uint64_t v108 = *(void *)(v0 + 128);
            double v109 = *(void (**)(uint64_t))(*(void *)(v0 + 136) + 8);
            uint64_t v110 = OUTLINED_FUNCTION_58();
            v109(v110);
            uint64_t v111 = OUTLINED_FUNCTION_56();
            ((void (*)(uint64_t))v35)(v111);
            ((void (*)(uint64_t, uint64_t))v109)(v107, v108);
            goto LABEL_52;
          }
          (*(void (**)(uint64_t, double))(v0 + 112))(2, 0.0);
        }
        uint64_t v102 = OUTLINED_FUNCTION_58();
        v103(v102);
        uint64_t v104 = OUTLINED_FUNCTION_56();
        ((void (*)(uint64_t))v35)(v104);
LABEL_52:
        char v93 = *(unsigned char *)(v0 + 524);
        goto LABEL_53;
      }
      uint64_t v60 = *(void *)(v0 + 272);
      uint64_t v115 = *(void *)(v0 + 240);
      uint64_t v61 = *(void *)(v0 + 152);
      uint64_t v62 = *(void *)(v0 + 128);
      uint64_t v63 = *(void *)(v0 + 136);
      uint64_t v64 = *(void (**)(void, double))(v0 + 112);
      sub_217BD79F0();
      v64(0, v65 / 100.0);
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v62);
      uint64_t v66 = v60;
      uint64_t v67 = v115;
    }
    ((void (*)(uint64_t, uint64_t))v35)(v66, v67);
    goto LABEL_52;
  }
  if (v41 != *(_DWORD *)(v0 + 492))
  {
    if (v41 == *(_DWORD *)(v0 + 496))
    {
      uint64_t v68 = (void *)sub_217BD7B50();
      os_log_type_t v69 = sub_217BD8C20();
      if (!OUTLINED_FUNCTION_24_0(v69))
      {
LABEL_39:
        uint64_t v79 = *(void *)(v0 + 272);
        uint64_t v80 = *(void *)(v0 + 240);
        uint64_t v81 = *(void (**)(uint64_t, double))(v0 + 112);

        v81(4, 0.0);
        ((void (*)(uint64_t, uint64_t))v35)(v79, v80);
        goto LABEL_52;
      }
      uint64_t v70 = (_WORD *)OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_62(v70);
      uint64_t v73 = "Cleanup Resource Non Network Error";
    }
    else
    {
      if (v41 != *(_DWORD *)(v0 + 500))
      {
        OUTLINED_FUNCTION_19_1();
        v35();
        uint64_t v105 = OUTLINED_FUNCTION_60();
        v106(v105);
        goto LABEL_52;
      }
      uint64_t v68 = (void *)sub_217BD7B50();
      os_log_type_t v77 = sub_217BD8C20();
      if (!OUTLINED_FUNCTION_24_0(v77)) {
        goto LABEL_39;
      }
      os_log_type_t v78 = (_WORD *)OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_62(v78);
      uint64_t v73 = "Cleanup Resource Network Error";
    }
    OUTLINED_FUNCTION_26_0(&dword_217B65000, v71, v72, v73);
    OUTLINED_FUNCTION_2_4();
    goto LABEL_39;
  }
  uint64_t v53 = sub_217BD7AE0();
  sub_217BD7B10();
  os_signpost_type_t v54 = sub_217BD8C60();
  if (sub_217BD8C90())
  {
    int v55 = *(_DWORD *)(v0 + 504);
    uint64_t v57 = *(void *)(v0 + 192);
    uint64_t v56 = *(void *)(v0 + 200);
    uint64_t v58 = *(void *)(v0 + 184);
    swift_retain();
    sub_217BD7B40();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v57 + 88))(v56, v58) == v55)
    {
      uint64_t v59 = "[Error] Interval already ended";
    }
    else
    {
      OUTLINED_FUNCTION_19_1();
      v82();
      uint64_t v59 = "";
    }
    uint64_t v83 = *(void *)(v0 + 408);
    uint64_t v84 = *(void *)(v0 + 384);
    uint64_t v85 = *(void *)(v0 + 392);
    uint64_t v86 = OUTLINED_FUNCTION_60();
    v87(v86);
    unint64_t v88 = (uint8_t *)OUTLINED_FUNCTION_14_1();
    *(_WORD *)unint64_t v88 = 0;
    os_signpost_id_t v89 = sub_217BD7AB0();
    _os_signpost_emit_with_name_impl(&dword_217B65000, v53, v54, v89, "modelDownload", v59, v88, 2u);
    OUTLINED_FUNCTION_2_4();

    uint64_t v90 = *(void (**)(void))(v85 + 8);
    OUTLINED_FUNCTION_35();
    v90();
    ((void (*)(uint64_t, uint64_t))v90)(v83, v84);
  }
  else
  {

    uint64_t v75 = OUTLINED_FUNCTION_61();
    v76(v75);
  }
  if ((sub_217B9A21C() & 1) == 0)
  {
    os_log_type_t v96 = (void *)sub_217BD7B50();
    os_log_type_t v97 = sub_217BD8C00();
    if (OUTLINED_FUNCTION_24_0(v97))
    {
      uint64_t v98 = (_WORD *)OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_62(v98);
      OUTLINED_FUNCTION_26_0(&dword_217B65000, v99, v100, "Download status was 'complete', but model isn't yet available. Watch for updates using 'monitorUpdates'");
      OUTLINED_FUNCTION_2_4();
    }

    sub_217BD8BD0();
    uint64_t v101 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v101;
    *uint64_t v101 = v0;
    v101[1] = sub_217B9BA74;
    goto LABEL_54;
  }
  uint64_t v91 = *(void *)(v0 + 272);
  uint64_t v92 = *(void *)(v0 + 240);
  char v93 = 1;
  uint64_t v94 = OUTLINED_FUNCTION_46();
  v95(v94);
  ((void (*)(uint64_t, uint64_t))v35)(v91, v92);
LABEL_53:
  *(unsigned char *)(v0 + 524) = v93;
  uint64_t v112 = swift_task_alloc();
  uint64_t v113 = (void *)OUTLINED_FUNCTION_50(v112);
  *uint64_t v113 = v114;
  v113[1] = sub_217B9AF00;
LABEL_54:
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA1F68]();
}

uint64_t sub_217B9BA74()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_217B9BB3C()
{
  OUTLINED_FUNCTION_53();
  if (*(void *)(v0 + 96))
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_217BD7B50();
    os_log_type_t v2 = sub_217BD8C20();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)OUTLINED_FUNCTION_14_1();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_217B65000, v1, v2, "Cleanup Resource Download; monitorUpdates has fired", v3, 2u);
      OUTLINED_FUNCTION_2_4();
    }
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 112);

    uint64_t v5 = OUTLINED_FUNCTION_46();
    v4(v5);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_217B9BA74;
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t))(v0 + 472);
    OUTLINED_FUNCTION_38();
    v8();
    uint64_t v9 = OUTLINED_FUNCTION_61();
    v7(v9);
    *(unsigned char *)(v0 + 524) = 1;
    uint64_t v10 = swift_task_alloc();
    uint64_t v11 = (void *)OUTLINED_FUNCTION_50(v10);
    *uint64_t v11 = v12;
    v11[1] = sub_217B9AF00;
  }
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA1F68]();
}

uint64_t sub_217B9BCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF0E0);
  uint64_t v6 = OUTLINED_FUNCTION_7_1(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_37();
  uint64_t v8 = OUTLINED_FUNCTION_48();
  __swift_storeEnumTagSinglePayload(v8, v9, v10, v7);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  LODWORD(a1) = __swift_getEnumTagSinglePayload(v2, 1, v7);
  swift_retain();
  if (a1 == 1)
  {
    sub_217B9D720(v2, &qword_267BAF0E0);
  }
  else
  {
    sub_217BD8BB0();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_38();
    v12();
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_217BD8B90();
      swift_unknownObjectRelease();
    }
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_267BAF110;
  *(void *)(v13 + 24) = v11;
  swift_task_create();
  return swift_release();
}

uint64_t sub_217B9BECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 56) = a4;
  *(void *)(v5 + 64) = a5;
  return MEMORY[0x270FA2498](sub_217B9BF5C, 0, 0);
}

uint64_t sub_217B9BF5C()
{
  uint64_t v29 = v0;
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = self;
  *(void *)(v0 + 40) = 0;
  uint64_t v2 = (void **)(v0 + 40);
  unsigned int v3 = objc_msgSend(v1, sel_loadAndRegisterInpaintModel_, v0 + 40);
  uint64_t v4 = *(void **)(v0 + 40);
  if (v3
    && (*uint64_t v2 = 0,
        id v5 = v4,
        unsigned int v6 = objc_msgSend(v1, sel_loadAndRegisterRefinementModel_, v0 + 40),
        uint64_t v4 = *v2,
        v6))
  {
    uint64_t v7 = *(void (**)(uint64_t))(v0 + 56);
    id v8 = v4;
    objc_msgSend(v1, sel_warmUpResources);
    uint64_t v9 = OUTLINED_FUNCTION_42();
    v7(v9);
  }
  else
  {
    id v10 = v4;
    uint64_t v11 = (void *)sub_217BD7830();

    swift_willThrow();
    if (qword_267BADEE8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_217BD7B70();
    __swift_project_value_buffer(v12, (uint64_t)qword_267BAF040);
    id v13 = v11;
    id v14 = v11;
    uint64_t v15 = sub_217BD7B50();
    os_log_type_t v16 = sub_217BD8C20();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      v28[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)uint64_t v17 = 136446210;
      swift_getErrorValue();
      uint64_t v18 = sub_217BD8DA0();
      *(void *)(v0 + 40) = sub_217B8D0FC(v18, v19, v28);
      sub_217BD8CB0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_217B65000, v15, v16, "Error compiling model: %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_2_4();
    }
    else
    {
    }
    uint64_t v20 = *(void (**)(void, id))(v0 + 56);
    uint64_t v21 = sub_217BD8B10();
    uint64_t v23 = v22;
    id v24 = objc_allocWithZone(MEMORY[0x263F087E8]);
    id v25 = sub_217B9D158(v21, v23, 4, 0);
    v20(0, v25);
  }
  OUTLINED_FUNCTION_13_1();
  return v26();
}

uint64_t type metadata accessor for PECleanupModelDeliveryHelper()
{
  return self;
}

uint64_t sub_217B9C294()
{
  return sub_217B9A21C() & 1;
}

uint64_t sub_217B9C2B0()
{
  return sub_217B98EA4();
}

uint64_t sub_217B9C2C8(uint64_t a1, uint64_t a2)
{
  return sub_217B9A2F8(a1, a2);
}

uint64_t sub_217B9C2EC(uint64_t a1, uint64_t a2)
{
  return sub_217B9BCE8(a1, a2);
}

uint64_t sub_217B9C304()
{
  return 0;
}

uint64_t sub_217B9C30C()
{
  return MEMORY[0x263F8EE80];
}

uint64_t sub_217B9C318(uint64_t a1, uint64_t a2)
{
  return sub_217B9C9A8(a1, a2);
}

uint64_t sub_217B9C338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_217B9C35C, 0, 0);
}

uint64_t sub_217B9C35C()
{
  OUTLINED_FUNCTION_7_2();
  if (*(unsigned char *)(v0[2] + 32) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[5] = v1;
    void *v1 = v0;
    v1[1] = sub_217B9C458;
    uint64_t v2 = 450000000;
  }
  else
  {
    v0[6] = 0;
    unsigned int v3 = (void *)swift_task_alloc();
    v0[7] = v3;
    *unsigned int v3 = v0;
    v3[1] = sub_217B9C5B4;
    uint64_t v2 = 50000000;
  }
  return MEMORY[0x270FA1FF0](v2);
}

uint64_t sub_217B9C458()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6_2();
  *unsigned int v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_13_1();
    return v4();
  }
  else
  {
    OUTLINED_FUNCTION_20_1();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_217B9C550()
{
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t, double))(v0 + 24))(2, 0.0);
  OUTLINED_FUNCTION_17_1();
  return v1();
}

uint64_t sub_217B9C5B4()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_13_1();
    return v4();
  }
  else
  {
    OUTLINED_FUNCTION_20_1();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_217B9C6AC()
{
  OUTLINED_FUNCTION_29_0();
  double v1 = *(double *)(v0 + 48) + 0.05 / *(double *)(*(void *)(v0 + 16) + 16);
  (*(void (**)(void, double))(v0 + 24))(0, v1);
  if (v1 < 1.0)
  {
    *(double *)(v0 + 48) = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_217B9C5B4;
    uint64_t v3 = 50000000;
LABEL_5:
    return MEMORY[0x270FA1FF0](v3);
  }
  uint64_t v4 = *(void *)(v0 + 16);
  (*(void (**)(uint64_t))(v0 + 24))(1);
  if (*(unsigned char *)(v4 + 33) == 1)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_217B9C82C;
    uint64_t v3 = 10000000;
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_17_1();
  return v6();
}

uint64_t sub_217B9C82C()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_13_1();
    return v4();
  }
  else
  {
    OUTLINED_FUNCTION_20_1();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_217B9C924()
{
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t, double))(v0 + 24))(4, 0.0);
  OUTLINED_FUNCTION_17_1();
  return v1();
}

uint64_t sub_217B9C988(uint64_t a1, uint64_t a2)
{
  return sub_217B9C9A8(a1, a2);
}

uint64_t sub_217B9C9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF0E0);
  uint64_t v6 = OUTLINED_FUNCTION_7_1(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_37();
  uint64_t v8 = OUTLINED_FUNCTION_48();
  __swift_storeEnumTagSinglePayload(v8, v9, v10, v7);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = a1;
  v11[6] = a2;
  LODWORD(a1) = __swift_getEnumTagSinglePayload(v2, 1, v7);
  swift_retain();
  swift_retain();
  if (a1 == 1)
  {
    sub_217B9D720(v2, &qword_267BAF0E0);
  }
  else
  {
    sub_217BD8BB0();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_38();
    v12();
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_217BD8B90();
      swift_unknownObjectRelease();
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_217B9CB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_217B9CB90, 0, 0);
}

uint64_t sub_217B9CB90()
{
  OUTLINED_FUNCTION_7_2();
  double v2 = *(double *)(*(void *)(v0 + 16) + 24) * 1000000000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 >= 1.84467441e19)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270FA1FF0](v1);
  }
  unint64_t v3 = (unint64_t)v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_217B9CC70;
  unint64_t v1 = v3;
  return MEMORY[0x270FA1FF0](v1);
}

uint64_t sub_217B9CC70()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6_2();
  *unint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_13_1();
    return v4();
  }
  else
  {
    OUTLINED_FUNCTION_20_1();
    return MEMORY[0x270FA2498]();
  }
}

uint64_t sub_217B9CD68()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v0 = OUTLINED_FUNCTION_42();
  v1(v0);
  OUTLINED_FUNCTION_17_1();
  return v2();
}

uint64_t sub_217B9CDC4()
{
  return OUTLINED_FUNCTION_39(v0, 34);
}

uint64_t type metadata accessor for PEDebugSimulatedModelDeliveryHelper()
{
  return self;
}

uint64_t sub_217B9CDF4(uint64_t a1, uint64_t a2)
{
  return sub_217B9C318(a1, a2);
}

uint64_t sub_217B9CE18(uint64_t a1, uint64_t a2)
{
  return sub_217B9C988(a1, a2);
}

uint64_t sub_217B9CE3C()
{
  return OUTLINED_FUNCTION_39(v0, 16);
}

uint64_t type metadata accessor for PEEmptyModelDeliveryHelper()
{
  return self;
}

uint64_t sub_217B9CE70()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_32();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9CF08;
  uint64_t v3 = OUTLINED_FUNCTION_9_2();
  return sub_217B9CB6C(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_217B9CF08()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  return v3();
}

uint64_t sub_217B9CFCC()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_32();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9E194;
  uint64_t v3 = OUTLINED_FUNCTION_9_2();
  return sub_217B9C338(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_217B9D064()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_217B9D0A4()
{
  OUTLINED_FUNCTION_53();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_4_3(v7);
  *uint64_t v8 = v9;
  v8[1] = sub_217B9CF08;
  return sub_217B9BECC(v2, v3, v4, v6, v5);
}

id sub_217B9D158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_217BD8AE0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_217BD8AC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_217B9D208(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_217B9D2E4;
  return v6(a1);
}

uint64_t sub_217B9D2E4()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_1();
  return v3();
}

uint64_t sub_217B9D3A4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B9D3DC()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9E194;
  uint64_t v3 = OUTLINED_FUNCTION_15_1();
  return v4(v3);
}

uint64_t objectdestroyTm_1()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_217B9D4C0()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_32();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9E194;
  uint64_t v3 = OUTLINED_FUNCTION_9_2();
  return sub_217B9A3E0(v3, v4, v5, v6, v7, v8);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_217B9D59C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x21D458AE0);
  }
  return result;
}

uint64_t sub_217B9D6B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B9D720(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_38();
  v3();
  return a1;
}

uint64_t sub_217B9D774(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217B9D7DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_217B9D9E4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF180);
    sub_217BD8D10();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v16 + 56);
    uint64_t v11 = sub_217BD7890();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * v8, v11);
    sub_217BD8D20();
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease();
    uint64_t v12 = a3;
    uint64_t v13 = 0;
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = sub_217BD7890();
    uint64_t v12 = a3;
    uint64_t v13 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v12, v13, 1, v14);
}

uint64_t sub_217B9D954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_217B9DA5C(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

unint64_t sub_217B9D9E4(uint64_t a1, uint64_t a2)
{
  sub_217BD8DF0();
  sub_217BD8B40();
  uint64_t v4 = sub_217BD8E10();
  return sub_217B9DC78(a1, a2, v4);
}

uint64_t sub_217B9DA5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_217B9D9E4(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF180);
  if ((sub_217BD8D10() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_217B9D9E4(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_217BD8D90();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_217BD7890();
    uint64_t v18 = *(void *)(v17 - 8);
    unint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v11;
    return v19(v21, a1, v20);
  }
  else
  {
    sub_217B9DBC8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_217B9DBC8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_217BD7890();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_217B9DC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_217BD8D80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_217BD8D80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_217B9DD5C()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = OUTLINED_FUNCTION_49();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_217B9DD8C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_217B9DDA0(char a1, uint64_t a2)
{
  sub_217B98560(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_217B9DDA8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_217B9DDBC()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9E194;
  uint64_t v3 = OUTLINED_FUNCTION_45();
  return sub_217B98250(v3, v4, v5, v6);
}

uint64_t objectdestroy_51Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_217B9DE98()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4_3(v0);
  void *v1 = v2;
  v1[1] = sub_217B9E194;
  uint64_t v3 = OUTLINED_FUNCTION_45();
  return sub_217B985D0(v3, v4, v5, v6);
}

uint64_t sub_217B9DF30()
{
  uint64_t v1 = OUTLINED_FUNCTION_49();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_217B9DF60(uint64_t a1, uint64_t a2)
{
  return sub_217B98C28(a1, a2, *(void *)(v2 + 16));
}

void sub_217B9DF68(char a1, double a2)
{
  sub_217B989F8(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_217B9DF70()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_49();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_217B9DFA0(uint64_t a1)
{
  sub_217B971D0(a1, v1);
}

uint64_t sub_217B9DFA8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DeliveryManagerState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeliveryManagerState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217B9E10CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeliveryManagerState()
{
  return &type metadata for DeliveryManagerState;
}

unint64_t sub_217B9E148()
{
  unint64_t result = qword_267BAF1B0;
  if (!qword_267BAF1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF1B0);
  }
  return result;
}

void OUTLINED_FUNCTION_2_4()
{
  JUMPOUT(0x21D458AE0);
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_5_3()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return *(void *)(v0 + 416);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_24_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_26_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return *(void *)(v0 - 376);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_217B99FFC(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_34(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_217BD7860();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_217BD8BC0();
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0228](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return 1;
}

BOOL OUTLINED_FUNCTION_43(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return 1;
}

BOOL OUTLINED_FUNCTION_47(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50(uint64_t result)
{
  *(void *)(v1 + 456) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return v0;
}

_WORD *OUTLINED_FUNCTION_62(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

void OUTLINED_FUNCTION_63(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_66(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1, unint64_t a2)
{
  return sub_217B8D0FC(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_68(uint64_t a1)
{
  void *v1 = a1;
  return sub_217BD8CB0();
}

uint64_t sub_217B9E748(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

unint64_t static PEAlchemistSupport.kAlchemistIdentifier.getter()
{
  return 0xD00000000000001ALL;
}

id sub_217B9E7B8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14E40]), sel_init);
  objc_msgSend(v0, sel_setDeliveryMode_, 1);
  objc_msgSend(v0, sel_setVersion_, 0);
  objc_msgSend(v0, sel_setNetworkAccessAllowed_, 1);
  objc_msgSend(v0, sel_setResizeMode_, 0);
  objc_msgSend(v0, sel_setDownloadPriority_, 0);
  objc_msgSend(v0, sel_setDownloadIntent_, 3);
  objc_msgSend(v0, sel_setProgressHandler_, 0);
  return v0;
}

uint64_t sub_217B9E87C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_217B9E89C, 0, 0);
}

uint64_t sub_217B9E89C()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  id v3 = objc_msgSend(self, sel_defaultManager);
  v0[6] = v3;
  os_log_type_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  _OWORD v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1F0);
  *os_log_type_t v5 = v0;
  v5[1] = sub_217B9E9D0;
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2318]();
}

uint64_t sub_217B9E9D0()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_217B9EAB8()
{
  OUTLINED_FUNCTION_7_2();

  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v1, v2);
}

void sub_217B9EB18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_217BA0694;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217B9ED20;
  aBlock[3] = &block_descriptor_30;
  BOOL v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestImageDataAndOrientationForAsset_options_resultHandler_, a3, a4, v13);
  _Block_release(v13);
}

uint64_t sub_217B9ECD8(uint64_t a1, unint64_t a2)
{
  return sub_217BD8BA0();
}

uint64_t sub_217B9ED20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a2;
  uint64_t v9 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v10 = v8;
    uint64_t v8 = (void *)sub_217BD78B0();
    unint64_t v12 = v11;

    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    swift_retain();
    unint64_t v12 = 0xF000000000000000;
    if (a3)
    {
LABEL_3:
      uint64_t v13 = sub_217BD8B10();
      a3 = v14;
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v13 = 0;
  if (a5) {
LABEL_4:
  }
    a5 = sub_217BD8AD0();
LABEL_5:
  v9(v8, v12, v13, a3, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_217BA01E8((uint64_t)v8, v12);
  return swift_release();
}

uint64_t sub_217B9EE38(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_217B9EE58, 0, 0);
}

uint64_t sub_217B9EE58()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  sub_217BA0540();
  *uint64_t v2 = v0;
  v2[1] = sub_217B9EF54;
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2318]();
}

uint64_t sub_217B9EF54()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_217B9F03C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

void sub_217B9F054(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1E8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_217BA058C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217B9F24C;
  aBlock[3] = &block_descriptor_23;
  unint64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestContentEditingInputWithOptions_completionHandler_, a3, v11);
  _Block_release(v11);
}

uint64_t sub_217B9F204(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1E8);
  return sub_217BD8BA0();
}

void sub_217B9F24C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  sub_217BD8AD0();
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_217B9F2EC(void *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void *a6)
{
  int v41 = a1;
  id v42 = a6;
  uint64_t v43 = a3;
  void aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_217BD7A80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&PrimaryImageIndex - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_217BD7890();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v44 = v12;
  uint64_t v45 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&PrimaryImageIndex - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14DD8]), sel_initWithContentEditingInput_, a4);
  objc_msgSend(v16, sel_setAdjustmentData_, a5);
  sub_217BD7A70();
  uint64_t v17 = (void *)sub_217BD7A60();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v11, v8);
  aBlock[0] = 0;
  id v19 = objc_msgSend(v16, sel_renderedContentURLForType_error_, v17, aBlock);

  id v20 = aBlock[0];
  if (!v19)
  {
    unint64_t v34 = v20;
    sub_217BD7830();

    swift_willThrow();
    return;
  }
  sub_217BD7870();

  CFDataRef v21 = (const __CFData *)sub_217BD78A0();
  CGImageSourceRef v22 = CGImageSourceCreateWithData(v21, 0);

  if (!v22)
  {
    sub_217BA0184();
    swift_allocError();
    *uint64_t v35 = 1;
    swift_willThrow();

LABEL_11:
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v44);
    return;
  }
  if (CGImageSourceGetCount(v22) != 3)
  {
    sub_217BA0184();
    swift_allocError();
    unsigned char *v36 = 2;
    swift_willThrow();

    goto LABEL_11;
  }
  PrimaryImageIndedouble x = CGImageSourceGetPrimaryImageIndex(v22);
  uint64_t v23 = sub_217BD7850();
  uint64_t v43 = v15;
  CFURLRef v24 = (const __CFURL *)v23;
  sub_217BD7A70();
  sub_217BD7A50();
  v18(v11, v8);
  id v25 = (__CFString *)sub_217BD8AE0();
  swift_bridgeObjectRelease();
  uint64_t v26 = CGImageDestinationCreateWithURL(v24, v25, 1uLL, 0);

  if (v26)
  {
    os_log_type_t v27 = v43;
    CGImageDestinationAddImageFromSource(v26, v22, PrimaryImageIndex, 0);
    if (CGImageDestinationFinalize(v26))
    {
      BOOL v28 = (void *)swift_allocObject();
      uint64_t v29 = v41;
      uint64_t v28[2] = v41;
      v28[3] = v16;
      aBlock[4] = sub_217BA0530;
      aBlock[5] = v28;
      aBlock[0] = (id)MEMORY[0x263EF8330];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_217B9E748;
      aBlock[3] = &block_descriptor_16;
      uint64_t v30 = _Block_copy(aBlock);
      id v31 = v29;
      id v16 = v16;
      swift_release();
      aBlock[0] = 0;
      unsigned __int8 v32 = objc_msgSend(v42, sel_performChangesAndWait_error_, v30, aBlock);
      _Block_release(v30);
      id v33 = aBlock[0];
      if (v32)
      {
        (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v44);

        return;
      }
      uint64_t v39 = v33;
      sub_217BD7830();
    }
    else
    {
      sub_217BA0184();
      swift_allocError();
      *uint64_t v38 = 4;
    }
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v44);
  }
  else
  {
    sub_217BA0184();
    swift_allocError();
    *int v37 = 3;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  }
}

void sub_217B9F834(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(self, sel_changeRequestForAsset_, a1);
  objc_msgSend(v3, sel_setContentEditingOutput_, a2);
}

uint64_t static PEAlchemistSupport.revertToMono(asset:photoLibrary:)()
{
  OUTLINED_FUNCTION_7_2();
  *(void *)(v0 + 120) = v1;
  *(void *)(v0 + 128) = v2;
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_217B9F934()
{
  OUTLINED_FUNCTION_7_2();
  id v1 = sub_217B9E7B8();
  v0[17] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_217B9FA00;
  uint64_t v3 = v0[15];
  return sub_217B9E87C(v3, (uint64_t)v1);
}

uint64_t sub_217B9FA00()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v3 + 136);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v9 + 152) = v7;
  *(void *)(v9 + 160) = v8;
  swift_task_dealloc();

  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_217B9FB14()
{
  if (v0[20] >> 60 == 15)
  {
    sub_217BA0184();
    swift_allocError();
    unsigned char *v1 = 0;
    swift_willThrow();
    OUTLINED_FUNCTION_5_4();
    return v2();
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14DD0]), sel_init);
    v0[21] = v4;
    v0[6] = sub_217B819A4;
    v0[7] = 0;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_217BA012C;
    v0[5] = &block_descriptor_2;
    uint64_t v5 = _Block_copy(v0 + 2);
    objc_msgSend(v4, sel_setCanHandleAdjustmentData_, v5);
    _Block_release(v5);
    objc_msgSend(v4, sel_setNetworkAccessAllowed_, 1);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[22] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_217B9FD14;
    uint64_t v7 = v0[15];
    return sub_217B9EE38(v7, (uint64_t)v4);
  }
}

uint64_t sub_217B9FD14()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 184) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_217B9FE10()
{
  id v1 = objc_msgSend(*(id *)(v0 + 184), sel_adjustmentData);
  if (!v1)
  {
    uint64_t v7 = *(void **)(v0 + 184);
    unint64_t v8 = *(void *)(v0 + 160);
    uint64_t v9 = *(void **)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 152);
    sub_217BA0184();
    swift_allocError();
    *uint64_t v11 = 5;
    swift_willThrow();

    uint64_t v12 = v10;
    unint64_t v13 = v8;
LABEL_10:
    sub_217BA01E8(v12, v13);
    OUTLINED_FUNCTION_5_4();
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_formatIdentifier);
  uint64_t v4 = sub_217BD8B10();
  uint64_t v6 = v5;

  if (v4 == 0xD00000000000001ALL && v6 == 0x8000000217BEAAF0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_217BD8D80();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_217B9F2EC(*(void **)(v0 + 120), *(void *)(v0 + 152), *(char **)(v0 + 160), *(void *)(v0 + 184), (uint64_t)v2, *(void **)(v0 + 128));
      goto LABEL_11;
    }
  }
  id v16 = *(void **)(v0 + 120);
  uint64_t v15 = *(void **)(v0 + 128);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v0 + 96) = sub_217BA02FC;
  *(void *)(v0 + 104) = v17;
  *(void *)(v0 + 64) = MEMORY[0x263EF8330];
  *(void *)(v0 + 72) = 1107296256;
  *(void *)(v0 + 80) = sub_217B9E748;
  *(void *)(v0 + 88) = &block_descriptor_6;
  uint64_t v18 = _Block_copy((const void *)(v0 + 64));
  id v19 = v16;
  swift_release();
  *(void *)(v0 + 112) = 0;
  LOBYTE(v15) = objc_msgSend(v15, sel_performChangesAndWait_error_, v18, v0 + 112);
  _Block_release(v18);
  id v20 = *(id *)(v0 + 112);
  if ((v15 & 1) == 0)
  {
    CFDataRef v21 = v20;
    CGImageSourceRef v22 = *(void **)(v0 + 184);
    unint64_t v23 = *(void *)(v0 + 160);
    CFURLRef v24 = *(void **)(v0 + 168);
    uint64_t v25 = *(void *)(v0 + 152);
    sub_217BD7830();

    swift_willThrow();
    uint64_t v12 = v25;
    unint64_t v13 = v23;
    goto LABEL_10;
  }
LABEL_11:
  os_log_type_t v27 = *(void **)(v0 + 184);
  unint64_t v28 = *(void *)(v0 + 160);
  uint64_t v29 = *(void **)(v0 + 168);
  uint64_t v30 = *(void *)(v0 + 152);

  sub_217BA01E8(v30, v28);
  OUTLINED_FUNCTION_5_4();
LABEL_12:
  return v26();
}

uint64_t sub_217BA012C(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

unint64_t sub_217BA0184()
{
  unint64_t result = qword_267BAF1C8;
  if (!qword_267BAF1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267BAF1C8);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_217BA01E8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_217BA01FC(a1, a2);
  }
  return a1;
}

uint64_t sub_217BA01FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

void sub_217BA0254(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_changeRequestForAsset_, a1);
  objc_msgSend(v1, sel_revertAssetContentToOriginal);
}

uint64_t sub_217BA02C4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_217BA02FC()
{
  sub_217BA0254(*(void *)(v0 + 16));
}

ValueMetadata *type metadata accessor for PEAlchemistSupport()
{
  return &type metadata for PEAlchemistSupport;
}

uint64_t getEnumTagSinglePayload for PEAlchemistSupport.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PEAlchemistSupport.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217BA0468);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PEAlchemistSupport.Error()
{
  return &type metadata for PEAlchemistSupport.Error;
}

unint64_t sub_217BA04A4()
{
  unint64_t result = qword_267BAF1D8;
  if (!qword_267BAF1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF1D8);
  }
  return result;
}

uint64_t sub_217BA04F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_217BA0530()
{
  sub_217B9F834(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_217BA0538(uint64_t a1)
{
  sub_217B9F054(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_217BA0540()
{
  unint64_t result = qword_267BAF1E0;
  if (!qword_267BAF1E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BAF1E0);
  }
  return result;
}

uint64_t sub_217BA0580()
{
  return objectdestroy_19Tm(&qword_267BAF1E8);
}

uint64_t sub_217BA058C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1E8);
  OUTLINED_FUNCTION_1(v2);
  return sub_217B9F204(a1);
}

void sub_217BA05F0(uint64_t a1)
{
  sub_217B9EB18(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_217BA05FC()
{
  return objectdestroy_19Tm(&qword_267BAF1F8);
}

uint64_t objectdestroy_19Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_217BA0694(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF1F8);
  OUTLINED_FUNCTION_1(v4);
  return sub_217B9ECD8(a1, a2);
}

uint64_t sub_217BA0728(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_217BA073C(a1, a2);
  }
  return a1;
}

uint64_t sub_217BA073C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return v0 + 8;
}

uint64_t sub_217BA07D4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_217BA07FC(uint64_t (*a1)(void))
{
  return a1();
}

double PEPhotoStyleDPad.value.getter()
{
  OUTLINED_FUNCTION_0_0();
  double v0 = sub_217BA39B8();
  swift_release();
  return v0;
}

uint64_t PEPhotoStyleDPad.value.setter()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_0();
  double v0 = OUTLINED_FUNCTION_5_5();
  sub_217BA3650(1, v0, v1);
  return swift_release();
}

uint64_t sub_217BA096C(double a1, double a2)
{
  return sub_217BA3650(1, a1, a2);
}

double PEPhotoStyleDPad.defaultValue.getter()
{
  OUTLINED_FUNCTION_0_0();
  double v0 = sub_217BA0AD0();
  swift_release();
  return v0;
}

uint64_t PEPhotoStyleDPad.defaultValue.setter()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_5();
  sub_217BA3A8C();
  return swift_release();
}

double sub_217BA0AD0()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 40);
}

uint64_t PEPhotoStyleDPad.backgroundImage.getter()
{
  return sub_217BA1100((uint64_t (*)(uint64_t))sub_217BA0C54);
}

uint64_t PEPhotoStyleDPad.backgroundImage.setter(void *a1)
{
  return sub_217BA11C0(a1);
}

id sub_217BA0C18@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_backgroundImage);
  *a2 = result;
  return result;
}

void *sub_217BA0C54()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  double v1 = *(void **)(v0 + 56);
  id v2 = v1;
  return v1;
}

uint64_t PEPhotoStyleDPad.backgroundColor.getter()
{
  return sub_217BA1100((uint64_t (*)(uint64_t))sub_217BA0DE0);
}

uint64_t PEPhotoStyleDPad.backgroundColor.setter(void *a1)
{
  return sub_217BA11C0(a1);
}

id sub_217BA0DA4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_backgroundColor);
  *a2 = result;
  return result;
}

void *sub_217BA0DE0()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  double v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

void sub_217BA0E58(void *a1)
{
}

uint64_t PEPhotoStyleDPad.gradientCast.getter()
{
  return sub_217BA1100((uint64_t (*)(uint64_t))sub_217BA0FB4);
}

uint64_t PEPhotoStyleDPad.gradientCast.setter(void *a1)
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1034(a1);
  return swift_release();
}

id sub_217BA0FB4()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  double v1 = *(void **)(v0 + 72);
  return v1;
}

void sub_217BA1034(void *a1)
{
}

uint64_t PEPhotoStyleDPad.staticDottedGridImage.getter()
{
  return sub_217BA1100((uint64_t (*)(uint64_t))sub_217BA125C);
}

uint64_t sub_217BA1100(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  uint64_t v3 = a1(v2);
  swift_release();
  return v3;
}

uint64_t PEPhotoStyleDPad.staticDottedGridImage.setter(void *a1)
{
  return sub_217BA11C0(a1);
}

uint64_t sub_217BA11C0(void *a1)
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA0E58(a1);
  return swift_release();
}

id sub_217BA1220@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_staticDottedGridImage);
  *a2 = result;
  return result;
}

void *sub_217BA125C()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  double v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

uint64_t PEPhotoStyleDPad.onValueChanged.getter()
{
  return sub_217BA2114((uint64_t (*)(uint64_t))sub_217BA15D0);
}

uint64_t sub_217BA13A0(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = *(void (**)(uint64_t, double, double))(a1 + 32);
  uint64_t v6 = swift_retain();
  v5(v6, a2, a3);
  return swift_release();
}

uint64_t PEPhotoStyleDPad.onValueChanged.setter()
{
  return sub_217BA21BC();
}

uint64_t sub_217BA1450@<X0>(id *a1@<X0>, uint64_t (**a2)(double *a1)@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onValueChanged);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217B7CCD4;
  *(void *)(result + 24) = v4;
  *a2 = sub_217BA5BDC;
  a2[1] = (uint64_t (*)(double *))result;
  return result;
}

void sub_217BA14EC(uint64_t *a1, void **a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  v8[4] = sub_217BA5BA0;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_217BA13A0;
  v8[3] = &block_descriptor_94;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setOnValueChanged_, v7);
  _Block_release(v7);
}

uint64_t sub_217BA15D0()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 240);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStyleDPad.isActive.getter()
{
  return sub_217BA1758((uint64_t (*)(uint64_t))sub_217BA169C);
}

uint64_t sub_217BA169C()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PEPhotoStyleDPad.pulsingValueIndicator.getter()
{
  return sub_217BA1758((uint64_t (*)(uint64_t))sub_217BA1860);
}

uint64_t sub_217BA1758(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  LOBYTE(a1) = a1(v2);
  swift_release();
  return a1 & 1;
}

uint64_t PEPhotoStyleDPad.pulsingValueIndicator.setter()
{
  return swift_release();
}

uint64_t sub_217BA1860()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_217BA18D0()
{
  return swift_release();
}

BOOL PEPhotoStyleDPad.isDottedGridAnimated.getter()
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1B1C(v1);
  swift_release();
  return (~v1[48] & 0x8100) == 0;
}

uint64_t PEPhotoStyleDPad.isDottedGridAnimated.setter(char a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___PEPhotoStyleDPad_stylePadModel);
  swift_getKeyPath();
  sub_217BA3F80();
  swift_retain();
  sub_217BD78D0();
  swift_release();
  swift_getKeyPath();
  sub_217BD78F0();
  swift_release();
  if (*(__int16 *)(v3 + 184) < 0)
  {
    if (a1) {
      __int16 v4 = -32512;
    }
    else {
      __int16 v4 = 0x8000;
    }
    *(_WORD *)(v3 + 184) = v4 & 0xFFFE | *(_WORD *)(v3 + 184) & 1;
  }
  swift_getKeyPath();
  sub_217BD78E0();
  swift_release();
  return swift_release();
}

void *sub_217BA1B1C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return memcpy(a1, (const void *)(v1 + 88), 0x80uLL);
}

BOOL PEPhotoStyleDPad.snapIndicatorToGrid.getter()
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1B1C(v1);
  swift_release();
  return (~v1[48] & 0x8001) == 0;
}

uint64_t PEPhotoStyleDPad.snapIndicatorToGrid.setter(char a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___PEPhotoStyleDPad_stylePadModel);
  swift_getKeyPath();
  sub_217BA3F80();
  swift_retain();
  sub_217BD78D0();
  swift_release();
  swift_getKeyPath();
  sub_217BD78F0();
  swift_release();
  int v4 = *(__int16 *)(v3 + 184);
  if (v4 < 0) {
    *(_WORD *)(v3 + 184) = v4 & 0x100 | a1 & 1 | 0x8000;
  }
  swift_getKeyPath();
  sub_217BD78E0();
  swift_release();
  return swift_release();
}

uint64_t PEPhotoStyleDPad.onGestureDidBegin.getter()
{
  return sub_217BA2114((uint64_t (*)(uint64_t))sub_217BA1F3C);
}

void sub_217BA1DE4(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);
}

uint64_t PEPhotoStyleDPad.onGestureDidBegin.setter()
{
  return sub_217BA21BC();
}

uint64_t sub_217BA1EA0@<X0>(id *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onGestureDidBegin);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217BA60E4;
  *(void *)(result + 24) = v4;
  *a2 = sub_217BA6154;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_217BA1F3C()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 256);
  swift_retain();
  return v1;
}

uint64_t sub_217BA1FBC()
{
  return swift_release();
}

id sub_217BA2044(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  id v6 = a1;
  uint64_t v7 = a3();
  uint64_t v9 = v8;

  v12[4] = v7;
  v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_217B9E748;
  void v12[3] = a4;
  uint64_t v10 = _Block_copy(v12);
  swift_release();
  return v10;
}

uint64_t PEPhotoStyleDPad.onGestureDidEnd.getter()
{
  return sub_217BA2114((uint64_t (*)(uint64_t))sub_217BA22C8);
}

uint64_t sub_217BA2114(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  uint64_t v3 = a1(v2);
  swift_release();
  return v3;
}

uint64_t PEPhotoStyleDPad.onGestureDidEnd.setter()
{
  return sub_217BA21BC();
}

uint64_t sub_217BA21BC()
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1FBC();
  return swift_release();
}

uint64_t sub_217BA222C@<X0>(id *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_onGestureDidEnd);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_217BA60E4;
  *(void *)(result + 24) = v4;
  *a2 = sub_217BA5B78;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_217BA22C8()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 272);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStyleDPad.configuration.getter@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1B1C(a1);
  return swift_release();
}

void *sub_217BA2390@<X0>(void *a1@<X8>)
{
  PEPhotoStyleDPad.configuration.getter(v3);
  return memcpy(a1, v3, 0x80uLL);
}

uint64_t PEPhotoStyleDPad.configuration.setter(void *__src)
{
  memcpy(v2, __src, sizeof(v2));
  OUTLINED_FUNCTION_0_0();
  sub_217BA2430(v2);
  return swift_release();
}

uint64_t sub_217BA2430(void *__src)
{
  memcpy(__dst, __src, sizeof(__dst));
  swift_getKeyPath();
  sub_217BA3AE4();
  return swift_release();
}

void (*PEPhotoStyleDPad.configuration.modify(void *a1))(const void **a1)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  PEPhotoStyleDPad.configuration.getter(v3);
  return sub_217BA250C;
}

void sub_217BA250C(const void **a1)
{
  uint64_t v1 = (void *)*a1;
  memcpy(v2, *a1, sizeof(v2));
  PEPhotoStyleDPad.configuration.setter(v2);
  free(v1);
}

uint64_t PEPhotoStyleDPad.size.getter()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v0 = sub_217BA264C();
  swift_release();
  return v0;
}

uint64_t sub_217BA25B8()
{
  return PEPhotoStyleDPad.size.setter();
}

uint64_t PEPhotoStyleDPad.size.setter()
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA26C0();
  return swift_release();
}

uint64_t sub_217BA264C()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return *(void *)(v0 + 216);
}

uint64_t sub_217BA26C0()
{
  return swift_release();
}

uint64_t (*PEPhotoStyleDPad.size.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  *(void *)a1 = PEPhotoStyleDPad.size.getter();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return sub_217BA2798;
}

uint64_t sub_217BA2798()
{
  return PEPhotoStyleDPad.size.setter();
}

id PEPhotoStyleDPad.init(initialValue:defaultValue:gradientCast:configuration:size:onValueChanged:)(void *a1, const void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  memcpy(__dst, a2, sizeof(__dst));
  id v19 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSize_, 0.0, 0.0);
  _s16IntegrationModelCMa_1(0);
  swift_allocObject();
  id v20 = v19;
  id v21 = a1;
  swift_retain();
  *(void *)&long long v23 = a3;
  *((void *)&v23 + 1) = a4;
  sub_217BA41F0(0, 0, (uint64_t)v21, 0, __dst, *(uint64_t *)&a9, *(uint64_t *)&a10, 0, a5, a6, a7, a8, v23, (unint64_t)nullsub_1, (uint64_t)nullsub_1, 0);
  sub_217BA2938();
  swift_release();

  swift_release();
  return v20;
}

uint64_t sub_217BA2938()
{
  swift_retain();
  double v0 = sub_217BA39B8();
  sub_217BA3650(1, v0, v1);
  swift_release();
  swift_retain();
  sub_217BA0AD0();
  sub_217BA3A8C();
  swift_release();
  swift_retain();
  uint64_t v2 = sub_217BA0C54();
  sub_217BA0E58(v2);
  swift_release();
  swift_retain();
  uint64_t v3 = sub_217BA0DE0();
  sub_217BA0E58(v3);
  swift_release();
  swift_retain();
  id v4 = sub_217BA0FB4();
  sub_217BA1034(v4);
  swift_release();
  swift_retain();
  sub_217BA1B1C(v6);
  sub_217BA2430(v6);
  swift_release();
  swift_retain();
  sub_217BA264C();
  sub_217BA26C0();
  swift_release();
  swift_retain();
  sub_217BA15D0();
  sub_217BA1FBC();
  return swift_release();
}

void __swiftcall PEPhotoStyleDPad.init(size:)(PEPhotoStyleDPad *__return_ptr retstr, CGSize size)
{
  OUTLINED_FUNCTION_4_5();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v5 = OUTLINED_FUNCTION_5_5();
  objc_msgSend(v3, v4, v5);
}

id PEPhotoStyleDPad.init(size:)()
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v1 = _s15IntegrationViewVMa_1(0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v13 - v5;
  uint64_t v7 = (void *)*MEMORY[0x263F5D818];
  v14[0] = 1;
  long long v15 = xmmword_217BDCB90;
  long long v16 = xmmword_217BDCBA0;
  long long v17 = xmmword_217BDCB50;
  long long v18 = xmmword_217BDCB60;
  char v19 = 0;
  long long v20 = xmmword_217BDCB20;
  __int16 v21 = -32511;
  long long v22 = xmmword_217BDCBB0;
  uint64_t v23 = 0x3FE3333333333333;
  _s16IntegrationModelCMa_1(0);
  swift_allocObject();
  uint64_t v8 = v0;
  *(void *)&v8[OBJC_IVAR___PEPhotoStyleDPad_stylePadModel] = sub_217BA41F0(0, 0, (uint64_t)v7, 0, v14, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, (unint64_t)nullsub_1, (unint64_t)nullsub_1, (uint64_t)nullsub_1, 0);
  sub_217BA3F80();
  swift_retain();
  sub_217BD8840();
  id v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BAF218));
  sub_217BA4330((uint64_t)v6, (uint64_t)v4);
  uint64_t v10 = sub_217BD8220();
  sub_217BA4394((uint64_t)v6);
  *(void *)&v8[OBJC_IVAR___PEPhotoStyleDPad_hostingController] = v10;

  v13.receiver = v8;
  v13.super_class = (Class)PEPhotoStyleDPad;
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  PEPhotoStyleDPad.size.setter();
  sub_217BA2E30();

  return v11;
}

uint64_t sub_217BA2DFC(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_217BA5038(a1);
}

void sub_217BA2E30()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___PEPhotoStyleDPad_hostingController;
  objc_msgSend(v0, sel_addChildViewController_, *(void *)&v0[OBJC_IVAR___PEPhotoStyleDPad_hostingController]);
  objc_msgSend(*(id *)&v0[v2], sel_didMoveToParentViewController_, v0);
  id v3 = *(id *)&v0[v2];
  sub_217BD8200();

  id v4 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v8)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v9 = v8;
  objc_msgSend(v7, sel_addSubview_, v8);

  id v10 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v10);

  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAE860);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_217BDD4E0;
  id v12 = objc_msgSend(v5, sel_topAnchor);
  id v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v13;
  id v15 = objc_msgSend(v13, sel_topAnchor);

  id v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(void *)(v11 + 32) = v16;
  id v17 = objc_msgSend(v5, sel_bottomAnchor);
  id v18 = objc_msgSend(v1, sel_view);
  if (!v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  char v19 = v18;
  id v20 = objc_msgSend(v18, sel_bottomAnchor);

  id v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
  *(void *)(v11 + 40) = v21;
  id v22 = objc_msgSend(v5, sel_leadingAnchor);
  id v23 = objc_msgSend(v1, sel_view);
  if (!v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  CFURLRef v24 = v23;
  id v25 = objc_msgSend(v23, sel_leadingAnchor);

  id v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
  *(void *)(v11 + 48) = v26;
  id v27 = objc_msgSend(v5, sel_trailingAnchor);
  id v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v29 = v28;
  uint64_t v30 = self;
  id v31 = objc_msgSend(v29, sel_trailingAnchor);

  id v32 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v31);
  *(void *)(v11 + 56) = v32;
  sub_217BD8B80();
  sub_217B7C758(0, &qword_267BAE868);
  id v33 = (id)sub_217BD8B60();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v33);
}

void __swiftcall PEPhotoStyleDPad.init(coder:)(PEPhotoStyleDPad_optional *__return_ptr retstr, NSCoder coder)
{
}

void PEPhotoStyleDPad.init(coder:)()
{
}

Swift::Void __swiftcall PEPhotoStyleDPad.setValue(_:animated:)(CGPoint _, Swift::Bool animated)
{
}

uint64_t PEPhotoStyleDPad.withAnimation(duration:_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_217BD8310();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_217BD8970();
  sub_217BD8300();
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  id v13 = (void *)swift_allocObject();
  v13[2] = v4;
  v13[3] = a3;
  v13[4] = a4;
  id v14 = v4;
  sub_217B9DFA8(a3);
  sub_217BD7E40();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

Swift::Void __swiftcall PEPhotoStyleDPad.setDefaultValue(_:animated:)(CGPoint _, Swift::Bool animated)
{
}

uint64_t sub_217BA353C(double a1, double a2, uint64_t a3, uint64_t a4)
{
  *(double *)&v5[3] = a1;
  *(double *)&v5[4] = a2;
  return PEPhotoStyleDPad.withAnimation(duration:_:completion:)(a4, (uint64_t)v5, 0, 0);
}

Swift::Void __swiftcall PEPhotoStyleDPad.setValue(_:notifyObserver:)(CGPoint _, Swift::Bool notifyObserver)
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_0();
  double v3 = OUTLINED_FUNCTION_5_5();
  sub_217BA3650(notifyObserver, v3, v4);
  swift_release();
}

uint64_t sub_217BA3650(char a1, double a2, double a3)
{
  sub_217BA39B8();
  if ((sub_217BD7920() & 1) == 0 || (sub_217BA39B8(), uint64_t result = sub_217BD7920(), (result & 1) == 0))
  {
    uint64_t result = sub_217BA3A8C();
    if (a1)
    {
      uint64_t v7 = (void (*)(double, double))sub_217BA15D0();
      v7(a2, a3);
      return swift_release();
    }
  }
  return result;
}

void sub_217BA3778(uint64_t a1, void (*a2)(void))
{
  if (a2) {
    a2();
  }
}

Swift::Void __swiftcall PEPhotoStyleDPad.resizeToFitContent()()
{
  id v3 = objc_msgSend(v0, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR___PEPhotoStyleDPad_hostingController], sel_view);
  if (!v1)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v2 = v1;
  objc_msgSend(v1, sel_intrinsicContentSize);

  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v3, sel_setBounds_);
}

CGImageRef_optional __swiftcall PEPhotoStyleDPad.generateDottedGridImage()()
{
  OUTLINED_FUNCTION_0_0();
  sub_217BA1B1C(&v9);
  swift_release();
  if (((__int16)v21 & 0x80000000) == 0) {
    return 0;
  }
  uint64_t v1 = v19;
  uint64_t v2 = v20;
  char v3 = sub_217BD8380();
  sub_217BD7C60();
  __int16 v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  char v12 = 1;
  uint64_t v13 = v1;
  uint64_t v14 = v2;
  uint64_t v15 = 0x3FD47AE147AE147BLL;
  char v16 = 0;
  char v17 = v3;
  uint64_t v18 = v4;
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  uint64_t v21 = v7;
  char v22 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF228);
  swift_allocObject();
  sub_217BD7E10();
  sub_217BD7E00();
  LOBYTE(v9) = 0;
  sub_217BD7DF0();
  result.CGImageRef value = (CGImageRef)sub_217BD7DE0();
  if (result.value)
  {
    CGImageRef value = result.value;
    swift_release();
    return (CGImageRef_optional)value;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall PEPhotoStyleDPad._canShowWhileLocked()()
{
  return 1;
}

double sub_217BA39B8()
{
  swift_getKeyPath();
  sub_217BA3F80();
  sub_217BD78D0();
  swift_release();
  return *(double *)(v0 + 16);
}

uint64_t sub_217BA3A28()
{
  return sub_217BA18D0();
}

uint64_t sub_217BA3A48()
{
  return sub_217BA3A8C();
}

uint64_t sub_217BA3A8C()
{
  return swift_release();
}

uint64_t sub_217BA3AE4()
{
  return sub_217BD78C0();
}

uint64_t sub_217BA3B70(uint64_t result, char a2)
{
  if ((result & 1) != (a2 & 1))
  {
    if (sub_217BA1860())
    {
      sub_217BD8950();
      sub_217BD7E50();
      swift_release();
    }
    if (a2) {
      char v3 = (void (*)(void))sub_217BA1F3C();
    }
    else {
      char v3 = (void (*)(void))sub_217BA22C8();
    }
    v3();
    return swift_release();
  }
  return result;
}

uint64_t sub_217BA3C38(char a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  *(unsigned char *)(v1 + 32) = a1;
  char v3 = sub_217BA169C() & 1;
  return sub_217BA3B70(v2, v3);
}

uint64_t sub_217BA3C78()
{
  return swift_release();
}

uint64_t sub_217BA3CCC()
{
  return sub_217BA3A8C();
}

void sub_217BA3D10(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_217BA0E58(v1);
}

void sub_217BA3D5C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = a2;
  id v3 = a2;
}

void sub_217BA3D90(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_217BA0E58(v1);
}

void sub_217BA3DDC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = a2;
  id v3 = a2;
}

void sub_217BA3E10(id *a1)
{
}

void sub_217BA3E3C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = a2;
  id v3 = a2;
}

void sub_217BA3E70(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_217BA0E58(v1);
}

void sub_217BA3EBC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = a2;
  id v3 = a2;
}

void *sub_217BA3EF0@<X0>(void *a1@<X8>)
{
  sub_217BA1B1C(v3);
  return memcpy(a1, v3, 0x80uLL);
}

uint64_t sub_217BA3F38(void *__src)
{
  memcpy(v2, __src, sizeof(v2));
  return sub_217BA2430(v2);
}

unint64_t sub_217BA3F80()
{
  unint64_t result = qword_267BAF210;
  if (!qword_267BAF210)
  {
    _s16IntegrationModelCMa_1(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF210);
  }
  return result;
}

uint64_t _s16IntegrationModelCMa_1(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAF230);
}

uint64_t sub_217BA3FF0()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = v1();
  *(void *)uint64_t v0 = result;
  *(void *)(v0 + 8) = v3;
  *(unsigned char *)(v0 + 16) = v4 & 1;
  return result;
}

uint64_t sub_217BA4024()
{
  return sub_217BA26C0();
}

uint64_t sub_217BA4058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 240) = a2;
  *(void *)(a1 + 248) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217BA4094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 256) = a2;
  *(void *)(a1 + 264) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217BA40D0@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X5>, void *a3@<X8>)
{
  uint64_t v5 = a1();
  uint64_t v7 = v6;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v5;
  *(void *)(result + 24) = v7;
  *a3 = a2;
  a3[1] = result;
  return result;
}

uint64_t sub_217BA4134(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  swift_retain();
  return sub_217BA1FBC();
}

uint64_t sub_217BA41B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_217BA41F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10, double a11, double a12, long long a13, long long a14, uint64_t a15, uint64_t a16)
{
  *(_WORD *)(v16 + 32) = 0;
  *(void *)(v16 + 80) = 0;
  *(void *)(v16 + 56) = 0;
  *(void *)(v16 + 64) = 0;
  *(void *)(v16 + 216) = 0;
  *(void *)(v16 + 224) = 0;
  *(unsigned char *)(v16 + 232) = 1;
  sub_217BD7900();
  *(double *)(v16 + 16) = a9;
  *(double *)(v16 + 24) = a10;
  *(double *)(v16 + 40) = a11;
  *(double *)(v16 + 48) = a12;

  *(void *)(v16 + 56) = a1;
  *(void *)(v16 + 64) = a2;
  *(void *)(v16 + 72) = a3;

  *(void *)(v16 + 80) = a4;
  memcpy((void *)(v16 + 88), a5, 0x80uLL);
  *(void *)(v16 + 216) = a6;
  *(void *)(v16 + 224) = a7;
  *(unsigned char *)(v16 + 232) = a8 & 1;
  *(_OWORD *)(v16 + 240) = a13;
  *(_OWORD *)(v16 + 256) = a14;
  *(void *)(v16 + 272) = a15;
  *(void *)(v16 + 280) = a16;
  return v16;
}

uint64_t _s15IntegrationViewVMa_1(uint64_t a1)
{
  return sub_217B7BA00(a1, (uint64_t *)&unk_267BAF2E0);
}

uint64_t sub_217BA4330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s15IntegrationViewVMa_1(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217BA4394(uint64_t a1)
{
  uint64_t v2 = _s15IntegrationViewVMa_1(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_217BA43F0()
{
  return sub_217BA448C((SEL *)&selRef_setValue_);
}

uint64_t sub_217BA43FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_217BA442C()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_217BA4474()
{
  sub_217BA3778(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

id sub_217BA4480()
{
  return sub_217BA448C((SEL *)&selRef_setDefaultValue_);
}

id sub_217BA448C(SEL *a1)
{
  return objc_msgSend(*(id *)(v1 + 16), *a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

id *sub_217BA44A0()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo16PEPhotoStyleDPadP33_AA1EE9CF7D273E93D23CCED039C6510B16IntegrationModel___observationRegistrar;
  uint64_t v2 = sub_217BD7910();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_217BA453C()
{
  uint64_t v0 = sub_217BA44A0();
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_217BA4590@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v26 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2F8);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v8);
  id v33 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217BD8830();
  swift_getKeyPath();
  sub_217BD8850();
  swift_release();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v7, v1);
  uint64_t v31 = v49[1];
  uint64_t v32 = v49[0];
  double v11 = *(double *)&v49[2];
  double v12 = *(double *)&v49[3];
  sub_217BD8830();
  swift_getKeyPath();
  sub_217BD8850();
  swift_release();
  v10(v5, v1);
  uint64_t v29 = v51;
  uint64_t v30 = v50;
  int v28 = v52;
  sub_217BD8820();
  int v27 = sub_217BA1860();
  swift_release();
  sub_217BD8820();
  double v13 = sub_217BA0AD0();
  double v15 = v14;
  swift_release();
  sub_217BD8820();
  uint64_t v16 = sub_217BA0C54();
  swift_release();
  sub_217BD8820();
  char v17 = sub_217BA0DE0();
  swift_release();
  sub_217BD8820();
  id v18 = sub_217BA0FB4();
  unint64_t v19 = PISemanticStyleCast.gradientImageName.getter();
  uint64_t v21 = v20;
  swift_release();

  sub_217BD8820();
  char v22 = sub_217BA125C();
  swift_release();
  sub_217BD8820();
  sub_217BA1B1C(v37);
  swift_release();
  *(void *)&long long v25 = v19;
  *((void *)&v25 + 1) = v21;
  PhotoStyleDPad.init(value:isActive:pulsingValueIndicator:defaultValue:minValue:maxValue:backgroundImage:backgroundColor:gradientImageName:staticDottedGridImage:configuration:)(v32, v31, v30, v29, v28, v27 & 1, (uint64_t)v16, (uint64_t)v17, v55, v11, v12, v13, v15, -1.0, -1.0, 1.0, 1.0, v25, (uint64_t)v22,
    v37);
  sub_217BD8820();
  sub_217BA264C();
  swift_release();
  sub_217BD8820();
  sub_217BA264C();
  swift_release();
  memcpy(v49, v55, sizeof(v49));
  char v46 = 0;
  sub_217BD88E0();
  sub_217BD7D50();
  char v48 = v51;
  char v47 = v53;
  memcpy(v37, v49, sizeof(v37));
  uint64_t v38 = 0x3FF0000000000000;
  char v39 = v46;
  char v40 = 0;
  uint64_t v41 = v50;
  char v42 = v51;
  uint64_t v43 = v52;
  char v44 = v53;
  long long v45 = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF300);
  sub_217BA5934(&qword_267BAF308, &qword_267BAF300, (void (*)(void))sub_217BA5904);
  id v23 = v33;
  sub_217BD8530();
  sub_217B6F754(v55);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v36, v23, v35);
}

uint64_t sub_217BA4AA0(double *a1)
{
  return sub_217BA096C(*a1, a1[1]);
}

void __swiftcall PEPhotoStyleDPad.init(nibName:bundle:)(PEPhotoStyleDPad *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    uint64_t v4 = (void *)sub_217BD8AE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void PEPhotoStyleDPad.init(nibName:bundle:)()
{
}

id sub_217BA4B78(uint64_t a1)
{
  return keypath_get_1Tm(a1);
}

id sub_217BA4B84(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (SEL *)&selRef_setValue_);
}

char *keypath_get_selector_defaultValue()
{
  return sel_defaultValue;
}

id sub_217BA4B9C(uint64_t a1)
{
  return keypath_get_1Tm(a1);
}

id keypath_get_1Tm(uint64_t a1)
{
  uint64_t v2 = (void *)OUTLINED_FUNCTION_12_1(a1);
  id result = [v2 *v3];
  void *v1 = v5;
  v1[1] = v6;
  return result;
}

id sub_217BA4BD4(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (SEL *)&selRef_setDefaultValue_);
}

id keypath_set_2Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1]);
}

char *keypath_get_selector_backgroundImage()
{
  return sel_backgroundImage;
}

id sub_217BA4C00(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBackgroundImage_, *a1);
}

char *keypath_get_selector_backgroundColor()
{
  return sel_backgroundColor;
}

id sub_217BA4C24(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBackgroundColor_, *a1);
}

id sub_217BA4C3C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGradientCast_, *a1);
}

char *keypath_get_selector_staticDottedGridImage()
{
  return sel_staticDottedGridImage;
}

id sub_217BA4C60(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStaticDottedGridImage_, *a1);
}

char *keypath_get_selector_pulsingValueIndicator()
{
  return sel_pulsingValueIndicator;
}

id sub_217BA4C88(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_pulsingValueIndicator);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217BA4CB8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPulsingValueIndicator_, *a1);
}

char *keypath_get_selector_isDottedGridAnimated()
{
  return sel_isDottedGridAnimated;
}

id sub_217BA4CD8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_isDottedGridAnimated);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217BA4D08(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDottedGridAnimated_, *a1);
}

char *keypath_get_selector_snapIndicatorToGrid()
{
  return sel_snapIndicatorToGrid;
}

id sub_217BA4D28(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_12_1(a1), sel_snapIndicatorToGrid);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_217BA4D58(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSnapIndicatorToGrid_, *a1);
}

void sub_217BA4D70(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_217BA4DB8(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_217BA4E00(void *a1)
{
  return PEPhotoStyleDPad.configuration.setter(a1);
}

uint64_t sub_217BA4E24()
{
  return sub_217BA3FF0();
}

uint64_t sub_217BA4E54()
{
  return _s16IntegrationModelCMa_1(0);
}

uint64_t sub_217BA4E5C()
{
  uint64_t result = sub_217BD7910();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStyleDPad(uint64_t a1)
{
  return sub_217B7C758(a1, &qword_267BAF240);
}

uint64_t sub_217BA4FCC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_217BA5010()
{
  return sub_217B819A4() & 1;
}

uint64_t sub_217BA5038(uint64_t a1)
{
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + qword_267BAF248);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v8 - v5, a1, v3);
  uint64_t v6 = sub_217BD8220();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v6;
}

void *sub_217BA515C(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_217BA51A0(a1, a2);
}

void *sub_217BA51A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + qword_267BAF248);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  uint64_t v7 = (void *)sub_217BD8210();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_217BA52D8(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PadHostingController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_217BA5370(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_217BA52D8(a3);
}

id sub_217BA5398()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PadHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PadHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_217BA542C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  objc_super v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_217BA549C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_217BA5504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_217BA556C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_217BA55D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_217BA563C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_217BA56A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217BA56B8);
}

uint64_t sub_217BA56B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_217BA5704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217BA5718);
}

uint64_t sub_217BA5718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAF2D8);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_217BA5768()
{
  sub_217BA57F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_217BA57F4()
{
  if (!qword_267BAF2F0)
  {
    _s16IntegrationModelCMa_1(255);
    unint64_t v0 = sub_217BD8860();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BAF2F0);
    }
  }
}

uint64_t sub_217BA584C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_217BA5868()
{
  OUTLINED_FUNCTION_1_0();
  *(double *)uint64_t v0 = sub_217BA0968();
  *(void *)(v0 + 8) = v1;
}

uint64_t sub_217BA5894()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = sub_217BA169C();
  unsigned char *v0 = result & 1;
  return result;
}

uint64_t sub_217BA58C0()
{
  return sub_217BA3C78();
}

uint64_t sub_217BA5904()
{
  return sub_217BA5934(&qword_267BAF310, &qword_267BAF318, (void (*)(void))sub_217BA59B0);
}

uint64_t sub_217BA5934(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_217BA59B0()
{
  unint64_t result = qword_267BAF320;
  if (!qword_267BAF320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAF320);
  }
  return result;
}

uint64_t sub_217BA59FC()
{
  return sub_217BA3C38(*(unsigned char *)(v0 + 24));
}

uint64_t sub_217BA5A30()
{
  return sub_217BA3C78();
}

uint64_t sub_217BA5A78()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t result = sub_217BA1860();
  unsigned char *v0 = result & 1;
  return result;
}

uint64_t sub_217BA5AA4()
{
  return sub_217BA3C78();
}

void sub_217BA5AE8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 33) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_217BA5AF8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_217BA5B30()
{
  return OUTLINED_FUNCTION_2_5(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_217BA5B50()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_217BA5B78()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_217BA5BA4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217BA5BDC(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_217BA5C08()
{
  return sub_217BA3FF0();
}

__n128 sub_217BA5C38()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 40);
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(v1 + 216) = result;
  *(unsigned char *)(v1 + 232) = v2;
  return result;
}

void *sub_217BA5C50()
{
  return memcpy((void *)(*(void *)(v0 + 16) + 88), *(const void **)(v0 + 24), 0x80uLL);
}

uint64_t sub_217BA5C60@<X0>(void *a1@<X8>)
{
  return sub_217BA40D0(sub_217BA22C8, (uint64_t)sub_217BA6154, a1);
}

uint64_t sub_217BA5CA8(uint64_t *a1)
{
  return sub_217BA4134(a1);
}

uint64_t sub_217BA5CF8()
{
  return sub_217BA41B4(v0[2], v0[3], v0[4]);
}

uint64_t sub_217BA5D18@<X0>(void *a1@<X8>)
{
  return sub_217BA40D0(sub_217BA1F3C, (uint64_t)sub_217BA6154, a1);
}

uint64_t sub_217BA5D60(uint64_t *a1)
{
  return sub_217BA4134(a1);
}

uint64_t sub_217BA5DB0()
{
  return sub_217BA4094(v0[2], v0[3], v0[4]);
}

uint64_t sub_217BA5DD0@<X0>(void *a1@<X8>)
{
  return sub_217BA40D0(sub_217BA15D0, (uint64_t)sub_217BA613C, a1);
}

uint64_t sub_217BA5E18(uint64_t *a1)
{
  return sub_217BA4134(a1);
}

uint64_t sub_217BA5E68()
{
  return sub_217BA4058(v0[2], v0[3], v0[4]);
}

uint64_t sub_217BA5E88(double a1, double a2)
{
  id v3 = *(uint64_t (**)(void *))(v2 + 16);
  *(double *)objc_super v5 = a1;
  *(double *)&v5[1] = a2;
  return v3(v5);
}

void *sub_217BA5EC0()
{
  OUTLINED_FUNCTION_1_0();
  __n128 result = sub_217BA125C();
  void *v0 = result;
  return result;
}

void sub_217BA5EEC()
{
  sub_217BA3EBC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_217BA5F08()
{
  OUTLINED_FUNCTION_1_0();
  id result = sub_217BA0FB4();
  void *v0 = result;
  return result;
}

void sub_217BA5F34()
{
  sub_217BA3E3C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *sub_217BA5F50()
{
  OUTLINED_FUNCTION_1_0();
  id result = sub_217BA0DE0();
  void *v0 = result;
  return result;
}

void sub_217BA5F7C()
{
  sub_217BA3DDC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *sub_217BA5F98()
{
  OUTLINED_FUNCTION_1_0();
  id result = sub_217BA0C54();
  void *v0 = result;
  return result;
}

void sub_217BA5FC4()
{
  sub_217BA3D5C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_217BA5FE0()
{
  OUTLINED_FUNCTION_1_0();
  *(double *)uint64_t v0 = sub_217BA0AD0();
  *(void *)(v0 + 8) = v1;
}

__n128 sub_217BA600C()
{
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(void *)(v0 + 16) + 40) = result;
  return result;
}

void sub_217BA601C()
{
  OUTLINED_FUNCTION_1_0();
  *(double *)uint64_t v0 = sub_217BA39B8();
  *(void *)(v0 + 8) = v1;
}

__n128 sub_217BA6048()
{
  __n128 result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(void *)(v0 + 16) + 16) = result;
  return result;
}

uint64_t sub_217BA6058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_217BA3AE4();
}

double OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_217BA7CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217BAAB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PECopyEditsSettingIdentifierName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"PECopyEditsSettingIdentifierCinematic";
  }
  else {
    return off_2642BE4F0[a1 - 1];
  }
}

void sub_217BB2C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_217BB3BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_217BB6D08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id getVNSceneprintClass()
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x2050000000;
  double v0 = (void *)getVNSceneprintClass_softClass;
  uint64_t v7 = getVNSceneprintClass_softClass;
  if (!getVNSceneprintClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVNSceneprintClass_block_invoke;
    v3[3] = &unk_2642BE800;
    v3[4] = &v4;
    __getVNSceneprintClass_block_invoke((uint64_t)v3);
    double v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217BB6E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSceneprintClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    void v6[3] = __VisionLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2642BE820;
    uint64_t v8 = 0;
    VisionLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *VisionLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PEEditAction.m", 53, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("VNSceneprint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    objc_super v5 = [NSString stringWithUTF8String:"Class getVNSceneprintClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PEEditAction.m", 54, @"Unable to find class %s", "VNSceneprint");

LABEL_10:
    __break(1u);
  }
  getVNSceneprintClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrardouble y = result;
  return result;
}

double PEExteriorAngleSum(void *a1)
{
  id v1 = a1;
  double v2 = 0.0;
  if ([v1 pointCount] >= 3)
  {
    uint64_t v3 = 1;
    do
    {
      [v1 pointAtIndex:v3 - 1];
      float v5 = v4;
      float v7 = v6;
      int v9 = v8;
      [v1 pointAtIndex:v3];
      float v11 = v10;
      float v13 = v12;
      int v15 = v14;
      [v1 pointAtIndex:++v3];
      LODWORD(v16) = v9;
      LODWORD(v17) = v15;
      double v2 = v2 + PESignedAngleBetweenPoints(v5, v7, v16, v11, v13, v17, v20, v21, v18, v19);
    }
    while ([v1 pointCount] - 1 > v3);
  }

  return v2;
}

double PESignedAngleBetweenPoints(float a1, float a2, double a3, float a4, float a5, double a6, double a7, double a8, float a9, float a10)
{
  double v15 = (float)(a4 - a1);
  double v16 = (float)(a5 - a2);
  double v17 = (float)(a9 - a4);
  double v18 = (float)(a10 - a5);
  double v19 = sqrt(v16 * v16 + v15 * v15);
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = 0.0;
  if (v19 >= 0.00001)
  {
    double v22 = 1.0 / v19 * v15;
    double v21 = 1.0 / v19 * v16;
  }
  double v23 = sqrt(v18 * v18 + v17 * v17);
  double v24 = 0.0;
  if (v23 >= 0.00001)
  {
    double v24 = 1.0 / v23 * v17;
    double v20 = 1.0 / v23 * v18;
  }
  return atan2(v24 * v21 - v20 * v22, v21 * v20 + v24 * v22);
}

id thresholdImage(void *a1, float a2)
{
  void v18[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F00618];
  id v4 = a1;
  float v5 = [v3 cachedKernelWithString:@"kernel vec4 PECleanupSegmentAnalyzerColorThreshold(__sample c, float t) { c = compare(c - t, vec4(0.0), vec4(1.0)) return c; }"];;
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v18[0] = v4;
  *(float *)&double v6 = a2;
  int v14 = [NSNumber numberWithFloat:v6];
  v18[1] = v14;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  double v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  return v16;
}

double PEVectorMagnitude(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double PEVectorScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PEVectorNormalize(double a1, double a2)
{
  double v2 = sqrt(a2 * a2 + a1 * a1);
  double v3 = 0.0;
  if (v2 >= 0.00001) {
    return a1 * (1.0 / v2);
  }
  return v3;
}

double PEVectorAngle(double a1, double a2, double a3, double a4)
{
  return atan2(a1 * a4 - a2 * a3, a2 * a4 + a1 * a3);
}

id PELocalizedString(void *a1)
{
  id v1 = a1;
  if (PELocalizedString_once != -1) {
    dispatch_once(&PELocalizedString_once, &__block_literal_global_782);
  }
  double v2 = [(id)PELocalizedString_frameworkBundle localizedStringForKey:v1 value:&stru_26C820838 table:@"PhotosUIEdit"];
  if ([v2 isEqualToString:v1])
  {
    uint64_t v3 = [(id)PELocalizedString_frameworkBundle localizedStringForKey:v1 value:&stru_26C820838 table:@"PhotosUIEdit-Styles"];

    double v2 = (void *)v3;
  }
  if ([v2 isEqualToString:v1])
  {
    uint64_t v4 = [(id)PELocalizedString_frameworkBundle localizedStringForKey:v1 value:&stru_26C820838 table:@"PhotosUIEdit-Cleanup"];

    double v2 = (void *)v4;
  }
  if ([v2 isEqualToString:v1])
  {
    uint64_t v5 = [(id)PELocalizedString_frameworkBundle localizedStringForKey:v1 value:&stru_26C820838 table:@"PhotosUIEdit-4K120"];

    double v2 = (void *)v5;
  }
  if ([v2 isEqualToString:v1])
  {
    uint64_t v6 = [(id)PELocalizedString_frameworkBundle localizedStringForKey:v1 value:&stru_26C820838 table:@"PhotosUIEdit-SpatialAudio"];

    double v2 = (void *)v6;
  }

  return v2;
}

uint64_t __PELocalizedString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = PELocalizedString_frameworkBundle;
  PELocalizedString_frameworkBundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id PEStringWithValidatedFormat()
{
  uint64_t v0 = PFStringWithValidatedFormatAndLocale();
  return v0;
}

id PELocalizedStringWithValidatedFormat(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 currentLocale];
  double v7 = PFStringWithValidatedFormatAndLocale();

  return v7;
}

__CFString *PEEditActionTypeString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"Unknown";
  }
  else {
    return off_2642BEB88[a1 - 1];
  }
}

__CFString *PESCAPReviewFallbackReasonString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Unknown";
  }
  else {
    return off_2642BEC30[a1 - 1];
  }
}

__CFString *PESCAPActionTypeString(uint64_t a1)
{
  if (a1) {
    return @"Smart C&P";
  }
  else {
    return @"Legacy C&P";
  }
}

void sub_217BC5AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_217BC8DB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2117(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2118(uint64_t a1)
{
}

void sub_217BC9CBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_217BCAFCC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_217BCCFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2293(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2294(uint64_t a1)
{
}

void sub_217BCD9D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_217BCDDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_217BCE518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id location,char a51)
{
}

void sub_217BCE8D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217BCF114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217BD00F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2394(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2395(uint64_t a1)
{
}

uint64_t PECanRenderPortrait()
{
  if (PECanRenderPortrait_onceToken != -1) {
    dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_213);
  }
  return PECanRenderPortrait_canRenderPortrait;
}

void __PECanRenderPortrait_block_invoke()
{
  id v0 = MTLCreateSystemDefaultDevice();
  PECanRenderPortrait_canRenderPortrait = [v0 supportsFeatureSet:1];
}

void sub_217BD2A44(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

__CFString *PEPhotoEditSessionEndString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Saved";
  }
  else {
    return off_2642BF678[a1 - 1];
  }
}

__CFString *PEPhotoEditSessionEntryPointString(uint64_t a1)
{
  uint64_t v1 = @"1UPButton";
  if (a1 == 1) {
    uint64_t v1 = @"1UPQuickCrop";
  }
  if (a1 == 2) {
    return @"Arrowing";
  }
  else {
    return v1;
  }
}

__CFString *PEPhotoEditSessionSaveActionTypeString(uint64_t a1)
{
  uint64_t v1 = @"Save";
  if (a1 == 2) {
    uint64_t v1 = @"SaveAsDuplicate";
  }
  if (a1 == 1) {
    return @"SaveAsNewClip";
  }
  else {
    return v1;
  }
}

void sub_217BD6750(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2855(uint64_t a1)
{
}

uint64_t sub_217BD7820()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_217BD7830()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_217BD7840()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_217BD7850()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_217BD7860()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_217BD7870()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_217BD7880()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_217BD7890()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_217BD78A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_217BD78B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_217BD78C0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_217BD78D0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_217BD78E0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_217BD78F0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_217BD7900()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_217BD7910()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_217BD7920()
{
  return MEMORY[0x270F53D28]();
}

uint64_t sub_217BD7930()
{
  return MEMORY[0x270F4B960]();
}

uint64_t sub_217BD7940()
{
  return MEMORY[0x270F4B970]();
}

uint64_t sub_217BD7950()
{
  return MEMORY[0x270F4B978]();
}

uint64_t sub_217BD7960()
{
  return MEMORY[0x270F4B9B0]();
}

uint64_t sub_217BD7970()
{
  return MEMORY[0x270F4BBE8]();
}

uint64_t sub_217BD7980()
{
  return MEMORY[0x270F4BC00]();
}

uint64_t sub_217BD7990()
{
  return MEMORY[0x270F4BCD8]();
}

uint64_t sub_217BD79A0()
{
  return MEMORY[0x270F4BE70]();
}

uint64_t sub_217BD79B0()
{
  return MEMORY[0x270F4BF78]();
}

uint64_t sub_217BD79C0()
{
  return MEMORY[0x270F4C078]();
}

uint64_t sub_217BD79D0()
{
  return MEMORY[0x270F4C080]();
}

uint64_t sub_217BD79E0()
{
  return MEMORY[0x270F4C0A8]();
}

uint64_t sub_217BD79F0()
{
  return MEMORY[0x270F4C0B0]();
}

uint64_t sub_217BD7A00()
{
  return MEMORY[0x270F4C0B8]();
}

uint64_t sub_217BD7A10()
{
  return MEMORY[0x270F4C0C8]();
}

uint64_t sub_217BD7A30()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_217BD7A40()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_217BD7A50()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_217BD7A60()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_217BD7A70()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_217BD7A80()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_217BD7A90()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_217BD7AA0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_217BD7AB0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_217BD7AC0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_217BD7AD0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_217BD7AE0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_217BD7AF0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_217BD7B00()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_217BD7B10()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_217BD7B20()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_217BD7B30()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_217BD7B40()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_217BD7B50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_217BD7B60()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_217BD7B70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_217BD7B80()
{
  return MEMORY[0x270EF7260]();
}

uint64_t sub_217BD7B90()
{
  return MEMORY[0x270EF7578]();
}

uint64_t sub_217BD7BA0()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_217BD7BB0()
{
  return MEMORY[0x270EF7598]();
}

uint64_t sub_217BD7BC0()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_217BD7BD0()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_217BD7BE0()
{
  return MEMORY[0x270EF7760]();
}

uint64_t sub_217BD7BF0()
{
  return MEMORY[0x270EF7798]();
}

uint64_t sub_217BD7C00()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_217BD7C10()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_217BD7C20()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_217BD7C30()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_217BD7C40()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_217BD7C50()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_217BD7C60()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_217BD7C70()
{
  return MEMORY[0x270EFEEB8]();
}

uint64_t sub_217BD7C80()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_217BD7C90()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_217BD7CA0()
{
  return MEMORY[0x270EFEF68]();
}

uint64_t sub_217BD7CB0()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_217BD7CC0()
{
  return MEMORY[0x270EFEFA8]();
}

uint64_t sub_217BD7CD0()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_217BD7CE0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_217BD7CF0()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_217BD7D00()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_217BD7D10()
{
  return MEMORY[0x270EFF230]();
}

uint64_t sub_217BD7D20()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_217BD7D30()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_217BD7D40()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_217BD7D50()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_217BD7D60()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_217BD7D70()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_217BD7D80()
{
  return MEMORY[0x270EFF5F0]();
}

uint64_t sub_217BD7D90()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_217BD7DA0()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_217BD7DB0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_217BD7DC0()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_217BD7DD0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_217BD7DE0()
{
  return MEMORY[0x270EFF708]();
}

uint64_t sub_217BD7DF0()
{
  return MEMORY[0x270EFF718]();
}

uint64_t sub_217BD7E00()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_217BD7E10()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_217BD7E20()
{
  return MEMORY[0x270EFF8F8]();
}

uint64_t sub_217BD7E30()
{
  return MEMORY[0x270EFF900]();
}

uint64_t sub_217BD7E40()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_217BD7E50()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_217BD7E70()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_217BD7E80()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_217BD7E90()
{
  return MEMORY[0x270EFFDA8]();
}

uint64_t sub_217BD7EA0()
{
  return MEMORY[0x270F00048]();
}

uint64_t sub_217BD7EB0()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_217BD7EC0()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_217BD7ED0()
{
  return MEMORY[0x270F00078]();
}

uint64_t sub_217BD7EE0()
{
  return MEMORY[0x270F000E8]();
}

uint64_t sub_217BD7EF0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_217BD7F00()
{
  return MEMORY[0x270F00280]();
}

uint64_t sub_217BD7F10()
{
  return MEMORY[0x270F00288]();
}

uint64_t sub_217BD7F20()
{
  return MEMORY[0x270F00290]();
}

uint64_t sub_217BD7F30()
{
  return MEMORY[0x270F002A0]();
}

uint64_t sub_217BD7F40()
{
  return MEMORY[0x270F002A8]();
}

uint64_t sub_217BD7F50()
{
  return MEMORY[0x270F002B0]();
}

uint64_t sub_217BD7F60()
{
  return MEMORY[0x270F002B8]();
}

uint64_t sub_217BD7F70()
{
  return MEMORY[0x270F002C8]();
}

uint64_t sub_217BD7F80()
{
  return MEMORY[0x270F002F8]();
}

uint64_t sub_217BD7F90()
{
  return MEMORY[0x270F00478]();
}

uint64_t sub_217BD7FA0()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_217BD7FB0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_217BD7FC0()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_217BD7FD0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_217BD7FE0()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_217BD7FF0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_217BD8000()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_217BD8010()
{
  return MEMORY[0x270F00778]();
}

uint64_t sub_217BD8020()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_217BD8030()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_217BD8040()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_217BD8050()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_217BD8060()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_217BD8070()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_217BD8080()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_217BD8090()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_217BD80A0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_217BD80B0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_217BD80C0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_217BD80D0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_217BD80E0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_217BD80F0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_217BD8100()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_217BD8120()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_217BD8130()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_217BD8140()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_217BD8150()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_217BD8160()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_217BD8170()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_217BD8180()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_217BD8190()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_217BD81A0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_217BD81B0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_217BD81C0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_217BD81D0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_217BD81E0()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_217BD81F0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_217BD8200()
{
  return MEMORY[0x270F01668]();
}

uint64_t sub_217BD8210()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_217BD8220()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_217BD8230()
{
  return MEMORY[0x270F017E0]();
}

uint64_t sub_217BD8240()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_217BD8250()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_217BD8260()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_217BD8270()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_217BD8280()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_217BD8290()
{
  return MEMORY[0x270F01BF8]();
}

uint64_t sub_217BD82A0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_217BD82B0()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_217BD82C0()
{
  return MEMORY[0x270F02020]();
}

uint64_t sub_217BD82D0()
{
  return MEMORY[0x270F02028]();
}

uint64_t sub_217BD82E0()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_217BD82F0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_217BD8300()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_217BD8310()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_217BD8320()
{
  return MEMORY[0x270F028A8]();
}

uint64_t sub_217BD8330()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_217BD8340()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_217BD8350()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_217BD8360()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_217BD8370()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_217BD8380()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_217BD8390()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_217BD83A0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_217BD83B0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_217BD83C0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_217BD83D0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_217BD83E0()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_217BD83F0()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_217BD8400()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_217BD8410()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_217BD8420()
{
  return MEMORY[0x270F03020]();
}

uint64_t sub_217BD8430()
{
  return MEMORY[0x270F03040]();
}

uint64_t sub_217BD8440()
{
  return MEMORY[0x270F03150]();
}

uint64_t sub_217BD8450()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_217BD8460()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_217BD8470()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_217BD8480()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_217BD8490()
{
  return MEMORY[0x270F03310]();
}

uint64_t sub_217BD84A0()
{
  return MEMORY[0x270F03348]();
}

uint64_t sub_217BD84B0()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_217BD84C0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_217BD84D0()
{
  return MEMORY[0x270F035A0]();
}

uint64_t sub_217BD84E0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_217BD84F0()
{
  return MEMORY[0x270F037E0]();
}

uint64_t sub_217BD8500()
{
  return MEMORY[0x270F03820]();
}

uint64_t sub_217BD8510()
{
  return MEMORY[0x270F03828]();
}

uint64_t sub_217BD8520()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_217BD8530()
{
  return MEMORY[0x270F03B10]();
}

uint64_t sub_217BD8540()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_217BD8550()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_217BD8560()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_217BD8570()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_217BD8580()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_217BD8590()
{
  return MEMORY[0x270F041E0]();
}

uint64_t sub_217BD85A0()
{
  return MEMORY[0x270F041F0]();
}

uint64_t sub_217BD85B0()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_217BD85C0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_217BD85D0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_217BD85E0()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_217BD85F0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_217BD8600()
{
  return MEMORY[0x270F04428]();
}

uint64_t sub_217BD8610()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_217BD8620()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_217BD8630()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_217BD8640()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_217BD8650()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_217BD8660()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_217BD8670()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_217BD8680()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_217BD8690()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_217BD86A0()
{
  return MEMORY[0x270F04640]();
}

uint64_t sub_217BD86B0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_217BD86C0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_217BD86D0()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_217BD86E0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_217BD8710()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_217BD8730()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_217BD8750()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_217BD8760()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_217BD8770()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_217BD8780()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_217BD8790()
{
  return MEMORY[0x270F04978]();
}

uint64_t sub_217BD87A0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_217BD87B0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_217BD87C0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_217BD87D0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_217BD87E0()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_217BD87F0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_217BD8800()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_217BD8810()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_217BD8820()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_217BD8830()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_217BD8840()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_217BD8850()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_217BD8860()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_217BD8870()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_217BD8880()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_217BD8890()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_217BD88A0()
{
  return MEMORY[0x270F04F60]();
}

uint64_t sub_217BD88B0()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_217BD88C0()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_217BD88D0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_217BD88E0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_217BD88F0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_217BD8900()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_217BD8910()
{
  return MEMORY[0x270F050C8]();
}

uint64_t sub_217BD8920()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_217BD8930()
{
  return MEMORY[0x270F05108]();
}

uint64_t sub_217BD8940()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_217BD8950()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_217BD8960()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_217BD8970()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_217BD8980()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_217BD8990()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_217BD89A0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_217BD89B0()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_217BD89C0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_217BD89D0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_217BD89E0()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_217BD89F0()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_217BD8A00()
{
  return MEMORY[0x270F05468]();
}

uint64_t sub_217BD8A10()
{
  return MEMORY[0x270F05480]();
}

uint64_t sub_217BD8A20()
{
  return MEMORY[0x270F05488]();
}

uint64_t sub_217BD8A30()
{
  return MEMORY[0x270F054B0]();
}

uint64_t sub_217BD8A40()
{
  return MEMORY[0x270F054B8]();
}

uint64_t sub_217BD8A50()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_217BD8A60()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_217BD8A70()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_217BD8A80()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_217BD8A90()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_217BD8AA0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_217BD8AB0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_217BD8AC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_217BD8AD0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_217BD8AE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_217BD8AF0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_217BD8B00()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_217BD8B10()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_217BD8B20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_217BD8B30()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_217BD8B40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_217BD8B50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_217BD8B60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_217BD8B70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_217BD8B80()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_217BD8B90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_217BD8BA0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_217BD8BB0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_217BD8BC0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_217BD8BD0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_217BD8C00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_217BD8C10()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_217BD8C20()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_217BD8C30()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_217BD8C40()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_217BD8C50()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_217BD8C60()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_217BD8C70()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_217BD8C80()
{
  return MEMORY[0x270F53F98]();
}

uint64_t sub_217BD8C90()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_217BD8CA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_217BD8CB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_217BD8CC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_217BD8CD0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_217BD8CE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_217BD8CF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_217BD8D00()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_217BD8D10()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_217BD8D20()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_217BD8D30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_217BD8D40()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_217BD8D50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_217BD8D80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_217BD8D90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_217BD8DA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_217BD8DB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_217BD8DC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_217BD8DD0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_217BD8DE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_217BD8DF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_217BD8E00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_217BD8E10()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x270EE6FD0](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7DA8](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x270EE7EB8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7ED0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t NUOrientationConcat()
{
  return MEMORY[0x270F4E440]();
}

uint64_t NUOrientationInverse()
{
  return MEMORY[0x270F4E448]();
}

uint64_t NUOrientationIsValid()
{
  return MEMORY[0x270F4E450]();
}

uint64_t NUOrientationName()
{
  return MEMORY[0x270F4E458]();
}

uint64_t NUOrientationTransformImageSize()
{
  return MEMORY[0x270F4E460]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x270F4E468]();
}

uint64_t NUOrientationTransformSize()
{
  return MEMORY[0x270F4E470]();
}

uint64_t NUPixelRectFromCGRect()
{
  return MEMORY[0x270F4E488]();
}

uint64_t NUPixelRectIntersection()
{
  return MEMORY[0x270F4E490]();
}

uint64_t NUPixelRectIsEmpty()
{
  return MEMORY[0x270F4E498]();
}

uint64_t NUPixelRectScale()
{
  return MEMORY[0x270F4E4A8]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x270F4E4B0]();
}

uint64_t NUPixelSizeArea()
{
  return MEMORY[0x270F4E4B8]();
}

uint64_t NUPixelSizeFromCGSize()
{
  return MEMORY[0x270F4E4C8]();
}

uint64_t NUPixelSizeToCGSize()
{
  return MEMORY[0x270F4E4E0]();
}

uint64_t NUScaleMake()
{
  return MEMORY[0x270F4E518]();
}

uint64_t NUScaleToDouble()
{
  return MEMORY[0x270F4E528]();
}

uint64_t PFExists()
{
  return MEMORY[0x270F53658]();
}

uint64_t PFFilter()
{
  return MEMORY[0x270F53660]();
}

uint64_t PFFind()
{
  return MEMORY[0x270F53668]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x270F536B0]();
}

uint64_t PFStringWithValidatedFormatAndLocale()
{
  return MEMORY[0x270F536C8]();
}

uint64_t PFVideoComplementMetadataForVideoAtPath()
{
  return MEMORY[0x270F53B98]();
}

uint64_t PHVideoComplementVisibilityStateIsPlayable()
{
  return MEMORY[0x270EFA318]();
}

uint64_t PIAutoLoopFlavorFromString()
{
  return MEMORY[0x270F536E8]();
}

uint64_t PIAutoLoopFlavorProducesOnlyVideo()
{
  return MEMORY[0x270F536F0]();
}

uint64_t PICinematicAudioIsRenderSupported()
{
  return MEMORY[0x270F536F8]();
}

uint64_t PISemanticStyleIsRenderSupported()
{
  return MEMORY[0x270F53700]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x270F53868]();
}

uint64_t PXMonospacedNumberFontWithSizeAndWeight()
{
  return MEMORY[0x270F54048]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x270F536D8]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x270F536E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x270F9B990]();
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x270F9B9B0]();
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x270EDB988](a1);
}