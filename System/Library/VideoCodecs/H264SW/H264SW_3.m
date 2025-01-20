__n64 sub_221A2B014(int a1, uint64_t a2, __n64 *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  uint64_t v19;
  long long v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t *v26;
  int64x2_t v27;
  int64x2_t v28;
  uint64_t *v29;
  int64x2_t v30;
  uint64_t *v31;
  uint8x16_t v32;
  uint64_t *v33;
  uint8x16_t v34;
  uint64_t *v35;
  uint8x16_t v36;
  uint8x16_t v37;
  int32x4_t v38;
  int64x2_t v39;
  int32x4_t v40;
  uint64_t *v41;
  uint8x16_t v42;
  uint64_t *v43;
  int64x2_t v44;
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint8x16_t v51;
  uint64_t *v52;
  uint64_t *v53;
  int64x2_t v54;
  uint8x16_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint8x16_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint8x16_t v61;
  int64x2_t v62;
  int64x2_t v63;
  int64x2_t v64;
  int64x2_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  uint64_t *v69;
  uint8x16_t v70;
  int64x2_t v71;
  int32x4_t v72;
  uint8x16_t v73;
  int64x2_t v74;
  uint8x16_t v75;
  uint8x16_t v76;
  uint8x16_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  uint8x16_t v81;
  int64x2_t v82;
  int64x2_t v83;
  uint32x4_t v84;
  uint8x16_t v85;
  uint8x16_t v86;
  uint8x16_t v87;
  uint8x16_t v88;
  uint8x16_t v89;
  uint8x16_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  uint8x16_t v96;
  uint8x16_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  uint64_t *v101;
  int64x2_t v102;
  int64x2_t v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint8x16_t v107;
  int64x2_t v108;
  uint8x16_t v109;
  int64x2_t v110;
  int64x2_t v111;
  int32x4_t v112;
  int64x2_t v113;
  uint64_t *v114;
  int64x2_t v115;
  int64x2_t v116;
  uint64_t *v117;
  uint64_t *v118;
  int32x4_t v119;
  int64x2_t v120;
  int32x4_t v121;
  int64x2_t v122;
  int32x4_t v123;
  int32x4_t v124;
  uint8x16_t v125;
  uint8x16_t v126;
  uint8x16_t v127;
  int16x4_t v128;
  __n64 result;
  long long v130;
  long long v131;
  long long v132;
  long long v133;
  uint64_t v134;

  v134 = *MEMORY[0x263EF8340];
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v5 = *(unsigned int *)(a2 + 16);
  v4 = *(unsigned int *)(a2 + 20);
  v6 = *(void *)(a2 + 64);
  v7 = sub_221A25634(a1, a2, &v132, &v130);
  v19 = v132;
  v20 = v133;
  v21 = (uint64_t *)(v132 + v5);
  v22 = (uint64_t *)(v133 + v5);
  v23 = (uint64_t *)(*((void *)&v133 + 1) + v5);
  v24.i64[0] = *(void *)v132;
  if (v7)
  {
    v8.i64[0] = *(void *)(v132 + v5);
    *(void *)&v132 = v132 + v4;
    v25 = vzip1q_s64(v24, v8);
    v8.i64[0] = *(void *)v130;
    v9.i64[0] = *(void *)(v130 + v5);
    v26 = (uint64_t *)(v130 + v5 + v4);
    v27 = vzip1q_s64(v8, v9);
    v28 = (int64x2_t)vrhaddq_u8((uint8x16_t)v25, (uint8x16_t)v27);
    v25.i64[0] = *(void *)v133;
    v27.i64[0] = *(void *)(v133 + v5);
    *(void *)&v133 = v133 + v4;
    v29 = (uint64_t *)((char *)v22 + v4);
    v30 = vzip1q_s64(v25, v27);
    v27.i64[0] = *(void *)v131;
    v9.i64[0] = *(void *)(v131 + v5);
    v31 = (uint64_t *)(v131 + v5 + v4);
    v32 = vrhaddq_u8((uint8x16_t)v30, (uint8x16_t)vzip1q_s64(v27, v9));
    v30.i64[0] = **((void **)&v20 + 1);
    v9.i64[0] = *(void *)(*((void *)&v20 + 1) + v5);
    *((void *)&v133 + 1) = *((void *)&v20 + 1) + v4;
    v33 = (uint64_t *)((char *)v23 + v4);
    v34 = (uint8x16_t)vzip1q_s64(v30, v9);
    v9.i64[0] = **((void **)&v131 + 1);
    v11.i64[0] = *(void *)(*((void *)&v131 + 1) + v5);
    v35 = (uint64_t *)(*((void *)&v131 + 1) + v5 + v4);
    v36 = vrhaddq_u8(v34, (uint8x16_t)vzip1q_s64(v9, v11));
    v37 = *(uint8x16_t *)v6;
    v38 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v28, *(uint8x16_t *)v6))));
    v39 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v32, *(uint8x16_t *)v6))));
    v40 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v36, *(uint8x16_t *)v6))));
    v12.i64[0] = *(void *)v132;
    v13.i64[0] = *(uint64_t *)((char *)v21 + v4);
    *(void *)&v132 = v132 + v4;
    v41 = (uint64_t *)((char *)v21 + v4 + v4);
    v42 = (uint8x16_t)vzip1q_s64(v12, v13);
    v13.i64[0] = *(void *)(v130 + v4);
    v14.i64[0] = *v26;
    v43 = (uint64_t *)(v130 + v4 + v4);
    v44 = vzip1q_s64(v13, v14);
    v45 = vdupq_laneq_s64(v28, 1);
    v46 = (int64x2_t)vrhaddq_u8(v42, (uint8x16_t)v44);
    v47 = vzip1q_s64(v45, v46);
    v48 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v47, v37))));
    v47.i64[0] = *(void *)(v20 + v4);
    v44.i64[0] = *v29;
    v49 = (uint64_t *)(v20 + v4 + v4);
    *(void *)&v133 = v49;
    v50 = (uint64_t *)((char *)v29 + v4);
    v51 = (uint8x16_t)vzip1q_s64(v47, v44);
    v44.i64[0] = *(void *)(v131 + v4);
    v45.i64[0] = *v31;
    v52 = (uint64_t *)(v131 + v4 + v4);
    v53 = (uint64_t *)((char *)v31 + v4);
    v54 = vzip1q_s64(v44, v45);
    v55 = vrhaddq_u8(v51, (uint8x16_t)v54);
    v54.i64[0] = *(void *)(*((void *)&v20 + 1) + v4);
    v45.i64[0] = *v33;
    v56 = (uint64_t *)(*((void *)&v20 + 1) + v4 + v4);
    *((void *)&v133 + 1) = v56;
    v57 = (uint64_t *)((char *)v33 + v4);
    v58 = (uint8x16_t)vzip1q_s64(v54, v45);
    v45.i64[0] = *(void *)(*((void *)&v131 + 1) + v4);
    v15.i64[0] = *v35;
    v59 = (uint64_t *)(*((void *)&v131 + 1) + v4 + v4);
    v60 = (uint64_t *)((char *)v35 + v4);
    v61 = vrhaddq_u8(v58, (uint8x16_t)vzip1q_s64(v45, v15));
    v62 = *(int64x2_t *)(v6 + 16);
    v63 = *(int64x2_t *)(v6 + 32);
    v64 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v46, (uint8x16_t)v62))));
    v65 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v61, (uint8x16_t)v62))));
    v66 = vaddq_s32((int32x4_t)v64, v38);
    v67 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v55, (uint8x16_t)v62)))), (int32x4_t)v39);
    v68 = vaddq_s32((int32x4_t)v65, v40);
    v39.i64[0] = *(void *)v132;
    v65.i64[0] = *v41;
    v69 = (uint64_t *)(v132 + v4);
    *(void *)&v132 = v69;
    v70 = (uint8x16_t)vzip1q_s64(v39, v65);
    v65.i64[0] = *v43;
    v64.i64[0] = *(uint64_t *)((char *)v26 + v4);
    v71 = (int64x2_t)vrhaddq_u8(v70, (uint8x16_t)vzip1q_s64(v65, v64));
    v72 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(vdupq_laneq_s64(v46, 1), v71), (uint8x16_t)v62)))), (int32x4_t)v48);
    v46.i64[0] = *v49;
    v48.i64[0] = *v50;
    *(void *)&v133 = (char *)v49 + v4;
    v73 = (uint8x16_t)vzip1q_s64(v46, v48);
    v48.i64[0] = *v52;
    v62.i64[0] = *v53;
    v74 = vzip1q_s64(v48, v62);
    v75 = vrhaddq_u8(v73, (uint8x16_t)v74);
    v74.i64[0] = *v56;
    v62.i64[0] = *v57;
    *((void *)&v133 + 1) = (char *)v56 + v4;
    v76 = (uint8x16_t)vzip1q_s64(v74, v62);
    v62.i64[0] = *v59;
    v64.i64[0] = *v60;
    v77 = vrhaddq_u8(v76, (uint8x16_t)vzip1q_s64(v62, v64));
    v78 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v71, (uint8x16_t)v63))));
    v79 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v75, (uint8x16_t)v63))));
    v80 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v77, (uint8x16_t)v63))));
    v64.i64[0] = *v69;
    v16.i64[0] = *(uint64_t *)((char *)v41 + v4);
    *(void *)&v132 = (char *)v69 + v4;
    v81 = (uint8x16_t)vzip1q_s64(v64, v16);
    v16.i64[0] = *(uint64_t *)((char *)v43 + v4);
    v17.i64[0] = *(uint64_t *)((char *)v26 + v4 + v4);
    v82 = vzip1q_s64(v16, v17);
    v83 = (int64x2_t)vrhaddq_u8(v81, (uint8x16_t)v82);
    v84 = vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(vdupq_laneq_s64(v71, 1), v83), (uint8x16_t)v63)));
    v63.i64[0] = *(uint64_t *)((char *)v49 + v4);
    v82.i64[0] = *(uint64_t *)((char *)v50 + v4);
    v17.i64[0] = *(uint64_t *)((char *)v52 + v4);
    v18.i64[0] = *(uint64_t *)((char *)v53 + v4);
    v85 = (uint8x16_t)vzip1q_s64(v63, v82);
    v86 = (uint8x16_t)vzip1q_s64(v17, v18);
    v17.i64[0] = *(uint64_t *)((char *)v56 + v4);
    v18.i64[0] = *(uint64_t *)((char *)v57 + v4);
    v87 = vrhaddq_u8(v85, v86);
    v88 = (uint8x16_t)vzip1q_s64(v17, v18);
    v17.i64[0] = *(uint64_t *)((char *)v59 + v4);
    v18.i64[0] = *(uint64_t *)((char *)v60 + v4);
    v89 = vrhaddq_u8(v88, (uint8x16_t)vzip1q_s64(v17, v18));
    v90 = *(uint8x16_t *)(v6 + 48);
    v91 = vaddq_s32(v66, vaddq_s32(v78, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v83, v90))))));
    v92 = vaddq_s32(v67, vaddq_s32(v79, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v87, v90))))));
    v93 = vaddq_s32(v80, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v89, v90)))));
    v94 = vaddq_s32(v68, v93);
    v93.i64[0] = *(uint64_t *)((char *)v69 + v4);
    v67.i64[0] = *(uint64_t *)((char *)v43 + v4 + v4);
    v95 = vaddq_s32(v72, vaddq_s32((int32x4_t)vpaddlq_u32(v84), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(vdupq_laneq_s64(v83, 1), (int64x2_t)vrhaddq_u8((uint8x16_t)v93, (uint8x16_t)v67)), v90))))));
  }
  else
  {
    v9.i64[0] = *v21;
    *(void *)&v132 = v132 + v4;
    v8.i64[0] = *(void *)v133;
    v10.i64[0] = *v22;
    v96 = (uint8x16_t)vzip1q_s64(v8, v10);
    *(void *)&v133 = v133 + v4;
    v97 = *(uint8x16_t *)v6;
    v98 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v24, v9), *(uint8x16_t *)v6))));
    v99 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v96, *(uint8x16_t *)v6))));
    v11.i64[0] = *(void *)(v19 + v4);
    *(void *)&v132 = v19 + v4 + v4;
    v100 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v9, v11), v97))));
    v12.i64[0] = **((void **)&v20 + 1);
    v13.i64[0] = *v23;
    *((void *)&v133 + 1) = *((void *)&v20 + 1) + v4;
    v101 = (uint64_t *)((char *)v23 + v4);
    v102 = vzip1q_s64(v12, v13);
    v103 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v102, v97))));
    v102.i64[0] = *(uint64_t *)((char *)v21 + v4);
    v104 = (uint64_t *)((char *)v21 + v4 + v4);
    v13.i64[0] = *(void *)(v20 + v4);
    v14.i64[0] = *(uint64_t *)((char *)v22 + v4);
    v105 = (uint64_t *)(v20 + v4 + v4);
    *(void *)&v133 = v105;
    v106 = (uint64_t *)((char *)v22 + v4 + v4);
    v107 = (uint8x16_t)vzip1q_s64(v13, v14);
    v108 = *(int64x2_t *)(v6 + 16);
    v109 = *(uint8x16_t *)(v6 + 32);
    v110 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v11, v102), (uint8x16_t)v108))));
    v111 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v107, (uint8x16_t)v108))));
    v112 = vaddq_s32((int32x4_t)v110, v98);
    v113 = (int64x2_t)vaddq_s32((int32x4_t)v111, v99);
    v110.i64[0] = *(void *)v132;
    v114 = (uint64_t *)(v132 + v4);
    *(void *)&v132 = v114;
    v115 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v102, v110), (uint8x16_t)v108))));
    v116 = (int64x2_t)vaddq_s32((int32x4_t)v115, v100);
    v115.i64[0] = *(void *)(*((void *)&v20 + 1) + v4);
    v111.i64[0] = *v101;
    v117 = (uint64_t *)(*((void *)&v20 + 1) + v4 + v4);
    *((void *)&v133 + 1) = v117;
    v118 = (uint64_t *)((char *)v101 + v4);
    v119 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v115, v111), (uint8x16_t)v108)))), (int32x4_t)v103);
    v103.i64[0] = *v104;
    v111.i64[0] = *v105;
    v108.i64[0] = *v106;
    *(void *)&v133 = (char *)v105 + v4;
    v120 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v110, v103), v109))));
    v121 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v111, v108), v109))));
    v108.i64[0] = *v114;
    *(void *)&v132 = (char *)v114 + v4;
    v122 = (int64x2_t)vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v103, v108), v109)));
    v123 = (int32x4_t)vpaddlq_u32((uint32x4_t)v122);
    v122.i64[0] = *v117;
    v16.i64[0] = *v118;
    *((void *)&v133 + 1) = (char *)v117 + v4;
    v124 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v122, v16), v109))));
    v16.i64[0] = *(uint64_t *)((char *)v104 + v4);
    v125 = (uint8x16_t)vzip1q_s64(v108, v16);
    v108.i64[0] = *(uint64_t *)((char *)v105 + v4);
    v17.i64[0] = *(uint64_t *)((char *)v106 + v4);
    v126 = (uint8x16_t)vzip1q_s64(v108, v17);
    v127 = *(uint8x16_t *)(v6 + 48);
    v91 = vaddq_s32(v112, vaddq_s32((int32x4_t)v120, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v125, v127))))));
    v92 = vaddq_s32((int32x4_t)v113, vaddq_s32(v121, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v126, v127))))));
    v113.i64[0] = *(uint64_t *)((char *)v114 + v4);
    v95 = vaddq_s32((int32x4_t)v116, vaddq_s32(v123, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v16, v113), v127))))));
    v116.i64[0] = *(uint64_t *)((char *)v117 + v4);
    v120.i64[0] = *(uint64_t *)((char *)v118 + v4);
    v94 = vaddq_s32(v119, vaddq_s32(v124, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(v116, v120), v127))))));
  }
  v128 = (int16x4_t)vadd_s32(*(int32x2_t *)v92.i8, (int32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2));
  result.n64_u32[0] = vzip1_s16((int16x4_t)vadd_s32(*(int32x2_t *)v91.i8, (int32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2)), (int16x4_t)vadd_s32(*(int32x2_t *)v95.i8, (int32x2_t)*(_OWORD *)&vdupq_laneq_s32(v95, 2))).u32[0];
  result.n64_u32[1] = vext_s8(*(int8x8_t *)&v128, (int8x8_t)vzip1_s16(v128, (int16x4_t)vadd_s32(*(int32x2_t *)&v94, (int32x2_t)vdupq_laneq_s32(v94, 2))), 4uLL).u32[1];
  a3->n64_u64[0] = result.n64_u64[0];
  return result;
}

double sub_221A2B694(void *a1, uint64_t a2, _WORD *a3)
{
  v3 = *(uint8x16_t **)(a2 + 56);
  v4 = (uint8x16_t *)a1[4];
  v5 = (uint8x16_t *)a1[5];
  uint8x16_t v6 = v3[1];
  int32x4_t v7 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v5, *v3))));
  v8 = (uint8x16_t *)a1[3];
  int32x4_t v9 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v8, *v3))));
  uint64_t v11 = *(unsigned int *)(a2 + 16);
  uint64_t v10 = *(unsigned int *)(a2 + 20);
  v12 = (uint8x16_t *)((char *)v5 + v11);
  v13 = (uint8x16_t *)((char *)v8 + v11);
  int32x4_t v14 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v12, v6)))), v7);
  int32x4_t v15 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v13, v6)))), v9);
  v16 = (uint8x16_t *)((char *)v12 + v11);
  uint8x16_t v17 = *v16;
  v18 = (uint8x16_t *)((char *)v13 + v11);
  uint32x4_t v19 = vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v16, *v3)));
  v20 = (uint8x16_t *)((char *)v16 + v11);
  uint8x16_t v21 = *v18;
  uint8x16_t v22 = vabdq_u8(*v3, *v18);
  v23 = (uint8x16_t *)((char *)v18 + v11);
  uint8x16_t v24 = v3[2];
  uint8x16_t v25 = v3[3];
  int32x4_t v26 = vaddq_s32(v14, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v17, v24)))));
  int32x4_t v27 = vaddq_s32(v15, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v24)))));
  uint8x16_t v28 = *v20;
  v29 = (uint8x16_t *)((char *)v20 + v11);
  int32x4_t v30 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v6)))), (int32x4_t)vpaddlq_u32(v19));
  uint8x16_t v31 = *v23;
  v32 = (uint8x16_t *)((char *)v23 + v11);
  int32x4_t v33 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v6, v31)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(v22))));
  int32x4_t v34 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v25))));
  uint8x16_t v35 = *v29;
  v36 = (uint8x16_t *)((char *)v29 + v11);
  int32x4_t v37 = vaddq_s32(v30, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v24)))));
  uint8x16_t v38 = *v32;
  v39 = (uint8x16_t *)((char *)v32 + v11);
  int32x4_t v40 = vaddq_s32(v33, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v24, v38)))));
  uint8x16_t v41 = v3[4];
  uint8x16_t v42 = v3[5];
  int32x4_t v43 = vaddq_s32(v34, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v41)))));
  int32x4_t v44 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v31, v25)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v38, v41)))));
  uint8x16_t v45 = *v36;
  v46 = (uint8x16_t *)((char *)v36 + v11);
  int32x4_t v47 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v45, v25))));
  uint8x16_t v48 = *v39;
  v49 = (uint8x16_t *)((char *)v39 + v11);
  int32x4_t v50 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v25, v48))));
  int32x4_t v51 = vaddq_s32(v26, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v45, v42)))));
  int32x4_t v52 = vaddq_s32(v27, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v48, v42)))));
  uint8x16_t v53 = *v46;
  v54 = (uint8x16_t *)((char *)v46 + v11);
  int32x4_t v55 = vaddq_s32(v47, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v41)))));
  uint8x16_t v56 = *v49;
  v57 = (uint8x16_t *)((char *)v49 + v11);
  int32x4_t v58 = vaddq_s32(v50, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v41, v56)))));
  uint8x16_t v59 = v3[6];
  uint8x16_t v60 = v3[7];
  int32x4_t v61 = vaddq_s32(v43, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v59)))));
  int32x4_t v62 = vaddq_s32(v44, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v59)))));
  uint8x16_t v63 = *v54;
  v64 = (uint8x16_t *)((char *)v54 + v11);
  int32x4_t v65 = vaddq_s32(v37, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v63, v42)))));
  uint8x16_t v66 = *v57;
  v67 = (uint8x16_t *)((char *)v57 + v11);
  int32x4_t v68 = vaddq_s32(v40, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v42, v66)))));
  int32x4_t v69 = vaddq_s32(v51, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v63, v60)))));
  int32x4_t v70 = vaddq_s32(v52, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v66, v60)))));
  uint8x16_t v71 = *v64;
  v72 = (uint8x16_t *)((char *)v64 + v11);
  int32x4_t v73 = vaddq_s32(v55, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v59)))));
  uint8x16_t v74 = *v67;
  v75 = (uint8x16_t *)((char *)v67 + v11);
  int32x4_t v76 = vaddq_s32(v58, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v59, v74)))));
  uint8x16_t v77 = v3[8];
  uint8x16_t v78 = v3[9];
  int32x4_t v79 = vaddq_s32(v61, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v77)))));
  int32x4_t v80 = vaddq_s32(v62, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v74, v77)))));
  uint8x16_t v81 = *v72;
  v82 = (uint8x16_t *)((char *)v72 + v11);
  int32x4_t v83 = vaddq_s32(v65, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v81, v60)))));
  uint8x16_t v84 = *v75;
  v85 = (uint8x16_t *)((char *)v75 + v11);
  int32x4_t v86 = vaddq_s32(v68, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v60, v84)))));
  int32x4_t v87 = vaddq_s32(v69, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v81, v78)))));
  int32x4_t v88 = vaddq_s32(v70, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v84, v78)))));
  uint8x16_t v89 = *v82;
  v90 = (uint8x16_t *)((char *)v82 + v11);
  int32x4_t v91 = vaddq_s32(v73, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v89, v77)))));
  uint8x16_t v92 = *v85;
  v93 = (uint8x16_t *)((char *)v85 + v11);
  int32x4_t v94 = vaddq_s32(v76, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v77, v92)))));
  uint8x16_t v95 = v3[10];
  uint8x16_t v96 = v3[11];
  int32x4_t v97 = vaddq_s32(v79, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v89, v95)))));
  int32x4_t v98 = vaddq_s32(v80, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, v95)))));
  uint8x16_t v99 = *v90;
  v100 = (uint8x16_t *)((char *)v90 + v11);
  int32x4_t v101 = vaddq_s32(v83, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v99, v78)))));
  uint8x16_t v102 = *v93;
  v103 = (uint8x16_t *)((char *)v93 + v11);
  int32x4_t v104 = vaddq_s32(v86, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v78, v102)))));
  int32x4_t v105 = vaddq_s32(v87, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v99, v96)))));
  int32x4_t v106 = vaddq_s32(v88, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v102, v96)))));
  uint8x16_t v107 = *v100;
  v108 = (uint8x16_t *)((char *)v100 + v11);
  int32x4_t v109 = vaddq_s32(v91, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v107, v95)))));
  uint8x16_t v110 = *v103;
  v111 = (uint8x16_t *)((char *)v103 + v11);
  int32x4_t v112 = vaddq_s32(v94, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v95, v110)))));
  uint8x16_t v113 = v3[12];
  uint8x16_t v114 = v3[13];
  int32x4_t v115 = vaddq_s32(v97, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v107, v113)))));
  int32x4_t v116 = vaddq_s32(v98, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v110, v113)))));
  uint8x16_t v117 = *v108;
  v118 = (uint8x16_t *)((char *)v108 + v11);
  int32x4_t v119 = vaddq_s32(v101, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v117, v96)))));
  uint8x16_t v120 = *v111;
  v121 = (uint8x16_t *)((char *)v111 + v11);
  int32x4_t v122 = vaddq_s32(v104, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v96, v120)))));
  int32x4_t v123 = vaddq_s32(v105, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v117, v114)))));
  int32x4_t v124 = vaddq_s32(v106, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v120, v114)))));
  uint8x16_t v125 = *v118;
  v126 = (uint8x16_t *)((char *)v118 + v11);
  int32x4_t v127 = vaddq_s32(v109, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v125, v113)))));
  uint8x16_t v128 = *v121;
  v129 = (uint8x16_t *)((char *)v121 + v11);
  int32x4_t v130 = vaddq_s32(v112, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v113, v128)))));
  uint8x16_t v131 = v3[14];
  uint8x16_t v132 = v3[15];
  v133 = &v4->i8[v11];
  int32x4_t v134 = vaddq_s32(vaddq_s32(v123, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v126, v132))))), vaddq_s32(v115, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v125, v131))))));
  int32x4_t v135 = vaddq_s32(vaddq_s32(v124, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v129, v132))))), vaddq_s32(v116, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v128, v131))))));
  int32x4_t v136 = vaddq_s32(vaddq_s32(vaddq_s32(v119, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v126, v114))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v126 + v11 + v11), v132))))), vaddq_s32(v127, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v126 + v11), v131))))));
  int32x4_t v137 = vaddq_s32(vaddq_s32(vaddq_s32(v122, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v114, *v129))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v129 + v11 + v11), v132))))), vaddq_s32(v130, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v129 + v11), v131))))));
  a3[5] = vaddq_s32(v134, vdupq_laneq_s32(v134, 2)).u16[0];
  *a3 = vaddq_s32(v136, vdupq_laneq_s32(v136, 2)).u16[0];
  a3[3] = vaddq_s32(v135, vdupq_laneq_s32(v135, 2)).u16[0];
  a3[2] = vaddq_s32(v137, vdupq_laneq_s32(v137, 2)).u16[0];
  uint8x16_t v138 = *v4;
  uint8x16_t v139 = *(uint8x16_t *)((char *)v4 + v11);
  v140 = (uint8x16_t *)((char *)v4 + v10);
  uint8x16_t v141 = v3[1];
  int32x4_t v142 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v139, v141)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v138, *v3)))));
  uint8x16_t v143 = *v140;
  v144 = (uint8x16_t *)((char *)v140 + v10);
  v145 = (uint8x16_t *)&v133[v10 + v10];
  uint8x16_t v146 = v3[2];
  uint8x16_t v147 = v3[3];
  uint8x16_t v148 = *v144;
  uint8x16_t v149 = *v145;
  v150 = (uint8x16_t *)((char *)v144 + v10);
  v151 = (uint8x16_t *)((char *)v145 + v10);
  int32x4_t v152 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v141, v149)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v148)))));
  uint8x16_t v153 = v3[4];
  uint8x16_t v154 = v3[5];
  int32x4_t v155 = vaddq_s32(v142, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v148, v153)))));
  int32x4_t v156 = vaddq_s32(vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v143, v146)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)&v133[v10], v147))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v149, v154)))));
  uint8x16_t v157 = *v150;
  uint8x16_t v158 = *v151;
  v159 = (uint8x16_t *)((char *)v150 + v10);
  v160 = (uint8x16_t *)((char *)v151 + v10);
  int32x4_t v161 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v146, v157)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v147, v158)))));
  uint8x16_t v162 = v3[6];
  uint8x16_t v163 = v3[7];
  int32x4_t v164 = vaddq_s32(v155, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v157, v162)))));
  int32x4_t v165 = vaddq_s32(v156, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v158, v163)))));
  uint8x16_t v166 = *v159;
  uint8x16_t v167 = *v160;
  v168 = (uint8x16_t *)((char *)v159 + v10);
  v169 = (uint8x16_t *)((char *)v160 + v10);
  int32x4_t v170 = vaddq_s32(v152, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v153, v166)))));
  int32x4_t v171 = vaddq_s32(v161, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v154, v167)))));
  uint8x16_t v172 = v3[8];
  uint8x16_t v173 = v3[9];
  int32x4_t v174 = vaddq_s32(v164, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v166, v172)))));
  int32x4_t v175 = vaddq_s32(v165, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v167, v173)))));
  uint8x16_t v176 = *v168;
  uint8x16_t v177 = *v169;
  v178 = (uint8x16_t *)((char *)v168 + v10);
  v179 = (uint8x16_t *)((char *)v169 + v10);
  int32x4_t v180 = vaddq_s32(v170, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v162, v176)))));
  int32x4_t v181 = vaddq_s32(v171, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v163, v177)))));
  uint8x16_t v182 = v3[10];
  uint8x16_t v183 = v3[11];
  int32x4_t v184 = vaddq_s32(v174, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v176, v182)))));
  int32x4_t v185 = vaddq_s32(v175, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v177, v183)))));
  uint8x16_t v186 = *v178;
  uint8x16_t v187 = *v179;
  v188 = (uint8x16_t *)((char *)v178 + v10);
  v189 = (uint8x16_t *)((char *)v179 + v10);
  int32x4_t v190 = vaddq_s32(v180, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v172, v186)))));
  int32x4_t v191 = vaddq_s32(v181, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v173, v187)))));
  uint8x16_t v192 = v3[12];
  uint8x16_t v193 = v3[13];
  int32x4_t v194 = vaddq_s32(v184, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v186, v192)))));
  int32x4_t v195 = vaddq_s32(v185, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v187, v193)))));
  uint8x16_t v196 = *v188;
  uint8x16_t v197 = *v189;
  v198 = (uint8x16_t *)((char *)v188 + v10);
  v199 = (uint8x16_t *)((char *)v189 + v10);
  int32x4_t v200 = vaddq_s32(v190, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v182, v196)))));
  int32x4_t v201 = vaddq_s32(v191, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v183, v197)))));
  uint8x16_t v202 = v3[14];
  uint8x16_t v203 = v3[15];
  int32x4_t v204 = vaddq_s32(vaddq_s32(v194, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v196, v202))))), vaddq_s32(v195, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v197, v203))))));
  int32x4_t v205 = vaddq_s32(v200, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v192, *v198)))));
  int32x4_t v206 = vaddq_s32(v201, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v193, *v199)))));
  int32x4_t v207 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v203, *(uint8x16_t *)((char *)v199 + v10)))));
  int32x4_t v208 = vaddq_s32(v205, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v202, *(uint8x16_t *)((char *)v198 + v10))))));
  a3[4] = vaddq_s32(v204, vdupq_laneq_s32(v204, 2)).u16[0];
  int32x4_t v209 = vaddq_s32(v208, vaddq_s32(v206, v207));
  *(void *)&double result = vaddq_s32(v209, vdupq_laneq_s32(v209, 2)).u64[0];
  a3[1] = LOWORD(result);
  return result;
}

