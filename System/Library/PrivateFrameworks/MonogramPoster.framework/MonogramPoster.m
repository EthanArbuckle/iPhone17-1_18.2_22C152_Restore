unint64_t UIColor.monogramColorDescription.getter()
{
  void *v0;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void v6[18];

  v6[17] = *MEMORY[0x263EF8340];
  v5 = 0;
  v6[0] = 0;
  v3 = 0;
  v4 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v6, &v5, &v4, &v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6948);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_256D640C0;
  *(void *)(inited + 32) = 6579570;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = v6[0];
  *(void *)(inited + 56) = 0x6E65657267;
  *(void *)(inited + 64) = 0xE500000000000000;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 1702194274;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = 0x6168706C61;
  *(void *)(inited + 112) = 0xE500000000000000;
  *(void *)(inited + 120) = v3;
  return sub_256D5F098(inited);
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

unint64_t sub_256D5F098(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6938);
  v2 = (void *)sub_256D63CF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_256D5F3D0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

UIColor __swiftcall UIColor.init(monogramColorDescription:)(Swift::OpaquePointer monogramColorDescription)
{
  if (!*((void *)monogramColorDescription._rawValue + 2))
  {
    double v3 = 1.0;
    double v4 = 1.0;
LABEL_14:
    double v7 = 1.0;
LABEL_15:
    double v10 = 1.0;
    goto LABEL_16;
  }
  unint64_t v2 = sub_256D5F3D0(6579570, 0xE300000000000000);
  double v3 = 1.0;
  double v4 = 1.0;
  if (v5) {
    double v4 = *(double *)(*((void *)monogramColorDescription._rawValue + 7) + 8 * v2);
  }
  if (!*((void *)monogramColorDescription._rawValue + 2)) {
    goto LABEL_14;
  }
  unint64_t v6 = sub_256D5F3D0(0x6E65657267, 0xE500000000000000);
  double v7 = 1.0;
  if (v8) {
    double v7 = *(double *)(*((void *)monogramColorDescription._rawValue + 7) + 8 * v6);
  }
  if (!*((void *)monogramColorDescription._rawValue + 2)) {
    goto LABEL_15;
  }
  unint64_t v9 = sub_256D5F3D0(1702194274, 0xE400000000000000);
  double v10 = 1.0;
  if (v11) {
    double v3 = *(double *)(*((void *)monogramColorDescription._rawValue + 7) + 8 * v9);
  }
  if (*((void *)monogramColorDescription._rawValue + 2))
  {
    unint64_t v12 = sub_256D5F3D0(0x6168706C61, 0xE500000000000000);
    if (v13) {
      double v10 = *(double *)(*((void *)monogramColorDescription._rawValue + 7) + 8 * v12);
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (UIColor)objc_msgSend(v14, sel_initWithRed_green_blue_alpha_, v4, v7, v3, v10);
}

uint64_t UIColor.truncatedKey.getter()
{
  v9[1] = *(double *)MEMORY[0x263EF8340];
  double v8 = 0.0;
  v9[0] = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  double v1 = floor(v9[0] * 1000000.0) / 1000000.0;
  double v2 = floor(v8 * 1000000.0) / 1000000.0;
  double v3 = floor(v7 * 1000000.0) / 1000000.0;
  double v4 = floor(v6 * 1000000.0) / 1000000.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0C8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_256D640C0;
  *(double *)(result + 32) = v1;
  *(double *)(result + 40) = v2;
  *(double *)(result + 48) = v3;
  *(double *)(result + 56) = v4;
  return result;
}

unint64_t sub_256D5F3D0(uint64_t a1, uint64_t a2)
{
  sub_256D63D90();
  sub_256D63C90();
  uint64_t v4 = sub_256D63DC0();
  return sub_256D5F4B4(a1, a2, v4);
}

double sub_256D5F448(uint64_t a1)
{
  sub_256D63D90();
  sub_256D61904((uint64_t)v4, a1);
  uint64_t v2 = sub_256D63DC0();
  return sub_256D5F598(a1, v2);
}

unint64_t sub_256D5F4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    double v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_256D63D70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_256D63D70() & 1) == 0);
    }
  }
  return v6;
}

double sub_256D5F598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    uint64_t v7 = *(void *)(a1 + 16);
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(v2 + 48) + 8 * v5);
      if (*(void *)(v8 + 16) == v7)
      {
        if (!v7 || v8 == a1) {
          return result;
        }
        double result = *(double *)(v8 + 32);
        if (result == *(double *)(a1 + 32))
        {
          if (v7 == 1) {
            return result;
          }
          double result = *(double *)(v8 + 40);
          if (result == *(double *)(a1 + 40)) {
            break;
          }
        }
      }
