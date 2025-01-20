uint64_t sub_25C0CB0A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned char *v5;
  uint64_t v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  unsigned char v14[24];
  uint64_t v15;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
  v3 = MEMORY[0x270FA5388](v2 - 8);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  v7 = &v14[-v6];
  v8 = type metadata accessor for ReportOverviewScreen._Alert(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for ReportOverviewScreen(0);
  sub_25C02FB8C((uint64_t)v7, (uint64_t)v5, &qword_26A58A090);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  sub_25C0EB398();
  sub_25C02FBF0((uint64_t)v7, &qword_26A58A090);
  v10 = (char *)(a1 + *(int *)(v9 + 28));
  v11 = *v10;
  v12 = *((void *)v10 + 1);
  v14[16] = v11;
  v15 = v12;
  v14[15] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4F0);
  return sub_25C0EB398();
}

uint64_t sub_25C0CB210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v23 - v14;
  uint64_t v24 = a1;
  type metadata accessor for ReportToAuthoritiesViewModel(0);
  sub_25C0EB378();
  uint64_t v16 = v26;
  *a5 = v25;
  a5[1] = v16;
  v17 = (int *)type metadata accessor for ReportOverviewScreen(0);
  sub_25C0CB3E8(a2, (uint64_t)a5 + v17[5], type metadata accessor for ReportScreen);
  v18 = (void *)((char *)a5 + v17[6]);
  void *v18 = a3;
  v18[1] = a4;
  v19 = (char *)a5 + v17[7];
  LOBYTE(v24) = 2;
  sub_25C0EB378();
  uint64_t v20 = v26;
  char *v19 = v25;
  *((void *)v19 + 1) = v20;
  uint64_t v21 = type metadata accessor for ReportOverviewScreen._Alert(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v15, 1, 1, v21);
  sub_25C02FB8C((uint64_t)v15, (uint64_t)v13, &qword_26A58A090);
  sub_25C0EB378();
  return sub_25C02FBF0((uint64_t)v15, &qword_26A58A090);
}

uint64_t sub_25C0CB3E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C0CB450@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v119 = a1;
  uint64_t v3 = type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v120 = v3;
  uint64_t v104 = *(void *)(v3 - 8);
  uint64_t v103 = *(void *)(v104 + 64);
  MEMORY[0x270FA5388](v3);
  v97 = &v89[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0F8);
  MEMORY[0x270FA5388](v5 - 8);
  v99 = (uint64_t (**)())&v89[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A100);
  MEMORY[0x270FA5388](v107);
  v108 = &v89[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A108);
  MEMORY[0x270FA5388](v121);
  v109 = &v89[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A110);
  uint64_t v111 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  v110 = &v89[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A118);
  uint64_t v115 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  v113 = &v89[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A120);
  MEMORY[0x270FA5388](v118);
  v117 = &v89[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for Report.Evidence(0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  v15 = &v89[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v101 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v101 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v16 - 8);
  v19 = &v89[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = &v89[-v20];
  uint64_t v22 = *(int *)(v3 + 28);
  uint64_t v122 = v1;
  uint64_t v23 = v1 + v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  MEMORY[0x26117CDA0]();
  sub_25C0C92D4((uint64_t)&v15[*(int *)(v13 + 32)], (uint64_t)v21, _s14descr27097BA99O6VictimVMa);
  sub_25C0D14C8((uint64_t)v15, type metadata accessor for Report.Evidence);
  uint64_t v105 = v24;
  uint64_t v25 = v24;
  uint64_t v26 = (uint64_t)v97;
  uint64_t v106 = v23;
  MEMORY[0x26117CDA0](v25);
  uint64_t v27 = *(void *)&v15[*(int *)(v13 + 36)];
  swift_bridgeObjectRetain();
  v102 = v15;
  sub_25C0D14C8((uint64_t)v15, type metadata accessor for Report.Evidence);
  v100 = type metadata accessor for _ReportOverviewScreen;
  sub_25C0C92D4(v2, v26, type metadata accessor for _ReportOverviewScreen);
  v114 = v21;
  sub_25C0C92D4((uint64_t)v21, (uint64_t)v19, _s14descr27097BA99O6VictimVMa);
  uint64_t v28 = *(unsigned __int8 *)(v104 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  v30 = (uint64_t (*)(uint64_t))(v28 | 7);
  unint64_t v31 = (v29 + v103 + *(unsigned __int8 *)(v101 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80);
  uint64_t v32 = swift_allocObject();
  sub_25C0CB3E8(v26, v32 + v29, type metadata accessor for _ReportOverviewScreen);
  sub_25C0CB3E8((uint64_t)v19, v32 + v31, _s14descr27097BA99O6VictimVMa);
  *(void *)(v32 + ((v17 + v31 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A128);
  uint64_t v34 = sub_25C0583D0(&qword_26A58A130, &qword_26A58A128);
  v35 = v99;
  sub_25C07B970((uint64_t)sub_25C0CD9F0, v32, v33, v34, v99);
  uint64_t v98 = sub_25C0EABF8();
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v129);
  __n128 v124 = v129;
  unint64_t v125 = v130;
  uint64_t v126 = v131;
  char v127 = v132;
  uint64_t v128 = v133;
  uint64_t v36 = v122;
  uint64_t v37 = v122 + *(int *)(v120 + 36);
  unint64_t v38 = *(void *)v37;
  unint64_t v39 = *(void *)(v37 + 8);
  uint64_t v101 = v37;
  LOBYTE(v37) = *(unsigned char *)(v37 + 16);
  v134.n128_u64[0] = v38;
  v134.n128_u64[1] = v39;
  LOBYTE(v135) = v37;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0F0);
  MEMORY[0x26117CDA0]((uint64_t *)((char *)&v123 + 1));
  LOBYTE(v27) = BYTE1(v123);
  sub_25C0C92D4(v36, v26, v100);
  v100 = v30;
  unint64_t v40 = swift_allocObject();
  uint64_t v103 = v29;
  uint64_t v41 = v26;
  sub_25C0CB3E8(v26, v40 + v29, type metadata accessor for _ReportOverviewScreen);
  sub_25C09FD54(&v124, v27, (unint64_t)sub_25C0D0430, v40, &v134);
  unint64_t v95 = v134.n128_u64[1];
  unint64_t v42 = v134.n128_u64[0];
  uint64_t v94 = v135;
  uint64_t v93 = v136;
  int v92 = v137;
  uint64_t v91 = v138;
  int v90 = v139;
  long long v96 = v140;
  LOBYTE(v30) = sub_25C0EAF08();
  unsigned __int8 v43 = sub_25C0EAF28();
  char v44 = sub_25C0EAF18();
  sub_25C0EAF18();
  if (sub_25C0EAF18() != v30) {
    char v44 = sub_25C0EAF18();
  }
  sub_25C0EAF18();
  if (sub_25C0EAF18() != v43) {
    char v44 = sub_25C0EAF18();
  }
  sub_25C0EA6C8();
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  int v53 = sub_25C0EA7D8();
  char v54 = MEMORY[0x26117C8A0]((2 * v53));
  uint64_t v55 = sub_25C0EA918();
  v124.n128_u8[0] = 0;
  BYTE1(v123) = 1;
  uint64_t v56 = (uint64_t)v35;
  uint64_t v57 = (uint64_t)v35;
  v58 = v108;
  sub_25C02FB8C(v57, (uint64_t)v108, &qword_26A58A0F8);
  v59 = &v58[*(int *)(v107 + 36)];
  unint64_t v60 = v95;
  *(void *)v59 = v42;
  *((void *)v59 + 1) = v60;
  uint64_t v61 = v93;
  *((void *)v59 + 2) = v94;
  *((void *)v59 + 3) = v61;
  v59[32] = v92;
  *((void *)v59 + 5) = v91;
  v59[48] = v90;
  *(_OWORD *)(v59 + 56) = v96;
  v59[72] = v44;
  *((void *)v59 + 10) = v46;
  *((void *)v59 + 11) = v48;
  *((void *)v59 + 12) = v50;
  *((void *)v59 + 13) = v52;
  v59[112] = v124.n128_u8[0];
  *((void *)v59 + 15) = v55;
  *((void *)v59 + 16) = 0;
  v59[136] = BYTE1(v123);
  v59[137] = v54;
  *((void *)v59 + 18) = v98;
  sub_25C02FBF0(v56, &qword_26A58A0F8);
  sub_25C0C92D4(v122, v26, type metadata accessor for _ReportOverviewScreen);
  uint64_t v62 = swift_allocObject();
  uint64_t v63 = v103;
  sub_25C0CB3E8(v41, v62 + v103, type metadata accessor for _ReportOverviewScreen);
  v64 = v109;
  sub_25C02FB8C((uint64_t)v58, (uint64_t)v109, &qword_26A58A100);
  v65 = &v64[*(int *)(v121 + 36)];
  void *v65 = 0;
  v65[1] = 0;
  v65[2] = sub_25C0D0BD4;
  v65[3] = v62;
  sub_25C02FBF0((uint64_t)v58, &qword_26A58A100);
  uint64_t v66 = (uint64_t)v102;
  MEMORY[0x26117CDA0](v105);
  uint64_t v67 = v122;
  LOBYTE(v62) = sub_25C0452DC(v122 + *(int *)(v120 + 20));
  sub_25C0D14C8(v66, type metadata accessor for Report.Evidence);
  v129.n128_u8[0] = v62 & 1;
  sub_25C0C92D4(v67, v41, type metadata accessor for _ReportOverviewScreen);
  uint64_t v68 = swift_allocObject();
  sub_25C0CB3E8(v41, v68 + v63, type metadata accessor for _ReportOverviewScreen);
  unint64_t v69 = sub_25C0D0CE4();
  unint64_t v70 = MEMORY[0x263F8D4F8];
  uint64_t v71 = MEMORY[0x263F8D510];
  v72 = v110;
  uint64_t v73 = v121;
  sub_25C0EB218();
  swift_release();
  sub_25C02FBF0((uint64_t)v64, &qword_26A58A108);
  uint64_t v74 = v101;
  unint64_t v75 = *(void *)(v101 + 8);
  char v76 = *(unsigned char *)(v101 + 16);
  v129.n128_u64[0] = *(void *)v101;
  v129.n128_u64[1] = v75;
  LOBYTE(v130) = v76;
  uint64_t v77 = v104;
  MEMORY[0x26117CDA0](&v123, v104);
  sub_25C08240C(v123, 0);
  v129.n128_u64[0] = v73;
  v129.n128_u64[1] = v70;
  unint64_t v130 = v69;
  uint64_t v131 = v71;
  swift_getOpaqueTypeConformance2();
  v78 = v113;
  uint64_t v79 = v112;
  sub_25C0EB0C8();
  (*(void (**)(unsigned char *, uint64_t))(v111 + 8))(v72, v79);
  unint64_t v80 = *(void *)(v74 + 8);
  char v81 = *(unsigned char *)(v74 + 16);
  v129.n128_u64[0] = *(void *)v74;
  v129.n128_u64[1] = v80;
  LOBYTE(v130) = v81;
  MEMORY[0x26117CDA0](&v123, v77);
  v129.n128_u8[0] = 0;
  sub_25C0A0190();
  LOBYTE(v79) = sub_25C0EB7A8();
  uint64_t v82 = v115;
  uint64_t v83 = (uint64_t)v117;
  uint64_t v84 = v116;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v115 + 16))(v117, v78, v116);
  *(unsigned char *)(v83 + *(int *)(v118 + 36)) = (v79 & 1) == 0;
  uint64_t v85 = (*(uint64_t (**)(unsigned char *, uint64_t))(v82 + 8))(v78, v84);
  MEMORY[0x270FA5388](v85);
  *(void *)&v89[-16] = v122;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A160);
  sub_25C0D12A0();
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A178);
  unint64_t v87 = sub_25C0D13F4();
  v129.n128_u64[0] = v86;
  v129.n128_u64[1] = v87;
  swift_getOpaqueTypeConformance2();
  sub_25C0EB1E8();
  sub_25C02FBF0(v83, &qword_26A58A120);
  return sub_25C0D14C8((uint64_t)v114, _s14descr27097BA99O6VictimVMa);
}

uint64_t sub_25C0CC1E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v116 = a3;
  uint64_t v117 = a2;
  uint64_t v106 = a1;
  uint64_t v127 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A398);
  MEMORY[0x270FA5388](v5 - 8);
  __n128 v124 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3A0);
  MEMORY[0x270FA5388](KeyPath);
  uint64_t v123 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_25C0EAB58();
  uint64_t v121 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  uint64_t v120 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3A8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v134 = (uint64_t)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3B0);
  uint64_t v11 = MEMORY[0x270FA5388](v118);
  uint64_t v126 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v125 = (uint64_t)&v103 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3B8);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v136 = (uint64_t)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v138 = (uint64_t)&v103 - v17;
  uint64_t v114 = sub_25C0EA748();
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v112 = (uint64_t)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v115 = *(void *)(v19 - 8);
  uint64_t v109 = *(void *)(v115 + 64);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3C0);
  MEMORY[0x270FA5388](v111);
  uint64_t v110 = (uint64_t)&v103 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3C8);
  uint64_t v133 = *(void *)(v135 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v135);
  char v132 = (char *)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  unsigned __int8 v137 = (char *)&v103 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3D0);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v131 = (uint64_t)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v30 = (char *)&v103 - v29;
  uint64_t v31 = type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v108 = v31 - 8;
  uint64_t v33 = *(void *)(v32 + 64);
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v34 = (char *)&v103 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589A98);
  uint64_t v36 = MEMORY[0x270FA5388](v35 - 8);
  uint64_t v129 = (uint64_t)&v103 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  unint64_t v39 = (char *)&v103 - v38;
  sub_25C0C92D4(a1, (uint64_t)v34, type metadata accessor for _ReportOverviewScreen);
  uint64_t v40 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v41 = (v40 + 16) & ~v40;
  uint64_t v105 = v33;
  uint64_t v104 = v40;
  uint64_t v42 = swift_allocObject();
  uint64_t v107 = type metadata accessor for _ReportOverviewScreen;
  sub_25C0CB3E8((uint64_t)v34, v42 + v41, type metadata accessor for _ReportOverviewScreen);
  uint64_t v43 = _s14descr27097BA99O3RowVMa();
  uint64_t v44 = sub_25C0CA704(&qword_26A589D58, (void (*)(uint64_t))_s14descr27097BA99O3RowVMa);
  uint64_t v128 = v39;
  sub_25C07C590((uint64_t)sub_25C0E2FFC, v42, v43, v44, (uint64_t)v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3D8);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A3E0);
  unint64_t v46 = sub_25C0E306C();
  *(void *)&long long v139 = v45;
  *((void *)&v139 + 1) = v46;
  swift_getOpaqueTypeConformance2();
  unint64_t v130 = v30;
  sub_25C07C668((uint64_t)sub_25C0CDC14, 0, (uint64_t)v30);
  uint64_t v47 = v106;
  uint64_t v48 = v116;
  sub_25C0C92D4(v106, (uint64_t)v34, type metadata accessor for _ReportOverviewScreen);
  sub_25C0C92D4(v117, (uint64_t)v21, _s14descr27097BA99O6VictimVMa);
  uint64_t v49 = *(unsigned __int8 *)(v115 + 80);
  uint64_t v115 = v41 + v33;
  uint64_t v50 = (v41 + v33 + v49) & ~v49;
  uint64_t v51 = swift_allocObject();
  uint64_t v117 = v41;
  uint64_t v52 = v51 + v41;
  uint64_t v53 = (uint64_t)v34;
  sub_25C0CB3E8((uint64_t)v34, v52, v107);
  sub_25C0CB3E8((uint64_t)v21, v51 + v50, _s14descr27097BA99O6VictimVMa);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3F0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A3F8);
  uint64_t v55 = sub_25C0583D0(&qword_26A58A400, &qword_26A58A3F8);
  *(void *)&long long v139 = v54;
  *((void *)&v139 + 1) = v55;
  uint64_t v56 = v47;
  swift_getOpaqueTypeConformance2();
  uint64_t v57 = v110;
  sub_25C07C668((uint64_t)sub_25C0E391C, v51, v110);
  uint64_t v58 = v112;
  sub_25C083700(v112);
  sub_25C0583D0(&qword_26A58A408, &qword_26A58A3C0);
  v59 = v132;
  sub_25C07DBF0();
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v58, v114);
  sub_25C02FBF0(v57, &qword_26A58A3C0);
  (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v137, v59, v135);
  if (*(void *)(v48 + 16))
  {
    uint64_t v60 = v104;
    long long v61 = *(_OWORD *)(v48 + 176);
    long long v147 = *(_OWORD *)(v48 + 160);
    long long v148 = v61;
    uint64_t v149 = *(void *)(v48 + 192);
    long long v62 = *(_OWORD *)(v48 + 112);
    long long v143 = *(_OWORD *)(v48 + 96);
    long long v144 = v62;
    long long v63 = *(_OWORD *)(v48 + 144);
    long long v145 = *(_OWORD *)(v48 + 128);
    long long v146 = v63;
    long long v64 = *(_OWORD *)(v48 + 48);
    long long v139 = *(_OWORD *)(v48 + 32);
    long long v140 = v64;
    long long v65 = *(_OWORD *)(v48 + 80);
    long long v141 = *(_OWORD *)(v48 + 64);
    long long v142 = v65;
    sub_25C0C92D4(v56, v53, type metadata accessor for _ReportOverviewScreen);
    uint64_t v66 = (v60 + 24) & ~v60;
    unint64_t v67 = (v105 + v66 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v68 = swift_allocObject();
    *(void *)(v68 + 16) = v48;
    sub_25C0CB3E8(v53, v68 + v66, type metadata accessor for _ReportOverviewScreen);
    unint64_t v69 = v68 + v67;
    long long v70 = v148;
    *(_OWORD *)(v69 + 128) = v147;
    *(_OWORD *)(v69 + 144) = v70;
    *(void *)(v69 + 160) = v149;
    long long v71 = v144;
    *(_OWORD *)(v69 + 64) = v143;
    *(_OWORD *)(v69 + 80) = v71;
    long long v72 = v146;
    *(_OWORD *)(v69 + 96) = v145;
    *(_OWORD *)(v69 + 112) = v72;
    long long v73 = v140;
    *(_OWORD *)unint64_t v69 = v139;
    *(_OWORD *)(v69 + 16) = v73;
    long long v74 = v142;
    *(_OWORD *)(v69 + 32) = v141;
    *(_OWORD *)(v69 + 48) = v74;
    sub_25C058234((uint64_t)&v139);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A410);
    sub_25C0E4254();
    uint64_t v75 = v138;
    sub_25C07C668((uint64_t)sub_25C0E41B4, v68, v138);
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A448);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v75, 0, 1, v76);
  }
  else
  {
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A448);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v138, 1, 1, v77);
  }
  sub_25C0C92D4(v56, v53, type metadata accessor for _ReportOverviewScreen);
  uint64_t v78 = swift_allocObject();
  sub_25C0CB3E8(v53, v78 + v117, type metadata accessor for _ReportOverviewScreen);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A450);
  sub_25C0E442C();
  uint64_t v79 = v134;
  sub_25C07C668((uint64_t)sub_25C0E43BC, v78, v134);
  unint64_t v80 = v120;
  sub_25C0EAB48();
  uint64_t v81 = (uint64_t)v123;
  uint64_t v82 = &v123[*(int *)(KeyPath + 36)];
  uint64_t v83 = v121;
  uint64_t v84 = *(void (**)(char *, char *, uint64_t))(v121 + 16);
  uint64_t v85 = v122;
  v84(v82, v80, v122);
  uint64_t v86 = *(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56);
  v86(v82, 0, 1, v85);
  sub_25C02FB8C(v79, v81, &qword_26A58A3A8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v87 = (uint64_t)v124;
  v84(v124, v80, v85);
  v86((char *)v87, 0, 1, v85);
  uint64_t v88 = (uint64_t)v126;
  v89 = (uint64_t *)&v126[*(int *)(v118 + 36)];
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589130);
  sub_25C02FB8C(v87, (uint64_t)v89 + *(int *)(v90 + 28), &qword_26A58A398);
  uint64_t *v89 = KeyPath;
  sub_25C02FB8C(v81, v88, &qword_26A58A3A0);
  sub_25C02FBF0(v87, &qword_26A58A398);
  sub_25C02FBF0(v81, &qword_26A58A3A0);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v80, v85);
  sub_25C02FBF0(v134, &qword_26A58A3A8);
  uint64_t v91 = v125;
  sub_25C0516EC(v88, v125, &qword_26A58A3B0);
  uint64_t v92 = v129;
  sub_25C02FB8C((uint64_t)v128, v129, &qword_26A589A98);
  uint64_t v93 = v131;
  sub_25C02FB8C((uint64_t)v130, v131, &qword_26A58A3D0);
  uint64_t v94 = v133;
  unint64_t v95 = *(void (**)(char *, char *, uint64_t))(v133 + 16);
  long long v96 = v132;
  uint64_t v97 = v135;
  v95(v132, v137, v135);
  sub_25C02FB8C(v138, v136, &qword_26A58A3B8);
  sub_25C02FB8C(v91, v88, &qword_26A58A3B0);
  uint64_t v98 = v127;
  sub_25C02FB8C(v92, v127, &qword_26A589A98);
  v99 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A58A470);
  sub_25C02FB8C(v93, v98 + v99[12], &qword_26A58A3D0);
  v95((char *)(v98 + v99[16]), v96, v97);
  uint64_t v100 = v136;
  sub_25C02FB8C(v136, v98 + v99[20], &qword_26A58A3B8);
  sub_25C02FB8C(v88, v98 + v99[24], &qword_26A58A3B0);
  sub_25C02FBF0(v91, &qword_26A58A3B0);
  sub_25C02FBF0(v138, &qword_26A58A3B8);
  uint64_t v101 = *(void (**)(char *, uint64_t))(v94 + 8);
  v101(v137, v97);
  sub_25C02FBF0((uint64_t)v130, &qword_26A58A3D0);
  sub_25C02FBF0((uint64_t)v128, &qword_26A589A98);
  sub_25C02FBF0(v88, &qword_26A58A3B0);
  sub_25C02FBF0(v100, &qword_26A58A3B8);
  v101(v96, v97);
  sub_25C02FBF0(v131, &qword_26A58A3D0);
  return sub_25C02FBF0(v129, &qword_26A589A98);
}

uint64_t sub_25C0CD1E4()
{
  uint64_t v1 = (int *)type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v38 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v2 = (v38 + 16) & ~v38;
  uint64_t v37 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v3 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v36 = *(unsigned __int8 *)(*(void *)(v3 - 8) + 80);
  uint64_t v35 = *(void *)(*(void *)(v3 - 8) + 64);
  uint64_t v39 = v0;
  uint64_t v4 = (id *)(v0 + v2);
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v5 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v2, 1, v5))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = (char *)v4 + *(int *)(v5 + 28);
        uint64_t v7 = sub_25C0EA238();
        uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(v6, v7);
        v8((char *)v4 + *(int *)(v5 + 32), v7);
      }
      break;
    case 1u:
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v0 + v2, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v2, v9);
      }
      uint64_t v11 = type metadata accessor for Report.Evidence(0);
      uint64_t v12 = (char *)v4 + *(int *)(v11 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(&v12[*(int *)(v3 + 40)], v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t *)((char *)v4 + *(int *)(v11 + 56));
      unint64_t v14 = v13[1];
      if (v14 >> 60 != 15) {
        sub_25C035294(*v13, v14);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  uint64_t v15 = (id *)((char *)v4 + v1[5]);
  uint64_t v16 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = (char *)v15 + *(int *)(v16 + 28);
    uint64_t v18 = sub_25C0EA238();
    uint64_t v19 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
    v19(v17, v18);
    v19((char *)v15 + *(int *)(v16 + 32), v18);
  }
  swift_release();
  uint64_t v20 = (char *)v4 + v1[7];
  swift_release();
  swift_release();
  uint64_t v21 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v22 = sub_25C0EA328();
  uint64_t v23 = *(void *)(v22 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22)) {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
  }
  uint64_t v24 = type metadata accessor for Report.Evidence(0);
  uint64_t v25 = &v21[*(int *)(v24 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = &v25[*(int *)(v3 + 40)];
  uint64_t v27 = *(void (**)(char *, uint64_t))(v23 + 8);
  v27(v26, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = (uint64_t *)&v21[*(int *)(v24 + 56)];
  unint64_t v29 = v28[1];
  if (v29 >> 60 != 15) {
    sub_25C035294(*v28, v29);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v30 = (char *)v4 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  uint64_t v31 = v3;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v30, v32);
  }
  else
  {
    swift_release();
  }
  uint64_t v33 = (v2 + v37 + v36) & ~v36;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27((char *)(v39 + v33 + *(int *)(v31 + 40)), v22);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v39, ((v35 + v33 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v38 | v36 | 7);
}

uint64_t sub_25C0CD9F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(_s14descr27097BA99O6VictimVMa(0) - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_25C0CC1E0(v1 + v4, v1 + v7, v8, a1);
}

uint64_t sub_25C0CDAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for _ReportOverviewScreen(0);
  sub_25C0EB468();
  uint64_t v8 = a1 + *(int *)(v7 + 32);
  char v9 = *(unsigned char *)(v8 + 8);
  char v10 = *(unsigned char *)(v8 + 32);
  v17[1] = *(void *)v8;
  char v18 = v9;
  long long v19 = *(_OWORD *)(v8 + 16);
  char v20 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A370);
  sub_25C0EA6F8();
  uint64_t v11 = v21;
  uint64_t v12 = v22;
  uint64_t v13 = v23;
  char v14 = v24;
  char v15 = sub_25C03CC84();
  return sub_25C07E030(21, 12, (uint64_t)v6, v11, v12, v13, v14, v15 & 1, a2);
}

uint64_t sub_25C0CDC14()
{
  uint64_t v32 = sub_25C0EAC08();
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v34);
  long long v46 = v34;
  uint64_t v47 = v35;
  uint64_t v48 = v36;
  char v49 = v37;
  uint64_t v50 = v38;
  uint64_t v0 = sub_25C026FAC();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  uint64_t v33 = sub_25C0EB018();
  uint64_t v30 = v5;
  uint64_t v31 = v6;
  char v8 = v7 & 1;
  sub_25C05CED4(v0, v2, v4);
  swift_bridgeObjectRelease();
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v34);
  long long v46 = v34;
  uint64_t v47 = v35;
  uint64_t v48 = v36;
  char v49 = v37;
  uint64_t v50 = v38;
  uint64_t v9 = sub_25C026FAC();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_25C0EAF78();
  uint64_t v14 = sub_25C0EB028();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  sub_25C05CED4(v9, v11, v13);
  swift_bridgeObjectRelease();
  *(void *)&long long v34 = sub_25C0EB2F8();
  uint64_t v19 = sub_25C0EAFF8();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_25C05CED4(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  swift_release();
  LOBYTE(v34) = v8;
  LOBYTE(v46) = v8;
  char v45 = v25;
  sub_25C05CE24(v33, v30, v8);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v19, v21, v25);
  swift_bridgeObjectRetain();
  sub_25C05CED4(v19, v21, v25);
  uint64_t v26 = v23;
  swift_bridgeObjectRelease();
  sub_25C05CED4(v33, v30, v34);
  swift_bridgeObjectRelease();
  char v27 = v46;
  LOBYTE(v23) = v45;
  *(void *)&long long v34 = sub_25C0EB308();
  WORD4(v34) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A588C30);
  sub_25C0583D0((unint64_t *)&qword_26A588C88, &qword_26A588C30);
  uint64_t v28 = sub_25C0EB428();
  long long v34 = (unint64_t)v32;
  LOBYTE(v35) = 1;
  uint64_t v36 = v33;
  uint64_t v37 = v30;
  LOBYTE(v38) = v27;
  uint64_t v39 = v31;
  uint64_t v40 = v19;
  uint64_t v41 = v21;
  char v42 = v23;
  uint64_t v43 = v26;
  uint64_t v44 = v28;
  sub_25C0EA7B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3E0);
  sub_25C0E306C();
  sub_25C0EB108();
  sub_25C05CED4(v33, v30, v27);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v19, v21, v23);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C0CDF88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A3F0);
  uint64_t v24 = *(void *)(v12 - 8);
  uint64_t v25 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (char *)(a1 + *(int *)(type metadata accessor for _ReportOverviewScreen(0) + 48));
  uint64_t v16 = *((void *)v15 + 1);
  char v30 = *v15;
  LOBYTE(a1) = v30;
  uint64_t v31 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A588F18);
  sub_25C0EB3A8();
  uint64_t v22 = v33;
  uint64_t v23 = v32;
  v21[1] = v34;
  sub_25C0C92D4(a2, (uint64_t)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), _s14descr27097BA99O6VictimVMa);
  unint64_t v17 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25C0CB3E8((uint64_t)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17, _s14descr27097BA99O6VictimVMa);
  uint64_t v29 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A438);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4D8);
  sub_25C0583D0(&qword_26A58A440, &qword_26A58A438);
  sub_25C0E557C(&qword_26A58A4E0, &qword_26A58A4D8, (void (*)(void))sub_25C0E4FEC);
  sub_25C0EA8E8();
  LOBYTE(v32) = a1;
  uint64_t v33 = v16;
  sub_25C0EB388();
  sub_25C0EA7C8();
  sub_25C0583D0(&qword_26A58A400, &qword_26A58A3F8);
  uint64_t v19 = v26;
  sub_25C0EB108();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v19);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v28, v14, v25);
}

uint64_t sub_25C0CE378(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5892E0);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4A0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  char v12 = *((unsigned char *)a1 + 32);
  uint64_t v14 = a1[5];
  unint64_t v13 = a1[6];
  unint64_t v16 = a1[7];
  uint64_t v15 = a1[8];
  uint64_t v17 = a1[9];
  char v18 = *((unsigned char *)a1 + 80);
  uint64_t v19 = a1[11];
  *(void *)&long long v27 = v9;
  *((void *)&v27 + 1) = v8;
  uint64_t v28 = v10;
  uint64_t v29 = v11;
  char v30 = v12;
  uint64_t v31 = v14;
  v22.n128_u64[0] = v13;
  v22.n128_u64[1] = v16;
  uint64_t v23 = v15;
  uint64_t v24 = v17;
  char v25 = v18;
  uint64_t v26 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C081628(&v27, &v22, (uint64_t)v4);
  LOBYTE(v17) = sub_25C0EAF08();
  sub_25C02FB8C((uint64_t)v4, (uint64_t)v7, &qword_26A5892E0);
  uint64_t v20 = &v7[*(int *)(v5 + 36)];
  *uint64_t v20 = v17;
  *(_OWORD *)(v20 + 8) = 0u;
  *(_OWORD *)(v20 + 24) = 0u;
  v20[40] = 1;
  sub_25C02FBF0((uint64_t)v4, &qword_26A5892E0);
  sub_25C0EA7B8();
  sub_25C0E5094();
  sub_25C0EB108();
  return sub_25C02FBF0((uint64_t)v7, &qword_26A58A4A0);
}

uint64_t sub_25C0CE558@<X0>(uint64_t a1@<X8>)
{
  return sub_25C0CF354(MEMORY[0x263F1B3A8], a1);
}

uint64_t sub_25C0CE570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v61 = a4;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A438);
  MEMORY[0x270FA5388](v62);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A478);
  uint64_t v50 = *(char **)(v60 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v60);
  uint64_t v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)v43 - v11;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A480);
  MEMORY[0x270FA5388](v58);
  v59 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_25C0EA748();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v15 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A428);
  uint64_t v49 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v17 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A420);
  uint64_t v51 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v19 = (char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A488);
  uint64_t v20 = MEMORY[0x270FA5388](v57);
  __n128 v22 = (char *)v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  if (*(void *)(a1 + 16) < 2uLL)
  {
    uint64_t v37 = v50;
    sub_25C046018((uint64_t)&v72);
    long long v63 = v72;
    uint64_t v64 = v73;
    uint64_t v65 = v74;
    char v66 = v75;
    long long v67 = v76;
    long long v68 = v77;
    uint64_t v69 = v78;
    char v70 = v79;
    uint64_t v71 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A589350);
    sub_25C088CCC();
    sub_25C081710(&v63, (uint64_t)sub_25C0CF33C, 0, (uint64_t)v7);
    type metadata accessor for _ReportOverviewScreen(0);
    sub_25C083700((uint64_t)v15);
    uint64_t v38 = sub_25C0583D0(&qword_26A58A440, &qword_26A58A438);
    uint64_t v39 = v62;
    sub_25C07DBF0();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v54);
    sub_25C02FBF0((uint64_t)v7, &qword_26A58A438);
    uint64_t v40 = v60;
    (*((void (**)(char *, char *, uint64_t))v37 + 4))(v12, v10, v60);
    (*((void (**)(char *, char *, uint64_t))v37 + 2))(v59, v12, v40);
    swift_storeEnumTagMultiPayload();
    uint64_t v41 = sub_25C0583D0(&qword_26A58A430, &qword_26A58A428);
    *(void *)&long long v72 = v55;
    *((void *)&v72 + 1) = v41;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v72 = v56;
    *((void *)&v72 + 1) = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v72 = v39;
    *((void *)&v72 + 1) = v38;
    swift_getOpaqueTypeConformance2();
    sub_25C0EAD28();
    return (*((uint64_t (**)(char *, uint64_t))v37 + 1))(v12, v40);
  }
  else
  {
    uint64_t v50 = (char *)v43 - v23;
    uint64_t v48 = v24;
    uint64_t v25 = a2 + *(int *)(type metadata accessor for _ReportOverviewScreen(0) + 52);
    uint64_t v26 = *(void *)(v25 + 8);
    LOBYTE(v63) = *(unsigned char *)v25;
    *((void *)&v63 + 1) = v26;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A588F18);
    sub_25C0EB3A8();
    uint64_t v45 = *((void *)&v72 + 1);
    uint64_t v46 = v72;
    int v44 = v73;
    uint64_t v27 = swift_allocObject();
    v43[1] = a2;
    v43[0] = v43;
    *(void *)(v27 + 16) = a1;
    MEMORY[0x270FA5388](v27);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A490);
    uint64_t v52 = sub_25C0583D0(&qword_26A58A440, &qword_26A58A438);
    sub_25C0E4FEC();
    sub_25C0EA8E8();
    sub_25C083700((uint64_t)v15);
    uint64_t v28 = sub_25C0583D0(&qword_26A58A430, &qword_26A58A428);
    uint64_t v29 = v55;
    sub_25C07DBF0();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v54);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v29);
    uint64_t v30 = *(void *)(v25 + 8);
    LOBYTE(v72) = *(unsigned char *)v25;
    *((void *)&v72 + 1) = v30;
    sub_25C0EB388();
    sub_25C0EA7C8();
    *(void *)&long long v72 = v29;
    *((void *)&v72 + 1) = v28;
    uint64_t v31 = swift_getOpaqueTypeConformance2();
    uint64_t v32 = v56;
    sub_25C0EB108();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v32);
    uint64_t v33 = v48;
    unsigned __int8 v34 = v50;
    uint64_t v35 = v57;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v50, v22, v57);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v59, v34, v35);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v72 = v32;
    *((void *)&v72 + 1) = v31;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v72 = v62;
    *((void *)&v72 + 1) = v52;
    swift_getOpaqueTypeConformance2();
    sub_25C0EAD28();
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  }
}

uint64_t sub_25C0CEFCC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v47 = MEMORY[0x263F8EE78];
    sub_25C0D5270(0, v1, 0);
    uint64_t v2 = v47;
    uint64_t v4 = a1 + 32;
    do
    {
      long long v5 = *(_OWORD *)(v4 + 144);
      v48[8] = *(_OWORD *)(v4 + 128);
      v48[9] = v5;
      uint64_t v49 = *(void *)(v4 + 160);
      long long v6 = *(_OWORD *)(v4 + 80);
      v48[4] = *(_OWORD *)(v4 + 64);
      v48[5] = v6;
      long long v7 = *(_OWORD *)(v4 + 112);
      v48[6] = *(_OWORD *)(v4 + 96);
      v48[7] = v7;
      long long v8 = *(_OWORD *)(v4 + 16);
      v48[0] = *(_OWORD *)v4;
      v48[1] = v8;
      long long v9 = *(_OWORD *)(v4 + 48);
      v48[2] = *(_OWORD *)(v4 + 32);
      v48[3] = v9;
      sub_25C058234((uint64_t)v48);
      sub_25C046018((uint64_t)&v35);
      sub_25C058304((uint64_t)v48);
      uint64_t v11 = v35;
      uint64_t v10 = v36;
      uint64_t v12 = v37;
      uint64_t v13 = v38;
      char v14 = v39;
      uint64_t v15 = v40;
      uint64_t v16 = v41;
      uint64_t v17 = v42;
      uint64_t v18 = v43;
      uint64_t v19 = v44;
      unint64_t v21 = *(void *)(v2 + 16);
      unint64_t v20 = *(void *)(v2 + 24);
      char v22 = v45;
      uint64_t v23 = v46;
      uint64_t v47 = v2;
      if (v21 >= v20 >> 1)
      {
        uint64_t v25 = v36;
        uint64_t v33 = v38;
        uint64_t v34 = v37;
        char v32 = v39;
        uint64_t v30 = v41;
        uint64_t v31 = v40;
        uint64_t v28 = v43;
        uint64_t v29 = v42;
        uint64_t v27 = v44;
        sub_25C0D5270((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v19 = v27;
        uint64_t v18 = v28;
        uint64_t v17 = v29;
        uint64_t v16 = v30;
        uint64_t v15 = v31;
        char v14 = v32;
        uint64_t v13 = v33;
        uint64_t v12 = v34;
        uint64_t v10 = v25;
        uint64_t v2 = v47;
      }
      *(void *)(v2 + 16) = v21 + 1;
      uint64_t v24 = v2 + 96 * v21;
      *(void *)(v24 + 32) = v11;
      *(void *)(v24 + 40) = v10;
      *(void *)(v24 + 48) = v12;
      *(void *)(v24 + 56) = v13;
      *(unsigned char *)(v24 + 64) = v14;
      *(void *)(v24 + 72) = v15;
      *(void *)(v24 + 80) = v16;
      *(void *)(v24 + 88) = v17;
      *(void *)(v24 + 96) = v18;
      *(void *)(v24 + 104) = v19;
      *(unsigned char *)(v24 + 112) = v22;
      v4 += 168;
      *(void *)(v24 + 120) = v23;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25C0CF160(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5892E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4A0);
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  char v12 = *((unsigned char *)a1 + 32);
  uint64_t v14 = a1[5];
  uint64_t v13 = a1[6];
  uint64_t v16 = a1[7];
  uint64_t v15 = a1[8];
  uint64_t v17 = a1[9];
  char v18 = *((unsigned char *)a1 + 80);
  uint64_t v19 = a1[11];
  *(void *)&long long v22 = v9;
  *((void *)&v22 + 1) = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v11;
  char v25 = v12;
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  uint64_t v28 = v16;
  uint64_t v29 = v15;
  uint64_t v30 = v17;
  char v31 = v18;
  uint64_t v32 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C0817FC(&v22, (uint64_t)v4);
  LOBYTE(v17) = sub_25C0EAF08();
  sub_25C02FB8C((uint64_t)v4, (uint64_t)v7, &qword_26A5892E0);
  unint64_t v20 = &v7[*(int *)(v5 + 36)];
  *unint64_t v20 = v17;
  *(_OWORD *)(v20 + 8) = 0u;
  *(_OWORD *)(v20 + 24) = 0u;
  v20[40] = 1;
  sub_25C02FBF0((uint64_t)v4, &qword_26A5892E0);
  sub_25C0EA7B8();
  sub_25C0E5094();
  sub_25C0EB108();
  return sub_25C02FBF0((uint64_t)v7, &qword_26A58A4A0);
}

uint64_t sub_25C0CF33C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C0CF354(MEMORY[0x263F1B3B8], a1);
}

uint64_t sub_25C0CF354@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589340);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A588C90);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C0EB338();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589348);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C0EB328();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B4B8], v9);
  uint64_t v17 = sub_25C0EB358();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_25C0EAC18();
  uint64_t v18 = sub_25C0EAC28();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 0, 1, v18);
  uint64_t KeyPath = swift_getKeyPath();
  sub_25C02FB8C((uint64_t)v8, (uint64_t)v5 + *(int *)(v3 + 36), &qword_26A588C90);
  *uint64_t v5 = KeyPath;
  sub_25C02FB8C((uint64_t)v5, (uint64_t)&v16[*(int *)(v14 + 44)], &qword_26A589340);
  *(void *)uint64_t v16 = v17;
  *((void *)v16 + 1) = 0;
  *((_WORD *)v16 + 8) = 257;
  swift_retain();
  sub_25C02FBF0((uint64_t)v5, &qword_26A589340);
  sub_25C02FBF0((uint64_t)v8, &qword_26A588C90);
  uint64_t v20 = swift_release();
  uint64_t v21 = v24(v20);
  uint64_t v22 = v25;
  sub_25C02FB8C((uint64_t)v16, v25, &qword_26A589348);
  *(void *)(v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589350) + 36)) = v21;
  return sub_25C02FBF0((uint64_t)v16, &qword_26A589348);
}

uint64_t sub_25C0CF690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for _ReportOverviewScreen(0);
  *(void *)&long long v54 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v54 + 64);
  MEMORY[0x270FA5388](v4);
  *(void *)&long long v55 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Report.Evidence(0);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v32 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  MEMORY[0x26117CDA0]();
  uint64_t v14 = *(void *)&v12[*(int *)(v7 + 60)];
  swift_bridgeObjectRetain();
  sub_25C0D14C8((uint64_t)v12, type metadata accessor for Report.Evidence);
  if (*(void *)(v14 + 16))
  {
    uint64_t v53 = a2;
    SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v74);
    __n128 v66 = v74;
    uint64_t v67 = v75;
    uint64_t v68 = v76;
    char v69 = v77;
    uint64_t v70 = v79;
    MEMORY[0x26117CDA0](v13);
    sub_25C04669C((uint64_t *)&v61);
    uint64_t v40 = a1;
    *(void *)&long long v34 = type metadata accessor for Report.Evidence;
    sub_25C0D14C8((uint64_t)v12, type metadata accessor for Report.Evidence);
    long long v56 = v61;
    uint64_t v57 = v62;
    uint64_t v58 = v63;
    char v59 = v64;
    uint64_t v60 = v65;
    char v39 = type metadata accessor for _ReportOverviewScreen;
    uint64_t v15 = a1;
    uint64_t v16 = v55;
    sub_25C0C92D4(v15, v55, type metadata accessor for _ReportOverviewScreen);
    uint64_t v17 = *(unsigned __int8 *)(v54 + 80);
    uint64_t v18 = ((v17 + 24) & ~v17) + v5;
    uint64_t v19 = (v17 + 24) & ~v17;
    *(void *)&long long v38 = v19;
    uint64_t v36 = v17 | 7;
    *(void *)&long long v37 = v18;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v14;
    uint64_t v35 = type metadata accessor for _ReportOverviewScreen;
    sub_25C0CB3E8(v16, v20 + v19, type metadata accessor for _ReportOverviewScreen);
    sub_25C0AD194();
    swift_bridgeObjectRetain();
    sub_25C0824E8(&v66, &v56, 2, (uint64_t)sub_25C0E44C8, v20, (uint64_t)&v104);
    unint64_t v21 = *((void *)&v104 + 1);
    uint64_t v47 = v105;
    unint64_t v48 = v104;
    int v46 = v107;
    uint64_t v41 = v106;
    uint64_t v42 = v108;
    uint64_t v50 = *((void *)&v109 + 1);
    uint64_t v51 = *((void *)&v108 + 1);
    uint64_t v43 = v109;
    uint64_t v44 = v110;
    int v49 = v111;
    uint64_t v45 = v112;
    int v52 = v113;
    long long v54 = v114;
    MEMORY[0x26117CDA0](v13);
    sub_25C046C08((uint64_t)&v74);
    uint64_t v22 = (uint64_t)v12;
    uint64_t v23 = (uint64_t (*)(void))v34;
    sub_25C0D14C8(v22, (uint64_t (*)(void))v34);
    __n128 v66 = v74;
    uint64_t v67 = v75;
    uint64_t v68 = v76;
    char v69 = v77;
    uint64_t v70 = v79;
    MEMORY[0x26117CDA0](v13);
    sub_25C046EB8((uint64_t *)&v61);
    sub_25C0D14C8((uint64_t)v10, v23);
    long long v56 = v61;
    uint64_t v57 = v62;
    uint64_t v58 = v63;
    char v59 = v64;
    uint64_t v60 = v65;
    sub_25C0C92D4(v40, v16, v39);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v14;
    sub_25C0CB3E8(v16, v24 + v38, v35);
    sub_25C0AD0FC();
    sub_25C0824E8(&v66, &v56, 3, (uint64_t)sub_25C0E4CDC, v24, (uint64_t)&v104);
    long long v34 = v104;
    uint64_t v32 = v106;
    uint64_t v33 = v105;
    LOBYTE(v16) = v107;
    long long v37 = v109;
    long long v38 = v108;
    uint64_t v36 = v110;
    LODWORD(v35) = v111;
    uint64_t v40 = v112;
    LODWORD(v39) = v113;
    long long v55 = v114;
    unint64_t v25 = v21;
    swift_bridgeObjectRetain();
    uint64_t v26 = v41;
    swift_bridgeObjectRetain();
    uint64_t v27 = v42;
    swift_bridgeObjectRetain();
    uint64_t v28 = v43;
    swift_bridgeObjectRetain();
    uint64_t v29 = v44;
    swift_bridgeObjectRetain();
    uint64_t v30 = swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v74.n128_u64[0] = v48;
    v74.n128_u64[1] = v25;
    uint64_t v75 = v47;
    uint64_t v76 = v26;
    char v77 = v46;
    *(_DWORD *)uint64_t v78 = v66.n128_u32[0];
    *(_DWORD *)&v78[3] = *(unsigned __int32 *)((char *)v66.n128_u32 + 3);
    uint64_t v79 = v27;
    uint64_t v80 = v51;
    uint64_t v81 = v28;
    uint64_t v82 = v50;
    uint64_t v83 = v29;
    char v84 = v49;
    *(_DWORD *)uint64_t v85 = v61;
    *(_DWORD *)&v85[3] = *(_DWORD *)((char *)&v61 + 3);
    uint64_t v86 = v30;
    char v87 = v52;
    *(_DWORD *)&v88[3] = *(_DWORD *)((char *)&v56 + 3);
    *(_DWORD *)uint64_t v88 = v56;
    long long v89 = v54;
    long long v90 = v34;
    uint64_t v91 = v33;
    uint64_t v92 = v32;
    char v93 = v16;
    *(_DWORD *)&v94[3] = *(_DWORD *)&v73[3];
    *(_DWORD *)uint64_t v94 = *(_DWORD *)v73;
    long long v95 = v38;
    long long v96 = v37;
    uint64_t v97 = v36;
    char v98 = (char)v35;
    *(_DWORD *)&v99[3] = *(_DWORD *)&v72[3];
    *(_DWORD *)v99 = *(_DWORD *)v72;
    uint64_t v100 = v40;
    char v101 = (char)v39;
    *(_DWORD *)v102 = *(_DWORD *)v71;
    *(_DWORD *)&v102[3] = *(_DWORD *)&v71[3];
    long long v103 = v55;
    a2 = v53;
    nullsub_1(&v74);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25C0E4D50(&v74);
  }
  sub_25C0516EC((uint64_t)&v74, (uint64_t)&v104, &qword_26A58A450);
  return sub_25C0516EC((uint64_t)&v104, a2, &qword_26A58A450);
}

size_t sub_25C0CFD08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = type metadata accessor for Report.Message();
  uint64_t v4 = a1
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));
  uint64_t v5 = *(void *)(*(void *)(v3 - 8) + 72);
  size_t result = swift_bridgeObjectRetain();
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v8 = *(void *)(v4 + *(int *)(v3 + 32));
    uint64_t v9 = *(void *)(v8 + 16);
    int64_t v10 = v7[2];
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    swift_bridgeObjectRetain();
    size_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result && v11 <= v7[3] >> 1)
    {
      if (*(void *)(v8 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v10 <= v11) {
        int64_t v12 = v10 + v9;
      }
      else {
        int64_t v12 = v10;
      }
      size_t result = sub_25C0D53AC(result, v12, 1, v7, &qword_26A588A28, type metadata accessor for Report.Media);
      uint64_t v7 = (void *)result;
      if (*(void *)(v8 + 16))
      {
LABEL_14:
        uint64_t v13 = (v7[3] >> 1) - v7[2];
        size_t result = type metadata accessor for Report.Media(0);
        if (v13 < v9) {
          goto LABEL_23;
        }
        size_t result = swift_arrayInitWithCopy();
        if (v9)
        {
          uint64_t v14 = v7[2];
          BOOL v15 = __OFADD__(v14, v9);
          uint64_t v16 = v14 + v9;
          if (v15) {
            goto LABEL_24;
          }
          v7[2] = v16;
        }
        goto LABEL_4;
      }
    }
    if (v9) {
      goto LABEL_22;
    }
LABEL_4:
    size_t result = swift_bridgeObjectRelease();
    v4 += v5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return (size_t)v7;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

double sub_25C0CFF1C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Report.Evidence(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  int64_t v10 = (void *)swift_bridgeObjectRetain();
  uint64_t v27 = sub_25C0D0118(v10);
  uint64_t v11 = type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  MEMORY[0x26117CDA0]();
  sub_25C047B6C((uint64_t)&v43);
  sub_25C0D14C8((uint64_t)v9, type metadata accessor for Report.Evidence);
  __n128 v38 = v43;
  uint64_t v39 = v44;
  uint64_t v40 = v45;
  char v41 = v46;
  uint64_t v42 = v47;
  MEMORY[0x26117CDA0](v12);
  sub_25C046EB8((uint64_t *)&v33);
  sub_25C0D14C8((uint64_t)v7, type metadata accessor for Report.Evidence);
  long long v28 = v33;
  uint64_t v29 = v34;
  uint64_t v30 = v35;
  char v31 = v36;
  uint64_t v32 = v37;
  uint64_t v13 = (uint64_t *)(a1 + *(int *)(v11 + 24));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  swift_retain();
  sub_25C0A9068(v27, &v38, &v28, v14, v15, (uint64_t)v48);
  double result = *(double *)v48;
  long long v17 = v48[1];
  uint64_t v18 = v49;
  char v19 = v50;
  long long v20 = v51;
  long long v21 = v52;
  uint64_t v22 = v53;
  char v23 = v54;
  uint64_t v24 = v56;
  long long v25 = v55;
  *(_OWORD *)a2 = v48[0];
  *(_OWORD *)(a2 + 16) = v17;
  *(void *)(a2 + 32) = v18;
  *(unsigned char *)(a2 + 40) = v19;
  *(_OWORD *)(a2 + 48) = v20;
  *(_OWORD *)(a2 + 64) = v21;
  *(void *)(a2 + 80) = v22;
  *(unsigned char *)(a2 + 88) = v23;
  *(_OWORD *)(a2 + 96) = v25;
  *(void *)(a2 + 112) = v24;
  return result;
}

uint64_t sub_25C0D0118(void *a1)
{
  uint64_t v2 = type metadata accessor for Report.Message();
  uint64_t v15 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v16 = (uint64_t)&v15 - v7;
  unint64_t v8 = a1[2];
  if (v8 < 2) {
    return (uint64_t)a1;
  }
  unint64_t v9 = 0;
  unint64_t v10 = v8 >> 1;
  for (unint64_t i = v8 - 1; ; --i)
  {
    if (v9 == i) {
      goto LABEL_4;
    }
    unint64_t v12 = a1[2];
    if (v9 >= v12) {
      break;
    }
    unint64_t v13 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v14 = *(void *)(v15 + 72);
    uint64_t result = sub_25C0C92D4((uint64_t)a1 + v13 + v14 * v9, v16, (uint64_t (*)(void))type metadata accessor for Report.Message);
    if (i >= v12) {
      goto LABEL_14;
    }
    sub_25C0C92D4((uint64_t)a1 + v13 + v14 * i, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Report.Message);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_25C0D5588(a1);
      a1 = (void *)result;
    }
    if (v9 >= a1[2]) {
      goto LABEL_15;
    }
    uint64_t result = sub_25C0E4D78((uint64_t)v5, (uint64_t)a1 + v13 + v14 * v9);
    if (i >= a1[2]) {
      goto LABEL_16;
    }
    uint64_t result = sub_25C0E4D78(v16, (uint64_t)a1 + v13 + v14 * i);
LABEL_4:
    if (v10 == ++v9) {
      return (uint64_t)a1;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_25C0D0300(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Report.Evidence(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(v5 + 32));
  char v7 = *((unsigned char *)v6 + 8);
  char v8 = *((unsigned char *)v6 + 32);
  uint64_t v14 = *v6;
  char v15 = v7;
  long long v16 = *((_OWORD *)v6 + 1);
  char v17 = v8;
  v12[1] = 0;
  char v13 = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A370);
  sub_25C0EA6E8();
  unint64_t v9 = *(void (**)(char *))(a1 + *(int *)(v5 + 40));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  MEMORY[0x26117CDA0](v10);
  v9(v4);
  return sub_25C0D14C8((uint64_t)v4, type metadata accessor for Report.Evidence);
}

uint64_t sub_25C0D0430()
{
  uint64_t v1 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_25C0D0300(v2);
}

uint64_t objectdestroy_13Tm_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v35 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v5 = (id *)(v0 + v4);
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v0 + v4, 1, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v7 = (char *)v5 + *(int *)(v6 + 28);
        uint64_t v8 = sub_25C0EA238();
        unint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
        v9(v7, v8);
        v9((char *)v5 + *(int *)(v6 + 32), v8);
        uint64_t v1 = v0;
      }
      break;
    case 1u:
      uint64_t v10 = sub_25C0EA328();
      uint64_t v11 = *(void *)(v10 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v4, 1, v10)) {
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v4, v10);
      }
      uint64_t v12 = type metadata accessor for Report.Evidence(0);
      char v13 = (char *)v5 + *(int *)(v12 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v11 + 8))(&v13[*(int *)(v14 + 40)], v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v15 = (uint64_t *)((char *)v5 + *(int *)(v12 + 56));
      unint64_t v16 = v15[1];
      if (v16 >> 60 != 15) {
        sub_25C035294(*v15, v16);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  char v17 = (id *)((char *)v5 + v2[5]);
  uint64_t v18 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v17, 1, v18))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v19 = (char *)v17 + *(int *)(v18 + 28);
    uint64_t v20 = sub_25C0EA238();
    uint64_t v21 = v1;
    uint64_t v22 = *(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8);
    v22(v19, v20);
    v22((char *)v17 + *(int *)(v18 + 32), v20);
    uint64_t v1 = v21;
    uint64_t v4 = (v3 + 16) & ~v3;
  }
  swift_release();
  char v23 = (char *)v5 + v2[7];
  swift_release();
  swift_release();
  uint64_t v24 = &v23[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v25 = sub_25C0EA328();
  uint64_t v26 = *(void *)(v25 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25)) {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
  }
  uint64_t v27 = type metadata accessor for Report.Evidence(0);
  long long v28 = &v24[*(int *)(v27 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v29 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, uint64_t))(v26 + 8))(&v28[*(int *)(v29 + 40)], v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = (uint64_t *)&v24[*(int *)(v27 + 56)];
  unint64_t v31 = v30[1];
  if (v31 >> 60 != 15) {
    sub_25C035294(*v30, v31);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v32 = (char *)v5 + v2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v33 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v1, v4 + v35, v3 | 7);
}

uint64_t sub_25C0D0BDC(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4 = type metadata accessor for _ReportOverviewScreen(0);
  int v5 = *a2;
  unint64_t v6 = v2
     + *(int *)(v4 + 36)
     + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  uint64_t v8 = *(void *)v6;
  uint64_t v7 = *(void *)(v6 + 8);
  char v9 = *(unsigned char *)(v6 + 16);
  uint64_t v13 = *(void *)v6;
  uint64_t v14 = v7;
  char v15 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0F0);
  MEMORY[0x26117CDA0](&v12);
  LOBYTE(v13) = 0;
  sub_25C0A0190();
  uint64_t result = sub_25C0EB7A8();
  if ((result & 1) == 0)
  {
    uint64_t v13 = v8;
    uint64_t v14 = v7;
    char v15 = v9;
    if (v5) {
      char v11 = 2;
    }
    else {
      char v11 = 1;
    }
    char v12 = v11;
    return sub_25C0EB448();
  }
  return result;
}

unint64_t sub_25C0D0CE4()
{
  unint64_t result = qword_26A58A138;
  if (!qword_26A58A138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A108);
    sub_25C0D0D60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A138);
  }
  return result;
}

unint64_t sub_25C0D0D60()
{
  unint64_t result = qword_26A58A140;
  if (!qword_26A58A140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A100);
    sub_25C0583D0(&qword_26A58A148, &qword_26A58A0F8);
    sub_25C0583D0(&qword_26A58A150, &qword_26A58A158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A140);
  }
  return result;
}

uint64_t sub_25C0D0E24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C0EAD98();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A188);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A178);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  char v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v27 - v13;
  uint64_t v15 = a1 + *(int *)(type metadata accessor for _ReportOverviewScreen(0) + 32);
  char v16 = *(unsigned char *)(v15 + 8);
  char v17 = *(unsigned char *)(v15 + 32);
  uint64_t v28 = *(void *)v15;
  LOBYTE(v29) = v16;
  long long v30 = *(_OWORD *)(v15 + 16);
  char v31 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A370);
  sub_25C0EA6D8();
  if (v33 == 255
    || (LOBYTE(v28) = sub_25C0E89BC(v32, v33), LOBYTE(v32) = 9, sub_25C0E25AC(), (sub_25C0EB7A8() & 1) == 0))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A378);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 1, 1, v22);
    uint64_t v23 = sub_25C0583D0(&qword_26A58A190, &qword_26A58A188);
    uint64_t v28 = v5;
    uint64_t v29 = v23;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    MEMORY[0x26117C740](v12, v22, OpaqueTypeConformance2);
    sub_25C02FBF0((uint64_t)v12, &qword_26A58A178);
  }
  else
  {
    uint64_t v18 = sub_25C0EAD78();
    v27[1] = v27;
    v27[2] = a2;
    MEMORY[0x270FA5388](v18);
    v27[-2] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A380);
    sub_25C0583D0(&qword_26A58A388, &qword_26A58A380);
    sub_25C0EA958();
    uint64_t v19 = sub_25C0583D0(&qword_26A58A190, &qword_26A58A188);
    MEMORY[0x26117C730](v8, v5, v19);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A378);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 0, 1, v20);
    uint64_t v28 = v5;
    uint64_t v29 = v19;
    uint64_t v21 = swift_getOpaqueTypeConformance2();
    MEMORY[0x26117C740](v12, v20, v21);
    sub_25C02FBF0((uint64_t)v12, &qword_26A58A178);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  unint64_t v25 = sub_25C0D13F4();
  MEMORY[0x26117C730](v14, v9, v25);
  return sub_25C02FBF0((uint64_t)v14, &qword_26A58A178);
}

uint64_t sub_25C0D1298@<X0>(uint64_t a1@<X8>)
{
  return sub_25C0D0E24(*(void *)(v1 + 16), a1);
}

unint64_t sub_25C0D12A0()
{
  unint64_t result = qword_26A58A168;
  if (!qword_26A58A168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A120);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A110);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A108);
    sub_25C0D0CE4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_25C0D13A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A168);
  }
  return result;
}

unint64_t sub_25C0D13A0()
{
  unint64_t result = qword_26A58A170;
  if (!qword_26A58A170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A170);
  }
  return result;
}

unint64_t sub_25C0D13F4()
{
  unint64_t result = qword_26A58A180;
  if (!qword_26A58A180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A178);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A188);
    sub_25C0583D0(&qword_26A58A190, &qword_26A58A188);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A180);
  }
  return result;
}

uint64_t sub_25C0D14C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C0D1528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589568);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v20 - v12;
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v25);
  long long v20 = v25;
  uint64_t v21 = v26;
  uint64_t v22 = v27;
  char v23 = v28;
  uint64_t v24 = v29;
  sub_25C0C92D4(a1, (uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for _ReportOverviewScreen);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  sub_25C0CB3E8((uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for _ReportOverviewScreen);
  sub_25C0270A8();
  char v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v16(v11, v13, v7);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A390);
  v16((char *)(a2 + *(int *)(v17 + 48)), v11, v7);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v13, v7);
  return ((uint64_t (*)(char *, uint64_t))v18)(v11, v7);
}

uint64_t sub_25C0D17BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C088A68(a1);
  uint64_t v3 = sub_25C026FAC();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_25C0EAF78();
  uint64_t v8 = sub_25C0EB028();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  sub_25C05CED4(v3, v5, v7);
  swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v12 & 1;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = sub_25C0D18E4;
  *(unsigned char *)(a2 + 56) = 1;
  sub_25C05CE24(v8, v10, v12 & 1);
  swift_bridgeObjectRetain();
  sub_25C05CED4(v8, v10, v12 & 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C0D18E4()
{
  return sub_25C0EA788();
}

void sub_25C0D190C(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 40);
    char v5 = *(unsigned char *)(v1 + 32);
    uint64_t v7 = *(void *)(v1 + 16);
    uint64_t v6 = *(void *)(v1 + 24);
    v21[0] = *(void *)v1;
    v21[1] = v3;
    _DWORD v21[2] = v7;
    v21[3] = v6;
    char v22 = v5 & 1;
    uint64_t v23 = v4;
    uint64_t v8 = sub_25C0EAB38();
    sub_25C0D17BC((uint64_t)v21, (uint64_t)&v15);
    long long v9 = v15;
    uint64_t v3 = v16;
    long long v10 = v17;
    uint64_t v11 = v18;
    uint64_t v12 = v19;
    uint64_t v13 = 1;
    char v14 = v20;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    char v14 = 0;
    long long v9 = 0uLL;
    long long v10 = 0uLL;
  }
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 24) = v9;
  *(void *)(a1 + 40) = v3;
  *(_OWORD *)(a1 + 48) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v12;
  *(unsigned char *)(a1 + 80) = v14;
}

uint64_t type metadata accessor for ReportTranscriptView(uint64_t a1)
{
  return sub_25C02BF00(a1, qword_26A594D50);
}

__n128 sub_25C0D19EC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C0EAB38();
  sub_25C0D1A80(a1, (uint64_t)&v13);
  char v5 = v14;
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  char v8 = v17;
  char v9 = v19;
  uint64_t v10 = v20;
  __n128 result = v13;
  long long v12 = v18;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v7;
  *(unsigned char *)(a2 + 64) = v8;
  *(_OWORD *)(a2 + 72) = v12;
  *(unsigned char *)(a2 + 88) = v9;
  *(void *)(a2 + 96) = v10;
  return result;
}

double sub_25C0D1A78@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25C0D19EC(*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_25C0D1A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SCLocalizedStringKey.StringInterpolation();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v40);
  long long v35 = v40;
  uint64_t v36 = v41;
  uint64_t v37 = v42;
  char v38 = v43;
  uint64_t v39 = v44;
  uint64_t v7 = sub_25C026FAC();
  uint64_t v32 = v8;
  uint64_t v33 = v7;
  uint64_t v34 = v9;
  int v31 = v10 & 1;
  SCLocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v11._object = (void *)0x800000025C0F7230;
  v11._countAndFlagsBits = 0xD000000000000019;
  SCLocalizedStringKey.StringInterpolation.appendLiteral(_:)(v11);
  *(void *)&long long v40 = *(void *)(a1 + 16);
  sub_25C051A34();
  SCLocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:)();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  SCLocalizedStringKey.StringInterpolation.appendLiteral(_:)(v12);
  SCLocalizedStringKey.init(stringInterpolation:)((uint64_t)v6, (uint64_t)&v40);
  long long v35 = v40;
  uint64_t v36 = v41;
  uint64_t v37 = v42;
  char v38 = v43;
  uint64_t v39 = v44;
  uint64_t v13 = sub_25C026FAC();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  *(void *)&long long v40 = sub_25C0EB2F8();
  uint64_t v18 = sub_25C0EAFF8();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  sub_25C05CED4(v13, v15, v17);
  swift_release();
  swift_bridgeObjectRelease();
  char v25 = v31;
  LOBYTE(v40) = v31;
  uint64_t v27 = v32;
  uint64_t v26 = v33;
  *(void *)a2 = v33;
  *(void *)(a2 + 8) = v27;
  *(unsigned char *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v34;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v20;
  *(unsigned char *)(a2 + 64) = v24;
  *(void *)(a2 + 72) = v22;
  uint64_t v28 = v26;
  sub_25C05CE24(v26, v27, v25);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v18, v20, v24);
  swift_bridgeObjectRetain();
  sub_25C05CED4(v18, v20, v24);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v28, v27, v40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C0D1CF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ReportTranscriptView(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *v1;
  if (*v1)
  {
    MEMORY[0x270FA5388](v4);
    *(&v12 - 2) = v7;
    *(uint64_t *)((char *)v6 + *(int *)(v3 + 20)) = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    swift_storeEnumTagMultiPayload();
    *uint64_t v6 = v7;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1A0);
    sub_25C0583D0(&qword_26A58A1A8, &qword_26A58A1A0);
    sub_25C0CA704(&qword_26A58A1B0, (void (*)(uint64_t))type metadata accessor for ReportTranscriptView);
    sub_25C0EA888();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A198);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 0, 1, v8);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A198);
    Swift::String v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    return v11(a1, 1, 1, v10);
  }
}

uint64_t sub_25C0D1F44()
{
  return sub_25C0EB4A8();
}

unint64_t sub_25C0D20B8()
{
  unint64_t result = qword_26A58A1C0;
  if (!qword_26A58A1C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A1B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A1C8);
    sub_25C0583D0(&qword_26A58A1D0, &qword_26A58A1C8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A1C0);
  }
  return result;
}

uint64_t sub_25C0D218C(uint64_t a1)
{
  sub_25C0EAB28();
  uint64_t v36 = sub_25C0EAC08();
  uint64_t v35 = sub_25C0EAB38();
  uint64_t v33 = a1;
  sub_25C0B46C0();
  sub_25C027054();
  uint64_t v2 = sub_25C0EB048();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_25C0EAF78();
  uint64_t v7 = sub_25C0EB028();
  uint64_t v37 = v8;
  uint64_t v38 = v7;
  char v10 = v9;
  uint64_t v30 = v11;
  swift_release();
  sub_25C05CED4(v2, v4, v6);
  swift_bridgeObjectRelease();
  uint64_t v31 = type metadata accessor for Report.Message();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25C0EB048();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_25C0EAF58();
  uint64_t v17 = sub_25C0EB028();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  swift_release();
  sub_25C05CED4(v12, v14, v16);
  swift_bridgeObjectRelease();
  v99[0] = v10 & 1;
  LOBYTE(v73[0]) = v21 & 1;
  sub_25C05CE24(v38, v37, v10 & 1);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v17, v19, v21 & 1);
  swift_bridgeObjectRetain();
  sub_25C05CED4(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v38, v37, v10 & 1);
  swift_bridgeObjectRelease();
  uint64_t v34 = sub_25C0EAB38();
  uint64_t v39 = *(void *)(v33 + *(int *)(v31 + 28));
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_25C0EB048();
  uint64_t v25 = v24;
  uint64_t v32 = v26;
  char v112 = v10 & 1;
  char v111 = v21 & 1;
  LOBYTE(v14) = v27 & 1;
  int v49 = v39;
  HIBYTE(v49) = BYTE3(v39);
  int v48 = *(_DWORD *)&v99[3];
  LOBYTE(v48) = v99[3];
  int v47 = *(_DWORD *)((char *)v73 + 3);
  LOBYTE(v47) = BYTE3(v73[0]);
  int v46 = *(_DWORD *)((char *)&v62 + 3);
  LOBYTE(v46) = BYTE3(v62);
  int v45 = *(_DWORD *)((char *)v50 + 3);
  LOBYTE(v45) = BYTE3(v50[0]);
  sub_25C05CE24(v38, v37, v10 & 1);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v17, v19, v21 & 1);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v29, v25, v14);
  swift_bridgeObjectRetain();
  sub_25C05CED4(v29, v25, v14);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v38, v37, v10 & 1);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  int v44 = v49;
  HIBYTE(v44) = BYTE3(v39);
  int v43 = *(_DWORD *)v99;
  HIBYTE(v43) = v99[3];
  int v42 = v73[0];
  HIBYTE(v42) = BYTE3(v73[0]);
  int v41 = v62;
  HIBYTE(v41) = BYTE3(v62);
  int v40 = v50[0];
  HIBYTE(v40) = BYTE3(v50[0]);
  DWORD1(v51) = *(_DWORD *)((char *)&v39 + 3);
  *(_DWORD *)((char *)&v51 + 1) = v49;
  HIDWORD(v52) = *(_DWORD *)((char *)&v39 + 3);
  *(_DWORD *)((char *)&v52 + 9) = v44;
  DWORD1(v54) = v48;
  *(_DWORD *)((char *)&v54 + 1) = v43;
  DWORD1(v56) = v47;
  *(_DWORD *)((char *)&v56 + 1) = v42;
  DWORD1(v59) = v46;
  *(_DWORD *)((char *)&v59 + 1) = v41;
  HIDWORD(v60) = v45;
  *(_DWORD *)((char *)&v60 + 9) = v40;
  *(_DWORD *)uint64_t v75 = v49;
  *(_DWORD *)&v75[3] = *(_DWORD *)((char *)&v39 + 3);
  v50[0] = v36;
  v50[1] = 0;
  LOBYTE(v51) = 1;
  *((void *)&v51 + 1) = v35;
  *(void *)&long long v52 = 0;
  BYTE8(v52) = 1;
  *(void *)&long long v53 = v38;
  *((void *)&v53 + 1) = v37;
  LOBYTE(v54) = v10 & 1;
  *((void *)&v54 + 1) = v30;
  *(void *)&long long v55 = v17;
  *((void *)&v55 + 1) = v19;
  LOBYTE(v56) = v21 & 1;
  *((void *)&v56 + 1) = v23;
  uint64_t v57 = v34;
  uint64_t v58 = 0;
  LOBYTE(v59) = 1;
  *((void *)&v59 + 1) = v29;
  *(void *)&long long v60 = v25;
  BYTE8(v60) = v14;
  uint64_t v61 = v32;
  uint64_t v72 = v32;
  long long v70 = v59;
  long long v71 = v60;
  long long v62 = (unint64_t)v36;
  long long v63 = v51;
  long long v68 = v56;
  long long v69 = (unint64_t)v34;
  long long v66 = v54;
  long long v67 = v55;
  long long v64 = v52;
  long long v65 = v53;
  v73[0] = v36;
  v73[1] = 0;
  char v74 = 1;
  uint64_t v76 = v35;
  uint64_t v77 = 0;
  char v78 = 1;
  *(_DWORD *)uint64_t v79 = v44;
  *(_DWORD *)&v79[3] = *(_DWORD *)((char *)&v39 + 3);
  uint64_t v80 = v38;
  uint64_t v81 = v37;
  char v82 = v10 & 1;
  *(_DWORD *)&v83[3] = v48;
  *(_DWORD *)uint64_t v83 = v43;
  uint64_t v84 = v30;
  uint64_t v85 = v17;
  uint64_t v86 = v19;
  char v87 = v21 & 1;
  *(_DWORD *)&v88[3] = v47;
  *(_DWORD *)uint64_t v88 = v42;
  uint64_t v89 = v23;
  uint64_t v90 = v34;
  uint64_t v91 = 0;
  char v92 = 1;
  *(_DWORD *)&v93[3] = v46;
  *(_DWORD *)char v93 = v41;
  uint64_t v94 = v29;
  uint64_t v95 = v25;
  char v96 = v14;
  *(_DWORD *)uint64_t v97 = v40;
  *(_DWORD *)&v97[3] = v45;
  uint64_t v98 = v32;
  sub_25C0E2DEC((uint64_t)v50);
  sub_25C0E2E94((uint64_t)v73);
  long long v107 = v69;
  long long v108 = v70;
  long long v109 = v71;
  uint64_t v110 = v72;
  long long v103 = v65;
  long long v104 = v66;
  long long v105 = v67;
  long long v106 = v68;
  long long v100 = v62;
  long long v101 = v63;
  long long v102 = v64;
  sub_25C0EA7B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1C8);
  sub_25C0583D0(&qword_26A58A1D0, &qword_26A58A1C8);
  sub_25C0EB108();
  return sub_25C0E2E94((uint64_t)v50);
}

uint64_t (*sub_25C0D28A0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>))()
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_25C0C92D4(v2, (uint64_t)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ReportTranscriptView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  sub_25C0CB3E8((uint64_t)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for ReportTranscriptView);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1B8);
  unint64_t v9 = sub_25C0D20B8();
  return sub_25C07B970((uint64_t)sub_25C0E2230, v7, v8, v9, a2);
}

uint64_t sub_25C0D29DC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  uint64_t result = sub_25C0EB378();
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = v21;
  *(void *)(a9 + 56) = v22;
  *(void *)(a9 + 64) = a7;
  *(void *)(a9 + 72) = a8;
  *(void *)(a9 + 80) = a10;
  *(unsigned char *)(a9 + 88) = a11;
  return result;
}

__n128 sub_25C0D2A90@<Q0>(unint64_t a1@<X0>, unsigned __int8 a2@<W1>, unint64_t a3@<X4>, unint64_t a4@<X5>, unint64_t a5@<X6>, unsigned __int8 a6@<W7>, __n128 *a7@<X8>)
{
  sub_25C0EB378();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A588770);
  sub_25C0EB488();
  swift_bridgeObjectRelease();
  __n128 result = v17;
  a7->n128_u64[0] = a1;
  a7->n128_u8[8] = a2;
  a7[1].n128_u64[0] = v15;
  a7[1].n128_u64[1] = v16;
  a7[2] = v17;
  a7[3].n128_u8[0] = v15;
  a7[3].n128_u64[1] = v16;
  a7[4].n128_u64[0] = a3;
  a7[4].n128_u64[1] = a4;
  a7[5].n128_u64[0] = a5;
  a7[5].n128_u8[8] = a6;
  return result;
}

uint64_t sub_25C0D2B6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (_OWORD *)v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1E0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1E8);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = sub_25C0E88CC(*(void *)v1, *(unsigned char *)(v1 + 8));
  if (!sub_25C0E9D54(v10 & 1, 0))
  {
    v21[0] = *(_OWORD *)(v1 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A588F18);
    sub_25C0EB388();
    if ((v22[0] & 1) == 0)
    {
      long long v11 = *(_OWORD *)(v1 + 32);
      v21[0] = *(_OWORD *)(v1 + 16);
      v21[1] = v11;
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1D8);
      MEMORY[0x26117CDA0](v22, v12);
      if (!v22[1])
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1F0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
        goto LABEL_6;
      }
      swift_bridgeObjectRelease();
    }
  }
  *(void *)unint64_t v6 = sub_25C0EAB38();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A200);
  sub_25C0D2DF0(v1, (uint64_t *)&v6[*(int *)(v13 + 44)]);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1F0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 0, 1, v14);
LABEL_6:
  sub_25C0516EC((uint64_t)v6, (uint64_t)v9, &qword_26A58A1E0);
  unint64_t v15 = (_OWORD *)swift_allocObject();
  long long v16 = v2[3];
  v15[3] = v2[2];
  v15[4] = v16;
  v15[5] = v2[4];
  *(_OWORD *)((char *)v15 + 89) = *(_OWORD *)((char *)v2 + 73);
  long long v17 = v2[1];
  v15[1] = *v2;
  v15[2] = v17;
  sub_25C02FB8C((uint64_t)v9, a1, &qword_26A58A1E8);
  uint64_t v18 = (uint64_t (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1F8) + 36));
  void *v18 = sub_25C0D4134;
  v18[1] = (uint64_t (*)())v15;
  v18[2] = 0;
  v18[3] = 0;
  sub_25C08944C((uint64_t)v2);
  return sub_25C02FBF0((uint64_t)v9, &qword_26A58A1E8);
}

uint64_t sub_25C0D2DF0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v141 = a2;
  uint64_t v140 = sub_25C0EA8B8();
  uint64_t v139 = *(void *)(v140 - 8);
  MEMORY[0x270FA5388](v140);
  uint64_t v138 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_25C0EA768();
  uint64_t v116 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  uint64_t v115 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2B0);
  uint64_t v111 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  long long v105 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2B8);
  MEMORY[0x270FA5388](v108);
  uint64_t v7 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2C0);
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v110 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2C8);
  MEMORY[0x270FA5388](v107);
  long long v109 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2D0);
  MEMORY[0x270FA5388](v103);
  long long v104 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2D8);
  MEMORY[0x270FA5388](v118);
  uint64_t v119 = (uint64_t)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2E0);
  MEMORY[0x270FA5388](v121);
  uint64_t v120 = (uint64_t)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2E8);
  uint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v122 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2F0);
  MEMORY[0x270FA5388](v131);
  uint64_t v125 = (uint64_t)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2F8);
  uint64_t v133 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  char v132 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A300);
  uint64_t v136 = *(void *)(v137 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v137);
  uint64_t v135 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v130 = (char *)&v103 - v19;
  MEMORY[0x270FA5388](v18);
  long long v142 = (char *)&v103 - v20;
  uint64_t v21 = *(void *)a1;
  char v22 = *(unsigned char *)(a1 + 8);
  LOBYTE(v153) = sub_25C0E89BC(*(void *)a1, v22);
  LOBYTE(v149) = 10;
  sub_25C0E25AC();
  char v23 = sub_25C0EB7A8();
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  if ((v23 & 1) == 0)
  {
    sub_25C0E7DC8(v21, v22, (uint64_t)&v153);
    long long v149 = v153;
    long long v150 = v154;
    char v151 = v155;
    uint64_t v152 = v156;
    uint64_t v24 = sub_25C026FAC();
    uint64_t v26 = v28 & 1;
  }
  uint64_t v126 = v26;
  uint64_t v127 = v27;
  uint64_t v128 = v25;
  uint64_t v129 = v24;
  sub_25C0E7DC8(v21, v22, (uint64_t)&v153);
  long long v149 = v153;
  long long v150 = v154;
  char v151 = v155;
  uint64_t v152 = v156;
  long long v29 = *(_OWORD *)(a1 + 32);
  long long v157 = *(_OWORD *)(a1 + 16);
  long long v158 = v29;
  long long v30 = *(_OWORD *)(a1 + 32);
  long long v143 = *(_OWORD *)(a1 + 16);
  long long v144 = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1D8);
  sub_25C0EB468();
  uint64_t v32 = v145;
  uint64_t v33 = v146;
  uint64_t v34 = v147;
  uint64_t v35 = v148;
  swift_getKeyPath();
  *(void *)&long long v143 = v32;
  *((void *)&v143 + 1) = v33;
  *(void *)&long long v144 = v34;
  *((void *)&v144 + 1) = v35;
  uint64_t v106 = v31;
  sub_25C0EB458();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  char v36 = sub_25C0E89BC(v21, v22);
  sub_25C08240C(v36, 10);
  uint64_t v37 = v105;
  sub_25C027148();
  char v38 = sub_25C0E89BC(v21, v22);
  if (sub_25C08240C(v38, 10)) {
    char v39 = 0;
  }
  else {
    char v39 = 2;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v41 = v111;
  uint64_t v42 = v112;
  (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v7, v37, v112);
  int v43 = &v7[*(int *)(v108 + 36)];
  *(void *)int v43 = KeyPath;
  v43[8] = v39;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v37, v42);
  int v44 = v115;
  sub_25C0EA758();
  sub_25C0E2600();
  int v45 = v110;
  sub_25C0EB088();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v44, v117);
  sub_25C02FBF0((uint64_t)v7, &qword_26A58A2B8);
  uint64_t v46 = sub_25C0EAF48();
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = v113;
  uint64_t v49 = (uint64_t)v109;
  uint64_t v50 = v114;
  (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v109, v45, v114);
  long long v51 = (uint64_t *)(v49 + *(int *)(v107 + 36));
  *long long v51 = v47;
  v51[1] = v46;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v50);
  BOOL v52 = sub_25C0E8858(v21, v22);
  if (sub_25C0E9D54(v52, 0)) {
    uint64_t v53 = sub_25C0EB2F8();
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v54 = (uint64_t)v104;
  uint64_t v55 = v103;
  uint64_t v56 = swift_getKeyPath();
  sub_25C02FB8C(v49, v54, &qword_26A58A2C8);
  uint64_t v57 = (uint64_t *)(v54 + *(int *)(v55 + 36));
  *uint64_t v57 = v56;
  v57[1] = v53;
  sub_25C02FBF0(v49, &qword_26A58A2C8);
  id v58 = sub_25C0E893C(v21, v22);
  uint64_t v59 = swift_getKeyPath();
  if (v58)
  {
    uint64_t v60 = sub_25C0EB858();
    uint64_t v62 = v61;
  }
  else
  {
    uint64_t v60 = 0;
    uint64_t v62 = 0;
  }
  uint64_t v63 = v119;
  sub_25C02FB8C(v54, v119, &qword_26A58A2D0);

  long long v64 = (uint64_t *)(v63 + *(int *)(v118 + 36));
  uint64_t *v64 = v59;
  v64[1] = v60;
  v64[2] = v62;
  sub_25C02FBF0(v54, &qword_26A58A2D0);
  BOOL v65 = sub_25C0E8858(v21, v22);
  BOOL v66 = sub_25C0E9D54(v65, 0);
  uint64_t v67 = swift_getKeyPath();
  uint64_t v68 = swift_allocObject();
  *(unsigned char *)(v68 + 16) = v66;
  uint64_t v69 = v120;
  sub_25C02FB8C(v63, v120, &qword_26A58A2D8);
  long long v70 = (uint64_t *)(v69 + *(int *)(v121 + 36));
  *long long v70 = v67;
  v70[1] = (uint64_t)sub_25C089874;
  v70[2] = v68;
  sub_25C02FBF0(v63, &qword_26A58A2D8);
  sub_25C0E8A2C(v21, v22);
  sub_25C0E26D4();
  long long v71 = v122;
  sub_25C0EB098();
  sub_25C02FBF0(v69, &qword_26A58A2E0);
  char v72 = sub_25C0E89BC(v21, v22);
  BOOL v73 = sub_25C08240C(v72, 10);
  if (v73) {
    uint64_t v74 = 7;
  }
  else {
    uint64_t v74 = 0;
  }
  uint64_t v75 = v125;
  sub_25C0D3DDC(v74, !v73, v125);
  (*(void (**)(char *, uint64_t))(v123 + 8))(v71, v124);
  long long v153 = v157;
  long long v154 = v158;
  MEMORY[0x26117CDA0](&v149, v106);
  long long v153 = v149;
  uint64_t v76 = (_OWORD *)swift_allocObject();
  long long v77 = *(_OWORD *)(a1 + 48);
  v76[3] = *(_OWORD *)(a1 + 32);
  v76[4] = v77;
  v76[5] = *(_OWORD *)(a1 + 64);
  *(_OWORD *)((char *)v76 + 89) = *(_OWORD *)(a1 + 73);
  long long v78 = *(_OWORD *)(a1 + 16);
  v76[1] = *(_OWORD *)a1;
  v76[2] = v78;
  sub_25C08944C(a1);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A588770);
  unint64_t v80 = sub_25C0E2B50();
  unint64_t v81 = sub_25C0E2C38();
  char v82 = v132;
  uint64_t v83 = v131;
  sub_25C0EB218();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25C02FBF0(v75, &qword_26A58A2F0);
  uint64_t v84 = (_OWORD *)swift_allocObject();
  long long v85 = *(_OWORD *)(a1 + 48);
  v84[3] = *(_OWORD *)(a1 + 32);
  v84[4] = v85;
  v84[5] = *(_OWORD *)(a1 + 64);
  *(_OWORD *)((char *)v84 + 89) = *(_OWORD *)(a1 + 73);
  long long v86 = *(_OWORD *)(a1 + 16);
  v84[1] = *(_OWORD *)a1;
  v84[2] = v86;
  sub_25C08944C(a1);
  char v87 = v138;
  sub_25C0EA8A8();
  *(void *)&long long v153 = v83;
  *((void *)&v153 + 1) = v79;
  *(void *)&long long v154 = v80;
  *((void *)&v154 + 1) = v81;
  swift_getOpaqueTypeConformance2();
  uint64_t v88 = v130;
  uint64_t v89 = v134;
  sub_25C0EB238();
  swift_release();
  (*(void (**)(char *, uint64_t))(v139 + 8))(v87, v140);
  (*(void (**)(char *, uint64_t))(v133 + 8))(v82, v89);
  uint64_t v90 = v136;
  uint64_t v91 = v142;
  char v92 = v88;
  uint64_t v93 = v137;
  (*(void (**)(char *, char *, uint64_t))(v136 + 32))(v142, v92, v137);
  uint64_t v94 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
  uint64_t v95 = v135;
  v94(v135, v91, v93);
  uint64_t v96 = v129;
  uint64_t v97 = v141;
  uint64_t v98 = v128;
  *long long v141 = v129;
  v97[1] = v98;
  LOBYTE(v75) = v126;
  uint64_t v99 = v127;
  v97[2] = v126;
  v97[3] = v99;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A350);
  v94((char *)v97 + *(int *)(v100 + 48), v95, v93);
  sub_25C0E2D64(v96, v98, v75, v99);
  long long v101 = *(void (**)(char *, uint64_t))(v90 + 8);
  v101(v142, v93);
  v101(v95, v93);
  return sub_25C0E2DA8(v96, v98, v75, v99);
}

uint64_t sub_25C0D3D0C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25C0D3D48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1[1];
  if (v3)
  {
    *a2 = *a1;
    a2[1] = v3;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0xE000000000000000;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C0D3D74(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    unint64_t v3 = 0;
  }
  *a2 = v4;
  a2[1] = v3;
  return result;
}

uint64_t sub_25C0D3DDC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  v24[0] = a1;
  v24[1] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A2E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A358);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A360);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v20(v8, v3, v5);
    v20(v11, (uint64_t)v8, v5);
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2E0);
    unint64_t v22 = sub_25C0E26D4();
    uint64_t v25 = v21;
    unint64_t v26 = v22;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v25 = v5;
    unint64_t v26 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_25C0EAD28();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2E0);
    unint64_t v17 = sub_25C0E26D4();
    uint64_t v25 = v16;
    unint64_t v26 = v17;
    uint64_t v18 = swift_getOpaqueTypeConformance2();
    sub_25C0EB258();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v15, v12);
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = v5;
    unint64_t v26 = v18;
    swift_getOpaqueTypeConformance2();
    sub_25C0EAD28();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_25C0D4134()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1D8);
  MEMORY[0x26117CDA0](&v3, v0);
  uint64_t v1 = v4;
  if (v4) {
    swift_bridgeObjectRelease();
  }
  LOBYTE(v3) = v1 != 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A588F18);
  return sub_25C0EB398();
}

uint64_t sub_25C0D41BC@<X0>(uint64_t a1@<X8>)
{
  return sub_25C0D2B6C(a1);
}

uint64_t sub_25C0D4208(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_25C0EBE08();
  uint64_t v3 = sub_25C0EB498();
  return a2(v3);
}

uint64_t sub_25C0D4260@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25C0EBF98();
  *a2 = v7;
  uint64_t v4 = (char *)a2 + *(int *)(type metadata accessor for CheckSelector() + 36);
  sub_25C0EBE08();
  uint64_t v5 = sub_25C0EB498();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
}

uint64_t sub_25C0D4318@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = *(void *)(a1 - 8);
  char v28 = (char *)&v27 - ((*(void *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(MEMORY[0x270FA5388](a1) + 16);
  uint64_t v5 = sub_25C0EBA48();
  uint64_t v36 = v5;
  uint64_t v30 = *(void *)(a1 + 24);
  uint64_t v34 = *(void *)(v30 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v35 = AssociatedTypeWitness;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A208);
  uint64_t v33 = v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v32 = WitnessTable;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v40 = v5;
  unint64_t v41 = AssociatedTypeWitness;
  uint64_t v42 = v7;
  uint64_t v43 = WitnessTable;
  uint64_t v44 = AssociatedConformanceWitness;
  uint64_t v10 = sub_25C0EB4B8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  long long v29 = (char *)&v27 - v15;
  uint64_t v39 = *v31;
  uint64_t v16 = v28;
  (*(void (**)(char *))(v3 + 16))(v28);
  unint64_t v17 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v30;
  *(void *)(v18 + 16) = v4;
  *(void *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v18 + v17, v16, a1);
  swift_bridgeObjectRetain();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A210);
  unint64_t v21 = sub_25C0D58C8();
  uint64_t v40 = v20;
  unint64_t v41 = v21;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_25C0EB4A8();
  uint64_t v38 = OpaqueTypeConformance2;
  swift_getWitnessTable();
  char v23 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v24 = v29;
  v23(v29, v14, v10);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v14, v10);
  v23(v37, v24, v10);
  return ((uint64_t (*)(char *, uint64_t))v25)(v24, v10);
}

uint64_t sub_25C0D46AC@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v36 = a5;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v34 = v10;
  uint64_t v35 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CheckSelector();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v31 - v14;
  uint64_t v16 = sub_25C0EAB38();
  uint64_t v17 = a1;
  uint64_t v18 = v33;
  sub_25C0D4980(v17, v33, a3, a4, (uint64_t *)&v37);
  char v19 = v38;
  long long v20 = v39;
  char v21 = v40;
  long long v22 = v37;
  long long v23 = v41;
  long long v37 = (unint64_t)v16;
  char v38 = 1;
  long long v39 = v22;
  char v40 = v19;
  long long v41 = v20;
  char v42 = v21;
  long long v43 = v23;
  char v44 = 0;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v18, v11);
  uint64_t v24 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v35, v32, a3);
  unint64_t v25 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v26 = (v13 + *(unsigned __int8 *)(v8 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v34;
  *(void *)(v27 + 16) = a3;
  *(void *)(v27 + 24) = v28;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v27 + v25, v15, v11);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v27 + v26, v24, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A210);
  sub_25C0D58C8();
  sub_25C0EB0A8();
  swift_release();
  uint64_t v29 = v43;
  sub_25C05CED4(v39, *((uint64_t *)&v39 + 1), v40);
  swift_bridgeObjectRelease();
  return sub_25C0E252C(v29);
}

uint64_t sub_25C0D4980@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  BOOL v65 = a5;
  BOOL v66 = a2;
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v53 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C0EBE08();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v55 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v14 = (char *)&v52 - v13;
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v60 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v52 - v18;
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v52 - v20;
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(a4 + 24))(&v72, a3, a4);
  long long v67 = v72;
  uint64_t v68 = v73;
  uint64_t v69 = v74;
  char v70 = v75;
  uint64_t v71 = v76;
  uint64_t v22 = sub_25C026FAC();
  uint64_t v62 = v23;
  uint64_t v63 = v22;
  int v61 = v24;
  uint64_t v64 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v21, a1, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v21, 0, 1, a3);
  uint64_t v54 = a4;
  uint64_t v26 = type metadata accessor for CheckSelector();
  sub_25C0D4208(v26, MEMORY[0x263F1B730]);
  uint64_t v56 = TupleTypeMetadata2;
  uint64_t v27 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v28 = v58;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v29(v14, v21, v10);
  uint64_t v59 = v27;
  uint64_t v30 = v27;
  uint64_t v31 = v10;
  v29(v30, v19, v10);
  uint64_t v57 = v8;
  uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  BOOL v66 = v14;
  if (v32(v14, 1, a3) != 1)
  {
    uint64_t v35 = v28;
    v29(v60, v66, v31);
    uint64_t v36 = v59;
    if (v32(v59, 1, a3) != 1)
    {
      uint64_t v38 = v57;
      long long v39 = v53;
      (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v53, v36, a3);
      char v40 = v60;
      char v41 = sub_25C0EB7A8();
      char v42 = *(void (**)(char *, uint64_t))(v38 + 8);
      v42(v39, a3);
      long long v43 = *(void (**)(char *, uint64_t))(v35 + 8);
      v43(v19, v31);
      v43(v21, v31);
      v42(v40, a3);
      v43(v66, v31);
      if (v41) {
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      goto LABEL_10;
    }
    uint64_t v33 = v66;
    long long v37 = *(void (**)(char *, uint64_t))(v28 + 8);
    v37(v19, v31);
    v37(v21, v31);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v60, a3);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v56);
    goto LABEL_9;
  }
  uint64_t v33 = v66;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v28 + 8);
  v34(v19, v31);
  v34(v21, v31);
  if (v32(v59, 1, a3) != 1) {
    goto LABEL_6;
  }
  v34(v33, v31);
LABEL_8:
  uint64_t v44 = sub_25C0EB328();
  uint64_t v45 = sub_25C0EB2E8();
LABEL_10:
  char v46 = v61 & 1;
  uint64_t v48 = v64;
  uint64_t v47 = v65;
  uint64_t v50 = v62;
  uint64_t v49 = v63;
  uint64_t *v65 = v63;
  v47[1] = v50;
  *((unsigned char *)v47 + 16) = v46;
  v47[3] = v48;
  v47[4] = 0;
  *((unsigned char *)v47 + 40) = 1;
  v47[6] = v44;
  v47[7] = v45;
  sub_25C05CE24(v49, v50, v46);
  swift_bridgeObjectRetain();
  sub_25C0E256C(v44);
  sub_25C0E252C(v44);
  sub_25C05CED4(v49, v50, v46);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C0D4F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25C0EBE08();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a2, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, a3);
  type metadata accessor for CheckSelector();
  sub_25C0D55CC((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_25C0D50D8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 2);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_26A5956C8 = (uint64_t)v0;
  return result;
}

uint64_t *sub_25C0D513C()
{
  if (qword_26A594810 != -1) {
    swift_once();
  }
  return &qword_26A5956C8;
}

uint64_t sub_25C0D5188()
{
  return MEMORY[0x26117C360]();
}

uint64_t sub_25C0D51AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C0D51CC(a1, a2, a3, a4, &qword_26A58A398, MEMORY[0x263F19408]);
}

uint64_t sub_25C0D51CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C02FB8C(a1, (uint64_t)v11, a5);
  return a6(v11);
}

char *sub_25C0D5270(char *a1, int64_t a2, char a3)
{
  id result = sub_25C0D5290(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25C0D5290(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A588A30);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8]) {
      memmove(v12, v13, 96 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_25C0D53AC(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  id result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

size_t sub_25C0D5588(void *a1)
{
  return sub_25C0D53AC(0, a1[2], 0, a1, &qword_26A589A40, (uint64_t (*)(void))type metadata accessor for Report.Message);
}

uint64_t sub_25C0D55CC(uint64_t a1)
{
  uint64_t v2 = sub_25C0EBE08();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v6 - v3, a1, v2);
  sub_25C0EB498();
  return sub_25C0EB448();
}

uint64_t type metadata accessor for CheckSelector()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C0D56D0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for CheckSelector() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v4 + v2[11];
  swift_release();
  swift_release();
  sub_25C0EBE08();
  uint64_t v7 = v6 + *(int *)(sub_25C0EB498() + 32);
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_25C0D582C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for CheckSelector() - 8);
  uint64_t v8 = (char *)(v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));

  return sub_25C0D46AC(a1, v8, v5, v6, a2);
}

unint64_t sub_25C0D58C8()
{
  unint64_t result = qword_26A58A218;
  if (!qword_26A58A218)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A210);
    sub_25C0583D0(&qword_26A58A220, &qword_26A58A228);
    sub_25C0583D0(&qword_26A58A230, &qword_26A58A238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A218);
  }
  return result;
}

uint64_t sub_25C0D598C(uint64_t a1)
{
  uint64_t result = sub_25C0CA704(&qword_26A5896B0, (void (*)(uint64_t))type metadata accessor for ReportOverviewScreen);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25C0D59E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5A00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5A1C(uint64_t a1)
{
  uint64_t result = sub_25C0CA704(&qword_26A58A0E0, (void (*)(uint64_t))type metadata accessor for _ReportOverviewScreen);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25C0D5A74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5A90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5AAC(uint64_t a1)
{
  uint64_t result = sub_25C0CA704(&qword_26A58A1B0, (void (*)(uint64_t))type metadata accessor for ReportTranscriptView);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25C0D5B04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5B20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0D5B3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_25C0D5B80(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    unint64_t v9 = (uint64_t *)((char *)a1 + v8);
    int64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for ReportScreen(0);
    swift_retain();
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v12 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
        {
          uint64_t v14 = type metadata accessor for Report.Authority(0);
          memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          uint64_t v21 = v10[1];
          *unint64_t v9 = *v10;
          v9[1] = v21;
          uint64_t v146 = v7;
          uint64_t v22 = v10[3];
          v9[2] = v10[2];
          v9[3] = v22;
          *((unsigned char *)v9 + 32) = *((unsigned char *)v10 + 32);
          uint64_t v141 = v13;
          uint64_t v23 = (void *)v10[6];
          v9[5] = v10[5];
          v9[6] = v23;
          uint64_t v24 = v10[8];
          v9[7] = v10[7];
          v9[8] = v24;
          uint64_t v25 = v10[10];
          v9[9] = v10[9];
          v9[10] = v25;
          *((unsigned char *)v9 + 88) = *((unsigned char *)v10 + 88);
          v9[12] = v10[12];
          uint64_t v26 = *(int *)(v12 + 28);
          uint64_t v137 = (char *)v10 + v26;
          uint64_t v139 = (char *)v9 + v26;
          uint64_t v27 = sub_25C0EA238();
          uint64_t v134 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
          swift_bridgeObjectRetain();
          uint64_t v7 = v146;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v28 = v23;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v134(v139, v137, v27);
          v134((char *)v9 + *(int *)(v12 + 32), (char *)v10 + *(int *)(v12 + 32), v27);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v141 + 56))(v9, 0, 1, v12);
        }
        goto LABEL_18;
      case 1u:
        uint64_t v15 = sub_25C0EA328();
        uint64_t v16 = *(void *)(v15 - 8);
        uint64_t v145 = v7;
        uint64_t v140 = v16;
        uint64_t v138 = v15;
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15))
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
          memcpy(v9, v10, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v9, v10, v15);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v15);
        }
        uint64_t v29 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v30 = v29[6];
        uint64_t v31 = (void *)((char *)v9 + v30);
        uint64_t v32 = (char *)v10 + v30;
        uint64_t v33 = *(void *)((char *)v10 + v30 + 8);
        *uint64_t v31 = *(void *)((char *)v10 + v30);
        v31[1] = v33;
        uint64_t v34 = *(void *)((char *)v10 + v30 + 24);
        v31[2] = *(void *)((char *)v10 + v30 + 16);
        v31[3] = v34;
        uint64_t v35 = *(void *)((char *)v10 + v30 + 40);
        v31[4] = *(void *)((char *)v10 + v30 + 32);
        v31[5] = v35;
        uint64_t v36 = *(void *)((char *)v10 + v30 + 56);
        v31[6] = *(void *)((char *)v10 + v30 + 48);
        v31[7] = v36;
        uint64_t v37 = *(void *)((char *)v10 + v30 + 72);
        v31[8] = *(void *)((char *)v10 + v30 + 64);
        v31[9] = v37;
        uint64_t v38 = *(void *)((char *)v10 + v30 + 88);
        v31[10] = *(void *)((char *)v10 + v30 + 80);
        v31[11] = v38;
        uint64_t v39 = *(void *)((char *)v10 + v30 + 104);
        v31[12] = *(void *)((char *)v10 + v30 + 96);
        v31[13] = v39;
        uint64_t v40 = *(void *)((char *)v10 + v30 + 120);
        v31[14] = *(void *)((char *)v10 + v30 + 112);
        v31[15] = v40;
        uint64_t v41 = *(void *)((char *)v10 + v30 + 136);
        v31[16] = *(void *)((char *)v10 + v30 + 128);
        v31[17] = v41;
        uint64_t v42 = *(void *)((char *)v10 + v30 + 152);
        v31[18] = *(void *)((char *)v10 + v30 + 144);
        v31[19] = v42;
        uint64_t v43 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
        unint64_t v130 = &v32[v43];
        uint64_t v131 = (char *)v31 + v43;
        uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v140 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v44(v131, v130, v138);
        *(void *)((char *)v9 + v29[7]) = *(void *)((char *)v10 + v29[7]);
        *(void *)((char *)v9 + v29[8]) = *(void *)((char *)v10 + v29[8]);
        uint64_t v45 = v29[9];
        char v46 = (void *)((char *)v9 + v45);
        uint64_t v47 = (void *)((char *)v10 + v45);
        uint64_t v48 = v47[1];
        *char v46 = *v47;
        v46[1] = v48;
        *((unsigned char *)v9 + v29[10]) = *((unsigned char *)v10 + v29[10]);
        *((unsigned char *)v9 + v29[11]) = *((unsigned char *)v10 + v29[11]);
        uint64_t v49 = v29[12];
        uint64_t v50 = (void *)((char *)v9 + v49);
        long long v51 = (void *)((char *)v10 + v49);
        uint64_t v52 = v51[1];
        *uint64_t v50 = *v51;
        v50[1] = v52;
        *(void *)((char *)v9 + v29[13]) = *(void *)((char *)v10 + v29[13]);
        uint64_t v53 = v29[14];
        long long v142 = (char *)v9 + v53;
        uint64_t v54 = (void *)((char *)v10 + v53);
        unint64_t v55 = *(void *)((char *)v10 + v53 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v55 >> 60 == 15)
        {
          *(_OWORD *)long long v142 = *(_OWORD *)v54;
        }
        else
        {
          uint64_t v56 = *v54;
          sub_25C034EC8(*v54, v55);
          *(void *)long long v142 = v56;
          *((void *)v142 + 1) = v55;
        }
        uint64_t v7 = v145;
        uint64_t v57 = v29[15];
        uint64_t v58 = (void *)((char *)v9 + v57);
        uint64_t v59 = (void *)((char *)v10 + v57);
        uint64_t v60 = v59[1];
        void *v58 = *v59;
        v58[1] = v60;
        *(void *)((char *)v9 + v29[16]) = *(void *)((char *)v10 + v29[16]);
        uint64_t v61 = v29[17];
        uint64_t v62 = (void *)((char *)v9 + v61);
        uint64_t v63 = (void *)((char *)v10 + v61);
        uint64_t v64 = v63[1];
        *uint64_t v62 = *v63;
        v62[1] = v64;
        uint64_t v65 = v29[18];
        BOOL v66 = (void *)((char *)v9 + v65);
        long long v67 = (void *)((char *)v10 + v65);
        uint64_t v68 = v67[1];
        *BOOL v66 = *v67;
        v66[1] = v68;
        *(void *)((char *)v9 + v29[19]) = *(void *)((char *)v10 + v29[19]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 2u:
        uint64_t v18 = (void *)*v10;
        *unint64_t v9 = *v10;
        id v19 = v18;
        goto LABEL_18;
      case 3u:
        uint64_t v20 = v10[1];
        *unint64_t v9 = *v10;
        v9[1] = v20;
        swift_bridgeObjectRetain();
LABEL_18:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        break;
    }
    uint64_t v69 = a3[6];
    uint64_t v70 = a3[7];
    uint64_t v71 = (uint64_t *)((char *)v7 + v69);
    long long v72 = (uint64_t *)((char *)a2 + v69);
    uint64_t v73 = v72[1];
    *uint64_t v71 = *v72;
    v71[1] = v73;
    uint64_t v74 = (char *)v7 + v70;
    char v75 = (char *)a2 + v70;
    *uint64_t v74 = *v75;
    *((void *)v74 + 1) = *((void *)v75 + 1);
    uint64_t v76 = a3[8];
    long long v77 = (char *)v7 + v76;
    long long v78 = (char *)a2 + v76;
    uint64_t v79 = type metadata accessor for ReportOverviewScreen._Alert(0);
    uint64_t v80 = *(void *)(v79 - 8);
    unint64_t v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48);
    swift_retain();
    swift_retain();
    if (v81(v78, 1, v79))
    {
      uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
      memcpy(v77, v78, *(void *)(*(void *)(v82 - 8) + 64));
    }
    else
    {
      uint64_t v83 = sub_25C0EA328();
      uint64_t v84 = *(void *)(v83 - 8);
      uint64_t v147 = v7;
      uint64_t v132 = v80;
      uint64_t v133 = v79;
      uint64_t v143 = v83;
      uint64_t v144 = v84;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(v78, 1, v83))
      {
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
        memcpy(v77, v78, *(void *)(*(void *)(v85 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v77, v78, v83);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v77, 0, 1, v83);
      }
      long long v86 = (int *)type metadata accessor for Report.Evidence(0);
      uint64_t v87 = v86[6];
      uint64_t v88 = &v77[v87];
      uint64_t v89 = &v78[v87];
      uint64_t v90 = *(void *)&v78[v87 + 8];
      *(void *)uint64_t v88 = *(void *)&v78[v87];
      *((void *)v88 + 1) = v90;
      uint64_t v91 = *(void *)&v78[v87 + 24];
      *((void *)v88 + 2) = *(void *)&v78[v87 + 16];
      *((void *)v88 + 3) = v91;
      uint64_t v92 = *(void *)&v78[v87 + 40];
      *((void *)v88 + 4) = *(void *)&v78[v87 + 32];
      *((void *)v88 + 5) = v92;
      uint64_t v93 = *(void *)&v78[v87 + 56];
      *((void *)v88 + 6) = *(void *)&v78[v87 + 48];
      *((void *)v88 + 7) = v93;
      uint64_t v94 = *(void *)&v78[v87 + 72];
      *((void *)v88 + 8) = *(void *)&v78[v87 + 64];
      *((void *)v88 + 9) = v94;
      uint64_t v95 = *(void *)&v78[v87 + 88];
      *((void *)v88 + 10) = *(void *)&v78[v87 + 80];
      *((void *)v88 + 11) = v95;
      uint64_t v96 = *(void *)&v78[v87 + 104];
      *((void *)v88 + 12) = *(void *)&v78[v87 + 96];
      *((void *)v88 + 13) = v96;
      uint64_t v97 = *(void *)&v78[v87 + 120];
      *((void *)v88 + 14) = *(void *)&v78[v87 + 112];
      *((void *)v88 + 15) = v97;
      uint64_t v98 = *(void *)&v78[v87 + 136];
      *((void *)v88 + 16) = *(void *)&v78[v87 + 128];
      *((void *)v88 + 17) = v98;
      uint64_t v99 = *(void *)&v78[v87 + 152];
      *((void *)v88 + 18) = *(void *)&v78[v87 + 144];
      *((void *)v88 + 19) = v99;
      uint64_t v100 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
      uint64_t v135 = &v89[v100];
      uint64_t v136 = &v88[v100];
      long long v101 = *(void (**)(char *, char *, uint64_t))(v144 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v101(v136, v135, v143);
      *(void *)&v77[v86[7]] = *(void *)&v78[v86[7]];
      *(void *)&v77[v86[8]] = *(void *)&v78[v86[8]];
      uint64_t v102 = v86[9];
      uint64_t v103 = &v77[v102];
      long long v104 = &v78[v102];
      uint64_t v105 = *((void *)v104 + 1);
      *(void *)uint64_t v103 = *(void *)v104;
      *((void *)v103 + 1) = v105;
      v77[v86[10]] = v78[v86[10]];
      v77[v86[11]] = v78[v86[11]];
      uint64_t v106 = v86[12];
      uint64_t v107 = &v77[v106];
      uint64_t v108 = &v78[v106];
      uint64_t v109 = *((void *)v108 + 1);
      *(void *)uint64_t v107 = *(void *)v108;
      *((void *)v107 + 1) = v109;
      *(void *)&v77[v86[13]] = *(void *)&v78[v86[13]];
      uint64_t v110 = v86[14];
      uint64_t v111 = &v77[v110];
      uint64_t v112 = (uint64_t *)&v78[v110];
      unint64_t v113 = *(void *)&v78[v110 + 8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v113 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v111 = *(_OWORD *)v112;
      }
      else
      {
        uint64_t v114 = *v112;
        sub_25C034EC8(*v112, v113);
        *(void *)uint64_t v111 = v114;
        *((void *)v111 + 1) = v113;
      }
      uint64_t v7 = v147;
      uint64_t v115 = v86[15];
      uint64_t v116 = &v77[v115];
      uint64_t v117 = &v78[v115];
      uint64_t v118 = *((void *)v117 + 1);
      *(void *)uint64_t v116 = *(void *)v117;
      *((void *)v116 + 1) = v118;
      *(void *)&v77[v86[16]] = *(void *)&v78[v86[16]];
      uint64_t v119 = v86[17];
      uint64_t v120 = &v77[v119];
      uint64_t v121 = &v78[v119];
      uint64_t v122 = *((void *)v121 + 1);
      *(void *)uint64_t v120 = *(void *)v121;
      *((void *)v120 + 1) = v122;
      uint64_t v123 = v86[18];
      uint64_t v124 = &v77[v123];
      uint64_t v125 = &v78[v123];
      uint64_t v126 = *((void *)v125 + 1);
      *(void *)uint64_t v124 = *(void *)v125;
      *((void *)v124 + 1) = v126;
      *(void *)&v77[v86[19]] = *(void *)&v78[v86[19]];
      uint64_t v127 = *(void (**)(char *, void, uint64_t, uint64_t))(v132 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v127(v77, 0, 1, v133);
    }
    uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
    *(void *)&v77[*(int *)(v128 + 28)] = *(void *)&v78[*(int *)(v128 + 28)];
  }
  swift_retain();
  return v7;
}

uint64_t sub_25C0D6634(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = (id *)(a1 + *(int *)(a2 + 20));
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v5 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = (char *)v4 + *(int *)(v5 + 28);
        uint64_t v7 = sub_25C0EA238();
        uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(v6, v7);
        v8((char *)v4 + *(int *)(v5 + 32), v7);
      }
      break;
    case 1u:
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v9)) {
        (*(void (**)(id *, uint64_t))(v10 + 8))(v4, v9);
      }
      uint64_t v11 = type metadata accessor for Report.Evidence(0);
      uint64_t v12 = (char *)v4 + *(int *)(v11 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v10 + 8))(&v12[*(int *)(v13 + 40)], v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)((char *)v4 + *(int *)(v11 + 56));
      unint64_t v15 = v14[1];
      if (v15 >> 60 != 15) {
        sub_25C035294(*v14, v15);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  swift_release();
  swift_release();
  uint64_t v16 = a1 + *(int *)(a2 + 32);
  uint64_t v17 = type metadata accessor for ReportOverviewScreen._Alert(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17))
  {
    uint64_t v18 = sub_25C0EA328();
    uint64_t v19 = *(void *)(v18 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18)) {
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
    }
    uint64_t v20 = type metadata accessor for Report.Evidence(0);
    uint64_t v21 = v16 + *(int *)(v20 + 24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21 + *(int *)(v22 + 40), v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = (uint64_t *)(v16 + *(int *)(v20 + 56));
    unint64_t v24 = v23[1];
    if (v24 >> 60 != 15) {
      sub_25C035294(*v23, v24);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);

  return swift_release();
}

void *sub_25C0D6B8C(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for ReportScreen(0);
  swift_retain();
  swift_retain();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v11 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
      {
        uint64_t v13 = type metadata accessor for Report.Authority(0);
        memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        uint64_t v20 = v9[1];
        *uint64_t v8 = *v9;
        v8[1] = v20;
        uint64_t v145 = v5;
        uint64_t v21 = v9[3];
        v8[2] = v9[2];
        v8[3] = v21;
        *((unsigned char *)v8 + 32) = *((unsigned char *)v9 + 32);
        uint64_t v140 = v12;
        uint64_t v22 = (void *)v9[6];
        v8[5] = v9[5];
        v8[6] = v22;
        uint64_t v23 = v9[8];
        v8[7] = v9[7];
        v8[8] = v23;
        uint64_t v24 = v9[10];
        v8[9] = v9[9];
        v8[10] = v24;
        *((unsigned char *)v8 + 88) = *((unsigned char *)v9 + 88);
        v8[12] = v9[12];
        uint64_t v25 = *(int *)(v11 + 28);
        uint64_t v136 = (char *)v9 + v25;
        uint64_t v138 = (char *)v8 + v25;
        uint64_t v26 = sub_25C0EA238();
        uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
        swift_bridgeObjectRetain();
        uint64_t v5 = v145;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v27 = v22;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v133(v138, v136, v26);
        v133((char *)v8 + *(int *)(v11 + 32), (char *)v9 + *(int *)(v11 + 32), v26);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v140 + 56))(v8, 0, 1, v11);
      }
      goto LABEL_16;
    case 1u:
      uint64_t v14 = sub_25C0EA328();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v144 = v5;
      uint64_t v139 = v15;
      uint64_t v137 = v14;
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
        memcpy(v8, v9, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v8, v9, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v8, 0, 1, v14);
      }
      id v28 = (int *)type metadata accessor for Report.Evidence(0);
      uint64_t v29 = v28[6];
      uint64_t v30 = (void *)((char *)v8 + v29);
      uint64_t v31 = (char *)v9 + v29;
      uint64_t v32 = *(void *)((char *)v9 + v29 + 8);
      void *v30 = *(void *)((char *)v9 + v29);
      v30[1] = v32;
      uint64_t v33 = *(void *)((char *)v9 + v29 + 24);
      v30[2] = *(void *)((char *)v9 + v29 + 16);
      v30[3] = v33;
      uint64_t v34 = *(void *)((char *)v9 + v29 + 40);
      v30[4] = *(void *)((char *)v9 + v29 + 32);
      v30[5] = v34;
      uint64_t v35 = *(void *)((char *)v9 + v29 + 56);
      v30[6] = *(void *)((char *)v9 + v29 + 48);
      v30[7] = v35;
      uint64_t v36 = *(void *)((char *)v9 + v29 + 72);
      v30[8] = *(void *)((char *)v9 + v29 + 64);
      v30[9] = v36;
      uint64_t v37 = *(void *)((char *)v9 + v29 + 88);
      v30[10] = *(void *)((char *)v9 + v29 + 80);
      v30[11] = v37;
      uint64_t v38 = *(void *)((char *)v9 + v29 + 104);
      v30[12] = *(void *)((char *)v9 + v29 + 96);
      v30[13] = v38;
      uint64_t v39 = *(void *)((char *)v9 + v29 + 120);
      v30[14] = *(void *)((char *)v9 + v29 + 112);
      v30[15] = v39;
      uint64_t v40 = *(void *)((char *)v9 + v29 + 136);
      v30[16] = *(void *)((char *)v9 + v29 + 128);
      v30[17] = v40;
      uint64_t v41 = *(void *)((char *)v9 + v29 + 152);
      v30[18] = *(void *)((char *)v9 + v29 + 144);
      v30[19] = v41;
      uint64_t v42 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
      uint64_t v129 = &v31[v42];
      unint64_t v130 = (char *)v30 + v42;
      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v139 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v43(v130, v129, v137);
      *(void *)((char *)v8 + v28[7]) = *(void *)((char *)v9 + v28[7]);
      *(void *)((char *)v8 + v28[8]) = *(void *)((char *)v9 + v28[8]);
      uint64_t v44 = v28[9];
      uint64_t v45 = (void *)((char *)v8 + v44);
      char v46 = (void *)((char *)v9 + v44);
      uint64_t v47 = v46[1];
      *uint64_t v45 = *v46;
      v45[1] = v47;
      *((unsigned char *)v8 + v28[10]) = *((unsigned char *)v9 + v28[10]);
      *((unsigned char *)v8 + v28[11]) = *((unsigned char *)v9 + v28[11]);
      uint64_t v48 = v28[12];
      uint64_t v49 = (void *)((char *)v8 + v48);
      uint64_t v50 = (void *)((char *)v9 + v48);
      uint64_t v51 = v50[1];
      *uint64_t v49 = *v50;
      v49[1] = v51;
      *(void *)((char *)v8 + v28[13]) = *(void *)((char *)v9 + v28[13]);
      uint64_t v52 = v28[14];
      uint64_t v141 = (char *)v8 + v52;
      uint64_t v53 = (void *)((char *)v9 + v52);
      unint64_t v54 = *(void *)((char *)v9 + v52 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v54 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v141 = *(_OWORD *)v53;
      }
      else
      {
        uint64_t v55 = *v53;
        sub_25C034EC8(*v53, v54);
        *(void *)uint64_t v141 = v55;
        *((void *)v141 + 1) = v54;
      }
      uint64_t v5 = v144;
      uint64_t v56 = v28[15];
      uint64_t v57 = (void *)((char *)v8 + v56);
      uint64_t v58 = (void *)((char *)v9 + v56);
      uint64_t v59 = v58[1];
      *uint64_t v57 = *v58;
      v57[1] = v59;
      *(void *)((char *)v8 + v28[16]) = *(void *)((char *)v9 + v28[16]);
      uint64_t v60 = v28[17];
      uint64_t v61 = (void *)((char *)v8 + v60);
      uint64_t v62 = (void *)((char *)v9 + v60);
      uint64_t v63 = v62[1];
      *uint64_t v61 = *v62;
      v61[1] = v63;
      uint64_t v64 = v28[18];
      uint64_t v65 = (void *)((char *)v8 + v64);
      BOOL v66 = (void *)((char *)v9 + v64);
      uint64_t v67 = v66[1];
      void *v65 = *v66;
      v65[1] = v67;
      *(void *)((char *)v8 + v28[19]) = *(void *)((char *)v9 + v28[19]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_16;
    case 2u:
      uint64_t v17 = (void *)*v9;
      *uint64_t v8 = *v9;
      id v18 = v17;
      goto LABEL_16;
    case 3u:
      uint64_t v19 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v19;
      swift_bridgeObjectRetain();
LABEL_16:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
      break;
  }
  uint64_t v68 = a3[6];
  uint64_t v69 = a3[7];
  uint64_t v70 = (void *)((char *)v5 + v68);
  uint64_t v71 = (void *)((char *)a2 + v68);
  uint64_t v72 = v71[1];
  *uint64_t v70 = *v71;
  v70[1] = v72;
  uint64_t v73 = (char *)v5 + v69;
  uint64_t v74 = (char *)a2 + v69;
  *uint64_t v73 = *v74;
  *((void *)v73 + 1) = *((void *)v74 + 1);
  uint64_t v75 = a3[8];
  uint64_t v76 = (char *)v5 + v75;
  long long v77 = (char *)a2 + v75;
  uint64_t v78 = type metadata accessor for ReportOverviewScreen._Alert(0);
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48);
  swift_retain();
  swift_retain();
  if (v80(v77, 1, v78))
  {
    uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
    memcpy(v76, v77, *(void *)(*(void *)(v81 - 8) + 64));
  }
  else
  {
    uint64_t v82 = sub_25C0EA328();
    uint64_t v83 = *(void *)(v82 - 8);
    uint64_t v146 = v5;
    uint64_t v131 = v79;
    uint64_t v132 = v78;
    uint64_t v142 = v82;
    uint64_t v143 = v83;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v77, 1, v82))
    {
      uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(v76, v77, *(void *)(*(void *)(v84 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v76, v77, v82);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56))(v76, 0, 1, v82);
    }
    uint64_t v85 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v86 = v85[6];
    uint64_t v87 = &v76[v86];
    uint64_t v88 = &v77[v86];
    uint64_t v89 = *(void *)&v77[v86 + 8];
    *(void *)uint64_t v87 = *(void *)&v77[v86];
    *((void *)v87 + 1) = v89;
    uint64_t v90 = *(void *)&v77[v86 + 24];
    *((void *)v87 + 2) = *(void *)&v77[v86 + 16];
    *((void *)v87 + 3) = v90;
    uint64_t v91 = *(void *)&v77[v86 + 40];
    *((void *)v87 + 4) = *(void *)&v77[v86 + 32];
    *((void *)v87 + 5) = v91;
    uint64_t v92 = *(void *)&v77[v86 + 56];
    *((void *)v87 + 6) = *(void *)&v77[v86 + 48];
    *((void *)v87 + 7) = v92;
    uint64_t v93 = *(void *)&v77[v86 + 72];
    *((void *)v87 + 8) = *(void *)&v77[v86 + 64];
    *((void *)v87 + 9) = v93;
    uint64_t v94 = *(void *)&v77[v86 + 88];
    *((void *)v87 + 10) = *(void *)&v77[v86 + 80];
    *((void *)v87 + 11) = v94;
    uint64_t v95 = *(void *)&v77[v86 + 104];
    *((void *)v87 + 12) = *(void *)&v77[v86 + 96];
    *((void *)v87 + 13) = v95;
    uint64_t v96 = *(void *)&v77[v86 + 120];
    *((void *)v87 + 14) = *(void *)&v77[v86 + 112];
    *((void *)v87 + 15) = v96;
    uint64_t v97 = *(void *)&v77[v86 + 136];
    *((void *)v87 + 16) = *(void *)&v77[v86 + 128];
    *((void *)v87 + 17) = v97;
    uint64_t v98 = *(void *)&v77[v86 + 152];
    *((void *)v87 + 18) = *(void *)&v77[v86 + 144];
    *((void *)v87 + 19) = v98;
    uint64_t v99 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
    uint64_t v134 = &v88[v99];
    uint64_t v135 = &v87[v99];
    uint64_t v100 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v100(v135, v134, v142);
    *(void *)&v76[v85[7]] = *(void *)&v77[v85[7]];
    *(void *)&v76[v85[8]] = *(void *)&v77[v85[8]];
    uint64_t v101 = v85[9];
    uint64_t v102 = &v76[v101];
    uint64_t v103 = &v77[v101];
    uint64_t v104 = *((void *)v103 + 1);
    *(void *)uint64_t v102 = *(void *)v103;
    *((void *)v102 + 1) = v104;
    v76[v85[10]] = v77[v85[10]];
    v76[v85[11]] = v77[v85[11]];
    uint64_t v105 = v85[12];
    uint64_t v106 = &v76[v105];
    uint64_t v107 = &v77[v105];
    uint64_t v108 = *((void *)v107 + 1);
    *(void *)uint64_t v106 = *(void *)v107;
    *((void *)v106 + 1) = v108;
    *(void *)&v76[v85[13]] = *(void *)&v77[v85[13]];
    uint64_t v109 = v85[14];
    uint64_t v110 = &v76[v109];
    uint64_t v111 = (uint64_t *)&v77[v109];
    unint64_t v112 = *(void *)&v77[v109 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v112 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v110 = *(_OWORD *)v111;
    }
    else
    {
      uint64_t v113 = *v111;
      sub_25C034EC8(*v111, v112);
      *(void *)uint64_t v110 = v113;
      *((void *)v110 + 1) = v112;
    }
    uint64_t v5 = v146;
    uint64_t v114 = v85[15];
    uint64_t v115 = &v76[v114];
    uint64_t v116 = &v77[v114];
    uint64_t v117 = *((void *)v116 + 1);
    *(void *)uint64_t v115 = *(void *)v116;
    *((void *)v115 + 1) = v117;
    *(void *)&v76[v85[16]] = *(void *)&v77[v85[16]];
    uint64_t v118 = v85[17];
    uint64_t v119 = &v76[v118];
    uint64_t v120 = &v77[v118];
    uint64_t v121 = *((void *)v120 + 1);
    *(void *)uint64_t v119 = *(void *)v120;
    *((void *)v119 + 1) = v121;
    uint64_t v122 = v85[18];
    uint64_t v123 = &v76[v122];
    uint64_t v124 = &v77[v122];
    uint64_t v125 = *((void *)v124 + 1);
    *(void *)uint64_t v123 = *(void *)v124;
    *((void *)v123 + 1) = v125;
    *(void *)&v76[v85[19]] = *(void *)&v77[v85[19]];
    uint64_t v126 = *(void (**)(char *, void, uint64_t, uint64_t))(v131 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v126(v76, 0, 1, v132);
  }
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  *(void *)&v76[*(int *)(v127 + 28)] = *(void *)&v77[*(int *)(v127 + 28)];
  swift_retain();
  return v5;
}

void *sub_25C0D75F0(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a1;
  *a1 = *a2;
  swift_retain();
  swift_release();
  v5[1] = a2[1];
  swift_retain();
  swift_release();
  if (v5 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)v5 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_25C0D14C8((uint64_t)v5 + v6, type metadata accessor for ReportScreen);
    uint64_t v9 = type metadata accessor for ReportScreen(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v10 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
        {
          uint64_t v12 = type metadata accessor for Report.Authority(0);
          memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          *uint64_t v7 = *v8;
          v7[1] = v8[1];
          v7[2] = v8[2];
          v7[3] = v8[3];
          *((unsigned char *)v7 + 32) = *((unsigned char *)v8 + 32);
          v7[5] = v8[5];
          uint64_t v139 = v11;
          id v18 = (void *)v8[6];
          v7[6] = v18;
          v7[7] = v8[7];
          v7[8] = v8[8];
          v7[9] = v8[9];
          v7[10] = v8[10];
          *((unsigned char *)v7 + 88) = *((unsigned char *)v8 + 88);
          v7[12] = v8[12];
          uint64_t v19 = *(int *)(v10 + 28);
          uint64_t v134 = (char *)v8 + v19;
          uint64_t v136 = (char *)v7 + v19;
          uint64_t v20 = sub_25C0EA238();
          uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v21 = v18;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v133(v136, v134, v20);
          v133((char *)v7 + *(int *)(v10 + 32), (char *)v8 + *(int *)(v10 + 32), v20);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v139 + 56))(v7, 0, 1, v10);
        }
        goto LABEL_17;
      case 1u:
        uint64_t v13 = sub_25C0EA328();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v138 = v14;
        uint64_t v135 = v13;
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
          memcpy(v7, v8, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v7, v8, v13);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
        }
        uint64_t v22 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v23 = v22[6];
        uint64_t v24 = (void *)((char *)v7 + v23);
        uint64_t v25 = (char *)v8 + v23;
        *uint64_t v24 = *(void *)((char *)v8 + v23);
        v24[1] = *(void *)((char *)v8 + v23 + 8);
        void v24[2] = *(void *)((char *)v8 + v23 + 16);
        v24[3] = *(void *)((char *)v8 + v23 + 24);
        v24[4] = *(void *)((char *)v8 + v23 + 32);
        v24[5] = *(void *)((char *)v8 + v23 + 40);
        v24[6] = *(void *)((char *)v8 + v23 + 48);
        v24[7] = *(void *)((char *)v8 + v23 + 56);
        v24[8] = *(void *)((char *)v8 + v23 + 64);
        v24[9] = *(void *)((char *)v8 + v23 + 72);
        v24[10] = *(void *)((char *)v8 + v23 + 80);
        v24[11] = *(void *)((char *)v8 + v23 + 88);
        v24[12] = *(void *)((char *)v8 + v23 + 96);
        v24[13] = *(void *)((char *)v8 + v23 + 104);
        v24[14] = *(void *)((char *)v8 + v23 + 112);
        v24[15] = *(void *)((char *)v8 + v23 + 120);
        v24[16] = *(void *)((char *)v8 + v23 + 128);
        v24[17] = *(void *)((char *)v8 + v23 + 136);
        v24[18] = *(void *)((char *)v8 + v23 + 144);
        v24[19] = *(void *)((char *)v8 + v23 + 152);
        uint64_t v26 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
        uint64_t v129 = &v25[v26];
        unint64_t v130 = (char *)v24 + v26;
        id v27 = *(void (**)(char *, char *, uint64_t))(v138 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27(v130, v129, v135);
        *(void *)((char *)v7 + v22[7]) = *(void *)((char *)v8 + v22[7]);
        *(void *)((char *)v7 + v22[8]) = *(void *)((char *)v8 + v22[8]);
        uint64_t v28 = v22[9];
        uint64_t v29 = (void *)((char *)v7 + v28);
        uint64_t v30 = (void *)((char *)v8 + v28);
        *uint64_t v29 = *v30;
        v29[1] = v30[1];
        *((unsigned char *)v7 + v22[10]) = *((unsigned char *)v8 + v22[10]);
        *((unsigned char *)v7 + v22[11]) = *((unsigned char *)v8 + v22[11]);
        uint64_t v31 = v22[12];
        uint64_t v32 = (void *)((char *)v7 + v31);
        uint64_t v33 = (void *)((char *)v8 + v31);
        *uint64_t v32 = *v33;
        v32[1] = v33[1];
        *(void *)((char *)v7 + v22[13]) = *(void *)((char *)v8 + v22[13]);
        uint64_t v34 = v22[14];
        uint64_t v140 = (char *)v7 + v34;
        uint64_t v35 = (void *)((char *)v8 + v34);
        unint64_t v36 = *(void *)((char *)v8 + v34 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v36 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v140 = *(_OWORD *)v35;
        }
        else
        {
          uint64_t v37 = *v35;
          sub_25C034EC8(*v35, v36);
          *(void *)uint64_t v140 = v37;
          *((void *)v140 + 1) = v36;
        }
        uint64_t v38 = v22[15];
        uint64_t v39 = (void *)((char *)v7 + v38);
        uint64_t v40 = (void *)((char *)v8 + v38);
        *uint64_t v39 = *v40;
        v39[1] = v40[1];
        *(void *)((char *)v7 + v22[16]) = *(void *)((char *)v8 + v22[16]);
        uint64_t v41 = v22[17];
        uint64_t v42 = (void *)((char *)v7 + v41);
        uint64_t v43 = (void *)((char *)v8 + v41);
        *uint64_t v42 = *v43;
        v42[1] = v43[1];
        uint64_t v44 = v22[18];
        uint64_t v45 = (void *)((char *)v7 + v44);
        char v46 = (void *)((char *)v8 + v44);
        *uint64_t v45 = *v46;
        v45[1] = v46[1];
        *(void *)((char *)v7 + v22[19]) = *(void *)((char *)v8 + v22[19]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_17;
      case 2u:
        uint64_t v16 = (void *)*v8;
        *uint64_t v7 = *v8;
        id v17 = v16;
        goto LABEL_17;
      case 3u:
        *uint64_t v7 = *v8;
        v7[1] = v8[1];
        swift_bridgeObjectRetain();
LABEL_17:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
        break;
    }
  }
  uint64_t v47 = a3[6];
  uint64_t v48 = (void *)((char *)v5 + v47);
  uint64_t v49 = (void *)((char *)a2 + v47);
  uint64_t v50 = v49[1];
  *uint64_t v48 = *v49;
  v48[1] = v50;
  swift_retain();
  swift_release();
  uint64_t v51 = a3[7];
  uint64_t v52 = (char *)v5 + v51;
  uint64_t v53 = (char *)a2 + v51;
  *uint64_t v52 = *v53;
  *((void *)v52 + 1) = *((void *)v53 + 1);
  swift_retain();
  swift_release();
  uint64_t v54 = a3[8];
  uint64_t v55 = (char *)v5 + v54;
  uint64_t v56 = (char *)a2 + v54;
  uint64_t v57 = type metadata accessor for ReportOverviewScreen._Alert(0);
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v59 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v58 + 48);
  int v60 = v59(v55, 1, v57);
  int v61 = v59(v56, 1, v57);
  if (!v60)
  {
    if (v61)
    {
      sub_25C0D14C8((uint64_t)v55, type metadata accessor for ReportOverviewScreen._Alert);
      goto LABEL_24;
    }
    uint64_t v66 = sub_25C0EA328();
    uint64_t v67 = *(void *)(v66 - 8);
    uint64_t v68 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v67 + 48);
    int v69 = v68(v55, 1, v66);
    int v70 = v68(v56, 1, v66);
    if (v69)
    {
      if (!v70)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v67 + 16))(v55, v56, v66);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v67 + 56))(v55, 0, 1, v66);
        goto LABEL_36;
      }
    }
    else
    {
      if (!v70)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v67 + 24))(v55, v56, v66);
LABEL_36:
        uint64_t v99 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v100 = v99[6];
        uint64_t v101 = &v55[v100];
        uint64_t v102 = &v56[v100];
        *(void *)uint64_t v101 = *(void *)&v56[v100];
        *((void *)v101 + 1) = *(void *)&v56[v100 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 2) = *((void *)v102 + 2);
        *((void *)v101 + 3) = *((void *)v102 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 4) = *((void *)v102 + 4);
        *((void *)v101 + 5) = *((void *)v102 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 6) = *((void *)v102 + 6);
        *((void *)v101 + 7) = *((void *)v102 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 8) = *((void *)v102 + 8);
        *((void *)v101 + 9) = *((void *)v102 + 9);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 10) = *((void *)v102 + 10);
        *((void *)v101 + 11) = *((void *)v102 + 11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 12) = *((void *)v102 + 12);
        *((void *)v101 + 13) = *((void *)v102 + 13);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 14) = *((void *)v102 + 14);
        *((void *)v101 + 15) = *((void *)v102 + 15);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 16) = *((void *)v102 + 16);
        *((void *)v101 + 17) = *((void *)v102 + 17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)v101 + 18) = *((void *)v102 + 18);
        *((void *)v101 + 19) = *((void *)v102 + 19);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v103 = _s14descr27097BA99O6VictimVMa(0);
        (*(void (**)(char *, char *, uint64_t))(v67 + 24))(&v101[*(int *)(v103 + 40)], &v102[*(int *)(v103 + 40)], v66);
        *(void *)&v55[v99[7]] = *(void *)&v56[v99[7]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v55[v99[8]] = *(void *)&v56[v99[8]];
        uint64_t v104 = v99[9];
        uint64_t v105 = &v55[v104];
        uint64_t v106 = &v56[v104];
        *uint64_t v105 = *v106;
        v105[1] = v106[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v55[v99[10]] = v56[v99[10]];
        v55[v99[11]] = v56[v99[11]];
        uint64_t v107 = v99[12];
        uint64_t v108 = &v55[v107];
        uint64_t v109 = &v56[v107];
        void *v108 = *v109;
        v108[1] = v109[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)&v55[v99[13]] = *(void *)&v56[v99[13]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v110 = v99[14];
        uint64_t v111 = (uint64_t *)&v55[v110];
        unint64_t v112 = (uint64_t *)&v56[v110];
        unint64_t v113 = *(void *)&v56[v110 + 8];
        if (*(void *)&v55[v110 + 8] >> 60 == 15)
        {
          if (v113 >> 60 != 15)
          {
            uint64_t v114 = *v112;
            sub_25C034EC8(*v112, v113);
            *uint64_t v111 = v114;
            v111[1] = v113;
LABEL_43:
            uint64_t v118 = v99[15];
            uint64_t v119 = &v55[v118];
            uint64_t v120 = &v56[v118];
            *uint64_t v119 = *v120;
            v119[1] = v120[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(void *)&v55[v99[16]] = *(void *)&v56[v99[16]];
            uint64_t v121 = v99[17];
            uint64_t v122 = &v55[v121];
            uint64_t v123 = &v56[v121];
            *uint64_t v122 = *v123;
            v122[1] = v123[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v124 = v99[18];
            uint64_t v125 = &v55[v124];
            uint64_t v126 = &v56[v124];
            *uint64_t v125 = *v126;
            v125[1] = v126[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *(void *)&v55[v99[19]] = *(void *)&v56[v99[19]];
            goto LABEL_44;
          }
        }
        else
        {
          if (v113 >> 60 != 15)
          {
            uint64_t v115 = *v112;
            sub_25C034EC8(*v112, v113);
            uint64_t v116 = *v111;
            unint64_t v117 = v111[1];
            *uint64_t v111 = v115;
            v111[1] = v113;
            sub_25C035294(v116, v117);
            goto LABEL_43;
          }
          sub_25C052A18((uint64_t)v111);
        }
        *(_OWORD *)uint64_t v111 = *(_OWORD *)v112;
        goto LABEL_43;
      }
      (*(void (**)(unsigned char *, uint64_t))(v67 + 8))(v55, v66);
    }
    uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v55, v56, *(void *)(*(void *)(v98 - 8) + 64));
    goto LABEL_36;
  }
  if (v61)
  {
LABEL_24:
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
    memcpy(v55, v56, *(void *)(*(void *)(v65 - 8) + 64));
    goto LABEL_44;
  }
  uint64_t v62 = sub_25C0EA328();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v142 = v5;
  uint64_t v141 = v63;
  uint64_t v137 = v62;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v63 + 48))(v56, 1, v62))
  {
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v55, v56, *(void *)(*(void *)(v64 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v63 + 16))(v55, v56, v62);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v63 + 56))(v55, 0, 1, v62);
  }
  uint64_t v71 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v72 = v71[6];
  uint64_t v73 = &v55[v72];
  uint64_t v74 = &v56[v72];
  *uint64_t v73 = *(void *)&v56[v72];
  v73[1] = *(void *)&v56[v72 + 8];
  void v73[2] = *(void *)&v56[v72 + 16];
  v73[3] = *(void *)&v56[v72 + 24];
  v73[4] = *(void *)&v56[v72 + 32];
  v73[5] = *(void *)&v56[v72 + 40];
  v73[6] = *(void *)&v56[v72 + 48];
  unsigned char v73[7] = *(void *)&v56[v72 + 56];
  v73[8] = *(void *)&v56[v72 + 64];
  v73[9] = *(void *)&v56[v72 + 72];
  v73[10] = *(void *)&v56[v72 + 80];
  v73[11] = *(void *)&v56[v72 + 88];
  v73[12] = *(void *)&v56[v72 + 96];
  v73[13] = *(void *)&v56[v72 + 104];
  v73[14] = *(void *)&v56[v72 + 112];
  v73[15] = *(void *)&v56[v72 + 120];
  v73[16] = *(void *)&v56[v72 + 128];
  v73[17] = *(void *)&v56[v72 + 136];
  v73[18] = *(void *)&v56[v72 + 144];
  v73[19] = *(void *)&v56[v72 + 152];
  uint64_t v75 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
  uint64_t v131 = &v74[v75];
  uint64_t v132 = (char *)v73 + v75;
  uint64_t v76 = *(void (**)(char *, char *, uint64_t))(v141 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v76(v132, v131, v137);
  *(void *)&v55[v71[7]] = *(void *)&v56[v71[7]];
  *(void *)&v55[v71[8]] = *(void *)&v56[v71[8]];
  uint64_t v77 = v71[9];
  uint64_t v78 = &v55[v77];
  uint64_t v79 = &v56[v77];
  void *v78 = *v79;
  v78[1] = v79[1];
  v55[v71[10]] = v56[v71[10]];
  v55[v71[11]] = v56[v71[11]];
  uint64_t v80 = v71[12];
  uint64_t v81 = &v55[v80];
  uint64_t v82 = &v56[v80];
  *uint64_t v81 = *v82;
  v81[1] = v82[1];
  *(void *)&v55[v71[13]] = *(void *)&v56[v71[13]];
  uint64_t v83 = v71[14];
  uint64_t v84 = &v55[v83];
  uint64_t v85 = (uint64_t *)&v56[v83];
  unint64_t v86 = *(void *)&v56[v83 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v86 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v84 = *(_OWORD *)v85;
  }
  else
  {
    uint64_t v87 = *v85;
    sub_25C034EC8(*v85, v86);
    *(void *)uint64_t v84 = v87;
    *((void *)v84 + 1) = v86;
  }
  uint64_t v88 = v71[15];
  uint64_t v89 = &v55[v88];
  uint64_t v90 = &v56[v88];
  void *v89 = *v90;
  v89[1] = v90[1];
  *(void *)&v55[v71[16]] = *(void *)&v56[v71[16]];
  uint64_t v91 = v71[17];
  uint64_t v92 = &v55[v91];
  uint64_t v93 = &v56[v91];
  *uint64_t v92 = *v93;
  v92[1] = v93[1];
  uint64_t v94 = v71[18];
  uint64_t v95 = &v55[v94];
  uint64_t v96 = &v56[v94];
  *uint64_t v95 = *v96;
  v95[1] = v96[1];
  *(void *)&v55[v71[19]] = *(void *)&v56[v71[19]];
  uint64_t v97 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v58 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v97(v55, 0, 1, v57);
  uint64_t v5 = v142;
LABEL_44:
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  *(void *)&v55[*(int *)(v127 + 28)] = *(void *)&v56[*(int *)(v127 + 28)];
  swift_retain();
  swift_release();
  return v5;
}

_OWORD *sub_25C0D86AC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  uint64_t v8 = (_OWORD *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for ReportScreen(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v14 = sub_25C0EA328();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v15 + 32))(v7, v8, v14);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
    }
    id v21 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v22 = v21[6];
    uint64_t v23 = (char *)v7 + v22;
    uint64_t v24 = (char *)v8 + v22;
    long long v25 = *(_OWORD *)((char *)v8 + v22 + 16);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)((char *)v8 + v22);
    *((_OWORD *)v23 + 1) = v25;
    long long v26 = *(_OWORD *)((char *)v8 + v22 + 48);
    *((_OWORD *)v23 + 2) = *(_OWORD *)((char *)v8 + v22 + 32);
    *((_OWORD *)v23 + 3) = v26;
    long long v27 = *(_OWORD *)((char *)v8 + v22 + 112);
    *((_OWORD *)v23 + 6) = *(_OWORD *)((char *)v8 + v22 + 96);
    *((_OWORD *)v23 + 7) = v27;
    long long v28 = *(_OWORD *)((char *)v8 + v22 + 144);
    *((_OWORD *)v23 + 8) = *(_OWORD *)((char *)v8 + v22 + 128);
    *((_OWORD *)v23 + 9) = v28;
    long long v29 = *(_OWORD *)((char *)v8 + v22 + 80);
    *((_OWORD *)v23 + 4) = *(_OWORD *)((char *)v8 + v22 + 64);
    *((_OWORD *)v23 + 5) = v29;
    uint64_t v30 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v23[*(int *)(v30 + 40)], &v24[*(int *)(v30 + 40)], v14);
    *(void *)((char *)v7 + v21[7]) = *(void *)((char *)v8 + v21[7]);
    *(void *)((char *)v7 + v21[8]) = *(void *)((char *)v8 + v21[8]);
    *(_OWORD *)((char *)v7 + v21[9]) = *(_OWORD *)((char *)v8 + v21[9]);
    *((unsigned char *)v7 + v21[10]) = *((unsigned char *)v8 + v21[10]);
    *((unsigned char *)v7 + v21[11]) = *((unsigned char *)v8 + v21[11]);
    *(_OWORD *)((char *)v7 + v21[12]) = *(_OWORD *)((char *)v8 + v21[12]);
    *(void *)((char *)v7 + v21[13]) = *(void *)((char *)v8 + v21[13]);
    *(_OWORD *)((char *)v7 + v21[14]) = *(_OWORD *)((char *)v8 + v21[14]);
    *(_OWORD *)((char *)v7 + v21[15]) = *(_OWORD *)((char *)v8 + v21[15]);
    *(void *)((char *)v7 + v21[16]) = *(void *)((char *)v8 + v21[16]);
    *(_OWORD *)((char *)v7 + v21[17]) = *(_OWORD *)((char *)v8 + v21[17]);
    *(_OWORD *)((char *)v7 + v21[18]) = *(_OWORD *)((char *)v8 + v21[18]);
    *(void *)((char *)v7 + v21[19]) = *(void *)((char *)v8 + v21[19]);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
      goto LABEL_13;
    }
    uint64_t v11 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11))
    {
      uint64_t v13 = type metadata accessor for Report.Authority(0);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      long long v17 = v8[1];
      *uint64_t v7 = *v8;
      v7[1] = v17;
      v7[2] = v8[2];
      *((void *)v7 + 6) = *((void *)v8 + 6);
      *(_OWORD *)((char *)v7 + 56) = *(_OWORD *)((char *)v8 + 56);
      *(_OWORD *)((char *)v7 + 72) = *(_OWORD *)((char *)v8 + 72);
      *(_OWORD *)((char *)v7 + 88) = *(_OWORD *)((char *)v8 + 88);
      uint64_t v18 = *(int *)(v11 + 28);
      uint64_t v53 = (char *)v8 + v18;
      uint64_t v54 = (char *)v7 + v18;
      uint64_t v19 = sub_25C0EA238();
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32);
      v20(v54, v53, v19);
      v20((char *)v7 + *(int *)(v11 + 32), (char *)v8 + *(int *)(v11 + 32), v19);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
    }
  }
  swift_storeEnumTagMultiPayload();
LABEL_13:
  uint64_t v31 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v31) = *(_OWORD *)((char *)a2 + v31);
  uint64_t v32 = a3[8];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = type metadata accessor for ReportOverviewScreen._Alert(0);
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    uint64_t v38 = sub_25C0EA328();
    uint64_t v39 = *(void *)(v38 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v34, 1, v38))
    {
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(v33, v34, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v33, v34, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v33, 0, 1, v38);
    }
    uint64_t v41 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v42 = v41[6];
    uint64_t v43 = &v33[v42];
    uint64_t v44 = &v34[v42];
    long long v45 = *(_OWORD *)&v34[v42 + 16];
    *(_OWORD *)uint64_t v43 = *(_OWORD *)&v34[v42];
    *((_OWORD *)v43 + 1) = v45;
    long long v46 = *(_OWORD *)&v34[v42 + 48];
    *((_OWORD *)v43 + 2) = *(_OWORD *)&v34[v42 + 32];
    *((_OWORD *)v43 + 3) = v46;
    long long v47 = *(_OWORD *)&v34[v42 + 112];
    *((_OWORD *)v43 + 6) = *(_OWORD *)&v34[v42 + 96];
    *((_OWORD *)v43 + 7) = v47;
    long long v48 = *(_OWORD *)&v34[v42 + 144];
    *((_OWORD *)v43 + 8) = *(_OWORD *)&v34[v42 + 128];
    *((_OWORD *)v43 + 9) = v48;
    long long v49 = *(_OWORD *)&v34[v42 + 80];
    *((_OWORD *)v43 + 4) = *(_OWORD *)&v34[v42 + 64];
    *((_OWORD *)v43 + 5) = v49;
    uint64_t v50 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v43[*(int *)(v50 + 40)], &v44[*(int *)(v50 + 40)], v38);
    *(void *)&v33[v41[7]] = *(void *)&v34[v41[7]];
    *(void *)&v33[v41[8]] = *(void *)&v34[v41[8]];
    *(_OWORD *)&v33[v41[9]] = *(_OWORD *)&v34[v41[9]];
    v33[v41[10]] = v34[v41[10]];
    v33[v41[11]] = v34[v41[11]];
    *(_OWORD *)&v33[v41[12]] = *(_OWORD *)&v34[v41[12]];
    *(void *)&v33[v41[13]] = *(void *)&v34[v41[13]];
    *(_OWORD *)&v33[v41[14]] = *(_OWORD *)&v34[v41[14]];
    *(_OWORD *)&v33[v41[15]] = *(_OWORD *)&v34[v41[15]];
    *(void *)&v33[v41[16]] = *(void *)&v34[v41[16]];
    *(_OWORD *)&v33[v41[17]] = *(_OWORD *)&v34[v41[17]];
    *(_OWORD *)&v33[v41[18]] = *(_OWORD *)&v34[v41[18]];
    *(void *)&v33[v41[19]] = *(void *)&v34[v41[19]];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  *(void *)&v33[*(int *)(v51 + 28)] = *(void *)&v34[*(int *)(v51 + 28)];
  return a1;
}

void *sub_25C0D8D90(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (_OWORD *)((char *)a1 + v6);
    uint64_t v8 = (_OWORD *)((char *)a2 + v6);
    sub_25C0D14C8((uint64_t)a1 + v6, type metadata accessor for ReportScreen);
    uint64_t v9 = type metadata accessor for ReportScreen(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = sub_25C0EA328();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
        memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v15 + 32))(v7, v8, v14);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
      }
      id v21 = (int *)type metadata accessor for Report.Evidence(0);
      uint64_t v22 = v21[6];
      uint64_t v23 = (char *)v7 + v22;
      uint64_t v24 = (char *)v8 + v22;
      long long v25 = *(_OWORD *)((char *)v8 + v22 + 16);
      *(_OWORD *)uint64_t v23 = *(_OWORD *)((char *)v8 + v22);
      *((_OWORD *)v23 + 1) = v25;
      long long v26 = *(_OWORD *)((char *)v8 + v22 + 48);
      *((_OWORD *)v23 + 2) = *(_OWORD *)((char *)v8 + v22 + 32);
      *((_OWORD *)v23 + 3) = v26;
      long long v27 = *(_OWORD *)((char *)v8 + v22 + 112);
      *((_OWORD *)v23 + 6) = *(_OWORD *)((char *)v8 + v22 + 96);
      *((_OWORD *)v23 + 7) = v27;
      long long v28 = *(_OWORD *)((char *)v8 + v22 + 144);
      *((_OWORD *)v23 + 8) = *(_OWORD *)((char *)v8 + v22 + 128);
      *((_OWORD *)v23 + 9) = v28;
      long long v29 = *(_OWORD *)((char *)v8 + v22 + 80);
      *((_OWORD *)v23 + 4) = *(_OWORD *)((char *)v8 + v22 + 64);
      *((_OWORD *)v23 + 5) = v29;
      uint64_t v30 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v23[*(int *)(v30 + 40)], &v24[*(int *)(v30 + 40)], v14);
      *(void *)((char *)v7 + v21[7]) = *(void *)((char *)v8 + v21[7]);
      *(void *)((char *)v7 + v21[8]) = *(void *)((char *)v8 + v21[8]);
      *(_OWORD *)((char *)v7 + v21[9]) = *(_OWORD *)((char *)v8 + v21[9]);
      *((unsigned char *)v7 + v21[10]) = *((unsigned char *)v8 + v21[10]);
      *((unsigned char *)v7 + v21[11]) = *((unsigned char *)v8 + v21[11]);
      *(_OWORD *)((char *)v7 + v21[12]) = *(_OWORD *)((char *)v8 + v21[12]);
      *(void *)((char *)v7 + v21[13]) = *(void *)((char *)v8 + v21[13]);
      *(_OWORD *)((char *)v7 + v21[14]) = *(_OWORD *)((char *)v8 + v21[14]);
      *(_OWORD *)((char *)v7 + v21[15]) = *(_OWORD *)((char *)v8 + v21[15]);
      *(void *)((char *)v7 + v21[16]) = *(void *)((char *)v8 + v21[16]);
      *(_OWORD *)((char *)v7 + v21[17]) = *(_OWORD *)((char *)v8 + v21[17]);
      *(_OWORD *)((char *)v7 + v21[18]) = *(_OWORD *)((char *)v8 + v21[18]);
      *(void *)((char *)v7 + v21[19]) = *(void *)((char *)v8 + v21[19]);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
        goto LABEL_14;
      }
      uint64_t v11 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11))
      {
        uint64_t v13 = type metadata accessor for Report.Authority(0);
        memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        long long v17 = v8[1];
        *uint64_t v7 = *v8;
        v7[1] = v17;
        v7[2] = v8[2];
        *((void *)v7 + 6) = *((void *)v8 + 6);
        *(_OWORD *)((char *)v7 + 56) = *(_OWORD *)((char *)v8 + 56);
        *(_OWORD *)((char *)v7 + 72) = *(_OWORD *)((char *)v8 + 72);
        *(_OWORD *)((char *)v7 + 88) = *(_OWORD *)((char *)v8 + 88);
        uint64_t v18 = *(int *)(v11 + 28);
        uint64_t v110 = (char *)v8 + v18;
        uint64_t v111 = (char *)v7 + v18;
        uint64_t v19 = sub_25C0EA238();
        uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32);
        v20(v111, v110, v19);
        v20((char *)v7 + *(int *)(v11 + 32), (char *)v8 + *(int *)(v11 + 32), v19);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_14:
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  swift_release();
  uint64_t v31 = a3[7];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  *uint64_t v32 = *v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_release();
  uint64_t v34 = a3[8];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  uint64_t v37 = type metadata accessor for ReportOverviewScreen._Alert(0);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (v41)
    {
      sub_25C0D14C8((uint64_t)v35, type metadata accessor for ReportOverviewScreen._Alert);
      goto LABEL_20;
    }
    uint64_t v46 = sub_25C0EA328();
    uint64_t v47 = *(void *)(v46 - 8);
    long long v48 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v47 + 48);
    int v49 = v48(v35, 1, v46);
    int v50 = v48(v36, 1, v46);
    if (v49)
    {
      if (!v50)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v47 + 32))(v35, v36, v46);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56))(v35, 0, 1, v46);
        goto LABEL_29;
      }
    }
    else
    {
      if (!v50)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v47 + 40))(v35, v36, v46);
LABEL_29:
        uint64_t v62 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v63 = v62[6];
        uint64_t v64 = &v35[v63];
        uint64_t v65 = &v36[v63];
        uint64_t v66 = *(void *)&v36[v63 + 8];
        *(void *)uint64_t v64 = *(void *)&v36[v63];
        *((void *)v64 + 1) = v66;
        swift_bridgeObjectRelease();
        uint64_t v67 = *((void *)v65 + 3);
        *((void *)v64 + 2) = *((void *)v65 + 2);
        *((void *)v64 + 3) = v67;
        swift_bridgeObjectRelease();
        uint64_t v68 = *((void *)v65 + 5);
        *((void *)v64 + 4) = *((void *)v65 + 4);
        *((void *)v64 + 5) = v68;
        swift_bridgeObjectRelease();
        uint64_t v69 = *((void *)v65 + 7);
        *((void *)v64 + 6) = *((void *)v65 + 6);
        *((void *)v64 + 7) = v69;
        swift_bridgeObjectRelease();
        uint64_t v70 = *((void *)v65 + 9);
        *((void *)v64 + 8) = *((void *)v65 + 8);
        *((void *)v64 + 9) = v70;
        swift_bridgeObjectRelease();
        uint64_t v71 = *((void *)v65 + 11);
        *((void *)v64 + 10) = *((void *)v65 + 10);
        *((void *)v64 + 11) = v71;
        swift_bridgeObjectRelease();
        uint64_t v72 = *((void *)v65 + 13);
        *((void *)v64 + 12) = *((void *)v65 + 12);
        *((void *)v64 + 13) = v72;
        swift_bridgeObjectRelease();
        uint64_t v73 = *((void *)v65 + 15);
        *((void *)v64 + 14) = *((void *)v65 + 14);
        *((void *)v64 + 15) = v73;
        swift_bridgeObjectRelease();
        uint64_t v74 = *((void *)v65 + 17);
        *((void *)v64 + 16) = *((void *)v65 + 16);
        *((void *)v64 + 17) = v74;
        swift_bridgeObjectRelease();
        uint64_t v75 = *((void *)v65 + 19);
        *((void *)v64 + 18) = *((void *)v65 + 18);
        *((void *)v64 + 19) = v75;
        swift_bridgeObjectRelease();
        uint64_t v76 = _s14descr27097BA99O6VictimVMa(0);
        (*(void (**)(char *, char *, uint64_t))(v47 + 40))(&v64[*(int *)(v76 + 40)], &v65[*(int *)(v76 + 40)], v46);
        *(void *)&v35[v62[7]] = *(void *)&v36[v62[7]];
        swift_bridgeObjectRelease();
        *(void *)&v35[v62[8]] = *(void *)&v36[v62[8]];
        uint64_t v77 = v62[9];
        uint64_t v78 = &v35[v77];
        uint64_t v79 = (uint64_t *)&v36[v77];
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        void *v78 = v81;
        v78[1] = v80;
        swift_bridgeObjectRelease();
        v35[v62[10]] = v36[v62[10]];
        v35[v62[11]] = v36[v62[11]];
        uint64_t v82 = v62[12];
        uint64_t v83 = &v35[v82];
        uint64_t v84 = (uint64_t *)&v36[v82];
        uint64_t v86 = *v84;
        uint64_t v85 = v84[1];
        *uint64_t v83 = v86;
        v83[1] = v85;
        swift_bridgeObjectRelease();
        *(void *)&v35[v62[13]] = *(void *)&v36[v62[13]];
        swift_bridgeObjectRelease();
        uint64_t v87 = v62[14];
        uint64_t v88 = (uint64_t *)&v35[v87];
        uint64_t v89 = (uint64_t *)&v36[v87];
        unint64_t v90 = *(void *)&v35[v87 + 8];
        if (v90 >> 60 != 15)
        {
          unint64_t v91 = v89[1];
          if (v91 >> 60 != 15)
          {
            uint64_t v92 = *v88;
            *uint64_t v88 = *v89;
            v88[1] = v91;
            sub_25C035294(v92, v90);
            goto LABEL_34;
          }
          sub_25C052A18((uint64_t)v88);
        }
        *(_OWORD *)uint64_t v88 = *(_OWORD *)v89;
LABEL_34:
        uint64_t v93 = v62[15];
        uint64_t v94 = &v35[v93];
        uint64_t v95 = (uint64_t *)&v36[v93];
        uint64_t v97 = *v95;
        uint64_t v96 = v95[1];
        *uint64_t v94 = v97;
        v94[1] = v96;
        swift_bridgeObjectRelease();
        *(void *)&v35[v62[16]] = *(void *)&v36[v62[16]];
        uint64_t v98 = v62[17];
        uint64_t v99 = &v35[v98];
        uint64_t v100 = (uint64_t *)&v36[v98];
        uint64_t v102 = *v100;
        uint64_t v101 = v100[1];
        void *v99 = v102;
        v99[1] = v101;
        swift_bridgeObjectRelease();
        uint64_t v103 = v62[18];
        uint64_t v104 = &v35[v103];
        uint64_t v105 = (uint64_t *)&v36[v103];
        uint64_t v107 = *v105;
        uint64_t v106 = v105[1];
        *uint64_t v104 = v107;
        v104[1] = v106;
        swift_bridgeObjectRelease();
        *(void *)&v35[v62[19]] = *(void *)&v36[v62[19]];
        goto LABEL_35;
      }
      (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v35, v46);
    }
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v35, v36, *(void *)(*(void *)(v61 - 8) + 64));
    goto LABEL_29;
  }
  if (v41)
  {
LABEL_20:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A090);
    memcpy(v35, v36, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_35;
  }
  uint64_t v42 = sub_25C0EA328();
  uint64_t v43 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v43 + 48))(v36, 1, v42))
  {
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v35, v36, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v43 + 32))(v35, v36, v42);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v43 + 56))(v35, 0, 1, v42);
  }
  uint64_t v51 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v52 = v51[6];
  uint64_t v53 = &v35[v52];
  uint64_t v54 = &v36[v52];
  long long v55 = *(_OWORD *)&v36[v52 + 16];
  *(_OWORD *)uint64_t v53 = *(_OWORD *)&v36[v52];
  *((_OWORD *)v53 + 1) = v55;
  long long v56 = *(_OWORD *)&v36[v52 + 48];
  *((_OWORD *)v53 + 2) = *(_OWORD *)&v36[v52 + 32];
  *((_OWORD *)v53 + 3) = v56;
  long long v57 = *(_OWORD *)&v36[v52 + 112];
  *((_OWORD *)v53 + 6) = *(_OWORD *)&v36[v52 + 96];
  *((_OWORD *)v53 + 7) = v57;
  long long v58 = *(_OWORD *)&v36[v52 + 144];
  *((_OWORD *)v53 + 8) = *(_OWORD *)&v36[v52 + 128];
  *((_OWORD *)v53 + 9) = v58;
  long long v59 = *(_OWORD *)&v36[v52 + 80];
  *((_OWORD *)v53 + 4) = *(_OWORD *)&v36[v52 + 64];
  *((_OWORD *)v53 + 5) = v59;
  uint64_t v60 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(&v53[*(int *)(v60 + 40)], &v54[*(int *)(v60 + 40)], v42);
  *(void *)&v35[v51[7]] = *(void *)&v36[v51[7]];
  *(void *)&v35[v51[8]] = *(void *)&v36[v51[8]];
  *(_OWORD *)&v35[v51[9]] = *(_OWORD *)&v36[v51[9]];
  v35[v51[10]] = v36[v51[10]];
  v35[v51[11]] = v36[v51[11]];
  *(_OWORD *)&v35[v51[12]] = *(_OWORD *)&v36[v51[12]];
  *(void *)&v35[v51[13]] = *(void *)&v36[v51[13]];
  *(_OWORD *)&v35[v51[14]] = *(_OWORD *)&v36[v51[14]];
  *(_OWORD *)&v35[v51[15]] = *(_OWORD *)&v36[v51[15]];
  *(void *)&v35[v51[16]] = *(void *)&v36[v51[16]];
  *(_OWORD *)&v35[v51[17]] = *(_OWORD *)&v36[v51[17]];
  *(_OWORD *)&v35[v51[18]] = *(_OWORD *)&v36[v51[18]];
  *(void *)&v35[v51[19]] = *(void *)&v36[v51[19]];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
LABEL_35:
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  *(void *)&v35[*(int *)(v108 + 28)] = *(void *)&v36[*(int *)(v108 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_25C0D9888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C0D989C);
}

uint64_t sub_25C0D989C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ReportScreen(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_25C0D99CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C0D99E0);
}

void *sub_25C0D99E0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ReportScreen(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 32);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_25C0D9B10()
{
  type metadata accessor for ReportScreen(319);
  if (v0 <= 0x3F)
  {
    sub_25C0D9BFC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25C0D9BFC()
{
  if (!qword_26A58A240)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A090);
    unint64_t v0 = sub_25C0EB3B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A58A240);
    }
  }
}

uint64_t *sub_25C0D9C58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_25C0EA328();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v54 = v6;
    uint64_t v55 = v7;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    uint64_t v10 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v11 = v10[6];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = *(uint64_t *)((char *)a2 + v11 + 8);
    *uint64_t v12 = *(uint64_t *)((char *)a2 + v11);
    v12[1] = v14;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v11 + 24);
    void v12[2] = *(uint64_t *)((char *)a2 + v11 + 16);
    v12[3] = v15;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v11 + 40);
    v12[4] = *(uint64_t *)((char *)a2 + v11 + 32);
    v12[5] = v16;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v11 + 56);
    v12[6] = *(uint64_t *)((char *)a2 + v11 + 48);
    v12[7] = v17;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v11 + 72);
    v12[8] = *(uint64_t *)((char *)a2 + v11 + 64);
    v12[9] = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v11 + 88);
    v12[10] = *(uint64_t *)((char *)a2 + v11 + 80);
    v12[11] = v19;
    uint64_t v20 = *(uint64_t *)((char *)a2 + v11 + 104);
    v12[12] = *(uint64_t *)((char *)a2 + v11 + 96);
    v12[13] = v20;
    uint64_t v21 = *(uint64_t *)((char *)a2 + v11 + 120);
    v12[14] = *(uint64_t *)((char *)a2 + v11 + 112);
    v12[15] = v21;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v11 + 136);
    v12[16] = *(uint64_t *)((char *)a2 + v11 + 128);
    v12[17] = v22;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v11 + 152);
    v12[18] = *(uint64_t *)((char *)a2 + v11 + 144);
    v12[19] = v23;
    uint64_t v24 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
    uint64_t v52 = &v13[v24];
    uint64_t v53 = (char *)v12 + v24;
    long long v25 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(v53, v52, v54);
    *(uint64_t *)((char *)a1 + v10[7]) = *(uint64_t *)((char *)a2 + v10[7]);
    *(uint64_t *)((char *)a1 + v10[8]) = *(uint64_t *)((char *)a2 + v10[8]);
    uint64_t v26 = v10[9];
    long long v27 = (uint64_t *)((char *)a1 + v26);
    long long v28 = (uint64_t *)((char *)a2 + v26);
    uint64_t v29 = v28[1];
    *long long v27 = *v28;
    v27[1] = v29;
    *((unsigned char *)a1 + v10[10]) = *((unsigned char *)a2 + v10[10]);
    *((unsigned char *)a1 + v10[11]) = *((unsigned char *)a2 + v10[11]);
    uint64_t v30 = v10[12];
    uint64_t v31 = (uint64_t *)((char *)a1 + v30);
    uint64_t v32 = (uint64_t *)((char *)a2 + v30);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    *(uint64_t *)((char *)a1 + v10[13]) = *(uint64_t *)((char *)a2 + v10[13]);
    uint64_t v34 = v10[14];
    uint64_t v35 = (char *)a1 + v34;
    uint64_t v36 = (uint64_t *)((char *)a2 + v34);
    unint64_t v37 = *(uint64_t *)((char *)a2 + v34 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v37 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    }
    else
    {
      uint64_t v38 = *v36;
      sub_25C034EC8(*v36, v37);
      *(void *)uint64_t v35 = v38;
      *((void *)v35 + 1) = v37;
    }
    uint64_t v39 = v10[15];
    int v40 = (uint64_t *)((char *)a1 + v39);
    int v41 = (uint64_t *)((char *)a2 + v39);
    uint64_t v42 = v41[1];
    *int v40 = *v41;
    v40[1] = v42;
    *(uint64_t *)((char *)a1 + v10[16]) = *(uint64_t *)((char *)a2 + v10[16]);
    uint64_t v43 = v10[17];
    uint64_t v44 = (uint64_t *)((char *)a1 + v43);
    uint64_t v45 = (uint64_t *)((char *)a2 + v43);
    uint64_t v46 = v45[1];
    *uint64_t v44 = *v45;
    v44[1] = v46;
    uint64_t v47 = v10[18];
    long long v48 = (uint64_t *)((char *)a1 + v47);
    int v49 = (uint64_t *)((char *)a2 + v47);
    uint64_t v50 = v49[1];
    *long long v48 = *v49;
    v48[1] = v50;
    *(uint64_t *)((char *)a1 + v10[19]) = *(uint64_t *)((char *)a2 + v10[19]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C0DA000(uint64_t a1)
{
  uint64_t v2 = sub_25C0EA328();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  uint64_t v4 = type metadata accessor for Report.Evidence(0);
  uint64_t v5 = a1 + *(int *)(v4 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5 + *(int *)(v6 + 40), v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(v4 + 56));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_25C035294(*v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_25C0DA1D8(char *a1, char *a2)
{
  uint64_t v4 = sub_25C0EA328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  uint64_t v52 = v5;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v7 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)&a2[v8 + 8];
  *(void *)uint64_t v9 = *(void *)&a2[v8];
  *((void *)v9 + 1) = v11;
  uint64_t v12 = *(void *)&a2[v8 + 24];
  *((void *)v9 + 2) = *(void *)&a2[v8 + 16];
  *((void *)v9 + 3) = v12;
  uint64_t v13 = *(void *)&a2[v8 + 40];
  *((void *)v9 + 4) = *(void *)&a2[v8 + 32];
  *((void *)v9 + 5) = v13;
  uint64_t v14 = *(void *)&a2[v8 + 56];
  *((void *)v9 + 6) = *(void *)&a2[v8 + 48];
  *((void *)v9 + 7) = v14;
  uint64_t v15 = *(void *)&a2[v8 + 72];
  *((void *)v9 + 8) = *(void *)&a2[v8 + 64];
  *((void *)v9 + 9) = v15;
  uint64_t v16 = *(void *)&a2[v8 + 88];
  *((void *)v9 + 10) = *(void *)&a2[v8 + 80];
  *((void *)v9 + 11) = v16;
  uint64_t v17 = *(void *)&a2[v8 + 104];
  *((void *)v9 + 12) = *(void *)&a2[v8 + 96];
  *((void *)v9 + 13) = v17;
  uint64_t v18 = *(void *)&a2[v8 + 120];
  *((void *)v9 + 14) = *(void *)&a2[v8 + 112];
  *((void *)v9 + 15) = v18;
  uint64_t v19 = *(void *)&a2[v8 + 136];
  *((void *)v9 + 16) = *(void *)&a2[v8 + 128];
  *((void *)v9 + 17) = v19;
  uint64_t v20 = *(void *)&a2[v8 + 152];
  *((void *)v9 + 18) = *(void *)&a2[v8 + 144];
  *((void *)v9 + 19) = v20;
  uint64_t v21 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
  int v49 = &v10[v21];
  uint64_t v50 = &v9[v21];
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22(v50, v49, v51);
  *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
  *(void *)&a1[v7[8]] = *(void *)&a2[v7[8]];
  uint64_t v23 = v7[9];
  uint64_t v24 = &a1[v23];
  long long v25 = &a2[v23];
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = v26;
  a1[v7[10]] = a2[v7[10]];
  a1[v7[11]] = a2[v7[11]];
  uint64_t v27 = v7[12];
  long long v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = *((void *)v29 + 1);
  *(void *)long long v28 = *(void *)v29;
  *((void *)v28 + 1) = v30;
  *(void *)&a1[v7[13]] = *(void *)&a2[v7[13]];
  uint64_t v31 = v7[14];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = (uint64_t *)&a2[v31];
  unint64_t v34 = *(void *)&a2[v31 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v34 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  }
  else
  {
    uint64_t v35 = *v33;
    sub_25C034EC8(*v33, v34);
    *(void *)uint64_t v32 = v35;
    *((void *)v32 + 1) = v34;
  }
  uint64_t v36 = v7[15];
  unint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = *((void *)v38 + 1);
  *(void *)unint64_t v37 = *(void *)v38;
  *((void *)v37 + 1) = v39;
  *(void *)&a1[v7[16]] = *(void *)&a2[v7[16]];
  uint64_t v40 = v7[17];
  int v41 = &a1[v40];
  uint64_t v42 = &a2[v40];
  uint64_t v43 = *((void *)v42 + 1);
  *(void *)int v41 = *(void *)v42;
  *((void *)v41 + 1) = v43;
  uint64_t v44 = v7[18];
  uint64_t v45 = &a1[v44];
  uint64_t v46 = &a2[v44];
  uint64_t v47 = *((void *)v46 + 1);
  *(void *)uint64_t v45 = *(void *)v46;
  *((void *)v45 + 1) = v47;
  *(void *)&a1[v7[19]] = *(void *)&a2[v7[19]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_25C0DA534(char *a1, char *a2)
{
  uint64_t v4 = sub_25C0EA328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
LABEL_7:
  uint64_t v10 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v11 = v10[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)&a2[v11];
  *((void *)v12 + 1) = *(void *)&a2[v11 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 2) = *((void *)v13 + 2);
  *((void *)v12 + 3) = *((void *)v13 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *((void *)v12 + 5) = *((void *)v13 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 6) = *((void *)v13 + 6);
  *((void *)v12 + 7) = *((void *)v13 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 8) = *((void *)v13 + 8);
  *((void *)v12 + 9) = *((void *)v13 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 10) = *((void *)v13 + 10);
  *((void *)v12 + 11) = *((void *)v13 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 12) = *((void *)v13 + 12);
  *((void *)v12 + 13) = *((void *)v13 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 14) = *((void *)v13 + 14);
  *((void *)v12 + 15) = *((void *)v13 + 15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 16) = *((void *)v13 + 16);
  *((void *)v12 + 17) = *((void *)v13 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v12 + 18) = *((void *)v13 + 18);
  *((void *)v12 + 19) = *((void *)v13 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(&v12[*(int *)(v14 + 40)], &v13[*(int *)(v14 + 40)], v4);
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[8]] = *(void *)&a2[v10[8]];
  uint64_t v15 = v10[9];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v10[10]] = a2[v10[10]];
  a1[v10[11]] = a2[v10[11]];
  uint64_t v18 = v10[12];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[13]] = *(void *)&a2[v10[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v10[14];
  uint64_t v22 = (uint64_t *)&a1[v21];
  uint64_t v23 = (uint64_t *)&a2[v21];
  unint64_t v24 = *(void *)&a2[v21 + 8];
  if (*(void *)&a1[v21 + 8] >> 60 != 15)
  {
    if (v24 >> 60 != 15)
    {
      uint64_t v26 = *v23;
      sub_25C034EC8(v26, v24);
      uint64_t v27 = *v22;
      unint64_t v28 = v22[1];
      *uint64_t v22 = v26;
      v22[1] = v24;
      sub_25C035294(v27, v28);
      goto LABEL_14;
    }
    sub_25C052A18((uint64_t)v22);
    goto LABEL_12;
  }
  if (v24 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    goto LABEL_14;
  }
  uint64_t v25 = *v23;
  sub_25C034EC8(v25, v24);
  *uint64_t v22 = v25;
  v22[1] = v24;
LABEL_14:
  uint64_t v29 = v10[15];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *(void *)uint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[16]] = *(void *)&a2[v10[16]];
  uint64_t v32 = v10[17];
  uint64_t v33 = &a1[v32];
  unint64_t v34 = &a2[v32];
  *(void *)uint64_t v33 = *(void *)v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v10[18];
  uint64_t v36 = &a1[v35];
  unint64_t v37 = &a2[v35];
  *(void *)uint64_t v36 = *(void *)v37;
  *((void *)v36 + 1) = *((void *)v37 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[19]] = *(void *)&a2[v10[19]];
  return a1;
}

char *sub_25C0DAA08(char *a1, char *a2)
{
  uint64_t v4 = sub_25C0EA328();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  int v7 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *(_OWORD *)&a2[v8 + 16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)&a2[v8];
  *((_OWORD *)v9 + 1) = v11;
  long long v12 = *(_OWORD *)&a2[v8 + 48];
  *((_OWORD *)v9 + 2) = *(_OWORD *)&a2[v8 + 32];
  *((_OWORD *)v9 + 3) = v12;
  long long v13 = *(_OWORD *)&a2[v8 + 112];
  *((_OWORD *)v9 + 6) = *(_OWORD *)&a2[v8 + 96];
  *((_OWORD *)v9 + 7) = v13;
  long long v14 = *(_OWORD *)&a2[v8 + 144];
  *((_OWORD *)v9 + 8) = *(_OWORD *)&a2[v8 + 128];
  *((_OWORD *)v9 + 9) = v14;
  long long v15 = *(_OWORD *)&a2[v8 + 80];
  *((_OWORD *)v9 + 4) = *(_OWORD *)&a2[v8 + 64];
  *((_OWORD *)v9 + 5) = v15;
  uint64_t v16 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v9[*(int *)(v16 + 40)], &v10[*(int *)(v16 + 40)], v4);
  *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
  *(void *)&a1[v7[8]] = *(void *)&a2[v7[8]];
  *(_OWORD *)&a1[v7[9]] = *(_OWORD *)&a2[v7[9]];
  a1[v7[10]] = a2[v7[10]];
  a1[v7[11]] = a2[v7[11]];
  *(_OWORD *)&a1[v7[12]] = *(_OWORD *)&a2[v7[12]];
  *(void *)&a1[v7[13]] = *(void *)&a2[v7[13]];
  *(_OWORD *)&a1[v7[14]] = *(_OWORD *)&a2[v7[14]];
  *(_OWORD *)&a1[v7[15]] = *(_OWORD *)&a2[v7[15]];
  *(void *)&a1[v7[16]] = *(void *)&a2[v7[16]];
  *(_OWORD *)&a1[v7[17]] = *(_OWORD *)&a2[v7[17]];
  *(_OWORD *)&a1[v7[18]] = *(_OWORD *)&a2[v7[18]];
  *(void *)&a1[v7[19]] = *(void *)&a2[v7[19]];
  return a1;
}

char *sub_25C0DAC30(char *a1, char *a2)
{
  uint64_t v4 = sub_25C0EA328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
LABEL_7:
  uint64_t v10 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v11 = v10[6];
  long long v12 = &a1[v11];
  long long v13 = &a2[v11];
  uint64_t v14 = *(void *)&a2[v11 + 8];
  *(void *)long long v12 = *(void *)&a2[v11];
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *((void *)v13 + 3);
  *((void *)v12 + 2) = *((void *)v13 + 2);
  *((void *)v12 + 3) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)v13 + 5);
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *((void *)v12 + 5) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *((void *)v13 + 7);
  *((void *)v12 + 6) = *((void *)v13 + 6);
  *((void *)v12 + 7) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *((void *)v13 + 9);
  *((void *)v12 + 8) = *((void *)v13 + 8);
  *((void *)v12 + 9) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *((void *)v13 + 11);
  *((void *)v12 + 10) = *((void *)v13 + 10);
  *((void *)v12 + 11) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *((void *)v13 + 13);
  *((void *)v12 + 12) = *((void *)v13 + 12);
  *((void *)v12 + 13) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *((void *)v13 + 15);
  *((void *)v12 + 14) = *((void *)v13 + 14);
  *((void *)v12 + 15) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *((void *)v13 + 17);
  *((void *)v12 + 16) = *((void *)v13 + 16);
  *((void *)v12 + 17) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)v13 + 19);
  *((void *)v12 + 18) = *((void *)v13 + 18);
  *((void *)v12 + 19) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(&v12[*(int *)(v24 + 40)], &v13[*(int *)(v24 + 40)], v4);
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[8]] = *(void *)&a2[v10[8]];
  uint64_t v25 = v10[9];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v29 = *(void *)v27;
  uint64_t v28 = *((void *)v27 + 1);
  *(void *)uint64_t v26 = v29;
  *((void *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
  a1[v10[10]] = a2[v10[10]];
  a1[v10[11]] = a2[v10[11]];
  uint64_t v30 = v10[12];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v34 = *(void *)v32;
  uint64_t v33 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = v34;
  *((void *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[13]] = *(void *)&a2[v10[13]];
  swift_bridgeObjectRelease();
  uint64_t v35 = v10[14];
  uint64_t v36 = (uint64_t *)&a1[v35];
  unint64_t v37 = (uint64_t *)&a2[v35];
  unint64_t v38 = *(void *)&a1[v35 + 8];
  if (v38 >> 60 != 15)
  {
    unint64_t v39 = v37[1];
    if (v39 >> 60 != 15)
    {
      uint64_t v40 = *v36;
      *uint64_t v36 = *v37;
      v36[1] = v39;
      sub_25C035294(v40, v38);
      goto LABEL_12;
    }
    sub_25C052A18((uint64_t)v36);
  }
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
LABEL_12:
  uint64_t v41 = v10[15];
  uint64_t v42 = &a1[v41];
  uint64_t v43 = &a2[v41];
  uint64_t v45 = *(void *)v43;
  uint64_t v44 = *((void *)v43 + 1);
  *(void *)uint64_t v42 = v45;
  *((void *)v42 + 1) = v44;
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[16]] = *(void *)&a2[v10[16]];
  uint64_t v46 = v10[17];
  uint64_t v47 = &a1[v46];
  long long v48 = &a2[v46];
  uint64_t v50 = *(void *)v48;
  uint64_t v49 = *((void *)v48 + 1);
  *(void *)uint64_t v47 = v50;
  *((void *)v47 + 1) = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v10[18];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  uint64_t v55 = *(void *)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *(void *)uint64_t v52 = v55;
  *((void *)v52 + 1) = v54;
  swift_bridgeObjectRelease();
  *(void *)&a1[v10[19]] = *(void *)&a2[v10[19]];
  return a1;
}

uint64_t sub_25C0DAFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Report.Evidence(0);

  return MEMORY[0x270FA0340](a1, a2, v4, sub_25C0DB02C);
}

uint64_t sub_25C0DB02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_25C0DB144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Report.Evidence(0);

  return MEMORY[0x270FA0580](a1, a2, a3, v6, sub_25C0DB1AC);
}

uint64_t sub_25C0DB1AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = _s14descr27097BA99O6VictimVMa(0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_25C0DB2C0(uint64_t a1)
{
  uint64_t result = type metadata accessor for Report.Evidence(319);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

void *sub_25C0DB364(void *a1, void *a2, int *a3)
{
  unint64_t v3 = a2;
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    uint64_t v12 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = type metadata accessor for ReportScreen(0);
    v178 = v4;
    v179 = v3;
    v180 = v6;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v8 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
        uint64_t v9 = *(void *)(v8 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v9 + 48))(v3, 1, v8))
        {
          uint64_t v10 = type metadata accessor for Report.Authority(0);
          memcpy(v4, v3, *(void *)(*(void *)(v10 - 8) + 64));
        }
        else
        {
          uint64_t v19 = v3[1];
          *uint64_t v4 = *v3;
          v4[1] = v19;
          uint64_t v20 = v3[3];
          v4[2] = v3[2];
          v4[3] = v20;
          *((unsigned char *)v4 + 32) = *((unsigned char *)v3 + 32);
          uint64_t v21 = (void *)v3[6];
          v4[5] = v3[5];
          v4[6] = v21;
          uint64_t v22 = v3[8];
          v4[7] = v3[7];
          v4[8] = v22;
          uint64_t v23 = v3[9];
          uint64_t v24 = v3[10];
          v4[9] = v23;
          v4[10] = v24;
          *((unsigned char *)v4 + 88) = *((unsigned char *)v179 + 88);
          v4[12] = v179[12];
          uint64_t v25 = *(int *)(v8 + 28);
          v173 = (char *)v4 + v25;
          v170 = (char *)v179 + v25;
          uint64_t v26 = sub_25C0EA238();
          uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v6 = v180;
          swift_bridgeObjectRetain();
          id v28 = v21;
          swift_bridgeObjectRetain();
          unint64_t v3 = v179;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v27(v173, v170, v26);
          uint64_t v29 = v26;
          uint64_t v4 = v178;
          v27((char *)v178 + *(int *)(v8 + 32), (char *)v179 + *(int *)(v8 + 32), v29);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v178, 0, 1, v8);
        }
        goto LABEL_18;
      case 1u:
        uint64_t v13 = sub_25C0EA328();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v172 = v13;
        uint64_t v169 = v14;
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
          memcpy(v4, v3, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v4, v3, v13);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
        }
        uint64_t v30 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v31 = v30[6];
        uint64_t v32 = (void *)((char *)v4 + v31);
        uint64_t v33 = (void *)((char *)v3 + v31);
        uint64_t v34 = *(void *)((char *)v3 + v31 + 8);
        *uint64_t v32 = *(void *)((char *)v3 + v31);
        v32[1] = v34;
        uint64_t v35 = *(void *)((char *)v3 + v31 + 24);
        v32[2] = *(void *)((char *)v3 + v31 + 16);
        v32[3] = v35;
        uint64_t v36 = *(void *)((char *)v3 + v31 + 40);
        v32[4] = *(void *)((char *)v3 + v31 + 32);
        v32[5] = v36;
        uint64_t v37 = *(void *)((char *)v3 + v31 + 48);
        uint64_t v38 = v33[7];
        v32[6] = v37;
        v32[7] = v38;
        uint64_t v39 = v33[9];
        v32[8] = v33[8];
        v32[9] = v39;
        uint64_t v40 = v33[11];
        v32[10] = v33[10];
        v32[11] = v40;
        uint64_t v41 = v33[13];
        v32[12] = v33[12];
        v32[13] = v41;
        uint64_t v42 = v33[15];
        v32[14] = v33[14];
        v32[15] = v42;
        uint64_t v43 = v33[17];
        v32[16] = v33[16];
        v32[17] = v43;
        uint64_t v44 = v33[19];
        v32[18] = v33[18];
        v32[19] = v44;
        uint64_t v45 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
        v165 = (char *)v33 + v45;
        v167 = (char *)v32 + v45;
        uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v169 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v4 = v178;
        swift_bridgeObjectRetain();
        unint64_t v3 = v179;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v46(v167, v165, v172);
        *(void *)((char *)v178 + v30[7]) = *(void *)((char *)v179 + v30[7]);
        *(void *)((char *)v178 + v30[8]) = *(void *)((char *)v179 + v30[8]);
        uint64_t v47 = v30[9];
        long long v48 = (void *)((char *)v178 + v47);
        uint64_t v49 = (void *)((char *)v179 + v47);
        uint64_t v50 = v49[1];
        *long long v48 = *v49;
        v48[1] = v50;
        *((unsigned char *)v178 + v30[10]) = *((unsigned char *)v179 + v30[10]);
        *((unsigned char *)v178 + v30[11]) = *((unsigned char *)v179 + v30[11]);
        uint64_t v51 = v30[12];
        uint64_t v52 = (void *)((char *)v178 + v51);
        uint64_t v53 = (void *)((char *)v179 + v51);
        uint64_t v54 = v53[1];
        *uint64_t v52 = *v53;
        v52[1] = v54;
        *(void *)((char *)v178 + v30[13]) = *(void *)((char *)v179 + v30[13]);
        uint64_t v55 = v30[14];
        long long v56 = (char *)v178 + v55;
        long long v57 = (void *)((char *)v179 + v55);
        unint64_t v58 = *(void *)((char *)v179 + v55 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v58 >> 60 == 15)
        {
          *(_OWORD *)long long v56 = *(_OWORD *)v57;
        }
        else
        {
          uint64_t v59 = *v57;
          sub_25C034EC8(*v57, v58);
          *(void *)long long v56 = v59;
          *((void *)v56 + 1) = v58;
        }
        uint64_t v6 = v180;
        uint64_t v60 = v30[15];
        uint64_t v61 = (void *)((char *)v178 + v60);
        uint64_t v62 = (void *)((char *)v179 + v60);
        uint64_t v63 = v62[1];
        *uint64_t v61 = *v62;
        v61[1] = v63;
        *(void *)((char *)v178 + v30[16]) = *(void *)((char *)v179 + v30[16]);
        uint64_t v64 = v30[17];
        uint64_t v65 = (void *)((char *)v178 + v64);
        uint64_t v66 = (void *)((char *)v179 + v64);
        uint64_t v67 = v66[1];
        void *v65 = *v66;
        v65[1] = v67;
        uint64_t v68 = v30[18];
        uint64_t v69 = (void *)((char *)v178 + v68);
        uint64_t v70 = (void *)((char *)v179 + v68);
        uint64_t v71 = v70[1];
        *uint64_t v69 = *v70;
        v69[1] = v71;
        *(void *)((char *)v178 + v30[19]) = *(void *)((char *)v179 + v30[19]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_18;
      case 2u:
        uint64_t v16 = (void *)*v3;
        *uint64_t v4 = *v3;
        id v17 = v16;
        goto LABEL_18;
      case 3u:
        uint64_t v18 = v3[1];
        *uint64_t v4 = *v3;
        v4[1] = v18;
        swift_bridgeObjectRetain();
LABEL_18:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v4, v3, *(void *)(*(void *)(v7 - 8) + 64));
        break;
    }
    uint64_t v72 = v6[5];
    uint64_t v73 = (void *)((char *)v4 + v72);
    uint64_t v74 = (void *)((char *)v3 + v72);
    uint64_t v75 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
    uint64_t v76 = *(void *)(v75 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v76 + 48))(v74, 1, v75))
    {
      uint64_t v77 = type metadata accessor for Report.Authority(0);
      memcpy(v73, v74, *(void *)(*(void *)(v77 - 8) + 64));
    }
    else
    {
      uint64_t v78 = v74[1];
      *uint64_t v73 = *v74;
      v73[1] = v78;
      uint64_t v79 = v74[3];
      void v73[2] = v74[2];
      v73[3] = v79;
      *((unsigned char *)v73 + 32) = *((unsigned char *)v74 + 32);
      uint64_t v176 = v76;
      uint64_t v80 = (void *)v74[6];
      v73[5] = v74[5];
      v73[6] = v80;
      uint64_t v81 = v74[8];
      unsigned char v73[7] = v74[7];
      v73[8] = v81;
      uint64_t v82 = v74[10];
      v73[9] = v74[9];
      v73[10] = v82;
      *((unsigned char *)v73 + 88) = *((unsigned char *)v74 + 88);
      v73[12] = v74[12];
      uint64_t v83 = *(int *)(v75 + 28);
      v171 = (char *)v74 + v83;
      v174 = (char *)v73 + v83;
      uint64_t v84 = sub_25C0EA238();
      v168 = *(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16);
      swift_bridgeObjectRetain();
      uint64_t v6 = v180;
      swift_bridgeObjectRetain();
      uint64_t v4 = v178;
      swift_bridgeObjectRetain();
      id v85 = v80;
      unint64_t v3 = v179;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v168(v174, v171, v84);
      v168((char *)v73 + *(int *)(v75 + 32), (char *)v74 + *(int *)(v75 + 32), v84);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v176 + 56))(v73, 0, 1, v75);
    }
    uint64_t v86 = v6[6];
    uint64_t v87 = v6[7];
    uint64_t v88 = (void *)((char *)v4 + v86);
    uint64_t v89 = (void *)((char *)v3 + v86);
    uint64_t v90 = v89[1];
    *uint64_t v88 = *v89;
    v88[1] = v90;
    unint64_t v91 = (void *)((char *)v4 + v87);
    uint64_t v92 = (char *)v3 + v87;
    uint64_t v93 = *(void *)((char *)v3 + v87 + 8);
    *unint64_t v91 = *(void *)((char *)v3 + v87);
    v91[1] = v93;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v94 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32);
    uint64_t v95 = (char *)v91 + v94;
    uint64_t v96 = &v92[v94];
    uint64_t v97 = sub_25C0EA328();
    uint64_t v98 = *(void *)(v97 - 8);
    uint64_t v175 = v97;
    uint64_t v177 = v98;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v98 + 48))(v96, 1, v97))
    {
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(v95, v96, *(void *)(*(void *)(v99 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v95, v96, v97);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v95, 0, 1, v97);
    }
    uint64_t v100 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v101 = v100[6];
    uint64_t v102 = &v95[v101];
    uint64_t v103 = &v96[v101];
    uint64_t v104 = *(void *)&v96[v101 + 8];
    *(void *)uint64_t v102 = *(void *)&v96[v101];
    *((void *)v102 + 1) = v104;
    uint64_t v105 = *(void *)&v96[v101 + 24];
    *((void *)v102 + 2) = *(void *)&v96[v101 + 16];
    *((void *)v102 + 3) = v105;
    uint64_t v106 = *(void *)&v96[v101 + 40];
    *((void *)v102 + 4) = *(void *)&v96[v101 + 32];
    *((void *)v102 + 5) = v106;
    uint64_t v107 = *(void *)&v96[v101 + 56];
    *((void *)v102 + 6) = *(void *)&v96[v101 + 48];
    *((void *)v102 + 7) = v107;
    uint64_t v108 = *(void *)&v96[v101 + 72];
    *((void *)v102 + 8) = *(void *)&v96[v101 + 64];
    *((void *)v102 + 9) = v108;
    uint64_t v109 = *(void *)&v96[v101 + 88];
    *((void *)v102 + 10) = *(void *)&v96[v101 + 80];
    *((void *)v102 + 11) = v109;
    uint64_t v110 = *(void *)&v96[v101 + 104];
    *((void *)v102 + 12) = *(void *)&v96[v101 + 96];
    *((void *)v102 + 13) = v110;
    uint64_t v111 = *(void *)&v96[v101 + 120];
    *((void *)v102 + 14) = *(void *)&v96[v101 + 112];
    *((void *)v102 + 15) = v111;
    uint64_t v112 = *(void *)&v96[v101 + 136];
    *((void *)v102 + 16) = *(void *)&v96[v101 + 128];
    *((void *)v102 + 17) = v112;
    uint64_t v113 = *(void *)&v96[v101 + 152];
    *((void *)v102 + 18) = *(void *)&v96[v101 + 144];
    *((void *)v102 + 19) = v113;
    uint64_t v114 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
    v164 = &v103[v114];
    v166 = &v102[v114];
    uint64_t v115 = *(void (**)(char *, char *, uint64_t))(v177 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v115(v166, v164, v175);
    *(void *)&v95[v100[7]] = *(void *)&v96[v100[7]];
    *(void *)&v95[v100[8]] = *(void *)&v96[v100[8]];
    uint64_t v116 = v100[9];
    unint64_t v117 = &v95[v116];
    uint64_t v118 = &v96[v116];
    uint64_t v119 = *((void *)v118 + 1);
    *(void *)unint64_t v117 = *(void *)v118;
    *((void *)v117 + 1) = v119;
    v95[v100[10]] = v96[v100[10]];
    v95[v100[11]] = v96[v100[11]];
    uint64_t v120 = v100[12];
    uint64_t v121 = &v95[v120];
    uint64_t v122 = &v96[v120];
    uint64_t v123 = *((void *)v122 + 1);
    *(void *)uint64_t v121 = *(void *)v122;
    *((void *)v121 + 1) = v123;
    *(void *)&v95[v100[13]] = *(void *)&v96[v100[13]];
    uint64_t v124 = v100[14];
    uint64_t v125 = &v95[v124];
    uint64_t v126 = (uint64_t *)&v96[v124];
    unint64_t v127 = *(void *)&v96[v124 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v127 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v125 = *(_OWORD *)v126;
    }
    else
    {
      uint64_t v128 = *v126;
      sub_25C034EC8(*v126, v127);
      *(void *)uint64_t v125 = v128;
      *((void *)v125 + 1) = v127;
    }
    uint64_t v129 = v100[15];
    unint64_t v130 = &v95[v129];
    uint64_t v131 = &v96[v129];
    uint64_t v132 = *((void *)v131 + 1);
    *(void *)unint64_t v130 = *(void *)v131;
    *((void *)v130 + 1) = v132;
    *(void *)&v95[v100[16]] = *(void *)&v96[v100[16]];
    uint64_t v133 = v100[17];
    uint64_t v134 = &v95[v133];
    uint64_t v135 = &v96[v133];
    uint64_t v136 = *((void *)v135 + 1);
    *(void *)uint64_t v134 = *(void *)v135;
    *((void *)v134 + 1) = v136;
    uint64_t v137 = v100[18];
    uint64_t v138 = &v95[v137];
    uint64_t v139 = &v96[v137];
    uint64_t v140 = *((void *)v139 + 1);
    *(void *)uint64_t v138 = *(void *)v139;
    *((void *)v138 + 1) = v140;
    *(void *)&v95[v100[19]] = *(void *)&v96[v100[19]];
    uint64_t v141 = v180[8];
    uint64_t v142 = v180[9];
    uint64_t v12 = v178;
    uint64_t v143 = (char *)v178 + v141;
    uint64_t v144 = (char *)v179 + v141;
    *(void *)uint64_t v143 = *(void *)v144;
    v143[8] = v144[8];
    uint64_t v145 = *((void *)v144 + 3);
    *((void *)v143 + 2) = *((void *)v144 + 2);
    *((void *)v143 + 3) = v145;
    v143[32] = v144[32];
    uint64_t v146 = (char *)v178 + v142;
    uint64_t v147 = (char *)v179 + v142;
    uint64_t v148 = *((void *)v147 + 1);
    *(void *)uint64_t v146 = *(void *)v147;
    *((void *)v146 + 1) = v148;
    v146[16] = v147[16];
    uint64_t v149 = v180[10];
    uint64_t v150 = v180[11];
    char v151 = (void *)((char *)v178 + v149);
    uint64_t v152 = (void *)((char *)v179 + v149);
    uint64_t v153 = v152[1];
    *char v151 = *v152;
    v151[1] = v153;
    long long v154 = (void *)((char *)v178 + v150);
    char v155 = (void *)((char *)v179 + v150);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v156 = sub_25C0EA748();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v156 - 8) + 16))(v154, v155, v156);
    }
    else
    {
      *long long v154 = *v155;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v157 = v180[12];
    uint64_t v158 = v180[13];
    v159 = (char *)v178 + v157;
    v160 = (char *)v179 + v157;
    char *v159 = *v160;
    *((void *)v159 + 1) = *((void *)v160 + 1);
    v161 = (char *)v178 + v158;
    v162 = (char *)v179 + v158;
    char *v161 = *v162;
    *((void *)v161 + 1) = *((void *)v162 + 1);
    swift_retain();
  }
  swift_retain();
  return v12;
}

uint64_t sub_25C0DC020(id *a1, int *a2)
{
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v4 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v5 = (char *)a1 + *(int *)(v4 + 28);
        uint64_t v6 = sub_25C0EA238();
        uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
        v7(v5, v6);
        v7((char *)a1 + *(int *)(v4 + 32), v6);
      }
      break;
    case 1u:
      uint64_t v8 = sub_25C0EA328();
      uint64_t v9 = *(void *)(v8 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8)) {
        (*(void (**)(id *, uint64_t))(v9 + 8))(a1, v8);
      }
      uint64_t v10 = type metadata accessor for Report.Evidence(0);
      uint64_t v11 = (char *)a1 + *(int *)(v10 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v9 + 8))(&v11[*(int *)(v12 + 40)], v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t *)((char *)a1 + *(int *)(v10 + 56));
      unint64_t v14 = v13[1];
      if (v14 >> 60 != 15) {
        sub_25C035294(*v13, v14);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  uint64_t v15 = (id *)((char *)a1 + a2[5]);
  uint64_t v16 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v17 = (char *)v15 + *(int *)(v16 + 28);
    uint64_t v18 = sub_25C0EA238();
    uint64_t v19 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
    v19(v17, v18);
    v19((char *)v15 + *(int *)(v16 + 32), v18);
  }
  swift_release();
  uint64_t v20 = (char *)a1 + a2[7];
  swift_release();
  swift_release();
  uint64_t v21 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v22 = sub_25C0EA328();
  uint64_t v23 = *(void *)(v22 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22)) {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
  }
  uint64_t v24 = type metadata accessor for Report.Evidence(0);
  uint64_t v25 = &v21[*(int *)(v24 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, uint64_t))(v23 + 8))(&v25[*(int *)(v26 + 40)], v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = (uint64_t *)&v21[*(int *)(v24 + 56)];
  unint64_t v28 = v27[1];
  if (v28 >> 60 != 15) {
    sub_25C035294(*v27, v28);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v29 = (char *)a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v30 - 8) + 8))(v29, v30);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

void *sub_25C0DC6AC(void *a1, void *a2, int *a3)
{
  uint64_t v5 = type metadata accessor for ReportScreen(0);
  v173 = a1;
  v174 = a2;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = type metadata accessor for Report.Authority(0);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        uint64_t v15 = a2[1];
        *a1 = *a2;
        a1[1] = v15;
        uint64_t v16 = a2[3];
        a1[2] = a2[2];
        a1[3] = v16;
        *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
        id v17 = (void *)a2[6];
        a1[5] = a2[5];
        a1[6] = v17;
        uint64_t v18 = a2[8];
        a1[7] = a2[7];
        a1[8] = v18;
        uint64_t v19 = a2[9];
        uint64_t v20 = a2[10];
        a1[9] = v19;
        a1[10] = v20;
        *((unsigned char *)a1 + 88) = *((unsigned char *)v174 + 88);
        a1[12] = v174[12];
        uint64_t v21 = *(int *)(v6 + 28);
        v168 = (char *)a1 + v21;
        v165 = (char *)v174 + v21;
        uint64_t v22 = sub_25C0EA238();
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v24 = v17;
        swift_bridgeObjectRetain();
        a2 = v174;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23(v168, v165, v22);
        uint64_t v25 = v22;
        a1 = v173;
        v23((char *)v173 + *(int *)(v6 + 32), (char *)v174 + *(int *)(v6 + 32), v25);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v173, 0, 1, v6);
      }
      goto LABEL_16;
    case 1u:
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      uint64_t v167 = v9;
      uint64_t v164 = v10;
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v10 + 16))(a1, a2, v9);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
      }
      uint64_t v26 = (int *)type metadata accessor for Report.Evidence(0);
      uint64_t v27 = v26[6];
      unint64_t v28 = (void *)((char *)a1 + v27);
      uint64_t v29 = (void *)((char *)a2 + v27);
      uint64_t v30 = *(void *)((char *)a2 + v27 + 8);
      *unint64_t v28 = *(void *)((char *)a2 + v27);
      v28[1] = v30;
      uint64_t v31 = *(void *)((char *)a2 + v27 + 24);
      v28[2] = *(void *)((char *)a2 + v27 + 16);
      v28[3] = v31;
      uint64_t v32 = *(void *)((char *)a2 + v27 + 40);
      v28[4] = *(void *)((char *)a2 + v27 + 32);
      v28[5] = v32;
      uint64_t v33 = *(void *)((char *)a2 + v27 + 48);
      uint64_t v34 = v29[7];
      v28[6] = v33;
      v28[7] = v34;
      uint64_t v35 = v29[9];
      v28[8] = v29[8];
      v28[9] = v35;
      uint64_t v36 = v29[11];
      v28[10] = v29[10];
      v28[11] = v36;
      uint64_t v37 = v29[13];
      v28[12] = v29[12];
      v28[13] = v37;
      uint64_t v38 = v29[15];
      v28[14] = v29[14];
      v28[15] = v38;
      uint64_t v39 = v29[17];
      v28[16] = v29[16];
      v28[17] = v39;
      uint64_t v40 = v29[19];
      v28[18] = v29[18];
      v28[19] = v40;
      uint64_t v41 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
      v160 = (char *)v29 + v41;
      v162 = (char *)v28 + v41;
      uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v164 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a1 = v173;
      swift_bridgeObjectRetain();
      a2 = v174;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42(v162, v160, v167);
      *(void *)((char *)v173 + v26[7]) = *(void *)((char *)v174 + v26[7]);
      *(void *)((char *)v173 + v26[8]) = *(void *)((char *)v174 + v26[8]);
      uint64_t v43 = v26[9];
      uint64_t v44 = (void *)((char *)v173 + v43);
      uint64_t v45 = (void *)((char *)v174 + v43);
      uint64_t v46 = v45[1];
      *uint64_t v44 = *v45;
      v44[1] = v46;
      *((unsigned char *)v173 + v26[10]) = *((unsigned char *)v174 + v26[10]);
      *((unsigned char *)v173 + v26[11]) = *((unsigned char *)v174 + v26[11]);
      uint64_t v47 = v26[12];
      long long v48 = (void *)((char *)v173 + v47);
      uint64_t v49 = (void *)((char *)v174 + v47);
      uint64_t v50 = v49[1];
      *long long v48 = *v49;
      v48[1] = v50;
      *(void *)((char *)v173 + v26[13]) = *(void *)((char *)v174 + v26[13]);
      uint64_t v51 = v26[14];
      uint64_t v52 = (char *)v173 + v51;
      uint64_t v53 = (void *)((char *)v174 + v51);
      unint64_t v54 = *(void *)((char *)v174 + v51 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v54 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
      }
      else
      {
        uint64_t v55 = *v53;
        sub_25C034EC8(*v53, v54);
        *(void *)uint64_t v52 = v55;
        *((void *)v52 + 1) = v54;
      }
      uint64_t v56 = v26[15];
      long long v57 = (void *)((char *)v173 + v56);
      unint64_t v58 = (void *)((char *)v174 + v56);
      uint64_t v59 = v58[1];
      *long long v57 = *v58;
      v57[1] = v59;
      *(void *)((char *)v173 + v26[16]) = *(void *)((char *)v174 + v26[16]);
      uint64_t v60 = v26[17];
      uint64_t v61 = (void *)((char *)v173 + v60);
      uint64_t v62 = (void *)((char *)v174 + v60);
      uint64_t v63 = v62[1];
      *uint64_t v61 = *v62;
      v61[1] = v63;
      uint64_t v64 = v26[18];
      uint64_t v65 = (void *)((char *)v173 + v64);
      uint64_t v66 = (void *)((char *)v174 + v64);
      uint64_t v67 = v66[1];
      void *v65 = *v66;
      v65[1] = v67;
      *(void *)((char *)v173 + v26[19]) = *(void *)((char *)v174 + v26[19]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_16;
    case 2u:
      uint64_t v12 = (void *)*a2;
      *a1 = *a2;
      id v13 = v12;
      goto LABEL_16;
    case 3u:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
LABEL_16:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
      break;
  }
  uint64_t v68 = a3[5];
  uint64_t v69 = (void *)((char *)a1 + v68);
  uint64_t v70 = (void *)((char *)a2 + v68);
  uint64_t v71 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  uint64_t v72 = *(void *)(v71 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71))
  {
    uint64_t v73 = type metadata accessor for Report.Authority(0);
    memcpy(v69, v70, *(void *)(*(void *)(v73 - 8) + 64));
  }
  else
  {
    uint64_t v74 = v70[1];
    *uint64_t v69 = *v70;
    v69[1] = v74;
    uint64_t v75 = v70[3];
    v69[2] = v70[2];
    v69[3] = v75;
    *((unsigned char *)v69 + 32) = *((unsigned char *)v70 + 32);
    v166 = (void *)v70[6];
    v69[5] = v70[5];
    v69[6] = v166;
    uint64_t v76 = v70[8];
    v69[7] = v70[7];
    v69[8] = v76;
    uint64_t v77 = v70[10];
    v69[9] = v70[9];
    v69[10] = v77;
    *((unsigned char *)v69 + 88) = *((unsigned char *)v70 + 88);
    v69[12] = v70[12];
    uint64_t v78 = *(int *)(v71 + 28);
    uint64_t v169 = (char *)v70 + v78;
    v171 = (char *)v69 + v78;
    uint64_t v79 = sub_25C0EA238();
    v163 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a1 = v173;
    swift_bridgeObjectRetain();
    id v80 = v166;
    a2 = v174;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v163(v171, v169, v79);
    v163((char *)v69 + *(int *)(v71 + 32), (char *)v70 + *(int *)(v71 + 32), v79);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
  }
  uint64_t v81 = a3[6];
  uint64_t v82 = a3[7];
  uint64_t v83 = (void *)((char *)a1 + v81);
  uint64_t v84 = (void *)((char *)a2 + v81);
  uint64_t v85 = v84[1];
  *uint64_t v83 = *v84;
  v83[1] = v85;
  uint64_t v86 = (void *)((char *)a1 + v82);
  uint64_t v87 = (char *)a2 + v82;
  uint64_t v88 = *(void *)((char *)a2 + v82 + 8);
  *uint64_t v86 = *(void *)((char *)a2 + v82);
  v86[1] = v88;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v89 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32);
  uint64_t v90 = (char *)v86 + v89;
  unint64_t v91 = &v87[v89];
  uint64_t v92 = sub_25C0EA328();
  uint64_t v93 = *(void *)(v92 - 8);
  uint64_t v170 = v92;
  uint64_t v172 = v93;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v93 + 48))(v91, 1, v92))
  {
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v90, v91, *(void *)(*(void *)(v94 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v90, v91, v92);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v93 + 56))(v90, 0, 1, v92);
  }
  uint64_t v95 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v96 = v95[6];
  uint64_t v97 = &v90[v96];
  uint64_t v98 = &v91[v96];
  uint64_t v99 = *(void *)&v91[v96 + 8];
  *(void *)uint64_t v97 = *(void *)&v91[v96];
  *((void *)v97 + 1) = v99;
  uint64_t v100 = *(void *)&v91[v96 + 24];
  *((void *)v97 + 2) = *(void *)&v91[v96 + 16];
  *((void *)v97 + 3) = v100;
  uint64_t v101 = *(void *)&v91[v96 + 40];
  *((void *)v97 + 4) = *(void *)&v91[v96 + 32];
  *((void *)v97 + 5) = v101;
  uint64_t v102 = *(void *)&v91[v96 + 56];
  *((void *)v97 + 6) = *(void *)&v91[v96 + 48];
  *((void *)v97 + 7) = v102;
  uint64_t v103 = *(void *)&v91[v96 + 72];
  *((void *)v97 + 8) = *(void *)&v91[v96 + 64];
  *((void *)v97 + 9) = v103;
  uint64_t v104 = *(void *)&v91[v96 + 88];
  *((void *)v97 + 10) = *(void *)&v91[v96 + 80];
  *((void *)v97 + 11) = v104;
  uint64_t v105 = *(void *)&v91[v96 + 104];
  *((void *)v97 + 12) = *(void *)&v91[v96 + 96];
  *((void *)v97 + 13) = v105;
  uint64_t v106 = *(void *)&v91[v96 + 120];
  *((void *)v97 + 14) = *(void *)&v91[v96 + 112];
  *((void *)v97 + 15) = v106;
  uint64_t v107 = *(void *)&v91[v96 + 136];
  *((void *)v97 + 16) = *(void *)&v91[v96 + 128];
  *((void *)v97 + 17) = v107;
  uint64_t v108 = *(void *)&v91[v96 + 152];
  *((void *)v97 + 18) = *(void *)&v91[v96 + 144];
  *((void *)v97 + 19) = v108;
  uint64_t v109 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
  v159 = &v98[v109];
  v161 = &v97[v109];
  uint64_t v110 = *(void (**)(char *, char *, uint64_t))(v172 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v110(v161, v159, v170);
  *(void *)&v90[v95[7]] = *(void *)&v91[v95[7]];
  *(void *)&v90[v95[8]] = *(void *)&v91[v95[8]];
  uint64_t v111 = v95[9];
  uint64_t v112 = &v90[v111];
  uint64_t v113 = &v91[v111];
  uint64_t v114 = *((void *)v113 + 1);
  *(void *)uint64_t v112 = *(void *)v113;
  *((void *)v112 + 1) = v114;
  v90[v95[10]] = v91[v95[10]];
  v90[v95[11]] = v91[v95[11]];
  uint64_t v115 = v95[12];
  uint64_t v116 = &v90[v115];
  unint64_t v117 = &v91[v115];
  uint64_t v118 = *((void *)v117 + 1);
  *(void *)uint64_t v116 = *(void *)v117;
  *((void *)v116 + 1) = v118;
  *(void *)&v90[v95[13]] = *(void *)&v91[v95[13]];
  uint64_t v119 = v95[14];
  uint64_t v120 = &v90[v119];
  uint64_t v121 = (uint64_t *)&v91[v119];
  unint64_t v122 = *(void *)&v91[v119 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v122 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v120 = *(_OWORD *)v121;
  }
  else
  {
    uint64_t v123 = *v121;
    sub_25C034EC8(*v121, v122);
    *(void *)uint64_t v120 = v123;
    *((void *)v120 + 1) = v122;
  }
  uint64_t v124 = v95[15];
  uint64_t v125 = &v90[v124];
  uint64_t v126 = &v91[v124];
  uint64_t v127 = *((void *)v126 + 1);
  *(void *)uint64_t v125 = *(void *)v126;
  *((void *)v125 + 1) = v127;
  *(void *)&v90[v95[16]] = *(void *)&v91[v95[16]];
  uint64_t v128 = v95[17];
  uint64_t v129 = &v90[v128];
  unint64_t v130 = &v91[v128];
  uint64_t v131 = *((void *)v130 + 1);
  *(void *)uint64_t v129 = *(void *)v130;
  *((void *)v129 + 1) = v131;
  uint64_t v132 = v95[18];
  uint64_t v133 = &v90[v132];
  uint64_t v134 = &v91[v132];
  uint64_t v135 = *((void *)v134 + 1);
  *(void *)uint64_t v133 = *(void *)v134;
  *((void *)v133 + 1) = v135;
  *(void *)&v90[v95[19]] = *(void *)&v91[v95[19]];
  uint64_t v136 = a3[8];
  uint64_t v137 = a3[9];
  uint64_t v138 = (char *)v173 + v136;
  uint64_t v139 = (char *)v174 + v136;
  *(void *)uint64_t v138 = *(void *)v139;
  v138[8] = v139[8];
  uint64_t v140 = *((void *)v139 + 3);
  *((void *)v138 + 2) = *((void *)v139 + 2);
  *((void *)v138 + 3) = v140;
  v138[32] = v139[32];
  uint64_t v141 = (char *)v173 + v137;
  uint64_t v142 = (char *)v174 + v137;
  uint64_t v143 = *((void *)v142 + 1);
  *(void *)uint64_t v141 = *(void *)v142;
  *((void *)v141 + 1) = v143;
  v141[16] = v142[16];
  uint64_t v144 = a3[10];
  uint64_t v145 = a3[11];
  uint64_t v146 = (void *)((char *)v173 + v144);
  uint64_t v147 = (void *)((char *)v174 + v144);
  uint64_t v148 = v147[1];
  *uint64_t v146 = *v147;
  v146[1] = v148;
  uint64_t v149 = (void *)((char *)v173 + v145);
  uint64_t v150 = (void *)((char *)v174 + v145);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v151 = sub_25C0EA748();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v151 - 8) + 16))(v149, v150, v151);
  }
  else
  {
    *uint64_t v149 = *v150;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v152 = a3[12];
  uint64_t v153 = a3[13];
  long long v154 = (char *)v173 + v152;
  char v155 = (char *)v174 + v152;
  *long long v154 = *v155;
  *((void *)v154 + 1) = *((void *)v155 + 1);
  uint64_t v156 = (char *)v173 + v153;
  uint64_t v157 = (char *)v174 + v153;
  *uint64_t v156 = *v157;
  *((void *)v156 + 1) = *((void *)v157 + 1);
  swift_retain();
  swift_retain();
  return v173;
}

void *sub_25C0DD314(void *a1, void *a2, int *a3)
{
  unint64_t v3 = a3;
  if (a1 != a2)
  {
    sub_25C0D14C8((uint64_t)a1, type metadata accessor for ReportScreen);
    uint64_t v6 = type metadata accessor for ReportScreen(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
        uint64_t v8 = *(void *)(v7 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
        {
          uint64_t v9 = type metadata accessor for Report.Authority(0);
          memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          a1[1] = a2[1];
          a1[2] = a2[2];
          a1[3] = a2[3];
          *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
          a1[5] = a2[5];
          uint64_t v15 = (void *)a2[6];
          a1[6] = v15;
          a1[7] = a2[7];
          a1[8] = a2[8];
          a1[9] = a2[9];
          a1[10] = a2[10];
          *((unsigned char *)a1 + 88) = *((unsigned char *)a2 + 88);
          a1[12] = a2[12];
          uint64_t v16 = *(int *)(v7 + 28);
          uint64_t v144 = (char *)a1 + v16;
          uint64_t v141 = (char *)a2 + v16;
          uint64_t v17 = sub_25C0EA238();
          uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v19 = v15;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v18(v144, v141, v17);
          uint64_t v20 = v17;
          unint64_t v3 = a3;
          v18((char *)a1 + *(int *)(v7 + 32), (char *)a2 + *(int *)(v7 + 32), v20);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
        }
        goto LABEL_17;
      case 1u:
        uint64_t v10 = sub_25C0EA328();
        uint64_t v11 = *(void *)(v10 - 8);
        uint64_t v139 = v10;
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
        {
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v11 + 16))(a1, a2, v10);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
        }
        uint64_t v21 = (int *)type metadata accessor for Report.Evidence(0);
        uint64_t v22 = v21[6];
        uint64_t v23 = (void *)((char *)a1 + v22);
        id v24 = (char *)a2 + v22;
        *uint64_t v23 = *(void *)((char *)a2 + v22);
        v23[1] = *(void *)((char *)a2 + v22 + 8);
        v23[2] = *(void *)((char *)a2 + v22 + 16);
        v23[3] = *(void *)((char *)a2 + v22 + 24);
        v23[4] = *(void *)((char *)a2 + v22 + 32);
        v23[5] = *(void *)((char *)a2 + v22 + 40);
        v23[6] = *(void *)((char *)a2 + v22 + 48);
        v23[7] = *(void *)((char *)a2 + v22 + 56);
        v23[8] = *(void *)((char *)a2 + v22 + 64);
        v23[9] = *(void *)((char *)a2 + v22 + 72);
        v23[10] = *(void *)((char *)a2 + v22 + 80);
        v23[11] = *(void *)((char *)a2 + v22 + 88);
        v23[12] = *(void *)((char *)a2 + v22 + 96);
        v23[13] = *(void *)((char *)a2 + v22 + 104);
        v23[14] = *(void *)((char *)a2 + v22 + 112);
        v23[15] = *(void *)((char *)a2 + v22 + 120);
        v23[16] = *(void *)((char *)a2 + v22 + 128);
        v23[17] = *(void *)((char *)a2 + v22 + 136);
        v23[18] = *(void *)((char *)a2 + v22 + 144);
        v23[19] = *(void *)((char *)a2 + v22 + 152);
        uint64_t v25 = *(int *)(_s14descr27097BA99O6VictimVMa(0) + 40);
        uint64_t v136 = &v24[v25];
        uint64_t v137 = (char *)v23 + v25;
        uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26(v137, v136, v139);
        *(void *)((char *)a1 + v21[7]) = *(void *)((char *)a2 + v21[7]);
        *(void *)((char *)a1 + v21[8]) = *(void *)((char *)a2 + v21[8]);
        uint64_t v27 = v21[9];
        unint64_t v28 = (void *)((char *)a1 + v27);
        uint64_t v29 = (void *)((char *)a2 + v27);
        *unint64_t v28 = *v29;
        v28[1] = v29[1];
        *((unsigned char *)a1 + v21[10]) = *((unsigned char *)a2 + v21[10]);
        *((unsigned char *)a1 + v21[11]) = *((unsigned char *)a2 + v21[11]);
        uint64_t v30 = v21[12];
        uint64_t v31 = (void *)((char *)a1 + v30);
        uint64_t v32 = (void *)((char *)a2 + v30);
        *uint64_t v31 = *v32;
        v31[1] = v32[1];
        *(void *)((char *)a1 + v21[13]) = *(void *)((char *)a2 + v21[13]);
        uint64_t v33 = v21[14];
        uint64_t v34 = (char *)a1 + v33;
        uint64_t v35 = (void *)((char *)a2 + v33);
        unint64_t v36 = *(void *)((char *)a2 + v33 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v36 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
        }
        else
        {
          uint64_t v37 = *v35;
          sub_25C034EC8(*v35, v36);
          *(void *)uint64_t v34 = v37;
          *((void *)v34 + 1) = v36;
        }
        unint64_t v3 = a3;
        uint64_t v38 = v21[15];
        uint64_t v39 = (void *)((char *)a1 + v38);
        uint64_t v40 = (void *)((char *)a2 + v38);
        *uint64_t v39 = *v40;
        v39[1] = v40[1];
        *(void *)((char *)a1 + v21[16]) = *(void *)((char *)a2 + v21[16]);
        uint64_t v41 = v21[17];
        uint64_t v42 = (void *)((char *)a1 + v41);
        uint64_t v43 = (void *)((char *)a2 + v41);
        *uint64_t v42 = *v43;
        v42[1] = v43[1];
        uint64_t v44 = v21[18];
        uint64_t v45 = (void *)((char *)a1 + v44);
        uint64_t v46 = (void *)((char *)a2 + v44);
        *uint64_t v45 = *v46;
        v45[1] = v46[1];
        *(void *)((char *)a1 + v21[19]) = *(void *)((char *)a2 + v21[19]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_17;
      case 2u:
        id v13 = (void *)*a2;
        *a1 = *a2;
        id v14 = v13;
        goto LABEL_17;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
LABEL_17:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  uint64_t v47 = v3[5];
  uint64_t v48 = (uint64_t)a1 + v47;
  uint64_t v49 = (char *)a2 + v47;
  uint64_t v50 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
  int v53 = v52(v48, 1, v50);
  int v54 = v52((uint64_t)v49, 1, v50);
  if (v53)
  {
    if (!v54)
    {
      *(void *)uint64_t v48 = *(void *)v49;
      *(void *)(v48 + 8) = *((void *)v49 + 1);
      *(void *)(v48 + 16) = *((void *)v49 + 2);
      *(void *)(v48 + 24) = *((void *)v49 + 3);
      *(unsigned char *)(v48 + 32) = v49[32];
      *(void *)(v48 + 40) = *((void *)v49 + 5);
      uint64_t v140 = (void *)*((void *)v49 + 6);
      *(void *)(v48 + 48) = v140;
      *(void *)(v48 + 56) = *((void *)v49 + 7);
      *(void *)(v48 + 64) = *((void *)v49 + 8);
      *(void *)(v48 + 72) = *((void *)v49 + 9);
      *(void *)(v48 + 80) = *((void *)v49 + 10);
      *(unsigned char *)(v48 + 88) = v49[88];
      *(void *)(v48 + 96) = *((void *)v49 + 12);
      uint64_t v55 = *(int *)(v50 + 28);
      uint64_t v142 = &v49[v55];
      uint64_t v143 = v48 + v55;
      uint64_t v56 = sub_25C0EA238();
      uint64_t v138 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v56 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v3 = a3;
      swift_bridgeObjectRetain();
      id v57 = v140;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v138(v143, v142, v56);
      v138(v48 + *(int *)(v50 + 32), &v49[*(int *)(v50 + 32)], v56);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v50);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v54)
  {
    sub_25C0D14C8(v48, type metadata accessor for Report.Authority.DirectAuthorityDetails);
LABEL_23:
    uint64_t v58 = type metadata accessor for Report.Authority(0);
    memcpy((void *)v48, v49, *(void *)(*(void *)(v58 - 8) + 64));
    goto LABEL_24;
  }
  *(void *)uint64_t v48 = *(void *)v49;
  *(void *)(v48 + 8) = *((void *)v49 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v48 + 16) = *((void *)v49 + 2);
  *(void *)(v48 + 24) = *((void *)v49 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v48 + 32) = v49[32];
  *(void *)(v48 + 40) = *((void *)v49 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v127 = (void *)*((void *)v49 + 6);
  uint64_t v128 = *(void **)(v48 + 48);
  *(void *)(v48 + 48) = v127;
  id v129 = v127;

  *(void *)(v48 + 56) = *((void *)v49 + 7);
  *(void *)(v48 + 64) = *((void *)v49 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v48 + 72) = *((void *)v49 + 9);
  *(void *)(v48 + 80) = *((void *)v49 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v48 + 88) = v49[88];
  *(void *)(v48 + 96) = *((void *)v49 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v130 = *(int *)(v50 + 28);
  uint64_t v131 = v48 + v130;
  uint64_t v132 = &v49[v130];
  uint64_t v133 = sub_25C0EA238();
  uint64_t v134 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v133 - 8) + 24);
  v134(v131, v132, v133);
  uint64_t v135 = v133;
  unint64_t v3 = a3;
  v134(v48 + *(int *)(v50 + 32), &v49[*(int *)(v50 + 32)], v135);
LABEL_24:
  uint64_t v59 = v3[6];
  uint64_t v60 = (void *)((char *)a1 + v59);
  uint64_t v61 = (void *)((char *)a2 + v59);
  uint64_t v62 = v61[1];
  *uint64_t v60 = *v61;
  v60[1] = v62;
  swift_retain();
  swift_release();
  uint64_t v63 = v3[7];
  uint64_t v64 = (char *)a1 + v63;
  uint64_t v65 = (char *)a2 + v63;
  *(void *)((char *)a1 + v63) = *(void *)((char *)a2 + v63);
  swift_retain();
  swift_release();
  *((void *)v64 + 1) = *((void *)v65 + 1);
  swift_retain();
  swift_release();
  uint64_t v66 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32);
  uint64_t v67 = &v64[v66];
  uint64_t v68 = &v65[v66];
  uint64_t v69 = sub_25C0EA328();
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
  int v72 = v71(v67, 1, v69);
  int v73 = v71(v68, 1, v69);
  if (v72)
  {
    if (!v73)
    {
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v67, v68, v69);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v69);
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v73)
  {
    (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v69);
LABEL_29:
    uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v67, v68, *(void *)(*(void *)(v74 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v70 + 24))(v67, v68, v69);
LABEL_30:
  uint64_t v75 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v76 = v75[6];
  uint64_t v77 = &v67[v76];
  uint64_t v78 = &v68[v76];
  *(void *)uint64_t v77 = *(void *)&v68[v76];
  *((void *)v77 + 1) = *(void *)&v68[v76 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 2) = *((void *)v78 + 2);
  *((void *)v77 + 3) = *((void *)v78 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 4) = *((void *)v78 + 4);
  *((void *)v77 + 5) = *((void *)v78 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 6) = *((void *)v78 + 6);
  *((void *)v77 + 7) = *((void *)v78 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 8) = *((void *)v78 + 8);
  *((void *)v77 + 9) = *((void *)v78 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 10) = *((void *)v78 + 10);
  *((void *)v77 + 11) = *((void *)v78 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 12) = *((void *)v78 + 12);
  *((void *)v77 + 13) = *((void *)v78 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 14) = *((void *)v78 + 14);
  *((void *)v77 + 15) = *((void *)v78 + 15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 16) = *((void *)v78 + 16);
  *((void *)v77 + 17) = *((void *)v78 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v77 + 18) = *((void *)v78 + 18);
  *((void *)v77 + 19) = *((void *)v78 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v79 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v70 + 24))(&v77[*(int *)(v79 + 40)], &v78[*(int *)(v79 + 40)], v69);
  *(void *)&v67[v75[7]] = *(void *)&v68[v75[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v67[v75[8]] = *(void *)&v68[v75[8]];
  uint64_t v80 = v75[9];
  uint64_t v81 = &v67[v80];
  uint64_t v82 = &v68[v80];
  *(void *)uint64_t v81 = *(void *)v82;
  *((void *)v81 + 1) = *((void *)v82 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67[v75[10]] = v68[v75[10]];
  v67[v75[11]] = v68[v75[11]];
  uint64_t v83 = v75[12];
  uint64_t v84 = &v67[v83];
  uint64_t v85 = &v68[v83];
  *(void *)uint64_t v84 = *(void *)v85;
  *((void *)v84 + 1) = *((void *)v85 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v67[v75[13]] = *(void *)&v68[v75[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v86 = v75[14];
  uint64_t v87 = (uint64_t *)&v67[v86];
  uint64_t v88 = (uint64_t *)&v68[v86];
  unint64_t v89 = *(void *)&v68[v86 + 8];
  if (*(void *)&v67[v86 + 8] >> 60 == 15)
  {
    uint64_t v90 = a3;
    if (v89 >> 60 != 15)
    {
      uint64_t v91 = *v88;
      sub_25C034EC8(v91, v89);
      *uint64_t v87 = v91;
      v87[1] = v89;
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  uint64_t v90 = a3;
  if (v89 >> 60 == 15)
  {
    sub_25C052A18((uint64_t)v87);
LABEL_35:
    *(_OWORD *)uint64_t v87 = *(_OWORD *)v88;
    goto LABEL_37;
  }
  uint64_t v92 = *v88;
  sub_25C034EC8(v92, v89);
  uint64_t v93 = *v87;
  unint64_t v94 = v87[1];
  *uint64_t v87 = v92;
  v87[1] = v89;
  sub_25C035294(v93, v94);
LABEL_37:
  uint64_t v95 = v75[15];
  uint64_t v96 = &v67[v95];
  uint64_t v97 = &v68[v95];
  *(void *)uint64_t v96 = *(void *)v97;
  *((void *)v96 + 1) = *((void *)v97 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v67[v75[16]] = *(void *)&v68[v75[16]];
  uint64_t v98 = v75[17];
  uint64_t v99 = &v67[v98];
  uint64_t v100 = &v68[v98];
  *(void *)uint64_t v99 = *(void *)v100;
  *((void *)v99 + 1) = *((void *)v100 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v101 = v75[18];
  uint64_t v102 = &v67[v101];
  uint64_t v103 = &v68[v101];
  *(void *)uint64_t v102 = *(void *)v103;
  *((void *)v102 + 1) = *((void *)v103 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v67[v75[19]] = *(void *)&v68[v75[19]];
  uint64_t v104 = v90[8];
  uint64_t v105 = (char *)a1 + v104;
  uint64_t v106 = (char *)a2 + v104;
  uint64_t v107 = *(void *)((char *)a2 + v104);
  v105[8] = v106[8];
  *(void *)uint64_t v105 = v107;
  *((void *)v105 + 2) = *((void *)v106 + 2);
  swift_retain();
  swift_release();
  uint64_t v108 = *((void *)v106 + 3);
  v105[32] = v106[32];
  *((void *)v105 + 3) = v108;
  uint64_t v109 = v90[9];
  uint64_t v110 = (char *)a1 + v109;
  uint64_t v111 = (char *)a2 + v109;
  *(void *)((char *)a1 + v109) = *(void *)((char *)a2 + v109);
  swift_retain();
  swift_release();
  *((void *)v110 + 1) = *((void *)v111 + 1);
  swift_retain();
  swift_release();
  v110[16] = v111[16];
  uint64_t v112 = v90[10];
  uint64_t v113 = (void *)((char *)a1 + v112);
  uint64_t v114 = (void *)((char *)a2 + v112);
  uint64_t v115 = v114[1];
  void *v113 = *v114;
  v113[1] = v115;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v116 = v90[11];
    unint64_t v117 = (void *)((char *)a1 + v116);
    uint64_t v118 = (void *)((char *)a2 + v116);
    sub_25C02FBF0((uint64_t)a1 + v116, &qword_26A5890F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v119 = sub_25C0EA748();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v119 - 8) + 16))(v117, v118, v119);
    }
    else
    {
      void *v117 = *v118;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v120 = v90[12];
  uint64_t v121 = (char *)a1 + v120;
  unint64_t v122 = (char *)a2 + v120;
  *uint64_t v121 = *v122;
  *((void *)v121 + 1) = *((void *)v122 + 1);
  swift_retain();
  swift_release();
  uint64_t v123 = v90[13];
  uint64_t v124 = (char *)a1 + v123;
  uint64_t v125 = (char *)a2 + v123;
  *uint64_t v124 = *v125;
  *((void *)v124 + 1) = *((void *)v125 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25C0DE3FC(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ReportScreen(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = sub_25C0EA328();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
      memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v12 + 32))(a1, a2, v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
    }
    id v19 = (int *)type metadata accessor for Report.Evidence(0);
    uint64_t v20 = v19[6];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    long long v23 = *(_OWORD *)((char *)a2 + v20 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)((char *)a2 + v20);
    *((_OWORD *)v21 + 1) = v23;
    long long v24 = *(_OWORD *)((char *)a2 + v20 + 48);
    *((_OWORD *)v21 + 2) = *(_OWORD *)((char *)a2 + v20 + 32);
    *((_OWORD *)v21 + 3) = v24;
    long long v25 = *(_OWORD *)((char *)a2 + v20 + 112);
    *((_OWORD *)v21 + 6) = *(_OWORD *)((char *)a2 + v20 + 96);
    *((_OWORD *)v21 + 7) = v25;
    long long v26 = *(_OWORD *)((char *)a2 + v20 + 144);
    *((_OWORD *)v21 + 8) = *(_OWORD *)((char *)a2 + v20 + 128);
    *((_OWORD *)v21 + 9) = v26;
    long long v27 = *(_OWORD *)((char *)a2 + v20 + 80);
    *((_OWORD *)v21 + 4) = *(_OWORD *)((char *)a2 + v20 + 64);
    *((_OWORD *)v21 + 5) = v27;
    uint64_t v28 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[*(int *)(v28 + 40)], &v22[*(int *)(v28 + 40)], v11);
    *(void *)((char *)a1 + v19[7]) = *(void *)((char *)a2 + v19[7]);
    *(void *)((char *)a1 + v19[8]) = *(void *)((char *)a2 + v19[8]);
    *(_OWORD *)((char *)a1 + v19[9]) = *(_OWORD *)((char *)a2 + v19[9]);
    *((unsigned char *)a1 + v19[10]) = *((unsigned char *)a2 + v19[10]);
    *((unsigned char *)a1 + v19[11]) = *((unsigned char *)a2 + v19[11]);
    *(_OWORD *)((char *)a1 + v19[12]) = *(_OWORD *)((char *)a2 + v19[12]);
    *(void *)((char *)a1 + v19[13]) = *(void *)((char *)a2 + v19[13]);
    *(_OWORD *)((char *)a1 + v19[14]) = *(_OWORD *)((char *)a2 + v19[14]);
    *(_OWORD *)((char *)a1 + v19[15]) = *(_OWORD *)((char *)a2 + v19[15]);
    *(void *)((char *)a1 + v19[16]) = *(void *)((char *)a2 + v19[16]);
    *(_OWORD *)((char *)a1 + v19[17]) = *(_OWORD *)((char *)a2 + v19[17]);
    *(_OWORD *)((char *)a1 + v19[18]) = *(_OWORD *)((char *)a2 + v19[18]);
    *(void *)((char *)a1 + v19[19]) = *(void *)((char *)a2 + v19[19]);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_13;
    }
    uint64_t v8 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = type metadata accessor for Report.Authority(0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      long long v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      a1[2] = a2[2];
      *((void *)a1 + 6) = *((void *)a2 + 6);
      *(_OWORD *)((char *)a1 + 56) = *(_OWORD *)((char *)a2 + 56);
      *(_OWORD *)((char *)a1 + 72) = *(_OWORD *)((char *)a2 + 72);
      *(_OWORD *)((char *)a1 + 88) = *(_OWORD *)((char *)a2 + 88);
      uint64_t v15 = *(int *)(v8 + 28);
      uint64_t v76 = (char *)a1 + v15;
      uint64_t v16 = (char *)a2 + v15;
      uint64_t v17 = sub_25C0EA238();
      uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
      v18(v76, v16, v17);
      v18((char *)a1 + *(int *)(v8 + 32), (char *)a2 + *(int *)(v8 + 32), v17);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
  }
  swift_storeEnumTagMultiPayload();
LABEL_13:
  uint64_t v77 = a3;
  uint64_t v29 = a3[5];
  uint64_t v30 = (_OWORD *)((char *)a1 + v29);
  uint64_t v31 = (_OWORD *)((char *)a2 + v29);
  uint64_t v32 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  uint64_t v33 = *(void *)(v32 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
  {
    uint64_t v34 = type metadata accessor for Report.Authority(0);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    long long v35 = v31[1];
    _OWORD *v30 = *v31;
    v30[1] = v35;
    v30[2] = v31[2];
    *((void *)v30 + 6) = *((void *)v31 + 6);
    *(_OWORD *)((char *)v30 + 56) = *(_OWORD *)((char *)v31 + 56);
    *(_OWORD *)((char *)v30 + 72) = *(_OWORD *)((char *)v31 + 72);
    *(_OWORD *)((char *)v30 + 88) = *(_OWORD *)((char *)v31 + 88);
    uint64_t v36 = *(int *)(v32 + 28);
    uint64_t v75 = (char *)v30 + v36;
    uint64_t v37 = (char *)v31 + v36;
    uint64_t v38 = sub_25C0EA238();
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32);
    v39(v75, v37, v38);
    v39((char *)v30 + *(int *)(v32 + 32), (char *)v31 + *(int *)(v32 + 32), v38);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  uint64_t v40 = v77[7];
  *(_OWORD *)((char *)a1 + v77[6]) = *(_OWORD *)((char *)a2 + v77[6]);
  uint64_t v41 = (void *)((char *)a1 + v40);
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = *(void *)((char *)a2 + v40);
  uint64_t v44 = *(void *)((char *)a2 + v40 + 8);
  *uint64_t v41 = v43;
  v41[1] = v44;
  uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32);
  uint64_t v46 = (char *)v41 + v45;
  uint64_t v47 = &v42[v45];
  uint64_t v48 = sub_25C0EA328();
  uint64_t v49 = *(void *)(v48 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v47, v48);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  }
  uint64_t v51 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v52 = v51[6];
  int v53 = &v46[v52];
  int v54 = &v47[v52];
  long long v55 = *(_OWORD *)&v47[v52 + 16];
  *(_OWORD *)int v53 = *(_OWORD *)&v47[v52];
  *((_OWORD *)v53 + 1) = v55;
  long long v56 = *(_OWORD *)&v47[v52 + 48];
  *((_OWORD *)v53 + 2) = *(_OWORD *)&v47[v52 + 32];
  *((_OWORD *)v53 + 3) = v56;
  long long v57 = *(_OWORD *)&v47[v52 + 112];
  *((_OWORD *)v53 + 6) = *(_OWORD *)&v47[v52 + 96];
  *((_OWORD *)v53 + 7) = v57;
  long long v58 = *(_OWORD *)&v47[v52 + 144];
  *((_OWORD *)v53 + 8) = *(_OWORD *)&v47[v52 + 128];
  *((_OWORD *)v53 + 9) = v58;
  long long v59 = *(_OWORD *)&v47[v52 + 80];
  *((_OWORD *)v53 + 4) = *(_OWORD *)&v47[v52 + 64];
  *((_OWORD *)v53 + 5) = v59;
  uint64_t v60 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(&v53[*(int *)(v60 + 40)], &v54[*(int *)(v60 + 40)], v48);
  *(void *)&v46[v51[7]] = *(void *)&v47[v51[7]];
  *(void *)&v46[v51[8]] = *(void *)&v47[v51[8]];
  *(_OWORD *)&v46[v51[9]] = *(_OWORD *)&v47[v51[9]];
  v46[v51[10]] = v47[v51[10]];
  v46[v51[11]] = v47[v51[11]];
  *(_OWORD *)&v46[v51[12]] = *(_OWORD *)&v47[v51[12]];
  *(void *)&v46[v51[13]] = *(void *)&v47[v51[13]];
  *(_OWORD *)&v46[v51[14]] = *(_OWORD *)&v47[v51[14]];
  *(_OWORD *)&v46[v51[15]] = *(_OWORD *)&v47[v51[15]];
  *(void *)&v46[v51[16]] = *(void *)&v47[v51[16]];
  *(_OWORD *)&v46[v51[17]] = *(_OWORD *)&v47[v51[17]];
  *(_OWORD *)&v46[v51[18]] = *(_OWORD *)&v47[v51[18]];
  *(void *)&v46[v51[19]] = *(void *)&v47[v51[19]];
  uint64_t v61 = v77[8];
  uint64_t v62 = v77[9];
  uint64_t v63 = (char *)a1 + v61;
  uint64_t v64 = (char *)a2 + v61;
  long long v65 = *((_OWORD *)v64 + 1);
  *(_OWORD *)uint64_t v63 = *(_OWORD *)v64;
  *((_OWORD *)v63 + 1) = v65;
  v63[32] = v64[32];
  uint64_t v66 = (char *)a1 + v62;
  uint64_t v67 = (char *)a2 + v62;
  *(_OWORD *)uint64_t v66 = *(_OWORD *)v67;
  v66[16] = v67[16];
  uint64_t v68 = v77[11];
  *(_OWORD *)((char *)a1 + v77[10]) = *(_OWORD *)((char *)a2 + v77[10]);
  uint64_t v69 = (char *)a1 + v68;
  uint64_t v70 = (char *)a2 + v68;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v72 = sub_25C0EA748();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(v69, v70, v72);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v69, v70, *(void *)(*(void *)(v71 - 8) + 64));
  }
  uint64_t v73 = v77[13];
  *(_OWORD *)((char *)a1 + v77[12]) = *(_OWORD *)((char *)a2 + v77[12]);
  *(_OWORD *)((char *)a1 + v73) = *(_OWORD *)((char *)a2 + v73);
  return a1;
}

_OWORD *sub_25C0DEC5C(_OWORD *a1, _OWORD *a2, int *a3)
{
  unint64_t v3 = a3;
  if (a1 != a2)
  {
    sub_25C0D14C8((uint64_t)a1, type metadata accessor for ReportScreen);
    uint64_t v6 = type metadata accessor for ReportScreen(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_25C0EA328();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v12 + 32))(a1, a2, v11);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
      uint64_t v20 = (int *)type metadata accessor for Report.Evidence(0);
      uint64_t v21 = v20[6];
      uint64_t v22 = (char *)a1 + v21;
      long long v23 = (char *)a2 + v21;
      long long v24 = *(_OWORD *)((char *)a2 + v21 + 16);
      *(_OWORD *)uint64_t v22 = *(_OWORD *)((char *)a2 + v21);
      *((_OWORD *)v22 + 1) = v24;
      long long v25 = *(_OWORD *)((char *)a2 + v21 + 48);
      *((_OWORD *)v22 + 2) = *(_OWORD *)((char *)a2 + v21 + 32);
      *((_OWORD *)v22 + 3) = v25;
      long long v26 = *(_OWORD *)((char *)a2 + v21 + 112);
      *((_OWORD *)v22 + 6) = *(_OWORD *)((char *)a2 + v21 + 96);
      *((_OWORD *)v22 + 7) = v26;
      long long v27 = *(_OWORD *)((char *)a2 + v21 + 144);
      *((_OWORD *)v22 + 8) = *(_OWORD *)((char *)a2 + v21 + 128);
      *((_OWORD *)v22 + 9) = v27;
      long long v28 = *(_OWORD *)((char *)a2 + v21 + 80);
      *((_OWORD *)v22 + 4) = *(_OWORD *)((char *)a2 + v21 + 64);
      *((_OWORD *)v22 + 5) = v28;
      uint64_t v29 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v22[*(int *)(v29 + 40)], &v23[*(int *)(v29 + 40)], v11);
      *(void *)((char *)a1 + v20[7]) = *(void *)((char *)a2 + v20[7]);
      *(void *)((char *)a1 + v20[8]) = *(void *)((char *)a2 + v20[8]);
      *(_OWORD *)((char *)a1 + v20[9]) = *(_OWORD *)((char *)a2 + v20[9]);
      *((unsigned char *)a1 + v20[10]) = *((unsigned char *)a2 + v20[10]);
      *((unsigned char *)a1 + v20[11]) = *((unsigned char *)a2 + v20[11]);
      *(_OWORD *)((char *)a1 + v20[12]) = *(_OWORD *)((char *)a2 + v20[12]);
      *(void *)((char *)a1 + v20[13]) = *(void *)((char *)a2 + v20[13]);
      *(_OWORD *)((char *)a1 + v20[14]) = *(_OWORD *)((char *)a2 + v20[14]);
      *(_OWORD *)((char *)a1 + v20[15]) = *(_OWORD *)((char *)a2 + v20[15]);
      *(void *)((char *)a1 + v20[16]) = *(void *)((char *)a2 + v20[16]);
      *(_OWORD *)((char *)a1 + v20[17]) = *(_OWORD *)((char *)a2 + v20[17]);
      *(_OWORD *)((char *)a1 + v20[18]) = *(_OWORD *)((char *)a2 + v20[18]);
      *(void *)((char *)a1 + v20[19]) = *(void *)((char *)a2 + v20[19]);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        goto LABEL_14;
      }
      uint64_t v8 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      uint64_t v9 = *(void *)(v8 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        uint64_t v10 = type metadata accessor for Report.Authority(0);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        long long v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        a1[2] = a2[2];
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *(_OWORD *)((char *)a1 + 56) = *(_OWORD *)((char *)a2 + 56);
        *(_OWORD *)((char *)a1 + 72) = *(_OWORD *)((char *)a2 + 72);
        *(_OWORD *)((char *)a1 + 88) = *(_OWORD *)((char *)a2 + 88);
        uint64_t v15 = *(int *)(v8 + 28);
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (char *)a2 + v15;
        uint64_t v18 = sub_25C0EA238();
        id v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32);
        v19(v16, v17, v18);
        v19((char *)a1 + *(int *)(v8 + 32), (char *)a2 + *(int *)(v8 + 32), v18);
        unint64_t v3 = a3;
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_14:
  uint64_t v30 = v3[5];
  uint64_t v31 = (uint64_t)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  uint64_t v34 = *(void *)(v33 - 8);
  long long v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35((uint64_t)v32, 1, v33);
  if (v36)
  {
    if (!v37)
    {
      long long v38 = *((_OWORD *)v32 + 1);
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
      *(_OWORD *)(v31 + 16) = v38;
      *(_OWORD *)(v31 + 32) = *((_OWORD *)v32 + 2);
      *(void *)(v31 + 48) = *((void *)v32 + 6);
      *(_OWORD *)(v31 + 56) = *(_OWORD *)(v32 + 56);
      *(_OWORD *)(v31 + 72) = *(_OWORD *)(v32 + 72);
      *(_OWORD *)(v31 + 88) = *(_OWORD *)(v32 + 88);
      uint64_t v39 = *(int *)(v33 + 28);
      uint64_t v131 = v31 + v39;
      uint64_t v40 = &v32[v39];
      uint64_t v41 = sub_25C0EA238();
      uint64_t v42 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v41 - 8) + 32);
      v42(v131, v40, v41);
      v42(v31 + *(int *)(v33 + 32), &v32[*(int *)(v33 + 32)], v41);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v37)
  {
    sub_25C0D14C8(v31, type metadata accessor for Report.Authority.DirectAuthorityDetails);
LABEL_19:
    uint64_t v43 = type metadata accessor for Report.Authority(0);
    memcpy((void *)v31, v32, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_20;
  }
  uint64_t v121 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = *(void *)v32;
  *(void *)(v31 + 8) = v121;
  swift_bridgeObjectRelease();
  uint64_t v122 = *((void *)v32 + 3);
  *(void *)(v31 + 16) = *((void *)v32 + 2);
  *(void *)(v31 + 24) = v122;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v31 + 32) = v32[32];
  *(void *)(v31 + 40) = *((void *)v32 + 5);
  swift_bridgeObjectRelease();
  uint64_t v123 = *(void **)(v31 + 48);
  *(void *)(v31 + 48) = *((void *)v32 + 6);

  uint64_t v124 = *((void *)v32 + 8);
  *(void *)(v31 + 56) = *((void *)v32 + 7);
  *(void *)(v31 + 64) = v124;
  swift_bridgeObjectRelease();
  uint64_t v125 = *((void *)v32 + 10);
  *(void *)(v31 + 72) = *((void *)v32 + 9);
  *(void *)(v31 + 80) = v125;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v31 + 88) = v32[88];
  *(void *)(v31 + 96) = *((void *)v32 + 12);
  swift_bridgeObjectRelease();
  uint64_t v126 = *(int *)(v33 + 28);
  uint64_t v127 = v31 + v126;
  uint64_t v128 = &v32[v126];
  uint64_t v129 = sub_25C0EA238();
  uint64_t v130 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v129 - 8) + 40);
  v130(v127, v128, v129);
  v130(v31 + *(int *)(v33 + 32), &v32[*(int *)(v33 + 32)], v129);
LABEL_20:
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  swift_release();
  uint64_t v44 = a3[7];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(void *)((char *)a1 + v44) = *(void *)((char *)a2 + v44);
  swift_release();
  *((void *)v45 + 1) = *((void *)v46 + 1);
  swift_release();
  uint64_t v47 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32);
  uint64_t v48 = &v45[v47];
  uint64_t v49 = &v46[v47];
  uint64_t v50 = sub_25C0EA328();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 48);
  int v53 = v52(v48, 1, v50);
  int v54 = v52(v49, 1, v50);
  if (v53)
  {
    if (!v54)
    {
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v48, v49, v50);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v50);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v54)
  {
    (*(void (**)(char *, uint64_t))(v51 + 8))(v48, v50);
LABEL_25:
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589720);
    memcpy(v48, v49, *(void *)(*(void *)(v55 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v51 + 40))(v48, v49, v50);
LABEL_26:
  long long v56 = (int *)type metadata accessor for Report.Evidence(0);
  uint64_t v57 = v56[6];
  long long v58 = &v48[v57];
  long long v59 = &v49[v57];
  uint64_t v60 = *(void *)&v49[v57 + 8];
  *(void *)long long v58 = *(void *)&v49[v57];
  *((void *)v58 + 1) = v60;
  swift_bridgeObjectRelease();
  uint64_t v61 = *((void *)v59 + 3);
  *((void *)v58 + 2) = *((void *)v59 + 2);
  *((void *)v58 + 3) = v61;
  swift_bridgeObjectRelease();
  uint64_t v62 = *((void *)v59 + 5);
  *((void *)v58 + 4) = *((void *)v59 + 4);
  *((void *)v58 + 5) = v62;
  swift_bridgeObjectRelease();
  uint64_t v63 = *((void *)v59 + 7);
  *((void *)v58 + 6) = *((void *)v59 + 6);
  *((void *)v58 + 7) = v63;
  swift_bridgeObjectRelease();
  uint64_t v64 = *((void *)v59 + 9);
  *((void *)v58 + 8) = *((void *)v59 + 8);
  *((void *)v58 + 9) = v64;
  swift_bridgeObjectRelease();
  uint64_t v65 = *((void *)v59 + 11);
  *((void *)v58 + 10) = *((void *)v59 + 10);
  *((void *)v58 + 11) = v65;
  swift_bridgeObjectRelease();
  uint64_t v66 = *((void *)v59 + 13);
  *((void *)v58 + 12) = *((void *)v59 + 12);
  *((void *)v58 + 13) = v66;
  swift_bridgeObjectRelease();
  uint64_t v67 = *((void *)v59 + 15);
  *((void *)v58 + 14) = *((void *)v59 + 14);
  *((void *)v58 + 15) = v67;
  swift_bridgeObjectRelease();
  uint64_t v68 = *((void *)v59 + 17);
  *((void *)v58 + 16) = *((void *)v59 + 16);
  *((void *)v58 + 17) = v68;
  swift_bridgeObjectRelease();
  uint64_t v69 = *((void *)v59 + 19);
  *((void *)v58 + 18) = *((void *)v59 + 18);
  *((void *)v58 + 19) = v69;
  swift_bridgeObjectRelease();
  uint64_t v70 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, char *, uint64_t))(v51 + 40))(&v58[*(int *)(v70 + 40)], &v59[*(int *)(v70 + 40)], v50);
  *(void *)&v48[v56[7]] = *(void *)&v49[v56[7]];
  swift_bridgeObjectRelease();
  *(void *)&v48[v56[8]] = *(void *)&v49[v56[8]];
  uint64_t v71 = v56[9];
  uint64_t v72 = &v48[v71];
  uint64_t v73 = &v49[v71];
  uint64_t v75 = *(void *)v73;
  uint64_t v74 = *((void *)v73 + 1);
  *(void *)uint64_t v72 = v75;
  *((void *)v72 + 1) = v74;
  swift_bridgeObjectRelease();
  v48[v56[10]] = v49[v56[10]];
  v48[v56[11]] = v49[v56[11]];
  uint64_t v76 = v56[12];
  uint64_t v77 = &v48[v76];
  uint64_t v78 = &v49[v76];
  uint64_t v80 = *(void *)v78;
  uint64_t v79 = *((void *)v78 + 1);
  *(void *)uint64_t v77 = v80;
  *((void *)v77 + 1) = v79;
  swift_bridgeObjectRelease();
  *(void *)&v48[v56[13]] = *(void *)&v49[v56[13]];
  swift_bridgeObjectRelease();
  uint64_t v81 = v56[14];
  uint64_t v82 = (uint64_t)&v48[v81];
  uint64_t v83 = &v49[v81];
  unint64_t v84 = *(void *)&v48[v81 + 8];
  if (v84 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v82 = *(_OWORD *)v83;
    uint64_t v85 = a3;
  }
  else
  {
    unint64_t v86 = *((void *)v83 + 1);
    uint64_t v85 = a3;
    if (v86 >> 60 == 15)
    {
      sub_25C052A18(v82);
      *(_OWORD *)uint64_t v82 = *(_OWORD *)v83;
    }
    else
    {
      uint64_t v87 = *(void *)v82;
      *(void *)uint64_t v82 = *(void *)v83;
      *(void *)(v82 + 8) = v86;
      sub_25C035294(v87, v84);
    }
  }
  uint64_t v88 = v56[15];
  unint64_t v89 = &v48[v88];
  uint64_t v90 = &v49[v88];
  uint64_t v92 = *(void *)v90;
  uint64_t v91 = *((void *)v90 + 1);
  *(void *)unint64_t v89 = v92;
  *((void *)v89 + 1) = v91;
  swift_bridgeObjectRelease();
  *(void *)&v48[v56[16]] = *(void *)&v49[v56[16]];
  uint64_t v93 = v56[17];
  unint64_t v94 = &v48[v93];
  uint64_t v95 = &v49[v93];
  uint64_t v97 = *(void *)v95;
  uint64_t v96 = *((void *)v95 + 1);
  *(void *)unint64_t v94 = v97;
  *((void *)v94 + 1) = v96;
  swift_bridgeObjectRelease();
  uint64_t v98 = v56[18];
  uint64_t v99 = &v48[v98];
  uint64_t v100 = &v49[v98];
  uint64_t v102 = *(void *)v100;
  uint64_t v101 = *((void *)v100 + 1);
  *(void *)uint64_t v99 = v102;
  *((void *)v99 + 1) = v101;
  swift_bridgeObjectRelease();
  *(void *)&v48[v56[19]] = *(void *)&v49[v56[19]];
  uint64_t v103 = v85[8];
  uint64_t v104 = (char *)a1 + v103;
  uint64_t v105 = (char *)a2 + v103;
  *(void *)uint64_t v104 = *(void *)((char *)a2 + v103);
  v104[8] = *((unsigned char *)a2 + v103 + 8);
  *((void *)v104 + 2) = *(void *)((char *)a2 + v103 + 16);
  swift_release();
  *((void *)v104 + 3) = *((void *)v105 + 3);
  v104[32] = v105[32];
  uint64_t v106 = v85[9];
  uint64_t v107 = (char *)a1 + v106;
  uint64_t v108 = (char *)a2 + v106;
  *(void *)((char *)a1 + v106) = *(void *)((char *)a2 + v106);
  swift_release();
  *((void *)v107 + 1) = *((void *)v108 + 1);
  swift_release();
  v107[16] = v108[16];
  *(_OWORD *)((char *)a1 + v85[10]) = *(_OWORD *)((char *)a2 + v85[10]);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v109 = v85[11];
    uint64_t v110 = (char *)a1 + v109;
    uint64_t v111 = (char *)a2 + v109;
    sub_25C02FBF0((uint64_t)a1 + v109, &qword_26A5890F0);
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v113 = sub_25C0EA748();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 32))(v110, v111, v113);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v110, v111, *(void *)(*(void *)(v112 - 8) + 64));
    }
  }
  uint64_t v114 = v85[12];
  uint64_t v115 = (char *)a1 + v114;
  uint64_t v116 = (char *)a2 + v114;
  *uint64_t v115 = *v116;
  *((void *)v115 + 1) = *((void *)v116 + 1);
  swift_release();
  uint64_t v117 = v85[13];
  uint64_t v118 = (char *)a1 + v117;
  uint64_t v119 = (char *)a2 + v117;
  *uint64_t v118 = *v119;
  *((void *)v118 + 1) = *((void *)v119 + 1);
  swift_release();
  return a1;
}

uint64_t sub_25C0DF85C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C0DF870);
}

uint64_t sub_25C0DF870(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ReportScreen(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for Report.Authority(0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[7];
      goto LABEL_11;
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589300);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[11];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_25C0DFA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C0DFA58);
}

uint64_t sub_25C0DFA58(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for ReportScreen(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = type metadata accessor for Report.Authority(0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589168);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589300);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[11];

  return v18(v20, a2, a2, v19);
}

void sub_25C0DFC2C()
{
  type metadata accessor for ReportScreen(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Report.Authority(319);
    if (v1 <= 0x3F)
    {
      sub_25C0DFDF8(319, (unint64_t *)&qword_26A589310, type metadata accessor for Report.Evidence, MEMORY[0x263F1B750]);
      if (v2 <= 0x3F)
      {
        sub_25C0DFDF8(319, &qword_26A589308, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_25C0DFDF8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t destroy for _ReportOverviewScreen.Footnote(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for _ReportOverviewScreen.Footnote(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for _ReportOverviewScreen.Footnote(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8))
  {
    if (v4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25C08539C(a1);
      long long v6 = a2[1];
      long long v5 = a2[2];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *a2;
    long long v8 = a2[2];
    *(_OWORD *)(a1 + 16) = a2[1];
    *(_OWORD *)(a1 + 32) = v8;
    *(_OWORD *)a1 = v7;
  }
  return a1;
}

uint64_t assignWithTake for _ReportOverviewScreen.Footnote(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 8)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4)
  {
    sub_25C08539C(a1);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ReportOverviewScreen.Footnote(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for _ReportOverviewScreen.Footnote(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _ReportOverviewScreen.Footnote()
{
  return &type metadata for _ReportOverviewScreen.Footnote;
}

ValueMetadata *type metadata accessor for ReportTranscriptLink()
{
  return &type metadata for ReportTranscriptLink;
}

uint64_t *sub_25C0E01A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    long long v7 = (uint64_t *)((char *)a1 + v6);
    long long v8 = (uint64_t *)((char *)a2 + v6);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_25C0EA748();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *long long v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25C0E02C0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25C0EA748();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_25C0E0378(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25C0EA748();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    *uint64_t v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25C0E0440(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    long long v8 = (void *)((char *)a2 + v6);
    sub_25C02FBF0((uint64_t)a1 + v6, &qword_26A5890F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_25C0EA748();
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

void *sub_25C0E0534(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25C0EA748();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_25C0E0608(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_25C02FBF0((uint64_t)a1 + v6, &qword_26A5890F0);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_25C0EA748();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25C0E0704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C0E0718);
}

uint64_t sub_25C0E0718(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589300);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25C0E07CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C0E07E0);
}

void *sub_25C0E07E0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A589300);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25C0E088C()
{
  sub_25C0DFDF8(319, &qword_26A589308, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for ReportFormTextRow()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ReportFormTextRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ReportFormTextRow(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = a2[8];
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  uint64_t v5 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v5;
  return a1;
}

__n128 __swift_memcpy89_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ReportFormTextRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportFormTextRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReportFormTextRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportFormTextRow()
{
  return &type metadata for ReportFormTextRow;
}

uint64_t sub_25C0E0CB8()
{
  sub_25C0EBE08();
  uint64_t result = sub_25C0EB498();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C0E0D64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  unint64_t v9 = v7 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = v7 + 8;
  uint64_t v11 = v7 + 16;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v12 = *(void *)(v5 + 64);
  }
  else {
    size_t v12 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v13 = ((v7 + 16) & ~(unint64_t)v7)
      + v12
      + (v9 & (v7 + 8));
  int v14 = v7 & 0x100000;
  uint64_t v15 = *a2;
  *a1 = *a2;
  if (v8 > 7 || v14 != 0 || v13 > 0x18)
  {
    a1 = (uint64_t *)(v15 + (v9 & v11));
    swift_retain();
  }
  else
  {
    uint64_t v18 = (void *)(v9 & ((unint64_t)a1 + 15));
    uint64_t v19 = (void *)(v9 & ((unint64_t)a2 + 15));
    void *v18 = *v19;
    uint64_t v20 = ~v8;
    uint64_t v21 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v22 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v21 = *v22;
    long long v23 = (void *)(((unint64_t)v21 + v10) & v20);
    long long v24 = (const void *)(((unint64_t)v22 + v10) & v20);
    long long v25 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v25(v24, 1, v4))
    {
      memcpy(v23, v24, v12);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v23, v24, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v23, 0, 1, v4);
    }
  }
  return a1;
}

uint64_t sub_25C0E0F14(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(v4 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v9 + 80);
  swift_release();
  swift_release();
  unint64_t v6 = (v5 + ((((a1 + (v5 | 7) + 8) & ~(v5 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v5;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v4);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);
    return v8(v6, v4);
  }
  return result;
}

void *sub_25C0E1014(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 | 7) + 8;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  uint64_t v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  unint64_t v13 = (void *)(((unint64_t)v11 + v7 + 8) & ~v7);
  int v14 = (const void *)(((unint64_t)v12 + v7 + 8) & ~v7);
  uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v15(v14, 1, v4))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v16 = *(void *)(v6 + 64);
    }
    else {
      size_t v16 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v13, v14, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v13, v14, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v13, 0, 1, v4);
  }
  return a1;
}

void *sub_25C0E1184(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 8;
  uint64_t v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *uint64_t v10 = *v11;
  swift_retain();
  swift_release();
  size_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v12 = *v13;
  swift_retain();
  swift_release();
  int v14 = (void *)(((unint64_t)v12 + v8 + 8) & ~v8);
  uint64_t v15 = (void *)(((unint64_t)v13 + v8 + 8) & ~v8);
  size_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v12) = v16(v14, 1, v6);
  int v17 = v16(v15, 1, v6);
  if (v12)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v14, v15, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
      return a1;
    }
    int v18 = *(_DWORD *)(v7 + 84);
    size_t v19 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v14, v15, v6);
      return a1;
    }
    uint64_t v21 = *(void (**)(void *, uint64_t))(v7 + 8);
    uint64_t v20 = v7 + 8;
    v21(v14, v6);
    int v18 = *(_DWORD *)(v20 + 76);
    size_t v19 = *(void *)(v20 + 56);
  }
  if (v18) {
    size_t v22 = v19;
  }
  else {
    size_t v22 = v19 + 1;
  }
  memcpy(v14, v15, v22);
  return a1;
}

void *sub_25C0E1364(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 | 7) + 8;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  uint64_t v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  unint64_t v13 = (void *)(((unint64_t)v11 + v7 + 8) & ~v7);
  int v14 = (const void *)(((unint64_t)v12 + v7 + 8) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v15 = *(void *)(v6 + 64);
    }
    else {
      size_t v15 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v13, v14, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v13, v14, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v13, 0, 1, v4);
  }
  return a1;
}

void *sub_25C0E14B0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 8;
  uint64_t v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *uint64_t v10 = *v11;
  swift_release();
  size_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v12 = *v13;
  swift_release();
  int v14 = (void *)(((unint64_t)v12 + v8 + 8) & ~v8);
  size_t v15 = (void *)(((unint64_t)v13 + v8 + 8) & ~v8);
  size_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v12) = v16(v14, 1, v6);
  int v17 = v16(v15, 1, v6);
  if (v12)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v14, v15, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
      return a1;
    }
    int v18 = *(_DWORD *)(v7 + 84);
    size_t v19 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(v14, v15, v6);
      return a1;
    }
    uint64_t v21 = *(void (**)(void *, uint64_t))(v7 + 8);
    uint64_t v20 = v7 + 8;
    v21(v14, v6);
    int v18 = *(_DWORD *)(v20 + 76);
    size_t v19 = *(void *)(v20 + 56);
  }
  if (v18) {
    size_t v22 = v19;
  }
  else {
    size_t v22 = v19 + 1;
  }
  memcpy(v14, v15, v22);
  return a1;
}

uint64_t sub_25C0E1678(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  int v6 = v5 - 1;
  if (!v5) {
    int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = v6;
  }
  if (v6 >= 0) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  if (v5) {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v9 | 7;
  uint64_t v12 = v9 + 8;
  int v13 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_31;
  }
  uint64_t v14 = v10 + ((v9 + 16) & ~v9) + (v12 & ~v11);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v18 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_31;
      }
      goto LABEL_23;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_31;
      }
      goto LABEL_23;
    }
    if (v18 < 2)
    {
LABEL_31:
      if (v8 == 0x7FFFFFFF)
      {
        uint64_t v20 = *(void *)a1;
        if (*(void *)a1 >= 0xFFFFFFFFuLL) {
          LODWORD(v20) = -1;
        }
        return (v20 + 1);
      }
      else
      {
        unsigned int v21 = (*(uint64_t (**)(unint64_t))(v4 + 48))((v12
                                                                     + (((((unint64_t)a1 + v11 + 8) & ~v11) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v9);
        if (v21 >= 2) {
          return v21 - 1;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_31;
  }
LABEL_23:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 > 3) {
      LODWORD(v14) = 4;
    }
    switch((int)v14)
    {
      case 2:
        LODWORD(v14) = *a1;
        break;
      case 3:
        LODWORD(v14) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v14) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v14) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v14 | v19) + 1;
}

void sub_25C0E1888(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  int v9 = v8 - 1;
  if (!v8) {
    int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  if (v9 >= 0) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((v11 + 16) & ~v11) + v12 + ((v11 + 8) & ~(v11 | 7));
  BOOL v14 = a3 >= v10;
  unsigned int v15 = a3 - v10;
  if (v15 == 0 || !v14)
  {
LABEL_19:
    if (v10 < a2) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  if (v13 > 3)
  {
    int v6 = 1;
    if (v10 < a2) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  unsigned int v16 = ((v15 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
  if (!HIWORD(v16))
  {
    if (v16 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v16 > 1;
    }
    goto LABEL_19;
  }
  int v6 = 4;
  if (v10 < a2)
  {
LABEL_20:
    unsigned int v17 = ~v10 + a2;
    if (v13 < 4)
    {
      int v18 = (v17 >> (8 * v13)) + 1;
      if (v13)
      {
        int v19 = v17 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v13 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v18;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)&a1[v13] = v18;
        return;
      default:
        return;
    }
  }
LABEL_27:
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0x25C0E1BC8);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v10 == 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v20 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v20 = a2 - 1;
          }
          *(void *)a1 = v20;
        }
        else
        {
          unsigned int v21 = (unsigned char *)((v11 + 8 + ((((unint64_t)&a1[(v11 | 7) + 8] & ~(v11 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v11);
          if (v9 >= a2)
          {
            uint64_t v25 = a2 + 1;
            long long v26 = *(void (**)(unsigned char *, uint64_t))(v7 + 56);
            v26(v21, v25);
          }
          else
          {
            if (v12 <= 3) {
              int v22 = ~(-1 << (8 * v12));
            }
            else {
              int v22 = -1;
            }
            if (v12)
            {
              int v23 = v22 & (~v9 + a2);
              if (v12 <= 3) {
                int v24 = v12;
              }
              else {
                int v24 = 4;
              }
              bzero(v21, v12);
              switch(v24)
              {
                case 2:
                  *(_WORD *)unsigned int v21 = v23;
                  break;
                case 3:
                  *(_WORD *)unsigned int v21 = v23;
                  _OWORD v21[2] = BYTE2(v23);
                  break;
                case 4:
                  *(_DWORD *)unsigned int v21 = v23;
                  break;
                default:
                  *unsigned int v21 = v23;
                  break;
              }
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_25C0E1C00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C0E1C5C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25C0E1D14()
{
  unint64_t result = qword_26A58A248;
  if (!qword_26A58A248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A250);
    sub_25C0583D0(&qword_26A58A258, &qword_26A58A260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A248);
  }
  return result;
}

unint64_t sub_25C0E1DB0()
{
  unint64_t result = qword_26A58A268;
  if (!qword_26A58A268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A270);
    sub_25C0583D0(&qword_26A58A278, &qword_26A58A198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A268);
  }
  return result;
}

uint64_t sub_25C0E1E48()
{
  return sub_25C0583D0(&qword_26A58A280, &qword_26A58A288);
}

unint64_t sub_25C0E1E88()
{
  unint64_t result = qword_26A58A290;
  if (!qword_26A58A290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A1F8);
    sub_25C0E557C(&qword_26A58A298, &qword_26A58A1E8, (void (*)(void))sub_25C0E1F3C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A290);
  }
  return result;
}

unint64_t sub_25C0E1F3C()
{
  unint64_t result = qword_26A58A2A0;
  if (!qword_26A58A2A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A1E0);
    sub_25C0583D0(&qword_26A58A2A8, &qword_26A58A1F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A2A0);
  }
  return result;
}

uint64_t sub_25C0E1FD4()
{
  return swift_getWitnessTable();
}

uint64_t objectdestroy_25Tm()
{
  unint64_t v1 = (int *)(type metadata accessor for ReportTranscriptView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25C0EA748();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C0E2234()
{
  type metadata accessor for ReportTranscriptView(0);

  return sub_25C0D1F44();
}

uint64_t sub_25C0E22A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for CheckSelector() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4 + v2[11];
  swift_release();
  swift_release();
  sub_25C0EBE08();
  uint64_t v10 = v9 + *(int *)(sub_25C0EB498() + 32);
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v10, 1, v1);
  size_t v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v11) {
    v12(v10, v1);
  }
  uint64_t v13 = v3 | v7 | 7;
  uint64_t v14 = (v4 + v5 + v7) & ~v7;
  uint64_t v15 = v14 + v8;
  v12(v0 + v14, v1);

  return MEMORY[0x270FA0238](v0, v15, v13);
}

uint64_t sub_25C0E2450()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for CheckSelector() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0
     + ((v3 + *(void *)(v2 + 64) + *(unsigned __int8 *)(*(void *)(v1 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));

  return sub_25C0D4F70(v0 + v3, v4, v1);
}

uint64_t sub_25C0E252C(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_25C0E256C(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_25C0E25AC()
{
  unint64_t result = qword_26A58A308;
  if (!qword_26A58A308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A308);
  }
  return result;
}

unint64_t sub_25C0E2600()
{
  unint64_t result = qword_26A58A310;
  if (!qword_26A58A310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2B8);
    sub_25C0583D0(&qword_26A58A318, &qword_26A58A2B0);
    sub_25C0583D0(&qword_26A588D40, &qword_26A5897A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A310);
  }
  return result;
}

uint64_t sub_25C0E26C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_25C0E26D4()
{
  unint64_t result = qword_26A58A320;
  if (!qword_26A58A320)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2E0);
    sub_25C0E2774();
    sub_25C0583D0(&qword_26A589220, &qword_26A589228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A320);
  }
  return result;
}

unint64_t sub_25C0E2774()
{
  unint64_t result = qword_26A58A328;
  if (!qword_26A58A328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2D8);
    sub_25C0E2814();
    sub_25C0583D0(&qword_26A5892C0, &qword_26A5892C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A328);
  }
  return result;
}

unint64_t sub_25C0E2814()
{
  unint64_t result = qword_26A58A330;
  if (!qword_26A58A330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2D0);
    sub_25C0E28B4();
    sub_25C0583D0(&qword_26A589108, &qword_26A589100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A330);
  }
  return result;
}

unint64_t sub_25C0E28B4()
{
  unint64_t result = qword_26A58A338;
  if (!qword_26A58A338)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2B8);
    sub_25C0E2600();
    swift_getOpaqueTypeConformance2();
    sub_25C0583D0(&qword_26A588CC8, &qword_26A588CD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A338);
  }
  return result;
}

void sub_25C0E298C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  id v4 = sub_25C0E893C(*(void *)(v2 + 16), *(unsigned char *)(v2 + 24));
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_25C0EB858();
  uint64_t v8 = v7;
  if (v6 != sub_25C0EB858() || v8 != v9)
  {
    char v11 = sub_25C0EC268();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if ((v11 & 1) == 0) {
      return;
    }
    if (v3) {
      goto LABEL_8;
    }
LABEL_12:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1D8);
    sub_25C0EB448();
    return;
  }
  swift_bridgeObjectRelease_n();

  if (!v3) {
    goto LABEL_12;
  }
LABEL_8:
  id v12 = objc_allocWithZone(MEMORY[0x263EFEB28]);
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_25C0EB828();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithStringValue_, v13);

  id v15 = objc_msgSend(v14, sel_formattedStringValue);
  if (!v15) {
    id v15 = objc_msgSend(v14, sel_stringValue);
  }
  sub_25C0EB858();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A1D8);
  sub_25C0EB448();
}

unint64_t sub_25C0E2B50()
{
  unint64_t result = qword_26A58A340;
  if (!qword_26A58A340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2F0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A2E0);
    sub_25C0E26D4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A340);
  }
  return result;
}

unint64_t sub_25C0E2C38()
{
  unint64_t result = qword_26A58A348;
  if (!qword_26A58A348)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A588770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A348);
  }
  return result;
}

uint64_t objectdestroy_29Tm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 105, 7);
}

uint64_t sub_25C0E2D08()
{
  return sub_25C0EA708();
}

uint64_t sub_25C0E2D64(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_25C05CE24(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25C0E2DA8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_25C05CED4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C0E2DEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 136);
  uint64_t v6 = *(void *)(a1 + 144);
  char v7 = *(unsigned char *)(a1 + 152);
  sub_25C05CE24(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_25C05CE24(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_25C05CE24(v5, v6, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C0E2E94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 136);
  uint64_t v6 = *(void *)(a1 + 144);
  char v7 = *(unsigned char *)(a1 + 152);
  sub_25C05CED4(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_25C05CED4(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_25C05CED4(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C0E2F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C0D1528(*(void *)(v1 + 16), a1);
}

uint64_t sub_25C0E2F48()
{
  return sub_25C0EA6E8();
}

uint64_t sub_25C0E2FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_25C0CDAF0(v4, a1);
}

unint64_t sub_25C0E306C()
{
  unint64_t result = qword_26A58A3E8;
  if (!qword_26A58A3E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A3E0);
    sub_25C0583D0(&qword_26A589D20, &qword_26A589D18);
    sub_25C0583D0(&qword_26A589150, &qword_26A589120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A3E8);
  }
  return result;
}

uint64_t sub_25C0E3130()
{
  uint64_t v1 = (int *)type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v35 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v37 = _s14descr27097BA99O6VictimVMa(0);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v37 - 8) + 80);
  uint64_t v34 = *(void *)(*(void *)(v37 - 8) + 64);
  uint64_t v36 = v0;
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v5 = (id *)(v0 + v3);
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v0 + v3, 1, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v7 = (char *)v5 + *(int *)(v6 + 28);
        uint64_t v8 = sub_25C0EA238();
        uint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
        v9(v7, v8);
        v9((char *)v5 + *(int *)(v6 + 32), v8);
      }
      break;
    case 1u:
      uint64_t v10 = sub_25C0EA328();
      uint64_t v11 = *(void *)(v10 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10)) {
        (*(void (**)(id *, uint64_t))(v11 + 8))(v5, v10);
      }
      uint64_t v12 = type metadata accessor for Report.Evidence(0);
      uint64_t v13 = (char *)v5 + *(int *)(v12 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(&v13[*(int *)(v37 + 40)], v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (uint64_t *)((char *)v5 + *(int *)(v12 + 56));
      unint64_t v15 = v14[1];
      if (v15 >> 60 != 15) {
        sub_25C035294(*v14, v15);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  unsigned int v16 = (id *)((char *)v5 + v1[5]);
  uint64_t v17 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v18 = (char *)v16 + *(int *)(v17 + 28);
    uint64_t v19 = sub_25C0EA238();
    uint64_t v20 = *(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8);
    v20(v18, v19);
    v20((char *)v16 + *(int *)(v17 + 32), v19);
  }
  swift_release();
  unsigned int v21 = (char *)v5 + v1[7];
  swift_release();
  swift_release();
  int v22 = &v21[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v23 = sub_25C0EA328();
  uint64_t v24 = *(void *)(v23 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23)) {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
  }
  uint64_t v25 = type metadata accessor for Report.Evidence(0);
  long long v26 = &v22[*(int *)(v25 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v27 = *(void (**)(char *, uint64_t))(v24 + 8);
  v27(&v26[*(int *)(v37 + 40)], v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v28 = (uint64_t *)&v22[*(int *)(v25 + 56)];
  unint64_t v29 = v28[1];
  if (v29 >> 60 != 15) {
    sub_25C035294(*v28, v29);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v30 = (char *)v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v31 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
  }
  else
  {
    swift_release();
  }
  uint64_t v32 = (((v2 + 16) & ~v2) + v35 + v4) & ~v4;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27((char *)(v36 + v32 + *(int *)(v37 + 40)), v23);

  return MEMORY[0x270FA0238](v36, v32 + v34, v2 | v4 | 7);
}

uint64_t sub_25C0E391C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(_s14descr27097BA99O6VictimVMa(0) - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_25C0CDF88(v1 + v4, v7, a1);
}

uint64_t sub_25C0E39F0()
{
  uint64_t v1 = (int *)type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v37 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  unint64_t v4 = (id *)(v0 + v3);
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v5 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = (char *)v4 + *(int *)(v5 + 28);
        uint64_t v7 = sub_25C0EA238();
        uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(v6, v7);
        v8((char *)v4 + *(int *)(v5 + 32), v7);
        uint64_t v3 = (v2 + 24) & ~v2;
      }
      break;
    case 1u:
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v0 + v3, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v3, v9);
      }
      uint64_t v11 = type metadata accessor for Report.Evidence(0);
      uint64_t v12 = (char *)v4 + *(int *)(v11 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v10 + 8))(&v12[*(int *)(v13 + 40)], v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (uint64_t *)((char *)v4 + *(int *)(v11 + 56));
      unint64_t v15 = v14[1];
      if (v15 >> 60 != 15) {
        sub_25C035294(*v14, v15);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  unsigned int v16 = (id *)((char *)v4 + v1[5]);
  uint64_t v17 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v18 = (char *)v16 + *(int *)(v17 + 28);
    uint64_t v19 = sub_25C0EA238();
    uint64_t v36 = v1;
    uint64_t v20 = v0;
    uint64_t v21 = v2;
    uint64_t v22 = v3;
    uint64_t v23 = *(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8);
    v23(v18, v19);
    v23((char *)v16 + *(int *)(v17 + 32), v19);
    uint64_t v3 = v22;
    uint64_t v2 = v21;
    uint64_t v0 = v20;
    uint64_t v1 = v36;
  }
  swift_release();
  uint64_t v24 = (char *)v4 + v1[7];
  swift_release();
  swift_release();
  uint64_t v25 = &v24[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v26 = sub_25C0EA328();
  uint64_t v27 = *(void *)(v26 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26)) {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v26);
  }
  uint64_t v28 = type metadata accessor for Report.Evidence(0);
  unint64_t v29 = &v25[*(int *)(v28 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, uint64_t))(v27 + 8))(&v29[*(int *)(v30 + 40)], v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = (uint64_t *)&v25[*(int *)(v28 + 56)];
  unint64_t v32 = v31[1];
  if (v32 >> 60 != 15) {
    sub_25C035294(*v31, v32);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v33 = (char *)v4 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((v37 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 168, v2 | 7);
}

uint64_t sub_25C0E41B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);

  return sub_25C0CE570(v5, v1 + v4, v6, a1);
}

unint64_t sub_25C0E4254()
{
  unint64_t result = qword_26A58A418;
  if (!qword_26A58A418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A410);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A420);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A428);
    sub_25C0583D0(&qword_26A58A430, &qword_26A58A428);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A438);
    sub_25C0583D0(&qword_26A58A440, &qword_26A58A438);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A418);
  }
  return result;
}

uint64_t sub_25C0E43BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_25C0CF690(v4, a1);
}

unint64_t sub_25C0E442C()
{
  unint64_t result = qword_26A58A458;
  if (!qword_26A58A458)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A450);
    sub_25C0583D0(&qword_26A58A460, &qword_26A58A468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A458);
  }
  return result;
}

uint64_t sub_25C0E44C8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _ReportOverviewScreen(0);
  size_t v3 = sub_25C0CFD08(*(void *)(v1 + 16));
  swift_retain();
  uint64_t result = nullsub_1(v3);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

uint64_t objectdestroy_106Tm()
{
  uint64_t v1 = (int *)type metadata accessor for _ReportOverviewScreen(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v37 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v4 = (id *)(v0 + v3);
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v5 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = (char *)v4 + *(int *)(v5 + 28);
        uint64_t v7 = sub_25C0EA238();
        uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(v6, v7);
        v8((char *)v4 + *(int *)(v5 + 32), v7);
      }
      break;
    case 1u:
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v0 + v3, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v3, v9);
      }
      uint64_t v11 = type metadata accessor for Report.Evidence(0);
      uint64_t v12 = (char *)v4 + *(int *)(v11 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v10 + 8))(&v12[*(int *)(v13 + 40)], v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (uint64_t *)((char *)v4 + *(int *)(v11 + 56));
      unint64_t v15 = v14[1];
      if (v15 >> 60 != 15) {
        sub_25C035294(*v14, v15);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    case 2u:

      break;
    case 3u:
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  unsigned int v16 = (id *)((char *)v4 + v1[5]);
  uint64_t v17 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v18 = (char *)v16 + *(int *)(v17 + 28);
    uint64_t v19 = sub_25C0EA238();
    uint64_t v36 = v1;
    uint64_t v20 = v2;
    uint64_t v21 = v0;
    uint64_t v22 = v3;
    uint64_t v23 = *(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8);
    v23(v18, v19);
    v23((char *)v16 + *(int *)(v17 + 32), v19);
    uint64_t v3 = v22;
    uint64_t v0 = v21;
    uint64_t v2 = v20;
    uint64_t v1 = v36;
  }
  swift_release();
  uint64_t v24 = (char *)v4 + v1[7];
  swift_release();
  swift_release();
  uint64_t v25 = &v24[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A589168) + 32)];
  uint64_t v26 = sub_25C0EA328();
  uint64_t v27 = *(void *)(v26 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26)) {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v26);
  }
  uint64_t v28 = type metadata accessor for Report.Evidence(0);
  unint64_t v29 = &v25[*(int *)(v28 + 24)];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(char *, uint64_t))(v27 + 8))(&v29[*(int *)(v30 + 40)], v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = (uint64_t *)&v25[*(int *)(v28 + 56)];
  unint64_t v32 = v31[1];
  if (v32 >> 60 != 15) {
    sub_25C035294(*v31, v32);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v33 = (char *)v4 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5890F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = sub_25C0EA748();
    (*(void (**)(char *, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v37, v2 | 7);
}

double sub_25C0E4CDC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _ReportOverviewScreen(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_25C0CFF1C(v4, a1);
}

double sub_25C0E4D50(_OWORD *a1)
{
  double result = 0.0;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_25C0E4D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Report.Message();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C0E4DDC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C0E4E14()
{
  sub_25C0CEFCC(*(void *)(v0 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4C0);
  sub_25C0583D0(&qword_26A58A4C8, &qword_26A58A4B8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A4A0);
  sub_25C0E5094();
  swift_getOpaqueTypeConformance2();
  sub_25C0E5134();
  return sub_25C0EB4A8();
}

double sub_25C0E4F2C@<D0>(uint64_t a1@<X8>)
{
  sub_25C046018((uint64_t)&v12);
  long long v3 = v12;
  uint64_t v4 = v13;
  uint64_t v5 = v14;
  char v6 = v15;
  long long v7 = v16;
  long long v8 = v17;
  uint64_t v9 = v18;
  char v10 = v19;
  uint64_t v11 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A589350);
  sub_25C088CCC();
  *(void *)&double result = sub_25C081710(&v3, (uint64_t)sub_25C0CF33C, 0, a1).n128_u64[0];
  return result;
}

unint64_t sub_25C0E4FEC()
{
  unint64_t result = qword_26A58A498;
  if (!qword_26A58A498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A490);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A4A0);
    sub_25C0E5094();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A498);
  }
  return result;
}

unint64_t sub_25C0E5094()
{
  unint64_t result = qword_26A58A4A8;
  if (!qword_26A58A4A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A4A0);
    sub_25C0583D0(&qword_26A58A4B0, &qword_26A5892E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A4A8);
  }
  return result;
}

unint64_t sub_25C0E5134()
{
  unint64_t result = qword_26A58A4D0;
  if (!qword_26A58A4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A4D0);
  }
  return result;
}

uint64_t sub_25C0E5188()
{
  uint64_t v1 = (int *)(_s14descr27097BA99O6VictimVMa(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[12];
  uint64_t v8 = sub_25C0EA328();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C0E52C4@<X0>(uint64_t a1@<X8>)
{
  _s14descr27097BA99O6VictimVMa(0);
  if (sub_25C045C84())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A4C0);
    sub_25C0583D0(&qword_26A58A4C8, &qword_26A58A4B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A58A4A0);
    sub_25C0E5094();
    swift_getOpaqueTypeConformance2();
    sub_25C0E5134();
    sub_25C0EB4A8();
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A490);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 0, 1, v2);
  }
  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A490);
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a1, 1, 1, v4);
  }
}

double sub_25C0E54BC@<D0>(uint64_t a1@<X8>)
{
  sub_25C0459A0((uint64_t)&v18);
  long long v13 = v18;
  uint64_t v14 = v19;
  uint64_t v15 = v20;
  char v16 = v21;
  uint64_t v17 = v22;
  sub_25C045B40((uint64_t)&v8);
  __n128 v3 = v8;
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  char v6 = v11;
  uint64_t v7 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A589350);
  sub_25C088CCC();
  *(void *)&double result = sub_25C081540(&v13, &v3, (uint64_t)sub_25C0CE558, 0, a1).n128_u64[0];
  return result;
}

uint64_t sub_25C0E557C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = type metadata accessor for ReportOverviewScreen(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = (id *)(v0 + v3 + *(int *)(v1 + 20));
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v26 = (char *)v5 + *(int *)(v6 + 28);
        uint64_t v7 = sub_25C0EA238();
        uint64_t v27 = v4;
        __n128 v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(v26, v7);
        v8((char *)v5 + *(int *)(v6 + 32), v7);
        uint64_t v4 = v27;
      }
      break;
    case 1u:
      uint64_t v28 = v4;
      uint64_t v9 = sub_25C0EA328();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9)) {
        (*(void (**)(id *, uint64_t))(v10 + 8))(v5, v9);
      }
      uint64_t v11 = type metadata accessor for Report.Evidence(0);
      uint64_t v12 = (char *)v5 + *(int *)(v11 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v10 + 8))(&v12[*(int *)(v13 + 40)], v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)((char *)v5 + *(int *)(v11 + 56));
      unint64_t v15 = v14[1];
      if (v15 >> 60 != 15) {
        sub_25C035294(*v14, v15);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = v28;
      break;
    case 2u:

      break;
    case 3u:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  swift_release();
  swift_release();
  uint64_t v16 = v0 + v3 + *(int *)(v1 + 32);
  uint64_t v17 = type metadata accessor for ReportOverviewScreen._Alert(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17))
  {
    uint64_t v18 = sub_25C0EA328();
    uint64_t v19 = *(void *)(v18 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18)) {
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
    }
    uint64_t v20 = type metadata accessor for Report.Evidence(0);
    uint64_t v21 = v16 + *(int *)(v20 + 24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21 + *(int *)(v22 + 40), v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = (uint64_t *)(v16 + *(int *)(v20 + 56));
    unint64_t v24 = v23[1];
    if (v24 >> 60 != 15) {
      sub_25C035294(*v23, v24);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C0E5BE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ReportOverviewScreen(0);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v6 = type metadata accessor for Report.Evidence(0);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = v4 + v5 + v7;
  uint64_t v41 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v9 = v0 + v4;
  swift_release();
  swift_release();
  uint64_t v10 = (id *)(v0 + v4 + *(int *)(v2 + 20));
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v11 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        long long v38 = (char *)v10 + *(int *)(v11 + 28);
        uint64_t v39 = v3;
        uint64_t v12 = sub_25C0EA238();
        uint64_t v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
        v13(v38, v12);
        uint64_t v14 = v12;
        uint64_t v3 = v39;
        v13((char *)v10 + *(int *)(v11 + 32), v14);
      }
      break;
    case 1u:
      uint64_t v40 = v3;
      uint64_t v15 = sub_25C0EA328();
      uint64_t v16 = *(void *)(v15 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15)) {
        (*(void (**)(id *, uint64_t))(v16 + 8))(v10, v15);
      }
      uint64_t v17 = (char *)v10 + *(int *)(v6 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v16 + 8))(&v17[*(int *)(v18 + 40)], v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v19 = (uint64_t *)((char *)v10 + *(int *)(v6 + 56));
      unint64_t v20 = v19[1];
      if (v20 >> 60 != 15) {
        sub_25C035294(*v19, v20);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = v40;
      break;
    case 2u:

      break;
    case 3u:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  uint64_t v21 = v8 & ~v7;
  swift_release();
  swift_release();
  uint64_t v22 = v9 + *(int *)(v2 + 32);
  uint64_t v23 = type metadata accessor for ReportOverviewScreen._Alert(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v22, 1, v23))
  {
    uint64_t v24 = sub_25C0EA328();
    uint64_t v25 = *(void *)(v24 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v22, 1, v24)) {
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v24);
    }
    uint64_t v26 = v22 + *(int *)(v6 + 24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v27 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26 + *(int *)(v27 + 40), v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = (uint64_t *)(v22 + *(int *)(v6 + 56));
    unint64_t v29 = v28[1];
    if (v29 >> 60 != 15) {
      sub_25C035294(*v28, v29);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  swift_release();
  uint64_t v30 = v1 + v21;
  uint64_t v31 = sub_25C0EA328();
  uint64_t v32 = *(void *)(v31 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v1 + v21, 1, v31)) {
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1 + v21, v31);
  }
  uint64_t v33 = v30 + *(int *)(v6 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v34 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33 + *(int *)(v34 + 40), v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = (uint64_t *)(v30 + *(int *)(v6 + 56));
  unint64_t v36 = v35[1];
  if (v36 >> 60 != 15) {
    sub_25C035294(*v35, v36);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, v21 + v41, v3 | v7 | 7);
}

uint64_t sub_25C0E63B0()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for Report.Evidence(0) - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_25C0CA74C(v0 + v2, v5);
}

uint64_t sub_25C0E6480()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  return sub_25C0CB0A8(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_25C0E64D8()
{
  uint64_t v2 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Report.Evidence(0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_25C03C050;
  return sub_25C0CAAF0((uint64_t)v9, v10, v11, v7, v8);
}

uint64_t objectdestroy_129Tm()
{
  uint64_t v1 = type metadata accessor for ReportOverviewScreen(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for Report.Evidence(0);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v7 = v3 + v4 + v6;
  uint64_t v39 = *(void *)(*(void *)(v5 - 8) + 64);
  swift_unknownObjectRelease();
  uint64_t v8 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v9 = (id *)(v0 + v3 + *(int *)(v1 + 20));
  type metadata accessor for ReportScreen(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v10 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v36 = (char *)v9 + *(int *)(v10 + 28);
        uint64_t v11 = sub_25C0EA238();
        uint64_t v37 = v6;
        uint64_t v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
        v12(v36, v11);
        v12((char *)v9 + *(int *)(v10 + 32), v11);
        uint64_t v6 = v37;
      }
      break;
    case 1u:
      uint64_t v38 = v6;
      uint64_t v13 = sub_25C0EA328();
      uint64_t v14 = *(void *)(v13 - 8);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13)) {
        (*(void (**)(id *, uint64_t))(v14 + 8))(v9, v13);
      }
      uint64_t v15 = (char *)v9 + *(int *)(v5 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = _s14descr27097BA99O6VictimVMa(0);
      (*(void (**)(char *, uint64_t))(v14 + 8))(&v15[*(int *)(v16 + 40)], v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = (uint64_t *)((char *)v9 + *(int *)(v5 + 56));
      unint64_t v18 = v17[1];
      if (v18 >> 60 != 15) {
        sub_25C035294(*v17, v18);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v38;
      break;
    case 2u:

      break;
    case 3u:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  uint64_t v19 = v7 & ~v6;
  swift_release();
  swift_release();
  uint64_t v20 = v8 + *(int *)(v1 + 32);
  uint64_t v21 = type metadata accessor for ReportOverviewScreen._Alert(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v20, 1, v21))
  {
    uint64_t v22 = sub_25C0EA328();
    uint64_t v23 = *(void *)(v22 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22)) {
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v20, v22);
    }
    uint64_t v24 = v20 + *(int *)(v5 + 24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = _s14descr27097BA99O6VictimVMa(0);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24 + *(int *)(v25 + 40), v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = (uint64_t *)(v20 + *(int *)(v5 + 56));
    unint64_t v27 = v26[1];
    if (v27 >> 60 != 15) {
      sub_25C035294(*v26, v27);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A0B0);
  swift_release();
  uint64_t v28 = v0 + v19;
  uint64_t v29 = sub_25C0EA328();
  uint64_t v30 = *(void *)(v29 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v0 + v19, 1, v29)) {
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v0 + v19, v29);
  }
  uint64_t v31 = v28 + *(int *)(v5 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = _s14descr27097BA99O6VictimVMa(0);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31 + *(int *)(v32 + 40), v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = (uint64_t *)(v28 + *(int *)(v5 + 56));
  unint64_t v34 = v33[1];
  if (v34 >> 60 != 15) {
    sub_25C035294(*v33, v34);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v19 + v39, v2 | v6 | 7);
}

uint64_t sub_25C0E6DE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for Report.Evidence(0) - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_25C0C8898((void *)(v1 + v4), v7, a1);
}

uint64_t sub_25C0E6EB8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  unint64_t v4 = (void *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_25C0C8AA8(a1, v4);
}

uint64_t sub_25C0E6F2C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ReportOverviewScreen(0) - 8);
  unint64_t v4 = (unint64_t *)(v1
                          + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_25C0C8BD8(a1, v4);
}

void *sub_25C0E6FA0()
{
  return &unk_25C0F3F80;
}

uint64_t static SCUISensitiveContentOverlayOptions.goToPhone.getter()
{
  return 0x100000000;
}

uint64_t sub_25C0E6FB8(__int16 a1)
{
  if ((a1 & 4) == 0)
  {
    if ((a1 & 8) != 0)
    {
      uint64_t v1 = 32;
      if ((a1 & 0x10) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v1 = 0;
      if ((a1 & 0x10) == 0)
      {
LABEL_7:
        if ((a1 & 0x20) == 0)
        {
          if ((a1 & 0x40) == 0)
          {
            if ((a1 & 0x80) == 0)
            {
              if ((a1 & 0x100) == 0) {
                return v1;
              }
              return v1 | 0x10;
            }
            goto LABEL_24;
          }
          goto LABEL_21;
        }
        goto LABEL_18;
      }
    }
    goto LABEL_15;
  }
  if ((a1 & 8) == 0)
  {
    uint64_t v1 = 64;
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
  uint64_t v1 = 96;
  if ((a1 & 0x10) != 0) {
LABEL_15:
  }
    v1 |= 1uLL;
LABEL_16:
  if ((a1 & 0x20) != 0 && (v1 & 2) == 0) {
LABEL_18:
  }
    v1 |= 2uLL;
  if ((a1 & 0x40) != 0 && (v1 & 4) == 0) {
LABEL_21:
  }
    v1 |= 4uLL;
  if ((a1 & 0x80) != 0 && (v1 & 8) == 0) {
LABEL_24:
  }
    v1 |= 8uLL;
  if ((a1 & 0x100) != 0 && (v1 & 0x10) == 0) {
    return v1 | 0x10;
  }
  return v1;
}

uint64_t sub_25C0E703C(unint64_t a1)
{
  return (a1 >> 2) & 2 | a1 & 4;
}

uint64_t sub_25C0E7050(unint64_t a1)
{
  return (a1 >> 9) & 1;
}

uint64_t sub_25C0E705C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C0EA238();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v42 - v8;
  uint64_t v9 = type metadata accessor for ScannableContent();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void **)((char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (void **)((char *)&v42 - v14);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v42 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v42 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A510);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = (void **)&v24[*(int *)(v22 + 56)];
  sub_25C0E74E0(a1, (uint64_t)v24);
  sub_25C0E74E0(a2, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_25C0E74E0((uint64_t)v24, (uint64_t)v18);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        unint64_t v27 = v43;
        uint64_t v26 = v44;
        uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
        uint64_t v29 = v45;
        v28(v43, v18, v45);
        v28(v7, (char *)v25, v29);
        char v30 = MEMORY[0x26117BB50](v27, v7);
        uint64_t v31 = *(void (**)(char *, uint64_t))(v26 + 8);
        v31(v7, v29);
        v31(v27, v29);
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v45);
      goto LABEL_17;
    case 2u:
      sub_25C0E74E0((uint64_t)v24, (uint64_t)v15);
      uint64_t v32 = *v15;
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_7;
      }
      goto LABEL_15;
    case 3u:
      sub_25C0E74E0((uint64_t)v24, (uint64_t)v12);
      uint64_t v32 = *v12;
      if (swift_getEnumCaseMultiPayload() != 3)
      {
LABEL_15:

        goto LABEL_17;
      }
LABEL_7:
      uint64_t v33 = *v25;
      if (v32)
      {

        if (v33) {
          BOOL v34 = v32 == v33;
        }
        else {
          BOOL v34 = 0;
        }
        char v30 = v34;
      }
      else
      {

        if (v33) {
          char v30 = 0;
        }
        else {
          char v30 = -1;
        }
      }
      goto LABEL_22;
    default:
      sub_25C0E74E0((uint64_t)v24, (uint64_t)v20);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v20, v45);
LABEL_17:
        sub_25C0E7D68((uint64_t)v24);
        char v30 = 0;
      }
      else
      {
        unint64_t v36 = v43;
        uint64_t v35 = v44;
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
        uint64_t v38 = v20;
        uint64_t v39 = v45;
        v37(v43, v38, v45);
        v37(v7, (char *)v25, v39);
        char v30 = MEMORY[0x26117BB50](v36, v7);
        uint64_t v40 = *(void (**)(char *, uint64_t))(v35 + 8);
        v40(v7, v39);
        v40(v36, v39);
LABEL_22:
        sub_25C0E7A50((uint64_t)v24);
      }
      return v30 & 1;
  }
}

uint64_t type metadata accessor for ScannableContent()
{
  uint64_t result = qword_26A594EA0;
  if (!qword_26A594EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C0E74E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScannableContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for SensitiveContentOverlay()
{
  return &type metadata for SensitiveContentOverlay;
}

char *sub_25C0E7554(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *(void *)a1 = *a2;
    a1 = &v6[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 3u:
        uint64_t v7 = *a2;
        *(void *)a1 = *a2;
        uint64_t v8 = v7;
        break;
      default:
        uint64_t v9 = sub_25C0EA238();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_25C0E76E8(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      uint64_t v2 = sub_25C0EA238();
      uint64_t v3 = *(void (**)(void **, uint64_t))(*(void *)(v2 - 8) + 8);
      v3(a1, v2);
      break;
    case 2u:
    case 3u:
      uint64_t v4 = *a1;

      break;
    default:
      return;
  }
}

void **sub_25C0E77B8(void **a1, void **a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 3u:
      uint64_t v4 = *a2;
      *a1 = *a2;
      id v5 = v4;
      break;
    default:
      uint64_t v6 = sub_25C0EA238();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_25C0E78FC(void **a1, void **a2)
{
  if (a1 != a2)
  {
    sub_25C0E7A50((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 3u:
        id v5 = *a2;
        *a1 = *a2;
        id v6 = v5;
        break;
      default:
        uint64_t v4 = sub_25C0EA238();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25C0E7A50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScannableContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25C0E7AAC(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_25C0EA238();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_25C0E7BB8(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25C0E7A50((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_25C0EA238();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25C0E7CD4()
{
  uint64_t result = sub_25C0EA238();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_25C0E7D68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A58A510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_25C0E7DC8@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_25C0E7E28((uint64_t)&v9, a1, a2);
  swift_release();
  double result = *(double *)&v9;
  uint64_t v5 = v10;
  uint64_t v6 = v11;
  char v7 = v12;
  uint64_t v8 = v13;
  *(_OWORD *)a3 = v9;
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 24) = v6;
  *(unsigned char *)(a3 + 32) = v7;
  *(void *)(a3 + 40) = v8;
  return result;
}

uint64_t sub_25C0E7E28(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 2:
      uint64_t v4 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 513;
      MEMORY[0x270FA5388](v4);
      break;
    case 3:
      uint64_t v5 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 769;
      MEMORY[0x270FA5388](v5);
      break;
    case 4:
      uint64_t v6 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 2305;
      MEMORY[0x270FA5388](v6);
      break;
    case 5:
      uint64_t v7 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 1025;
      MEMORY[0x270FA5388](v7);
      break;
    case 6:
      uint64_t v8 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 1281;
      MEMORY[0x270FA5388](v8);
      break;
    case 7:
      uint64_t v9 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 1537;
      MEMORY[0x270FA5388](v9);
      break;
    case 8:
      uint64_t v10 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 1793;
      MEMORY[0x270FA5388](v10);
      break;
    case 9:
      uint64_t v11 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 2049;
      MEMORY[0x270FA5388](v11);
      break;
    case 12:
      switch(a2)
      {
        case 1:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 256;
          break;
        case 2:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 769;
          break;
        case 3:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2305;
          break;
        case 4:
        case 5:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 1;
          break;
        case 6:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 1025;
          break;
        case 7:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 1281;
          break;
        case 8:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 1537;
          break;
        case 9:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 1793;
          break;
        case 10:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2049;
          break;
        case 11:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2561;
          break;
        case 12:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2817;
          break;
        case 19:
        case 20:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2816;
          break;
        case 21:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 2560;
          break;
        default:
          SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
          __int16 v24 = 0;
          break;
      }
      break;
    default:
      uint64_t v12 = SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v19);
      __int16 v24 = 1;
      MEMORY[0x270FA5388](v12);
      break;
  }
  swift_getKeyPath();
  uint64_t v13 = v20;
  uint64_t v14 = v21;
  char v15 = v22;
  uint64_t v16 = v23;
  int v17 = v24;
  *(_OWORD *)a1 = v19;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v14;
  *(unsigned char *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v16;
  return v17 | (HIBYTE(v24) << 8);
}

BOOL sub_25C0E8858(uint64_t a1, char a2)
{
  BOOL v2 = (sub_25C0E7E28((uint64_t)&v4, a1, a2) & 1) == 0;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25C0E88CC(uint64_t a1, char a2)
{
  char v2 = sub_25C0E7E28((uint64_t)&v4, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

id sub_25C0E893C(uint64_t a1, char a2)
{
  char v2 = (unsigned __int16)sub_25C0E7E28((uint64_t)&v4, a1, a2) >> 8;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_25C0E9068(v2);
}

uint64_t sub_25C0E89BC(uint64_t a1, char a2)
{
  uint64_t v2 = ((unsigned __int16)sub_25C0E7E28((uint64_t)&v4, a1, a2) >> 8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25C0E8A2C(uint64_t a1, char a2)
{
  char v2 = (unsigned __int16)sub_25C0E7E28((uint64_t)&v7, a1, a2) >> 8;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = sub_25C0E9068(v2);
  uint64_t v5 = v4;

  return v5;
}

uint64_t sub_25C0E8AAC(uint64_t a1, char a2)
{
  sub_25C0E7E28((uint64_t)&v5, a1, a2);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

BOOL sub_25C0E8B10(void *a1, void *a2)
{
  return *a2 == *a1;
}

uint64_t sub_25C0E8B24(void *a1)
{
  return MEMORY[0x270F9E010](*a1);
}

uint64_t sub_25C0E8B2C@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)(*(void *)result + 16))
  {
    uint64_t v4 = *(void *)result + 168 * v3;
    long long v5 = *(_OWORD *)(v4 + 32);
    long long v6 = *(_OWORD *)(v4 + 64);
    v18[1] = *(_OWORD *)(v4 + 48);
    v18[2] = v6;
    v18[0] = v5;
    long long v7 = *(_OWORD *)(v4 + 80);
    long long v8 = *(_OWORD *)(v4 + 96);
    long long v9 = *(_OWORD *)(v4 + 128);
    v18[5] = *(_OWORD *)(v4 + 112);
    v18[6] = v9;
    v18[3] = v7;
    v18[4] = v8;
    long long v10 = *(_OWORD *)(v4 + 144);
    long long v11 = *(_OWORD *)(v4 + 160);
    long long v12 = *(_OWORD *)(v4 + 176);
    uint64_t v19 = *(void *)(v4 + 192);
    v18[8] = v11;
    v18[9] = v12;
    v18[7] = v10;
    long long v13 = *(_OWORD *)(v4 + 176);
    *(_OWORD *)(a3 + 128) = *(_OWORD *)(v4 + 160);
    *(_OWORD *)(a3 + 144) = v13;
    *(void *)(a3 + 160) = *(void *)(v4 + 192);
    long long v14 = *(_OWORD *)(v4 + 112);
    *(_OWORD *)(a3 + 64) = *(_OWORD *)(v4 + 96);
    *(_OWORD *)(a3 + 80) = v14;
    long long v15 = *(_OWORD *)(v4 + 144);
    *(_OWORD *)(a3 + 96) = *(_OWORD *)(v4 + 128);
    *(_OWORD *)(a3 + 112) = v15;
    long long v16 = *(_OWORD *)(v4 + 48);
    *(_OWORD *)a3 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)(a3 + 16) = v16;
    long long v17 = *(_OWORD *)(v4 + 80);
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v4 + 64);
    *(_OWORD *)(a3 + 48) = v17;
    return sub_25C058234((uint64_t)v18);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C0E8BE0(long long *a1, uint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a3;
  long long v5 = a1[9];
  long long v39 = a1[8];
  long long v40 = v5;
  uint64_t v41 = *((void *)a1 + 20);
  long long v6 = a1[5];
  long long v35 = a1[4];
  long long v36 = v6;
  long long v7 = a1[7];
  long long v37 = a1[6];
  long long v38 = v7;
  long long v8 = a1[1];
  long long v31 = *a1;
  long long v32 = v8;
  long long v9 = a1[3];
  long long v33 = a1[2];
  long long v34 = v9;
  uint64_t v10 = *a2;
  sub_25C058234((uint64_t)&v31);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if ((v4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = (uint64_t)sub_25C0E9228(v10);
  uint64_t v10 = result;
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v4 < *(void *)(v10 + 16))
  {
    uint64_t v12 = v10 + 168 * v4;
    long long v13 = *(_OWORD *)(v12 + 32);
    long long v14 = *(_OWORD *)(v12 + 64);
    v29[1] = *(_OWORD *)(v12 + 48);
    v29[2] = v14;
    v29[0] = v13;
    long long v15 = *(_OWORD *)(v12 + 80);
    long long v16 = *(_OWORD *)(v12 + 96);
    long long v17 = *(_OWORD *)(v12 + 128);
    v29[5] = *(_OWORD *)(v12 + 112);
    v29[6] = v17;
    v29[3] = v15;
    v29[4] = v16;
    long long v18 = *(_OWORD *)(v12 + 144);
    long long v19 = *(_OWORD *)(v12 + 160);
    long long v20 = *(_OWORD *)(v12 + 176);
    uint64_t v30 = *(void *)(v12 + 192);
    v29[8] = v19;
    v29[9] = v20;
    v29[7] = v18;
    long long v21 = v31;
    long long v22 = v33;
    *(_OWORD *)(v12 + 48) = v32;
    *(_OWORD *)(v12 + 64) = v22;
    *(_OWORD *)(v12 + 32) = v21;
    long long v23 = v34;
    long long v24 = v35;
    long long v25 = v37;
    *(_OWORD *)(v12 + 112) = v36;
    *(_OWORD *)(v12 + 128) = v25;
    *(_OWORD *)(v12 + 80) = v23;
    *(_OWORD *)(v12 + 96) = v24;
    long long v26 = v38;
    long long v27 = v39;
    long long v28 = v40;
    *(void *)(v12 + 192) = v41;
    *(_OWORD *)(v12 + 160) = v27;
    *(_OWORD *)(v12 + 176) = v28;
    *(_OWORD *)(v12 + 144) = v26;
    uint64_t result = sub_25C058304((uint64_t)v29);
    *a2 = v10;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25C0E8D08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C044ECC();
  *a1 = result;
  return result;
}

uint64_t sub_25C0E8D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C044F64();
  *a1 = result;
  a1[1] = v3;
  return result;
}

double sub_25C0E8D98@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C045800(*a1, (uint64_t)&v8);
  double result = *(double *)&v8;
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  char v6 = v11;
  uint64_t v7 = v12;
  *(_OWORD *)a2 = v8;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v7;
  return result;
}

uint64_t sub_25C0E8DEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C044ED4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

double sub_25C0E8E18@<D0>(_OWORD *a1@<X8>)
{
  sub_25C045224((uint64_t)v4);
  long long v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  double result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

uint64_t sub_25C0E8E5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C0451B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C0E8E88(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 12:
      return sub_25C0EC358();
    default:
      sub_25C0EC358();
      break;
  }
  return sub_25C0EC358();
}

uint64_t sub_25C0E8FA8()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_25C0EC348();
  sub_25C0E8E88((uint64_t)v4, v1, v2);
  return sub_25C0EC368();
}

uint64_t sub_25C0E8FF8(uint64_t a1)
{
  return sub_25C0E8E88(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

uint64_t sub_25C0E9004()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_25C0EC348();
  sub_25C0E8E88((uint64_t)v4, v1, v2);
  return sub_25C0EC368();
}

BOOL sub_25C0E9050(uint64_t a1, uint64_t a2)
{
  return sub_25C0E9360(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

id sub_25C0E9068(char a1)
{
  uint64_t v1 = (id *)MEMORY[0x263F83A30];
  id v2 = 0;
  switch(a1)
  {
    case 1:
      uint64_t v1 = (id *)MEMORY[0x263F839E0];
      goto LABEL_10;
    case 2:
      goto LABEL_10;
    case 3:
      uint64_t v1 = (id *)MEMORY[0x263F839F8];
      goto LABEL_10;
    case 4:
      uint64_t v1 = (id *)MEMORY[0x263F83A80];
      goto LABEL_10;
    case 5:
      uint64_t v1 = (id *)MEMORY[0x263F839C8];
      goto LABEL_10;
    case 6:
      uint64_t v1 = (id *)MEMORY[0x263F839D8];
      goto LABEL_10;
    case 7:
      uint64_t v1 = (id *)MEMORY[0x263F839E8];
      goto LABEL_10;
    case 8:
      uint64_t v1 = (id *)MEMORY[0x263F83A78];
      goto LABEL_10;
    case 9:
      uint64_t v1 = (id *)MEMORY[0x263F83A98];
LABEL_10:
      id v2 = *v1;
      id v3 = *v1;
      break;
    default:
      return v2;
  }
  return v2;
}

double sub_25C0E9180@<D0>(uint64_t a1@<X8>)
{
  SCLocalizedStringKey.init(stringLiteral:)((uint64_t)&v7);
  double result = *(double *)&v7;
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  char v5 = v10;
  uint64_t v6 = v11;
  *(_OWORD *)a1 = v7;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  return result;
}

BOOL sub_25C0E9210(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

double sub_25C0E9220@<D0>(uint64_t a1@<X8>)
{
  return sub_25C0E9180(a1);
}

char *sub_25C0E9228(uint64_t a1)
{
  return sub_25C0E923C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25C0E923C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A588A98);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 168);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[168 * v8]) {
      memmove(v12, v13, 168 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

BOOL sub_25C0E9360(uint64_t a1, char a2, uint64_t a3, char a4)
{
  switch(a2)
  {
    case 1:
      if (a4 == 1) {
        return a1 == a3;
      }
      return 0;
    case 2:
      if (a4 != 2) {
        return 0;
      }
      return a1 == a3;
    case 3:
      if (a4 != 3) {
        return 0;
      }
      return a1 == a3;
    case 4:
      if (a4 != 4) {
        return 0;
      }
      return a1 == a3;
    case 5:
      if (a4 != 5) {
        return 0;
      }
      return a1 == a3;
    case 6:
      if (a4 != 6) {
        return 0;
      }
      return a1 == a3;
    case 7:
      if (a4 != 7) {
        return 0;
      }
      return a1 == a3;
    case 8:
      if (a4 != 8) {
        return 0;
      }
      return a1 == a3;
    case 9:
      if (a4 != 9) {
        return 0;
      }
      return a1 == a3;
    case 10:
      if (a4 != 10) {
        return 0;
      }
      return a1 == a3;
    case 11:
      if (a4 == 11) {
        return a1 == a3;
      }
      return 0;
    case 12:
      switch(a1)
      {
        case 1:
          if (a4 != 12 || a3 != 1) {
            return 0;
          }
          break;
        case 2:
          if (a4 != 12 || a3 != 2) {
            return 0;
          }
          break;
        case 3:
          if (a4 != 12 || a3 != 3) {
            return 0;
          }
          break;
        case 4:
          if (a4 != 12 || a3 != 4) {
            return 0;
          }
          break;
        case 5:
          if (a4 != 12 || a3 != 5) {
            return 0;
          }
          break;
        case 6:
          if (a4 != 12 || a3 != 6) {
            return 0;
          }
          break;
        case 7:
          if (a4 != 12 || a3 != 7) {
            return 0;
          }
          break;
        case 8:
          if (a4 != 12 || a3 != 8) {
            return 0;
          }
          break;
        case 9:
          if (a4 != 12 || a3 != 9) {
            return 0;
          }
          break;
        case 10:
          if (a4 != 12 || a3 != 10) {
            return 0;
          }
          break;
        case 11:
          if (a4 != 12 || a3 != 11) {
            return 0;
          }
          break;
        case 12:
          if (a4 != 12 || a3 != 12) {
            return 0;
          }
          break;
        case 13:
          if (a4 != 12 || a3 != 13) {
            return 0;
          }
          break;
        case 14:
          if (a4 != 12 || a3 != 14) {
            return 0;
          }
          break;
        case 15:
          if (a4 != 12 || a3 != 15) {
            return 0;
          }
          break;
        case 16:
          if (a4 != 12 || a3 != 16) {
            return 0;
          }
          break;
        case 17:
          if (a4 != 12 || a3 != 17) {
            return 0;
          }
          break;
        case 18:
          if (a4 != 12 || a3 != 18) {
            return 0;
          }
          break;
        case 19:
          if (a4 != 12 || a3 != 19) {
            return 0;
          }
          break;
        case 20:
          if (a4 != 12 || a3 != 20) {
            return 0;
          }
          break;
        case 21:
          if (a4 != 12 || a3 != 21) {
            return 0;
          }
          break;
        default:
          if (a4 != 12 || a3 != 0) {
            return 0;
          }
          break;
      }
      return 1;
    default:
      return !a4 && a1 == a3;
  }
}

unint64_t sub_25C0E9714()
{
  unint64_t result = qword_26A58A518;
  if (!qword_26A58A518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A518);
  }
  return result;
}

unint64_t sub_25C0E976C()
{
  unint64_t result = qword_26A58A520;
  if (!qword_26A58A520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A520);
  }
  return result;
}

unint64_t sub_25C0E97C4()
{
  unint64_t result = qword_26A58A528;
  if (!qword_26A58A528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A528);
  }
  return result;
}

unint64_t sub_25C0E981C()
{
  unint64_t result = qword_26A58A530;
  if (!qword_26A58A530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A530);
  }
  return result;
}

unint64_t sub_25C0E9878()
{
  unint64_t result = qword_26A58A538;
  if (!qword_26A58A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A58A538);
  }
  return result;
}

uint64_t _s14descr27097BA99O5FieldOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF4 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 244);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 0xC) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14descr27097BA99O5FieldOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF3)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 244;
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25C0E995C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 0xBu) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 12);
  }
}

uint64_t sub_25C0E9974(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xC)
  {
    *(void *)unint64_t result = a2 - 12;
    LOBYTE(a2) = 12;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *_s14descr27097BA99O5FieldOMa()
{
  return &_s14descr27097BA99O5FieldON;
}

ValueMetadata *_s14descr27097BA99O6PolicyOMa()
{
  return &_s14descr27097BA99O6PolicyON;
}

ValueMetadata *_s14descr27097BA99O10EnablementOMa()
{
  return &_s14descr27097BA99O10EnablementON;
}

ValueMetadata *_s14descr27097BA99O11EditabilityOMa()
{
  return &_s14descr27097BA99O11EditabilityON;
}

uint64_t _s14descr27097BA99O4KindOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14descr27097BA99O4KindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x25C0E9B2CLL);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14descr27097BA99O4KindOMa()
{
  return &_s14descr27097BA99O4KindON;
}

unsigned char *_s14descr27097BA99O6PolicyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C0E9C30);
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

ValueMetadata *type metadata accessor for ReportSectionKey()
{
  return &type metadata for ReportSectionKey;
}

uint64_t sub_25C0E9C68()
{
  return 8;
}

void *sub_25C0E9C74(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25C0E9C80()
{
  return 0;
}

uint64_t sub_25C0E9C90()
{
  return 8;
}

uint64_t sub_25C0E9C9C()
{
  return 0;
}

uint64_t sub_25C0E9CAC()
{
  return 8;
}

uint64_t sub_25C0E9CB8()
{
  return 8;
}

uint64_t sub_25C0E9CC4()
{
  return 8;
}

uint64_t sub_25C0E9CD0()
{
  return 8;
}

uint64_t sub_25C0E9CDC()
{
  return 8;
}

uint64_t sub_25C0E9CE8()
{
  return 8;
}

uint64_t sub_25C0E9CF4()
{
  return 8;
}

uint64_t sub_25C0E9D00()
{
  return 8;
}

uint64_t sub_25C0E9D0C()
{
  return 8;
}

uint64_t sub_25C0E9D18()
{
  return 8;
}

uint64_t sub_25C0E9D58()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getIMMessagePartChatItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIMAssociatedStickerChatItemClass_block_invoke_cold_1(v0);
}

uint64_t __getIMAssociatedStickerChatItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIMAggregateAcknowledgmentChatItemClass_block_invoke_cold_1(v0);
}

uint64_t __getIMAggregateAcknowledgmentChatItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSTCommunicationClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSTCommunicationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(v0);
}

uint64_t sub_25C0E9EE8()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_25C0E9EF8()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_25C0E9F08()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_25C0E9F18()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_25C0E9F28()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25C0E9F38()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25C0E9F48()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25C0E9F58()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25C0E9F68()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_25C0E9F78()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25C0E9F88()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25C0E9F98()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t sub_25C0E9FA8()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t sub_25C0E9FB8()
{
  return MEMORY[0x270EEDED8]();
}

uint64_t sub_25C0E9FC8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25C0E9FD8()
{
  return MEMORY[0x270EEDF20]();
}

uint64_t sub_25C0E9FE8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25C0E9FF8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25C0EA008()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_25C0EA018()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_25C0EA028()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25C0EA038()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25C0EA048()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25C0EA058()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25C0EA068()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25C0EA078()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25C0EA088()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_25C0EA098()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25C0EA0A8()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_25C0EA0B8()
{
  return MEMORY[0x270EEEFD0]();
}

uint64_t sub_25C0EA0C8()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_25C0EA0D8()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_25C0EA148()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25C0EA158()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C0EA168()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25C0EA178()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_25C0EA188()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25C0EA198()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25C0EA1A8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25C0EA1B8()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_25C0EA1C8()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_25C0EA1D8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25C0EA1E8()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25C0EA1F8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25C0EA208()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25C0EA218()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25C0EA228()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25C0EA238()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C0EA248()
{
  return MEMORY[0x270EEFF90]();
}

uint64_t sub_25C0EA258()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25C0EA268()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_25C0EA278()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25C0EA288()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25C0EA298()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25C0EA2A8()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_25C0EA2B8()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_25C0EA2C8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25C0EA2D8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C0EA2E8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25C0EA2F8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25C0EA308()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25C0EA318()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25C0EA328()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C0EA338()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C0EA348()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C0EA358()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C0EA368()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_25C0EA378()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_25C0EA388()
{
  return MEMORY[0x270EF0F58]();
}

uint64_t sub_25C0EA398()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_25C0EA3A8()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_25C0EA3B8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25C0EA3C8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25C0EA3D8()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_25C0EA3E8()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_25C0EA3F8()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_25C0EA408()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25C0EA418()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25C0EA428()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25C0EA438()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25C0EA448()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_25C0EA458()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_25C0EA468()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25C0EA478()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25C0EA488()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25C0EA498()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_25C0EA4A8()
{
  return MEMORY[0x270FA1798]();
}

uint64_t sub_25C0EA4B8()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_25C0EA4C8()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_25C0EA4D8()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_25C0EA4E8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25C0EA4F8()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_25C0EA508()
{
  return MEMORY[0x270EFDFE0]();
}

uint64_t sub_25C0EA518()
{
  return MEMORY[0x270EFDFE8]();
}

uint64_t sub_25C0EA528()
{
  return MEMORY[0x270EFDFF0]();
}

uint64_t sub_25C0EA538()
{
  return MEMORY[0x270EFDFF8]();
}

uint64_t sub_25C0EA548()
{
  return MEMORY[0x270EFE000]();
}

uint64_t sub_25C0EA558()
{
  return MEMORY[0x270EFE008]();
}

uint64_t sub_25C0EA568()
{
  return MEMORY[0x270EFE010]();
}

uint64_t sub_25C0EA578()
{
  return MEMORY[0x270EFE018]();
}

uint64_t sub_25C0EA588()
{
  return MEMORY[0x270EFE020]();
}

uint64_t sub_25C0EA598()
{
  return MEMORY[0x270EFE028]();
}

uint64_t sub_25C0EA5A8()
{
  return MEMORY[0x270EFE030]();
}

uint64_t sub_25C0EA5B8()
{
  return MEMORY[0x270EFE038]();
}

uint64_t sub_25C0EA5C8()
{
  return MEMORY[0x270EFE040]();
}

uint64_t sub_25C0EA5D8()
{
  return MEMORY[0x270EFE048]();
}

uint64_t sub_25C0EA5E8()
{
  return MEMORY[0x270EFE050]();
}

uint64_t _s24SensitiveContentAnalysis11SensitivityO0abC2UIE2idSSvg_0()
{
  return MEMORY[0x270EFE058]();
}

uint64_t sub_25C0EA608()
{
  return MEMORY[0x270EFE060]();
}

uint64_t sub_25C0EA618()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C0EA628()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C0EA638()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C0EA648()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_25C0EA658()
{
  return MEMORY[0x270F81CF8]();
}

uint64_t sub_25C0EA668()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_25C0EA678()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_25C0EA688()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_25C0EA698()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_25C0EA6A8()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_25C0EA6B8()
{
  return MEMORY[0x270EFECD8]();
}

uint64_t sub_25C0EA6C8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25C0EA6D8()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_25C0EA6E8()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_25C0EA6F8()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_25C0EA708()
{
  return MEMORY[0x270EFED50]();
}

uint64_t sub_25C0EA718()
{
  return MEMORY[0x270EFED58]();
}

uint64_t sub_25C0EA728()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_25C0EA738()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_25C0EA748()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25C0EA758()
{
  return MEMORY[0x270EFF140]();
}

uint64_t sub_25C0EA768()
{
  return MEMORY[0x270EFF158]();
}

uint64_t sub_25C0EA778()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_25C0EA788()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_25C0EA798()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_25C0EA7A8()
{
  return MEMORY[0x270EFF3D8]();
}

uint64_t sub_25C0EA7B8()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_25C0EA7C8()
{
  return MEMORY[0x270EFF4E0]();
}

uint64_t sub_25C0EA7D8()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_25C0EA7E8()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25C0EA7F8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25C0EA808()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25C0EA818()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25C0EA828()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_25C0EA838()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_25C0EA848()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_25C0EA858()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_25C0EA868()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_25C0EA888()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_25C0EA898()
{
  return MEMORY[0x270EFFB00]();
}

uint64_t sub_25C0EA8A8()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_25C0EA8B8()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_25C0EA8C8()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_25C0EA8D8()
{
  return MEMORY[0x270EFFDD8]();
}

uint64_t sub_25C0EA8E8()
{
  return MEMORY[0x270EFFE60]();
}

uint64_t sub_25C0EA8F8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25C0EA908()
{
  return MEMORY[0x270F001C0]();
}

uint64_t sub_25C0EA918()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_25C0EA928()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_25C0EA938()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_25C0EA948()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25C0EA958()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_25C0EA968()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_25C0EA978()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_25C0EA988()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_25C0EA998()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25C0EA9A8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25C0EA9B8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25C0EA9C8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25C0EA9D8()
{
  return MEMORY[0x270F00A68]();
}

uint64_t sub_25C0EA9E8()
{
  return MEMORY[0x270F00A70]();
}

uint64_t sub_25C0EA9F8()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_25C0EAA08()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_25C0EAA18()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_25C0EAA28()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25C0EAA38()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25C0EAA48()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25C0EAA58()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25C0EAA68()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_25C0EAA78()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_25C0EAA88()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_25C0EAA98()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25C0EAAA8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25C0EAAB8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25C0EAAC8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25C0EAAD8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25C0EAAE8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25C0EAAF8()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_25C0EAB08()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_25C0EAB18()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_25C0EAB28()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_25C0EAB38()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25C0EAB48()
{
  return MEMORY[0x270F011C0]();
}

uint64_t sub_25C0EAB58()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_25C0EAB68()
{
  return MEMORY[0x270F011E8]();
}

uint64_t sub_25C0EAB78()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_25C0EAB88()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_25C0EAB98()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_25C0EABA8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_25C0EABB8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_25C0EABC8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_25C0EABD8()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_25C0EABE8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25C0EABF8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25C0EAC08()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25C0EAC18()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_25C0EAC28()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_25C0EAC38()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_25C0EAC48()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25C0EAC58()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_25C0EAC68()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_25C0EAC78()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_25C0EAC98()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_25C0EACA8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_25C0EACB8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_25C0EACC8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_25C0EACD8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_25C0EACE8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_25C0EAD08()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_25C0EAD18()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_25C0EAD28()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25C0EAD38()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_25C0EAD48()
{
  return MEMORY[0x270F01880]();
}

uint64_t sub_25C0EAD58()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_25C0EAD68()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_25C0EAD78()
{
  return MEMORY[0x270F01A58]();
}

uint64_t sub_25C0EAD88()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_25C0EAD98()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_25C0EADA8()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_25C0EADB8()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_25C0EADC8()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_25C0EADD8()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_25C0EADE8()
{
  return MEMORY[0x270F01C80]();
}

uint64_t sub_25C0EADF8()
{
  return MEMORY[0x270F01C88]();
}

uint64_t sub_25C0EAE08()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25C0EAE18()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25C0EAE28()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25C0EAE48()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25C0EAE58()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25C0EAE68()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25C0EAE88()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25C0EAE98()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25C0EAEA8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_25C0EAEB8()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_25C0EAEC8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_25C0EAED8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25C0EAEE8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25C0EAEF8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25C0EAF08()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25C0EAF18()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25C0EAF28()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25C0EAF38()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_25C0EAF48()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25C0EAF58()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_25C0EAF68()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_25C0EAF78()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25C0EAF88()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25C0EAF98()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_25C0EAFA8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_25C0EAFB8()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_25C0EAFC8()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_25C0EAFD8()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_25C0EAFE8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25C0EAFF8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25C0EB008()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_25C0EB018()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_25C0EB028()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25C0EB038()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25C0EB048()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25C0EB058()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C0EB068()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C0EB078()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25C0EB088()
{
  return MEMORY[0x270F03540]();
}

uint64_t sub_25C0EB098()
{
  return MEMORY[0x270F035B8]();
}

uint64_t sub_25C0EB0A8()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25C0EB0B8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C0EB0C8()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_25C0EB0D8()
{
  return MEMORY[0x270F03780]();
}

uint64_t sub_25C0EB0E8()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_25C0EB0F8()
{
  return MEMORY[0x270F03868]();
}

uint64_t sub_25C0EB108()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_25C0EB118()
{
  return MEMORY[0x270F03940]();
}

uint64_t sub_25C0EB128()
{
  return MEMORY[0x270F03A38]();
}

uint64_t sub_25C0EB138()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_25C0EB148()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_25C0EB158()
{
  return MEMORY[0x270F03D48]();
}

uint64_t sub_25C0EB168()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_25C0EB178()
{
  return MEMORY[0x270F03F40]();
}

uint64_t sub_25C0EB188()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_25C0EB198()
{
  return MEMORY[0x270F03F80]();
}

uint64_t sub_25C0EB1A8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_25C0EB1B8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_25C0EB1C8()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_25C0EB1D8()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_25C0EB1E8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_25C0EB1F8()
{
  return MEMORY[0x270F04148]();
}

uint64_t sub_25C0EB208()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_25C0EB218()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25C0EB228()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_25C0EB238()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_25C0EB248()
{
  return MEMORY[0x270F041D0]();
}

uint64_t sub_25C0EB258()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_25C0EB268()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_25C0EB278()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_25C0EB288()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_25C0EB298()
{
  return MEMORY[0x270F04300]();
}

uint64_t sub_25C0EB2A8()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_25C0EB2B8()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_25C0EB2C8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25C0EB2D8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_25C0EB2E8()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_25C0EB2F8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25C0EB308()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25C0EB318()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_25C0EB328()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25C0EB338()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25C0EB348()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_25C0EB358()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25C0EB368()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_25C0EB378()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25C0EB388()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25C0EB398()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25C0EB3A8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25C0EB3B8()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_25C0EB3C8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25C0EB3D8()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_25C0EB3E8()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_25C0EB3F8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_25C0EB408()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_25C0EB418()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_25C0EB428()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25C0EB438()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25C0EB448()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25C0EB458()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_25C0EB468()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_25C0EB478()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_25C0EB488()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_25C0EB498()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_25C0EB4A8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25C0EB4B8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_25C0EB4C8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_25C0EB4D8()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_25C0EB4E8()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_25C0EB4F8()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_25C0EB508()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25C0EB518()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_25C0EB528()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_25C0EB538()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25C0EB548()
{
  return MEMORY[0x270F052D8]();
}

uint64_t sub_25C0EB558()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_25C0EB568()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_25C0EB588()
{
  return MEMORY[0x270F80730]();
}

uint64_t sub_25C0EB5A8()
{
  return MEMORY[0x270F80740]();
}

uint64_t sub_25C0EB5B8()
{
  return MEMORY[0x270F80748]();
}

uint64_t sub_25C0EB5C8()
{
  return MEMORY[0x270F80750]();
}

uint64_t sub_25C0EB5D8()
{
  return MEMORY[0x270F80758]();
}

uint64_t sub_25C0EB5E8()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_25C0EB5F8()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_25C0EB608()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_25C0EB618()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_25C0EB628()
{
  return MEMORY[0x270EEAD98]();
}

uint64_t sub_25C0EB638()
{
  return MEMORY[0x270EEADA0]();
}

uint64_t sub_25C0EB648()
{
  return MEMORY[0x270EEADB0]();
}

uint64_t sub_25C0EB658()
{
  return MEMORY[0x270EEADB8]();
}

uint64_t sub_25C0EB668()
{
  return MEMORY[0x270EEADC0]();
}

uint64_t sub_25C0EB678()
{
  return MEMORY[0x270EEADE0]();
}

uint64_t sub_25C0EB688()
{
  return MEMORY[0x270EEADF8]();
}

uint64_t sub_25C0EB698()
{
  return MEMORY[0x270EEAE00]();
}

uint64_t sub_25C0EB6A8()
{
  return MEMORY[0x270EEAE20]();
}

uint64_t sub_25C0EB6B8()
{
  return MEMORY[0x270EEAE50]();
}

uint64_t sub_25C0EB6C8()
{
  return MEMORY[0x270EEAE78]();
}

uint64_t sub_25C0EB6D8()
{
  return MEMORY[0x270EEAE98]();
}

uint64_t sub_25C0EB6E8()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t sub_25C0EB6F8()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_25C0EB708()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_25C0EB718()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_25C0EB728()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_25C0EB738()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25C0EB748()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_25C0EB758()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C0EB768()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25C0EB778()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_25C0EB788()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25C0EB798()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25C0EB7A8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C0EB7B8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25C0EB7C8()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_25C0EB7D8()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_25C0EB7E8()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_25C0EB7F8()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_25C0EB808()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_25C0EB818()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25C0EB828()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C0EB838()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25C0EB848()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25C0EB858()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C0EB868()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25C0EB878()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25C0EB888()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25C0EB898()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25C0EB8A8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25C0EB8B8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25C0EB8C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C0EB8D8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25C0EB8E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C0EB8F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C0EB908()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25C0EB918()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25C0EB928()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25C0EB938()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25C0EB948()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25C0EB958()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25C0EB968()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_25C0EB978()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25C0EB988()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25C0EB998()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_25C0EB9A8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C0EB9B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C0EB9C8()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25C0EB9D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C0EB9E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C0EB9F8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C0EBA08()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25C0EBA18()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C0EBA28()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C0EBA38()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25C0EBA48()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25C0EBA58()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25C0EBA68()
{
  return MEMORY[0x270EF1BE8]();
}

uint64_t sub_25C0EBA78()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C0EBA88()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25C0EBA98()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25C0EBAA8()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_25C0EBAC8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25C0EBAD8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25C0EBAE8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_25C0EBAF8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C0EBB08()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C0EBB28()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25C0EBB38()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25C0EBB58()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_25C0EBB68()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25C0EBB78()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25C0EBB88()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25C0EBB98()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25C0EBBA8()
{
  return MEMORY[0x270F9E250]();
}

uint64_t sub_25C0EBBB8()
{
  return MEMORY[0x270F9E320]();
}

uint64_t sub_25C0EBBC8()
{
  return MEMORY[0x270EE3600]();
}

uint64_t sub_25C0EBBD8()
{
  return MEMORY[0x270EF1D98]();
}

uint64_t sub_25C0EBBE8()
{
  return MEMORY[0x270EF1E30]();
}

uint64_t sub_25C0EBBF8()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_25C0EBC18()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C0EBC28()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C0EBC38()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C0EBC48()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C0EBC58()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C0EBC68()
{
  return MEMORY[0x270EE3618]();
}

uint64_t sub_25C0EBC88()
{
  return MEMORY[0x270EFE068]();
}

uint64_t sub_25C0EBC98()
{
  return MEMORY[0x270EFE070]();
}

uint64_t sub_25C0EBCB8()
{
  return MEMORY[0x270EFE080]();
}

uint64_t sub_25C0EBCC8()
{
  return MEMORY[0x270EE3738]();
}

uint64_t sub_25C0EBCD8()
{
  return MEMORY[0x270EE3760]();
}

uint64_t sub_25C0EBCE8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C0EBCF8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25C0EBD08()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_25C0EBD18()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_25C0EBD28()
{
  return MEMORY[0x270F82988]();
}

uint64_t sub_25C0EBD38()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_25C0EBD48()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_25C0EBD58()
{
  return MEMORY[0x270F829D8]();
}

uint64_t sub_25C0EBD68()
{
  return MEMORY[0x270F829E8]();
}

uint64_t sub_25C0EBD78()
{
  return MEMORY[0x270F82A10]();
}

uint64_t sub_25C0EBD88()
{
  return MEMORY[0x270F82A30]();
}

uint64_t sub_25C0EBD98()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_25C0EBDA8()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_25C0EBDB8()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_25C0EBDC8()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_25C0EBDD8()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_25C0EBDE8()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_25C0EBDF8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_25C0EBE08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C0EBE18()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_25C0EBE28()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_25C0EBE38()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_25C0EBE48()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25C0EBE58()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C0EBE68()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C0EBE78()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25C0EBE88()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25C0EBE98()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_25C0EBEA8()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_25C0EBEB8()
{
  return MEMORY[0x270F9E778]();
}

uint64_t sub_25C0EBEC8()
{
  return MEMORY[0x270F9E790]();
}

uint64_t sub_25C0EBED8()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_25C0EBEF8()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_25C0EBF08()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C0EBF18()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25C0EBF28()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C0EBF38()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C0EBF48()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25C0EBF68()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_25C0EBF78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C0EBF88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C0EBF98()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_25C0EBFA8()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25C0EBFB8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C0EBFC8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25C0EBFD8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25C0EBFE8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25C0EBFF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C0EC008()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_25C0EC018()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C0EC028()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25C0EC038()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25C0EC048()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25C0EC058()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25C0EC068()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C0EC078()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C0EC088()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C0EC098()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25C0EC0A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C0EC0B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C0EC0C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C0EC0E8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C0EC0F8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25C0EC108()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25C0EC118()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25C0EC128()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25C0EC138()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25C0EC148()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25C0EC158()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25C0EC168()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C0EC178()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25C0EC188()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25C0EC198()
{
  return MEMORY[0x270EF2638]();
}

uint64_t sub_25C0EC1A8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25C0EC1B8()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_25C0EC1C8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25C0EC1D8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25C0EC1E8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25C0EC1F8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25C0EC208()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C0EC218()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25C0EC228()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25C0EC238()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C0EC248()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25C0EC258()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25C0EC268()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C0EC288()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C0EC298()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C0EC2A8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25C0EC2E8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25C0EC2F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C0EC308()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C0EC318()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C0EC328()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C0EC338()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25C0EC348()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C0EC358()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C0EC368()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C0EC378()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C0EC388()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25C0EC398()
{
  return MEMORY[0x270F9FFF8]();
}

uint64_t sub_25C0EC3A8()
{
  return MEMORY[0x270FA0030]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x270F3CE68]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x270F3CE70]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SCIsAnalyticsEnabled()
{
  return MEMORY[0x270EFE088]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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