double sub_221A2C03C(void *a1, uint64_t a2, _WORD *a3)
{
  v3 = *(uint8x16_t **)(a2 + 56);
  v4 = (uint8x16_t *)a1[4];
  v5 = (uint8x16_t *)a1[5];
  uint8x16_t v6 = v3[1];
  int32x4_t v7 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v5, *v3))));
  v8 = (uint8x16_t *)a1[3];
  int32x4_t v9 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v8, *v3))));
  uint64_t v11 = *(unsigned int *)(a2 + 16);
  uint64_t v10 = *(unsigned int *)(a2 + 20);
  v12 = (uint8x16_t *)((char *)v5 + v11);
  v13 = (uint8x16_t *)((char *)v8 + v11);
  int32x4_t v14 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v12, v6)))), v7);
  int32x4_t v15 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v13, v6)))), v9);
  v16 = (uint8x16_t *)((char *)v12 + v11);
  uint8x16_t v17 = *v16;
  v18 = (uint8x16_t *)((char *)v13 + v11);
  uint32x4_t v19 = vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v16, *v3)));
  v20 = (uint8x16_t *)((char *)v16 + v11);
  uint8x16_t v21 = *v18;
  uint8x16_t v22 = vabdq_u8(*v3, *v18);
  v23 = (uint8x16_t *)((char *)v18 + v11);
  uint8x16_t v24 = v3[2];
  uint8x16_t v25 = v3[3];
  int32x4_t v26 = vaddq_s32(v14, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v17, v24)))));
  int32x4_t v27 = vaddq_s32(v15, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v24)))));
  uint8x16_t v28 = *v20;
  v29 = (uint8x16_t *)((char *)v20 + v11);
  int32x4_t v30 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v6)))), (int32x4_t)vpaddlq_u32(v19));
  uint8x16_t v31 = *v23;
  v32 = (uint8x16_t *)((char *)v23 + v11);
  int32x4_t v33 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v6, v31)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(v22))));
  int32x4_t v34 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v25))));
  uint8x16_t v35 = *v29;
  v36 = (uint8x16_t *)((char *)v29 + v11);
  int32x4_t v37 = vaddq_s32(v30, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v24)))));
  uint8x16_t v38 = *v32;
  v39 = (uint8x16_t *)((char *)v32 + v11);
  int32x4_t v40 = vaddq_s32(v33, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v24, v38)))));
  uint8x16_t v41 = v3[4];
  uint8x16_t v42 = v3[5];
  int32x4_t v43 = vaddq_s32(v34, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v41)))));
  int32x4_t v44 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v31, v25)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v38, v41)))));
  uint8x16_t v45 = *v36;
  v46 = (uint8x16_t *)((char *)v36 + v11);
  int32x4_t v47 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v45, v25))));
  uint8x16_t v48 = *v39;
  v49 = (uint8x16_t *)((char *)v39 + v11);
  int32x4_t v50 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v25, v48))));
  int32x4_t v51 = vaddq_s32(v26, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v45, v42)))));
  int32x4_t v52 = vaddq_s32(v27, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v48, v42)))));
  uint8x16_t v53 = *v46;
  v54 = (uint8x16_t *)((char *)v46 + v11);
  int32x4_t v55 = vaddq_s32(v47, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v41)))));
  uint8x16_t v56 = *v49;
  v57 = (uint8x16_t *)((char *)v49 + v11);
  int32x4_t v58 = vaddq_s32(v50, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v41, v56)))));
  uint8x16_t v59 = v3[6];
  uint8x16_t v60 = v3[7];
  int32x4_t v61 = &v4->i8[v11];
  int32x4_t v62 = vaddq_s32(vaddq_s32(v51, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v54, v60))))), vaddq_s32(v43, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v59))))));
  int32x4_t v63 = vaddq_s32(vaddq_s32(v52, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v57, v60))))), vaddq_s32(v44, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v59))))));
  int32x4_t v64 = vaddq_s32(vaddq_s32(vaddq_s32(v37, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v54, v42))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v54 + v11 + v11), v60))))), vaddq_s32(v55, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v54 + v11), v59))))));
  int32x4_t v65 = vaddq_s32(vaddq_s32(vaddq_s32(v40, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v42, *v57))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v57 + v11 + v11), v60))))), vaddq_s32(v58, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v57 + v11), v59))))));
  a3[5] = vaddq_s32(v62, vdupq_laneq_s32(v62, 2)).u16[0];
  *a3 = vaddq_s32(v64, vdupq_laneq_s32(v64, 2)).u16[0];
  a3[3] = vaddq_s32(v63, vdupq_laneq_s32(v63, 2)).u16[0];
  a3[2] = vaddq_s32(v65, vdupq_laneq_s32(v65, 2)).u16[0];
  uint8x16_t v66 = *v4;
  uint8x16_t v67 = *(uint8x16_t *)((char *)v4 + v11);
  int32x4_t v68 = (uint8x16_t *)((char *)v4 + v10);
  uint8x16_t v69 = v3[1];
  int32x4_t v70 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v67, v69)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v66, *v3)))));
  uint8x16_t v71 = *v68;
  v72 = (uint8x16_t *)((char *)v68 + v10);
  int32x4_t v73 = (uint8x16_t *)&v61[v10 + v10];
  uint8x16_t v74 = v3[2];
  uint8x16_t v75 = v3[3];
  uint8x16_t v76 = *v72;
  uint8x16_t v77 = *v73;
  uint8x16_t v78 = (uint8x16_t *)((char *)v72 + v10);
  int32x4_t v79 = (uint8x16_t *)((char *)v73 + v10);
  int32x4_t v80 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v69, v77)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v76)))));
  uint8x16_t v81 = v3[4];
  uint8x16_t v82 = v3[5];
  int32x4_t v83 = vaddq_s32(v70, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v76, v81)))));
  int32x4_t v84 = vaddq_s32(vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v74)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)&v61[v10], v75))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v77, v82)))));
  uint8x16_t v85 = *v78;
  uint8x16_t v86 = *v79;
  int32x4_t v87 = (uint8x16_t *)((char *)v78 + v10);
  int32x4_t v88 = (uint8x16_t *)((char *)v79 + v10);
  int32x4_t v89 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v74, v85)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v75, v86)))));
  uint8x16_t v90 = v3[6];
  uint8x16_t v91 = v3[7];
  int32x4_t v92 = vaddq_s32(vaddq_s32(v83, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v85, v90))))), vaddq_s32(v84, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v86, v91))))));
  int32x4_t v93 = vaddq_s32(v80, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v81, *v87)))));
  int32x4_t v94 = vaddq_s32(v89, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v82, *v88)))));
  int32x4_t v95 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v91, *(uint8x16_t *)((char *)v88 + v10)))));
  int32x4_t v96 = vaddq_s32(v93, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v90, *(uint8x16_t *)((char *)v87 + v10))))));
  a3[4] = vaddq_s32(v92, vdupq_laneq_s32(v92, 2)).u16[0];
  int32x4_t v97 = vaddq_s32(v96, vaddq_s32(v94, v95));
  *(void *)&double result = vaddq_s32(v97, vdupq_laneq_s32(v97, 2)).u64[0];
  a3[1] = LOWORD(result);
  return result;
}

double sub_221A2C544(void *a1, uint64_t a2, _WORD *a3, int64x2_t a4, int64x2_t a5, int64x2_t a6, double a7, int64x2_t a8, int64x2_t a9, int64x2_t a10, int64x2_t a11)
{
  uint64_t v13 = *(unsigned int *)(a2 + 16);
  uint64_t v12 = *(unsigned int *)(a2 + 20);
  int32x4_t v14 = (uint64_t *)a1[4];
  int32x4_t v15 = (unint64_t *)a1[5];
  v16 = (char *)v15 + v13;
  a4.i64[0] = *v15;
  a5.i64[0] = *(unint64_t *)((char *)v15 + v13);
  uint8x16_t v17 = (uint8x16_t)vzip1q_s64(a4, a5);
  v18 = (unint64_t *)a1[3];
  uint32x4_t v19 = (char *)v18 + v13;
  a5.i64[0] = *v18;
  a6.i64[0] = *(unint64_t *)((char *)v18 + v13);
  v20 = *(uint8x16_t **)(a2 + 64);
  uint8x16_t v21 = v20[1];
  int32x4_t v22 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64(a5, a6), *v20))));
  v23 = (unint64_t *)((char *)v15 + v12);
  uint8x16_t v24 = (unint64_t *)&v16[v12];
  a8.i64[0] = *v23;
  a9.i64[0] = *v24;
  uint8x16_t v25 = (uint8x16_t)vzip1q_s64(a8, a9);
  int32x4_t v26 = (unint64_t *)((char *)v18 + v12);
  int32x4_t v27 = (unint64_t *)&v19[v12];
  a9.i64[0] = *v26;
  a10.i64[0] = *v27;
  uint8x16_t v28 = (uint8x16_t)vzip1q_s64(a9, a10);
  int32x4_t v29 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v20, v25))));
  int32x4_t v30 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v20, v28))));
  int32x4_t v31 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v25, v21))));
  v32 = (uint64_t *)((char *)v23 + v12);
  int32x4_t v33 = (uint64_t *)((char *)v24 + v12);
  int32x4_t v34 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v21))));
  uint8x16_t v35 = (uint64_t *)((char *)v26 + v12);
  int32x4_t v36 = vaddq_s32(v31, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v17, *v20)))));
  int32x4_t v37 = vaddq_s32(v34, v22);
  v31.i64[0] = *v32;
  v34.i64[0] = *v33;
  uint8x16_t v38 = (uint8x16_t)vzip1q_s64((int64x2_t)v31, (int64x2_t)v34);
  v39 = (unint64_t *)((char *)v27 + v12);
  v34.i64[0] = *v35;
  a11.i64[0] = *v39;
  uint8x16_t v40 = (uint8x16_t)vzip1q_s64((int64x2_t)v34, a11);
  uint8x16_t v41 = (uint64_t *)((char *)v32 + v12);
  uint8x16_t v42 = (uint64_t *)((char *)v33 + v12);
  int32x4_t v43 = (uint64_t *)((char *)v35 + v12);
  int32x4_t v44 = (uint64_t *)((char *)v39 + v12);
  int32x4_t v45 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v38)))), v29);
  int32x4_t v46 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v40)))), v30);
  uint8x16_t v47 = v20[2];
  uint8x16_t v48 = v20[3];
  int32x4_t v49 = vaddq_s32(v36, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v38, v47)))));
  int32x4_t v50 = vaddq_s32(v37, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v40, v47)))));
  v36.i64[0] = *v41;
  v37.i64[0] = *v42;
  int32x4_t v51 = (uint64_t *)((char *)v41 + v12);
  int32x4_t v52 = (uint64_t *)((char *)v42 + v12);
  uint8x16_t v53 = (uint8x16_t)vzip1q_s64((int64x2_t)v36, (int64x2_t)v37);
  v36.i64[0] = *v43;
  v37.i64[0] = *v44;
  v54 = (uint64_t *)((char *)v43 + v12);
  int32x4_t v55 = (uint64_t *)((char *)v44 + v12);
  uint8x16_t v56 = (uint8x16_t)vzip1q_s64((int64x2_t)v36, (int64x2_t)v37);
  int32x4_t v57 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v47, v53))));
  int32x4_t v58 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v47, v56))));
  int32x4_t v59 = vaddq_s32(v45, v57);
  int32x4_t v60 = vaddq_s32(v46, v58);
  int32x4_t v61 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v48))));
  int32x4_t v62 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v48))));
  v45.i64[0] = *v51;
  v46.i64[0] = *v52;
  int32x4_t v63 = (uint64_t *)((char *)v51 + v12);
  int32x4_t v64 = (uint64_t *)((char *)v52 + v12);
  uint8x16_t v65 = (uint8x16_t)vzip1q_s64((int64x2_t)v45, (int64x2_t)v46);
  v46.i64[0] = *v54;
  v58.i64[0] = *v55;
  uint8x16_t v66 = (uint64_t *)((char *)v54 + v12);
  uint8x16_t v67 = (uint64_t *)((char *)v55 + v12);
  uint8x16_t v68 = (uint8x16_t)vzip1q_s64((int64x2_t)v46, (int64x2_t)v58);
  int32x4_t v69 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v48, v65))));
  int32x4_t v70 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v48, v68))));
  uint8x16_t v71 = v20[8];
  uint8x16_t v72 = v20[9];
  int32x4_t v73 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v65, v71))));
  int32x4_t v74 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v68, v71))));
  int32x4_t v75 = vaddq_s32(v61, v73);
  int32x4_t v76 = vaddq_s32(v62, v74);
  v73.i64[0] = *v63;
  v74.i64[0] = *v64;
  uint8x16_t v77 = (uint64_t *)((char *)v63 + v12);
  uint8x16_t v78 = (uint8x16_t)vzip1q_s64((int64x2_t)v73, (int64x2_t)v74);
  v73.i64[0] = *v66;
  v11.i64[0] = *v67;
  int32x4_t v79 = (uint64_t *)((char *)v66 + v12);
  int64x2_t v80 = vzip1q_s64((int64x2_t)v73, v11);
  int32x4_t v81 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v78))));
  int32x4_t v82 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, (uint8x16_t)v80))));
  int32x4_t v83 = vaddq_s32(v69, v81);
  int32x4_t v84 = vaddq_s32(v70, v82);
  int32x4_t v85 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v80, v72))));
  int32x4_t v86 = vaddq_s32(v49, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v78, v72)))));
  int32x4_t v87 = vaddq_s32(v50, v85);
  v50.i64[0] = *v77;
  v85.i64[0] = *(uint64_t *)((char *)v64 + v12);
  uint8x16_t v88 = (uint8x16_t)vzip1q_s64((int64x2_t)v50, (int64x2_t)v85);
  v85.i64[0] = *v79;
  v82.i64[0] = *(uint64_t *)((char *)v67 + v12);
  uint8x16_t v89 = (uint8x16_t)vzip1q_s64((int64x2_t)v85, (int64x2_t)v82);
  int32x4_t v90 = vaddq_s32(v59, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v72, v88)))));
  int32x4_t v91 = vaddq_s32(v60, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v72, v89)))));
  uint8x16_t v92 = v20[10];
  uint8x16_t v93 = v20[11];
  int32x4_t v94 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v89, v92))));
  int32x4_t v95 = vaddq_s32(v75, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v88, v92)))));
  int32x4_t v96 = vaddq_s32(v76, v94);
  v76.i64[0] = *(uint64_t *)((char *)v77 + v12);
  v94.i64[0] = *(uint64_t *)((char *)v64 + v12 + v12);
  uint8x16_t v97 = (uint8x16_t)vzip1q_s64((int64x2_t)v76, (int64x2_t)v94);
  v94.i64[0] = *(uint64_t *)((char *)v79 + v12);
  v80.i64[0] = *(uint64_t *)((char *)v67 + v12 + v12);
  uint8x16_t v98 = (uint8x16_t)vzip1q_s64((int64x2_t)v94, v80);
  int32x4_t v99 = vaddq_s32(v83, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, v97)))));
  v100 = (uint64_t *)((char *)v14 + v13);
  int32x4_t v101 = vaddq_s32(v84, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, v98)))));
  int32x4_t v102 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v98, v93))));
  int32x4_t v103 = vaddq_s32(v86, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v97, v93)))));
  int32x4_t v104 = vaddq_s32(v103, v95);
  int32x4_t v105 = vaddq_s32(vaddq_s32(v87, v102), v96);
  v96.i64[0] = *(uint64_t *)((char *)v77 + v12 + v12);
  v103.i64[0] = *(uint64_t *)((char *)v64 + v12 + v12 + v12);
  v86.i64[0] = *(uint64_t *)((char *)v79 + v12 + v12);
  uint8x16_t v106 = (uint8x16_t)vzip1q_s64((int64x2_t)v96, (int64x2_t)v103);
  v103.i64[0] = *(uint64_t *)((char *)v67 + v12 + v12 + v12);
  int32x4_t v107 = vaddq_s32(vaddq_s32(v90, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v93, v106))))), v99);
  int32x4_t v108 = vaddq_s32(vaddq_s32(v91, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v93, (uint8x16_t)vzip1q_s64((int64x2_t)v86, (int64x2_t)v103)))))), v101);
  int64x2_t v109 = (int64x2_t)vaddq_s32(v104, vdupq_laneq_s32(v104, 2));
  int64x2_t v110 = (int64x2_t)vaddq_s32(v107, vdupq_laneq_s32(v107, 2));
  int32x4_t v111 = vdupq_laneq_s32(v105, 2);
  int32x4_t v112 = vdupq_laneq_s32(v108, 2);
  int64x2_t v113 = (int64x2_t)vaddq_s32(v105, v111);
  int64x2_t v114 = (int64x2_t)vaddq_s32(v108, v112);
  a3[5] = v109.i16[0];
  *a3 = v110.i16[0];
  a3[3] = v113.i16[0];
  a3[2] = v114.i16[0];
  v114.i64[0] = *v14;
  v110.i64[0] = *v100;
  int32x4_t v115 = (uint64_t *)((char *)v14 + v12);
  int32x4_t v116 = (uint64_t *)((char *)v100 + v12);
  v113.i64[0] = *v115;
  v109.i64[0] = *v116;
  uint8x16_t v117 = (uint64_t *)((char *)v115 + v12);
  v118 = (uint64_t *)((char *)v116 + v12);
  uint8x16_t v119 = (uint8x16_t)vzip1q_s64(v114, v110);
  uint8x16_t v120 = (uint8x16_t)vzip1q_s64(v113, v109);
  uint8x16_t v121 = v20[1];
  int32x4_t v122 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v120, v121))));
  int32x4_t v123 = vaddq_s32(v122, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v119, *v20)))));
  v122.i64[0] = *v117;
  v111.i64[0] = *v118;
  int32x4_t v124 = (uint64_t *)((char *)v117 + v12);
  uint8x16_t v125 = (uint64_t *)((char *)v118 + v12);
  v112.i64[0] = *v124;
  v101.i64[0] = *v125;
  v126 = (uint64_t *)((char *)v124 + v12);
  int32x4_t v127 = (uint64_t *)((char *)v125 + v12);
  uint8x16_t v128 = (uint8x16_t)vzip1q_s64((int64x2_t)v122, (int64x2_t)v111);
  uint8x16_t v129 = (uint8x16_t)vzip1q_s64((int64x2_t)v112, (int64x2_t)v101);
  int32x4_t v130 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v121, v129)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v20, v128)))));
  uint8x16_t v131 = v20[2];
  uint8x16_t v132 = v20[3];
  int32x4_t v133 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v128, v131))));
  int32x4_t v134 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v129, v132))));
  int32x4_t v135 = vaddq_s32(v123, v133);
  v133.i64[0] = *v126;
  v101.i64[0] = *v127;
  int32x4_t v136 = (uint64_t *)((char *)v126 + v12);
  int32x4_t v137 = (uint64_t *)((char *)v127 + v12);
  v86.i64[0] = *v136;
  v99.i64[0] = *v137;
  uint8x16_t v138 = (uint64_t *)((char *)v136 + v12);
  uint8x16_t v139 = (uint64_t *)((char *)v137 + v12);
  uint8x16_t v140 = (uint8x16_t)vzip1q_s64((int64x2_t)v133, (int64x2_t)v101);
  uint8x16_t v141 = (uint8x16_t)vzip1q_s64((int64x2_t)v86, (int64x2_t)v99);
  int32x4_t v142 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v132, v141))));
  int32x4_t v143 = vaddq_s32(v130, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v131, v140)))));
  uint8x16_t v144 = v20[8];
  uint8x16_t v145 = v20[9];
  int32x4_t v146 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v141, v145))));
  int32x4_t v147 = vaddq_s32(v134, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v140, v144)))));
  int32x4_t v148 = vaddq_s32(v135, v146);
  v134.i64[0] = *v138;
  v146.i64[0] = *v139;
  uint8x16_t v149 = (uint64_t *)((char *)v138 + v12);
  v150 = (uint64_t *)((char *)v139 + v12);
  v99.i64[0] = *v149;
  v102.i64[0] = *v150;
  v151 = (uint64_t *)((char *)v149 + v12);
  int32x4_t v152 = (uint64_t *)((char *)v150 + v12);
  uint8x16_t v153 = (uint8x16_t)vzip1q_s64((int64x2_t)v134, (int64x2_t)v146);
  uint8x16_t v154 = (uint8x16_t)vzip1q_s64((int64x2_t)v99, (int64x2_t)v102);
  int32x4_t v155 = vaddq_s32(v142, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v144, v153)))));
  int32x4_t v156 = vaddq_s32(v143, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v145, v154)))));
  uint8x16_t v157 = v20[10];
  uint8x16_t v158 = v20[11];
  int32x4_t v159 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v153, v157))));
  int32x4_t v160 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v154, v158))));
  int32x4_t v161 = vaddq_s32(v147, v159);
  int32x4_t v162 = vaddq_s32(vaddq_s32(v148, v160), v161);
  v161.i64[0] = *v151;
  v159.i64[0] = *(uint64_t *)((char *)v151 + v12);
  v160.i64[0] = *v152;
  v99.i64[0] = *(uint64_t *)((char *)v152 + v12);
  a3[4] = vaddq_s32(v162, vdupq_laneq_s32(v162, 2)).u16[0];
  int32x4_t v163 = vaddq_s32(vaddq_s32(v156, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v158, (uint8x16_t)vzip1q_s64((int64x2_t)v159, (int64x2_t)v99)))))), vaddq_s32(v155, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v157, (uint8x16_t)vzip1q_s64((int64x2_t)v161, (int64x2_t)v160)))))));
  *(void *)&double result = vaddq_s32(v163, vdupq_laneq_s32(v163, 2)).u64[0];
  a3[1] = LOWORD(result);
  return result;
}

double sub_221A2CB74(void *a1, uint64_t a2, _WORD *a3, int64x2_t a4, int64x2_t a5, int64x2_t a6, int64x2_t a7, int64x2_t a8, int64x2_t a9, int64x2_t a10, int64x2_t a11)
{
  uint64_t v14 = *(unsigned int *)(a2 + 16);
  uint64_t v13 = *(unsigned int *)(a2 + 20);
  uint64_t v15 = *(void *)(a2 + 64);
  v16 = (uint64_t *)a1[4];
  uint8x16_t v17 = (unint64_t *)a1[5];
  v18 = (unint64_t *)((char *)v17 + v14);
  uint32x4_t v19 = (unint64_t *)a1[3];
  v20 = (unint64_t *)((char *)v19 + v14);
  uint8x16_t v21 = (uint64_t *)((char *)v16 + v14);
  a4.i64[0] = *v17;
  a5.i64[0] = *v18;
  a6.i64[0] = *v19;
  a7.i64[0] = *v20;
  uint8x16_t v22 = (uint8x16_t)vzip1q_s64(a4, a5);
  uint8x16_t v23 = (uint8x16_t)vzip1q_s64(a6, a7);
  uint8x16_t v24 = (unint64_t *)((char *)v17 + v13);
  uint8x16_t v25 = (unint64_t *)((char *)v18 + v13);
  int32x4_t v26 = (unint64_t *)((char *)v19 + v13);
  int32x4_t v27 = (unint64_t *)((char *)v20 + v13);
  uint8x16_t v28 = *(uint8x16_t *)(v15 + 16);
  a8.i64[0] = *v24;
  a9.i64[0] = *v25;
  int32x4_t v29 = (uint64_t *)((char *)v24 + v13);
  uint8x16_t v30 = (uint8x16_t)vzip1q_s64(a8, a9);
  a9.i64[0] = *v26;
  a10.i64[0] = *v27;
  int32x4_t v31 = (uint64_t *)((char *)v26 + v13);
  uint8x16_t v32 = (uint8x16_t)vzip1q_s64(a9, a10);
  int32x4_t v33 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v15, v30))));
  int32x4_t v34 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v15, v32))));
  int32x4_t v35 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v30, v28))));
  int32x4_t v36 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v32, v28))));
  int32x4_t v37 = vaddq_s32(v35, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v22, *(uint8x16_t *)v15)))));
  int32x4_t v38 = vaddq_s32(v36, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v23, *(uint8x16_t *)v15)))));
  v35.i64[0] = *v29;
  v36.i64[0] = *(unint64_t *)((char *)v25 + v13);
  uint8x16_t v39 = (uint8x16_t)vzip1q_s64((int64x2_t)v35, (int64x2_t)v36);
  v36.i64[0] = *v31;
  a11.i64[0] = *(unint64_t *)((char *)v27 + v13);
  uint8x16_t v40 = (uint8x16_t)vzip1q_s64((int64x2_t)v36, a11);
  int32x4_t v41 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v39)))), v33);
  int32x4_t v42 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v40)))), v34);
  uint8x16_t v43 = *(uint8x16_t *)(v15 + 32);
  int64x2_t v44 = *(int64x2_t *)(v15 + 48);
  int32x4_t v45 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v39, v43))));
  int32x4_t v46 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v40, v43))));
  int32x4_t v47 = vaddq_s32(v37, v45);
  int32x4_t v48 = vaddq_s32(v38, v46);
  v45.i64[0] = *(uint64_t *)((char *)v29 + v13);
  v46.i64[0] = *(unint64_t *)((char *)v25 + v13 + v13);
  uint8x16_t v49 = (uint8x16_t)vzip1q_s64((int64x2_t)v45, (int64x2_t)v46);
  v46.i64[0] = *(uint64_t *)((char *)v31 + v13);
  v11.i64[0] = *(unint64_t *)((char *)v27 + v13 + v13);
  uint8x16_t v50 = (uint8x16_t)vzip1q_s64((int64x2_t)v46, v11);
  int32x4_t v51 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v43, v49))));
  uint32x4_t v52 = vpaddlq_u16(vpaddlq_u8(vabdq_u8(v43, v50)));
  int32x4_t v53 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v49, (uint8x16_t)v44))));
  int32x4_t v54 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v50, (uint8x16_t)v44))));
  int32x4_t v55 = vaddq_s32(v47, v53);
  v53.i64[0] = *(uint64_t *)((char *)v29 + v13 + v13);
  v12.i64[0] = *(unint64_t *)((char *)v25 + v13 + v13 + v13);
  int32x4_t v56 = vaddq_s32(v48, v54);
  uint8x16_t v57 = (uint8x16_t)vzip1q_s64((int64x2_t)v53, v12);
  v54.i64[0] = *(uint64_t *)((char *)v31 + v13 + v13);
  v12.i64[0] = *(unint64_t *)((char *)v27 + v13 + v13 + v13);
  int32x4_t v58 = vaddq_s32(v41, vaddq_s32(v51, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v44, v57))))));
  int32x4_t v59 = vaddq_s32(v42, vaddq_s32((int32x4_t)vpaddlq_u32(v52), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v44, (uint8x16_t)vzip1q_s64((int64x2_t)v54, v12)))))));
  int64x2_t v60 = (int64x2_t)vaddq_s32(v55, vdupq_laneq_s32(v55, 2));
  int64x2_t v61 = (int64x2_t)vaddq_s32(v58, vdupq_laneq_s32(v58, 2));
  int32x4_t v62 = vdupq_laneq_s32(v56, 2);
  int32x4_t v63 = vdupq_laneq_s32(v59, 2);
  int64x2_t v64 = (int64x2_t)vaddq_s32(v56, v62);
  int64x2_t v65 = (int64x2_t)vaddq_s32(v59, v63);
  a3[5] = v60.i16[0];
  *a3 = v61.i16[0];
  a3[3] = v64.i16[0];
  a3[2] = v65.i16[0];
  v60.i64[0] = *v16;
  v64.i64[0] = *v21;
  uint8x16_t v66 = (uint64_t *)((char *)v16 + v13);
  uint8x16_t v67 = (uint64_t *)((char *)v21 + v13);
  v65.i64[0] = *v66;
  v61.i64[0] = *v67;
  uint8x16_t v68 = (uint64_t *)((char *)v66 + v13);
  int32x4_t v69 = (uint64_t *)((char *)v67 + v13);
  uint8x16_t v70 = (uint8x16_t)vzip1q_s64(v60, v64);
  uint8x16_t v71 = (uint8x16_t)vzip1q_s64(v65, v61);
  uint8x16_t v72 = *(uint8x16_t *)(v15 + 16);
  int32x4_t v73 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v72))));
  int32x4_t v74 = vaddq_s32(v73, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v70, *(uint8x16_t *)v15)))));
  v73.i64[0] = *v68;
  v62.i64[0] = *v69;
  int32x4_t v75 = (uint64_t *)((char *)v68 + v13);
  int32x4_t v76 = (uint64_t *)((char *)v69 + v13);
  v63.i64[0] = *v75;
  v41.i64[0] = *v76;
  uint8x16_t v77 = (uint64_t *)((char *)v75 + v13);
  uint8x16_t v78 = (uint64_t *)((char *)v76 + v13);
  uint8x16_t v79 = (uint8x16_t)vzip1q_s64((int64x2_t)v73, (int64x2_t)v62);
  uint8x16_t v80 = (uint8x16_t)vzip1q_s64((int64x2_t)v63, (int64x2_t)v41);
  int32x4_t v81 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v72, v80)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v15, v79)))));
  uint8x16_t v82 = *(uint8x16_t *)(v15 + 32);
  uint8x16_t v83 = *(uint8x16_t *)(v15 + 48);
  int32x4_t v84 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v79, v82))));
  int32x4_t v85 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v80, v83))));
  int32x4_t v86 = vaddq_s32(vaddq_s32(v74, v84), v85);
  v84.i64[0] = *v77;
  v85.i64[0] = *v78;
  v41.i64[0] = *(uint64_t *)((char *)v77 + v13);
  v44.i64[0] = *(uint64_t *)((char *)v78 + v13);
  int32x4_t v87 = vaddq_s32(v81, vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v82, (uint8x16_t)vzip1q_s64((int64x2_t)v84, (int64x2_t)v85))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v83, (uint8x16_t)vzip1q_s64((int64x2_t)v41, v44)))))));
  *(void *)&double result = vaddq_s32(v86, vdupq_laneq_s32(v86, 2)).u64[0];
  a3[4] = LOWORD(result);
  a3[1] = vaddq_s32(v87, vdupq_laneq_s32(v87, 2)).u16[0];
  return result;
}