LABEL_3:
      unint64_t v5 = (v5 + 1) & v6;
      if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
        return result;
      }
    }
    double v10 = (double *)(v8 + 48);
    uint64_t v11 = v7 - 2;
    uint64_t v12 = (double *)(a1 + 48);
    while (v11)
    {
      double v13 = *v10++;
      double result = v13;
      double v14 = *v12++;
      --v11;
      if (result != v14) {
        goto LABEL_3;
      }
    }
  }
  return result;
}

uint64_t static MonogramPosterUtilities.isMonogramSupported(for:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6830);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_256D640E0;
  id v3 = objc_msgSend(a1, sel_givenName);
  uint64_t v4 = sub_256D63C80();
  uint64_t v6 = v5;

  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  id v7 = objc_msgSend(a1, sel_middleName);
  uint64_t v8 = sub_256D63C80();
  uint64_t v10 = v9;

  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  id v11 = objc_msgSend(a1, sel_familyName);
  uint64_t v12 = sub_256D63C80();
  uint64_t v14 = v13;

  *(void *)(v2 + 64) = v12;
  *(void *)(v2 + 72) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6848);
  sub_256D5F7C0();
  uint64_t v15 = sub_256D63C60();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  LOBYTE(v2) = _s14MonogramPoster0aB9UtilitiesV02isA9Supported3forSbSS_tFZ_0(v15, v17);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

unint64_t sub_256D5F7C0()
{
  unint64_t result = qword_26B2D6850;
  if (!qword_26B2D6850)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2D6848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6850);
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

uint64_t sub_256D5F868()
{
  uint64_t v0 = sub_256D63C40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0D0);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_256D63BF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(self, sel_mainBundle);
  id v11 = objc_msgSend(v10, sel_preferredLocalizations);

  uint64_t v12 = sub_256D63CB0();
  if (!*(void *)(v12 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_256D63C20();
  swift_bridgeObjectRelease();
  sub_256D63BE0();
  sub_256D63BD0();
  sub_256D63C30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v13 = sub_256D63C10();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v5, 1, v13) == 1)
  {
    sub_256D5FD2C((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_5:
    char v15 = 0;
    return v15 & 1;
  }
  uint64_t v16 = sub_256D63C00();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v13);
  if (v16 == 24938 && v18 == 0xE200000000000000
    || ((char v19 = sub_256D63D70(), v16 == 28523) ? (v20 = v18 == 0xE200000000000000) : (v20 = 0),
        !v20 ? (char v21 = 0) : (char v21 = 1),
        (v19 & 1) != 0
     || (v21 & 1) != 0
     || ((char v22 = sub_256D63D70(), v16 == 26746) ? (v23 = v18 == 0xE200000000000000) : (v23 = 0),
         !v23 ? (char v24 = 0) : (char v24 = 1),
         (v22 & 1) != 0 || (v24 & 1) != 0 || (sub_256D63D70() & 1) != 0)))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    char v15 = 1;
  }
  else
  {
    if (v16 == 29281 && v18 == 0xE200000000000000) {
      char v15 = 1;
    }
    else {
      char v15 = sub_256D63D70();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
  }
  return v15 & 1;
}

uint64_t _s14MonogramPoster0aB9UtilitiesV02isA9Supported3forSbSS_tFZ_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    id v3 = (void *)sub_256D63C70();
    char v4 = CNIsChineseJapaneseKoreanString();

    if (v4)
    {
      char v5 = 0;
    }
    else
    {
      uint64_t v6 = (void *)sub_256D63C70();
      char v7 = CNIsArabicString();

      char v5 = v7 ^ 1;
    }
  }
  else
  {
    char v5 = sub_256D5F868() ^ 1;
  }
  return v5 & 1;
}

ValueMetadata *type metadata accessor for MonogramPosterUtilities()
{
  return &type metadata for MonogramPosterUtilities;
}

uint64_t sub_256D5FD2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id MonogramPosterBackgroundColor.topColor.getter()
{
  return *v0;
}

id MonogramPosterBackgroundColor.bottomColor.getter()
{
  return *(id *)(v0 + 8);
}

MonogramPoster::MonogramPosterBackgroundColor __swiftcall MonogramPosterBackgroundColor.init(topColor:bottomColor:)(UIColor topColor, UIColor bottomColor)
{
  v2->super.isa = topColor.super.isa;
  v2[1].super.isa = bottomColor.super.isa;
  result.bottomColor = bottomColor;
  result.topColor = topColor;
  return result;
}

id sub_256D5FDA4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.658823529, 0.678431373, 0.729411765, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.529411765, 0.549019608, 0.588235294, 1.0);
  qword_26B2D6970 = (uint64_t)v0;
  *(void *)algn_26B2D6978 = result;
  return result;
}