double sub_221A2CEC4(uint8x16_t **a1, uint64_t a2, _WORD *a3)
{
  v3 = *(uint8x16_t **)(a2 + 56);
  v4 = a1[4];
  uint8x16_t v5 = v3[1];
  int32x4_t v6 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v4, *v3))));
  uint64_t v7 = *(unsigned int *)(a2 + 16);
  uint64_t v8 = *(unsigned int *)(a2 + 20);
  int32x4_t v9 = (uint8x16_t *)((char *)v4 + v7);
  uint8x16_t v10 = *v9;
  int32x4_t v11 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v9, *v3))));
  int64x2_t v12 = (uint8x16_t *)((char *)v9 + v7);
  uint8x16_t v13 = *v12;
  int32x4_t v14 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, *v12))));
  uint64_t v15 = (uint8x16_t *)((char *)v12 + v7);
  uint8x16_t v16 = *v15;
  uint8x16_t v17 = (uint8x16_t *)((char *)v15 + v7);
  int32x4_t v18 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v10, v5)))), v6);
  int32x4_t v19 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v13, v5)))), v11);
  int32x4_t v20 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v5, v16)))), v14);
  uint8x16_t v21 = *v17;
  uint8x16_t v22 = (uint8x16_t *)((char *)v17 + v7);
  uint8x16_t v23 = v3[2];
  uint8x16_t v24 = v3[3];
  int32x4_t v25 = vaddq_s32(v18, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v13, v23)))));
  int32x4_t v26 = vaddq_s32(v19, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v16, v23)))));
  int32x4_t v27 = vaddq_s32(v20, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v23, v21)))));
  uint8x16_t v28 = *v22;
  int32x4_t v29 = (uint8x16_t *)((char *)v22 + v7);
  int32x4_t v30 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v16, v24))));
  int32x4_t v31 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v24))));
  uint8x16_t v32 = *v29;
  int32x4_t v33 = (uint8x16_t *)((char *)v29 + v7);
  uint8x16_t v34 = v3[4];
  uint8x16_t v35 = v3[5];
  int32x4_t v36 = vaddq_s32(v30, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v34)))));
  int32x4_t v37 = vaddq_s32(v31, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v34)))));
  int32x4_t v38 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v24, v28)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v34, v32)))));
  uint8x16_t v39 = *v33;
  uint8x16_t v40 = (uint8x16_t *)((char *)v33 + v7);
  int32x4_t v41 = vaddq_s32(v25, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v35)))));
  int32x4_t v42 = vaddq_s32(v26, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v32, v35)))));
  int32x4_t v43 = vaddq_s32(v27, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v39)))));
  uint8x16_t v44 = *v40;
  int32x4_t v45 = (uint8x16_t *)((char *)v40 + v7);
  uint8x16_t v46 = v3[6];
  uint8x16_t v47 = v3[7];
  int32x4_t v48 = vaddq_s32(v36, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v32, v46)))));
  int32x4_t v49 = vaddq_s32(v37, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v39, v46)))));
  int32x4_t v50 = vaddq_s32(v38, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v46, v44)))));
  uint8x16_t v51 = *v45;
  uint32x4_t v52 = (uint8x16_t *)((char *)v45 + v7);
  int32x4_t v53 = vaddq_s32(v41, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v39, v47)))));
  int32x4_t v54 = vaddq_s32(v42, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v44, v47)))));
  int32x4_t v55 = vaddq_s32(v43, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v47, v51)))));
  uint8x16_t v56 = *v52;
  uint8x16_t v57 = (uint8x16_t *)((char *)v52 + v7);
  uint8x16_t v58 = v3[8];
  uint8x16_t v59 = v3[9];
  int32x4_t v60 = vaddq_s32(v48, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v44, v58)))));
  int32x4_t v61 = vaddq_s32(v49, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v51, v58)))));
  int32x4_t v62 = vaddq_s32(v50, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v58, v56)))));
  uint8x16_t v63 = *v57;
  int64x2_t v64 = (uint8x16_t *)((char *)v57 + v7);
  int32x4_t v65 = vaddq_s32(v53, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v51, v59)))));
  int32x4_t v66 = vaddq_s32(v54, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v59)))));
  int32x4_t v67 = vaddq_s32(v55, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v59, v63)))));
  uint8x16_t v68 = *v64;
  int32x4_t v69 = (uint8x16_t *)((char *)v64 + v7);
  uint8x16_t v70 = v3[10];
  uint8x16_t v71 = v3[11];
  int32x4_t v72 = vaddq_s32(v60, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v70)))));
  int32x4_t v73 = vaddq_s32(v61, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v63, v70)))));
  int32x4_t v74 = vaddq_s32(v62, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v70, v68)))));
  uint8x16_t v75 = *v69;
  int32x4_t v76 = (uint8x16_t *)((char *)v69 + v7);
  int32x4_t v77 = vaddq_s32(v65, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v63, v71)))));
  int32x4_t v78 = vaddq_s32(v66, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v68, v71)))));
  int32x4_t v79 = vaddq_s32(v67, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, v75)))));
  uint8x16_t v80 = *v76;
  int32x4_t v81 = (uint8x16_t *)((char *)v76 + v7);
  uint8x16_t v82 = v3[12];
  uint8x16_t v83 = v3[13];
  int32x4_t v84 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v75, v82))));
  int32x4_t v85 = vaddq_s32(v72, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v68, v82)))));
  int32x4_t v86 = vaddq_s32(v74, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v82, v80)))));
  uint8x16_t v87 = *v81;
  uint8x16_t v88 = (uint8x16_t *)((char *)v81 + v7);
  int32x4_t v89 = vaddq_s32(v77, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v75, v83)))));
  int32x4_t v90 = vaddq_s32(v78, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v80, v83)))));
  int32x4_t v91 = vaddq_s32(v79, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v83, v87)))));
  uint8x16_t v92 = v3[14];
  uint8x16_t v93 = v3[15];
  int32x4_t v94 = vaddq_s32(vaddq_s32(v89, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v87, v93))))), vaddq_s32(v85, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v80, v92))))));
  int32x4_t v95 = vaddq_s32(vaddq_s32(v90, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v88, v93))))), vaddq_s32(vaddq_s32(v73, v84), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v87, v92))))));
  int32x4_t v96 = vaddq_s32(vaddq_s32(v91, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v93, *(uint8x16_t *)((char *)v88 + v7)))))), vaddq_s32(v86, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, *v88))))));
  a3[4] = vaddq_s32(v94, vdupq_laneq_s32(v94, 2)).u16[0];
  a3[2] = vaddq_s32(v95, vdupq_laneq_s32(v95, 2)).u16[0];
  a3[5] = vaddq_s32(v96, vdupq_laneq_s32(v96, 2)).u16[0];
  uint8x16_t v97 = (uint8x16_t *)((char *)*a1 + v7);
  uint8x16_t v98 = *v97;
  uint8x16_t v99 = v3[1];
  v100 = (uint8x16_t *)((char *)*a1 + v8);
  int32x4_t v101 = (uint8x16_t *)((char *)v97 + v8);
  int32x4_t v102 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v98, v99))));
  uint8x16_t v103 = *v100;
  uint8x16_t v104 = *v101;
  int32x4_t v105 = (uint8x16_t *)((char *)v100 + v8);
  uint8x16_t v106 = (uint8x16_t *)((char *)v101 + v8);
  int32x4_t v107 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v103))));
  int32x4_t v108 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v99, v104))));
  uint8x16_t v109 = v3[2];
  uint8x16_t v110 = v3[3];
  int32x4_t v111 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v103, v109)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(**a1, *v3)))));
  int32x4_t v112 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v104, v110)))), v102);
  uint8x16_t v113 = *v105;
  uint8x16_t v114 = *v106;
  int32x4_t v115 = (uint8x16_t *)((char *)v105 + v8);
  int32x4_t v116 = (uint8x16_t *)((char *)v106 + v8);
  int32x4_t v117 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v109, v113)))), v107);
  int32x4_t v118 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v110, v114)))), v108);
  uint8x16_t v119 = v3[4];
  uint8x16_t v120 = v3[5];
  int32x4_t v121 = vaddq_s32(v111, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v113, v119)))));
  int32x4_t v122 = vaddq_s32(v112, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v114, v120)))));
  uint8x16_t v123 = *v115;
  uint8x16_t v124 = *v116;
  uint8x16_t v125 = (uint8x16_t *)((char *)v115 + v8);
  v126 = (uint8x16_t *)((char *)v116 + v8);
  int32x4_t v127 = vaddq_s32(v117, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v119, v123)))));
  int32x4_t v128 = vaddq_s32(v118, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v120, v124)))));
  uint8x16_t v129 = v3[6];
  uint8x16_t v130 = v3[7];
  int32x4_t v131 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v123, v129))));
  int32x4_t v132 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v124, v130))));
  uint8x16_t v133 = *v125;
  uint8x16_t v134 = *v126;
  int32x4_t v135 = (uint8x16_t *)((char *)v125 + v8);
  int32x4_t v136 = (uint8x16_t *)((char *)v126 + v8);
  int32x4_t v137 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v129, v133))));
  int32x4_t v138 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v130, v134))));
  uint8x16_t v139 = v3[8];
  uint8x16_t v140 = v3[9];
  int32x4_t v141 = vaddq_s32(v131, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v133, v139)))));
  int32x4_t v142 = vaddq_s32(v132, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v134, v140)))));
  uint8x16_t v143 = *v135;
  uint8x16_t v144 = *v136;
  uint8x16_t v145 = (uint8x16_t *)((char *)v135 + v8);
  int32x4_t v146 = (uint8x16_t *)((char *)v136 + v8);
  int32x4_t v147 = vaddq_s32(v137, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v139, v143)))));
  int32x4_t v148 = vaddq_s32(v138, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v140, v144)))));
  uint8x16_t v149 = v3[10];
  uint8x16_t v150 = v3[11];
  int32x4_t v151 = vaddq_s32(v121, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v143, v149)))));
  int32x4_t v152 = vaddq_s32(v122, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v144, v150)))));
  uint8x16_t v153 = *v145;
  uint8x16_t v154 = *v146;
  int32x4_t v155 = (uint8x16_t *)((char *)v145 + v8);
  int32x4_t v156 = (uint8x16_t *)((char *)v146 + v8);
  int32x4_t v157 = vaddq_s32(v127, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v149, v153)))));
  int32x4_t v158 = vaddq_s32(v128, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v150, v154)))));
  uint8x16_t v159 = v3[12];
  uint8x16_t v160 = v3[13];
  int32x4_t v161 = vaddq_s32(v141, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v153, v159)))));
  int32x4_t v162 = vaddq_s32(v142, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v154, v160)))));
  int32x4_t v163 = vaddq_s32(v147, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v159, *v155)))));
  int32x4_t v164 = vaddq_s32(v148, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v160, *v156)))));
  uint8x16_t v165 = v3[14];
  uint8x16_t v166 = v3[15];
  int32x4_t v167 = vaddq_s32(vaddq_s32(v151, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v155, v165))))), v161);
  int32x4_t v168 = vaddq_s32(vaddq_s32(v152, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v156, v166))))), v162);
  int32x4_t v169 = vaddq_s32(vaddq_s32(v157, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v165, *(uint8x16_t *)((char *)v155 + v8)))))), v163);
  int32x4_t v170 = vaddq_s32(vaddq_s32(v158, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v166, *(uint8x16_t *)((char *)v156 + v8)))))), v164);
  *a3 = vaddq_s32(vaddq_s32(vaddq_s32(v167, v168), vdupq_laneq_s32(v167, 2)), vdupq_laneq_s32(v168, 2)).u16[0];
  a3[1] = vaddq_s32(vaddq_s32(vaddq_s32(v169, v170), vdupq_laneq_s32(v169, 2)), vdupq_laneq_s32(v170, 2)).u16[0];
  int32x4_t v171 = a1[6];
  uint8x16_t v172 = *v171;
  uint8x16_t v173 = (uint8x16_t *)((char *)v171 + v7);
  uint8x16_t v174 = *v173;
  int32x4_t v175 = (uint8x16_t *)((char *)v173 + v7);
  uint8x16_t v176 = *v175;
  uint8x16_t v177 = (uint8x16_t *)((char *)v175 + v7);
  uint8x16_t v178 = v3[1];
  uint8x16_t v179 = *v177;
  int32x4_t v180 = (uint8x16_t *)((char *)v177 + v7);
  int32x4_t v181 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v174, v178)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v172, *v3)))));
  int32x4_t v182 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v176, v178)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v174, *v3)))));
  int32x4_t v183 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v178, v179)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v176)))));
  uint8x16_t v184 = *v180;
  int32x4_t v185 = (uint8x16_t *)((char *)v180 + v7);
  uint8x16_t v186 = v3[2];
  uint8x16_t v187 = v3[3];
  int32x4_t v188 = vaddq_s32(v181, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v176, v186)))));
  int32x4_t v189 = vaddq_s32(v182, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v179, v186)))));
  int32x4_t v190 = vaddq_s32(v183, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v186, v184)))));
  uint8x16_t v191 = *v185;
  uint8x16_t v192 = (uint8x16_t *)((char *)v185 + v7);
  int32x4_t v193 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v179, v187))));
  int32x4_t v194 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v184, v187))));
  uint8x16_t v195 = *v192;
  uint8x16_t v196 = (uint8x16_t *)((char *)v192 + v7);
  uint8x16_t v197 = v3[4];
  uint8x16_t v198 = v3[5];
  int32x4_t v199 = vaddq_s32(v193, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v184, v197)))));
  int32x4_t v200 = vaddq_s32(v194, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v191, v197)))));
  int32x4_t v201 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v187, v191)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v197, v195)))));
  uint8x16_t v202 = *v196;
  uint8x16_t v203 = (uint8x16_t *)((char *)v196 + v7);
  int32x4_t v204 = vaddq_s32(v188, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v191, v198)))));
  int32x4_t v205 = vaddq_s32(v189, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v195, v198)))));
  int32x4_t v206 = vaddq_s32(v190, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v198, v202)))));
  uint8x16_t v207 = *v203;
  int32x4_t v208 = (uint8x16_t *)((char *)v203 + v7);
  uint8x16_t v209 = v3[6];
  uint8x16_t v210 = v3[7];
  int32x4_t v211 = vaddq_s32(v199, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v195, v209)))));
  int32x4_t v212 = vaddq_s32(v200, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v202, v209)))));
  int32x4_t v213 = vaddq_s32(v201, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v209, v207)))));
  uint8x16_t v214 = *v208;
  v215 = (uint8x16_t *)((char *)v208 + v7);
  int32x4_t v216 = vaddq_s32(v204, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v202, v210)))));
  int32x4_t v217 = vaddq_s32(v205, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v207, v210)))));
  int32x4_t v218 = vaddq_s32(v206, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v210, v214)))));
  uint8x16_t v219 = *v215;
  v220 = (uint8x16_t *)((char *)v215 + v7);
  uint8x16_t v221 = v3[8];
  uint8x16_t v222 = v3[9];
  int32x4_t v223 = vaddq_s32(v211, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v207, v221)))));
  int32x4_t v224 = vaddq_s32(v212, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v214, v221)))));
  int32x4_t v225 = vaddq_s32(v213, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v221, v219)))));
  uint8x16_t v226 = *v220;
  v227 = (uint8x16_t *)((char *)v220 + v7);
  int32x4_t v228 = vaddq_s32(v216, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v214, v222)))));
  int32x4_t v229 = vaddq_s32(v217, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v219, v222)))));
  int32x4_t v230 = vaddq_s32(v218, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v222, v226)))));
  uint8x16_t v231 = *v227;
  v232 = (uint8x16_t *)((char *)v227 + v7);
  uint8x16_t v233 = v3[10];
  uint8x16_t v234 = v3[11];
  int32x4_t v235 = vaddq_s32(v223, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v219, v233)))));
  int32x4_t v236 = vaddq_s32(v224, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v226, v233)))));
  int32x4_t v237 = vaddq_s32(v225, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v233, v231)))));
  uint8x16_t v238 = *v232;
  v239 = (uint8x16_t *)((char *)v232 + v7);
  int32x4_t v240 = vaddq_s32(v228, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v226, v234)))));
  int32x4_t v241 = vaddq_s32(v229, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v231, v234)))));
  int32x4_t v242 = vaddq_s32(v230, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v234, v238)))));
  uint8x16_t v243 = *v239;
  v244 = (uint8x16_t *)((char *)v239 + v7);
  uint8x16_t v245 = v3[12];
  uint8x16_t v246 = v3[13];
  int32x4_t v247 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v238, v245))));
  int32x4_t v248 = vaddq_s32(v235, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v231, v245)))));
  int32x4_t v249 = vaddq_s32(v237, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v245, v243)))));
  uint8x16_t v250 = *v244;
  v251 = (uint8x16_t *)((char *)v244 + v7);
  int32x4_t v252 = vaddq_s32(v240, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v238, v246)))));
  int32x4_t v253 = vaddq_s32(v241, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v243, v246)))));
  int32x4_t v254 = vaddq_s32(v242, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v246, v250)))));
  uint8x16_t v255 = v3[14];
  uint8x16_t v256 = v3[15];
  int32x4_t v257 = vaddq_s32(v248, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v243, v255)))));
  int32x4_t v258 = vaddq_s32(v249, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v255, *v251)))));
  int32x4_t v259 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v256, *(uint8x16_t *)((char *)v251 + v7)))));
  int32x4_t v260 = vaddq_s32(vaddq_s32(v252, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v250, v256))))), v257);
  int32x4_t v261 = vaddq_s32(vaddq_s32(v253, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v251, v256))))), vaddq_s32(vaddq_s32(v236, v247), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v250, v255))))));
  a3[6] = vaddq_s32(v260, vdupq_laneq_s32(v260, 2)).u16[0];
  a3[3] = vaddq_s32(v261, vdupq_laneq_s32(v261, 2)).u16[0];
  int32x4_t v262 = vaddq_s32(vaddq_s32(v254, v259), v258);
  *(void *)&double result = vaddq_s32(v262, vdupq_laneq_s32(v262, 2)).u64[0];
  a3[7] = LOWORD(result);
  return result;
}

double sub_221A2DB20(uint8x16_t **a1, uint64_t a2, _WORD *a3)
{
  v3 = *(uint8x16_t **)(a2 + 56);
  uint64_t v4 = *(unsigned int *)(a2 + 16);
  uint64_t v5 = *(unsigned int *)(a2 + 20);
  int32x4_t v6 = a1[4];
  uint8x16_t v7 = *v6;
  uint64_t v8 = (uint8x16_t *)((char *)v6 + v4);
  uint8x16_t v9 = *v8;
  uint8x16_t v10 = v3[1];
  int32x4_t v11 = (uint8x16_t *)((char *)v8 + v4);
  uint8x16_t v12 = *v11;
  uint8x16_t v13 = (uint8x16_t *)((char *)v11 + v4);
  uint8x16_t v14 = *v13;
  uint64_t v15 = (uint8x16_t *)((char *)v13 + v4);
  int32x4_t v16 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v9, v10)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v7, *v3)))));
  int32x4_t v17 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v12, v10)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v9, *v3)))));
  int32x4_t v18 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v10, v14)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v12)))));
  uint8x16_t v19 = *v15;
  int32x4_t v20 = (uint8x16_t *)((char *)v15 + v4);
  uint8x16_t v21 = v3[2];
  uint8x16_t v22 = v3[3];
  int32x4_t v23 = vaddq_s32(v16, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v12, v21)))));
  int32x4_t v24 = vaddq_s32(v17, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v14, v21)))));
  int32x4_t v25 = vaddq_s32(v18, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v19)))));
  uint8x16_t v26 = *v20;
  int32x4_t v27 = (uint8x16_t *)((char *)v20 + v4);
  int32x4_t v28 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v14, v22))));
  int32x4_t v29 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v19, v22))));
  uint8x16_t v30 = *v27;
  int32x4_t v31 = (uint8x16_t *)((char *)v27 + v4);
  uint8x16_t v32 = v3[4];
  uint8x16_t v33 = v3[5];
  int32x4_t v34 = vaddq_s32(v28, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v19, v32)))));
  int32x4_t v35 = vaddq_s32(v29, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v26, v32)))));
  int32x4_t v36 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v22, v26)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v32, v30)))));
  uint8x16_t v37 = *v31;
  int32x4_t v38 = (uint8x16_t *)((char *)v31 + v4);
  int32x4_t v39 = vaddq_s32(v23, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v26, v33)))));
  int32x4_t v40 = vaddq_s32(v24, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v30, v33)))));
  int32x4_t v41 = vaddq_s32(v25, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v33, v37)))));
  uint8x16_t v42 = v3[6];
  uint8x16_t v43 = v3[7];
  int32x4_t v44 = vaddq_s32(vaddq_s32(v39, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v37, v43))))), vaddq_s32(v34, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v30, v42))))));
  int32x4_t v45 = vaddq_s32(vaddq_s32(v40, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v38, v43))))), vaddq_s32(v35, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v37, v42))))));
  int32x4_t v46 = vaddq_s32(vaddq_s32(v41, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v43, *(uint8x16_t *)((char *)v38 + v4)))))), vaddq_s32(v36, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v42, *v38))))));
  a3[4] = vaddq_s32(v44, vdupq_laneq_s32(v44, 2)).u16[0];
  a3[2] = vaddq_s32(v45, vdupq_laneq_s32(v45, 2)).u16[0];
  a3[5] = vaddq_s32(v46, vdupq_laneq_s32(v46, 2)).u16[0];
  uint8x16_t v47 = (uint8x16_t *)((char *)*a1 + v4);
  uint8x16_t v48 = *v47;
  uint8x16_t v49 = v3[1];
  int32x4_t v50 = (uint8x16_t *)((char *)*a1 + v5);
  uint8x16_t v51 = (uint8x16_t *)((char *)v47 + v5);
  int32x4_t v52 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v48, v49))));
  uint8x16_t v53 = *v50;
  uint8x16_t v54 = *v51;
  int32x4_t v55 = (uint8x16_t *)((char *)v50 + v5);
  uint8x16_t v56 = (uint8x16_t *)((char *)v51 + v5);
  int32x4_t v57 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v53))));
  int32x4_t v58 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v49, v54))));
  uint8x16_t v59 = v3[2];
  uint8x16_t v60 = v3[3];
  int32x4_t v61 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v53, v59)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(**a1, *v3)))));
  int32x4_t v62 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v54, v60)))), v52);
  uint8x16_t v63 = *v55;
  uint8x16_t v64 = *v56;
  int32x4_t v65 = (uint8x16_t *)((char *)v55 + v5);
  int32x4_t v66 = (uint8x16_t *)((char *)v56 + v5);
  int32x4_t v67 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v59, v63)))), v57);
  int32x4_t v68 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v60, v64)))), v58);
  uint8x16_t v69 = v3[4];
  uint8x16_t v70 = v3[5];
  uint8x16_t v71 = v3[6];
  uint8x16_t v72 = v3[7];
  int32x4_t v73 = vaddq_s32(vaddq_s32(v61, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v63, v69))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v65, v71)))));
  int32x4_t v74 = vaddq_s32(vaddq_s32(v62, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v64, v70))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v66, v72)))));
  int32x4_t v75 = vaddq_s32(v67, vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v69, *v65)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, *(uint8x16_t *)((char *)v65 + v5)))))));
  int32x4_t v76 = vaddq_s32(v68, vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v70, *v66)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v72, *(uint8x16_t *)((char *)v66 + v5)))))));
  *a3 = vaddq_s32(vaddq_s32(vaddq_s32(v73, v74), vdupq_laneq_s32(v73, 2)), vdupq_laneq_s32(v74, 2)).u16[0];
  a3[1] = vaddq_s32(vaddq_s32(vaddq_s32(v75, v76), vdupq_laneq_s32(v75, 2)), vdupq_laneq_s32(v76, 2)).u16[0];
  int32x4_t v77 = a1[6];
  uint8x16_t v78 = *v77;
  int32x4_t v79 = (uint8x16_t *)((char *)v77 + v4);
  uint8x16_t v80 = *v79;
  int32x4_t v81 = (uint8x16_t *)((char *)v79 + v4);
  uint8x16_t v82 = *v81;
  uint8x16_t v83 = (uint8x16_t *)((char *)v81 + v4);
  uint8x16_t v84 = v3[1];
  uint8x16_t v85 = *v83;
  int32x4_t v86 = (uint8x16_t *)((char *)v83 + v4);
  int32x4_t v87 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v80, v84)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v78, *v3)))));
  int32x4_t v88 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v82, v84)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v80, *v3)))));
  int32x4_t v89 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v84, v85)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v3, v82)))));
  uint8x16_t v90 = *v86;
  int32x4_t v91 = (uint8x16_t *)((char *)v86 + v4);
  uint8x16_t v92 = v3[2];
  uint8x16_t v93 = v3[3];
  int32x4_t v94 = vaddq_s32(v87, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v82, v92)))));
  int32x4_t v95 = vaddq_s32(v88, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v85, v92)))));
  int32x4_t v96 = vaddq_s32(v89, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, v90)))));
  uint8x16_t v97 = *v91;
  uint8x16_t v98 = (uint8x16_t *)((char *)v91 + v4);
  int32x4_t v99 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v85, v93))));
  int32x4_t v100 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v90, v93))));
  uint8x16_t v101 = *v98;
  int32x4_t v102 = (uint8x16_t *)((char *)v98 + v4);
  uint8x16_t v103 = v3[4];
  uint8x16_t v104 = v3[5];
  int32x4_t v105 = vaddq_s32(v99, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v90, v103)))));
  int32x4_t v106 = vaddq_s32(v100, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v97, v103)))));
  int32x4_t v107 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v93, v97)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v103, v101)))));
  uint8x16_t v108 = *v102;
  uint8x16_t v109 = (uint8x16_t *)((char *)v102 + v4);
  int32x4_t v110 = vaddq_s32(v94, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v97, v104)))));
  int32x4_t v111 = vaddq_s32(v95, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v101, v104)))));
  int32x4_t v112 = vaddq_s32(v96, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v104, v108)))));
  uint8x16_t v113 = v3[6];
  uint8x16_t v114 = v3[7];
  int32x4_t v115 = vaddq_s32(vaddq_s32(v110, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v108, v114))))), vaddq_s32(v105, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v101, v113))))));
  int32x4_t v116 = vaddq_s32(vaddq_s32(v111, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v109, v114))))), vaddq_s32(v106, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v108, v113))))));
  int32x4_t v117 = vaddq_s32(vaddq_s32(v112, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v114, *(uint8x16_t *)((char *)v109 + v4)))))), vaddq_s32(v107, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v113, *v109))))));
  a3[6] = vaddq_s32(v115, vdupq_laneq_s32(v115, 2)).u16[0];
  *(void *)&double result = vaddq_s32(v117, vdupq_laneq_s32(v117, 2)).u64[0];
  a3[3] = vaddq_s32(v116, vdupq_laneq_s32(v116, 2)).u16[0];
  a3[7] = LOWORD(result);
  return result;
}