id sub_256D5FE38()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.803921569, 0.97254902, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.709803922, 0.643137255, 0.949019608, 1.0);
  qword_26B2D6A40 = (uint64_t)v0;
  *(void *)algn_26B2D6A48 = result;
  return result;
}

id sub_256D5FED0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.701960784, 0.835294118, 0.937254902, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.454901961, 0.698039216, 0.88627451, 1.0);
  qword_26B2D6960 = (uint64_t)v0;
  *(void *)algn_26B2D6968 = result;
  return result;
}

id sub_256D5FF64()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.964705882, 0.721568627, 0.8, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.937254902, 0.490196078, 0.639215686, 1.0);
  qword_26B2D6980 = (uint64_t)v0;
  *(void *)algn_26B2D6988 = result;
  return result;
}

id sub_256D5FFF8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.960784314, 0.850980392, 0.68627451, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.929411765, 0.725490196, 0.431372549, 1.0);
  qword_26B2D6A50 = (uint64_t)v0;
  *(void *)algn_26B2D6A58 = result;
  return result;
}

id sub_256D6008C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.792156863, 0.949019608, 0.741176471, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.623529412, 0.905882353, 0.529411765, 1.0);
  qword_26B2D6990 = (uint64_t)v0;
  *(void *)algn_26B2D6998 = result;
  return result;
}

id sub_256D60120()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.882352941, 0.776470588, 0.764705882, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.788235294, 0.592156863, 0.57254902, 1.0);
  qword_26B2D6950 = (uint64_t)v0;
  *(void *)algn_26B2D6958 = result;
  return result;
}

id sub_256D601BC()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.764705882, 0.662745098, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.894117647, 0.568627451, 0.388235294, 1.0);
  qword_26B2D6A30 = (uint64_t)v0;
  *(void *)algn_26B2D6A38 = result;
  return result;
}

id sub_256D60258()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.807843137, 0.870588235, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.705882353, 0.647058824, 0.764705882, 1.0);
  qword_26B2D69F0 = (uint64_t)v0;
  *(void *)algn_26B2D69F8 = result;
  return result;
}

id sub_256D602F0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.780392157, 0.843137255, 0.905882353, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.603921569, 0.717647059, 0.82745098, 1.0);
  qword_26B2D69C0 = (uint64_t)v0;
  *(void *)algn_26B2D69C8 = result;
  return result;
}

id sub_256D60384()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.815686275, 0.909803922, 0.917647059, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.835294118, 0.847058824, 1.0);
  qword_26B2D69D0 = (uint64_t)v0;
  *(void *)algn_26B2D69D8 = result;
  return result;
}

id sub_256D6041C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.717647059, 0.925490196, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.890196078, 0.48627451, 0.866666667, 1.0);
  qword_26B2D6A20 = (uint64_t)v0;
  *(void *)algn_26B2D6A28 = result;
  return result;
}

id sub_256D604BC()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.941176471, 0.949019608, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.396078431, 0.894117647, 0.905882353, 1.0);
  qword_26B2D69A0 = (uint64_t)v0;
  *(void *)algn_26B2D69A8 = result;
  return result;
}

id sub_256D60558()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.694117647, 0.956862745, 0.764705882, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.443137255, 0.921568627, 0.568627451, 1.0);
  qword_26B2D69B0 = (uint64_t)v0;
  *(void *)algn_26B2D69B8 = result;
  return result;
}

id sub_256D605F0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.850980392, 0.831372549, 0.811764706, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.725490196, 0.694117647, 0.654901961, 1.0);
  qword_26B2D6A00 = (uint64_t)v0;
  *(void *)algn_26B2D6A08 = result;
  return result;
}

id sub_256D60684()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.901960784, 0.839215686, 0.749019608, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.819607843, 0.705882353, 0.541176471, 1.0);
  qword_26B2D6A10 = (uint64_t)v0;
  *(void *)algn_26B2D6A18 = result;
  return result;
}

id sub_256D60718()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.831372549, 0.866666667, 0.815686275, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.690196078, 0.760784314, 0.666666667, 1.0);
  qword_26B2D69E0 = (uint64_t)v0;
  *(void *)algn_26B2D69E8 = result;
  return result;
}

id sub_256D607B0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.560784314, 0.560784314, 0.560784314, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.2, 0.2, 0.2, 1.0);
  qword_26B2D6A60 = (uint64_t)v0;
  *(void *)algn_26B2D6A68 = result;
  return result;
}