double sub_221A2E18C(uint64_t a1, uint64_t a2, _WORD *a3, int64x2_t a4, int64x2_t a5, int64x2_t a6, int64x2_t a7, double a8, double a9, int64x2_t a10, int64x2_t a11)
{
  uint64_t v12 = *(unsigned int *)(a2 + 16);
  uint64_t v11 = *(unsigned int *)(a2 + 20);
  uint8x16_t v13 = *(unint64_t **)(a1 + 32);
  a4.i64[0] = *v13;
  a5.i64[0] = *(unint64_t *)((char *)v13 + v12);
  uint8x16_t v14 = (uint8x16_t)vzip1q_s64(a4, a5);
  uint64_t v15 = (char *)v13 + v11;
  a6.i64[0] = *(unint64_t *)((char *)v13 + v11);
  uint8x16_t v16 = (uint8x16_t)vzip1q_s64(a5, a6);
  int32x4_t v17 = (unint64_t *)((char *)v13 + v12 + v11);
  a7.i64[0] = *v17;
  uint8x16_t v18 = (uint8x16_t)vzip1q_s64(a6, a7);
  uint64_t v19 = *(void *)(a2 + 64);
  uint8x16_t v20 = *(uint8x16_t *)(v19 + 16);
  uint8x16_t v21 = (unint64_t *)&v15[v11];
  uint8x16_t v22 = (unint64_t *)((char *)v17 + v11);
  int32x4_t v23 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v19, v18))));
  a10.i64[0] = *v21;
  a11.i64[0] = *v22;
  int32x4_t v24 = (uint64_t *)((char *)v21 + v11);
  uint8x16_t v25 = (uint8x16_t)vzip1q_s64(a7, a10);
  uint8x16_t v26 = (uint8x16_t)vzip1q_s64(a10, a11);
  int32x4_t v27 = (uint64_t *)((char *)v22 + v11);
  int32x4_t v28 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v25, v20))));
  int32x4_t v29 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v18, v20)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v14, *(uint8x16_t *)v19)))));
  int32x4_t v30 = vaddq_s32(v28, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v16, *(uint8x16_t *)v19)))));
  int32x4_t v31 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v20, v26)))), v23);
  v28.i64[0] = *v24;
  v23.i64[0] = *v27;
  uint8x16_t v32 = (uint64_t *)((char *)v24 + v11);
  uint8x16_t v33 = (uint64_t *)((char *)v27 + v11);
  uint8x16_t v34 = (uint8x16_t)vzip1q_s64(a11, (int64x2_t)v28);
  uint8x16_t v35 = (uint8x16_t)vzip1q_s64((int64x2_t)v28, (int64x2_t)v23);
  uint8x16_t v36 = *(uint8x16_t *)(v19 + 32);
  int64x2_t v37 = *(int64x2_t *)(v19 + 48);
  int32x4_t v38 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v26, v36))));
  int32x4_t v39 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v34, v36))));
  int32x4_t v40 = vaddq_s32(v29, v38);
  int32x4_t v41 = vaddq_s32(v30, v39);
  int32x4_t v42 = vaddq_s32(v31, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v36, v35)))));
  v39.i64[0] = *v32;
  v38.i64[0] = *v33;
  uint8x16_t v43 = (uint64_t *)((char *)v32 + v11);
  int32x4_t v44 = (uint64_t *)((char *)v33 + v11);
  uint8x16_t v45 = (uint8x16_t)vzip1q_s64((int64x2_t)v23, (int64x2_t)v39);
  uint8x16_t v46 = (uint8x16_t)vzip1q_s64((int64x2_t)v39, (int64x2_t)v38);
  int32x4_t v47 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, (uint8x16_t)v37))));
  int32x4_t v48 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v45, (uint8x16_t)v37))));
  int32x4_t v49 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v37, v46))));
  v37.i64[0] = *v43;
  uint8x16_t v50 = *(uint8x16_t *)(v19 + 128);
  uint8x16_t v51 = *(uint8x16_t *)(v19 + 144);
  int32x4_t v52 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v46, v50))));
  int32x4_t v53 = vaddq_s32(v47, v52);
  v52.i64[0] = *v44;
  uint8x16_t v54 = (uint64_t *)((char *)v43 + v11);
  int32x4_t v55 = (uint64_t *)((char *)v44 + v11);
  uint8x16_t v56 = (uint8x16_t)vzip1q_s64((int64x2_t)v38, v37);
  uint8x16_t v57 = (uint8x16_t)vzip1q_s64(v37, (int64x2_t)v52);
  int32x4_t v58 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v56, v50))));
  int32x4_t v59 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v50, v57))));
  int32x4_t v60 = vaddq_s32(v48, v58);
  int32x4_t v61 = vaddq_s32(v49, v59);
  v49.i64[0] = *v54;
  v59.i64[0] = *v55;
  int32x4_t v62 = (uint64_t *)((char *)v54 + v11);
  uint8x16_t v63 = (uint64_t *)((char *)v55 + v11);
  uint8x16_t v64 = (uint8x16_t)vzip1q_s64((int64x2_t)v52, (int64x2_t)v49);
  uint8x16_t v65 = (uint8x16_t)vzip1q_s64((int64x2_t)v49, (int64x2_t)v59);
  int32x4_t v66 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v64, v51))));
  int32x4_t v67 = vaddq_s32(v40, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v57, v51)))));
  int32x4_t v68 = vaddq_s32(v41, v66);
  int32x4_t v69 = vaddq_s32(v42, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v51, v65)))));
  v66.i64[0] = *v62;
  uint8x16_t v70 = *(uint8x16_t *)(v19 + 160);
  uint8x16_t v71 = *(uint8x16_t *)(v19 + 176);
  int32x4_t v72 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v65, v70))));
  int32x4_t v73 = vaddq_s32(v53, v72);
  v72.i64[0] = *v63;
  uint8x16_t v74 = (uint8x16_t)vzip1q_s64((int64x2_t)v59, (int64x2_t)v66);
  uint8x16_t v75 = (uint8x16_t)vzip1q_s64((int64x2_t)v66, (int64x2_t)v72);
  int32x4_t v76 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v74, v70))));
  int32x4_t v77 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v70, v75))));
  int32x4_t v78 = vaddq_s32(v60, v76);
  int32x4_t v79 = vaddq_s32(v61, v77);
  v77.i64[0] = *(uint64_t *)((char *)v62 + v11);
  v76.i64[0] = *(uint64_t *)((char *)v63 + v11);
  int32x4_t v80 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64((int64x2_t)v72, (int64x2_t)v77), v71))));
  int32x4_t v81 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v71, (uint8x16_t)vzip1q_s64((int64x2_t)v77, (int64x2_t)v76)))));
  int32x4_t v82 = vaddq_s32(vaddq_s32(v67, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v75, v71))))), v73);
  int32x4_t v83 = vaddq_s32(vaddq_s32(v68, v80), v78);
  int32x4_t v84 = vaddq_s32(vaddq_s32(v69, v81), v79);
  int32x4_t v85 = vdupq_laneq_s32(v82, 2);
  int32x4_t v86 = vdupq_laneq_s32(v83, 2);
  int32x4_t v87 = vdupq_laneq_s32(v84, 2);
  int64x2_t v88 = (int64x2_t)vaddq_s32(v82, v85);
  int64x2_t v89 = (int64x2_t)vaddq_s32(v83, v86);
  int64x2_t v90 = (int64x2_t)vaddq_s32(v84, v87);
  a3[4] = v88.i16[0];
  a3[2] = v89.i16[0];
  a3[5] = v90.i16[0];
  int32x4_t v91 = (uint64_t *)(*(void *)a1 + v12);
  v88.i64[0] = **(void **)a1;
  v89.i64[0] = *v91;
  uint8x16_t v92 = (uint64_t *)(*(void *)a1 + v11);
  uint8x16_t v93 = (uint64_t *)((char *)v91 + v11);
  v90.i64[0] = *v92;
  v85.i64[0] = *v93;
  int32x4_t v94 = (uint64_t *)((char *)v92 + v11);
  int32x4_t v95 = (uint64_t *)((char *)v93 + v11);
  v86.i64[0] = *v94;
  v87.i64[0] = *v95;
  int32x4_t v96 = (uint64_t *)((char *)v94 + v11);
  uint8x16_t v97 = (uint64_t *)((char *)v95 + v11);
  uint8x16_t v98 = (uint8x16_t)vzip1q_s64(v88, v89);
  uint8x16_t v99 = (uint8x16_t)vzip1q_s64(v90, (int64x2_t)v85);
  uint8x16_t v100 = (uint8x16_t)vzip1q_s64((int64x2_t)v86, (int64x2_t)v87);
  uint8x16_t v101 = *(uint8x16_t *)(v19 + 16);
  int32x4_t v102 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v19, v99))));
  int32x4_t v103 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v99, v101))));
  int32x4_t v104 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v101, v100))));
  int32x4_t v105 = vaddq_s32(v103, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v98, *(uint8x16_t *)v19)))));
  int32x4_t v106 = vaddq_s32(v104, v102);
  v102.i64[0] = *v96;
  v104.i64[0] = *v97;
  int32x4_t v107 = (uint64_t *)((char *)v96 + v11);
  uint8x16_t v108 = (uint64_t *)((char *)v97 + v11);
  v87.i64[0] = *v107;
  v79.i64[0] = *v108;
  uint8x16_t v109 = (uint64_t *)((char *)v107 + v11);
  int32x4_t v110 = (uint64_t *)((char *)v108 + v11);
  uint8x16_t v111 = (uint8x16_t)vzip1q_s64((int64x2_t)v102, (int64x2_t)v104);
  uint8x16_t v112 = (uint8x16_t)vzip1q_s64((int64x2_t)v87, (int64x2_t)v79);
  uint8x16_t v113 = *(uint8x16_t *)(v19 + 32);
  uint8x16_t v114 = *(uint8x16_t *)(v19 + 48);
  int32x4_t v115 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v100, v113))));
  int32x4_t v116 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v113, v111))));
  int32x4_t v117 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v111, v114))));
  int32x4_t v118 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v114, v112))));
  int32x4_t v119 = vaddq_s32(v105, v115);
  int32x4_t v120 = vaddq_s32(v106, v116);
  v115.i64[0] = *v109;
  v116.i64[0] = *v110;
  int32x4_t v121 = (uint64_t *)((char *)v109 + v11);
  int32x4_t v122 = (uint64_t *)((char *)v110 + v11);
  v80.i64[0] = *v121;
  v81.i64[0] = *v122;
  uint8x16_t v123 = (uint64_t *)((char *)v121 + v11);
  uint8x16_t v124 = (uint64_t *)((char *)v122 + v11);
  uint8x16_t v125 = (uint8x16_t)vzip1q_s64((int64x2_t)v115, (int64x2_t)v116);
  uint8x16_t v126 = (uint8x16_t)vzip1q_s64((int64x2_t)v80, (int64x2_t)v81);
  uint8x16_t v127 = *(uint8x16_t *)(v19 + 128);
  uint8x16_t v128 = *(uint8x16_t *)(v19 + 144);
  int32x4_t v129 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v112, v127))));
  int32x4_t v130 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v127, v125))));
  int32x4_t v131 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v125, v128))));
  int32x4_t v132 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v128, v126))));
  int32x4_t v133 = vaddq_s32(v117, v129);
  int32x4_t v134 = vaddq_s32(v118, v130);
  int32x4_t v135 = vaddq_s32(v119, v131);
  int32x4_t v136 = vaddq_s32(v120, v132);
  v131.i64[0] = *v123;
  v118.i64[0] = *v124;
  v130.i64[0] = *(uint64_t *)((char *)v123 + v11);
  v132.i64[0] = *(uint64_t *)((char *)v124 + v11);
  uint8x16_t v137 = (uint8x16_t)vzip1q_s64((int64x2_t)v131, (int64x2_t)v118);
  uint8x16_t v138 = (uint8x16_t)vzip1q_s64((int64x2_t)v130, (int64x2_t)v132);
  uint8x16_t v139 = *(uint8x16_t *)(v19 + 160);
  uint8x16_t v140 = *(uint8x16_t *)(v19 + 176);
  int32x4_t v141 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v126, v139))));
  int32x4_t v142 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v139, v137))));
  int32x4_t v143 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v140, v138))));
  int32x4_t v144 = vaddq_s32(vaddq_s32(v135, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v137, v140))))), vaddq_s32(v133, v141));
  int32x4_t v145 = vaddq_s32(vaddq_s32(v136, v143), vaddq_s32(v134, v142));
  int32x4_t v146 = vdupq_laneq_s32(v144, 2);
  int32x4_t v147 = vdupq_laneq_s32(v145, 2);
  int64x2_t v148 = (int64x2_t)vaddq_s32(v144, v146);
  int64x2_t v149 = (int64x2_t)vaddq_s32(v145, v147);
  *a3 = v148.i16[0];
  a3[1] = v149.i16[0];
  uint8x16_t v150 = *(uint64_t **)(a1 + 48);
  int32x4_t v151 = (uint64_t *)((char *)v150 + v12);
  v148.i64[0] = *v150;
  v149.i64[0] = *v151;
  int32x4_t v152 = (uint64_t *)((char *)v150 + v11);
  uint8x16_t v153 = (uint64_t *)((char *)v151 + v11);
  v146.i64[0] = *v152;
  v147.i64[0] = *v153;
  uint8x16_t v154 = (uint64_t *)((char *)v152 + v11);
  int32x4_t v155 = (uint64_t *)((char *)v153 + v11);
  uint8x16_t v156 = (uint8x16_t)vzip1q_s64(v148, v149);
  uint8x16_t v157 = (uint8x16_t)vzip1q_s64(v149, (int64x2_t)v146);
  uint8x16_t v158 = (uint8x16_t)vzip1q_s64((int64x2_t)v146, (int64x2_t)v147);
  uint8x16_t v159 = *(uint8x16_t *)(v19 + 16);
  int32x4_t v160 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)v19, v158))));
  v143.i64[0] = *v154;
  v142.i64[0] = *v155;
  int32x4_t v161 = (uint64_t *)((char *)v154 + v11);
  int32x4_t v162 = (uint64_t *)((char *)v155 + v11);
  uint8x16_t v163 = (uint8x16_t)vzip1q_s64((int64x2_t)v147, (int64x2_t)v143);
  uint8x16_t v164 = (uint8x16_t)vzip1q_s64((int64x2_t)v143, (int64x2_t)v142);
  int32x4_t v165 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v163, v159))));
  int32x4_t v166 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v158, v159)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v156, *(uint8x16_t *)v19)))));
  int32x4_t v167 = vaddq_s32(v165, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v157, *(uint8x16_t *)v19)))));
  int32x4_t v168 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v159, v164)))), v160);
  v165.i64[0] = *v161;
  v160.i64[0] = *v162;
  int32x4_t v169 = (uint64_t *)((char *)v161 + v11);
  int32x4_t v170 = (uint64_t *)((char *)v162 + v11);
  uint8x16_t v171 = (uint8x16_t)vzip1q_s64((int64x2_t)v142, (int64x2_t)v165);
  uint8x16_t v172 = (uint8x16_t)vzip1q_s64((int64x2_t)v165, (int64x2_t)v160);
  uint8x16_t v173 = *(uint8x16_t *)(v19 + 32);
  int64x2_t v174 = *(int64x2_t *)(v19 + 48);
  int32x4_t v175 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v164, v173))));
  int32x4_t v176 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v171, v173))));
  int32x4_t v177 = vaddq_s32(v166, v175);
  int32x4_t v178 = vaddq_s32(v167, v176);
  int32x4_t v179 = vaddq_s32(v168, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v173, v172)))));
  v176.i64[0] = *v169;
  v175.i64[0] = *v170;
  int32x4_t v180 = (uint64_t *)((char *)v169 + v11);
  int32x4_t v181 = (uint64_t *)((char *)v170 + v11);
  uint8x16_t v182 = (uint8x16_t)vzip1q_s64((int64x2_t)v160, (int64x2_t)v176);
  uint8x16_t v183 = (uint8x16_t)vzip1q_s64((int64x2_t)v176, (int64x2_t)v175);
  int32x4_t v184 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v172, (uint8x16_t)v174))));
  int32x4_t v185 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v182, (uint8x16_t)v174))));
  int32x4_t v186 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v174, v183))));
  v174.i64[0] = *v180;
  uint8x16_t v187 = *(uint8x16_t *)(v19 + 128);
  uint8x16_t v188 = *(uint8x16_t *)(v19 + 144);
  int32x4_t v189 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v183, v187))));
  int32x4_t v190 = vaddq_s32(v184, v189);
  v189.i64[0] = *v181;
  uint8x16_t v191 = (uint64_t *)((char *)v180 + v11);
  uint8x16_t v192 = (uint64_t *)((char *)v181 + v11);
  uint8x16_t v193 = (uint8x16_t)vzip1q_s64((int64x2_t)v175, v174);
  uint8x16_t v194 = (uint8x16_t)vzip1q_s64(v174, (int64x2_t)v189);
  int32x4_t v195 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v193, v187))));
  int32x4_t v196 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v187, v194))));
  int32x4_t v197 = vaddq_s32(v185, v195);
  int32x4_t v198 = vaddq_s32(v186, v196);
  v186.i64[0] = *v191;
  v196.i64[0] = *v192;
  int32x4_t v199 = (uint64_t *)((char *)v191 + v11);
  int32x4_t v200 = (uint64_t *)((char *)v192 + v11);
  uint8x16_t v201 = (uint8x16_t)vzip1q_s64((int64x2_t)v189, (int64x2_t)v186);
  uint8x16_t v202 = (uint8x16_t)vzip1q_s64((int64x2_t)v186, (int64x2_t)v196);
  int32x4_t v203 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v201, v188))));
  int32x4_t v204 = vaddq_s32(v177, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v194, v188)))));
  int32x4_t v205 = vaddq_s32(v178, v203);
  int32x4_t v206 = vaddq_s32(v179, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v188, v202)))));
  v203.i64[0] = *v199;
  uint8x16_t v207 = *(uint8x16_t *)(v19 + 160);
  uint8x16_t v208 = *(uint8x16_t *)(v19 + 176);
  int32x4_t v209 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v202, v207))));
  int32x4_t v210 = vaddq_s32(v190, v209);
  v209.i64[0] = *v200;
  uint8x16_t v211 = (uint8x16_t)vzip1q_s64((int64x2_t)v196, (int64x2_t)v203);
  uint8x16_t v212 = (uint8x16_t)vzip1q_s64((int64x2_t)v203, (int64x2_t)v209);
  int32x4_t v213 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v211, v207))));
  int32x4_t v214 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v207, v212))));
  int32x4_t v215 = vaddq_s32(v197, v213);
  int32x4_t v216 = vaddq_s32(v198, v214);
  v214.i64[0] = *(uint64_t *)((char *)v199 + v11);
  v213.i64[0] = *(uint64_t *)((char *)v200 + v11);
  int32x4_t v217 = vaddq_s32(vaddq_s32(v204, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v212, v208))))), v210);
  int32x4_t v218 = vaddq_s32(vaddq_s32(v205, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64((int64x2_t)v209, (int64x2_t)v214), v208))))), v215);
  int32x4_t v219 = vaddq_s32(vaddq_s32(v206, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v208, (uint8x16_t)vzip1q_s64((int64x2_t)v214, (int64x2_t)v213)))))), v216);
  a3[6] = vaddq_s32(v217, vdupq_laneq_s32(v217, 2)).u16[0];
  *(void *)&double result = vaddq_s32(v219, vdupq_laneq_s32(v219, 2)).u64[0];
  a3[3] = vaddq_s32(v218, vdupq_laneq_s32(v218, 2)).u16[0];
  a3[7] = LOWORD(result);
  return result;
}

double sub_221A2E94C(uint64_t a1, uint64_t a2, _WORD *a3, int64x2_t a4, int64x2_t a5, int64x2_t a6, int64x2_t a7, double a8, double a9, int64x2_t a10, int64x2_t a11)
{
  uint64_t v12 = *(unsigned int *)(a2 + 16);
  uint64_t v11 = *(unsigned int *)(a2 + 20);
  uint8x16_t v13 = *(uint8x16_t **)(a2 + 64);
  uint8x16_t v14 = *(unint64_t **)(a1 + 32);
  uint64_t v15 = (char *)v14 + v12;
  a4.i64[0] = *v14;
  a5.i64[0] = *(unint64_t *)((char *)v14 + v12);
  uint8x16_t v16 = (unint64_t *)((char *)v14 + v11);
  int32x4_t v17 = (unint64_t *)&v15[v11];
  a6.i64[0] = *v16;
  a7.i64[0] = *v17;
  uint8x16_t v18 = (unint64_t *)((char *)v16 + v11);
  uint64_t v19 = (unint64_t *)((char *)v17 + v11);
  uint8x16_t v20 = (uint8x16_t)vzip1q_s64(a4, a5);
  uint8x16_t v21 = (uint8x16_t)vzip1q_s64(a5, a6);
  uint8x16_t v22 = (uint8x16_t)vzip1q_s64(a6, a7);
  uint8x16_t v23 = v13[1];
  int32x4_t v24 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v13, v22))));
  a10.i64[0] = *v18;
  a11.i64[0] = *v19;
  uint8x16_t v25 = (uint64_t *)((char *)v18 + v11);
  uint8x16_t v26 = (uint64_t *)((char *)v19 + v11);
  uint8x16_t v27 = (uint8x16_t)vzip1q_s64(a7, a10);
  uint8x16_t v28 = (uint8x16_t)vzip1q_s64(a10, a11);
  int32x4_t v29 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v27, v23))));
  int32x4_t v30 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v22, v23)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v20, *v13)))));
  int32x4_t v31 = vaddq_s32(v29, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, *v13)))));
  int32x4_t v32 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v23, v28)))), v24);
  v29.i64[0] = *v25;
  v24.i64[0] = *v26;
  uint8x16_t v33 = (uint8x16_t)vzip1q_s64(a11, (int64x2_t)v29);
  uint8x16_t v34 = (uint8x16_t)vzip1q_s64((int64x2_t)v29, (int64x2_t)v24);
  uint8x16_t v35 = v13[2];
  uint8x16_t v36 = v13[3];
  int32x4_t v37 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v28, v35))));
  int32x4_t v38 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v33, v35))));
  int32x4_t v39 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v35, v34))));
  int32x4_t v40 = vaddq_s32(v30, v37);
  v37.i64[0] = *(uint64_t *)((char *)v25 + v11);
  int32x4_t v41 = vaddq_s32(v31, v38);
  v38.i64[0] = *(uint64_t *)((char *)v26 + v11);
  int32x4_t v42 = vaddq_s32(v40, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v34, v36)))));
  int32x4_t v43 = vaddq_s32(v41, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64((int64x2_t)v24, (int64x2_t)v37), v36)))));
  int32x4_t v44 = vaddq_s32(v39, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v36, (uint8x16_t)vzip1q_s64((int64x2_t)v37, (int64x2_t)v38))))));
  int32x4_t v45 = vdupq_laneq_s32(v42, 2);
  int32x4_t v46 = vdupq_laneq_s32(v43, 2);
  int32x4_t v47 = vaddq_s32(v32, v44);
  int32x4_t v48 = vdupq_laneq_s32(v47, 2);
  int64x2_t v49 = (int64x2_t)vaddq_s32(v42, v45);
  int64x2_t v50 = (int64x2_t)vaddq_s32(v43, v46);
  int64x2_t v51 = (int64x2_t)vaddq_s32(v47, v48);
  a3[4] = v49.i16[0];
  a3[2] = v50.i16[0];
  a3[5] = v51.i16[0];
  int32x4_t v52 = (uint64_t *)(*(void *)a1 + v12);
  v49.i64[0] = **(void **)a1;
  v50.i64[0] = *v52;
  int32x4_t v53 = (uint64_t *)(*(void *)a1 + v11);
  uint8x16_t v54 = (uint64_t *)((char *)v52 + v11);
  v51.i64[0] = *v53;
  v48.i64[0] = *v54;
  int32x4_t v55 = (uint64_t *)((char *)v53 + v11);
  uint8x16_t v56 = (uint64_t *)((char *)v54 + v11);
  v45.i64[0] = *v55;
  v46.i64[0] = *v56;
  uint8x16_t v57 = (uint64_t *)((char *)v55 + v11);
  int32x4_t v58 = (uint64_t *)((char *)v56 + v11);
  uint8x16_t v59 = (uint8x16_t)vzip1q_s64(v49, v50);
  uint8x16_t v60 = (uint8x16_t)vzip1q_s64(v51, (int64x2_t)v48);
  uint8x16_t v61 = (uint8x16_t)vzip1q_s64((int64x2_t)v45, (int64x2_t)v46);
  uint8x16_t v62 = v13[1];
  int32x4_t v63 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v13, v60))));
  int32x4_t v64 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v60, v62))));
  int32x4_t v65 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v62, v61))));
  int32x4_t v66 = vaddq_s32(v64, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v59, *v13)))));
  int32x4_t v67 = vaddq_s32(v65, v63);
  v63.i64[0] = *v57;
  v65.i64[0] = *v58;
  v46.i64[0] = *(uint64_t *)((char *)v57 + v11);
  v37.i64[0] = *(uint64_t *)((char *)v58 + v11);
  uint8x16_t v68 = (uint8x16_t)vzip1q_s64((int64x2_t)v63, (int64x2_t)v65);
  uint8x16_t v69 = (uint8x16_t)vzip1q_s64((int64x2_t)v46, (int64x2_t)v37);
  uint8x16_t v70 = v13[2];
  int64x2_t v71 = (int64x2_t)v13[3];
  int32x4_t v72 = vaddq_s32(vaddq_s32(v66, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v61, v70))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v68, (uint8x16_t)v71)))));
  int32x4_t v73 = vaddq_s32(v67, vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v70, v68)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)v71, v69))))));
  int32x4_t v74 = vdupq_laneq_s32(v72, 2);
  int32x4_t v75 = vdupq_laneq_s32(v73, 2);
  int64x2_t v76 = (int64x2_t)vaddq_s32(v72, v74);
  int64x2_t v77 = (int64x2_t)vaddq_s32(v73, v75);
  *a3 = v76.i16[0];
  a3[1] = v77.i16[0];
  int32x4_t v78 = *(uint64_t **)(a1 + 48);
  int32x4_t v79 = (uint64_t *)((char *)v78 + v12);
  v76.i64[0] = *v78;
  v77.i64[0] = *v79;
  int32x4_t v80 = (uint64_t *)((char *)v78 + v11);
  int32x4_t v81 = (uint64_t *)((char *)v79 + v11);
  v74.i64[0] = *v80;
  v75.i64[0] = *v81;
  int32x4_t v82 = (uint64_t *)((char *)v80 + v11);
  int32x4_t v83 = (uint64_t *)((char *)v81 + v11);
  uint8x16_t v84 = (uint8x16_t)vzip1q_s64(v76, v77);
  uint8x16_t v85 = (uint8x16_t)vzip1q_s64(v77, (int64x2_t)v74);
  uint8x16_t v86 = (uint8x16_t)vzip1q_s64((int64x2_t)v74, (int64x2_t)v75);
  uint8x16_t v87 = v13[1];
  int32x4_t v88 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v13, v86))));
  v71.i64[0] = *v82;
  v39.i64[0] = *v83;
  int64x2_t v89 = (uint64_t *)((char *)v82 + v11);
  int64x2_t v90 = (uint64_t *)((char *)v83 + v11);
  uint8x16_t v91 = (uint8x16_t)vzip1q_s64((int64x2_t)v75, v71);
  uint8x16_t v92 = (uint8x16_t)vzip1q_s64(v71, (int64x2_t)v39);
  int32x4_t v93 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v91, v87))));
  int32x4_t v94 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v86, v87)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v84, *v13)))));
  int32x4_t v95 = vaddq_s32(v93, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v85, *v13)))));
  int32x4_t v96 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v87, v92)))), v88);
  v93.i64[0] = *v89;
  v88.i64[0] = *v90;
  uint8x16_t v97 = (uint8x16_t)vzip1q_s64((int64x2_t)v39, (int64x2_t)v93);
  uint8x16_t v98 = (uint8x16_t)vzip1q_s64((int64x2_t)v93, (int64x2_t)v88);
  uint8x16_t v99 = v13[2];
  uint8x16_t v100 = v13[3];
  int32x4_t v101 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v92, v99))));
  int32x4_t v102 = (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v97, v99))));
  int32x4_t v103 = vaddq_s32(v94, v101);
  int32x4_t v104 = vaddq_s32(v95, v102);
  v102.i64[0] = *(uint64_t *)((char *)v89 + v11);
  v101.i64[0] = *(uint64_t *)((char *)v90 + v11);
  int32x4_t v105 = vaddq_s32(v103, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v98, v100)))));
  int32x4_t v106 = vaddq_s32(v104, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8((uint8x16_t)vzip1q_s64((int64x2_t)v88, (int64x2_t)v102), v100)))));
  int32x4_t v107 = vaddq_s32(v96, vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v99, v98)))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v100, (uint8x16_t)vzip1q_s64((int64x2_t)v102, (int64x2_t)v101)))))));
  a3[6] = vaddq_s32(v105, vdupq_laneq_s32(v105, 2)).u16[0];
  *(void *)&double result = vaddq_s32(v107, vdupq_laneq_s32(v107, 2)).u64[0];
  a3[3] = vaddq_s32(v106, vdupq_laneq_s32(v106, 2)).u16[0];
  a3[7] = LOWORD(result);
  return result;
}

double sub_221A2ED64(int *a1, uint64_t a2)
{
  v2 = (uint8x16_t *)*((void *)a1 + 7);
  uint64_t v3 = a1[4];
  uint64_t v4 = (uint8x16_t *)(*((void *)a1 + 3) + *a1 + (v3 * a1[1]));
  uint64_t v5 = (uint8x16_t *)((char *)v4 + (8 * v3));
  uint8x16_t v6 = *v4;
  uint8x16_t v7 = *v5;
  uint64_t v8 = (uint8x16_t *)((char *)v4 + v3);
  uint8x16_t v9 = (uint8x16_t *)((char *)v5 + v3);
  uint8x16_t v10 = *v8;
  uint8x16_t v11 = *v9;
  uint64_t v12 = (uint8x16_t *)((char *)v8 + v3);
  uint8x16_t v13 = (uint8x16_t *)((char *)v9 + v3);
  int32x4_t v14 = vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v10, v2[1])))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v6, *v2)))));
  uint8x16_t v15 = *v12;
  uint8x16_t v16 = *v13;
  int32x4_t v17 = (uint8x16_t *)((char *)v12 + v3);
  uint8x16_t v18 = (uint8x16_t *)((char *)v13 + v3);
  int32x4_t v19 = vaddq_s32(v14, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v15, v2[2])))));
  int32x4_t v20 = vaddq_s32(vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v11, v2[9])))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v7, v2[8]))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v16, v2[10])))));
  uint8x16_t v21 = *v17;
  uint8x16_t v22 = *v18;
  uint8x16_t v23 = (uint8x16_t *)((char *)v17 + v3);
  int32x4_t v24 = (uint8x16_t *)((char *)v18 + v3);
  uint8x16_t v25 = *v23;
  uint8x16_t v26 = *v24;
  uint8x16_t v27 = (uint8x16_t *)((char *)v23 + v3);
  uint8x16_t v28 = (uint8x16_t *)((char *)v24 + v3);
  v31.val[0] = (int8x16_t)vaddq_s32(vaddq_s32(vaddq_s32(v19, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v27, v2[5]))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v27 + v3 + v3), v2[7]))))), vaddq_s32(vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v21, v2[3])))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v25, v2[4]))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v27 + v3), v2[6]))))));
  v31.val[1] = (int8x16_t)vaddq_s32(vaddq_s32(vaddq_s32(v20, (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*v28, v2[13]))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v28 + v3 + v3), v2[15]))))), vaddq_s32(vaddq_s32((int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v22, v2[11])))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(v26, v2[12]))))), (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8(vabdq_u8(*(uint8x16_t *)((char *)v28 + v3), v2[14]))))));
  *(void *)(a2 + 24) = vqtbl2q_s8(v31, (int8x16_t)xmmword_221A34C40).u64[0];
  int32x4_t v29 = vaddq_s32((int32x4_t)v31.val[1], (int32x4_t)v31.val[0]);
  *(_WORD *)(a2 + 16) = v29.i16[0];
  *(_WORD *)(a2 + 18) = v29.i16[4];
  *(_WORD *)a2 = vaddq_s32(v29, vdupq_laneq_s32(v29, 2)).u16[0];
  *(void *)&double result = vaddq_s32((int32x4_t)v31.val[0], vdupq_laneq_s32((int32x4_t)v31.val[0], 2)).u64[0];
  *(_WORD *)(a2 + 8) = LOWORD(result);
  *(_WORD *)(a2 + 10) = vaddq_s32((int32x4_t)v31.val[1], vdupq_laneq_s32((int32x4_t)v31.val[1], 2)).u16[0];
  return result;
}

int8x16_t *sub_221A2EF9C(int8x16_t *result, int a2, int16x8_t *a3, int a4)
{
  if (a4 >= 1)
  {
    for (int i = 0; i < a4; i += 2)
    {
      int8x16_t v5 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(a3[2], (int16x8_t)vzip1q_s8(*(int8x16_t *)((char *)result + a2), (int8x16_t)0))), vaddq_s16(a3[3], (int16x8_t)vzip2q_s8(*(int8x16_t *)((char *)result + a2), (int8x16_t)0)));
      *double result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(*a3, (int16x8_t)vzip1q_s8(*result, (int8x16_t)0))), vaddq_s16(a3[1], (int16x8_t)vzip2q_s8(*result, (int8x16_t)0)));
      *(int8x16_t *)((char *)result + a2) = v5;
      double result = (int8x16_t *)((char *)result + 2 * a2);
      a3 += 4;
    }
  }
  return result;
}

int8x16_t *sub_221A2F014(int8x16_t *result, int a2, uint64_t a3, int16x8_t *a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint8x16_t v6 = (int8x16_t *)(a3 + 16 * v5);
      int8x16_t v7 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(a4[2], (int16x8_t)vzip1q_s8(v6[1], (int8x16_t)0))), vaddq_s16(a4[3], (int16x8_t)vzip2q_s8(v6[1], (int8x16_t)0)));
      *double result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(*a4, (int16x8_t)vzip1q_s8(*v6, (int8x16_t)0))), vaddq_s16(a4[1], (int16x8_t)vzip2q_s8(*v6, (int8x16_t)0)));
      *(int8x16_t *)((char *)result + a2) = v7;
      double result = (int8x16_t *)((char *)result + 2 * a2);
      v5 += 2;
      a4 += 4;
    }
    while ((int)v5 < a5);
  }
  return result;
}

int8x16_t *sub_221A2F08C(int8x16_t *result, unsigned int a2, int8x16_t *a3, unsigned int a4, int16x8_t *a5, int a6)
{
  if (a6 >= 1)
  {
    for (int i = 0; i < a6; i += 2)
    {
      int8x16_t v7 = *(int8x16_t *)((char *)result + a2);
      int8x16_t v8 = *(int8x16_t *)((char *)a3 + a4);
      int16x8_t v9 = vsubq_s16((int16x8_t)vzip2q_s8(*result, (int8x16_t)0), (int16x8_t)vzip2q_s8(*a3, (int8x16_t)0));
      *a5 = vsubq_s16((int16x8_t)vzip1q_s8(*result, (int8x16_t)0), (int16x8_t)vzip1q_s8(*a3, (int8x16_t)0));
      a5[1] = v9;
      a5[2] = vsubq_s16((int16x8_t)vzip1q_s8(v7, (int8x16_t)0), (int16x8_t)vzip1q_s8(v8, (int8x16_t)0));
      a5[3] = vsubq_s16((int16x8_t)vzip2q_s8(v7, (int8x16_t)0), (int16x8_t)vzip2q_s8(v8, (int8x16_t)0));
      double result = (int8x16_t *)((char *)result + 2 * a2);
      a3 = (int8x16_t *)((char *)a3 + 2 * a4);
      a5 += 4;
    }
  }
  return result;
}

unint64_t *sub_221A2F110(unint64_t *result, unsigned int a2, unint64_t *a3, unsigned int a4, uint64_t a5, int a6, double a7, int8x16_t a8, int8x16_t a9, int8x16_t a10, int8x16_t a11)
{
  if (a6 >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = (__n128 *)(a5 + 16 * v11);
      a8.i64[0] = *result;
      a9.i64[0] = *a3;
      a10.i64[0] = *(unint64_t *)((char *)result + a2);
      a11.i64[0] = *(unint64_t *)((char *)a3 + a4);
      a10 = vzip1q_s8(a10, (int8x16_t)0);
      a11 = vzip1q_s8(a11, (int8x16_t)0);
      a8 = (int8x16_t)vsubq_s16((int16x8_t)vzip1q_s8(a8, (int8x16_t)0), (int16x8_t)vzip1q_s8(a9, (int8x16_t)0));
      a9 = (int8x16_t)vsubq_s16((int16x8_t)a10, (int16x8_t)a11);
      __n128 *v12 = (__n128)a8;
      v12[1] = (__n128)a9;
      double result = (unint64_t *)((char *)result + 2 * a2);
      a3 = (unint64_t *)((char *)a3 + 2 * a4);
      v11 += 2;
    }
    while ((int)v11 < a6);
  }
  return result;
}

uint64_t sub_221A2F178(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    for (uint64_t j = 0; j != 8; ++j)
    {
      int v6 = *(__int16 *)(a4 + 2 * j) + *(unsigned __int8 *)(a3 + j);
      if (v6 >= 255) {
        int v6 = 255;
      }
      *(unsigned char *)(result + j) = v6 & ~(v6 >> 31);
    }
    result += a2;
    a4 += 16;
    a3 += 8;
  }
  return result;
}

uint64_t sub_221A2F1CC(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t result = 4294958327;
  if (!((a3 | a2) >> 16) && !((a3 * (unint64_t)a2) >> 31))
  {
    size_t v5 = a3 * a2;
    *(_DWORD *)(a1 + 8) = a3;
    *(_DWORD *)(a1 + 12) = a2;
    *(_DWORD *)(a1 + 20) = v5;
    *(_DWORD *)(a1 + 24) = v5;
    *(_DWORD *)(a1 + 16) = 4 * a2;
    *(void *)a1 = sub_221A12A5C((void *)(8 * (16 * v5)));
    *(void *)(a1 + 32) = sub_221A12A34(4 * v5);
    *(void *)(a1 + 152) = sub_221A12AA0(16 * (v5 + 2 * v5));
    *(void *)(a1 + 112) = sub_221A12A34(v5);
    *(void *)(a1 + 120) = sub_221A12A34(v5);
    *(void *)(a1 + 128) = sub_221A12A34(v5);
    *(void *)(a1 + 136) = sub_221A12A48(v5);
    *(void *)(a1 + 72) = sub_221A12A34(2 * v5);
    int v6 = sub_221A12A48(v5);
    *(void *)(a1 + 144) = v6;
    if (v6
      && *(void *)a1
      && (int8x16_t v7 = *(void **)(a1 + 32)) != 0
      && *(void *)(a1 + 152)
      && *(void *)(a1 + 112)
      && *(void *)(a1 + 120)
      && *(void *)(a1 + 128)
      && *(void *)(a1 + 136)
      && *(void *)(a1 + 72))
    {
      bzero(v7, 4 * *(unsigned int *)(a1 + 20));
      *(_DWORD *)(a1 + 56) = 64;
      *(void *)(a1 + 48) = sub_221A12A5C((void *)0x300);
      int8x16_t v8 = sub_221A34144();
      *(void *)(a1 + 64) = v8;
      uint64_t result = 4294967188;
      if (*(void *)(a1 + 48))
      {
        if (v8)
        {
          *(void *)(a1 + 160) = sub_221A34144();
          operator new[]();
        }
      }
    }
    else
    {
      return 4294967188;
    }
  }
  return result;
}

void sub_221A2F34C(uint64_t a1)
{
}