id sub_256D60834()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6940);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_256D64350;
  if (qword_26B2D68B0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_26B2D6970;
  uint64_t v2 = *(void **)algn_26B2D6978;
  *(void *)(v0 + 32) = qword_26B2D6970;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = qword_26B2D68B8;
  id v4 = v1;
  id v5 = v2;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_26B2D6980;
  char v7 = *(void **)algn_26B2D6988;
  *(void *)(v0 + 48) = qword_26B2D6980;
  *(void *)(v0 + 56) = v7;
  uint64_t v8 = qword_26B2D68A0;
  id v9 = v6;
  id v10 = v7;
  if (v8 != -1) {
    swift_once();
  }
  id v11 = (void *)qword_26B2D6950;
  uint64_t v12 = *(void **)algn_26B2D6958;
  *(void *)(v0 + 64) = qword_26B2D6950;
  *(void *)(v0 + 72) = v12;
  uint64_t v13 = qword_26B2D6910;
  id v14 = v11;
  id v15 = v12;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)qword_26B2D6A30;
  uint64_t v17 = *(void **)algn_26B2D6A38;
  *(void *)(v0 + 80) = qword_26B2D6A30;
  *(void *)(v0 + 88) = v17;
  uint64_t v18 = qword_26B2D6920;
  id v19 = v16;
  id v20 = v17;
  if (v18 != -1) {
    swift_once();
  }
  char v21 = (void *)qword_26B2D6A50;
  char v22 = *(void **)algn_26B2D6A58;
  *(void *)(v0 + 96) = qword_26B2D6A50;
  *(void *)(v0 + 104) = v22;
  uint64_t v23 = qword_26B2D68C0;
  id v24 = v21;
  id v25 = v22;
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)qword_26B2D6990;
  v27 = *(void **)algn_26B2D6998;
  *(void *)(v0 + 112) = qword_26B2D6990;
  *(void *)(v0 + 120) = v27;
  uint64_t v28 = qword_26B2D68A8;
  id v29 = v26;
  id v30 = v27;
  if (v28 != -1) {
    swift_once();
  }
  v31 = (void *)qword_26B2D6960;
  v32 = *(void **)algn_26B2D6968;
  *(void *)(v0 + 128) = qword_26B2D6960;
  *(void *)(v0 + 136) = v32;
  uint64_t v33 = qword_26B2D6918;
  id v34 = v31;
  id v35 = v32;
  if (v33 != -1) {
    swift_once();
  }
  v36 = (void *)qword_26B2D6A40;
  v37 = *(void **)algn_26B2D6A48;
  *(void *)(v0 + 144) = qword_26B2D6A40;
  *(void *)(v0 + 152) = v37;
  uint64_t v38 = qword_26B2D68F0;
  id v39 = v36;
  id v40 = v37;
  if (v38 != -1) {
    swift_once();
  }
  v41 = (void *)qword_26B2D69F0;
  v42 = *(void **)algn_26B2D69F8;
  *(void *)(v0 + 160) = qword_26B2D69F0;
  *(void *)(v0 + 168) = v42;
  uint64_t v43 = qword_26B2D68D8;
  id v44 = v41;
  id v45 = v42;
  if (v43 != -1) {
    swift_once();
  }
  v46 = (void *)qword_26B2D69C0;
  v47 = *(void **)algn_26B2D69C8;
  *(void *)(v0 + 176) = qword_26B2D69C0;
  *(void *)(v0 + 184) = v47;
  uint64_t v48 = qword_26B2D68E0;
  id v49 = v46;
  id v50 = v47;
  if (v48 != -1) {
    swift_once();
  }
  v51 = (void *)qword_26B2D69D0;
  v52 = *(void **)algn_26B2D69D8;
  *(void *)(v0 + 192) = qword_26B2D69D0;
  *(void *)(v0 + 200) = v52;
  uint64_t v53 = qword_26B2D6908;
  id v54 = v51;
  id v55 = v52;
  if (v53 != -1) {
    swift_once();
  }
  v56 = (void *)qword_26B2D6A20;
  v57 = *(void **)algn_26B2D6A28;
  *(void *)(v0 + 208) = qword_26B2D6A20;
  *(void *)(v0 + 216) = v57;
  uint64_t v58 = qword_26B2D68C8;
  id v59 = v56;
  id v60 = v57;
  if (v58 != -1) {
    swift_once();
  }
  v61 = (void *)qword_26B2D69A0;
  v62 = *(void **)algn_26B2D69A8;
  *(void *)(v0 + 224) = qword_26B2D69A0;
  *(void *)(v0 + 232) = v62;
  uint64_t v63 = qword_26B2D68D0;
  id v64 = v61;
  id v65 = v62;
  if (v63 != -1) {
    swift_once();
  }
  v66 = (void *)qword_26B2D69B0;
  v67 = *(void **)algn_26B2D69B8;
  *(void *)(v0 + 240) = qword_26B2D69B0;
  *(void *)(v0 + 248) = v67;
  uint64_t v68 = qword_26B2D68F8;
  id v69 = v66;
  id v70 = v67;
  if (v68 != -1) {
    swift_once();
  }
  v71 = (void *)qword_26B2D6A00;
  v72 = *(void **)algn_26B2D6A08;
  *(void *)(v0 + 256) = qword_26B2D6A00;
  *(void *)(v0 + 264) = v72;
  uint64_t v73 = qword_26B2D6900;
  id v74 = v71;
  id v75 = v72;
  if (v73 != -1) {
    swift_once();
  }
  v76 = (void *)qword_26B2D6A10;
  v77 = *(void **)algn_26B2D6A18;
  *(void *)(v0 + 272) = qword_26B2D6A10;
  *(void *)(v0 + 280) = v77;
  uint64_t v78 = qword_26B2D68E8;
  id v79 = v76;
  id v80 = v77;
  if (v78 != -1) {
    swift_once();
  }
  v81 = (void *)qword_26B2D69E0;
  v82 = *(void **)algn_26B2D69E8;
  *(void *)(v0 + 288) = qword_26B2D69E0;
  *(void *)(v0 + 296) = v82;
  uint64_t v83 = qword_26B2D6928;
  id v84 = v81;
  id v85 = v82;
  if (v83 != -1) {
    swift_once();
  }
  v87 = (void *)qword_26B2D6A60;
  uint64_t v86 = *(void *)algn_26B2D6A68;
  id v90 = *(id *)algn_26B2D6A68;
  *(void *)(v0 + 304) = qword_26B2D6A60;
  *(void *)(v0 + 312) = v86;
  off_26B2D6898 = (_UNKNOWN *)v0;
  id v88 = v87;
  return v90;
}

uint64_t MonogramPosterBackgroundColors.getter()
{
  if (qword_26B2D6878 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_256D60E10()
{
  uint64_t result = sub_256D60E30();
  qword_269FDC0D8 = result;
  return result;
}

uint64_t sub_256D60E30()
{
  v33[1] = *(double *)MEMORY[0x263EF8340];
  if (qword_26B2D6878 != -1) {
LABEL_22:
  }
    swift_once();
  uint64_t v0 = *((void *)off_26B2D6898 + 2);
  if (v0)
  {
    uint64_t v1 = (void **)(swift_bridgeObjectRetain() + 40);
    double v2 = MEMORY[0x263F8EE80];
    while (1)
    {
      id v5 = *(v1 - 1);
      uint64_t v6 = *v1;
      double v32 = 0.0;
      v33[0] = 0.0;
      double v30 = 0.0;
      double v31 = 0.0;
      id v7 = v5;
      id v8 = v6;
      objc_msgSend(v8, sel_getRed_green_blue_alpha_, v33, &v32, &v31, &v30);
      double v9 = floor(v33[0] * 1000000.0) / 1000000.0;
      double v10 = floor(v32 * 1000000.0) / 1000000.0;
      double v11 = floor(v31 * 1000000.0) / 1000000.0;
      double v12 = floor(v30 * 1000000.0) / 1000000.0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0C8);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_256D640C0;
      *(double *)(v13 + 32) = v9;
      *(double *)(v13 + 40) = v10;
      *(double *)(v13 + 48) = v11;
      *(double *)(v13 + 56) = v12;
      id v14 = v7;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33[0] = v2;
      sub_256D5F448(v13);
      unint64_t v18 = v17;
      uint64_t v19 = *(void *)(*(void *)&v2 + 16);
      BOOL v20 = (v16 & 1) == 0;
      uint64_t v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      char v22 = v16;
      if (*(void *)(*(void *)&v2 + 24) >= v21)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          double v2 = v33[0];
          if (v16) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_256D6175C();
          double v2 = v33[0];
          if (v22) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        sub_256D6144C(v21, isUniquelyReferenced_nonNull_native);
        sub_256D5F448(v13);
        if ((v22 & 1) != (v24 & 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0E0);
          uint64_t result = sub_256D63D80();
          __break(1u);
          return result;
        }
        unint64_t v18 = v23;
        double v2 = v33[0];
        if (v22)
        {
LABEL_4:
          uint64_t v3 = *(void *)(*(void *)&v2 + 56);
          uint64_t v4 = 8 * v18;

          *(void *)(v3 + v4) = v14;
          goto LABEL_5;
        }
      }
      *(void *)(*(void *)&v2 + 8 * (v18 >> 6) + 64) |= 1 << v18;
      uint64_t v25 = 8 * v18;
      *(void *)(*(void *)(*(void *)&v2 + 48) + v25) = v13;
      *(void *)(*(void *)(*(void *)&v2 + 56) + v25) = v14;
      uint64_t v26 = *(void *)(*(void *)&v2 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_21;
      }
      *(void *)(*(void *)&v2 + 16) = v28;
      swift_bridgeObjectRetain();
LABEL_5:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v1 += 2;
      if (!--v0)
      {
        swift_bridgeObjectRelease();
        return *(void *)&v2;
      }
    }
  }
  double v2 = MEMORY[0x263F8EE80];
  return *(void *)&v2;
}