uint64_t sub_221A2F35C(uint64_t a1)
{
  uint64_t result = sub_221A2F394(*(void *)(a1 + 8), *(_DWORD **)(a1 + 16), *(void *)(a1 + 24), 0, 0);
  *(_DWORD *)a1 = result;
  return result;
}

uint64_t sub_221A2F394(uint64_t a1, _DWORD *a2, uint64_t a3, int a4, int a5)
{
  int v45 = 0;
  *(void *)(a1 + 80) = a2;
  int v8 = a2[25] >> 4;
  *(_DWORD *)(a1 + 8) = v8;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 12) * v8;
  int v9 = **(unsigned __int8 **)(a1 + 144);
  if (a4 == 1 && !a5)
  {
    uint64_t v10 = 0;
    *(_DWORD *)(a1 + 20) = 0;
    return v10;
  }
  BOOL v12 = (a4 & 0xFFFFFFFD) == 1 && a5 != 0;
  BOOL v43 = v12;
  uint64_t v13 = *(void *)(a1 + 168);
  sub_221A341D0(*(pthread_mutex_t **)(a1 + 160));
  char v14 = **(unsigned char **)(a1 + 144) != 0;
  unsigned int v15 = *(_DWORD *)(a1 + 8) >> v14;
  BOOL v16 = v15 == 0;
  if (!v15)
  {
    uint64_t v10 = 0;
LABEL_73:
    sub_221A341DC(*(pthread_mutex_t **)(a1 + 160));
    return v10;
  }
  uint64_t v42 = a3;
  uint64_t v10 = 0;
  char v17 = 0;
  while (2)
  {
    unsigned int v18 = 0;
    int v19 = *(_DWORD *)(a1 + 12);
    while (1)
    {
      uint64_t v20 = (v18 * v19) << v14;
      unsigned int v21 = (v18 * v19 + v19) << v14;
      unsigned int v22 = v20;
      if (v21 > v20)
      {
        uint8x16_t v23 = (unsigned __int8 *)(v13 + v20);
        unsigned int v22 = (v18 * v19) << v14;
        while (1)
        {
          int v24 = *v23++;
          if (v24 != 20) {
            break;
          }
          if (v21 == ++v22) {
            goto LABEL_34;
          }
        }
      }
      if (v22 == v21) {
        break;
      }
      if (*(unsigned char *)(v13 + v22) != 30) {
        unsigned int v18 = v15;
      }
      if (++v18 >= v15)
      {
        if (v16) {
          goto LABEL_73;
        }
        unsigned int v25 = 0;
        while (1)
        {
          uint64_t v26 = (v25 * v19) << v14;
          unsigned int v27 = (v25 * v19 + v19) << v14;
          unsigned int v28 = v26;
          if (v27 > v26)
          {
            int32x4_t v29 = (unsigned __int8 *)(v13 + v26);
            unsigned int v28 = (v25 * v19) << v14;
            while (1)
            {
              int v30 = *v29++;
              if (v30 != 10) {
                break;
              }
              if (v27 == ++v28) {
                goto LABEL_64;
              }
            }
          }
          if (v28 == v27) {
            break;
          }
          if (*(unsigned __int8 *)(v13 + v28) < 0xAu) {
            unsigned int v25 = v15;
          }
          if (++v25 >= v15) {
            goto LABEL_73;
          }
        }
LABEL_64:
        memset((void *)(v13 + v26), 11, v27 - v26);
        sub_221A341DC(*(pthread_mutex_t **)(a1 + 160));
        unsigned int v40 = *(_DWORD *)(a1 + 12);
        if (!(v26 % v40) && !(v27 % v40))
        {
          if (v9)
          {
            sub_221A2F7E8((uint64_t *)a1, v42, v26 / v40, v27 / v40, *(double *)v37.i64, *(int8x8_t *)v38.i8);
            uint64_t v10 = 0;
          }
          else
          {
            sub_2219E5A18((uint64_t *)a1, v42, 0, v40, v26 / v40, v27 / v40, v37, v38, v39);
          }
          sub_221A341D0(*(pthread_mutex_t **)(a1 + 160));
          if (v27 > v26)
          {
            uint8x16_t v34 = (void *)(*(void *)(a1 + 168) + v26);
            size_t v35 = v27 + ~v26 + 1;
            int v36 = 20;
LABEL_61:
            memset(v34, v36, v35);
          }
          goto LABEL_62;
        }
        return 4294958327;
      }
    }
LABEL_34:
    memset((void *)(v13 + v20), 21, v21 - v20);
    sub_221A341DC(*(pthread_mutex_t **)(a1 + 160));
    unsigned int v31 = *(_DWORD *)(a1 + 12);
    if (v20 % v31 || v21 % v31) {
      return 4294958327;
    }
    if (!*(unsigned char *)(a1 + 224))
    {
      if (*(int *)(a1 + 184) >= 1 && !v9)
      {
LABEL_46:
        uint64_t v33 = sub_2219E21C8(a1, 0, *(_DWORD *)(a1 + 12), v20 / v31, v21 / v31);
        goto LABEL_47;
      }
LABEL_53:
      if (v9)
      {
        *(_DWORD *)(a1 + 184) = 0;
        sub_221A30EF0(a1, a2[34], v20, v21);
        if (!v43) {
          sub_221A310B0(a1, a2[34], v20, v21);
        }
      }
      else
      {
        uint64_t v33 = sub_2219E025C(a1, 0, *(_DWORD *)(a1 + 12), v20 / v31, v21 / v31);
        if (v33) {
          return v33;
        }
        if (!v43)
        {
          uint64_t v33 = sub_2219E1598(a1, 0, v31, v20 / v31, v21 / v31);
LABEL_47:
          uint64_t v10 = 0;
          if (!v33) {
            goto LABEL_59;
          }
          return v33;
        }
      }
      uint64_t v10 = 0;
      goto LABEL_59;
    }
    int v32 = *(_DWORD *)(a1 + 184);
    if (!*(unsigned char *)(a1 + 225))
    {
      if (v32 >= 1 && !v9)
      {
        if (*(unsigned char *)(a1 + 226))
        {
          int v44 = 0;
          uint64_t v10 = sub_2219E2D58(a1, 0, v31, v20 / v31, v21 / v31, 0, &v44);
          goto LABEL_59;
        }
        goto LABEL_46;
      }
      goto LABEL_53;
    }
    if (v32 < 1)
    {
LABEL_59:
      sub_221A341D0(*(pthread_mutex_t **)(a1 + 160));
      if (v21 > v20)
      {
        uint8x16_t v34 = (void *)(*(void *)(a1 + 168) + v20);
        size_t v35 = v21 + ~v20 + 1;
        int v36 = 30;
        goto LABEL_61;
      }
LABEL_62:
      sub_221A341DC(*(pthread_mutex_t **)(a1 + 160));
      uint64_t v13 = *(void *)(a1 + 168);
      sub_221A341D0(*(pthread_mutex_t **)(a1 + 160));
      char v14 = **(unsigned char **)(a1 + 144) != 0;
      unsigned int v15 = *(_DWORD *)(a1 + 8) >> v14;
      BOOL v16 = v15 == 0;
      if (v15) {
        continue;
      }
      goto LABEL_73;
    }
    break;
  }
  if (!v20 && !*(void *)(a1 + 232)) {
    *(void *)(a1 + 232) = sub_221A12A5C((void *)(20 * a2[34] + 11 * a2[38]));
  }
  uint64_t v10 = sub_2219E2D58(a1, 0, v31, v20 / v31, v21 / v31, v17 & 1, &v45);
  if (!v10)
  {
    char v17 = 1;
    goto LABEL_59;
  }
  return v10;
}

uint64_t sub_221A2F7E8(uint64_t *a1, uint64_t a2, unsigned int a3, unsigned int a4, double a5, int8x8_t a6)
{
  int v261 = *((unsigned __int8 *)a1 + 225);
  unsigned int v279 = a3;
  if (a3 < a4)
  {
    int32x4_t v257 = (char *)&unk_221A3C5C8 + dword_267F69F78;
    int v6 = *((_DWORD *)a1 + 3);
    int v356 = 4 * v6;
    int v263 = 2 * v6;
    uint64_t v267 = a1[6];
    uint64_t v7 = *a1;
    int v8 = (int *)(a1[19] + 48 * v6 * v279);
    uint64_t v9 = a1[9];
    uint64_t v277 = a1[4];
    int v260 = 20 * v6;
    unint64_t v10 = a2 + 32;
    uint64_t v11 = *(void *)(a2 + 104);
    unint64_t v12 = a2 + 64;
    int v340 = 4 * v279;
    int32x2_t v13 = (int32x2_t)0xCC3300CC00CC00;
    v275 = a1;
    int v274 = v6;
    uint64_t v347 = *a1;
    unint64_t v272 = a2 + 32;
    uint64_t v273 = v9;
    unint64_t v270 = a2 + 64;
    uint64_t v271 = v11;
    while (!v6)
    {
LABEL_511:
      v340 += 4;
      if (++v279 == a4) {
        return 0;
      }
    }
    int v281 = 0;
    uint64_t v286 = (int)((v263 * (v279 >> 1)) | v279 & 1);
    int v266 = v279 * v6;
    unsigned int v262 = (v279 & 0xFFFFFFFE) * v6;
    int v299 = 4 * v279;
    int v14 = 0;
    unsigned __int8 v15 = 32;
    while (1)
    {
      uint64_t v16 = (v14 + v266);
      uint64_t v17 = (int)v16;
      int v18 = v14 ? v16 - 1 : v266;
      int v19 = v14;
      uint64_t v20 = a1[18];
      int v291 = v16;
      int v21 = *(unsigned __int8 *)(v20 + (int)v16);
      BOOL v292 = v21 == 2;
      int v285 = v19;
      if (v19 && v21 == 1)
      {
        BOOL v293 = 0;
        BOOL v296 = *(unsigned __int8 *)(v20 + v18) == 2;
      }
      else
      {
        BOOL v296 = 0;
        if (v19)
        {
          BOOL v293 = 0;
          if (v21 == 2)
          {
            BOOL v296 = 0;
            BOOL v293 = *(unsigned __int8 *)(v20 + (int)v16 - 1) == 1;
          }
        }
        else
        {
          BOOL v293 = 0;
        }
      }
      if (v279 > 1)
      {
        if (v279)
        {
          int v22 = v286;
          int v37 = v286 - 1;
          if (v21 == 2) {
            int v37 = v286 - v263;
          }
          int v328 = v37;
          if (v21 == 2) {
            uint64_t v24 = (v16 - v263);
          }
          else {
            uint64_t v24 = (v16 - v6);
          }
          int v38 = v356;
          if (v21 == 2) {
            int v38 = v260;
          }
          int v295 = v38;
          BOOL v36 = 0;
        }
        else
        {
          unsigned int v25 = v16 - v263;
          int v26 = *(unsigned __int8 *)(v20 + (v16 - v263));
          int v22 = v286;
          int v27 = v286 - v263;
          if (v26 == 2) {
            int v28 = v286 - v263;
          }
          else {
            int v28 = v27 + 1;
          }
          if (v26 == 2) {
            unsigned int v29 = v25;
          }
          else {
            unsigned int v29 = v291 - v6;
          }
          if (v26 == 2) {
            int v30 = v260;
          }
          else {
            int v30 = v356;
          }
          BOOL v31 = v26 == 2;
          BOOL v32 = v26 == 2;
          if (v26 == 2) {
            int v33 = v286 - v263;
          }
          else {
            int v33 = v27 + 1;
          }
          if (v32)
          {
            int v34 = v260;
          }
          else
          {
            unsigned int v25 = v291 - v6;
            int v34 = v356;
          }
          if (v21 != 2) {
            int v33 = v28;
          }
          int v328 = v33;
          uint64_t v24 = v21 == 2 ? v25 : v29;
          int v35 = v21 == 2 ? v34 : v30;
          int v295 = v35;
          BOOL v36 = v21 != 2 && v31;
        }
        BOOL v327 = v36;
      }
      else
      {
        if (v279)
        {
          int v22 = v286;
          int v23 = v286 - 1;
          if (v21 == 2) {
            int v23 = v286;
          }
          int v328 = v23;
          uint64_t v24 = v21 == 2 ? v16 : (v16 - v6);
          BOOL v327 = 0;
        }
        else
        {
          BOOL v327 = 0;
          int v22 = v286;
          int v328 = v286;
          uint64_t v24 = v16;
        }
        int v295 = v356;
      }
      uint64_t v333 = v24;
      BOOL v278 = v21 != *(unsigned __int8 *)(v20 + (int)v24);
      int v39 = v21 == 2 ? 1 : 3;
      unsigned int v350 = v39;
      int v40 = v285 ? v22 - 2 : v22;
      unsigned int v337 = v296 || v293;
      if (v296 || v293)
      {
        unsigned int v41 = v22 & 0xFFFFFFFE;
        if (v285) {
          unsigned int v41 = (v22 & 0xFFFFFFFE) - 2;
        }
        unsigned int v315 = v41;
        int v18 = v285 ? v262 - 1 + v285 : v262;
        unsigned int v42 = v279 & 0xFFFFFFFE;
      }
      else
      {
        unsigned int v315 = v40;
        unsigned int v42 = v279;
      }
      unsigned int v314 = v42;
      int v43 = *(unsigned __int8 *)(a1[17] + v17);
      v8[4] = 33686018;
      int v44 = v43 ? 0 : 33686018;
      int *v8 = 33686018;
      v8[1] = v44;
      v8[2] = 33686018;
      v8[3] = v44;
      v8[5] = v44;
      v8[6] = 33686018;
      v8[7] = v44;
      if (*(unsigned char *)(v267 + 12 * *(unsigned __int16 *)(v9 + 2 * v17) + 9) != 1) {
        break;
      }
      *(unsigned char *)int v8 = 0x80;
LABEL_102:
      v8 += 12;
      v286 += 2;
      int v14 = v285 + 1;
      v281 += 4;
      unsigned __int8 v15 = 4;
      if (v285 + 1 == v6) {
        goto LABEL_511;
      }
    }
    int v282 = *(unsigned __int8 *)(v267 + 12 * *(unsigned __int16 *)(v9 + 2 * v17) + 9);
    int v287 = *(unsigned __int16 *)(v9 + 2 * v17);
    v308 = v8 + 4;
    unint64_t v45 = *(void *)(v11 + 8 * v286);
    int v46 = *(unsigned __int16 *)(v9 + 2 * v18);
    int v280 = *(unsigned __int16 *)(v9 + 2 * (int)v24);
    BOOL v48 = v10 <= v45 && v45 <= v12;
    if (v261 | v48)
    {
      if (*(unsigned char *)(a1[17] + v17)) {
        int v49 = 0;
      }
      else {
        int v49 = 50529027;
      }
      v8[2] = 50529027;
      v8[3] = v49;
      v8[4] = 50529027;
      v8[5] = v49;
      v8[6] = 50529027;
      v8[7] = v49;
      v8[9] = 50529027;
      int v50 = 16843009 * v15;
      int *v8 = v50;
      v8[1] = v49;
      if (v337) {
        v8[8] = v50;
      }
      if (v278 || v292) {
        unsigned __int8 v51 = 3;
      }
      else {
        unsigned __int8 v51 = 4;
      }
      if (v279 <= 1 && v21 == 2 || !v279)
      {
        int *v308 = 538976288;
      }
      else
      {
        int v52 = 16843009 * v51;
        int *v308 = v52;
        v8[9] = v52;
      }
      if (v282 == 2)
      {
        *(unsigned char *)int v8 = v15 | (32 * (v46 != v287));
        *((unsigned char *)v8 + 16) = v51 | (32 * (v280 != v287));
      }
      goto LABEL_102;
    }
    unsigned int v53 = bswap32(*(_DWORD *)(v277 + 4 * v17));
    int v342 = *(unsigned __int8 *)(a1[17] + v17);
    if (*(unsigned char *)(a1[17] + v17))
    {
      int8x16_t v54 = vbicq_s8((int8x16_t)xmmword_221A37AF0, (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v53), (int8x16_t)xmmword_221A37AE0)));
      a6 = (int8x8_t)vextq_s8(v54, v54, 8uLL).u64[0];
      int32x2_t v13 = (int32x2_t)vorr_s8(*(int8x8_t *)v54.i8, a6);
      v53 |= v13.i32[0] | v13.i32[1];
    }
    unsigned int v55 = 0;
    char v354 = v257[*(unsigned __int8 *)(v267 + 12 * *(unsigned __int16 *)(v9 + 2 * v17) + 8)];
    int v297 = 4 * v285;
    BOOL v57 = v282 != 2 || v46 == *(unsigned __int16 *)(v9 + 2 * v17);
    BOOL v305 = v57;
    v300 = v8 + 8;
    v290 = v8 + 9;
    int v302 = (v53 >> 4) & 0xFFF0000 | v53 & 0xFFF0000;
    __int16 v258 = *(_WORD *)(v45 + 10);
    unsigned int v268 = v53 >> 30;
    int v264 = (v53 >> 28) & 3;
    int v355 = (v53 >> 4) & 0xFFF0FFF | v53;
    int v259 = (v53 >> 4) & 0xFFF0FFF | v53 & 0xFFFFFFF;
    signed int v284 = v350 + 1;
    unsigned int v58 = 4;
    uint8x16_t v59 = v8;
    v276 = v8;
    int v348 = v21;
    uint64_t v349 = v17;
    while (2)
    {
      if (v55)
      {
        v18 += v6;
        ++v314;
        if (*(unsigned char *)(a1[17] + v17))
        {
          int32x2_t v13 = (int32x2_t)33686018;
          uint8x16_t v60 = v300;
          *(_OWORD *)v300 = xmmword_221A37B50;
        }
        else
        {
          uint8x16_t v60 = v300;
          *(void *)v300 = 0x202020202020202;
          *((void *)v300 + 1) = 0x202020202020202;
        }
        unsigned int v58 = 1;
        signed int v61 = (v286 & 0xFFFFFFFE) - 1;
        uint8x16_t v59 = v60;
      }
      else
      {
        signed int v61 = v315;
      }
      unsigned int v315 = v61;
      unint64_t v62 = *(void *)(v11 + 8 * v61);
      if (v355)
      {
        if (v302 == 268369920) {
          unsigned int v58 = 1;
        }
        int v313 = -1;
        int v63 = v302 == 268369920;
      }
      else if ((v258 & 0xFFFD) == 0x100)
      {
        int v313 = 0;
        int v63 = 0;
        int32x2_t v13 = (int32x2_t)0x2020202002020202;
        *(_OWORD *)uint8x16_t v59 = xmmword_221A37B00;
        unsigned int v58 = 1;
      }
      else
      {
        int v63 = 0;
        int v313 = -1;
      }
      unsigned int v345 = v55;
      if (!v305)
      {
        unsigned int v337 = 0;
LABEL_146:
        unsigned int v73 = 0;
        int v74 = 0;
        *(unsigned char *)uint8x16_t v59 = 32;
LABEL_147:
        unsigned int v72 = v355;
        goto LABEL_159;
      }
      if (!v297) {
        goto LABEL_146;
      }
      if (v10 <= v62 && v62 <= v12)
      {
        unsigned int v73 = 0;
        *uint8x16_t v59 = 67372036;
        int v74 = 1;
        goto LABEL_147;
      }
      unsigned int v65 = bswap32(*(_DWORD *)(v277 + 4 * v18));
      if ((v65 & 0xCC0000) != 0) {
        int v66 = 13382400;
      }
      else {
        int v66 = 0;
      }
      if ((v65 & 0x330000) != 0) {
        int v67 = 3342387;
      }
      else {
        int v67 = 0;
      }
      int v68 = v67 | v66 | v65;
      if (*(unsigned char *)(a1[17] + v18)) {
        unsigned int v65 = v68;
      }
      if (v296)
      {
        unsigned int v73 = 0;
        int v69 = (v65 >> 18) & 3;
        unsigned int v70 = HIWORD(v65) & 3;
        if ((v279 & 1) == 0) {
          unsigned int v70 = v69;
        }
        unsigned int v71 = dword_221A3E7C0[v70];
LABEL_153:
        int v76 = v355;
      }
      else
      {
        if (!v293)
        {
          unsigned int v73 = 0;
          unsigned int v71 = HIWORD(v65);
          goto LABEL_153;
        }
        unsigned int v73 = 0;
        unsigned int v75 = v268;
        if (v55) {
          unsigned int v75 = v264;
        }
        int v76 = v259 | (dword_221A3E7C0[v75] << 28);
        unsigned int v71 = HIWORD(v65);
      }
      unsigned int v72 = v76 | (v71 << 28);
      int v77 = v337;
LABEL_155:
      if (v73 < v58)
      {
        if ((v73 & v342) != 0)
        {
          int v74 = 0;
LABEL_158:
          *(unsigned char *)uint8x16_t v59 = 32;
          goto LABEL_159;
        }
        int v74 = v313 | (v72 >> 28) | (v73 == 0);
        if (!v74) {
          goto LABEL_158;
        }
        int v74 = 1;
        if (v72 >> 28 == 15) {
          goto LABEL_159;
        }
        uint64_t v78 = 0;
        unsigned int v353 = v73 + v297;
        int v351 = v73 + v297 - 1;
        unsigned int v288 = v73;
        if (v73) {
          BOOL v79 = 0;
        }
        else {
          BOOL v79 = v293;
        }
        BOOL v80 = v296;
        if (v73) {
          BOOL v80 = 0;
        }
        BOOL v343 = v80;
        unsigned int v81 = v72;
        int v303 = v18;
        unsigned int v329 = v58;
        v325 = v59;
        int v323 = v63;
        int v319 = v77;
        unsigned int v321 = v72;
        BOOL v317 = v79;
        while (!v79)
        {
          unsigned int v82 = v340 + v78;
          if (v343)
          {
            unsigned int v83 = ((2 * (v279 & 1)) & 3 | (4 * v314)) + (v78 >> 1);
            if ((v81 & 0x80000000) != 0) {
              goto LABEL_307;
            }
            goto LABEL_177;
          }
          unsigned int v83 = v299 + v78;
          if ((v81 & 0x80000000) == 0) {
            goto LABEL_177;
          }
LABEL_307:
          v81 *= 2;
          if (++v78 == 4)
          {
            int v74 = 1;
            a1 = v275;
            int v6 = v274;
            int v8 = v276;
            unint64_t v10 = v272;
            uint64_t v9 = v273;
            unint64_t v12 = v270;
            uint64_t v11 = v271;
            unsigned int v73 = v288;
LABEL_159:
            int v77 = 0;
            v63 |= v74;
            *(unsigned char *)v59++ |= (32 * v74) ^ 0x20;
            v72 *= 16;
            ++v73;
            goto LABEL_155;
          }
        }
        unsigned int v82 = v299 + 2 * v345 + (v78 >> 1);
        unsigned int v83 = 4 * v314 + v78;
        if ((v81 & 0x80000000) != 0) {
          goto LABEL_307;
        }
LABEL_177:
        uint64_t v84 = *(void *)(v7 + 8 * (v353 + v82 * v356));
        uint64_t v85 = *(void *)(v7 + 8 * (v351 + v83 * v356));
        if (v84 == v85)
        {
          LOBYTE(v114) = 0;
        }
        else
        {
          __int16 v86 = *(_WORD *)v84;
          __int16 v87 = *(_WORD *)(v84 + 2);
          unsigned int v88 = *(unsigned __int16 *)(v84 + 12);
          __int16 v89 = *(_WORD *)v85;
          __int16 v90 = *(_WORD *)(v85 + 2);
          __int16 v92 = *(_WORD *)v84 - *(_WORD *)v85;
          LOBYTE(v91) = v92;
          int v93 = (__int16)(v87 - v90);
          unsigned int v94 = *(unsigned __int16 *)(v85 + 12);
          LOWORD(v95) = v88 - v94;
          if (v92 >= 0)
          {
            unsigned __int8 v96 = HIBYTE(v92);
          }
          else
          {
            int v91 = -(unsigned __int16)(v86 - v89);
            unsigned __int8 v96 = (unsigned __int16)-v92 >> 8;
          }
          if (v93 < 0) {
            int v97 = -(unsigned __int16)(v87 - v90);
          }
          else {
            LOBYTE(v97) = v87 - v90;
          }
          if (v93 >= 0) {
            char v98 = (unsigned __int16)(v87 - v90) >> 8;
          }
          else {
            char v98 = (unsigned __int16)(v90 - v87) >> 8;
          }
          unsigned int v99 = -(unsigned __int16)v95 >> 8;
          if ((__int16)(v88 - v94) >= 0)
          {
            LOBYTE(v100) = (unsigned __int16)(v88 - v94) >> 8;
          }
          else
          {
            int v95 = -(unsigned __int16)(v88 - v94);
            LOBYTE(v100) = v99;
          }
          if ((v354 & 2) != 0)
          {
            if (v96) {
              BOOL v115 = 1;
            }
            else {
              BOOL v115 = v91 > 3u;
            }
            if (!v115 && v98 == 0)
            {
              if ((_BYTE)v100) {
                BOOL v144 = 0;
              }
              else {
                BOOL v144 = v350 >= v97;
              }
              int v114 = !v144;
              if ((_BYTE)v95) {
                int v114 = 1;
              }
              LOBYTE(v77) = v319;
              if (!v319)
              {
                if (v114) {
                  BOOL v145 = 0;
                }
                else {
                  BOOL v145 = v21 == 2;
                }
                unsigned int v58 = v329;
                uint8x16_t v59 = v325;
                int v63 = v323;
                unsigned int v72 = v321;
                BOOL v79 = v317;
                if (v145) {
                  LOBYTE(v114) = (*(unsigned char *)(v84 + 8) ^ *(unsigned char *)(v85 + 8)) & 1;
                }
                goto LABEL_306;
              }
              unsigned int v58 = v329;
              uint8x16_t v59 = v325;
              int v63 = v323;
              unsigned int v72 = v321;
            }
            else
            {
              LOBYTE(v114) = 1;
              unsigned int v58 = v329;
              uint8x16_t v59 = v325;
              int v63 = v323;
              LOBYTE(v77) = v319;
              unsigned int v72 = v321;
            }
            BOOL v79 = v317;
          }
          else
          {
            __int16 v101 = *(_WORD *)(v84 + 4);
            __int16 v102 = *(_WORD *)(v84 + 6);
            __int16 v103 = *(_WORD *)(v85 + 4);
            __int16 v104 = *(_WORD *)(v85 + 6);
            unsigned int v105 = -(unsigned __int16)(v102 - v104) >> 8;
            if ((__int16)(v102 - v104) < 0)
            {
              int v106 = -(unsigned __int16)(v102 - v104);
            }
            else
            {
              LOBYTE(v105) = (unsigned __int16)(v102 - v104) >> 8;
              LOBYTE(v106) = v102 - v104;
            }
            char v107 = (unsigned __int16)(v101 - v103) >> 8;
            if ((__int16)(v101 - v103) >= 0)
            {
              LOBYTE(v108) = v101 - v103;
            }
            else
            {
              char v107 = (unsigned __int16)(v103 - v101) >> 8;
              int v108 = -(unsigned __int16)(v101 - v103);
            }
            unsigned int v309 = *(unsigned __int8 *)(v84 + 8);
            unsigned int v311 = *(unsigned __int8 *)(v84 + 9);
            int v109 = (v309 >> 4) & 2 | (v311 >> 5);
            if (v109) {
              int v110 = 0;
            }
            else {
              int v110 = -1;
            }
            if (v109 == 1) {
              int v111 = -1;
            }
            else {
              int v111 = v110;
            }
            if (v109 == 2)
            {
              int v110 = -1;
              char v112 = -1;
            }
            else
            {
              char v112 = v111;
            }
            int v331 = *(_WORD *)(v84 + 12);
            int v335 = *(_WORD *)(v85 + 12);
            if (v331 == v335)
            {
              int v21 = v348;
              int v113 = *(_WORD *)(v84 + 12);
              uint64_t v7 = v347;
            }
            else
            {
              unsigned int v117 = v88 - (bswap32(v94) >> 16);
              LOWORD(v91) = v86 - v103;
              int v118 = (__int16)(v86 - v103);
              int v119 = (__int16)(v87 - v104);
              unsigned __int16 v120 = v101 - v89;
              int v121 = (__int16)(v101 - v89);
              int v122 = (__int16)(v102 - v90);
              int v123 = (__int16)v117;
              unsigned int v124 = -(unsigned __int16)v91 >> 8;
              if (v118 >= 0)
              {
                unsigned __int8 v96 = BYTE1(v91);
              }
              else
              {
                int v91 = -(unsigned __int16)v91;
                unsigned __int8 v96 = v124;
              }
              if (v119 < 0) {
                int v97 = -(unsigned __int16)(v87 - v104);
              }
              else {
                LOBYTE(v97) = v87 - v104;
              }
              if (v119 >= 0) {
                char v98 = (unsigned __int16)(v87 - v104) >> 8;
              }
              else {
                char v98 = (unsigned __int16)(v104 - v87) >> 8;
              }
              if (v121 < 0) {
                int v108 = -v120;
              }
              else {
                LOBYTE(v108) = v120;
              }
              if (v121 >= 0) {
                char v107 = HIBYTE(v120);
              }
              else {
                char v107 = (unsigned __int16)-v120 >> 8;
              }
              if (v122 < 0) {
                int v106 = -(unsigned __int16)(v102 - v90);
              }
              else {
                LOBYTE(v106) = v102 - v90;
              }
              if (v122 >= 0) {
                LOBYTE(v105) = (unsigned __int16)(v102 - v90) >> 8;
              }
              else {
                LOBYTE(v105) = (unsigned __int16)(v90 - v102) >> 8;
              }
              char v125 = BYTE1(v117);
              if ((v117 & 0x8000u) != 0) {
                int v95 = -(unsigned __int16)v117;
              }
              else {
                LOBYTE(v95) = v117;
              }
              unsigned int v126 = -(unsigned __int16)v117;
              uint64_t v7 = v347;
              unsigned int v100 = v126 >> 8;
              if (v123 >= 0) {
                LOBYTE(v100) = v125;
              }
              int v21 = v348;
              int v113 = *(_WORD *)(v84 + 12);
            }
            unsigned int v127 = v88 >> 8;
            unsigned int v128 = v94 >> 8;
            unsigned int v129 = v110 & 3;
            unsigned int v130 = v110 & v350;
            char v131 = v98 & v111;
            unsigned __int8 v132 = v97 & v111;
            char v133 = v107 & v110;
            unsigned __int8 v134 = v108 & v110;
            char v135 = v105 & v110;
            unsigned __int8 v136 = v106 & v110;
            char v137 = v100 & v112;
            char v138 = v95 & v112;
            unsigned int v139 = (v91 & v111);
            BOOL v141 = (v96 & v111) != 0 || (v111 & 3u) < v139;
            if (v131) {
              BOOL v141 = 1;
            }
            if ((v111 & v350) < v132) {
              BOOL v141 = 1;
            }
            if (v133) {
              BOOL v141 = 1;
            }
            if (v129 < v134) {
              BOOL v141 = 1;
            }
            if (v135) {
              BOOL v141 = 1;
            }
            if (v130 < v136) {
              BOOL v141 = 1;
            }
            BOOL v142 = v137 != 0;
            int v143 = *(_WORD *)(v85 + 12);
            if ((v113 - v128) | (v127 - v335))
            {
              int v114 = v141 || v142 || v138 != 0;
              uint64_t v17 = v349;
              int v77 = v319;
            }
            else
            {
              int v146 = sub_221A313BC((__int16 *)v84, (__int16 *)v85, v284, v292, v319, v13, (int32x2_t)a6);
              int v143 = v335;
              int v77 = v319;
              int v113 = v331;
              int v114 = v146;
              uint64_t v17 = v349;
            }
            int v18 = v303;
            unsigned int v58 = v329;
            uint8x16_t v59 = v325;
            int v63 = v323;
            unsigned int v72 = v321;
            BOOL v79 = v317;
            if (!v77 && !v114 && v21 == 2)
            {
              int v148 = *(unsigned char *)(v85 + 8) & 1;
              int v149 = *(unsigned char *)(v85 + 9) & 1;
              int v150 = v309 & 1;
              int v151 = v311 & 1;
              BOOL v152 = v113 == v143 && v150 == v148 && v151 == v149 && v127 == v128
                  || v150 == v149 && v151 == v148 && v113 == v128 && v127 == v143;
              LOBYTE(v114) = !v152;
            }
          }
        }
LABEL_306:
        *((unsigned char *)v59 + v78) = v114 | v77;
        goto LABEL_307;
      }
      unsigned int v55 = v345 + 1;
      if (v345 < v337) {
        continue;
      }
      break;
    }
    BOOL v157 = v282 != 2 || v280 == v287;
    BOOL v298 = v157;
    unsigned int v289 = v291 - v6;
    *(unsigned char *)v8 |= ((_BYTE)v63 << 6) ^ 0x40;
    BOOL v160 = v279 == 1 && v21 == 2 || v299 == 0;
    BOOL v283 = v160;
    if (v278 || v292) {
      char v161 = 3;
    }
    else {
      char v161 = 4;
    }
    unsigned __int8 v265 = v161;
    unsigned int v162 = 0;
    unsigned int v163 = 4;
    uint8x16_t v164 = v308;
    uint64_t v165 = v333;