uint64_t MonogramPosterBackgroundColorBottomToTop.getter()
{
  if (qword_269FDC0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterBackgroundColorBottomToTop.setter(uint64_t a1)
{
  if (qword_269FDC0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_269FDC0D8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MonogramPosterBackgroundColorBottomToTop.modify())()
{
  if (qword_269FDC0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void *initializeBufferWithCopyOfBuffer for MonogramPosterBackgroundColor(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for MonogramPosterBackgroundColor(uint64_t a1)
{
  double v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for MonogramPosterBackgroundColor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MonogramPosterBackgroundColor(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MonogramPosterBackgroundColor(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MonogramPosterBackgroundColor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterBackgroundColor()
{
  return &type metadata for MonogramPosterBackgroundColor;
}

uint64_t sub_256D6144C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0E8);
  char v36 = a2;
  uint64_t result = sub_256D63CE0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v35 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v34) {
          goto LABEL_36;
        }
        unint64_t v18 = v35[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v34) {
            goto LABEL_36;
          }
          unint64_t v18 = v35[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v34)
            {
LABEL_36:
              if ((v36 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_43;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
              if (v33 >= 64) {
                bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v35 = -1 << v33;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_45;
                }
                if (v8 >= v34) {
                  goto LABEL_36;
                }
                unint64_t v18 = v35[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = 8 * v16;
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + v20);
      char v22 = *(void **)(*(void *)(v5 + 56) + v20);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v23 = v22;
      }
      sub_256D63D90();
      sub_256D63DA0();
      uint64_t v24 = *(void *)(v21 + 16);
      if (v24)
      {
        uint64_t v25 = v21 + 32;
        do
        {
          v25 += 8;
          sub_256D63DB0();
          --v24;
        }
        while (v24);
      }
      uint64_t result = sub_256D63DC0();
      uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v13 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = 8 * v13;
      *(void *)(*(void *)(v7 + 48) + v14) = v21;
      *(void *)(*(void *)(v7 + 56) + v14) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_43:
  *uint64_t v3 = v7;
  return result;
}

id sub_256D6175C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FDC0E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_256D63CD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain();
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_256D61904(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_256D63DA0();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 8;
      uint64_t result = sub_256D63DB0();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t MonogramPosterConfiguration.topBackgroundColorDescription.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterConfiguration.topBackgroundColorDescription.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*MonogramPosterConfiguration.topBackgroundColorDescription.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.backgroundColorDescription.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MonogramPosterConfiguration.backgroundColorDescription.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*MonogramPosterConfiguration.backgroundColorDescription.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.initials.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MonogramPosterConfiguration.initials.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MonogramPosterConfiguration.initials.modify())()
{
  return nullsub_1;
}

uint64_t MonogramPosterConfiguration.monogramSupportedForName.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t MonogramPosterConfiguration.monogramSupportedForName.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*MonogramPosterConfiguration.monogramSupportedForName.modify())()
{
  return nullsub_1;
}

void MonogramPosterConfiguration.init(backgroundColor:initials:supportedForName:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  int64_t v9 = *(void **)a1;
  uint64_t v10 = *(void **)(a1 + 8);
  unint64_t v11 = UIColor.monogramColorDescription.getter();
  unint64_t v12 = UIColor.monogramColorDescription.getter();

  *(void *)a5 = v12;
  *(void *)(a5 + 8) = v11;
  *(void *)(a5 + 16) = a2;
  *(void *)(a5 + 24) = a3;
  *(unsigned char *)(a5 + 32) = a4;
}

uint64_t MonogramPosterConfiguration.debugDescription.getter()
{
  return 0;
}

uint64_t sub_256D61CE4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    unint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    double v18 = *(double *)(*(void *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_256D5F3D0(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(double *)(*(void *)(a2 + 56) + 8 * v19) != v18) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_256D61E98(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2:
      unint64_t result = 0x736C616974696E69;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_256D61F3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_256D61F50()
{
  return sub_256D63DC0();
}

uint64_t sub_256D61F98()
{
  return sub_256D63DA0();
}

uint64_t sub_256D61FC4()
{
  return sub_256D63DC0();
}

unint64_t sub_256D62008()
{
  return sub_256D61E98(*v0);
}

uint64_t sub_256D62010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_256D62E84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_256D62038()
{
  return 0;
}

void sub_256D62044(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_256D62050(uint64_t a1)
{
  unint64_t v2 = sub_256D627A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_256D6208C(uint64_t a1)
{
  unint64_t v2 = sub_256D627A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MonogramPosterConfiguration.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6858);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v14 = v8;
  uint64_t v12 = v1[3];
  v11[3] = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_256D627A0();
  sub_256D63DE0();
  uint64_t v16 = v9;
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6930);
  sub_256D62898(&qword_26B2D6840, (void (*)(void))sub_256D627F4);
  sub_256D63D60();
  if (!v2)
  {
    uint64_t v16 = v14;
    char v15 = 1;
    sub_256D63D60();
    LOBYTE(v16) = 2;
    sub_256D63D40();
    LOBYTE(v16) = 3;
    sub_256D63D50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t MonogramPosterConfiguration.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6870);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_256D627A0();
  sub_256D63DD0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  unint64_t v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2D6930);
  char v20 = 0;
  sub_256D62898(&qword_26B2D6868, (void (*)(void))sub_256D62914);
  sub_256D63D30();
  uint64_t v9 = v21;
  char v20 = 1;
  swift_bridgeObjectRetain();
  sub_256D63D30();
  uint64_t v10 = v21;
  LOBYTE(v21) = 2;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_256D63D10();
  uint64_t v18 = v11;
  LOBYTE(v21) = 3;
  swift_bridgeObjectRetain();
  char v13 = sub_256D63D20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v14 = v13 & 1;
  uint64_t v16 = v18;
  char v15 = v19;
  *unint64_t v19 = v9;
  v15[1] = v10;
  v15[2] = v17;
  v15[3] = v16;
  *((unsigned char *)v15 + 32) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_256D62678@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MonogramPosterConfiguration.init(from:)(a1, a2);
}

uint64_t sub_256D62690(void *a1)
{
  return MonogramPosterConfiguration.encode(to:)(a1);
}

uint64_t _s14MonogramPoster0aB13ConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  int v9 = *(unsigned __int8 *)(a2 + 32);
  if ((sub_256D61CE4(*(void *)a1, *(void *)a2) & 1) == 0 || (sub_256D61CE4(v2, v6) & 1) == 0) {
    return 0;
  }
  if (v3 == v7 && v4 == v8) {
    return v5 ^ v9 ^ 1u;
  }
  char v11 = sub_256D63D70();
  uint64_t result = 0;
  if (v11) {
    return v5 ^ v9 ^ 1u;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_256D627A0()
{
  unint64_t result = qword_26B2D6880;
  if (!qword_26B2D6880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6880);
  }
  return result;
}

unint64_t sub_256D627F4()
{
  unint64_t result = qword_26B2D6838;
  if (!qword_26B2D6838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6838);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_256D62898(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2D6930);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_256D62914()
{
  unint64_t result = qword_26B2D6860;
  if (!qword_26B2D6860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6860);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MonogramPosterConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MonogramPosterConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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

uint64_t assignWithTake for MonogramPosterConfiguration(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MonogramPosterConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MonogramPosterConfiguration(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterConfiguration()
{
  return &type metadata for MonogramPosterConfiguration;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MonogramPosterConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MonogramPosterConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x256D62D34);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_256D62D5C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_256D62D64(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterConfiguration.CodingKeys()
{
  return &type metadata for MonogramPosterConfiguration.CodingKeys;
}

unint64_t sub_256D62D80()
{
  unint64_t result = qword_269FDC0F0;
  if (!qword_269FDC0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FDC0F0);
  }
  return result;
}

unint64_t sub_256D62DD8()
{
  unint64_t result = qword_26B2D6890;
  if (!qword_26B2D6890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6890);
  }
  return result;
}

unint64_t sub_256D62E30()
{
  unint64_t result = qword_26B2D6888;
  if (!qword_26B2D6888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2D6888);
  }
  return result;
}

uint64_t sub_256D62E84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001DLL && a2 == 0x8000000256D64820 || (sub_256D63D70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000256D64730 || (sub_256D63D70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736C616974696E69 && a2 == 0xE800000000000000 || (sub_256D63D70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000256D64840)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_256D63D70();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t MonogramPosterColorDescriptionKey.rawValue.getter()
{
  uint64_t result = 6579570;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E65657267;
      break;
    case 2:
      uint64_t result = 1702194274;
      break;
    case 3:
      uint64_t result = 0x6168706C61;
      break;
    default:
      return result;
  }
  return result;
}

MonogramPoster::MonogramPosterUserInfoKey_optional __swiftcall MonogramPosterUserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  uint64_t v3 = sub_256D63D00();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

unint64_t MonogramPosterUserInfoKey.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t sub_256D6314C(char *a1, char *a2)
{
  return sub_256D632B8(*a1, *a2);
}

uint64_t sub_256D63158(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 6579570;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 6579570;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6E65657267;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1702194274;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6168706C61;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x6E65657267) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1702194274;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x6168706C61) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_256D63D70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_256D632B8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000012;
  }
  else {
    unint64_t v3 = 0xD00000000000001ALL;
  }
  if (v2) {
    unint64_t v4 = 0x8000000256D64730;
  }
  else {
    unint64_t v4 = 0x8000000256D64750;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000012;
  }
  else {
    unint64_t v5 = 0xD00000000000001ALL;
  }
  if (a2) {
    unint64_t v6 = 0x8000000256D64750;
  }
  else {
    unint64_t v6 = 0x8000000256D64730;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_256D63D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_256D63364()
{
  return sub_256D6336C();
}

uint64_t sub_256D6336C()
{
  return sub_256D63DC0();
}

uint64_t sub_256D633F4()
{
  sub_256D63C90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_256D63468()
{
  return sub_256D63470();
}

uint64_t sub_256D63470()
{
  return sub_256D63DC0();
}

MonogramPoster::MonogramPosterUserInfoKey_optional sub_256D634F4(Swift::String *a1)
{
  return MonogramPosterUserInfoKey.init(rawValue:)(*a1);
}

void sub_256D63500(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000012;
  }
  else {
    unint64_t v2 = 0xD00000000000001ALL;
  }
  unint64_t v3 = 0x8000000256D64730;
  if (*v1) {
    unint64_t v3 = 0x8000000256D64750;
  }
  *a1 = v2;
  a1[1] = v3;
}

MonogramPoster::MonogramPosterColorDescriptionKey_optional __swiftcall MonogramPosterColorDescriptionKey.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_256D63D00();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_256D635A0(unsigned __int8 *a1, char *a2)
{
  return sub_256D63158(*a1, *a2);
}

uint64_t sub_256D635AC()
{
  return sub_256D63DC0();
}

uint64_t sub_256D63670()
{
  sub_256D63C90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_256D6371C()
{
  return sub_256D63DC0();
}

MonogramPoster::MonogramPosterColorDescriptionKey_optional sub_256D637DC(Swift::String *a1)
{
  return MonogramPosterColorDescriptionKey.init(rawValue:)(*a1);
}

void sub_256D637E8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 6579570;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x6E65657267;
      goto LABEL_3;
    case 2:
      *a1 = 1702194274;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x6168706C61;
      a1[1] = 0xE500000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

float MonogramPosterOffset.getter()
{
  return 0.445;
}

unint64_t sub_256D63880()
{
  unint64_t result = qword_269FDC0F8;
  if (!qword_269FDC0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FDC0F8);
  }
  return result;
}

unint64_t sub_256D638D8()
{
  unint64_t result = qword_269FDC100;
  if (!qword_269FDC100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FDC100);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MonogramPosterUserInfoKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MonogramPosterUserInfoKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x256D63A88);
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

unsigned char *sub_256D63AB0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterUserInfoKey()
{
  return &type metadata for MonogramPosterUserInfoKey;
}

unsigned char *storeEnumTagSinglePayload for MonogramPosterColorDescriptionKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x256D63B98);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MonogramPosterColorDescriptionKey()
{
  return &type metadata for MonogramPosterColorDescriptionKey;
}

uint64_t sub_256D63BD0()
{
  return MEMORY[0x270EF0D28]();
}

uint64_t sub_256D63BE0()
{
  return MEMORY[0x270EF0D38]();
}

uint64_t sub_256D63BF0()
{
  return MEMORY[0x270EF0D58]();
}

uint64_t sub_256D63C00()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_256D63C10()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_256D63C20()
{
  return MEMORY[0x270EF0F20]();
}

uint64_t sub_256D63C30()
{
  return MEMORY[0x270EF0FE0]();
}

uint64_t sub_256D63C40()
{
  return MEMORY[0x270EF0FF0]();
}

uint64_t sub_256D63C50()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_256D63C60()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_256D63C70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_256D63C80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_256D63C90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_256D63CA0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_256D63CB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_256D63CC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_256D63CD0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_256D63CE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_256D63CF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_256D63D00()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_256D63D10()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_256D63D20()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_256D63D30()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_256D63D40()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_256D63D50()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_256D63D60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_256D63D70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_256D63D80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_256D63D90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_256D63DA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_256D63DB0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_256D63DC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_256D63DD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_256D63DE0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t CNIsArabicString()
{
  return MEMORY[0x270F18618]();
}

uint64_t CNIsChineseJapaneseKoreanString()
{
  return MEMORY[0x270F18620]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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