LABEL_328:
    unsigned int v339 = v162;
    if (v162)
    {
      unsigned int v163 = 1;
      if (*(unsigned char *)(a1[17] + v17))
      {
        int32x2_t v13 = (int32x2_t)33686018;
        int32x4_t v166 = v290;
        *(_OWORD *)v290 = xmmword_221A37B50;
      }
      else
      {
        int32x4_t v166 = v290;
        *(void *)v290 = 0x202020202020202;
        *((void *)v290 + 1) = 0x202020202020202;
      }
      int v328 = v286 - v263 + 1;
      uint64_t v165 = v289;
      int v295 = v356;
      uint8x16_t v164 = v166;
    }
    unint64_t v167 = *(void *)(v11 + 8 * v328);
    if (v355)
    {
      if ((v355 & 0xFFF) == 0xFFF) {
        unsigned int v163 = 1;
      }
      int v168 = -1;
      int v169 = (v355 & 0xFFF) == 4095;
    }
    else if ((v258 & 0xFFFE) == 0x100)
    {
      int v168 = 0;
      int v169 = 0;
      int32x2_t v13 = (int32x2_t)0x2020202002020202;
      *(_OWORD *)uint8x16_t v164 = xmmword_221A37B00;
      unsigned int v163 = 1;
    }
    else
    {
      int v169 = 0;
      int v168 = -1;
    }
    if (!v298)
    {
      BOOL v327 = 0;
LABEL_357:
      unsigned int v179 = 0;
      int v180 = 0;
      *(unsigned char *)uint8x16_t v164 = 32;
LABEL_358:
      unsigned int v177 = v355 << 16;
      goto LABEL_510;
    }
    if (v283) {
      goto LABEL_357;
    }
    if (v10 <= v167 && v167 <= v12)
    {
      unsigned int v179 = 0;
      *uint8x16_t v164 = 16843009 * v265;
      int v180 = 1;
      goto LABEL_358;
    }
    unsigned int v171 = bswap32(*(_DWORD *)(v277 + 4 * (int)v165));
    if ((v171 & 0x33000000) != 0) {
      int v172 = 855638220;
    }
    else {
      int v172 = 0;
    }
    int v173 = v168;
    if ((v171 & 0x330000) != 0) {
      int v174 = 3342387;
    }
    else {
      int v174 = 0;
    }
    int v175 = v174 | v172;
    int v168 = v173;
    int v176 = v175 | v171;
    if (*(unsigned char *)(a1[17] + (int)v165)) {
      unsigned int v171 = v176;
    }
    unsigned int v179 = 0;
    unsigned int v177 = (v355 << 16) | (v171 << 28);
    int v178 = v278;
    while (1)
    {
      if (v179 >= v163)
      {
        *(unsigned char *)v308 |= ((_BYTE)v169 << 6) ^ 0x40;
        unsigned int v162 = v339 + 1;
        if (v339 >= v327) {
          goto LABEL_102;
        }
        goto LABEL_328;
      }
      if ((v179 & v342) != 0)
      {
        int v180 = 0;
        *(unsigned char *)uint8x16_t v164 = 32;
        goto LABEL_510;
      }
      unsigned int v294 = v179;
      int v180 = v168 | (v177 >> 28) | (v179 == 0);
      if (v180) {
        break;
      }
      *(unsigned char *)uint8x16_t v164 = 32;
LABEL_509:
      unsigned int v179 = v294;
LABEL_510:
      int v178 = 0;
      v169 |= v180;
      *(unsigned char *)v164++ |= (32 * v180) ^ 0x20;
      v177 *= 16;
      ++v179;
    }
    int v180 = 1;
    if (v177 >> 28 == 15) {
      goto LABEL_509;
    }
    int v269 = v168;
    uint64_t v181 = 0;
    int v182 = v295;
    if (v179) {
      int v182 = v356;
    }
    unsigned int v352 = v281 + v356 * (v340 + v179) - v182;
    unsigned int v183 = v177;
    uint64_t v334 = v165;
    unsigned int v324 = v163;
    unsigned int v326 = v177;
    v322 = v164;
    int v320 = v169;
    int v332 = v178;
    while ((v183 & 0x80000000) != 0)
    {
LABEL_506:
      v183 *= 2;
      if (++v181 == 4)
      {
        int v180 = 1;
        a1 = v275;
        int v6 = v274;
        int v8 = v276;
        unint64_t v10 = v272;
        uint64_t v9 = v273;
        unint64_t v12 = v270;
        uint64_t v11 = v271;
        int v168 = v269;
        goto LABEL_509;
      }
    }
    int32x4_t v184 = *(__int16 **)(v7 + 8 * (v281 + v356 * (v340 + v294) + v181));
    int32x4_t v185 = *(__int16 **)(v7 + 8 * (v352 + v181));
    if (v184 == v185)
    {
      LOBYTE(v218) = 0;
    }
    else
    {
      __int16 v186 = *v185;
      __int16 v346 = *v184;
      __int16 v188 = *v184 - *v185;
      LOBYTE(v187) = v188;
      __int16 v189 = v184[1];
      __int16 v190 = v185[1];
      int v191 = (__int16)(v189 - v190);
      __int16 v192 = v184[2];
      __int16 v193 = v185[2];
      int v194 = (__int16)(v192 - v193);
      __int16 v195 = v185[3];
      __int16 v196 = v184[3] - v195;
      unsigned int v197 = (unsigned __int16)v184[4];
      __int16 v198 = v185[4];
      int v199 = (__int16)(v197 - v198);
      if (v188 >= 0)
      {
        char v200 = HIBYTE(v188);
      }
      else
      {
        int v187 = -(unsigned __int16)(v346 - v186);
        char v200 = (unsigned __int16)-v188 >> 8;
      }
      unsigned int v201 = (unsigned __int16)v184[6];
      unsigned int v202 = (unsigned __int16)v185[6];
      if (v191 < 0) {
        int v203 = -(unsigned __int16)(v189 - v190);
      }
      else {
        LOBYTE(v203) = v189 - v190;
      }
      unsigned __int8 v344 = v203;
      unsigned int v204 = -(unsigned __int16)(v189 - v190) >> 8;
      if (v191 >= 0) {
        LOBYTE(v204) = (unsigned __int16)(v189 - v190) >> 8;
      }
      BOOL v205 = v194 < 0;
      if (v194 < 0) {
        int v206 = -(unsigned __int16)(v192 - v193);
      }
      else {
        LOBYTE(v206) = v192 - v193;
      }
      if (v205) {
        LOBYTE(v207) = (unsigned __int16)(v193 - v192) >> 8;
      }
      else {
        LOBYTE(v207) = (unsigned __int16)(v192 - v193) >> 8;
      }
      __int16 v208 = v201 - v202;
      if (v196 < 0) {
        int v209 = -(unsigned __int16)(v184[3] - v195);
      }
      else {
        LOBYTE(v209) = *((unsigned char *)v184 + 6) - v195;
      }
      if (v196 >= 0) {
        char v210 = (unsigned __int16)(v184[3] - v195) >> 8;
      }
      else {
        char v210 = (unsigned __int16)(v195 - v184[3]) >> 8;
      }
      if (v199 < 0) {
        int v211 = -(unsigned __int16)(v197 - v198);
      }
      else {
        LOBYTE(v211) = v197 - v198;
      }
      unsigned int v212 = -(unsigned __int16)(v197 - v198) >> 8;
      if (v199 >= 0) {
        LOBYTE(v212) = (unsigned __int16)(v197 - v198) >> 8;
      }
      if (v208 < 0) {
        int v213 = -(unsigned __int16)(v201 - v202);
      }
      else {
        LOBYTE(v213) = v201 - v202;
      }
      if (v208 >= 0) {
        char v214 = (unsigned __int16)(v201 - v202) >> 8;
      }
      else {
        char v214 = (unsigned __int16)(v202 - v201) >> 8;
      }
      if ((v354 & 2) != 0)
      {
        LOBYTE(v218) = 1;
        uint8x16_t v164 = v322;
        LOBYTE(v178) = v332;
        if (v200)
        {
          uint64_t v7 = v347;
          uint64_t v17 = v349;
          uint64_t v165 = v334;
          unsigned int v163 = v324;
          int v169 = v320;
        }
        else
        {
          uint64_t v7 = v347;
          uint64_t v17 = v349;
          uint64_t v165 = v334;
          unsigned int v163 = v324;
          int v169 = v320;
          if (v187 <= 3u)
          {
            BOOL v32 = v204 == 0;
            unsigned int v177 = v326;
            if (v32)
            {
              BOOL v219 = !v214 && v350 >= v344;
              BOOL v220 = !v219;
              int v218 = (_BYTE)v213 || v220;
              if (v218 != 1 && v348 == 2 && !v332) {
                LOBYTE(v218) = (v197 ^ v198) & 1;
              }
            }
            goto LABEL_505;
          }
        }
        unsigned int v177 = v326;
      }
      else
      {
        __int16 v301 = v185[1];
        unsigned int v330 = (unsigned __int16)v185[4];
        char v306 = v185[4];
        unsigned __int8 v307 = v184[4];
        unsigned int v304 = v197 >> 8;
        int v215 = (v307 >> 4) & 2 | ((unsigned __int16)v184[4] >> 13);
        if (v215) {
          int v216 = 0;
        }
        else {
          int v216 = -1;
        }
        if (v215 == 1) {
          int v217 = -1;
        }
        else {
          int v217 = v216;
        }
        if (v215 == 2)
        {
          int v217 = 0;
          unsigned __int8 v310 = 0;
          int v216 = 255;
          char v312 = -1;
        }
        else
        {
          unsigned __int8 v310 = v216;
          char v312 = v217;
        }
        __int16 v221 = v184[2];
        __int16 v222 = v184[3];
        int v223 = v185[6];
        unsigned int v336 = v202 >> 8;
        unsigned int v338 = v201 >> 8;
        unsigned int v316 = v216 & 3;
        int v341 = v184[6];
        unsigned int v318 = v216 & v350;
        if (v341 == v223)
        {
          uint64_t v7 = v347;
          int v224 = v348;
          uint64_t v17 = v349;
          uint64_t v165 = v334;
          unsigned int v163 = v324;
          uint8x16_t v164 = v322;
          int v169 = v320;
          char v225 = v344;
          unsigned __int8 v226 = v310;
        }
        else
        {
          int v211 = v197 - (bswap32(v330) >> 16);
          LOBYTE(v187) = v346 - v193;
          int v227 = (__int16)(v189 - v195);
          LOWORD(v206) = v221 - v186;
          int v228 = (__int16)(v222 - v301);
          unsigned int v229 = v201 - (bswap32(v202) >> 16);
          if ((__int16)(v346 - v193) >= 0)
          {
            char v200 = (unsigned __int16)(v346 - v193) >> 8;
          }
          else
          {
            int v187 = -(unsigned __int16)(v346 - v193);
            char v200 = (unsigned __int16)(v193 - v346) >> 8;
          }
          if (v227 < 0) {
            int v230 = -(unsigned __int16)(v189 - v195);
          }
          else {
            LOBYTE(v230) = v189 - v195;
          }
          if (v227 >= 0) {
            LOBYTE(v204) = (unsigned __int16)(v189 - v195) >> 8;
          }
          else {
            LOBYTE(v204) = (unsigned __int16)(v195 - v189) >> 8;
          }
          unsigned int v207 = -(unsigned __int16)v206 >> 8;
          if ((__int16)(v221 - v186) >= 0) {
            LOBYTE(v207) = (unsigned __int16)(v221 - v186) >> 8;
          }
          else {
            int v206 = -(unsigned __int16)(v221 - v186);
          }
          if (v228 < 0) {
            int v209 = -(unsigned __int16)(v222 - v301);
          }
          else {
            LOBYTE(v209) = v222 - v301;
          }
          if (v228 >= 0) {
            char v210 = (unsigned __int16)(v222 - v301) >> 8;
          }
          else {
            char v210 = (unsigned __int16)(v301 - v222) >> 8;
          }
          unsigned int v231 = -(unsigned __int16)v211 >> 8;
          if ((v211 & 0x8000u) == 0)
          {
            LOBYTE(v212) = BYTE1(v211);
          }
          else
          {
            int v211 = -(unsigned __int16)v211;
            LOBYTE(v212) = v231;
          }
          char v232 = BYTE1(v229);
          BOOL v233 = (v229 & 0x8000u) != 0;
          if ((v229 & 0x8000u) != 0) {
            int v213 = -(unsigned __int16)v229;
          }
          else {
            LOBYTE(v213) = v229;
          }
          unsigned int v234 = -(unsigned __int16)v229 >> 8;
          if (v233) {
            char v214 = v234;
          }
          else {
            char v214 = v232;
          }
          char v225 = v230;
          uint64_t v7 = v347;
          int v224 = v348;
          uint64_t v17 = v349;
          uint64_t v165 = v334;
          unsigned int v163 = v324;
          uint8x16_t v164 = v322;
          int v169 = v320;
          unsigned __int8 v226 = v310;
        }
        char v235 = v200 & v217;
        char v236 = v204 & v217;
        unsigned __int8 v237 = v225 & v217;
        char v238 = v207 & v216;
        unsigned __int8 v239 = v206 & v216;
        char v240 = v210 & v216;
        unsigned __int8 v241 = v209 & v216;
        char v242 = v211 & v226;
        char v243 = v214 & v312;
        unsigned int v244 = (v187 & v217);
        if (v235) {
          BOOL v245 = 0;
        }
        else {
          BOOL v245 = (v217 & 3u) >= v244;
        }
        char v246 = !v245;
        if (v236) {
          char v246 = 1;
        }
        if ((v217 & v350) < v237) {
          char v246 = 1;
        }
        if (v238) {
          char v246 = 1;
        }
        if (v316 < v239) {
          char v246 = 1;
        }
        if (v240) {
          char v246 = 1;
        }
        if (v318 < v241) {
          char v246 = 1;
        }
        if ((v341 - v336) | (v338 - v223)) {
          int v218 = v246 & 1 | ((v212 & v226) != 0 || v242 != 0 || v243 != 0 || (v213 & v312) != 0);
        }
        else {
          int v218 = sub_221A313BC(v184, v185, v284, v292, v332, v13, (int32x2_t)a6);
        }
        unsigned int v177 = v326;
        if (v218)
        {
          LOBYTE(v178) = v332;
        }
        else
        {
          LOBYTE(v178) = v332;
          if (v224 == 2 && !v332)
          {
            int v247 = v306 & 1;
            int v248 = (v330 >> 8) & 1;
            int v249 = v307 & 1;
            int v250 = v304 & 1;
            BOOL v251 = v341 == v223 && v249 == v247 && v250 == v248 && v338 == v336
                || v250 == v247 && v249 == v248 && v341 == v336 && v338 == v223;
            LOBYTE(v218) = !v251;
          }
        }
      }
    }
LABEL_505:
    *((unsigned char *)v164 + v181) = v218 | v178;
    goto LABEL_506;
  }
  return 0;
}

uint64_t sub_221A30EF0(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v26 = *(unsigned int *)(a1 + 12);
  if (v26)
  {
    uint64_t v6 = 0;
    int v7 = 2 * a2;
    unsigned int v27 = a3 / v26;
    unsigned int v8 = 16 * (a3 / v26);
    unsigned int v9 = a4 / v26;
    while (v27 >= v9)
    {
LABEL_23:
      if (++v6 == v26) {
        return 0;
      }
    }
    uint64_t v10 = (16 * v6);
    int v11 = v27;
    while (1)
    {
      unsigned int v12 = 0;
      int v13 = *(_DWORD *)(a1 + 12);
      unsigned int v14 = v6 + v13 * v11;
      uint64_t v15 = *(void *)(a1 + 144);
      int v16 = *(unsigned __int8 *)(v15 + v14);
      if (v11 && v16 == 1) {
        unsigned int v12 = *(unsigned __int8 *)(v15 + v14 - v13) == 2;
      }
      if (!v6) {
        break;
      }
      if (v16 == 1)
      {
        BOOL v17 = 0;
        BOOL v18 = *(unsigned __int8 *)(v15 + v14 - 1) == 2;
      }
      else
      {
        if (v16 != 2) {
          break;
        }
        BOOL v18 = 0;
        BOOL v17 = *(unsigned __int8 *)(v15 + v14 - 1) == 1;
      }
LABEL_14:
      if (v16 == 2)
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 32) + v10 + v8 * *(_DWORD *)(*(void *)(a1 + 80) + 136);
        unsigned int v20 = (v11 << 31 >> 31) & a2;
        int v21 = v7;
      }
      else
      {
        uint64_t v22 = *(void *)(a1 + 80);
        uint64_t v19 = *(void *)(v22 + 32) + v10;
        unsigned int v20 = 16 * v11 * *(_DWORD *)(v22 + 136);
        int v21 = a2;
      }
      int v23 = (unsigned __int8 *)(*(void *)(a1 + 152) + 48 * v14);
      if ((v23[16] & 0xC0) + *v23 <= 0x7F)
      {
        if (v17) {
          int v24 = 2;
        }
        else {
          int v24 = 0;
        }
        sub_221A317A0((unsigned __int8 *)a1, v19 + v20, v19 + v20, v6, v11, v21, v23, v12, v24 | v18);
      }
      if (++v11 == v9) {
        goto LABEL_23;
      }
    }
    BOOL v18 = 0;
    BOOL v17 = 0;
    goto LABEL_14;
  }
  return 0;
}

uint64_t sub_221A310B0(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v26 = *(unsigned int *)(a1 + 12);
  if (v26)
  {
    uint64_t v6 = 0;
    int v7 = 2 * a2;
    unsigned int v27 = a3 / v26;
    unsigned int v8 = 8 * (a3 / v26);
    unsigned int v9 = a4 / v26;
    while (v27 >= v9)
    {
LABEL_23:
      if (++v6 == v26) {
        return 0;
      }
    }
    uint64_t v10 = (16 * v6);
    int v11 = v27;
    while (1)
    {
      BOOL v12 = 0;
      int v13 = *(_DWORD *)(a1 + 12);
      unsigned int v14 = v6 + v13 * v11;
      uint64_t v15 = *(void *)(a1 + 144);
      int v16 = *(unsigned __int8 *)(v15 + v14);
      if (v11 && v16 == 1) {
        BOOL v12 = *(unsigned __int8 *)(v15 + v14 - v13) == 2;
      }
      if (!v6) {
        break;
      }
      if (v16 == 1)
      {
        BOOL v17 = 0;
        BOOL v18 = *(unsigned __int8 *)(v15 + v14 - 1) == 2;
      }
      else
      {
        if (v16 != 2) {
          break;
        }
        BOOL v18 = 0;
        BOOL v17 = *(unsigned __int8 *)(v15 + v14 - 1) == 1;
      }
LABEL_14:
      if (v16 == 2)
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 40) + v10 + v8 * *(_DWORD *)(*(void *)(a1 + 80) + 152);
        unsigned int v20 = (v11 << 31 >> 31) & a2;
        int v21 = v7;
      }
      else
      {
        uint64_t v22 = *(void *)(a1 + 80);
        uint64_t v19 = *(void *)(v22 + 40) + v10;
        unsigned int v20 = 8 * v11 * *(_DWORD *)(v22 + 152);
        int v21 = a2;
      }
      int v23 = (unsigned __int8 *)(*(void *)(a1 + 152) + 48 * v14);
      if ((v23[16] & 0xC0) + *v23 <= 0x7F)
      {
        if (v17) {
          int v24 = 2;
        }
        else {
          int v24 = 0;
        }
        sub_221A325F4(a1, v19 + v20, v19 + v20, v6, v11, v21, v23, (unsigned __int8 *)v12, v24 | v18);
      }
      if (++v11 == v9) {
        goto LABEL_23;
      }
    }
    BOOL v18 = 0;
    BOOL v17 = 0;
    goto LABEL_14;
  }
  return 0;
}

uint64_t sub_221A31270(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v7 = sub_221A2F394(a1, a2, a3, a5, a6);
  unint64_t v8 = *(unsigned int *)(a1 + 20);
  if (v8)
  {
    unsigned int v9 = *(unsigned char **)(a1 + 168);
    if (*v9 != 30) {
      goto LABEL_7;
    }
    uint64_t v10 = 1;
    do
    {
      unint64_t v11 = v10;
      if (v8 == v10) {
        break;
      }
      int v12 = v9[v10++];
    }
    while (v12 == 30);
    if (v11 < v8) {
LABEL_7:
    }
      uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    unint64_t v8 = 0;
  }
  bzero(*(void **)(a1 + 32), 4 * v8);
  return v7;
}

void sub_221A312FC(uint64_t a1)
{
  if (a1)
  {
    sub_221A34190(*(pthread_mutex_t **)(a1 + 160));
    *(void *)(a1 + 160) = 0;
    uint64_t v2 = *(void *)(a1 + 168);
    if (v2) {
      MEMORY[0x223C8C880](v2, 0x1000C8077774924);
    }
    *(void *)(a1 + 168) = 0;
    j__free(*(void **)a1);
    j__free(*(void **)(a1 + 32));
    sub_221A12AFC(*(void *)(a1 + 152));
    j__free(*(void **)(a1 + 112));
    j__free(*(void **)(a1 + 120));
    j__free(*(void **)(a1 + 128));
    j__free(*(void **)(a1 + 136));
    j__free(*(void **)(a1 + 144));
    j__free(*(void **)(a1 + 72));
    j__free(*(void **)(a1 + 48));
    j__free(*(void **)(a1 + 232));
    uint64_t v3 = *(pthread_mutex_t **)(a1 + 64);
    sub_221A34190(v3);
  }
}

uint64_t sub_221A313BC(__int16 *a1, __int16 *a2, signed int a3, int a4, int a5, int32x2_t a6, int32x2_t a7)
{
  unsigned int v7 = *((unsigned __int8 *)a1 + 12);
  unsigned int v8 = *((unsigned __int8 *)a2 + 12);
  unsigned int v9 = *((unsigned __int8 *)a2 + 13);
  if (a4 && !a5)
  {
    unsigned int v7 = v7 & 0xFFFFFEFF | ((a1[4] & 1) << 8);
    unsigned int v8 = v8 & 0xFFFFFEFF | ((a2[4] & 1) << 8);
    unsigned int v9 = v9 & 0xFFFFFEFF | ((*((unsigned char *)a2 + 9) & 1) << 8);
  }
  if (v8 == v9)
  {
    a6.i16[0] = a1[2];
    a6.i16[2] = *a1;
    a7.i16[0] = a2[1];
    a7.i16[2] = a2[3];
    int32x2_t v10 = vshr_n_s32(vshl_n_s32(a6, 0x10uLL), 0x10uLL);
    int32x2_t v11 = vshr_n_s32(vshl_n_s32(a7, 0x10uLL), 0x10uLL);
    int32x2_t v12 = vdup_n_s32(a3);
    int32x2_t v13 = (int32x2_t)vorr_s8((int8x8_t)vcgt_u32((uint32x2_t)vorr_s8((int8x8_t)vabd_s32(v10, vdup_n_s32(a2[2])), (int8x8_t)vabd_s32(vrev64_s32(v10), vdup_n_s32(*a2))), (uint32x2_t)0x300000003), vorr_s8((int8x8_t)vcge_s32(vabd_s32(vdup_n_s32(a1[1]), v11), v12), (int8x8_t)vcge_s32(vabd_s32(vdup_n_s32(a1[3]), vrev64_s32(v11)), v12)));
    unsigned __int8 v14 = vand_s8((int8x8_t)v13, (int8x8_t)vdup_lane_s32(v13, 1)).u8[0];
  }
  else
  {
    int v15 = *a1;
    if (v8 == v7)
    {
      int v17 = v15 - *a2;
      BOOL v16 = v17 < 0;
      int v18 = a1[1] - a2[1];
      int v19 = a1[2] - a2[2];
      int v20 = a2[3];
    }
    else
    {
      int v17 = v15 - a2[2];
      BOOL v16 = v17 < 0;
      int v18 = a1[1] - a2[3];
      int v19 = a1[2] - *a2;
      int v20 = a2[1];
    }
    int v21 = a1[3] - v20;
    if (v16) {
      int v17 = -v17;
    }
    if (v18 < 0) {
      int v18 = -v18;
    }
    if (v19 < 0) {
      int v19 = -v19;
    }
    if (v21 < 0) {
      int v21 = v20 - a1[3];
    }
    unsigned int v22 = v19 | v17;
    unsigned __int8 v14 = v18 >= a3 || v22 > 3 || v21 >= a3;
  }
  return v14 & 1;
}

unsigned char *sub_221A3151C(unsigned char *result, int a2, int a3, uint64_t a4, int a5, int a6, int a7)
{
  int v7 = result[-a2];
  int v8 = *result;
  int v9 = v7 - v8;
  if (v9 * v9 < (a5 * a5))
  {
    int v10 = result[-2 * a2];
    if ((v10 - v7) * (v10 - v7) < (a6 * a6))
    {
      unsigned int v11 = result[a2];
      if ((v11 - v8) * (v11 - v8) < a6 * a6)
      {
        uint64_t v12 = a2;
        uint64_t v13 = -(uint64_t)a2;
        uint64_t v14 = -2 * a2;
        uint64_t v15 = -3 * a2;
        unsigned int v16 = result[-3 * a2];
        if (a3 == 4)
        {
          unsigned int v17 = result[2 * a2];
          if (v9 >= 0) {
            int v18 = v7 - v8;
          }
          else {
            int v18 = v8 - v7;
          }
          int v19 = v16 - v7;
          if ((int)(v16 - v7) < 0) {
            int v19 = v7 - v16;
          }
          if ((int)(v17 - v8) >= 0) {
            int v20 = v17 - v8;
          }
          else {
            int v20 = v8 - v17;
          }
          if (v19 >= a6 || v18 >= (a5 >> 2) + 2)
          {
            unsigned int v22 = (v7 + 2 * v10 + v11 + 2) >> 2;
            LOBYTE(v23) = v10;
          }
          else
          {
            int v21 = v8 + v7 + v10;
            unsigned int v22 = (v11 + 2 * v21 + v16 + 4) >> 3;
            unsigned int v23 = (v21 + v16 + 2) >> 2;
            unsigned int v16 = (v21 + 3 * v16 + 2 * result[-4 * v12] + 4) >> 3;
          }
          if (v20 >= a6 || v18 >= (a5 >> 2) + 2)
          {
            unsigned int v41 = (v8 + v10 + 2 * v11 + 2) >> 2;
          }
          else
          {
            unsigned int v40 = v8 + v7 + v11;
            unsigned int v41 = (v10 + 2 * v40 + v17 + 4) >> 3;
            unsigned int v11 = (v40 + v17 + 2) >> 2;
            unsigned int v17 = (v40 + 3 * v17 + 2 * result[3 * v12] + 4) >> 3;
          }
          result[v13] = v22;
          result[v14] = v23;
          result[v15] = v16;
          *uint64_t result = v41;
          result[v12] = v11;
          result[2 * v12] = v17;
        }
        else
        {
          int v24 = result[2 * a2];
          if ((int)(v16 - v7) >= 0) {
            int v25 = v16 - v7;
          }
          else {
            int v25 = v7 - v16;
          }
          if (v24 - v8 >= 0) {
            int v26 = v24 - v8;
          }
          else {
            int v26 = v8 - v24;
          }
          if (v25 >= a6) {
            int v27 = a7;
          }
          else {
            int v27 = a7 + 1;
          }
          if (v26 < a6) {
            ++v27;
          }
          int v28 = v10 - v11 + 4 * (v8 - v7) + 4;
          unsigned int v29 = v28 >> 3;
          int v30 = v28 >> 3;
          if (v30 < (__int16)-(__int16)v27) {
            int v31 = -v27;
          }
          else {
            LOWORD(v31) = v29;
          }
          if (v30 > (__int16)v27) {
            LOWORD(v31) = v27;
          }
          unsigned int v32 = (__int16)(v31 + v7) & ~((__int16)(v31 + v7) >> 31);
          if (v32 >= 0xFF) {
            LOBYTE(v32) = -1;
          }
          unsigned int v33 = (__int16)(v8 - v31) & ~((__int16)(v8 - v31) >> 31);
          if (v33 >= 0xFF) {
            LOBYTE(v33) = -1;
          }
          unsigned int v34 = v8 + v7 + 1;
          int v35 = v16 - 2 * v10 + (v34 >> 1);
          if (-a7 > v35 >> 1) {
            int v36 = -a7;
          }
          else {
            int v36 = v35 >> 1;
          }
          if (a7 < (__int16)v36) {
            LOBYTE(v36) = a7;
          }
          char v37 = v10 + v36;
          if (v25 < a6) {
            LOBYTE(v10) = v37;
          }
          if (v26 < a6)
          {
            int v38 = v24 - 2 * v11 + (v34 >> 1);
            if (-a7 > v38 >> 1) {
              int v39 = -a7;
            }
            else {
              int v39 = v38 >> 1;
            }
            if (a7 < (__int16)v39) {
              LOBYTE(v39) = a7;
            }
            LOBYTE(v11) = v11 + v39;
          }
          result[v13] = v32;
          result[v14] = v10;
          *uint64_t result = v33;
          result[v12] = v11;
        }
      }
    }
  }
  return result;
}

unsigned __int8 *sub_221A317A0(unsigned __int8 *result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, unsigned __int8 *a7, unsigned int a8, unsigned int a9)
{
  int v9 = a7;
  BOOL v152 = result;
  uint64_t v10 = a9;
  v179[14] = *MEMORY[0x263EF8340];
  if (a2 != a3)
  {
    uint64_t v11 = 0;
    for (unsigned int i = 17; i > 1; --i)
    {
      *(_OWORD *)(a3 + v11) = *(_OWORD *)(a2 + v11);
      v11 += a6;
    }
  }
  uint64_t v13 = 0;
  int v14 = *((_DWORD *)result + 3);
  int v15 = v14 * a5;
  uint64_t v151 = v14 * a5 + a4;
  uint64_t v16 = *((void *)result + 6) + 12 * *(unsigned __int16 *)(*((void *)result + 9) + 2 * v151);
  int v17 = *(char *)(v16 + 10);
  int v18 = *(char *)(v16 + 11);
  uint64_t v19 = *((void *)result + 14);
  int v20 = *(unsigned __int8 *)(v19 + (v14 * a5 + a4));
  int v160 = v17;
  int v21 = v20 + v17;
  int v159 = v18;
  int v147 = v20;
  int v22 = v20 + v18;
  unsigned int v23 = v21 & ~(v21 >> 31);
  if (v23 >= 0x33) {
    uint64_t v24 = 51;
  }
  else {
    uint64_t v24 = v23;
  }
  unsigned int v25 = v22 & ~(v22 >> 31);
  int v176 = byte_221A3E7D0[v24];
  if (v25 >= 0x33) {
    unsigned int v25 = 51;
  }
  int v26 = byte_221A3E810[v25];
  unsigned int v163 = a7 + 16;
  int v27 = (char *)&byte_221A3E850[4 * v24];
  do
  {
    unsigned int v28 = a7[v13];
    if (v28 >= 3) {
      unsigned int v28 = 3;
    }
    *(_DWORD *)&v178[4 * v13 + 112] = v27[v28];
    unsigned int v29 = a7[v13 + 16];
    if (v29 >= 3) {
      unsigned int v29 = 3;
    }
    v177[v13++] = v27[v29];
  }
  while (v13 != 16);
  unsigned int v30 = *a7;
  uint64_t v172 = a3;
  if (v30 <= 0x3F)
  {
    if (a4 && v30 < 0x20)
    {
      int v31 = a4 - 1;
      uint64_t result = byte_221A3E850;
      if (a9)
      {
        uint64_t v32 = 0;
        unsigned int v33 = v147 + 1 + *(unsigned __int8 *)(v19 + v31 + v14 * (a5 & 0xFFFFFFFE));
        int v34 = v18 + (v33 >> 1);
        LODWORD(v35) = (v160 + (v33 >> 1)) & ~((int)(v160 + (v33 >> 1)) >> 31);
        if (v35 >= 0x33) {
          uint64_t v35 = 51;
        }
        else {
          uint64_t v35 = v35;
        }
        unsigned int v36 = v34 & ~(v34 >> 31);
        int v168 = byte_221A3E7D0[v35];
        if (v36 >= 0x33) {
          unsigned int v37 = 51;
        }
        else {
          unsigned int v37 = v36;
        }
        int v157 = byte_221A3E810[v37];
        do
        {
          unsigned int v38 = a7[v32];
          if (v38 >= 3) {
            unsigned int v38 = 3;
          }
          *((_DWORD *)&v179[6] + v32++) = byte_221A3E850[4 * v35 + v38];
        }
        while (v32 != 16);
        unsigned int v39 = v147 + 1 + *(unsigned __int8 *)(v19 + v31 + v14 * (a5 | 1u));
        int v40 = v160 + (v39 >> 1);
        int v41 = v159 + (v39 >> 1);
        unsigned int v42 = v40 & ~(v40 >> 31);
        if (v42 >= 0x33) {
          unsigned int v43 = 51;
        }
        else {
          unsigned int v43 = v42;
        }
        unsigned int v44 = v41 & ~(v41 >> 31);
        if (v44 >= 0x33) {
          unsigned int v44 = 51;
        }
        int v155 = byte_221A3E7D0[v43];
        int v45 = byte_221A3E810[v44];
      }
      else
      {
        uint64_t v46 = 0;
        unsigned int v47 = v147 + *(unsigned __int8 *)(v19 + (v31 + v15)) + 1;
        int v48 = v18 + (v47 >> 1);
        unsigned int v49 = (v160 + (v47 >> 1)) & ~((int)(v160 + (v47 >> 1)) >> 31);
        if (v49 >= 0x33) {
          uint64_t v35 = 51;
        }
        else {
          uint64_t v35 = v49;
        }
        int v168 = byte_221A3E7D0[v35];
        unsigned int v50 = v48 & ~(v48 >> 31);
        if (v50 >= 0x33) {
          unsigned int v50 = 51;
        }
        int v157 = byte_221A3E810[v50];
        do
        {
          unsigned int v51 = a7[v46];
          if (v51 >= 3) {
            unsigned int v51 = 3;
          }
          *((_DWORD *)&v179[6] + v46++) = byte_221A3E850[4 * v35 + v51];
        }
        while (v46 != 16);
        unsigned int v43 = v35;
        int v155 = v168;
        int v45 = v157;
      }
      int v154 = v45;
      if (a9 == 2)
      {
        unsigned int v146 = v43;
        uint64_t v52 = 0;
        uint64_t v165 = a6;
        int v174 = 4 * a6;
        char v53 = 1;
        int v148 = (char *)&byte_221A3E850[4 * v35];
        do
        {
          char v54 = v53;
          unsigned int v55 = &a7[2 * v52];
          unsigned int v56 = *v55;
          unsigned int v57 = v55[1];
          if (v57 | v56)
          {
            if (v57 >= 3) {
              unsigned int v58 = 3;
            }
            else {
              unsigned int v58 = v55[1];
            }
            int v59 = v148[v58];
            if (v56 >= 3) {
              unsigned int v60 = 3;
            }
            else {
              unsigned int v60 = v56;
            }
            int v61 = v148[v60];
            unint64_t v62 = (unsigned char *)(a3 + v52 * v174);
            sub_221A3151C(v62, 1, v56, v10, v168, v157, v61);
            int v63 = &v62[a6];
            sub_221A3151C(v63, 1, v56, v64, v168, v157, v61);
            sub_221A3151C(&v63[a6], 1, v57, v65, v168, v157, v59);
            uint64_t result = sub_221A3151C(&v63[a6 + a6], 1, v57, v66, v168, v157, v59);
            a3 = v172;
          }
          char v53 = 0;
          uint64_t v52 = 1;
        }
        while ((v54 & 1) != 0);
        uint64_t v67 = 0;
        int v68 = 8 * a6;
        int v150 = (char *)&byte_221A3E850[4 * v146];
        int v9 = a7;
        do
        {
          unsigned int v69 = a7[v67 + 32];
          unsigned int v70 = a7[v67 + 33];
          if (v70 | v69)
          {
            if (v70 >= 3) {
              unsigned int v71 = 3;
            }
            else {
              unsigned int v71 = a7[v67 + 33];
            }
            int v169 = v150[v71];
            if (v69 >= 3) {
              unsigned int v72 = 3;
            }
            else {
              unsigned int v72 = a7[v67 + 32];
            }
            int v158 = v150[v72];
            unsigned int v73 = (unsigned char *)(a3 + v68);
            sub_221A3151C(v73, 1, v69, v10, v155, v154, v158);
            int v74 = &v73[v165];
            sub_221A3151C(v74, 1, v69, v75, v155, v154, v158);
            sub_221A3151C(&v74[v165], 1, v70, v76, v155, v154, v169);
            uint64_t result = sub_221A3151C(&v74[v165 + v165], 1, v70, v77, v155, v154, v169);
            a3 = v172;
          }
          v67 += 2;
          v68 += v174;
        }
        while (v67 != 4);
      }
      else
      {
        int v78 = 0;
        uint64_t v79 = 0;
        int v174 = 4 * a6;
        uint64_t v165 = a6;
        int v149 = (char *)&byte_221A3E850[4 * v43];
        do
        {
          int v80 = v9[v79];
          int v81 = *((_DWORD *)&v179[6] + v79);
          unsigned int v82 = v80;
          int v83 = v81;
          if (v10 == 1)
          {
            unsigned int v82 = v9[v79 + 32];
            if (v82 >= 3) {
              unsigned int v84 = 3;
            }
            else {
              unsigned int v84 = v9[v79 + 32];
            }
            int v83 = v149[v84];
          }
          if (v82 | v80)
          {
            uint64_t v85 = (unsigned char *)(a3 + v78);
            sub_221A3151C(v85, 1, v9[v79], v10, v168, v157, *((_DWORD *)&v179[6] + v79));
            __int16 v86 = &v85[a6];
            sub_221A3151C(v86, 1, v82, v87, v155, v154, v83);
            unsigned int v88 = &v86[a6];
            sub_221A3151C(v88, 1, v80, v89, v168, v157, v81);
            uint64_t result = sub_221A3151C(&v88[a6], 1, v82, v90, v155, v154, v83);
            uint64_t v10 = a9;
            a3 = v172;
          }
          ++v79;
          v78 += v174;
        }
        while (v79 != 4);
      }
    }
    else
    {
      int v174 = 4 * a6;
      uint64_t v165 = a6;
    }
    int32x4_t v170 = v179;
    int v91 = v9 + 4;
    unint64_t v92 = 4;
    while (1)
    {
      unsigned int v93 = v9[v92];
      if (v93 == 4) {
        break;
      }
      if (v93 <= 0x1F) {
        goto LABEL_81;
      }
LABEL_85:
      v170 += 2;
      v91 += 4;
      BOOL v104 = v92 >= 0xC;
      v92 += 4;
      int v9 = a7;
      if (v104) {
        goto LABEL_87;
      }
    }
    v9[v92 | 1] = 4;
    v9[v92 | 2] = 4;
    v9[v92 | 3] = 4;
LABEL_81:
    int v94 = 0;
    for (uint64_t j = 0; j != 4; ++j)
    {
      int v96 = v91[j];
      if (v91[j])
      {
        int v97 = *((_DWORD *)v170 + j);
        char v98 = (unsigned char *)(a3 + v92 + v94);
        sub_221A3151C(v98, 1, v91[j], v10, v176, v26, v97);
        unsigned int v99 = &v98[v165];
        sub_221A3151C(v99, 1, v96, v100, v176, v26, v97);
        __int16 v101 = &v99[v165];
        sub_221A3151C(v101, 1, v96, v102, v176, v26, v97);
        uint64_t result = sub_221A3151C(&v101[v165], 1, v96, v103, v176, v26, v97);
        a3 = v172;
      }
      v94 += v174;
    }
    goto LABEL_85;
  }
LABEL_87:
  unsigned int v105 = v163;
  unsigned int v106 = *v163;
  if (v106 <= 0x3F)
  {
    unsigned int v107 = a8;
    if (a5 && v106 <= 0x1F)
    {
      int v108 = 0;
      unsigned int v171 = 0;
      uint8x16_t v156 = v9 + 36;
      int v109 = a6 << (a8 != 0);
      do
      {
        int v166 = v108;
        if (v107)
        {
          if ((v108 + a5) < 2) {
            int v110 = 0;
          }
          else {
            int v110 = *(unsigned __int8 *)(*((void *)v152 + 14)
          }
                                      + (a4 + *((_DWORD *)v152 + 3) * (a5 - 2 + v108)));
          if (v108) {
            unsigned int v105 = v156;
          }
        }
        else
        {
          uint64_t v111 = *((void *)v152 + 18);
          if (*(unsigned char *)(v111 + v151) != 2)
          {
            uint64_t v114 = *((void *)v152 + 14);
            int v112 = *((_DWORD *)v152 + 3);
            int v115 = a4;
            unsigned int v116 = a5 - 1;
LABEL_103:
            int v110 = *(unsigned __int8 *)(v114 + v115 + v112 * v116);
            goto LABEL_105;
          }
          if (a5 >= 2)
          {
            int v112 = *((_DWORD *)v152 + 3);
            int v113 = *(unsigned __int8 *)(v111 + (v151 - 2 * v112));
            uint64_t v114 = *((void *)v152 + 14);
            if (v113 == 2)
            {
              int v115 = a4;
              unsigned int v116 = a5 - 2;
            }
            else
            {
              int v115 = a4;
              unsigned int v116 = (a5 & 0xFFFFFFFE) - 1;
            }
            goto LABEL_103;
          }
          int v110 = 0;
        }
LABEL_105:
        uint64_t v117 = 0;
        unsigned int v118 = v147 + 1 + v110;
        int v119 = v159 + (v118 >> 1);
        LODWORD(v120) = (v160 + (v118 >> 1)) & ~((int)(v160 + (v118 >> 1)) >> 31);
        if (v120 >= 0x33) {
          uint64_t v120 = 51;
        }
        else {
          uint64_t v120 = v120;
        }
        unsigned int v121 = v119 & ~(v119 >> 31);
        if (v121 >= 0x33) {
          unsigned int v121 = 51;
        }
        int v122 = byte_221A3E7D0[v120];
        int v123 = byte_221A3E810[v121];
        do
        {
          unsigned int v124 = v105[v117];
          if (v124 >= 3) {
            unsigned int v124 = 3;
          }
          *(_DWORD *)&v178[4 * v117++ + 48] = byte_221A3E850[4 * v120 + v124];
        }
        while (v117 != 16);
        unsigned int v125 = *v105;
        if (v125 == 4)
        {
          *(_WORD *)(v105 + 1) = 1028;
          v105[3] = 4;
LABEL_117:
          uint64_t v126 = 0;
          unsigned int v127 = v171;
          do
          {
            int v128 = v105[v126];
            if (v105[v126])
            {
              int v129 = *(_DWORD *)&v178[4 * v126 + 48];
              unsigned int v130 = (unsigned char *)(a3 + v127);
              sub_221A3151C(v130, v109, v105[v126], v10, v122, v123, v129);
              sub_221A3151C(v130 + 1, v109, v128, v131, v122, v123, v129);
              sub_221A3151C(v130 + 2, v109, v128, v132, v122, v123, v129);
              uint64_t result = sub_221A3151C(v130 + 3, v109, v128, v133, v122, v123, v129);
              a3 = v172;
            }
            ++v126;
            v127 += 4;
          }
          while (v126 != 4);
          goto LABEL_121;
        }
        if (v125 <= 0x1F) {
          goto LABEL_117;
        }
LABEL_121:
        v171 += a6;
        int v108 = v166 + 1;
        unsigned int v107 = a8;
        unsigned int v105 = v163;
        int v9 = a7;
      }
      while (v166 + 1 <= a8);
    }
    uint64_t v134 = a3 + 4 * a6;
    char v135 = v178;
    int v175 = v9 + 20;
    uint64_t v136 = 4;
    while (1)
    {
      unsigned int v137 = v105[v136];
      unint64_t v173 = v136;
      if (v137 == 4) {
        break;
      }
      if (v137 <= 0x1F) {
        goto LABEL_128;
      }
LABEL_132:
      v134 += 4 * a6;
      v135 += 16;
      v175 += 4;
      uint64_t v136 = v173 + 4;
      unsigned int v105 = v163;
      if (v173 >= 0xC) {
        return result;
      }
    }
    v105[v136 | 1] = 4;
    v105[v136 | 2] = 4;
    v105[v136 | 3] = 4;
LABEL_128:
    uint64_t v138 = 0;
    unsigned int v139 = v175;
    do
    {
      int v141 = *v139++;
      int v140 = v141;
      if (v141)
      {
        int v142 = *(_DWORD *)&v135[v138];
        sub_221A3151C((unsigned char *)(v134 + v138), a6, v140, v10, v176, v26, v142);
        sub_221A3151C((unsigned char *)(v134 + v138 + 1), a6, v140, v143, v176, v26, v142);
        sub_221A3151C((unsigned char *)(v134 + v138 + 2), a6, v140, v144, v176, v26, v142);
        uint64_t result = sub_221A3151C((unsigned char *)(v134 + v138 + 3), a6, v140, v145, v176, v26, v142);
      }
      v138 += 4;
    }
    while (v138 != 16);
    goto LABEL_132;
  }
  return result;
}

unsigned char *sub_221A3233C(unsigned char *result, int a2, int a3, uint64_t a4, int a5, int a6, int a7, uint64_t a8, int a9, int a10, int a11)
{
  if (a3)
  {
    int v11 = result[-3 * a2];
    int v12 = result[a2];
    int v13 = result[-a2];
    int v14 = result[3 * a2];
    int v15 = *result;
    int v16 = result[-2 * a2];
    if ((v16 - v15) * (v16 - v15) < (a5 * a5))
    {
      int v17 = result[-4 * a2];
      unsigned int v18 = a6 * a6;
      if ((v17 - v16) * (v17 - v16) < v18)
      {
        int v19 = result[2 * a2];
        if ((v19 - v15) * (v19 - v15) < v18)
        {
          if (a3 == 4)
          {
            unsigned int v20 = (v19 + 2 * v17 + v16 + 2) >> 2;
            unsigned int v21 = (v17 + 2 * v19 + v15 + 2) >> 2;
          }
          else
          {
            int v22 = (v17 - v19 + 4 * (v15 - v16) + 4) >> 3;
            if (v22 <= ~a7) {
              int v23 = ~a7;
            }
            else {
              int v23 = v22;
            }
            if (v22 > a7 + 1) {
              int v24 = a7 + 1;
            }
            else {
              int v24 = v23;
            }
            unsigned int v20 = (v24 + v16) & ~((v24 + v16) >> 31);
            if (v20 >= 0xFF) {
              LOBYTE(v20) = -1;
            }
            unsigned int v21 = (v15 - v24) & ~((v15 - v24) >> 31);
            if (v21 >= 0xFF) {
              LOBYTE(v21) = -1;
            }
          }
          result[-2 * a2] = v20;
          *uint64_t result = v21;
        }
      }
    }
    if ((v13 - v12) * (v13 - v12) < (a9 * a9)
      && (v11 - v13) * (v11 - v13) < (a10 * a10)
      && (v14 - v12) * (v14 - v12) < (a10 * a10))
    {
      int v25 = (v11 - v14 + 4 * (v12 - v13) + 4) >> 3;
      if (v25 <= ~a11) {
        int v26 = ~a11;
      }
      else {
        int v26 = (v11 - v14 + 4 * (v12 - v13) + 4) >> 3;
      }
      if (v25 > a11 + 1) {
        int v27 = a11 + 1;
      }
      else {
        int v27 = v26;
      }
      unsigned int v28 = (v27 + v13) & ~((v27 + v13) >> 31);
      if (v28 >= 0xFF) {
        LOBYTE(v28) = -1;
      }
      unsigned int v29 = (v12 - v27) & ~((v12 - v27) >> 31);
      if (v29 >= 0xFF) {
        LOBYTE(v29) = -1;
      }
      unsigned int v30 = (v13 + 2 * v11 + v14 + 2) >> 2;
      unsigned int v31 = (v11 + v12 + 2 * v14 + 2) >> 2;
      if (a3 == 4) {
        char v32 = v30;
      }
      else {
        char v32 = v28;
      }
      if (a3 != 4) {
        LOBYTE(v31) = v29;
      }
      result[-a2] = v32;
      result[a2] = v31;
    }
  }
  return result;
}

unsigned char *sub_221A32514(unsigned char *result, int a2, int a3, uint64_t a4, int a5, int a6, int a7)
{
  if (a3)
  {
    int v7 = *result;
    int v8 = result[-a2];
    if ((v8 - v7) * (v8 - v7) < (a5 * a5))
    {
      int v9 = result[-2 * a2];
      if ((v9 - v8) * (v9 - v8) < (a6 * a6))
      {
        int v10 = result[a2];
        if ((v10 - v7) * (v10 - v7) < (a6 * a6))
        {
          int v11 = (v9 - v10 + 4 * (v7 - v8) + 4) >> 3;
          if (v11 <= ~a7) {
            int v12 = ~a7;
          }
          else {
            int v12 = (v9 - v10 + 4 * (v7 - v8) + 4) >> 3;
          }
          if (v11 > a7 + 1) {
            int v13 = a7 + 1;
          }
          else {
            int v13 = v12;
          }
          unsigned int v14 = (v13 + v8) & ~((v13 + v8) >> 31);
          if (v14 >= 0xFF) {
            LOBYTE(v14) = -1;
          }
          unsigned int v15 = (v7 - v13) & ~((v7 - v13) >> 31);
          if (v15 >= 0xFF) {
            LOBYTE(v15) = -1;
          }
          unsigned int v16 = (v10 + 2 * v9 + v8 + 2) >> 2;
          unsigned int v17 = (v9 + 2 * v10 + v7 + 2) >> 2;
          if (a3 != 4)
          {
            LOBYTE(v16) = v14;
            LOBYTE(v17) = v15;
          }
          result[-a2] = v16;
          *uint64_t result = v17;
        }
      }
    }
  }
  return result;
}

unint64_t sub_221A325F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, unsigned __int8 *a7, unsigned __int8 *a8, int a9)
{
  uint64_t v9 = a3;
  uint64_t v214 = *MEMORY[0x263EF8340];
  if (a2 != a3)
  {
    uint64_t v10 = 0;
    for (unsigned int i = 9; i > 1; --i)
    {
      *(_OWORD *)(a3 + v10) = *(_OWORD *)(a2 + v10);
      v10 += a6;
    }
  }
  uint64_t v12 = 0;
  int v13 = *(_DWORD *)(a1 + 12);
  uint64_t v174 = v13 * a5 + a4;
  uint64_t v14 = *(void *)(a1 + 48) + 12 * *(unsigned __int16 *)(*(void *)(a1 + 72) + 2 * v174);
  int v15 = *(char *)(v14 + 10);
  unsigned int v16 = *(char *)(v14 + 11);
  uint64_t v18 = *(void *)(a1 + 120);
  uint64_t v17 = *(void *)(a1 + 128);
  int v19 = *(unsigned __int8 *)(v18 + (v13 * a5 + a4));
  int v20 = *(unsigned __int8 *)(v17 + (v13 * a5 + a4));
  int v21 = v19 + v15;
  int v175 = v19;
  int v22 = v19 + v16;
  int v23 = v20 + v15;
  int v173 = v20;
  int v24 = v20 + v16;
  unsigned int v25 = v21 & ~(v21 >> 31);
  if (v25 >= 0x33) {
    uint64_t v26 = 51;
  }
  else {
    uint64_t v26 = v25;
  }
  if ((v22 & ~(v22 >> 31)) >= 0x33) {
    int v27 = 51;
  }
  else {
    int v27 = v22 & ~(v22 >> 31);
  }
  LODWORD(v28) = v23 & ~(v23 >> 31);
  if (v28 >= 0x33) {
    uint64_t v28 = 51;
  }
  else {
    uint64_t v28 = v28;
  }
  int v188 = byte_221A3E810[v27];
  int v189 = byte_221A3E7D0[v26];
  if ((v24 & ~(v24 >> 31)) >= 0x33) {
    int v29 = 51;
  }
  else {
    int v29 = v24 & ~(v24 >> 31);
  }
  int v186 = byte_221A3E810[v29];
  int v187 = byte_221A3E7D0[v28];
  unsigned int v183 = a7 + 16;
  unsigned int v30 = &byte_221A3E850[4 * v26];
  do
  {
    unsigned int v31 = a7[v12 + 8];
    if (v31 >= 3) {
      unsigned int v31 = 3;
    }
    v213[v12 + 104] = v30[v31];
    unsigned int v32 = a7[v12 + 24];
    if (v32 >= 3) {
      unsigned int v32 = 3;
    }
    v213[v12++ + 72] = v30[v32];
  }
  while (v12 != 4);
  unsigned int v179 = v16;
  int v180 = v15;
  unsigned int v181 = a8;
  uint64_t v33 = 0;
  int v34 = &byte_221A3E850[4 * v28];
  do
  {
    unsigned int v35 = a7[v33 + 8];
    if (v35 >= 3) {
      unsigned int v35 = 3;
    }
    v213[v33 + 40] = v34[v35];
    unsigned int v36 = a7[v33 + 24];
    if (v36 >= 3) {
      unsigned int v36 = 3;
    }
    unint64_t result = (unint64_t)&v213[v33];
    *(_DWORD *)(result + 32) = v34[v36];
    ++v33;
  }
  while (v33 != 4);
  unsigned int v38 = *a7;
  if (v38 <= 0x3F)
  {
    if (a4 && v38 <= 0x1F)
    {
      int v39 = a4 - 1;
      uint64_t v40 = 0;
      if (a9)
      {
        uint64_t v41 = v39 + v13 * (a5 & 0xFFFFFFFE);
        unsigned int v42 = v175 + 1 + *(unsigned __int8 *)(v18 + v41);
        int v43 = v16 + (v42 >> 1);
        LODWORD(v44) = (v15 + (v42 >> 1)) & ~((int)(v15 + (v42 >> 1)) >> 31);
        if (v44 >= 0x33) {
          uint64_t v44 = 51;
        }
        else {
          uint64_t v44 = v44;
        }
        unsigned int v45 = v43 & ~(v43 >> 31);
        a8 = byte_221A3E7D0;
        int v204 = byte_221A3E7D0[v44];
        if (v45 >= 0x33) {
          int v46 = 51;
        }
        else {
          int v46 = v45;
        }
        int v201 = byte_221A3E810[v46];
        do
        {
          unsigned int v47 = a7[v40];
          if (v47 >= 3) {
            unsigned int v47 = 3;
          }
          v213[v40++ + 112] = byte_221A3E850[4 * v44 + v47];
        }
        while (v40 != 4);
        uint64_t v48 = 0;
        unsigned int v49 = v173 + 1 + *(unsigned __int8 *)(v17 + v41);
        int v50 = v16 + (v49 >> 1);
        LODWORD(v51) = (v15 + (v49 >> 1)) & ~((int)(v15 + (v49 >> 1)) >> 31);
        if (v51 >= 0x33) {
          uint64_t v51 = 51;
        }
        else {
          uint64_t v51 = v51;
        }
        unsigned int v52 = v50 & ~(v50 >> 31);
        int v199 = byte_221A3E7D0[v51];
        if (v52 >= 0x33) {
          int v53 = 51;
        }
        else {
          int v53 = v52;
        }
        int v197 = byte_221A3E810[v53];
        unint64_t result = (unint64_t)&byte_221A3E850[4 * v51];
        do
        {
          unsigned int v54 = a7[v48];
          if (v54 >= 3) {
            unsigned int v54 = 3;
          }
          v213[v48++ + 48] = *(unsigned __int8 *)(result + v54);
        }
        while (v48 != 4);
        unsigned int v55 = v39 + v13 * (a5 | 1);
        unsigned int v56 = v175 + 1 + *(unsigned __int8 *)(v18 + v55);
        int v57 = v15 + (v56 >> 1);
        int v58 = v16 + (v56 >> 1);
        unsigned int v59 = v57 & ~(v57 >> 31);
        if (v59 >= 0x33) {
          int v60 = 51;
        }
        else {
          int v60 = v59;
        }
        unsigned int v61 = v58 & ~(v58 >> 31);
        if (v61 >= 0x33) {
          unsigned int v61 = 51;
        }
        int v194 = byte_221A3E810[v61];
        int v195 = byte_221A3E7D0[v60];
        unsigned int v62 = v173 + 1 + *(unsigned __int8 *)(v17 + v55);
        int v63 = v15 + (v62 >> 1);
        int v64 = v16 + (v62 >> 1);
        unsigned int v65 = v63 & ~(v63 >> 31);
        if (v65 >= 0x33) {
          int v66 = 51;
        }
        else {
          int v66 = v65;
        }
        unsigned int v67 = v64 & ~(v64 >> 31);
        if (v67 >= 0x33) {
          unsigned int v67 = 51;
        }
        int v192 = byte_221A3E7D0[v66];
        int v68 = byte_221A3E810[v67];
      }
      else
      {
        uint64_t v69 = (v39 + v13 * a5);
        unsigned int v70 = v175 + *(unsigned __int8 *)(v18 + v69) + 1;
        unint64_t result = v16;
        int v71 = v16 + (v70 >> 1);
        LODWORD(v44) = (v15 + (v70 >> 1)) & ~((int)(v15 + (v70 >> 1)) >> 31);
        if (v44 >= 0x33) {
          uint64_t v44 = 51;
        }
        else {
          uint64_t v44 = v44;
        }
        int v204 = byte_221A3E7D0[v44];
        unsigned int v72 = v71 & ~(v71 >> 31);
        if (v72 >= 0x33) {
          unsigned int v72 = 51;
        }
        int v201 = byte_221A3E810[v72];
        do
        {
          unsigned int v73 = a7[v40];
          if (v73 >= 3) {
            unsigned int v73 = 3;
          }
          v213[v40++ + 112] = byte_221A3E850[4 * v44 + v73];
        }
        while (v40 != 4);
        uint64_t v74 = 0;
        unsigned int v75 = v173 + *(unsigned __int8 *)(v17 + v69) + 1;
        int v76 = v16 + (v75 >> 1);
        unsigned int v77 = (v15 + (v75 >> 1)) & ~((int)(v15 + (v75 >> 1)) >> 31);
        if (v77 >= 0x33) {
          uint64_t v51 = 51;
        }
        else {
          uint64_t v51 = v77;
        }
        int v199 = byte_221A3E7D0[v51];
        unsigned int v78 = v76 & ~(v76 >> 31);
        if (v78 >= 0x33) {
          int v79 = 51;
        }
        else {
          int v79 = v78;
        }
        int v197 = byte_221A3E810[v79];
        do
        {
          unsigned int v80 = a7[v74];
          if (v80 >= 3) {
            unsigned int v80 = 3;
          }
          v213[v74++ + 48] = byte_221A3E850[4 * v51 + v80];
        }
        while (v74 != 4);
        int v60 = v44;
        int v66 = v51;
        int v192 = v199;
        int v194 = v201;
        int v195 = v204;
        int v68 = v197;
      }
      int v184 = v68;
      if (a9 == 2)
      {
        int v171 = v66;
        int v172 = v60;
        uint64_t v81 = 0;
        uint64_t v210 = 2 * a6;
        char v82 = 1;
        unsigned int v177 = &byte_221A3E850[4 * v51];
        int v83 = &byte_221A3E850[4 * v44];
        do
        {
          char v84 = v82;
          uint64_t v85 = &a7[2 * v81];
          unsigned int v86 = *v85;
          unsigned int v87 = v85[1];
          if (v87 | v86)
          {
            if (v87 >= 3) {
              unsigned int v88 = 3;
            }
            else {
              unsigned int v88 = v85[1];
            }
            int v89 = v177[v88];
            int v90 = v83[v88];
            if (v86 >= 3) {
              unsigned int v91 = 3;
            }
            else {
              unsigned int v91 = v86;
            }
            unint64_t v92 = (unsigned char *)(v9 + v81 * v210);
            sub_221A3233C(v92, 1, v86, v9, v204, v201, v83[v91], (uint64_t)a8, v199, v197, v177[v91]);
            unint64_t result = (unint64_t)sub_221A3233C(&v92[a6], 1, v87, v93, v204, v201, v90, v94, v199, v197, v89);
            uint64_t v9 = a3;
          }
          char v82 = 0;
          uint64_t v81 = 1;
        }
        while ((v84 & 1) != 0);
        uint64_t v95 = 0;
        int v96 = 4 * a6;
        unsigned int v202 = &byte_221A3E850[4 * v172];
        BOOL v205 = &byte_221A3E850[4 * v171];
        do
        {
          unsigned int v97 = a7[v95 + 32];
          unsigned int v98 = a7[v95 + 33];
          if (v98 | v97)
          {
            if (v98 >= 3) {
              unsigned int v99 = 3;
            }
            else {
              unsigned int v99 = a7[v95 + 33];
            }
            int v100 = v205[v99];
            int v101 = v202[v99];
            if (v97 >= 3) {
              unsigned int v102 = 3;
            }
            else {
              unsigned int v102 = a7[v95 + 32];
            }
            uint64_t v103 = (unsigned char *)(v9 + v96);
            sub_221A3233C(v103, 1, v97, v9, v195, v194, v202[v102], (uint64_t)a8, v192, v184, v205[v102]);
            unint64_t result = (unint64_t)sub_221A3233C(&v103[a6], 1, v98, v104, v195, v194, v101, v105, v192, v184, v100);
            uint64_t v9 = a3;
          }
          v95 += 2;
          v96 += v210;
        }
        while (v95 != 4);
      }
      else
      {
        int v106 = 0;
        uint64_t v107 = 0;
        int v108 = &byte_221A3E850[4 * v66];
        int v109 = &byte_221A3E850[4 * v60];
        do
        {
          int v110 = a7[v107];
          unsigned int v111 = v110;
          if (a9 == 1) {
            unsigned int v111 = a7[v107 + 32];
          }
          if (v111 | v110)
          {
            if (v111 >= 3) {
              unsigned int v112 = 3;
            }
            else {
              unsigned int v112 = v111;
            }
            int v113 = v108[v112];
            int v114 = v109[v112];
            int v115 = (unsigned char *)(v9 + v106);
            sub_221A3233C(v115, 1, v110, v9, v204, v201, v213[v107 + 112], (uint64_t)a8, v199, v197, v213[v107 + 48]);
            unint64_t result = (unint64_t)sub_221A3233C(&v115[a6], 1, v111, v116, v195, v194, v114, v117, v192, v184, v113);
            uint64_t v9 = a3;
          }
          ++v107;
          v106 += 2 * a6;
        }
        while (v107 != 4);
      }
    }
    unsigned int v118 = a7[8];
    if (v118 == 4)
    {
      *(_WORD *)(a7 + 9) = 1028;
      a7[11] = 4;
    }
    else if (v118 > 0x1F)
    {
      goto LABEL_121;
    }
    uint64_t v119 = 0;
    int v206 = a7 + 8;
    int v120 = 8;
    do
    {
      int v121 = v206[v119];
      if (v206[v119])
      {
        int v122 = v213[v119 + 40];
        int v123 = v213[v119 + 104];
        unsigned int v124 = (unsigned char *)(v9 + v120);
        sub_221A3233C(v124, 1, v121, v9, v189, v188, v123, (uint64_t)a8, v187, v186, v122);
        unint64_t result = (unint64_t)sub_221A3233C(&v124[a6], 1, v121, v125, v189, v188, v123, v126, v187, v186, v122);
        uint64_t v9 = a3;
      }
      ++v119;
      v120 += 2 * a6;
    }
    while (v119 != 4);
  }
LABEL_121:
  unsigned int v127 = *v183;
  if (v127 > 0x3F) {
    return result;
  }
  unsigned int v128 = v181;
  if (a5 && v127 <= 0x1F)
  {
    LODWORD(result) = 0;
    unsigned int v193 = 0;
    int v129 = a6 << (v181 != 0);
    while (1)
    {
      int v185 = result;
      if (v128)
      {
        unsigned int v131 = v179;
        int v130 = v180;
        if ((result + a5) < 2)
        {
          int v133 = 0;
          int v134 = 0;
        }
        else
        {
          unsigned int v132 = a4 + *(_DWORD *)(a1 + 12) * (a5 - 2 + result);
          int v133 = *(unsigned __int8 *)(*(void *)(a1 + 120) + v132);
          int v134 = *(unsigned __int8 *)(*(void *)(a1 + 128) + v132);
        }
        if (result) {
          uint64_t v138 = a7 + 36;
        }
        else {
          uint64_t v138 = v183;
        }
      }
      else
      {
        uint64_t v135 = *(void *)(a1 + 144);
        unsigned int v131 = v179;
        int v130 = v180;
        if (*(unsigned char *)(v135 + v174) == 2)
        {
          if (a5 < 2)
          {
            int v133 = 0;
            int v134 = 0;
          }
          else
          {
            int v136 = *(_DWORD *)(a1 + 12);
            if (*(unsigned char *)(v135 + (v174 - 2 * v136)) == 2) {
              unsigned int v137 = a5 - 2;
            }
            else {
              unsigned int v137 = (a5 & 0xFFFFFFFE) - 1;
            }
            unsigned int v140 = a4 + v136 * v137;
            int v133 = *(unsigned __int8 *)(*(void *)(a1 + 120) + v140);
            int v134 = *(unsigned __int8 *)(*(void *)(a1 + 128) + v140);
          }
        }
        else
        {
          unsigned int v139 = a4 + *(_DWORD *)(a1 + 12) * (a5 - 1);
          int v133 = *(unsigned __int8 *)(*(void *)(a1 + 120) + v139);
          int v134 = *(unsigned __int8 *)(*(void *)(a1 + 128) + v139);
        }
        uint64_t v138 = v183;
      }
      uint64_t v141 = 0;
      unsigned int v142 = v175 + 1 + v133;
      int v143 = v131 + (v142 >> 1);
      LODWORD(v144) = (v130 + (v142 >> 1)) & ~((int)(v130 + (v142 >> 1)) >> 31);
      if (v144 >= 0x33) {
        uint64_t v144 = 51;
      }
      else {
        uint64_t v144 = v144;
      }
      unsigned int v145 = v143 & ~(v143 >> 31);
      if (v145 >= 0x33) {
        unsigned int v145 = 51;
      }
      int v207 = byte_221A3E7D0[v144];
      int v203 = byte_221A3E810[v145];
      do
      {
        unsigned int v146 = v138[v141];
        if (v146 >= 3) {
          unsigned int v146 = 3;
        }
        v213[v141++ + 80] = byte_221A3E850[4 * v144 + v146];
      }
      while (v141 != 4);
      uint64_t v147 = 0;
      unsigned int v148 = v173 + 1 + v134;
      int v149 = v131 + (v148 >> 1);
      LODWORD(v150) = (v130 + (v148 >> 1)) & ~((int)(v130 + (v148 >> 1)) >> 31);
      if (v150 >= 0x33) {
        uint64_t v150 = 51;
      }
      else {
        uint64_t v150 = v150;
      }
      unsigned int v151 = v149 & ~(v149 >> 31);
      if (v151 >= 0x33) {
        unsigned int v151 = 51;
      }
      int v200 = byte_221A3E7D0[v150];
      int v198 = byte_221A3E810[v151];
      do
      {
        unsigned int v152 = v138[v147];
        if (v152 >= 3) {
          unsigned int v152 = 3;
        }
        v213[v147++ + 16] = byte_221A3E850[4 * v150 + v152];
      }
      while (v147 != 4);
      unsigned int v153 = *v138;
      if (v153 == 4) {
        break;
      }
      if (v153 <= 0x1F) {
        goto LABEL_162;
      }
LABEL_166:
      v193 += a6;
      unint64_t result = (v185 + 1);
      unsigned int v128 = v181;
      if (result > v181) {
        goto LABEL_167;
      }
    }
    *(_WORD *)(v138 + 1) = 1028;
    v138[3] = 4;
LABEL_162:
    uint64_t v154 = 0;
    unsigned int v155 = v193;
    __int16 v196 = v138;
    do
    {
      int v156 = v138[v154];
      if (v138[v154])
      {
        int v157 = v213[v154 + 16];
        int v211 = v213[v154 + 80];
        int v158 = (unsigned char *)(v9 + v155);
        sub_221A32514(v158, v129, v156, v9, v207, v203, v211);
        sub_221A32514(v158 + 1, v129, v156, v159, v200, v198, v157);
        sub_221A32514(v158 + 2, v129, v156, v160, v207, v203, v211);
        sub_221A32514(v158 + 3, v129, v156, v161, v200, v198, v157);
        uint64_t v138 = v196;
        uint64_t v9 = a3;
      }
      ++v154;
      v155 += 4;
    }
    while (v154 != 4);
    goto LABEL_166;
  }
LABEL_167:
  unsigned int v162 = a7[24];
  if (v162 == 4)
  {
    *(_WORD *)(a7 + 25) = 1028;
    a7[27] = 4;
  }
  else if (v162 > 0x1F)
  {
    return result;
  }
  uint64_t v163 = 0;
  __int16 v208 = a7 + 24;
  int v164 = 4 * a6;
  do
  {
    int v165 = v208[v163];
    if (v208[v163])
    {
      int v166 = v213[v163 + 8];
      int v212 = v213[v163 + 72];
      unint64_t v167 = (unsigned char *)(v9 + v164);
      sub_221A32514(v167, a6, v165, v9, v189, v188, v212);
      sub_221A32514(v167 + 1, a6, v165, v168, v187, v186, v166);
      sub_221A32514(v167 + 2, a6, v165, v169, v189, v188, v212);
      unint64_t result = (unint64_t)sub_221A32514(v167 + 3, a6, v165, v170, v187, v186, v166);
      uint64_t v9 = a3;
    }
    ++v163;
    v164 += 4;
  }
  while (v163 != 4);
  return result;
}

uint64_t sub_221A33328(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned char **)a1;
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 >= 1 && v3 != 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = *(void **)(a1 + 48);
    if (*v3 || v3[1]) {
      goto LABEL_10;
    }
    if (v3[2] == 1)
    {
      int v16 = -3;
      uint64_t v17 = 3;
    }
    else
    {
      if (v3[2] || v3[3] != 1)
      {
LABEL_10:
        void *v8 = v3;
        goto LABEL_11;
      }
      int v16 = -4;
      uint64_t v17 = 4;
    }
    v3 += v17;
    v4 += v16;
    void *v8 = v3;
    if (v4 < 1)
    {
      int v11 = 1;
LABEL_21:
      uint64_t result = 0;
      int v13 = v4 + v3 - v8[v11 - 1];
      *(_DWORD *)(v7 + 4 * (v11 - 1)) = v13;
      if (v13) {
        int v14 = v11;
      }
      else {
        int v14 = v11 - 1;
      }
      *(_DWORD *)(a1 + 32) = v14;
      if (a2 && v14 >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          *(_DWORD *)(*(void *)(a1 + 40) + 4 * v15) = sub_2219F373C(*(void *)(*(void *)(a1 + 48) + 8 * v15), *(_DWORD *)(*(void *)(a1 + 40) + 4 * v15));
          ++v15;
        }
        while (v15 < *(int *)(a1 + 32));
        return 0;
      }
      return result;
    }
LABEL_11:
    LODWORD(v9) = 0;
    int v10 = 0;
    int v11 = 1;
    do
    {
      uint64_t v12 = (int)v9;
      if (v10 >= 2 && v3[(int)v9] == 1)
      {
        uint64_t v9 = (int)v9 + 1;
        if ((int)v12 + 1 >= v4 || v11 >= *(_DWORD *)(a1 + 36)) {
          return 4294958327;
        }
        v8[v11] = &v3[v9];
        *(_DWORD *)(v7 + 4 * (v11 - 1)) = v3 + v9 - v8[v11 - 1] + ~v10;
        ++v11;
        uint64_t v12 = v9;
        int v10 = 0;
      }
      if (v3[v12]) {
        int v10 = 0;
      }
      else {
        ++v10;
      }
      LODWORD(v9) = v9 + 1;
    }
    while ((int)v9 < v4);
    goto LABEL_21;
  }
  *(_DWORD *)(a1 + 32) = 0;
  return 4294958327;
}

uint64_t sub_221A334B0(uint64_t a1, unsigned int a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v6 = *(unsigned int **)a1;
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  if (*(void *)a1) {
    BOOL v8 = v7 > a2;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8 || v7 > a3) {
    goto LABEL_9;
  }
  unint64_t v13 = 0;
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  int v16 = (char *)v6 + v7;
  char v17 = 1;
  while (1)
  {
    if (a2 == 4)
    {
      unsigned int v18 = bswap32(*v6);
      goto LABEL_18;
    }
    if (a2 == 2)
    {
      unsigned int v18 = bswap32(*(unsigned __int16 *)v6) >> 16;
      goto LABEL_18;
    }
    if (a2 != 1) {
      break;
    }
    unsigned int v18 = *(unsigned __int8 *)v6;
LABEL_18:
    int v19 = (char *)v6 + v18 + a2;
    BOOL v20 = v19 <= v16 && v19 - 1 >= (char *)v6;
    if (!v20) {
      goto LABEL_9;
    }
    uint64_t v10 = 0;
    int v21 = (char *)v6 + a2;
    *(void *)(v14 + 8 * v13) = v21;
    *(_DWORD *)(v15 + 4 * v13) = v18;
    uint64_t v22 = v18;
    int v23 = v13 + 1;
    uint64_t v6 = (unsigned int *)&v21[v22];
    if ((char *)v6 + a2 <= v16)
    {
      BOOL v20 = v13++ >= 0x18F;
      if (!v20) {
        continue;
      }
    }
    goto LABEL_28;
  }
  char v17 = 0;
  uint64_t v10 = 4294958327;
  int v23 = v13;
LABEL_28:
  *(_DWORD *)(a1 + 32) = v23;
  if (a4)
  {
    if (v23 >= 1)
    {
      uint64_t v24 = 0;
      while (1)
      {
        unsigned int v25 = *(_DWORD *)(*(void *)(a1 + 40) + 4 * v24);
        if ((v25 & 0x80000000) != 0) {
          break;
        }
        int v26 = sub_2219F373C(*(void *)(*(void *)(a1 + 48) + 8 * v24), v25);
        *(_DWORD *)(*(void *)(a1 + 40) + 4 * v24) = v26;
        if (a5) {
          *(_DWORD *)(a5 + 4 * v24) = v26;
        }
        if (++v24 >= *(int *)(a1 + 32)) {
          goto LABEL_40;
        }
      }
LABEL_9:
      uint64_t v10 = 4294958327;
LABEL_10:
      *(_DWORD *)(a1 + 32) = 0;
      return v10;
    }
  }
  else if (a5 && v23 >= 1)
  {
    uint64_t v27 = 0;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 40) + 4 * v27) = *(_DWORD *)(a5 + 4 * v27);
      ++v27;
    }
    while (v27 < *(int *)(a1 + 32));
  }
LABEL_40:
  if ((v17 & 1) == 0) {
    goto LABEL_10;
  }
  return 0;
}

uint64_t sub_221A33638(uint64_t a1)
{
  v1 = *(unsigned int **)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    LODWORD(v5) = 0;
    uint64_t v4 = 4294958327;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    BOOL v8 = (unsigned int *)((char *)v1 + v2);
    while (v1[1] == 1986688113)
    {
      unsigned int v10 = *v1;
      uint64_t v9 = v1 + 2;
      *(void *)(v6 + 8 * v5) = v9;
      uint64_t v11 = bswap32(v10) - 8;
      *(_DWORD *)(v7 + 4 * v5++) = v11;
      v1 = (unsigned int *)((char *)v9 + v11);
      if (v1 >= v8) {
        goto LABEL_11;
      }
    }
    *(void *)(v6 + 8 * v5) = 0;
    *(_DWORD *)(v7 + 4 * v5) = 0;
LABEL_11:
    uint64_t v4 = 0;
  }
  *(_DWORD *)(a1 + 32) = v5;
  return v4;
}

uint64_t sub_221A336B8(uint64_t a1)
{
  return 0;
}

dispatch_semaphore_t *sub_221A336EC(uint64_t a1)
{
  for (unsigned int i = *(dispatch_semaphore_t **)(a1 + 16); ; unsigned int i = *(dispatch_semaphore_t **)(a1 + 16))
  {
    sub_221A34338(i);
    BOOL v3 = *(void (**)(void))(a1 + 40);
    if (!v3) {
      break;
    }
    v3(*(void *)(a1 + 48));
    sub_221A34344(*(dispatch_semaphore_t **)(a1 + 24));
  }
  uint64_t v4 = *(dispatch_semaphore_t **)(a1 + 24);
  return sub_221A34344(v4);
}

uint64_t sub_221A33748(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 <= 1) {
    int v6 = 1;
  }
  else {
    int v6 = a5;
  }
  *((void *)a1 + 5) = a2;
  *((void *)a1 + 6) = a3;
  a1[8] = a4;
  uint64_t result = (v6 - 1);
  *a1 = result;
  if (v6 != 1)
  {
    *((void *)a1 + 2) = sub_221A34290(result, 0);
    *((void *)a1 + 3) = sub_221A34290(*a1, 0);
    operator new[]();
  }
  return result;
}

intptr_t sub_221A3380C(uint64_t a1)
{
  if (*(_DWORD *)a1)
  {
    unsigned int v2 = 0;
    do
    {
      sub_221A34344(*(dispatch_semaphore_t **)(a1 + 16));
      ++v2;
    }
    while (v2 < *(_DWORD *)a1);
  }
  intptr_t result = (*(uint64_t (**)(void))(a1 + 40))(*(void *)(a1 + 48));
  if (*(_DWORD *)a1)
  {
    unsigned int v4 = 0;
    do
    {
      intptr_t result = sub_221A34338(*(dispatch_semaphore_t **)(a1 + 24));
      ++v4;
    }
    while (v4 < *(_DWORD *)a1);
  }
  return result;
}

uint64_t sub_221A3387C(uint64_t result)
{
  if (*(_DWORD *)result)
  {
    v1 = (unsigned int *)result;
    unsigned int v2 = 0;
    *(void *)(result + 40) = 0;
    BOOL v3 = (void *)(result + 16);
    do
    {
      sub_221A34344(*((dispatch_semaphore_t **)v1 + 2));
      ++v2;
    }
    while (v2 < *v1);
    if (*v1)
    {
      unsigned int v4 = 0;
      do
      {
        sub_221A34338(*((dispatch_semaphore_t **)v1 + 3));
        ++v4;
      }
      while (v4 < *v1);
      if (*v1)
      {
        unint64_t v5 = 0;
        do
          sub_221A34110(*(pthread_t **)(*((void *)v1 + 1) + 8 * v5++));
        while (v5 < *v1);
      }
    }
    sub_221A342F0(*((NSObject ***)v1 + 2));
    sub_221A342F0(*((NSObject ***)v1 + 3));
    void *v3 = 0;
    v3[1] = 0;
    if (*v1)
    {
      unint64_t v6 = 0;
      do
      {
        sub_221A34104(*(void **)(*((void *)v1 + 1) + 8 * v6));
        *(void *)(*((void *)v1 + 1) + 8 * v6++) = 0;
      }
      while (v6 < *v1);
    }
    intptr_t result = *((void *)v1 + 1);
    if (result) {
      intptr_t result = MEMORY[0x223C8C880](result, 0x20C8093837F09);
    }
    *((void *)v1 + 1) = 0;
  }
  return result;
}

uint64_t sub_221A33978(unsigned int a1, int a2)
{
  if (a1 <= 1) {
    int v3 = 1;
  }
  else {
    int v3 = a1;
  }
  unsigned int v4 = malloc_type_malloc(0x30uLL, 0x10E004024023721uLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    goto LABEL_16;
  }
  v4[5] = 0;
  unint64_t v6 = sub_221A34144();
  *(void *)uint64_t v5 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  *(_DWORD *)(v5 + 32) = v3 - 1;
  if (v3 == 1)
  {
    *(void *)(v5 + 24) = 0;
    return v5;
  }
  uint64_t v7 = malloc_type_malloc(8 * (v3 - 1), 0x2004093837F09uLL);
  *(void *)(v5 + 24) = v7;
  if (!v7) {
    goto LABEL_16;
  }
  if (*(int *)(v5 + 32) >= 1)
  {
    uint64_t v8 = 0;
    while (1)
    {
      if (v8)
      {
        *(void *)(*(void *)(v5 + 24) + 8 * v8) = sub_221A33C2C(v5, ((v8 + 1) >> 1) + 1, a2);
      }
      else
      {
        sub_221A3445C(1);
        **(void **)(v5 + 24) = sub_221A33C2C(v5, 1, a2);
      }
      if (!*(void *)(*(void *)(v5 + 24) + 8 * v8)) {
        break;
      }
      if (++v8 >= *(int *)(v5 + 32)) {
        return v5;
      }
    }
LABEL_16:
    sub_221A33A94((unsigned int *)v5);
    return 0;
  }
  return v5;
}

void sub_221A33A94(unsigned int *a1)
{
  if (a1)
  {
    unsigned int v2 = (uint64_t *)*((void *)a1 + 3);
    uint64_t v3 = a1[8];
    a1[4] = -1;
    if ((int)v3 >= 1)
    {
      unsigned int v4 = v2;
      do
      {
        sub_221A33DD8(*v4);
        sub_221A33DE0(*v4);
        uint64_t v5 = *v4++;
        sub_221A33D84(v5);
        --v3;
      }
      while (v3);
    }
    free(v2);
    *((void *)a1 + 3) = 0;
    sub_221A34190(*(pthread_mutex_t **)a1);
    *(void *)a1 = 0;
    os_release(*((void **)a1 + 5));
  }
  free(a1);
}

void sub_221A33B30(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = *(uint64_t **)(a1 + 24);
      *(void *)(a1 + 8) = a2;
      *(_DWORD *)(a1 + 16) = a3;
      *(void *)(a1 + 40) = voucher_copy();
      *(_DWORD *)(a1 + 20) = 1;
      unsigned int v8 = v6 + 1;
      if ((int)v6 + 1 <= a3) {
        uint64_t v6 = v6;
      }
      else {
        uint64_t v6 = a3 - 1;
      }
      if (v6)
      {
        uint64_t v9 = v6;
        unsigned int v10 = v7;
        do
        {
          uint64_t v11 = *v10++;
          sub_221A33DD8(v11);
          --v9;
        }
        while (v9);
      }
      (*(void (**)(void))a2)(*(void *)(a2 + 8));
      if (v8 < a3) {
        sub_221A33DF0(a1);
      }
      if (v6)
      {
        do
        {
          uint64_t v12 = *v7++;
          sub_221A33DE8(v12);
          --v6;
        }
        while (v6);
      }
      os_release(*(void **)(a1 + 40));
      *(void *)(a1 + 40) = 0;
    }
    else
    {
      uint64_t v13 = a3;
      uint64_t v14 = (void *)(a2 + 8);
      do
      {
        ((void (*)(void))*(v14 - 1))(*v14);
        v14 += 2;
        --v13;
      }
      while (v13);
    }
  }
}

uint64_t sub_221A33C20(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 32) + 1);
}

uint64_t sub_221A33C2C(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = malloc_type_malloc(0x28uLL, 0x10200401C8C6399uLL);
  uint64_t v7 = (uint64_t)v6;
  if (!v6) {
    goto LABEL_7;
  }
  *uint64_t v6 = a1;
  v6[1] = sub_221A34290(1, 0);
  unsigned int v8 = sub_221A34290(1, 0);
  *(void *)(v7 + 24) = v8;
  *(_DWORD *)(v7 + 32) = a2;
  BOOL v9 = !*(void *)(v7 + 8) || v8 == 0;
  if (v9
    || (unsigned int v10 = sub_221A33E8C((void *(__cdecl *)(void *))sub_221A33CE8, (void *)v7, a3),
        (*(void *)(v7 + 16) = v10) == 0))
  {
LABEL_7:
    sub_221A33D84(v7);
    return 0;
  }
  return v7;
}

uint64_t sub_221A33CE8(uint64_t a1)
{
  sub_221A33E78(0);
  uint64_t v2 = *(void *)a1;
  while (1)
  {
    int v3 = *(_DWORD *)(a1 + 32);
    if (v3 >= 1) {
      sub_221A3445C(v3);
    }
    sub_221A34338(*(dispatch_semaphore_t **)(a1 + 8));
    sub_221A341D0(*(pthread_mutex_t **)v2);
    int v4 = *(_DWORD *)(v2 + 16);
    sub_221A341DC(*(pthread_mutex_t **)v2);
    if (v4 == -1) {
      break;
    }
    os_retain(*(void **)(v2 + 40));
    voucher_adopt();
    sub_221A33DF0(v2);
    sub_221A34344(*(dispatch_semaphore_t **)(a1 + 24));
    uint64_t v5 = (void *)voucher_adopt();
    os_release(v5);
  }
  return 0;
}

void sub_221A33D84(uint64_t a1)
{
  if (a1)
  {
    sub_221A34104(*(void **)(a1 + 16));
    sub_221A342F0(*(NSObject ***)(a1 + 8));
    sub_221A342F0(*(NSObject ***)(a1 + 24));
    free((void *)a1);
  }
}

dispatch_semaphore_t *sub_221A33DD8(uint64_t a1)
{
  return sub_221A34344(*(dispatch_semaphore_t **)(a1 + 8));
}

pthread_t *sub_221A33DE0(uint64_t a1)
{
  return sub_221A34110(*(pthread_t **)(a1 + 16));
}

intptr_t sub_221A33DE8(uint64_t a1)
{
  return sub_221A34338(*(dispatch_semaphore_t **)(a1 + 24));
}

pthread_mutex_t *sub_221A33DF0(uint64_t a1)
{
  for (unsigned int i = *(pthread_mutex_t **)a1; ; unsigned int i = *(pthread_mutex_t **)a1)
  {
    sub_221A341D0(i);
    int v3 = *(_DWORD *)(a1 + 20);
    if (*(_DWORD *)(a1 + 16) == v3) {
      break;
    }
    *(_DWORD *)(a1 + 20) = v3 + 1;
    uint64_t v4 = *(void *)(a1 + 8);
    intptr_t result = sub_221A341DC(*(pthread_mutex_t **)a1);
    if (!v4) {
      return result;
    }
    (*(void (**)(void))(v4 + 16 * v3))(*(void *)(v4 + 16 * v3 + 8));
  }
  uint64_t v6 = *(pthread_mutex_t **)a1;
  return sub_221A341DC(v6);
}

uint64_t sub_221A33E78(const char *a1)
{
  if (!a1) {
    a1 = "com.apple.coremedia.JVTlib";
  }
  return pthread_setname_np(a1);
}

pthread_t *sub_221A33E8C(void *(__cdecl *a1)(void *), void *a2, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (pthread_t *)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (v6)
  {
    memset(&__attr, 0, sizeof(__attr));
    if (pthread_attr_init(&__attr))
    {
LABEL_9:
      free(v6);
      return 0;
    }
    if (a3 == 27 && pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_UTILITY, 0)) {
      goto LABEL_8;
    }
    if (pthread_attr_setdetachstate(&__attr, 1)) {
      goto LABEL_8;
    }
    if (pthread_create(v6, &__attr, a1, a2)) {
      goto LABEL_8;
    }
    thread_inspect_t v7 = pthread_mach_thread_np(*v6);
    uint64_t v19 = 0;
    *(_OWORD *)thread_info_out = 0u;
    long long v18 = 0u;
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)uint64_t v12 = 0u;
    mach_msg_type_number_t thread_info_outCnt = 10;
    if (thread_info(v7, 3u, thread_info_out, &thread_info_outCnt))
    {
LABEL_8:
      pthread_attr_destroy(&__attr);
      goto LABEL_9;
    }
    switch(DWORD1(v18))
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        if (thread_info(v7, 0xCu, (thread_info_t)&v14 + 2, &thread_info_outCnt)) {
          goto LABEL_8;
        }
        BOOL v9 = (integer_t *)&v14 + 3;
        break;
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        if (thread_info(v7, 0xBu, (thread_info_t)&v13 + 1, &thread_info_outCnt)) {
          goto LABEL_8;
        }
        BOOL v9 = (integer_t *)&v13 + 2;
        break;
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        if (thread_info(v7, 0xAu, v12, &thread_info_outCnt)) {
          goto LABEL_8;
        }
        BOOL v9 = &v12[1];
        break;
      default:
        goto LABEL_8;
    }
    integer_t v11 = a3 - *v9;
    int v10 = sub_221A34094(*v6, 3u, &v11);
    pthread_attr_destroy(&__attr);
    if (!v10) {
      return v6;
    }
    goto LABEL_9;
  }
  return v6;
}

uint64_t sub_221A34094(_opaque_pthread_t *a1, thread_policy_flavor_t a2, integer_t *a3)
{
  qos_class_t __qos_class = QOS_CLASS_UNSPECIFIED;
  uint64_t result = pthread_get_qos_class_np(a1, &__qos_class, 0);
  if (!result && __qos_class != QOS_CLASS_UTILITY)
  {
    thread_act_t v7 = pthread_mach_thread_np(a1);
    return thread_policy_set(v7, a2, a3, 1u);
  }
  return result;
}

void sub_221A34104(void *a1)
{
  if (a1) {
    free(a1);
  }
}

pthread_t *sub_221A34110(pthread_t *result)
{
  v1 = 0;
  if (result)
  {
    pthread_join(*result, &v1);
    return (pthread_t *)v1;
  }
  return result;
}

pthread_mutex_t *sub_221A34144()
{
  v0 = (pthread_mutex_t *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
  v1 = v0;
  if (v0) {
    pthread_mutex_init(v0, 0);
  }
  return v1;
}

void sub_221A34190(pthread_mutex_t *a1)
{
  if (a1) {
    pthread_mutex_destroy(a1);
  }
  free(a1);
}

pthread_mutex_t *sub_221A341D0(pthread_mutex_t *result)
{
  if (result) {
    return (pthread_mutex_t *)pthread_mutex_lock(result);
  }
  return result;
}

pthread_mutex_t *sub_221A341DC(pthread_mutex_t *result)
{
  if (result) {
    return (pthread_mutex_t *)pthread_mutex_unlock(result);
  }
  return result;
}

pthread_cond_t *sub_221A341E8()
{
  v0 = (pthread_cond_t *)malloc_type_malloc(0x30uLL, 0x1000040EED21634uLL);
  v1 = v0;
  if (v0) {
    pthread_cond_init(v0, 0);
  }
  return v1;
}

void sub_221A34234(pthread_cond_t *a1)
{
  if (a1) {
    pthread_cond_destroy(a1);
  }
  free(a1);
}

pthread_cond_t *sub_221A34274(pthread_cond_t *result)
{
  if (result) {
    return (pthread_cond_t *)pthread_cond_broadcast(result);
  }
  return result;
}

pthread_cond_t *sub_221A34280(pthread_cond_t *result, pthread_mutex_t *a2)
{
  if (result)
  {
    if (a2) {
      return (pthread_cond_t *)pthread_cond_wait(result, a2);
    }
  }
  return result;
}

NSObject **sub_221A34290(uint64_t a1, unsigned int a2)
{
  int v3 = (NSObject **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(a2);
    void *v3 = v4;
    if (!v4)
    {
      sub_221A342F0(v3);
      return 0;
    }
  }
  return v3;
}

void sub_221A342F0(NSObject **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      dispatch_release(v2);
    }
    free(a1);
  }
}

intptr_t sub_221A34338(dispatch_semaphore_t *a1)
{
  return dispatch_semaphore_wait(*a1, 0xFFFFFFFFFFFFFFFFLL);
}

dispatch_semaphore_t *sub_221A34344(dispatch_semaphore_t *result)
{
  if (result) {
    return (dispatch_semaphore_t *)dispatch_semaphore_signal(*result);
  }
  return result;
}

uint64_t sub_221A34354(unsigned int a1)
{
  int v10 = 0;
  size_t v9 = 4;
  if (sysctlbyname("hw.activecpu", &v10, &v9, 0, 0)) {
    return 1;
  }
  int v8 = 0;
  size_t v7 = 4;
  int v3 = sysctlbyname("hw.cputhreadtype", &v8, &v7, 0, 0);
  if (v10 >= 0) {
    int v4 = v10;
  }
  else {
    int v4 = v10 + 1;
  }
  if (v8) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  unsigned int v6 = v4 >> 1;
  if (!v5) {
    unsigned int v6 = v10;
  }
  if (v6 >= a1) {
    return a1;
  }
  else {
    return v6;
  }
}

uint64_t sub_221A34400(integer_t a1)
{
  uint64_t result = dword_267F69F70;
  if (!dword_267F69F70)
  {
    uint64_t result = sub_221A34354(8u);
    dword_267F69F70 = result;
  }
  if (result >= 3)
  {
    integer_t v4 = a1;
    int v3 = pthread_self();
    return sub_221A34094(v3, 4u, &v4);
  }
  return result;
}

uint64_t sub_221A3445C(int a1)
{
  return sub_221A34400(a1 + 1);
}

BOOL sub_221A34464(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3 = a1;
  atomic_compare_exchange_strong(a3, (unsigned int *)&v3, a2);
  return v3 == a1;
}

uint64_t sub_221A34478(atomic_uint *a1)
{
  return atomic_fetch_add(a1, 0xFFFFFFFF) - 1;
}

uint64_t sub_221A34488(atomic_uint *a1)
{
  return atomic_fetch_add(a1, 1u) + 1;
}

uint64_t sub_221A34498(unsigned int a1)
{
  return bswap32(a1);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x270EE79F0](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF0](desc, extensionKey);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

void CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(CFDictionaryRef description, OSType pixelFormat)
{
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x270EE8230]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x270EE8380]();
}

uint64_t FigThreadGetMachThreadPriorityValue()
{
  return MEMORY[0x270EE8408]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x270F06698]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x270F066B8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F066C0]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x270F06800]();
}

uint64_t VTTileDecoderSessionEmitDecodedTile()
{
  return MEMORY[0x270F06848]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x270F06870]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x270F06878]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void dispatch_release(dispatch_object_t object)
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

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x270EDAA50](object);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x270EDAEC8](__pthread, __qos_class, __relative_priority);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
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

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x270EDBAD0]();
}