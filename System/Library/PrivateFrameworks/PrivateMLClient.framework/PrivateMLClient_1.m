uint64_t sub_25A77ED64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD *v35;
  char v36;
  _DWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *);
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;

  v4 = sub_25A79ADF0();
  v47 = *(void *)(v4 - 8);
  v48 = v4;
  v5 = MEMORY[0x270FA5388](v4);
  v46 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v45 = (char *)&v45 - v7;
  v8 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v51 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459138);
  v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
  v16 = MEMORY[0x270FA5388](v15 - 8);
  v52 = (uint64_t)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x270FA5388](v16);
  v20 = (char *)&v45 - v19;
  MEMORY[0x270FA5388](v18);
  v22 = (char *)&v45 - v21;
  v23 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter(0);
  v24 = *(int *)(v23 + 20);
  v49 = a1;
  sub_25A6E602C(a1 + v24, (uint64_t)v22, &qword_26A458368);
  v25 = *(int *)(v23 + 20);
  v50 = a2;
  sub_25A6E602C(a2 + v25, (uint64_t)v20, &qword_26A458368);
  v26 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_25A6E602C((uint64_t)v22, (uint64_t)v14, &qword_26A458368);
  sub_25A6E602C((uint64_t)v20, v26, &qword_26A458368);
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v27((uint64_t)v14, 1, v8) != 1)
  {
    v28 = (uint64_t)v51;
    v29 = v52;
    sub_25A6E602C((uint64_t)v14, v52, &qword_26A458368);
    if (v27(v26, 1, v8) != 1)
    {
      sub_25A7797E4(v26, v28, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
      v32 = sub_25A77F2A0(v29, v28, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
      sub_25A74520C(v28, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
      sub_25A6E6090((uint64_t)v20, &qword_26A458368);
      sub_25A6E6090((uint64_t)v22, &qword_26A458368);
      sub_25A74520C(v29, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
      sub_25A6E6090((uint64_t)v14, &qword_26A458368);
      if ((v32 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
    sub_25A6E6090((uint64_t)v20, &qword_26A458368);
    sub_25A6E6090((uint64_t)v22, &qword_26A458368);
    sub_25A74520C(v29, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
LABEL_6:
    sub_25A6E6090((uint64_t)v14, &qword_26A459138);
    goto LABEL_7;
  }
  sub_25A6E6090((uint64_t)v20, &qword_26A458368);
  sub_25A6E6090((uint64_t)v22, &qword_26A458368);
  if (v27(v26, 1, v8) != 1) {
    goto LABEL_6;
  }
  sub_25A6E6090((uint64_t)v14, &qword_26A458368);
LABEL_10:
  v33 = *(int *)(v23 + 24);
  v34 = v50;
  v35 = (_DWORD *)(v49 + v33);
  v36 = *(unsigned char *)(v49 + v33 + 4);
  v37 = (_DWORD *)(v50 + v33);
  v38 = *(unsigned __int8 *)(v50 + v33 + 4);
  if (v36)
  {
    if (v38)
    {
LABEL_16:
      v40 = v47;
      v39 = v48;
      v41 = *(void (**)(char *))(v47 + 16);
      v42 = v45;
      v41(v45);
      v43 = v46;
      ((void (*)(char *, uint64_t, uint64_t))v41)(v46, v34, v39);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      v30 = sub_25A79B5A0();
      v44 = *(void (**)(char *, uint64_t))(v40 + 8);
      v44(v43, v39);
      v44(v42, v39);
      return v30 & 1;
    }
  }
  else
  {
    if (*v35 != *v37) {
      LOBYTE(v38) = 1;
    }
    if ((v38 & 1) == 0) {
      goto LABEL_16;
    }
  }
LABEL_7:
  v30 = 0;
  return v30 & 1;
}

uint64_t sub_25A77F2A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v23 - v11;
  uint64_t v13 = *(int *)(a3(0) + 20);
  v14 = (void *)(a1 + v13);
  uint64_t v15 = *(void *)(a1 + v13 + 8);
  v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  if (!v15)
  {
    if (!v17)
    {
LABEL_11:
      v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
      v20(v12, a1, v6);
      v20(v10, a2, v6);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v19 = sub_25A79B5A0();
      v21 = *(void (**)(char *, uint64_t))(v7 + 8);
      v21(v10, v6);
      v21(v12, v6);
      return v19 & 1;
    }
LABEL_10:
    char v19 = 0;
    return v19 & 1;
  }
  if (!v17) {
    goto LABEL_10;
  }
  if (*v14 == *v16 && v15 == v17) {
    goto LABEL_11;
  }
  char v19 = 0;
  if (sub_25A79BA20()) {
    goto LABEL_11;
  }
  return v19 & 1;
}

uint64_t sub_25A77F48C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v50 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v49 = (char *)&v43 - v7;
  uint64_t v8 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  MEMORY[0x270FA5388](v8 - 8);
  v46 = (uint64_t *)((char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459128);
  MEMORY[0x270FA5388](v43);
  uint64_t v44 = (uint64_t)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v45 = (uint64_t)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459130);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  v24 = (char *)&v43 - v23;
  MEMORY[0x270FA5388](v22);
  v26 = (char *)&v43 - v25;
  uint64_t v47 = a1;
  sub_25A6E602C(a1, (uint64_t)&v43 - v25, &qword_26A458348);
  uint64_t v48 = a2;
  sub_25A6E602C(a2, (uint64_t)v24, &qword_26A458348);
  uint64_t v27 = (uint64_t)&v17[*(int *)(v15 + 56)];
  sub_25A6E602C((uint64_t)v26, (uint64_t)v17, &qword_26A458348);
  sub_25A6E602C((uint64_t)v24, v27, &qword_26A458348);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v28((uint64_t)v17, 1, v11) != 1)
  {
    sub_25A6E602C((uint64_t)v17, (uint64_t)v21, &qword_26A458348);
    if (v28(v27, 1, v11) != 1)
    {
      uint64_t v29 = v45;
      sub_25A7797E4(v27, v45, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
      uint64_t v30 = v44;
      v31 = (uint64_t *)(v44 + *(int *)(v43 + 48));
      sub_25A782548((uint64_t)v21, v44, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
      sub_25A782548(v29, (uint64_t)v31, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
      v32 = v46;
      sub_25A7797E4(v30, (uint64_t)v46, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
      char v33 = sub_25A77FAB8(v32, v31);
      sub_25A74520C((uint64_t)v31, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
      sub_25A74520C((uint64_t)v32, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
      sub_25A74520C(v29, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
      sub_25A6E6090((uint64_t)v24, &qword_26A458348);
      sub_25A6E6090((uint64_t)v26, &qword_26A458348);
      sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
      sub_25A6E6090((uint64_t)v17, &qword_26A458348);
      if (v33) {
        goto LABEL_8;
      }
LABEL_9:
      char v40 = 0;
      return v40 & 1;
    }
    sub_25A6E6090((uint64_t)v24, &qword_26A458348);
    sub_25A6E6090((uint64_t)v26, &qword_26A458348);
    sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
LABEL_6:
    sub_25A6E6090((uint64_t)v17, &qword_26A459130);
    goto LABEL_9;
  }
  sub_25A6E6090((uint64_t)v24, &qword_26A458348);
  sub_25A6E6090((uint64_t)v26, &qword_26A458348);
  if (v28(v27, 1, v11) != 1) {
    goto LABEL_6;
  }
  sub_25A6E6090((uint64_t)v17, &qword_26A458348);
LABEL_8:
  uint64_t v34 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t v36 = v51;
  uint64_t v35 = v52;
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  v38 = v49;
  v37(v49, v47 + *(int *)(v34 + 20), v52);
  v39 = v50;
  v37(v50, v48 + *(int *)(v34 + 20), v35);
  sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
  char v40 = sub_25A79B5A0();
  v41 = *(void (**)(char *, uint64_t))(v36 + 8);
  v41(v39, v35);
  v41(v38, v35);
  return v40 & 1;
}

uint64_t sub_25A77FAB8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = (uint64_t *)((char *)a1 + v12);
  uint64_t v14 = *(uint64_t *)((char *)a1 + v12 + 8);
  uint64_t v15 = (uint64_t *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_12;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_25A79BA20() & 1) != 0))
  {
LABEL_10:
    if (sub_25A779AB4(*a1, *a2))
    {
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v19(v10, (char *)a1 + *(int *)(v11 + 20), v4);
      v19(v8, (char *)a2 + *(int *)(v11 + 20), v4);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v18 = sub_25A79B5A0();
      uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
      v20(v8, v4);
      v20(v10, v4);
      return v18 & 1;
    }
LABEL_12:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_25A77FCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459128);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)&v10[*(int *)(v8 + 56)];
  sub_25A782548(a1, (uint64_t)v10, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
  sub_25A782548(a2, (uint64_t)v11, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
  sub_25A7797E4((uint64_t)v10, (uint64_t)v6, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
  uint64_t v12 = *(int *)(v4 + 24);
  uint64_t v13 = (uint64_t *)((char *)v6 + v12);
  uint64_t v14 = *(uint64_t *)((char *)v6 + v12 + 8);
  uint64_t v15 = (uint64_t *)((char *)v11 + v12);
  uint64_t v16 = v15[1];
  if (v14)
  {
    if (!v16) {
      goto LABEL_13;
    }
    BOOL v17 = *v13 == *v15 && v14 == v16;
    if (!v17 && (sub_25A79BA20() & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (v16)
  {
LABEL_13:
    uint64_t v18 = 0;
    goto LABEL_14;
  }
  if ((sub_25A779AB4(*v6, *v11) & 1) == 0) {
    goto LABEL_13;
  }
  sub_25A79ADF0();
  sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
  if ((sub_25A79B5A0() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v18 = 1;
LABEL_14:
  sub_25A74520C((uint64_t)v11, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
  sub_25A74520C((uint64_t)v6, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
  return v18;
}

uint64_t sub_25A77FEE0(char *a1, char *a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_25A79BA20() & 1) != 0))
  {
    if (*((void *)a1 + 2) == *((void *)a2 + 2)
      && (sub_25A779D58(*((void *)a1 + 3), *((void *)a2 + 3)) & 1) != 0)
    {
      uint64_t v13 = type metadata accessor for Apple_Cloudml_Inference_Tie_PerfMetrics(0);
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v14(v10, &a1[*(int *)(v13 + 28)], v4);
      v14(v8, &a2[*(int *)(v13 + 28)], v4);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v12 = sub_25A79B5A0();
      uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      v15(v8, v4);
      v15(v10, v4);
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t sub_25A7800CC(char *a1, char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v21 - v11;
  uint64_t v13 = *((void *)a1 + 1);
  uint64_t v14 = *((void *)a2 + 1);
  if (!v13)
  {
    if (!v14)
    {
LABEL_11:
      uint64_t v17 = a3(0);
      uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      v18(v12, &a1[*(int *)(v17 + 20)], v6);
      v18(v10, &a2[*(int *)(v17 + 20)], v6);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v16 = sub_25A79B5A0();
      uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19(v10, v6);
      v19(v12, v6);
      return v16 & 1;
    }
LABEL_10:
    char v16 = 0;
    return v16 & 1;
  }
  if (!v14) {
    goto LABEL_10;
  }
  if (*(void *)a1 == *(void *)a2 && v13 == v14) {
    goto LABEL_11;
  }
  char v16 = 0;
  if (sub_25A79BA20()) {
    goto LABEL_11;
  }
  return v16 & 1;
}

uint64_t sub_25A7802B8(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v34 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v34 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590A0);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (uint64_t)&v23[*(int *)(v21 + 56)];
  sub_25A782548(a1, (uint64_t)v23, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
  sub_25A782548(v35, v24, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_25A782548((uint64_t)v23, (uint64_t)v17, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_25A7797E4(v24, (uint64_t)v7, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar);
        char v26 = sub_25A7800CC(v17, v7, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar);
        uint64_t v27 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar;
        sub_25A74520C((uint64_t)v7, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar);
        uint64_t v28 = (uint64_t)v17;
LABEL_9:
        v32 = v27;
LABEL_14:
        sub_25A74520C(v28, v32);
        sub_25A74520C((uint64_t)v23, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
        return v26 & 1;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar;
      uint64_t v30 = (uint64_t)v17;
    }
    else
    {
      sub_25A782548((uint64_t)v23, (uint64_t)v14, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v31 = v34;
        sub_25A7797E4(v24, (uint64_t)v34, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar);
        char v26 = sub_25A7800CC(v14, v31, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar);
        uint64_t v27 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar;
        sub_25A74520C((uint64_t)v31, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar);
        uint64_t v28 = (uint64_t)v14;
        goto LABEL_9;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar;
      uint64_t v30 = (uint64_t)v14;
    }
  }
  else
  {
    sub_25A782548((uint64_t)v23, (uint64_t)v19, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25A7797E4(v24, (uint64_t)v10, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema);
      char v26 = sub_25A7800CC(v19, v10, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema);
      sub_25A74520C((uint64_t)v10, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema);
      uint64_t v28 = (uint64_t)v19;
      v32 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema;
      goto LABEL_14;
    }
    uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema;
    uint64_t v30 = (uint64_t)v19;
  }
  sub_25A74520C(v30, v29);
  sub_25A6E6090((uint64_t)v23, &qword_26A4590A0);
  char v26 = 0;
  return v26 & 1;
}

uint64_t sub_25A780770(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v41 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v38 = (uint64_t)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459098);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458398);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v37 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v37 - v22;
  uint64_t v39 = a1;
  sub_25A6E602C(a1, (uint64_t)&v37 - v22, &qword_26A458398);
  uint64_t v40 = a2;
  sub_25A6E602C(a2, (uint64_t)v21, &qword_26A458398);
  uint64_t v24 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_25A6E602C((uint64_t)v23, (uint64_t)v14, &qword_26A458398);
  sub_25A6E602C((uint64_t)v21, v24, &qword_26A458398);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v25((uint64_t)v14, 1, v8) != 1)
  {
    sub_25A6E602C((uint64_t)v14, (uint64_t)v18, &qword_26A458398);
    if (v25(v24, 1, v8) != 1)
    {
      uint64_t v26 = v38;
      sub_25A7797E4(v24, v38, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
      char v27 = sub_25A7802B8((uint64_t)v18, v26);
      sub_25A74520C(v26, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
      sub_25A6E6090((uint64_t)v21, &qword_26A458398);
      sub_25A6E6090((uint64_t)v23, &qword_26A458398);
      sub_25A74520C((uint64_t)v18, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
      sub_25A6E6090((uint64_t)v14, &qword_26A458398);
      if (v27) {
        goto LABEL_8;
      }
LABEL_9:
      char v34 = 0;
      return v34 & 1;
    }
    sub_25A6E6090((uint64_t)v21, &qword_26A458398);
    sub_25A6E6090((uint64_t)v23, &qword_26A458398);
    sub_25A74520C((uint64_t)v18, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.OneOf_ConstraintType);
LABEL_6:
    sub_25A6E6090((uint64_t)v14, &qword_26A459098);
    goto LABEL_9;
  }
  sub_25A6E6090((uint64_t)v21, &qword_26A458398);
  sub_25A6E6090((uint64_t)v23, &qword_26A458398);
  if (v25(v24, 1, v8) != 1) {
    goto LABEL_6;
  }
  sub_25A6E6090((uint64_t)v14, &qword_26A458398);
LABEL_8:
  uint64_t v28 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints(0);
  uint64_t v30 = v43;
  uint64_t v29 = v44;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  v32 = v41;
  v31(v41, v39 + *(int *)(v28 + 20), v44);
  char v33 = v42;
  v31(v42, v40 + *(int *)(v28 + 20), v29);
  sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
  char v34 = sub_25A79B5A0();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v30 + 8);
  v35(v33, v29);
  v35(v32, v29);
  return v34 & 1;
}

uint64_t sub_25A780C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling(0) + 20);
  uint64_t v12 = (_DWORD *)(a1 + v11);
  char v13 = *(unsigned char *)(a1 + v11 + 4);
  uint64_t v14 = (_DWORD *)(a2 + v11);
  int v15 = *(unsigned __int8 *)(a2 + v11 + 4);
  if ((v13 & 1) == 0)
  {
    if (*v12 != *v14) {
      LOBYTE(v15) = 1;
    }
    if (v15) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v10, a1, v4);
    v17(v8, a2, v4);
    sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
    char v16 = sub_25A79B5A0();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v8, v4);
    v18(v10, v4);
    return v16 & 1;
  }
  if (v15) {
    goto LABEL_7;
  }
LABEL_3:
  char v16 = 0;
  return v16 & 1;
}

uint64_t sub_25A780E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  int v15 = (char *)&v32 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459110);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = &v21[*(int *)(v19 + 56)];
  sub_25A782548(a1, (uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
  sub_25A782548(a2, (uint64_t)v22, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_25A782548((uint64_t)v21, (uint64_t)v15, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_25A7797E4((uint64_t)v22, (uint64_t)v8, type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling);
        char v24 = sub_25A78121C((uint64_t)v15, (uint64_t)v8);
        uint64_t v25 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling;
        sub_25A74520C((uint64_t)v8, type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling);
        uint64_t v26 = (uint64_t)v15;
LABEL_9:
        sub_25A74520C(v26, v25);
        sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
        return v24 & 1;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling;
      uint64_t v30 = (uint64_t)v15;
    }
    else
    {
      sub_25A782548((uint64_t)v21, (uint64_t)v12, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v28 = v33;
        sub_25A7797E4((uint64_t)v22, v33, type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling);
        char v24 = sub_25A780C60((uint64_t)v12, v28);
        uint64_t v25 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling;
        sub_25A74520C(v28, type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling);
        uint64_t v26 = (uint64_t)v12;
        goto LABEL_9;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling;
      uint64_t v30 = (uint64_t)v12;
    }
    sub_25A74520C(v30, v29);
LABEL_13:
    sub_25A6E6090((uint64_t)v21, &qword_26A459110);
    char v24 = 0;
    return v24 & 1;
  }
  sub_25A782548((uint64_t)v21, (uint64_t)v17, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
  if (swift_getEnumCaseMultiPayload()) {
    goto LABEL_13;
  }
  char v27 = *v17 ^ *v22;
  sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_CoordinationInferenceRequest.OneOf_SamplingStrategy);
  char v24 = v27 ^ 1;
  return v24 & 1;
}

uint64_t sub_25A78121C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling(0) + 20);
  uint64_t v12 = (double *)(a1 + v11);
  char v13 = *(unsigned char *)(a1 + v11 + 8);
  uint64_t v14 = (double *)(a2 + v11);
  int v15 = *(unsigned __int8 *)(a2 + v11 + 8);
  if ((v13 & 1) == 0)
  {
    if (*v12 != *v14) {
      LOBYTE(v15) = 1;
    }
    if (v15) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v10, a1, v4);
    v17(v8, a2, v4);
    sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
    char v16 = sub_25A79B5A0();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v8, v4);
    v18(v10, v4);
    return v16 & 1;
  }
  if (v15) {
    goto LABEL_7;
  }
LABEL_3:
  char v16 = 0;
  return v16 & 1;
}

unint64_t sub_25A7813E8()
{
  unint64_t result = qword_26A459070;
  if (!qword_26A459070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459070);
  }
  return result;
}

uint64_t sub_25A78143C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  int v15 = (char *)&v32 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459090);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = &v21[*(int *)(v19 + 56)];
  sub_25A782548(a1, (uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
  sub_25A782548(a2, (uint64_t)v22, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_25A782548((uint64_t)v21, (uint64_t)v15, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_25A7797E4((uint64_t)v22, (uint64_t)v8, type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling);
        char v24 = sub_25A78121C((uint64_t)v15, (uint64_t)v8);
        uint64_t v25 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling;
        sub_25A74520C((uint64_t)v8, type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling);
        uint64_t v26 = (uint64_t)v15;
LABEL_9:
        sub_25A74520C(v26, v25);
        sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
        return v24 & 1;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_NucleusSampling;
      uint64_t v30 = (uint64_t)v15;
    }
    else
    {
      sub_25A782548((uint64_t)v21, (uint64_t)v12, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v28 = v33;
        sub_25A7797E4((uint64_t)v22, v33, type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling);
        char v24 = sub_25A780C60((uint64_t)v12, v28);
        uint64_t v25 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling;
        sub_25A74520C(v28, type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling);
        uint64_t v26 = (uint64_t)v12;
        goto LABEL_9;
      }
      uint64_t v29 = type metadata accessor for Apple_Cloudml_Inference_Tie_TopKSampling;
      uint64_t v30 = (uint64_t)v12;
    }
    sub_25A74520C(v30, v29);
LABEL_13:
    sub_25A6E6090((uint64_t)v21, &qword_26A459090);
    char v24 = 0;
    return v24 & 1;
  }
  sub_25A782548((uint64_t)v21, (uint64_t)v17, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
  if (swift_getEnumCaseMultiPayload()) {
    goto LABEL_13;
  }
  char v27 = *v17 ^ *v22;
  sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
  char v24 = v27 ^ 1;
  return v24 & 1;
}

uint64_t sub_25A78182C(void **a1, void **a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v122 = *(void *)(v4 - 8);
  uint64_t v123 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v121 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v120 = (char *)&v118 - v7;
  uint64_t v129 = type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints(0);
  uint64_t v126 = *(void *)(v129 - 8);
  MEMORY[0x270FA5388](v129);
  uint64_t v119 = (uint64_t)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459080);
  MEMORY[0x270FA5388](v125);
  uint64_t v130 = (uint64_t)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458358);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v124 = (uint64_t)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v127 = (uint64_t)&v118 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v128 = (uint64_t)&v118 - v15;
  uint64_t v16 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy(0);
  uint64_t v131 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v118 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459088);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458338);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v118 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v118 - v29;
  v31 = (int *)type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions(0);
  uint64_t v32 = v31;
  uint64_t v33 = v31[7];
  char v34 = (_DWORD *)((char *)a1 + v33);
  char v35 = *((unsigned char *)a1 + v33 + 4);
  uint64_t v36 = (_DWORD *)((char *)a2 + v33);
  int v37 = *((unsigned __int8 *)a2 + v33 + 4);
  if (v35)
  {
    if (!v37) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v34 != *v36) {
      LOBYTE(v37) = 1;
    }
    if (v37) {
      goto LABEL_80;
    }
  }
  uint64_t v38 = v31[8];
  uint64_t v39 = (float *)((char *)a1 + v38);
  char v40 = *((unsigned char *)a1 + v38 + 4);
  v41 = (float *)((char *)a2 + v38);
  int v42 = *((unsigned __int8 *)a2 + v38 + 4);
  if (v40)
  {
    if (!v42) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v39 != *v41) {
      LOBYTE(v42) = 1;
    }
    if (v42) {
      goto LABEL_80;
    }
  }
  uint64_t v43 = v31[9];
  uint64_t v44 = (_DWORD *)((char *)a1 + v43);
  char v45 = *((unsigned char *)a1 + v43 + 4);
  v46 = (_DWORD *)((char *)a2 + v43);
  int v47 = *((unsigned __int8 *)a2 + v43 + 4);
  if (v45)
  {
    if (!v47) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v44 != *v46) {
      LOBYTE(v47) = 1;
    }
    if (v47) {
      goto LABEL_80;
    }
  }
  uint64_t v48 = v31[10];
  v49 = (_DWORD *)((char *)a1 + v48);
  char v50 = *((unsigned char *)a1 + v48 + 4);
  uint64_t v51 = (_DWORD *)((char *)a2 + v48);
  int v52 = *((unsigned __int8 *)a2 + v48 + 4);
  if (v50)
  {
    if (!v52) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v49 != *v51) {
      LOBYTE(v52) = 1;
    }
    if (v52) {
      goto LABEL_80;
    }
  }
  uint64_t v53 = v31[11];
  v54 = (float *)((char *)a1 + v53);
  char v55 = *((unsigned char *)a1 + v53 + 4);
  v56 = (float *)((char *)a2 + v53);
  int v57 = *((unsigned __int8 *)a2 + v53 + 4);
  if (v55)
  {
    if (!v57) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v54 != *v56) {
      LOBYTE(v57) = 1;
    }
    if (v57) {
      goto LABEL_80;
    }
  }
  uint64_t v58 = v31[12];
  v59 = (float *)((char *)a1 + v58);
  char v60 = *((unsigned char *)a1 + v58 + 4);
  v61 = (float *)((char *)a2 + v58);
  int v62 = *((unsigned __int8 *)a2 + v58 + 4);
  if (v60)
  {
    if (!v62) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v59 != *v61) {
      LOBYTE(v62) = 1;
    }
    if (v62) {
      goto LABEL_80;
    }
  }
  uint64_t v63 = v31[13];
  v64 = (void **)((char *)a1 + v63);
  char v65 = *((unsigned char *)a1 + v63 + 8);
  v66 = (void **)((char *)a2 + v63);
  int v67 = *((unsigned __int8 *)a2 + v63 + 8);
  if (v65)
  {
    if (!v67) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v64 != *v66) {
      LOBYTE(v67) = 1;
    }
    if (v67) {
      goto LABEL_80;
    }
  }
  uint64_t v68 = v31[14];
  v69 = (double *)((char *)a1 + v68);
  char v70 = *((unsigned char *)a1 + v68 + 8);
  v71 = (double *)((char *)a2 + v68);
  int v72 = *((unsigned __int8 *)a2 + v68 + 8);
  if (v70)
  {
    if (!v72) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v69 != *v71) {
      LOBYTE(v72) = 1;
    }
    if (v72) {
      goto LABEL_80;
    }
  }
  uint64_t v73 = v31[15];
  v74 = (double *)((char *)a1 + v73);
  char v75 = *((unsigned char *)a1 + v73 + 8);
  v76 = (double *)((char *)a2 + v73);
  int v77 = *((unsigned __int8 *)a2 + v73 + 8);
  if (v75)
  {
    if (!v77) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v74 != *v76) {
      LOBYTE(v77) = 1;
    }
    if (v77) {
      goto LABEL_80;
    }
  }
  if ((sub_25A77984C(*a1, *a2) & 1) == 0) {
    goto LABEL_80;
  }
  uint64_t v78 = v32[16];
  v79 = (_DWORD *)((char *)a1 + v78);
  char v80 = *((unsigned char *)a1 + v78 + 4);
  v81 = (_DWORD *)((char *)a2 + v78);
  int v82 = *((unsigned __int8 *)a2 + v78 + 4);
  if (v80)
  {
    if (!v82) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v79 != *v81) {
      LOBYTE(v82) = 1;
    }
    if (v82) {
      goto LABEL_80;
    }
  }
  uint64_t v83 = v32[17];
  v84 = (_DWORD *)((char *)a1 + v83);
  char v85 = *((unsigned char *)a1 + v83 + 4);
  v86 = (_DWORD *)((char *)a2 + v83);
  int v87 = *((unsigned __int8 *)a2 + v83 + 4);
  if (v85)
  {
    if (!v87) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v84 != *v86) {
      LOBYTE(v87) = 1;
    }
    if (v87) {
      goto LABEL_80;
    }
  }
  uint64_t v88 = v32[18];
  int v89 = *((unsigned __int8 *)a1 + v88);
  int v90 = *((unsigned __int8 *)a2 + v88);
  if (v89 == 2)
  {
    if (v90 != 2) {
      goto LABEL_80;
    }
  }
  else if (v90 == 2 || ((((v90 & 1) == 0) ^ v89) & 1) == 0)
  {
    goto LABEL_80;
  }
  sub_25A6E602C((uint64_t)a1 + v32[5], (uint64_t)v30, &qword_26A458338);
  sub_25A6E602C((uint64_t)a2 + v32[5], (uint64_t)v28, &qword_26A458338);
  uint64_t v91 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_25A6E602C((uint64_t)v30, (uint64_t)v21, &qword_26A458338);
  uint64_t v118 = v91;
  sub_25A6E602C((uint64_t)v28, v91, &qword_26A458338);
  uint64_t v131 = *(void *)(v131 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v131)(v21, 1, v16) != 1)
  {
    sub_25A6E602C((uint64_t)v21, (uint64_t)v25, &qword_26A458338);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v131)(v118, 1, v16) != 1)
    {
      sub_25A7797E4(v118, (uint64_t)v18, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
      char v96 = sub_25A78143C((uint64_t)v25, (uint64_t)v18);
      sub_25A74520C((uint64_t)v18, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
      sub_25A6E6090((uint64_t)v28, &qword_26A458338);
      sub_25A6E6090((uint64_t)v30, &qword_26A458338);
      sub_25A74520C((uint64_t)v25, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
      sub_25A6E6090((uint64_t)v21, &qword_26A458338);
      if ((v96 & 1) == 0) {
        goto LABEL_80;
      }
      goto LABEL_83;
    }
    sub_25A6E6090((uint64_t)v28, &qword_26A458338);
    sub_25A6E6090((uint64_t)v30, &qword_26A458338);
    sub_25A74520C((uint64_t)v25, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig.GenerationOptions.OneOf_SamplingStrategy);
LABEL_78:
    v92 = &qword_26A459088;
    uint64_t v93 = (uint64_t)v21;
LABEL_79:
    sub_25A6E6090(v93, v92);
    goto LABEL_80;
  }
  sub_25A6E6090((uint64_t)v28, &qword_26A458338);
  sub_25A6E6090((uint64_t)v30, &qword_26A458338);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v131)(v118, 1, v16) != 1) {
    goto LABEL_78;
  }
  sub_25A6E6090((uint64_t)v21, &qword_26A458338);
LABEL_83:
  uint64_t v97 = v32[19];
  v98 = (_DWORD *)((char *)a1 + v97);
  char v99 = *((unsigned char *)a1 + v97 + 4);
  v100 = (_DWORD *)((char *)a2 + v97);
  int v101 = *((unsigned __int8 *)a2 + v97 + 4);
  if (v99)
  {
    if (!v101) {
      goto LABEL_80;
    }
  }
  else
  {
    if (*v98 != *v100) {
      LOBYTE(v101) = 1;
    }
    if (v101) {
      goto LABEL_80;
    }
  }
  uint64_t v102 = v128;
  sub_25A6E602C((uint64_t)a1 + v32[20], v128, &qword_26A458358);
  uint64_t v103 = v127;
  sub_25A6E602C((uint64_t)a2 + v32[20], v127, &qword_26A458358);
  uint64_t v104 = v130;
  uint64_t v105 = v130 + *(int *)(v125 + 48);
  sub_25A6E602C(v102, v130, &qword_26A458358);
  sub_25A6E602C(v103, v105, &qword_26A458358);
  v106 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v126 + 48);
  if (v106(v104, 1, v129) == 1)
  {
    sub_25A6E6090(v127, &qword_26A458358);
    sub_25A6E6090(v128, &qword_26A458358);
    if (v106(v105, 1, v129) == 1)
    {
      sub_25A6E6090(v130, &qword_26A458358);
LABEL_96:
      v110 = (char *)a1 + v32[6];
      uint64_t v112 = v122;
      uint64_t v111 = v123;
      v113 = *(void (**)(char *, char *, uint64_t))(v122 + 16);
      v114 = v120;
      v113(v120, v110, v123);
      v115 = (char *)a2 + v32[6];
      v116 = v121;
      v113(v121, v115, v111);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v94 = sub_25A79B5A0();
      v117 = *(void (**)(char *, uint64_t))(v112 + 8);
      v117(v116, v111);
      v117(v114, v111);
      return v94 & 1;
    }
    goto LABEL_94;
  }
  sub_25A6E602C(v130, v124, &qword_26A458358);
  if (v106(v105, 1, v129) == 1)
  {
    sub_25A6E6090(v127, &qword_26A458358);
    sub_25A6E6090(v128, &qword_26A458358);
    sub_25A74520C(v124, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints);
LABEL_94:
    v92 = &qword_26A459080;
    uint64_t v93 = v130;
    goto LABEL_79;
  }
  uint64_t v107 = v119;
  sub_25A7797E4(v105, v119, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints);
  uint64_t v108 = v124;
  char v109 = sub_25A780770(v124, v107);
  sub_25A74520C(v107, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints);
  sub_25A6E6090(v127, &qword_26A458358);
  sub_25A6E6090(v128, &qword_26A458358);
  sub_25A74520C(v108, type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints);
  sub_25A6E6090(v130, &qword_26A458358);
  if (v109) {
    goto LABEL_96;
  }
LABEL_80:
  char v94 = 0;
  return v94 & 1;
}

uint64_t sub_25A78234C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = sub_25A79ADF0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(int *)(a3(0) + 20);
  uint64_t v16 = *(void *)(a1 + v15);
  uint64_t v17 = *(void *)(a2 + v15);
  if (v16 == v17
    || (swift_retain(), swift_retain(), char v18 = a4(v16, v17), swift_release(), swift_release(), (v18 & 1) != 0))
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v19(v14, a1, v8);
    v19(v12, a2, v8);
    sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
    char v20 = sub_25A79B5A0();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
    v21(v12, v8);
    v21(v14, v8);
  }
  else
  {
    char v20 = 0;
  }
  return v20 & 1;
}

uint64_t sub_25A782548(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A7825B0()
{
  unint64_t result = qword_26A4590C8;
  if (!qword_26A4590C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4590C8);
  }
  return result;
}

uint64_t sub_25A782604(uint64_t *a1, uint64_t *a2)
{
  uint64_t v97 = sub_25A79ADF0();
  uint64_t v107 = *(void *)(v97 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v97);
  char v96 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v95 = (char *)&v90 - v6;
  uint64_t v101 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t v106 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  uint64_t v105 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590E0);
  MEMORY[0x270FA5388](v100);
  uint64_t v102 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v98 = (uint64_t)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v104 = (uint64_t)&v90 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v112 = (uint64_t)&v90 - v14;
  uint64_t v15 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v109 = *(void *)(v15 - 8);
  uint64_t v110 = v15;
  MEMORY[0x270FA5388](v15);
  char v99 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590E8);
  MEMORY[0x270FA5388](v108);
  uint64_t v111 = (uint64_t)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v103 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v90 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v90 - v24;
  uint64_t v26 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  v113 = *(uint64_t **)(v26 - 8);
  uint64_t v114 = v26;
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v90 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590F0);
  MEMORY[0x270FA5388](v29);
  v31 = (char *)&v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  char v35 = (char *)&v90 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)&v90 - v37;
  MEMORY[0x270FA5388](v36);
  char v40 = (char *)&v90 - v39;
  if (!sub_25A779FD0(*a1, *a2)) {
    goto LABEL_10;
  }
  char v94 = v35;
  v92 = v28;
  int v90 = v23;
  uint64_t v91 = v25;
  v41 = (int *)type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceRequest(0);
  uint64_t v42 = v41[6];
  uint64_t v93 = a1;
  sub_25A6E602C((uint64_t)a1 + v42, (uint64_t)v40, &qword_26A458330);
  uint64_t v43 = a2;
  sub_25A6E602C((uint64_t)a2 + v41[6], (uint64_t)v38, &qword_26A458330);
  uint64_t v44 = (uint64_t)&v31[*(int *)(v29 + 48)];
  sub_25A6E602C((uint64_t)v40, (uint64_t)v31, &qword_26A458330);
  sub_25A6E602C((uint64_t)v38, v44, &qword_26A458330);
  uint64_t v45 = v114;
  v46 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v113[6];
  if (v46((uint64_t)v31, 1, v114) == 1)
  {
    sub_25A6E6090((uint64_t)v38, &qword_26A458330);
    sub_25A6E6090((uint64_t)v40, &qword_26A458330);
    if (v46(v44, 1, v45) == 1)
    {
      sub_25A6E6090((uint64_t)v31, &qword_26A458330);
      goto LABEL_13;
    }
LABEL_7:
    uint64_t v48 = &qword_26A4590F0;
LABEL_8:
    uint64_t v49 = (uint64_t)v31;
LABEL_9:
    sub_25A6E6090(v49, v48);
    goto LABEL_10;
  }
  v113 = v43;
  uint64_t v47 = (uint64_t)v94;
  sub_25A6E602C((uint64_t)v31, (uint64_t)v94, &qword_26A458330);
  if (v46(v44, 1, v45) == 1)
  {
    sub_25A6E6090((uint64_t)v38, &qword_26A458330);
    sub_25A6E6090((uint64_t)v40, &qword_26A458330);
    sub_25A74520C(v47, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
    goto LABEL_7;
  }
  uint64_t v52 = v47;
  uint64_t v53 = (uint64_t)v92;
  sub_25A7797E4(v44, (uint64_t)v92, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
  char v54 = sub_25A78234C(v52, v53, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig, (uint64_t (*)(uint64_t, uint64_t))sub_25A72EDD8);
  sub_25A74520C(v53, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
  sub_25A6E6090((uint64_t)v38, &qword_26A458330);
  sub_25A6E6090((uint64_t)v40, &qword_26A458330);
  sub_25A74520C(v52, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
  sub_25A6E6090((uint64_t)v31, &qword_26A458330);
  uint64_t v43 = v113;
  if ((v54 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_13:
  uint64_t v55 = v41[7];
  v56 = v93;
  int v57 = *((unsigned __int8 *)v93 + v55);
  int v58 = *((unsigned __int8 *)v43 + v55);
  if (v57 == 2)
  {
    if (v58 != 2) {
      goto LABEL_10;
    }
  }
  else if (v58 == 2 || ((((v58 & 1) == 0) ^ v57) & 1) == 0)
  {
    goto LABEL_10;
  }
  uint64_t v59 = (uint64_t)v91;
  sub_25A6E602C((uint64_t)v93 + v41[8], (uint64_t)v91, &qword_26A458320);
  v113 = v43;
  uint64_t v114 = (uint64_t)v41;
  uint64_t v60 = (uint64_t)v90;
  sub_25A6E602C((uint64_t)v43 + v41[8], (uint64_t)v90, &qword_26A458320);
  uint64_t v61 = v111;
  uint64_t v62 = v111 + *(int *)(v108 + 48);
  sub_25A6E602C(v59, v111, &qword_26A458320);
  sub_25A6E602C(v60, v62, &qword_26A458320);
  uint64_t v63 = v110;
  v64 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
  if (v64(v61, 1, v110) == 1)
  {
    sub_25A6E6090(v60, &qword_26A458320);
    sub_25A6E6090(v59, &qword_26A458320);
    int v65 = v64(v62, 1, v63);
    uint64_t v67 = v106;
    uint64_t v66 = v107;
    uint64_t v68 = (uint64_t)v105;
    uint64_t v69 = v112;
    if (v65 == 1)
    {
      sub_25A6E6090(v61, &qword_26A458320);
      goto LABEL_25;
    }
LABEL_23:
    uint64_t v48 = &qword_26A4590E8;
    uint64_t v49 = v61;
    goto LABEL_9;
  }
  char v70 = v103;
  sub_25A6E602C(v61, (uint64_t)v103, &qword_26A458320);
  int v71 = v64(v62, 1, v63);
  uint64_t v67 = v106;
  uint64_t v72 = v107;
  uint64_t v73 = v105;
  uint64_t v69 = v112;
  if (v71 == 1)
  {
    sub_25A6E6090((uint64_t)v90, &qword_26A458320);
    sub_25A6E6090((uint64_t)v91, &qword_26A458320);
    sub_25A74520C((uint64_t)v70, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
    goto LABEL_23;
  }
  v74 = v99;
  sub_25A7797E4(v62, (uint64_t)v99, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
  LODWORD(v110) = sub_25A77DD38(v70, v74);
  uint64_t v75 = (uint64_t)v73;
  sub_25A74520C((uint64_t)v74, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
  sub_25A6E6090((uint64_t)v90, &qword_26A458320);
  sub_25A6E6090((uint64_t)v91, &qword_26A458320);
  uint64_t v66 = v72;
  uint64_t v68 = v75;
  sub_25A74520C((uint64_t)v70, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
  sub_25A6E6090(v61, &qword_26A458320);
  if ((v110 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_25:
  uint64_t v76 = v114;
  sub_25A6E602C((uint64_t)v56 + *(int *)(v114 + 36), v69, &qword_26A4590D8);
  uint64_t v77 = v104;
  sub_25A6E602C((uint64_t)v113 + *(int *)(v76 + 36), v104, &qword_26A4590D8);
  v31 = v102;
  uint64_t v78 = (uint64_t)&v102[*(int *)(v100 + 48)];
  sub_25A6E602C(v69, (uint64_t)v102, &qword_26A4590D8);
  sub_25A6E602C(v77, v78, &qword_26A4590D8);
  v79 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48);
  uint64_t v80 = v101;
  if (v79((uint64_t)v31, 1, v101) == 1)
  {
    sub_25A6E6090(v77, &qword_26A4590D8);
    sub_25A6E6090(v69, &qword_26A4590D8);
    if (v79(v78, 1, v80) == 1)
    {
      sub_25A6E6090((uint64_t)v31, &qword_26A4590D8);
LABEL_32:
      uint64_t v83 = v114;
      v84 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
      char v85 = v95;
      uint64_t v86 = v97;
      v84(v95, (char *)v56 + *(int *)(v114 + 20), v97);
      int v87 = (char *)v113 + *(int *)(v83 + 20);
      uint64_t v88 = v96;
      v84(v96, v87, v86);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v50 = sub_25A79B5A0();
      int v89 = *(void (**)(char *, uint64_t))(v66 + 8);
      v89(v88, v86);
      v89(v85, v86);
      return v50 & 1;
    }
    goto LABEL_30;
  }
  uint64_t v81 = v98;
  sub_25A6E602C((uint64_t)v31, v98, &qword_26A4590D8);
  if (v79(v78, 1, v80) == 1)
  {
    sub_25A6E6090(v104, &qword_26A4590D8);
    sub_25A6E6090(v112, &qword_26A4590D8);
    sub_25A74520C(v81, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
LABEL_30:
    uint64_t v48 = &qword_26A4590E0;
    goto LABEL_8;
  }
  sub_25A7797E4(v78, v68, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
  char v82 = sub_25A77A878(v81, v68);
  sub_25A74520C(v68, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
  sub_25A6E6090(v104, &qword_26A4590D8);
  sub_25A6E6090(v112, &qword_26A4590D8);
  sub_25A74520C(v81, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
  sub_25A6E6090((uint64_t)v31, &qword_26A4590D8);
  if (v82) {
    goto LABEL_32;
  }
LABEL_10:
  char v50 = 0;
  return v50 & 1;
}

uint64_t sub_25A7832A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(uint64_t a1)
{
  return sub_25A6F372C(a1, (uint64_t *)&unk_26A4592C8);
}

uint64_t sub_25A78332C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v49 - v9;
  uint64_t v11 = (int *)type metadata accessor for Apple_Cloudml_Inference_Tie_TokenLevelInferenceMetrics(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (_DWORD *)(a1 + v12);
  char v14 = *(unsigned char *)(a1 + v12 + 4);
  uint64_t v15 = (_DWORD *)(a2 + v12);
  int v16 = *(unsigned __int8 *)(a2 + v12 + 4);
  if (v14)
  {
    if (!v16) {
      goto LABEL_38;
    }
  }
  else
  {
    if (*v13 != *v15) {
      LOBYTE(v16) = 1;
    }
    if (v16) {
      goto LABEL_38;
    }
  }
  uint64_t v17 = v11[6];
  int v18 = *(unsigned __int8 *)(a1 + v17);
  int v19 = *(unsigned __int8 *)(a2 + v17);
  if (v18 == 2)
  {
    if (v19 != 2) {
      goto LABEL_38;
    }
  }
  else if (v19 == 2 || ((((v19 & 1) == 0) ^ v18) & 1) == 0)
  {
    goto LABEL_38;
  }
  uint64_t v20 = v11[7];
  uint64_t v21 = (void *)(a1 + v20);
  char v22 = *(unsigned char *)(a1 + v20 + 8);
  uint64_t v23 = (void *)(a2 + v20);
  int v24 = *(unsigned __int8 *)(a2 + v20 + 8);
  if (v22)
  {
    if (!v24) {
      goto LABEL_38;
    }
  }
  else
  {
    if (*v21 != *v23) {
      LOBYTE(v24) = 1;
    }
    if (v24) {
      goto LABEL_38;
    }
  }
  uint64_t v25 = v11[8];
  uint64_t v26 = (void *)(a1 + v25);
  char v27 = *(unsigned char *)(a1 + v25 + 8);
  uint64_t v28 = (void *)(a2 + v25);
  int v29 = *(unsigned __int8 *)(a2 + v25 + 8);
  if (v27)
  {
    if (!v29) {
      goto LABEL_38;
    }
  }
  else
  {
    if (*v26 != *v28) {
      LOBYTE(v29) = 1;
    }
    if (v29) {
      goto LABEL_38;
    }
  }
  uint64_t v30 = v11[9];
  v31 = (void *)(a1 + v30);
  char v32 = *(unsigned char *)(a1 + v30 + 8);
  uint64_t v33 = (void *)(a2 + v30);
  int v34 = *(unsigned __int8 *)(a2 + v30 + 8);
  if (v32)
  {
    if (!v34) {
      goto LABEL_38;
    }
  }
  else
  {
    if (*v31 != *v33) {
      LOBYTE(v34) = 1;
    }
    if (v34) {
      goto LABEL_38;
    }
  }
  uint64_t v35 = v11[10];
  uint64_t v36 = (void *)(a1 + v35);
  char v37 = *(unsigned char *)(a1 + v35 + 8);
  uint64_t v38 = (void *)(a2 + v35);
  int v39 = *(unsigned __int8 *)(a2 + v35 + 8);
  if ((v37 & 1) == 0)
  {
    if (*v36 != *v38) {
      LOBYTE(v39) = 1;
    }
    if (v39) {
      goto LABEL_38;
    }
LABEL_36:
    uint64_t v40 = v11[11];
    v41 = (void *)(a1 + v40);
    char v42 = *(unsigned char *)(a1 + v40 + 8);
    uint64_t v43 = (void *)(a2 + v40);
    int v44 = *(unsigned __int8 *)(a2 + v40 + 8);
    if (v42)
    {
      if (!v44) {
        goto LABEL_38;
      }
    }
    else
    {
      if (*v41 != *v43) {
        LOBYTE(v44) = 1;
      }
      if (v44) {
        goto LABEL_38;
      }
    }
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v47(v10, a1, v4);
    v47(v8, a2, v4);
    sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
    char v45 = sub_25A79B5A0();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v5 + 8);
    v48(v8, v4);
    v48(v10, v4);
    return v45 & 1;
  }
  if (v39) {
    goto LABEL_36;
  }
LABEL_38:
  char v45 = 0;
  return v45 & 1;
}

uint64_t sub_25A783634(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v52 - v9;
  uint64_t v11 = (int *)type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceMetrics(0);
  uint64_t v12 = v11;
  uint64_t v13 = v11[6];
  char v14 = (_DWORD *)((char *)a1 + v13);
  char v15 = *((unsigned char *)a1 + v13 + 4);
  int v16 = (_DWORD *)((char *)a2 + v13);
  int v17 = *((unsigned __int8 *)a2 + v13 + 4);
  if (v15)
  {
    if (!v17) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v14 != *v16) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
      goto LABEL_40;
    }
  }
  uint64_t v18 = v11[7];
  int v19 = (_DWORD *)((char *)a1 + v18);
  char v20 = *((unsigned char *)a1 + v18 + 4);
  uint64_t v21 = (_DWORD *)((char *)a2 + v18);
  int v22 = *((unsigned __int8 *)a2 + v18 + 4);
  if (v20)
  {
    if (!v22) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v19 != *v21) {
      LOBYTE(v22) = 1;
    }
    if (v22) {
      goto LABEL_40;
    }
  }
  uint64_t v23 = v11[8];
  int v24 = (uint64_t *)((char *)a1 + v23);
  char v25 = *((unsigned char *)a1 + v23 + 8);
  uint64_t v26 = (uint64_t *)((char *)a2 + v23);
  int v27 = *((unsigned __int8 *)a2 + v23 + 8);
  if (v25)
  {
    if (!v27) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v24 != *v26) {
      LOBYTE(v27) = 1;
    }
    if (v27) {
      goto LABEL_40;
    }
  }
  uint64_t v28 = v11[9];
  int v29 = (uint64_t *)((char *)a1 + v28);
  char v30 = *((unsigned char *)a1 + v28 + 8);
  v31 = (uint64_t *)((char *)a2 + v28);
  int v32 = *((unsigned __int8 *)a2 + v28 + 8);
  if (v30)
  {
    if (!v32) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v29 != *v31) {
      LOBYTE(v32) = 1;
    }
    if (v32) {
      goto LABEL_40;
    }
  }
  uint64_t v33 = v11[10];
  int v34 = (uint64_t *)((char *)a1 + v33);
  char v35 = *((unsigned char *)a1 + v33 + 8);
  uint64_t v36 = (uint64_t *)((char *)a2 + v33);
  int v37 = *((unsigned __int8 *)a2 + v33 + 8);
  if (v35)
  {
    if (!v37) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v34 != *v36) {
      LOBYTE(v37) = 1;
    }
    if (v37) {
      goto LABEL_40;
    }
  }
  uint64_t v38 = v11[11];
  int v39 = (uint64_t *)((char *)a1 + v38);
  char v40 = *((unsigned char *)a1 + v38 + 8);
  v41 = (uint64_t *)((char *)a2 + v38);
  int v42 = *((unsigned __int8 *)a2 + v38 + 8);
  if (v40)
  {
    if (!v42) {
      goto LABEL_40;
    }
  }
  else
  {
    if (*v39 != *v41) {
      LOBYTE(v42) = 1;
    }
    if (v42) {
      goto LABEL_40;
    }
  }
  if (sub_25A77A03C(*a1, *a2))
  {
    uint64_t v43 = v12[12];
    int v44 = (uint64_t *)((char *)a1 + v43);
    char v45 = *((unsigned char *)a1 + v43 + 8);
    v46 = (uint64_t *)((char *)a2 + v43);
    int v47 = *((unsigned __int8 *)a2 + v43 + 8);
    if (v45)
    {
      if (!v47) {
        goto LABEL_40;
      }
    }
    else
    {
      if (*v44 != *v46) {
        LOBYTE(v47) = 1;
      }
      if (v47) {
        goto LABEL_40;
      }
    }
    char v50 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v50(v10, (char *)a1 + v12[5], v4);
    v50(v8, (char *)a2 + v12[5], v4);
    sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
    char v48 = sub_25A79B5A0();
    uint64_t v51 = *(void (**)(char *, uint64_t))(v5 + 8);
    v51(v8, v4);
    v51(v10, v4);
    return v48 & 1;
  }
LABEL_40:
  char v48 = 0;
  return v48 & 1;
}

uint64_t sub_25A783954(uint64_t a1, uint64_t a2)
{
  uint64_t v141 = a1;
  uint64_t v142 = a2;
  uint64_t v119 = sub_25A79ADF0();
  uint64_t v118 = *(void *)(v119 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v119);
  v117 = (char *)&v114 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v116 = (char *)&v114 - v4;
  uint64_t v121 = type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt(0);
  uint64_t v125 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  uint64_t v115 = (uint64_t)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459168);
  MEMORY[0x270FA5388](v120);
  uint64_t v126 = (char *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458278);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v124 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v122 = (char *)&v114 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v123 = (char *)&v114 - v12;
  uint64_t v13 = type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v138 = (uint64_t)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459170);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v129 = (uint64_t)&v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v133 = (uint64_t)&v114 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v137 = (uint64_t)&v114 - v22;
  MEMORY[0x270FA5388](v21);
  int v24 = (char *)&v114 - v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458280);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v127 = (uint64_t)&v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v131 = (uint64_t)&v114 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v128 = (uint64_t)&v114 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v130 = (uint64_t)&v114 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v135 = (uint64_t)&v114 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v132 = (uint64_t)&v114 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v134 = (uint64_t)&v114 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  int v42 = (char *)&v114 - v41;
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  uint64_t v136 = (uint64_t)&v114 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  int v47 = (char *)&v114 - v46;
  uint64_t v48 = MEMORY[0x270FA5388](v45);
  char v50 = (char *)&v114 - v49;
  MEMORY[0x270FA5388](v48);
  uint64_t v52 = (char *)&v114 - v51;
  uint64_t v53 = type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo(0);
  sub_25A6E602C(v141 + *(int *)(v53 + 20), (uint64_t)v52, &qword_26A458280);
  v140 = (int *)v53;
  sub_25A6E602C(v142 + *(int *)(v53 + 20), (uint64_t)v50, &qword_26A458280);
  uint64_t v139 = v16;
  uint64_t v54 = (uint64_t)&v24[*(int *)(v16 + 48)];
  sub_25A6E602C((uint64_t)v52, (uint64_t)v24, &qword_26A458280);
  sub_25A6E602C((uint64_t)v50, v54, &qword_26A458280);
  uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (v55((uint64_t)v24, 1, v13) == 1)
  {
    sub_25A6E6090((uint64_t)v50, &qword_26A458280);
    sub_25A6E6090((uint64_t)v52, &qword_26A458280);
    if (v55(v54, 1, v13) == 1)
    {
      uint64_t v56 = v13;
      int v57 = v55;
      sub_25A6E6090((uint64_t)v24, &qword_26A458280);
      goto LABEL_8;
    }
LABEL_6:
    int v58 = &qword_26A459170;
    uint64_t v59 = (uint64_t)v24;
LABEL_29:
    sub_25A6E6090(v59, v58);
    goto LABEL_30;
  }
  sub_25A6E602C((uint64_t)v24, (uint64_t)v47, &qword_26A458280);
  uint64_t v114 = v13;
  if (v55(v54, 1, v13) == 1)
  {
    sub_25A6E6090((uint64_t)v50, &qword_26A458280);
    sub_25A6E6090((uint64_t)v52, &qword_26A458280);
    sub_25A74520C((uint64_t)v47, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
    goto LABEL_6;
  }
  int v57 = v55;
  uint64_t v60 = v138;
  sub_25A7797E4(v54, v138, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  char v61 = sub_25A784CD0((uint64_t)v47, v60, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A74520C(v60, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090((uint64_t)v50, &qword_26A458280);
  sub_25A6E6090((uint64_t)v52, &qword_26A458280);
  sub_25A74520C((uint64_t)v47, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090((uint64_t)v24, &qword_26A458280);
  uint64_t v56 = v114;
  if ((v61 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_8:
  uint64_t v62 = v140;
  uint64_t v63 = v141;
  uint64_t v64 = v136;
  sub_25A6E602C(v141 + v140[6], v136, &qword_26A458280);
  sub_25A6E602C(v142 + v62[6], (uint64_t)v42, &qword_26A458280);
  uint64_t v65 = v137;
  uint64_t v66 = v137 + *(int *)(v139 + 48);
  sub_25A6E602C(v64, v137, &qword_26A458280);
  sub_25A6E602C((uint64_t)v42, v66, &qword_26A458280);
  if (v57(v65, 1, v56) == 1)
  {
    uint64_t v67 = v57;
    sub_25A6E6090((uint64_t)v42, &qword_26A458280);
    sub_25A6E6090(v64, &qword_26A458280);
    if (v57(v66, 1, v56) == 1)
    {
      sub_25A6E6090(v65, &qword_26A458280);
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  uint64_t v68 = v134;
  sub_25A6E602C(v65, v134, &qword_26A458280);
  if (v57(v66, 1, v56) == 1)
  {
    sub_25A6E6090((uint64_t)v42, &qword_26A458280);
    sub_25A6E6090(v64, &qword_26A458280);
    sub_25A74520C(v68, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
LABEL_13:
    int v58 = &qword_26A459170;
    uint64_t v59 = v65;
    goto LABEL_29;
  }
  uint64_t v67 = v57;
  uint64_t v69 = v138;
  sub_25A7797E4(v66, v138, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  char v70 = sub_25A784CD0(v68, v69, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A74520C(v69, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090((uint64_t)v42, &qword_26A458280);
  sub_25A6E6090(v64, &qword_26A458280);
  sub_25A74520C(v68, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  uint64_t v63 = v141;
  sub_25A6E6090(v65, &qword_26A458280);
  if ((v70 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  int v71 = v140;
  uint64_t v72 = v132;
  sub_25A6E602C(v63 + v140[7], v132, &qword_26A458280);
  uint64_t v73 = v135;
  sub_25A6E602C(v142 + v71[7], v135, &qword_26A458280);
  uint64_t v74 = v133;
  uint64_t v75 = v133 + *(int *)(v139 + 48);
  sub_25A6E602C(v72, v133, &qword_26A458280);
  sub_25A6E602C(v73, v75, &qword_26A458280);
  if (v67(v74, 1, v56) == 1)
  {
    uint64_t v76 = v67;
    sub_25A6E6090(v73, &qword_26A458280);
    sub_25A6E6090(v72, &qword_26A458280);
    if (v67(v75, 1, v56) != 1) {
      goto LABEL_27;
    }
    sub_25A6E6090(v74, &qword_26A458280);
    goto LABEL_21;
  }
  uint64_t v77 = v130;
  sub_25A6E602C(v74, v130, &qword_26A458280);
  if (v67(v75, 1, v56) == 1)
  {
    sub_25A6E6090(v135, &qword_26A458280);
    sub_25A6E6090(v72, &qword_26A458280);
    uint64_t v78 = v77;
LABEL_26:
    sub_25A74520C(v78, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
    goto LABEL_27;
  }
  uint64_t v76 = v67;
  uint64_t v79 = v138;
  sub_25A7797E4(v75, v138, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  char v80 = sub_25A784CD0(v77, v79, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A74520C(v79, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090(v135, &qword_26A458280);
  sub_25A6E6090(v72, &qword_26A458280);
  sub_25A74520C(v77, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  uint64_t v63 = v141;
  sub_25A6E6090(v74, &qword_26A458280);
  if ((v80 & 1) == 0)
  {
LABEL_30:
    char v87 = 0;
    return v87 & 1;
  }
LABEL_21:
  uint64_t v81 = v140;
  uint64_t v82 = v63 + v140[8];
  uint64_t v83 = v128;
  sub_25A6E602C(v82, v128, &qword_26A458280);
  uint64_t v84 = v131;
  sub_25A6E602C(v142 + v81[8], v131, &qword_26A458280);
  uint64_t v74 = v129;
  uint64_t v85 = v129 + *(int *)(v139 + 48);
  sub_25A6E602C(v83, v129, &qword_26A458280);
  sub_25A6E602C(v84, v85, &qword_26A458280);
  if (v76(v74, 1, v56) == 1)
  {
    sub_25A6E6090(v84, &qword_26A458280);
    sub_25A6E6090(v83, &qword_26A458280);
    if (v76(v85, 1, v56) == 1)
    {
      sub_25A6E6090(v74, &qword_26A458280);
      goto LABEL_33;
    }
LABEL_27:
    int v58 = &qword_26A459170;
LABEL_28:
    uint64_t v59 = v74;
    goto LABEL_29;
  }
  uint64_t v86 = v127;
  sub_25A6E602C(v74, v127, &qword_26A458280);
  if (v76(v85, 1, v56) == 1)
  {
    sub_25A6E6090(v131, &qword_26A458280);
    sub_25A6E6090(v83, &qword_26A458280);
    uint64_t v78 = v86;
    goto LABEL_26;
  }
  uint64_t v89 = v83;
  uint64_t v90 = v138;
  sub_25A7797E4(v85, v138, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  char v91 = sub_25A784CD0(v86, v90, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A74520C(v90, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090(v131, &qword_26A458280);
  sub_25A6E6090(v89, &qword_26A458280);
  sub_25A74520C(v86, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.AssetInfo);
  sub_25A6E6090(v74, &qword_26A458280);
  if ((v91 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_33:
  uint64_t v92 = v141;
  uint64_t v93 = v140[9];
  char v94 = (void *)(v141 + v93);
  uint64_t v95 = *(void *)(v141 + v93 + 8);
  char v96 = (void *)(v142 + v93);
  uint64_t v97 = v96[1];
  if (!v95)
  {
    uint64_t v98 = v125;
    uint64_t v74 = (uint64_t)v126;
    uint64_t v100 = (uint64_t)v123;
    uint64_t v99 = (uint64_t)v124;
    uint64_t v101 = (uint64_t)v122;
    if (v97) {
      goto LABEL_30;
    }
LABEL_40:
    uint64_t v102 = v140;
    sub_25A6E602C(v92 + v140[10], v100, &qword_26A458278);
    sub_25A6E602C(v142 + v102[10], v101, &qword_26A458278);
    uint64_t v103 = v74 + *(int *)(v120 + 48);
    sub_25A6E602C(v100, v74, &qword_26A458278);
    sub_25A6E602C(v101, v103, &qword_26A458278);
    uint64_t v104 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48);
    uint64_t v105 = v121;
    if (v104(v74, 1, v121) == 1)
    {
      sub_25A6E6090(v101, &qword_26A458278);
      sub_25A6E6090(v100, &qword_26A458278);
      if (v104(v103, 1, v105) == 1)
      {
        sub_25A6E6090(v74, &qword_26A458278);
LABEL_47:
        uint64_t v108 = v118;
        uint64_t v109 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 16);
        uint64_t v110 = v116;
        uint64_t v111 = v119;
        v109(v116, v141, v119);
        uint64_t v112 = v117;
        v109(v117, v142, v111);
        sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
        char v87 = sub_25A79B5A0();
        v113 = *(void (**)(char *, uint64_t))(v108 + 8);
        v113(v112, v111);
        v113(v110, v111);
        return v87 & 1;
      }
    }
    else
    {
      sub_25A6E602C(v74, v99, &qword_26A458278);
      if (v104(v103, 1, v105) != 1)
      {
        uint64_t v106 = v115;
        sub_25A7797E4(v103, v115, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt);
        char v107 = sub_25A784A58(v99, v106);
        sub_25A74520C(v106, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt);
        sub_25A6E6090(v101, &qword_26A458278);
        sub_25A6E6090(v100, &qword_26A458278);
        sub_25A74520C(v99, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt);
        sub_25A6E6090(v74, &qword_26A458278);
        if (v107) {
          goto LABEL_47;
        }
        goto LABEL_30;
      }
      sub_25A6E6090(v101, &qword_26A458278);
      sub_25A6E6090(v100, &qword_26A458278);
      sub_25A74520C(v99, type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt);
    }
    int v58 = &qword_26A459168;
    goto LABEL_28;
  }
  uint64_t v98 = v125;
  uint64_t v74 = (uint64_t)v126;
  uint64_t v100 = (uint64_t)v123;
  uint64_t v99 = (uint64_t)v124;
  uint64_t v101 = (uint64_t)v122;
  if (!v97) {
    goto LABEL_30;
  }
  if (*v94 == *v96 && v95 == v97) {
    goto LABEL_40;
  }
  char v87 = 0;
  if (sub_25A79BA20()) {
    goto LABEL_40;
  }
  return v87 & 1;
}

uint64_t sub_25A784A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = (int *)type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt(0);
  uint64_t v12 = v11[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_27;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_27;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_25A79BA20() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[8];
    uint64_t v20 = (uint64_t *)(a1 + v19);
    char v21 = *(unsigned char *)(a1 + v19 + 9);
    uint64_t v22 = (uint64_t *)(a2 + v19);
    char v23 = *(unsigned char *)(a2 + v19 + 9);
    if (v21)
    {
      if ((v23 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
      if (v23) {
        goto LABEL_27;
      }
      uint64_t v24 = *v20;
      uint64_t v25 = *v22;
      if (v22[1])
      {
        if (v25)
        {
          if (v25 == 1)
          {
            if (v24 != 1) {
              goto LABEL_27;
            }
          }
          else if (v24 != 2)
          {
            goto LABEL_27;
          }
        }
        else if (v24)
        {
          goto LABEL_27;
        }
      }
      else if (v24 != v25)
      {
        goto LABEL_27;
      }
    }
    if (sub_25A779FD0(*(void *)a1, *(void *)a2)
      && (sub_25A77984C(*(void **)(a1 + 8), *(void **)(a2 + 8)) & 1) != 0)
    {
      uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v26(v10, a1 + v11[6], v4);
      v26(v8, a2 + v11[6], v4);
      sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
      char v18 = sub_25A79B5A0();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
      v27(v8, v4);
      v27(v10, v4);
      return v18 & 1;
    }
LABEL_27:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_25A784CD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = a3(0);
  uint64_t v14 = *(int *)(v13 + 20);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = *(void *)(a1 + v14 + 8);
  BOOL v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  if (!v16)
  {
    if (v18) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (!v18) {
    goto LABEL_19;
  }
  BOOL v19 = *v15 == *v17 && v16 == v18;
  if (v19 || (char v20 = 0, (sub_25A79BA20() & 1) != 0))
  {
LABEL_10:
    uint64_t v21 = *(int *)(v13 + 24);
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = *(void *)(a1 + v21 + 8);
    uint64_t v24 = (void *)(a2 + v21);
    uint64_t v25 = v24[1];
    if (v23)
    {
      if (v25)
      {
        if (*v22 != *v24 || v23 != v25)
        {
          char v20 = 0;
          if ((sub_25A79BA20() & 1) == 0) {
            return v20 & 1;
          }
        }
LABEL_20:
        uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
        v27(v12, a1, v6);
        v27(v10, a2, v6);
        sub_25A776C1C(&qword_26A459050, MEMORY[0x263F50560]);
        char v20 = sub_25A79B5A0();
        uint64_t v28 = *(void (**)(char *, uint64_t))(v7 + 8);
        v28(v10, v6);
        v28(v12, v6);
        return v20 & 1;
      }
    }
    else if (!v25)
    {
      goto LABEL_20;
    }
LABEL_19:
    char v20 = 0;
  }
  return v20 & 1;
}

unint64_t sub_25A784F08()
{
  unint64_t result = qword_26A459210;
  if (!qword_26A459210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459210);
  }
  return result;
}

unint64_t sub_25A784F5C()
{
  unint64_t result = qword_26A459260;
  if (!qword_26A459260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459260);
  }
  return result;
}

uint64_t *sub_25A784FD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a1;
    uint64_t v7 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
    uint64_t v8 = *(int *)(v7 + 20);
    uint64_t v9 = (char *)v6 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(v7 + 24);
    uint64_t v14 = (uint64_t *)((char *)v6 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v6;
}

uint64_t sub_25A7850E8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0) + 20);
  uint64_t v3 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

void *sub_25A785180(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A79ADF0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  uint64_t v10 = *(int *)(v4 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25A785248(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = *(int *)(v4 + 24);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  void *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_25A785318(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + *(int *)(v4 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 24));
  return a1;
}

void *sub_25A7853B8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  uint64_t v9 = *(int *)(v4 + 24);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  void *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A785470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  return MEMORY[0x270FA0340](a1, a2, v4, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t sub_25A7854CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  return MEMORY[0x270FA0580](a1, a2, a3, v6, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t sub_25A785538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A785550(a1, a2, a3, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1);
}

uint64_t sub_25A785550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v6 <= 0x3F)
  {
    uint64_t v7 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v7 + 84);
  }
  return result;
}

uint64_t sub_25A78560C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_154Tm_4);
}

uint64_t sub_25A785624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_155Tm_4);
}

uint64_t *sub_25A785640(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    *((_WORD *)v9 + 4) = *((_WORD *)v10 + 4);
  }
  return a1;
}

uint64_t sub_25A78571C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t sub_25A7857A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __int16 v10 = *(_WORD *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = v10;
  return a1;
}

uint64_t sub_25A785834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t sub_25A7858C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t sub_25A78594C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_154Tm_5);
}

uint64_t sub_25A785964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_155Tm_5);
}

uint64_t sub_25A78597C()
{
  return sub_25A78B1DC();
}

void *sub_25A785988(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    __int16 v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v11);
      *(void *)&v14[*(int *)(v16 + 20)] = *(void *)&v15[*(int *)(v16 + 20)];
      BOOL v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56);
      swift_retain();
      v19(v14, 0, 1, v16);
    }
    uint64_t v20 = a3[8];
    *((unsigned char *)v7 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v21 = (void *)((char *)v7 + v20);
    uint64_t v22 = (void *)((char *)a2 + v20);
    uint64_t v23 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      uint64_t v26 = v22[1];
      void *v21 = *v22;
      v21[1] = v26;
      int v42 = v12;
      uint64_t v43 = v11;
      uint64_t v27 = v22[3];
      v21[2] = v22[2];
      v21[3] = v27;
      uint64_t v28 = v22[5];
      v21[4] = v22[4];
      v21[5] = v28;
      uint64_t v29 = *(int *)(v23 + 28);
      uint64_t v30 = (char *)v21 + v29;
      uint64_t v31 = (char *)v22 + v29;
      swift_bridgeObjectRetain();
      uint64_t v11 = v43;
      swift_bridgeObjectRetain();
      uint64_t v12 = v42;
      swift_bridgeObjectRetain();
      v42(v30, v31, v43);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    uint64_t v32 = a3[9];
    uint64_t v33 = (char *)v7 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      v12(v33, v34, v11);
      uint64_t v38 = *(int *)(v35 + 20);
      uint64_t v39 = &v33[v38];
      uint64_t v40 = &v34[v38];
      *(void *)uint64_t v39 = *(void *)v40;
      *((_WORD *)v39 + 4) = *((_WORD *)v40 + 4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return v7;
}

uint64_t sub_25A785D88(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_25A79ADF0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v13(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v13(v6, v5);
    swift_release();
  }
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13(v8 + *(int *)(v9 + 28), v5);
  }
  uint64_t v10 = a1 + a2[9];
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(v10, v5);
  }
  return result;
}

void *sub_25A785F88(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    *(void *)&v12[*(int *)(v14 + 20)] = *(void *)&v13[*(int *)(v14 + 20)];
    uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
    swift_retain();
    v17(v12, 0, 1, v14);
  }
  uint64_t v18 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  BOOL v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = v20[1];
    *BOOL v19 = *v20;
    v19[1] = v24;
    uint64_t v40 = v10;
    uint64_t v41 = v9;
    uint64_t v25 = v20[3];
    v19[2] = v20[2];
    v19[3] = v25;
    uint64_t v26 = v20[5];
    v19[4] = v20[4];
    v19[5] = v26;
    uint64_t v27 = *(int *)(v21 + 28);
    uint64_t v28 = (char *)v19 + v27;
    uint64_t v29 = (char *)v20 + v27;
    swift_bridgeObjectRetain();
    uint64_t v9 = v41;
    swift_bridgeObjectRetain();
    uint64_t v10 = v40;
    swift_bridgeObjectRetain();
    v40(v28, v29, v41);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v30 = a3[9];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v10(v31, v32, v9);
    uint64_t v36 = *(int *)(v33 + 20);
    uint64_t v37 = &v31[v36];
    uint64_t v38 = &v32[v36];
    *(void *)uint64_t v37 = *(void *)v38;
    *((_WORD *)v37 + 4) = *((_WORD *)v38 + 4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

void *sub_25A78633C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  uint64_t v51 = *(void (**)(char *, char *))(v52 + 24);
  v51(v7, v8);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v11, v12, v53);
      *(void *)&v11[*(int *)(v13 + 20)] = *(void *)&v12[*(int *)(v13 + 20)];
      uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      swift_retain();
      v18(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_25A74520C((uint64_t)v11, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v11, v12, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  ((void (*)(char *, char *, uint64_t))v51)(v11, v12, v53);
  *(void *)&v11[*(int *)(v13 + 20)] = *(void *)&v12[*(int *)(v13 + 20)];
  swift_retain();
  swift_release();
LABEL_7:
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      void *v21 = *v22;
      v21[1] = v22[1];
      v21[2] = v22[2];
      v21[3] = v22[3];
      v21[4] = v22[4];
      v21[5] = v22[5];
      uint64_t v28 = *(int *)(v23 + 28);
      uint64_t v29 = (char *)v21 + v28;
      char v50 = (char *)v22 + v28;
      uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v49(v29, v50, v53);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    sub_25A74520C((uint64_t)v21, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
LABEL_12:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v21, v22, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = v22[2];
  v21[3] = v22[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[4] = v22[4];
  v21[5] = v22[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v51)((char *)v21 + *(int *)(v23 + 28), (char *)v22 + *(int *)(v23 + 28), v53);
LABEL_13:
  uint64_t v31 = a3[9];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      ((void (*)(char *, char *, uint64_t))v51)(v32, v33, v53);
      uint64_t v45 = *(int *)(v34 + 20);
      uint64_t v46 = &v32[v45];
      int v47 = &v33[v45];
      __int16 v48 = *((_WORD *)v47 + 4);
      *(void *)uint64_t v46 = *(void *)v47;
      *((_WORD *)v46 + 4) = v48;
      return a1;
    }
    sub_25A74520C((uint64_t)v32, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
    goto LABEL_18;
  }
  if (v38)
  {
LABEL_18:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
    memcpy(v32, v33, *(void *)(*(void *)(v43 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v32, v33, v53);
  uint64_t v39 = *(int *)(v34 + 20);
  uint64_t v40 = &v32[v39];
  uint64_t v41 = &v33[v39];
  __int16 v42 = *((_WORD *)v41 + 4);
  *(void *)uint64_t v40 = *(void *)v41;
  *((_WORD *)v40 + 4) = v42;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

void *sub_25A7868EC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    *(void *)&v12[*(int *)(v14 + 20)] = *(void *)&v13[*(int *)(v14 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v18 = (_OWORD *)((char *)a1 + v17);
  uint64_t v19 = (_OWORD *)((char *)a2 + v17);
  uint64_t v20 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    long long v23 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v23;
    v18[2] = v19[2];
    v10((char *)v18 + *(int *)(v20 + 28), (char *)v19 + *(int *)(v20 + 28), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  uint64_t v24 = a3[9];
  uint64_t v25 = (char *)a1 + v24;
  int v26 = (char *)a2 + v24;
  uint64_t v27 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    v10(v25, v26, v9);
    uint64_t v30 = *(int *)(v27 + 20);
    uint64_t v31 = &v25[v30];
    uint64_t v32 = &v26[v30];
    *(void *)uint64_t v31 = *(void *)v32;
    *((_WORD *)v31 + 4) = *((_WORD *)v32 + 4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

void *sub_25A786C54(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v50 = v9;
  __int16 v48 = *(void (**)(char *, char *))(v49 + 40);
  v48(v7, v8);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v11, v12, v50);
      *(void *)&v11[*(int *)(v13 + 20)] = *(void *)&v12[*(int *)(v13 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_25A74520C((uint64_t)v11, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  ((void (*)(char *, char *, uint64_t))v48)(v11, v12, v50);
  *(void *)&v11[*(int *)(v13 + 20)] = *(void *)&v12[*(int *)(v13 + 20)];
  swift_release();
LABEL_7:
  uint64_t v19 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      long long v27 = *((_OWORD *)v21 + 1);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      *((_OWORD *)v20 + 1) = v27;
      *((_OWORD *)v20 + 2) = *((_OWORD *)v21 + 2);
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))((char *)v20 + *(int *)(v22 + 28), (char *)v21 + *(int *)(v22 + 28), v50);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v26)
  {
    sub_25A74520C((uint64_t)v20, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
LABEL_12:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v20, v21, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v42 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v42;
  swift_bridgeObjectRelease();
  uint64_t v43 = v21[3];
  v20[2] = v21[2];
  v20[3] = v43;
  swift_bridgeObjectRelease();
  uint64_t v44 = v21[5];
  v20[4] = v21[4];
  v20[5] = v44;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v48)((char *)v20 + *(int *)(v22 + 28), (char *)v21 + *(int *)(v22 + 28), v50);
LABEL_13:
  uint64_t v29 = a3[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig(0);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      ((void (*)(char *, char *, uint64_t))v48)(v30, v31, v50);
      uint64_t v45 = *(int *)(v32 + 20);
      uint64_t v46 = &v30[v45];
      int v47 = &v31[v45];
      *(void *)uint64_t v46 = *(void *)v47;
      *((_WORD *)v46 + 4) = *((_WORD *)v47 + 4);
      return a1;
    }
    sub_25A74520C((uint64_t)v30, type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
    goto LABEL_18;
  }
  if (v36)
  {
LABEL_18:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
    memcpy(v30, v31, *(void *)(*(void *)(v40 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v30, v31, v50);
  uint64_t v37 = *(int *)(v32 + 20);
  int v38 = &v30[v37];
  uint64_t v39 = &v31[v37];
  *(void *)int v38 = *(void *)v39;
  *((_WORD *)v38 + 4) = *((_WORD *)v39 + 4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  return a1;
}

uint64_t sub_25A787174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A787188);
}

uint64_t sub_25A787188(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_25A79ADF0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v14(&a1[v11], a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_11;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_11;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
  int v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = &a1[a3[9]];
  return v16(v18, a2, v17);
}

uint64_t sub_25A787358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78736C);
}

char *sub_25A78736C(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_25A79ADF0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v14(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_9;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4590D8);
  int v16 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = &v5[a4[9]];
  return (char *)v16(v18, a2, a2, v17);
}

void sub_25A78753C()
{
  sub_25A79ADF0();
  if (v0 <= 0x3F)
  {
    sub_25A734F58(319, &qword_26A459308, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
    if (v1 <= 0x3F)
    {
      sub_25A734F58(319, &qword_26A459310, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
      if (v2 <= 0x3F)
      {
        sub_25A734F58(319, &qword_26A459318, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_InternalModelConfig);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void *sub_25A7876E8(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = v10;
    uint64_t v14 = v12;
    v12(v9, v13, v11);
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)((char *)v7 + v15);
    uint64_t v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)v7 + v16;
    uint64_t v21 = (_OWORD *)((char *)a2 + v16);
    unint64_t v22 = *(void *)((char *)a2 + v16 + 8);
    swift_bridgeObjectRetain();
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v20 = *v21;
    }
    else
    {
      uint64_t v23 = *(void *)v21;
      sub_25A6F9710(v23, v22);
      *(void *)uint64_t v20 = v23;
      *((void *)v20 + 1) = v22;
    }
    uint64_t v24 = a3[9];
    int v25 = (char *)v7 + v24;
    int v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      v14(v25, v26, v11);
      *(void *)&v25[*(int *)(v27 + 20)] = *(void *)&v26[*(int *)(v27 + 20)];
      uint64_t v30 = *(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56);
      swift_retain();
      v30(v25, 0, 1, v27);
    }
    uint64_t v31 = a3[11];
    *((unsigned char *)v7 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v32 = (void *)((char *)v7 + v31);
    uint64_t v33 = (void *)((char *)a2 + v31);
    uint64_t v34 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
      memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      uint64_t v37 = v33[1];
      void *v32 = *v33;
      v32[1] = v37;
      uint64_t v64 = v14;
      uint64_t v67 = v11;
      uint64_t v38 = v33[3];
      v32[2] = v33[2];
      v32[3] = v38;
      uint64_t v39 = v33[5];
      v32[4] = v33[4];
      v32[5] = v39;
      uint64_t v40 = *(int *)(v34 + 28);
      uint64_t v41 = (char *)v32 + v40;
      uint64_t v42 = (char *)v33 + v40;
      swift_bridgeObjectRetain();
      uint64_t v14 = v64;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v43 = v41;
      uint64_t v11 = v67;
      v64(v43, v42, v67);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    uint64_t v44 = a3[12];
    uint64_t v45 = (void *)((char *)v7 + v44);
    uint64_t v46 = (void *)((char *)a2 + v44);
    uint64_t v47 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
    uint64_t v48 = *(void *)(v47 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
    {
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
      memcpy(v45, v46, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      uint64_t v50 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
      uint64_t v51 = *(void *)(v50 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v51 + 48))(v46, 1, v50))
      {
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
        memcpy(v45, v46, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        *uint64_t v45 = *v46;
        uint64_t v65 = v51;
        uint64_t v68 = v11;
        uint64_t v53 = v14;
        uint64_t v54 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
        uint64_t v55 = *(int *)(v54 + 20);
        uint64_t v63 = (char *)v45 + v55;
        uint64_t v56 = (char *)v46 + v55;
        swift_bridgeObjectRetain();
        int v57 = v56;
        uint64_t v11 = v68;
        v53(v63, v57, v68);
        uint64_t v58 = *(int *)(v54 + 24);
        uint64_t v14 = v53;
        uint64_t v59 = (void *)((char *)v45 + v58);
        uint64_t v60 = (void *)((char *)v46 + v58);
        uint64_t v61 = v60[1];
        void *v59 = *v60;
        v59[1] = v61;
        uint64_t v66 = *(void (**)(void *, void, uint64_t, uint64_t))(v65 + 56);
        swift_bridgeObjectRetain();
        v66(v45, 0, 1, v50);
      }
      v14((char *)v45 + *(int *)(v47 + 20), (char *)v46 + *(int *)(v47 + 20), v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
    }
  }
  return v7;
}

uint64_t sub_25A787C80(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25A79ADF0();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v18(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + a2[8]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_25A6F2C28(*v6, v7);
  }
  uint64_t v8 = a1 + a2[9];
  uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    v18(v8, v5);
    swift_release();
  }
  uint64_t v10 = a1 + a2[11];
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18(v10 + *(int *)(v11 + 28), v5);
  }
  uint64_t v12 = a1 + a2[12];
  uint64_t v13 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13);
  if (!result)
  {
    uint64_t v15 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v12, 1, v15))
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      v18(v12 + *(int *)(v16 + 20), v5);
      swift_bridgeObjectRelease();
    }
    uint64_t v17 = v12 + *(int *)(v13 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v18)(v17, v5);
  }
  return result;
}

void *sub_25A787F40(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25A79ADF0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = v9;
  uint64_t v13 = v11;
  v11(v8, v12, v10);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (char *)a1 + v15;
  uint64_t v20 = (_OWORD *)((char *)a2 + v15);
  unint64_t v21 = *(void *)((char *)a2 + v15 + 8);
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *v20;
  }
  else
  {
    uint64_t v22 = *(void *)v20;
    sub_25A6F9710(v22, v21);
    *(void *)uint64_t v19 = v22;
    *((void *)v19 + 1) = v21;
  }
  uint64_t v23 = a3[9];
  uint64_t v24 = (char *)a1 + v23;
  int v25 = (char *)a2 + v23;
  uint64_t v26 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    v13(v24, v25, v10);
    *(void *)&v24[*(int *)(v26 + 20)] = *(void *)&v25[*(int *)(v26 + 20)];
    uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56);
    swift_retain();
    v29(v24, 0, 1, v26);
  }
  uint64_t v30 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v33 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v36 = v32[1];
    void *v31 = *v32;
    v31[1] = v36;
    uint64_t v63 = v13;
    uint64_t v66 = v10;
    uint64_t v37 = v32[3];
    v31[2] = v32[2];
    v31[3] = v37;
    uint64_t v38 = v32[5];
    v31[4] = v32[4];
    v31[5] = v38;
    uint64_t v39 = *(int *)(v33 + 28);
    uint64_t v40 = (char *)v31 + v39;
    uint64_t v41 = (char *)v32 + v39;
    swift_bridgeObjectRetain();
    uint64_t v13 = v63;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v42 = v40;
    uint64_t v10 = v66;
    v63(v42, v41, v66);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  uint64_t v43 = a3[12];
  uint64_t v44 = (void *)((char *)a1 + v43);
  uint64_t v45 = (void *)((char *)a2 + v43);
  uint64_t v46 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t v47 = *(void *)(v46 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
  {
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
  }
  else
  {
    uint64_t v49 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    uint64_t v50 = *(void *)(v49 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v50 + 48))(v45, 1, v49))
    {
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
      memcpy(v44, v45, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      *uint64_t v44 = *v45;
      uint64_t v64 = v50;
      uint64_t v67 = v10;
      uint64_t v52 = v13;
      uint64_t v53 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      uint64_t v54 = *(int *)(v53 + 20);
      uint64_t v62 = (char *)v44 + v54;
      uint64_t v55 = (char *)v45 + v54;
      swift_bridgeObjectRetain();
      uint64_t v56 = v55;
      uint64_t v10 = v67;
      v52(v62, v56, v67);
      uint64_t v57 = *(int *)(v53 + 24);
      uint64_t v13 = v52;
      uint64_t v58 = (void *)((char *)v44 + v57);
      uint64_t v59 = (void *)((char *)v45 + v57);
      uint64_t v60 = v59[1];
      *uint64_t v58 = *v59;
      v58[1] = v60;
      uint64_t v65 = *(void (**)(void *, void, uint64_t, uint64_t))(v64 + 56);
      swift_bridgeObjectRetain();
      v65(v44, 0, 1, v49);
    }
    v13((char *)v44 + *(int *)(v46 + 20), (char *)v45 + *(int *)(v46 + 20), v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
  }
  return a1;
}

void *sub_25A788484(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v86 = *(void *)(v9 - 8);
  uint64_t v84 = *(void (**)(char *, char *, uint64_t))(v86 + 24);
  v84(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  unint64_t v16 = *(void *)((char *)a2 + v13 + 8);
  uint64_t v89 = v9;
  if (*(void *)((char *)a1 + v13 + 8) >> 60 == 15)
  {
    if (v16 >> 60 != 15)
    {
      uint64_t v17 = *v15;
      sub_25A6F9710(*v15, v16);
      uint64_t *v14 = v17;
      v14[1] = v16;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v16 >> 60 == 15)
  {
    sub_25A6FA83C((uint64_t)v14);
LABEL_6:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_8;
  }
  uint64_t v18 = *v15;
  sub_25A6F9710(*v15, v16);
  uint64_t v19 = *v14;
  unint64_t v20 = v14[1];
  uint64_t *v14 = v18;
  v14[1] = v16;
  sub_25A6F2C28(v19, v20);
LABEL_8:
  uint64_t v21 = a3[9];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v22, v23, v89);
      *(void *)&v22[*(int *)(v24 + 20)] = *(void *)&v23[*(int *)(v24 + 20)];
      uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56);
      swift_retain();
      v29(v22, 0, 1, v24);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v28)
  {
    sub_25A74520C((uint64_t)v22, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
LABEL_13:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v22, v23, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_14;
  }
  v84(v22, v23, v89);
  *(void *)&v22[*(int *)(v24 + 20)] = *(void *)&v23[*(int *)(v24 + 20)];
  swift_retain();
  swift_release();
LABEL_14:
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v31 = a3[11];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v34 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      void *v32 = *v33;
      v32[1] = v33[1];
      v32[2] = v33[2];
      v32[3] = v33[3];
      v32[4] = v33[4];
      v32[5] = v33[5];
      uint64_t v39 = *(int *)(v34 + 28);
      uint64_t v40 = (char *)v32 + v39;
      uint64_t v81 = (char *)v33 + v39;
      uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v79(v40, v81, v89);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v38)
  {
    sub_25A74520C((uint64_t)v32, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
LABEL_19:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v32, v33, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_20;
  }
  void *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32[2] = v33[2];
  v32[3] = v33[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32[4] = v33[4];
  v32[5] = v33[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v84((char *)v32 + *(int *)(v34 + 28), (char *)v33 + *(int *)(v34 + 28), v89);
LABEL_20:
  uint64_t v42 = a3[12];
  uint64_t v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  int v48 = v47(v43, 1, v45);
  int v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (v49)
    {
      sub_25A74520C((uint64_t)v43, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate);
      goto LABEL_26;
    }
    uint64_t v54 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    uint64_t v55 = *(void *)(v54 - 8);
    uint64_t v56 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v55 + 48);
    int v57 = v56(v43, 1, v54);
    int v58 = v56(v44, 1, v54);
    if (v57)
    {
      if (!v58)
      {
        *(void *)uint64_t v43 = *(void *)v44;
        uint64_t v59 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
        uint64_t v60 = *(int *)(v59 + 20);
        uint64_t v82 = &v43[v60];
        uint64_t v61 = &v44[v60];
        char v87 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
        swift_bridgeObjectRetain();
        uint64_t v62 = v89;
        v87(v82, v61, v89);
        uint64_t v63 = *(int *)(v59 + 24);
        uint64_t v64 = &v43[v63];
        uint64_t v65 = &v44[v63];
        *(void *)uint64_t v64 = *(void *)v65;
        *((void *)v64 + 1) = *((void *)v65 + 1);
        uint64_t v66 = *(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56);
        swift_bridgeObjectRetain();
        v66(v43, 0, 1, v54);
LABEL_37:
        v84(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v62);
        return a1;
      }
    }
    else
    {
      if (!v58)
      {
        *(void *)uint64_t v43 = *(void *)v44;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v75 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
        uint64_t v62 = v89;
        v84(&v43[*(int *)(v75 + 20)], &v44[*(int *)(v75 + 20)], v89);
        uint64_t v76 = *(int *)(v75 + 24);
        uint64_t v77 = &v43[v76];
        uint64_t v78 = &v44[v76];
        *(void *)uint64_t v77 = *(void *)v78;
        *((void *)v77 + 1) = *((void *)v78 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_37;
      }
      sub_25A74520C((uint64_t)v43, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
    }
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(v43, v44, *(void *)(*(void *)(v73 - 8) + 64));
    uint64_t v62 = v89;
    goto LABEL_37;
  }
  if (v49)
  {
LABEL_26:
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
    memcpy(v43, v44, *(void *)(*(void *)(v53 - 8) + 64));
    return a1;
  }
  uint64_t v50 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v51 = *(void *)(v50 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v44, 1, v50))
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(v43, v44, *(void *)(*(void *)(v52 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v86 + 16))(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v89);
  }
  else
  {
    *(void *)uint64_t v43 = *(void *)v44;
    uint64_t v67 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
    uint64_t v68 = *(int *)(v67 + 20);
    uint64_t v83 = &v43[v68];
    uint64_t v85 = v67;
    char v80 = &v44[v68];
    uint64_t v69 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
    swift_bridgeObjectRetain();
    v69(v83, v80, v89);
    uint64_t v70 = *(int *)(v85 + 24);
    int v71 = &v43[v70];
    uint64_t v72 = &v44[v70];
    *(void *)int v71 = *(void *)v72;
    *((void *)v71 + 1) = *((void *)v72 + 1);
    uint64_t v88 = *(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56);
    swift_bridgeObjectRetain();
    v88(v43, 0, 1, v50);
    v69(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v89);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

_OWORD *sub_25A788E14(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v10(v13, v14, v9);
    *(void *)&v13[*(int *)(v15 + 20)] = *(void *)&v14[*(int *)(v15 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v19 = (_OWORD *)((char *)a1 + v18);
  unint64_t v20 = (_OWORD *)((char *)a2 + v18);
  uint64_t v21 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v22 = *(void *)(v21 - 8);
  int v37 = v10;
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    long long v24 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v24;
    v19[2] = v20[2];
    v10((char *)v19 + *(int *)(v21 + 28), (char *)v20 + *(int *)(v21 + 28), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v25 = a3[12];
  uint64_t v26 = (void *)((char *)a1 + v25);
  int v27 = (void *)((char *)a2 + v25);
  uint64_t v28 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v31 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    uint64_t v32 = *(void *)(v31 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v32 + 48))(v27, 1, v31))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
      memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      void *v26 = *v27;
      uint64_t v36 = v32;
      uint64_t v34 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      v37((char *)v26 + *(int *)(v34 + 20), (char *)v27 + *(int *)(v34 + 20), v9);
      *(_OWORD *)((char *)v26 + *(int *)(v34 + 24)) = *(_OWORD *)((char *)v27 + *(int *)(v34 + 24));
      (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v26, 0, 1, v31);
    }
    v37((char *)v26 + *(int *)(v28 + 20), (char *)v27 + *(int *)(v28 + 20), v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  return a1;
}

void *sub_25A789294(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v73 = *(void *)(v9 - 8);
  uint64_t v74 = v9;
  int v71 = *(void (**)(char *, char *))(v73 + 40);
  v71(v7, v8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (uint64_t)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  unint64_t v18 = *(void *)((char *)a1 + v15 + 8);
  if (v18 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v19 = *((void *)v17 + 1);
  if (v19 >> 60 == 15)
  {
    sub_25A6FA83C(v16);
LABEL_4:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    goto LABEL_6;
  }
  uint64_t v20 = *(void *)v16;
  *(void *)uint64_t v16 = *(void *)v17;
  *(void *)(v16 + 8) = v19;
  sub_25A6F2C28(v20, v18);
LABEL_6:
  uint64_t v21 = a3[9];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig(0);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v22, v23, v74);
      *(void *)&v22[*(int *)(v24 + 20)] = *(void *)&v23[*(int *)(v24 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v28)
  {
    sub_25A74520C((uint64_t)v22, type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
LABEL_11:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_12;
  }
  ((void (*)(char *, char *, uint64_t))v71)(v22, v23, v74);
  *(void *)&v22[*(int *)(v24 + 20)] = *(void *)&v23[*(int *)(v24 + 20)];
  swift_release();
LABEL_12:
  uint64_t v30 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v33 = type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata(0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (v36)
  {
    if (!v37)
    {
      long long v38 = *((_OWORD *)v32 + 1);
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
      *((_OWORD *)v31 + 1) = v38;
      *((_OWORD *)v31 + 2) = *((_OWORD *)v32 + 2);
      (*(void (**)(char *, char *, uint64_t))(v73 + 32))((char *)v31 + *(int *)(v33 + 28), (char *)v32 + *(int *)(v33 + 28), v74);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v37)
  {
    sub_25A74520C((uint64_t)v31, type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
LABEL_17:
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
    memcpy(v31, v32, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_18;
  }
  uint64_t v52 = v32[1];
  void *v31 = *v32;
  v31[1] = v52;
  swift_bridgeObjectRelease();
  uint64_t v53 = v32[3];
  v31[2] = v32[2];
  v31[3] = v53;
  swift_bridgeObjectRelease();
  uint64_t v54 = v32[5];
  v31[4] = v32[4];
  v31[5] = v54;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v71)((char *)v31 + *(int *)(v33 + 28), (char *)v32 + *(int *)(v33 + 28), v74);
LABEL_18:
  uint64_t v40 = a3[12];
  uint64_t v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate(0);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  int v46 = v45(v41, 1, v43);
  int v47 = v45(v42, 1, v43);
  if (!v46)
  {
    if (v47)
    {
      sub_25A74520C((uint64_t)v41, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate);
      goto LABEL_24;
    }
    uint64_t v55 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    uint64_t v56 = *(void *)(v55 - 8);
    int v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
    int v58 = v57(v41, 1, v55);
    int v59 = v57(v42, 1, v55);
    if (v58)
    {
      uint64_t v60 = v74;
      if (!v59)
      {
        *(void *)uint64_t v41 = *(void *)v42;
        uint64_t v61 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
        (*(void (**)(char *, char *, uint64_t))(v73 + 32))(&v41[*(int *)(v61 + 20)], &v42[*(int *)(v61 + 20)], v74);
        *(_OWORD *)&v41[*(int *)(v61 + 24)] = *(_OWORD *)&v42[*(int *)(v61 + 24)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v41, 0, 1, v55);
LABEL_35:
        ((void (*)(char *, char *, uint64_t))v71)(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v60);
        return a1;
      }
    }
    else
    {
      uint64_t v60 = v74;
      if (!v59)
      {
        *(void *)uint64_t v41 = *(void *)v42;
        swift_bridgeObjectRelease();
        uint64_t v65 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
        ((void (*)(char *, char *, uint64_t))v71)(&v41[*(int *)(v65 + 20)], &v42[*(int *)(v65 + 20)], v74);
        uint64_t v66 = *(int *)(v65 + 24);
        uint64_t v67 = &v41[v66];
        uint64_t v68 = &v42[v66];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        *(void *)uint64_t v67 = v70;
        *((void *)v67 + 1) = v69;
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_25A74520C((uint64_t)v41, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
    }
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(v41, v42, *(void *)(*(void *)(v63 - 8) + 64));
    goto LABEL_35;
  }
  if (v47)
  {
LABEL_24:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
    memcpy(v41, v42, *(void *)(*(void *)(v51 - 8) + 64));
    return a1;
  }
  uint64_t v48 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v49 = *(void *)(v48 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v42, 1, v48))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(v41, v42, *(void *)(*(void *)(v50 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v74);
  }
  else
  {
    *(void *)uint64_t v41 = *(void *)v42;
    uint64_t v72 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
    uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
    v62(&v41[*(int *)(v72 + 20)], &v42[*(int *)(v72 + 20)], v74);
    *(_OWORD *)&v41[*(int *)(v72 + 24)] = *(_OWORD *)&v42[*(int *)(v72 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v41, 0, 1, v48);
    v62(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v74);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
  return a1;
}

uint64_t sub_25A789ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A789AE0);
}

uint64_t sub_25A789AE0(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_25A79ADF0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v14(&a1[v11], a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_11;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[11];
    goto LABEL_11;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  unint64_t v18 = &a1[a3[12]];
  return v16(v18, a2, v17);
}

uint64_t sub_25A789CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A789CC4);
}

char *sub_25A789CC4(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_25A79ADF0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v14(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458330);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_9;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458320);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[11];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458350);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  unint64_t v18 = &v5[a4[12]];
  return (char *)v16(v18, a2, a2, v17);
}

void sub_25A789E94()
{
  sub_25A79ADF0();
  if (v0 <= 0x3F)
  {
    sub_25A734F58(319, &qword_26A459308, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_ModelConfig);
    if (v1 <= 0x3F)
    {
      sub_25A734F58(319, &qword_26A459310, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_RequestMetadata);
      if (v2 <= 0x3F)
      {
        sub_25A734F58(319, &qword_26A459330, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t *sub_25A78A054(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      uint64_t v16 = *(int *)(v12 + 20);
      uint64_t v17 = &v10[v16];
      unint64_t v18 = &v11[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
      swift_bridgeObjectRetain();
      v20(v10, 0, 1, v12);
    }
    uint64_t v21 = *(int *)(a3 + 24);
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    *(_DWORD *)uint64_t v22 = *(_DWORD *)v23;
    v22[4] = v23[4];
  }
  return a1;
}

uint64_t sub_25A78A234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A78A334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    unint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
    swift_bridgeObjectRetain();
    v18(v9, 0, 1, v11);
  }
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  *(unsigned char *)(v20 + 4) = *(unsigned char *)(v21 + 4);
  return a1;
}

uint64_t sub_25A78A4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 24);
  v7(a1, a2, v6);
  uint64_t v30 = a3;
  uint64_t v31 = a2;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v32 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      uint64_t v26 = *(int *)(v11 + 20);
      int v27 = &v9[v26];
      int v28 = &v10[v26];
      *(void *)int v27 = *(void *)v28;
      *((void *)v27 + 1) = *((void *)v28 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_25A74520C((uint64_t)v9, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
    memcpy(v9, v10, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v9, v10, v6);
  uint64_t v16 = *(int *)(v11 + 20);
  uint64_t v17 = &v9[v16];
  unint64_t v18 = &v10[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  swift_bridgeObjectRetain();
  v19(v9, 0, 1, v11);
LABEL_7:
  uint64_t v21 = *(int *)(v30 + 24);
  uint64_t result = v32;
  uint64_t v23 = v32 + v21;
  uint64_t v24 = (int *)(v31 + v21);
  int v25 = *v24;
  *(unsigned char *)(v23 + 4) = *((unsigned char *)v24 + 4);
  *(_DWORD *)uint64_t v23 = v25;
  return result;
}

uint64_t sub_25A78A72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[*(int *)(v11 + 20)] = *(_OWORD *)&v10[*(int *)(v11 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  *(unsigned char *)(v15 + 4) = *(unsigned char *)(v16 + 4);
  return a1;
}

uint64_t sub_25A78A8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 40);
  v7(a1, a2, v6);
  uint64_t v27 = a3;
  uint64_t v28 = a2;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v29 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      uint64_t v21 = *(int *)(v11 + 20);
      uint64_t v22 = &v9[v21];
      uint64_t v23 = &v10[v21];
      uint64_t v25 = *(void *)v23;
      uint64_t v24 = *((void *)v23 + 1);
      *(void *)uint64_t v22 = v25;
      *((void *)v22 + 1) = v24;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_25A74520C((uint64_t)v9, type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458368);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v9, v10, v6);
  *(_OWORD *)&v9[*(int *)(v11 + 20)] = *(_OWORD *)&v10[*(int *)(v11 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = *(int *)(v27 + 24);
  uint64_t result = v29;
  uint64_t v19 = v29 + v17;
  uint64_t v20 = v28 + v17;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
  *(unsigned char *)(v19 + 4) = *(unsigned char *)(v20 + 4);
  return result;
}

uint64_t sub_25A78AAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78AB08);
}

uint64_t sub_25A78AB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_210Tm(a1, a2, a3, &qword_26A458368);
}

uint64_t __swift_get_extra_inhabitant_index_210Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = sub_25A79ADF0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    return v10(a1, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 20);
    return v13(v15, a2, v14);
  }
}

uint64_t sub_25A78AC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78AC24);
}

uint64_t sub_25A78AC24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_211Tm(a1, a2, a3, a4, &qword_26A458368);
}

uint64_t __swift_store_extra_inhabitant_index_211Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = sub_25A79ADF0();
  uint64_t v11 = *(void *)(v10 - 8);
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    return v12(a1, a2, a2, v10);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + *(int *)(a4 + 20);
    return v15(v17, a2, a2, v16);
  }
}

void sub_25A78AD44()
{
  sub_25A79ADF0();
  if (v0 <= 0x3F)
  {
    sub_25A734F58(319, &qword_26A459348, (void (*)(uint64_t))type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateRequest.Delimiter.SpecialToken);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_25A78AE30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25A78AF08(uint64_t a1)
{
  uint64_t v2 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A78AF80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25A78B008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A78B0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A78B120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A78B1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_200Tm_2);
}

uint64_t sub_25A78B1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_201Tm_2);
}

uint64_t sub_25A78B1DC()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25A78B26C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t sub_25A78B37C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_25A79ADF0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25A78B404(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_25A79ADF0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *sub_25A78B4C4(void *a1, void *a2, uint64_t a3)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_25A78B5A0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_25A78B624(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_25A78B6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78B6E4);
}

uint64_t __swift_get_extra_inhabitant_index_222Tm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25A79ADF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25A78B798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78B7AC);
}

uint64_t __swift_store_extra_inhabitant_index_223Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A78B858()
{
  return sub_25A78B868();
}

uint64_t sub_25A78B868()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25A78B904(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      uint64_t v12 = *(int *)(v11 + 20);
      uint64_t v25 = (char *)a2 + v12;
      uint64_t v26 = (char *)a1 + v12;
      uint64_t v13 = sub_25A79ADF0();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
      swift_bridgeObjectRetain();
      v14(v26, v25, v13);
      uint64_t v15 = *(int *)(v11 + 24);
      uint64_t v16 = (uint64_t *)((char *)a1 + v15);
      uint64_t v17 = (uint64_t *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      void *v16 = *v17;
      v16[1] = v18;
      uint64_t v19 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain();
      v19(a1, 0, 1, v7);
    }
    uint64_t v20 = *(int *)(a3 + 20);
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_25A79ADF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  }
  return a1;
}

uint64_t sub_25A78BB30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = a1 + *(int *)(type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0) + 20);
    uint64_t v6 = sub_25A79ADF0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  uint64_t v8 = sub_25A79ADF0();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

void *sub_25A78BC4C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
    uint64_t v10 = *(int *)(v9 + 20);
    uint64_t v24 = (char *)a1 + v10;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_25A79ADF0();
    uint64_t v25 = a3;
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v24, v11, v12);
    uint64_t v14 = *(int *)(v9 + 24);
    uint64_t v15 = (void *)((char *)a1 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = *(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v18(a1, 0, 1, v6);
    a3 = v25;
  }
  uint64_t v19 = *(int *)(a3 + 20);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

void *sub_25A78BE34(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v26 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      uint64_t v27 = *(int *)(v26 + 20);
      uint64_t v28 = (char *)a1 + v27;
      uint64_t v29 = (char *)a2 + v27;
      uint64_t v30 = sub_25A79ADF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
      uint64_t v31 = *(int *)(v26 + 24);
      uint64_t v32 = (void *)((char *)a1 + v31);
      uint64_t v33 = (void *)((char *)a2 + v31);
      void *v32 = *v33;
      v32[1] = v33[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_25A74520C((uint64_t)a1, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  *a1 = *a2;
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v34 = (char *)a1 + v12;
  uint64_t v13 = (char *)a2 + v12;
  uint64_t v14 = sub_25A79ADF0();
  uint64_t v35 = a3;
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v34, v13, v14);
  uint64_t v16 = *(int *)(v11 + 24);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  uint64_t v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v19(a1, 0, 1, v6);
  a3 = v35;
LABEL_7:
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

void *sub_25A78C100(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v9 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
    uint64_t v10 = *(int *)(v9 + 20);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_25A79ADF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    *(_OWORD *)((char *)a1 + *(int *)(v9 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v9 + 24));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

void *sub_25A78C2B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      swift_bridgeObjectRelease();
      uint64_t v22 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
      uint64_t v23 = *(int *)(v22 + 20);
      uint64_t v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      uint64_t v26 = sub_25A79ADF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
      uint64_t v27 = *(int *)(v22 + 24);
      uint64_t v28 = (void *)((char *)a1 + v27);
      uint64_t v29 = (void *)((char *)a2 + v27);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      *uint64_t v28 = v31;
      v28[1] = v30;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_25A74520C((uint64_t)a1, type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.OneOf_PromptTemplateType);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458348);
    memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *a1 = *a2;
  uint64_t v11 = type metadata accessor for Apple_Cloudml_Inference_Tie_PromptTemplate.PromptTemplateV1(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)((char *)a1 + *(int *)(v11 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v11 + 24));
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_25A78C52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78C540);
}

uint64_t sub_25A78C540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_171Tm(a1, a2, a3, &qword_26A458348);
}

uint64_t __swift_get_extra_inhabitant_index_171Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 20);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_25A78C644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78C658);
}

uint64_t sub_25A78C658(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_172Tm(a1, a2, a3, a4, &qword_26A458348);
}

uint64_t __swift_store_extra_inhabitant_index_172Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, v9);
  }
  else
  {
    uint64_t v13 = sub_25A79ADF0();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + *(int *)(a4 + 20);
    return v14(v16, a2, a2, v15);
  }
}

void sub_25A78C768(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_25A78C788(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  sub_25A734F58(319, a4, a5);
  if (v5 <= 0x3F)
  {
    sub_25A79ADF0();
    if (v6 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_25A78C858(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A79ADF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v7 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_25A78C964(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *sub_25A78C9F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25A78CAB4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_25A78CB7C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_25A78CC14(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A79ADF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A78CCC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78CCD8);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25A79ADF0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25A78CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78CDA0);
}

void *__swift_store_extra_inhabitant_indexTm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A78CE4C()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25A78CEF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25A78CFE0(uint64_t a1)
{
  uint64_t v2 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A78D068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25A78D108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A78D1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_25A78D254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A78D2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78D310);
}

uint64_t __swift_get_extra_inhabitant_index_200Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25A78D3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78D3F8);
}

uint64_t __swift_store_extra_inhabitant_index_201Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A79ADF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_25A78D4BC()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Apple_Cloudml_Inference_Tie_GenerateResponse.StatusResponse.Status()
{
  return &type metadata for Apple_Cloudml_Inference_Tie_GenerateResponse.StatusResponse.Status;
}

void *sub_25A78D564(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    a1 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A79ADF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = (char *)a1 + v8;
    int v11 = (char *)a2 + v8;
    *(_DWORD *)unint64_t v10 = *(_DWORD *)v11;
    v10[4] = v11[4];
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    v14[8] = v15[8];
    *(void *)uint64_t v14 = *(void *)v15;
    uint64_t v16 = (char *)a1 + v13;
    uint64_t v17 = (char *)a2 + v13;
    *(void *)uint64_t v16 = *(void *)v17;
    v16[8] = v17[8];
    uint64_t v18 = a3[9];
    uint64_t v19 = a3[10];
    uint64_t v20 = (char *)a1 + v18;
    uint64_t v21 = (char *)a2 + v18;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = (char *)a1 + v19;
    uint64_t v23 = (char *)a2 + v19;
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    uint64_t v24 = a3[11];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = *(void *)v26;
    v25[8] = v26[8];
    *(void *)uint64_t v25 = v27;
  }
  return a1;
}

uint64_t sub_25A78D6CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
  *(unsigned char *)(v9 + 4) = *(unsigned char *)(v10 + 4);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a3[11];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  return a1;
}

uint64_t sub_25A78D7E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (int *)(a2 + v7);
  int v10 = *v9;
  *(unsigned char *)(v8 + 4) = *((unsigned char *)v9 + 4);
  *(_DWORD *)uint64_t v8 = v10;
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  LOBYTE(v10) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v10;
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  LOBYTE(v10) = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = v10;
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  LOBYTE(v10) = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = v10;
  uint64_t v20 = a3[10];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  LOBYTE(v10) = *(unsigned char *)(v22 + 8);
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = v10;
  uint64_t v23 = a3[11];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  LOBYTE(v10) = *(unsigned char *)(v25 + 8);
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = v10;
  return a1;
}

uint64_t sub_25A78D908(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
  *(unsigned char *)(v9 + 4) = *(unsigned char *)(v10 + 4);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a3[11];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  return a1;
}

uint64_t sub_25A78DA20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
  *(unsigned char *)(v9 + 4) = *(unsigned char *)(v10 + 4);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a3[11];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  return a1;
}

uint64_t sub_25A78DB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78DB4C);
}

uint64_t sub_25A78DB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79ADF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25A78DC28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78DC3C);
}

uint64_t sub_25A78DC3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A79ADF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 2;
  }
  return result;
}

uint64_t sub_25A78DCF8()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar.OneOf_GrammarVersion()
{
  return &type metadata for Apple_Cloudml_Inference_Tie_Constraints.PartialGrammar.OneOf_GrammarVersion;
}

ValueMetadata *type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Grammar.OneOf_GrammarVersion()
{
  return &type metadata for Apple_Cloudml_Inference_Tie_Constraints.Grammar.OneOf_GrammarVersion;
}

ValueMetadata *type metadata accessor for Apple_Cloudml_Inference_Tie_Constraints.Schema.OneOf_SchemaVersion()
{
  return &type metadata for Apple_Cloudml_Inference_Tie_Constraints.Schema.OneOf_SchemaVersion;
}

uint64_t getEnumTagSinglePayload for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt.Source(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt.Source(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_25A78DE28(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A78DE44(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt.Source()
{
  return &type metadata for Apple_Cloudml_Inference_Tie_InferenceEnvironmentInfo.RenderedPrompt.Source;
}

uint64_t sub_25A78DE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_154Tm_6);
}

uint64_t sub_25A78DE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_155Tm_6);
}

uint64_t sub_25A78DEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_25A78DF10(uint64_t a1)
{
  uint64_t v2 = sub_25A79ADF0();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25A78DF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_25A78DFD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_25A78E03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25A78E0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_25A78E104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78E118);
}

uint64_t __swift_get_extra_inhabitant_index_154Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25A78E188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78E19C);
}

uint64_t __swift_store_extra_inhabitant_index_155Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79ADF0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25A78E210()
{
  uint64_t result = sub_25A79ADF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25A78E2A0()
{
  unint64_t result = qword_26A4593D8;
  if (!qword_26A4593D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4593D8);
  }
  return result;
}

unint64_t sub_25A78E2F8()
{
  unint64_t result = qword_26A4593E0;
  if (!qword_26A4593E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4593E0);
  }
  return result;
}

unint64_t sub_25A78E350()
{
  unint64_t result = qword_26A4593E8;
  if (!qword_26A4593E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4593E8);
  }
  return result;
}

unint64_t sub_25A78E3A8()
{
  unint64_t result = qword_26A4593F0;
  if (!qword_26A4593F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4593F0);
  }
  return result;
}

unint64_t sub_25A78E400()
{
  unint64_t result = qword_26A4593F8;
  if (!qword_26A4593F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4593F8);
  }
  return result;
}

unint64_t sub_25A78E458()
{
  unint64_t result = qword_26A459400;
  if (!qword_26A459400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459400);
  }
  return result;
}

uint64_t *sub_25A78E4DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25A79B4E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25A78E5A8(uint64_t a1)
{
  uint64_t v2 = sub_25A79B4E0();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25A78E60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A78E688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A78E704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A78E780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A78E7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A78E810);
}

uint64_t sub_25A78E810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79B4E0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25A78E87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A78E890);
}

uint64_t sub_25A78E890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A79B4E0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for PrivateMLClientAlertService()
{
  uint64_t result = qword_26A459408;
  if (!qword_26A459408) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A78E94C()
{
  uint64_t result = sub_25A79B4E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A78E9E4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + *(int *)(type metadata accessor for PrivateMLClientAlertService() + 20)) = 1547038;
  return sub_25A79B4D0();
}

uint64_t sub_25A78EA58(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v80 = a1;
  uint64_t v81 = a3;
  uint64_t v10 = type metadata accessor for PrivateMLClientAlertService();
  uint64_t v76 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v77 = v11;
  uint64_t v78 = (uint64_t)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A79B4E0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v74 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v64 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v64 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v64 - v22;
  if (qword_26B32B870 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (byte_26B32B868 == 1)
  {
    uint64_t v68 = v21;
    uint64_t v70 = v18;
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v72 = v13 + 16;
    uint64_t v75 = v25;
    v25(v23, v6, v12);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_25A79B4C0();
    os_log_type_t v27 = sub_25A79B7E0();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v79 = v6;
    uint64_t v73 = v13;
    uint64_t v69 = a5;
    unint64_t v67 = a2;
    if (v28)
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v83 = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_25A6F6E40(v80, a2, &v83);
      sub_25A79B860();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_25A6F6E40(v81, a4, &v83);
      uint64_t v13 = v73;
      sub_25A79B860();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A6DD000, v26, v27, "displayPrivateMLClientFailedDialogIfInternal: %s RequestID:%s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      uint64_t v31 = v30;
      uint64_t v6 = v79;
      MEMORY[0x261143A60](v31, -1, -1);
      MEMORY[0x261143A60](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    int v71 = *(void (**)(char *, uint64_t))(v13 + 8);
    v71(v23, v12);
    id v32 = objc_allocWithZone(MEMORY[0x263EFFA48]);
    uint64_t v33 = (void *)sub_25A79B5B0();
    uint64_t v34 = (char *)objc_msgSend(v32, sel_initWithSuiteName_, v33);

    if (v34)
    {
      uint64_t v35 = (void *)sub_25A79B5B0();
      int v36 = (void *)sub_25A79B5B0();
      uint64_t v74 = v34;
      objc_msgSend(v34, sel_setObject_forKey_, v35, v36);

      type metadata accessor for PrivateMLClientAlert();
      uint64_t v37 = swift_allocObject();
      sub_25A79B4D0();
      *(void *)(v37 + 16) = 0xD00000000000001DLL;
      *(void *)(v37 + 24) = 0x800000025A7A4370;
      *(void *)(v37 + 32) = 0xD00000000000002DLL;
      *(void *)(v37 + 40) = 0x800000025A7A4390;
      strcpy((char *)(v37 + 48), "File a Radar");
      *(unsigned char *)(v37 + 61) = 0;
      *(_WORD *)(v37 + 62) = -5120;
      *(void *)(v37 + 64) = 0x7373696D736944;
      *(void *)(v37 + 72) = 0xE700000000000000;
      uint64_t v66 = v37;
      uint64_t v65 = type metadata accessor for PrivateMLClientAlertService;
      uint64_t v38 = v78;
      sub_25A790CB8(v6, v78, (uint64_t (*)(void))type metadata accessor for PrivateMLClientAlertService);
      unint64_t v39 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
      v77 += v39;
      uint64_t v40 = v12;
      unint64_t v41 = (v77 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v42 = (v41 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v43 = swift_allocObject();
      sub_25A7904E0(v38, v43 + v39);
      uint64_t v44 = (void *)(v43 + v41);
      uint64_t v45 = v79;
      unint64_t v46 = v67;
      *uint64_t v44 = v80;
      v44[1] = v46;
      int v47 = (void *)(v43 + v42);
      *int v47 = v81;
      v47[1] = a4;
      uint64_t v80 = v43;
      *(void *)(v43 + ((v42 + 23) & 0xFFFFFFFFFFFFFFF8)) = v69;
      sub_25A790CB8(v45, v38, (uint64_t (*)(void))v65);
      uint64_t v48 = swift_allocObject();
      sub_25A7904E0(v38, v48 + v39);
      uint64_t v49 = v68;
      uint64_t v81 = v40;
      v75(v68, v45, v40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_25A79B4C0();
      os_log_type_t v51 = sub_25A79B7E0();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl(&dword_25A6DD000, v50, v51, "Display Alert Box started", v52, 2u);
        MEMORY[0x261143A60](v52, -1, -1);
      }

      uint64_t v53 = v81;
      uint64_t v54 = (uint64_t (*)(char *, uint64_t))v71;
      uint64_t v78 = v73 + 8;
      v71(v49, v81);
      uint64_t v55 = v80;
      swift_retain();
      sub_25A6F7EC0((void (*)(__CFUserNotification *))sub_25A790544, v55, (void (*)(__CFUserNotification *))sub_25A7906D8);
      swift_release();
      uint64_t v56 = v70;
      v75(v70, v79, v53);
      int v57 = sub_25A79B4C0();
      os_log_type_t v58 = sub_25A79B7E0();
      if (os_log_type_enabled(v57, v58))
      {
        int v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v59 = 0;
        _os_log_impl(&dword_25A6DD000, v57, v58, "Display Alert Box finished", v59, 2u);
        MEMORY[0x261143A60](v59, -1, -1);
        swift_release();

        swift_release();
        swift_release();
      }
      else
      {

        swift_release();
        swift_release();

        swift_release();
      }
      return v54(v56, v81);
    }
    else
    {
      uint64_t v60 = v74;
      v75(v74, v6, v12);
      uint64_t v61 = sub_25A79B4C0();
      os_log_type_t v62 = sub_25A79B7F0();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v63 = 0;
        _os_log_impl(&dword_25A6DD000, v61, v62, "Failed to write requestID to userdefaults", v63, 2u);
        MEMORY[0x261143A60](v63, -1, -1);
      }

      return ((uint64_t (*)(char *, uint64_t))v71)(v60, v12);
    }
  }
  return result;
}

uint64_t sub_25A78F358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint8_t *a7)
{
  uint64_t v70 = a6;
  int v71 = a7;
  uint64_t v68 = a3;
  uint64_t v69 = a5;
  uint64_t v76 = a2;
  uint64_t v8 = type metadata accessor for PrivateMLClientAlertService();
  uint64_t v9 = v8 - 8;
  uint64_t v62 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v63 = v10;
  uint64_t v65 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4583B8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_25A79B4E0();
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (int *)type metadata accessor for TapToRadarDraft();
  uint64_t v75 = swift_allocBox();
  uint64_t v16 = v15;
  *(void *)uint64_t v15 = 0x4449656C646E7542;
  *(void *)(v15 + 8) = 0xE800000000000000;
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  strcpy((char *)(v15 + 72), "Classification");
  *(unsigned char *)(v15 + 87) = -18;
  *(unsigned char *)(v15 + 88) = 10;
  *(void *)(v15 + 96) = 0x6375646F72706552;
  *(void *)(v15 + 104) = 0xEF7974696C696269;
  *(unsigned char *)(v15 + 112) = 6;
  *(void *)(v15 + 120) = 0x656C746954;
  *(void *)(v15 + 128) = 0xE500000000000000;
  *(void *)(v15 + 136) = 0;
  *(void *)(v15 + 144) = 0;
  *(void *)(v15 + 152) = 0x7470697263736544;
  *(void *)(v15 + 160) = 0xEB000000006E6F69;
  *(void *)(v15 + 168) = 0;
  *(void *)(v15 + 176) = 0;
  *(void *)(v15 + 184) = 0x7364726F7779654BLL;
  *(void *)(v15 + 192) = 0xE800000000000000;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)(v15 + 200) = MEMORY[0x263F8EE78];
  uint64_t v18 = (void *)(v15 + v14[11]);
  uint64_t v19 = (uint64_t)v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A458600) + 36);
  uint64_t v67 = v19;
  uint64_t v20 = sub_25A79AC50();
  uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v66(v19, 1, 1, v20);
  *uint64_t v18 = 0x7349664F656D6954;
  v18[1] = 0xEB00000000657573;
  uint64_t v21 = (void *)(v16 + v14[12]);
  void *v21 = 0x656D686361747441;
  v21[1] = 0xEB0000000073746ELL;
  v21[2] = v17;
  uint64_t v22 = (void *)(v16 + v14[13]);
  *uint64_t v22 = 0xD000000000000011;
  v22[1] = 0x800000025A7A43C0;
  v22[2] = v17;
  uint64_t v23 = (void *)(v16 + v14[14]);
  *uint64_t v23 = 0xD000000000000014;
  v23[1] = 0x800000025A7A43E0;
  v23[2] = v17;
  uint64_t v24 = (char *)(v16 + v14[15]);
  strcpy(v24, "DeleteOnAttach");
  v24[15] = -18;
  v24[16] = 0;
  uint64_t v25 = (void *)(v16 + v14[16]);
  *uint64_t v25 = 0x4449656369766544;
  v25[1] = 0xE900000000000073;
  v25[2] = v17;
  uint64_t v26 = v16 + v14[17];
  strcpy((char *)v26, "DeviceClasses");
  *(_WORD *)(v26 + 14) = -4864;
  *(void *)(v26 + 16) = v17;
  uint64_t v27 = v16 + v14[18];
  strcpy((char *)v27, "DeviceModels");
  *(unsigned char *)(v27 + 13) = 0;
  *(_WORD *)(v27 + 14) = -5120;
  *(void *)(v27 + 16) = v17;
  BOOL v28 = (void *)(v16 + v14[19]);
  *BOOL v28 = 0xD000000000000016;
  v28[1] = 0x800000025A7A4400;
  v28[2] = 0;
  uint64_t v29 = v16 + v14[20];
  *(void *)uint64_t v29 = 0xD00000000000001ALL;
  *(void *)(v29 + 8) = 0x800000025A7A4420;
  *(unsigned char *)(v29 + 16) = 0;
  uint64_t v30 = v16 + v14[21];
  *(void *)uint64_t v30 = 0x676169446F747541;
  *(void *)(v30 + 8) = 0xEF73636974736F6ELL;
  *(unsigned char *)(v30 + 16) = 0;
  uint64_t v31 = (void *)(v16 + v14[22]);
  void *v31 = 0xD00000000000001BLL;
  v31[1] = 0x800000025A7A4440;
  v31[2] = v17;
  uint64_t v32 = v76;
  uint64_t v33 = (void *)(v16 + v14[23]);
  *uint64_t v33 = 0xD000000000000018;
  v33[1] = 0x800000025A7A4460;
  v33[2] = 0;
  v33[3] = 0;
  uint64_t v34 = (void *)(v16 + v14[24]);
  *uint64_t v34 = 0xD000000000000012;
  v34[1] = 0x800000025A7A4480;
  v34[2] = 0;
  v34[3] = 0;
  *(void *)(v16 + 32) = *(void *)(v32 + *(int *)(v9 + 28));
  *(_OWORD *)(v16 + 40) = xmmword_25A7A1F70;
  *(_OWORD *)(v16 + 56) = xmmword_25A7A1F80;
  *(unsigned char *)(v16 + 88) = 6;
  *(unsigned char *)(v16 + 112) = 5;
  *(void *)(v16 + 136) = v68;
  *(void *)(v16 + 144) = a4;
  uint64_t v78 = 0;
  unint64_t v79 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_25A79B8C0();
  sub_25A79B660();
  sub_25A79B660();
  sub_25A79B660();
  sub_25A79B660();
  sub_25A79B660();
  uint64_t v35 = v78;
  unint64_t v36 = v79;
  swift_bridgeObjectRelease();
  *(void *)(v16 + 168) = v35;
  *(void *)(v16 + 176) = v36;
  uint64_t v37 = v71;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458608);
  MEMORY[0x270FA5388](v38 - 8);
  uint64_t v40 = (char *)&v61 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A79AC40();
  v66((uint64_t)v40, 0, 1, v20);
  sub_25A79091C((uint64_t)v40, v67);
  if (*((void *)v37 + 2)) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v37 = (uint8_t *)&unk_270856C70;
  }
  swift_bridgeObjectRelease();
  v23[2] = v37;
  uint64_t v42 = v72;
  unint64_t v41 = v73;
  uint64_t v43 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v73, v32, v74);
  uint64_t v44 = v75;
  swift_retain_n();
  uint64_t v45 = sub_25A79B4C0();
  os_log_type_t v46 = sub_25A79B7E0();
  if (os_log_type_enabled(v45, v46))
  {
    int v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v80 = v48;
    *(_DWORD *)int v47 = 136315138;
    uint64_t v44 = v75;
    int v71 = v47 + 4;
    swift_beginAccess();
    uint64_t v49 = swift_bridgeObjectRetain();
    uint64_t v50 = MEMORY[0x261143170](v49, MEMORY[0x263F8D310]);
    unint64_t v52 = v51;
    swift_bridgeObjectRelease();
    uint64_t v77 = sub_25A6F6E40(v50, v52, &v80);
    sub_25A79B860();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A6DD000, v45, v46, "Using DiagnosticExtension: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v53 = v48;
    uint64_t v32 = v76;
    MEMORY[0x261143A60](v53, -1, -1);
    MEMORY[0x261143A60](v47, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v73, v74);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  }
  uint64_t v55 = (uint64_t)v64;
  uint64_t v54 = (uint64_t)v65;
  uint64_t v56 = v62;
  uint64_t v57 = sub_25A79B780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v55, 1, 1, v57);
  sub_25A790CB8(v32, v54, (uint64_t (*)(void))type metadata accessor for PrivateMLClientAlertService);
  unint64_t v58 = (*(unsigned __int8 *)(v56 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  int v59 = (void *)swift_allocObject();
  v59[2] = 0;
  v59[3] = 0;
  v59[4] = v44;
  sub_25A7904E0(v54, (uint64_t)v59 + v58);
  swift_retain();
  sub_25A7900C8(v55, (uint64_t)&unk_26A459420, (uint64_t)v59);
  swift_release();
  return swift_release();
}

uint64_t sub_25A78FC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a5;
  uint64_t v6 = sub_25A79B4E0();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  type metadata accessor for TapToRadarDraft();
  v5[9] = swift_task_alloc();
  v5[10] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_25A78FD74, 0, 0);
}

uint64_t sub_25A78FD74()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  swift_beginAccess();
  sub_25A790CB8(v2, v1, (uint64_t (*)(void))type metadata accessor for TapToRadarDraft);
  char v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *char v3 = v0;
  v3[1] = sub_25A78FE3C;
  return sub_25A7208A4();
}

uint64_t sub_25A78FE3C()
{
  uint64_t v2 = *(void *)(*v1 + 72);
  uint64_t v3 = *v1;
  *(void *)(v3 + 96) = v0;
  swift_task_dealloc();
  sub_25A790D20(v2);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25A78FFA8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_25A78FFA8()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 56) + 16))(*(void *)(v0 + 64), *(void *)(v0 + 40), *(void *)(v0 + 48));
  uint64_t v1 = sub_25A79B4C0();
  os_log_type_t v2 = sub_25A79B7E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25A6DD000, v1, v2, "PrivateMLClient failure -- failed to open Tap To Radar3", v3, 2u);
    MEMORY[0x261143A60](v3, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_25A7900C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A79B780();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25A79B770();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25A790B68(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A79B750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25A79026C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25A79B4E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_25A79B4C0();
  os_log_type_t v8 = sub_25A79B7E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25A6DD000, v7, v8, "Dismiss user notification for Tap-To-Radar", v9, 2u);
    MEMORY[0x261143A60](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25A7903BC()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_25A7904E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrivateMLClientAlertService();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A790544(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v5 + 8);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = *(void *)(v1 + v6 + 8);
  uint64_t v11 = *(uint8_t **)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_25A78F358(a1, v1 + v4, v7, v8, v9, v10, v11);
}

uint64_t sub_25A790600()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A7906D8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25A79026C(a1, v4);
}

uint64_t sub_25A790748(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A790824;
  return v6(a1);
}

uint64_t sub_25A790824()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A79091C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A458608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A790984()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A790A6C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25A6F210C;
  return sub_25A78FC78(a1, v5, v6, v7, v8);
}

uint64_t sub_25A790B68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4583B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A790BC8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A790C00(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25A6F210C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A459428 + dword_26A459428);
  return v6(a1, v4);
}

uint64_t sub_25A790CB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A790D20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TapToRadarDraft();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TransparencyReporterLogger.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC15PrivateMLClient26TransparencyReporterLogger_logger;
  uint64_t v4 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t TransparencyReporterLogger.init(logger:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15PrivateMLClient26TransparencyReporterLogger_logger;
  uint64_t v4 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

void sub_25A790E78(uint64_t a1, unint64_t a2)
{
  sub_25A790E90(a1, a2, "TransparencyReporterLogger: userData=%{private}s");
}

void sub_25A790E84(uint64_t a1, unint64_t a2)
{
  sub_25A790E90(a1, a2, "TransparencyReporterLogger: token=%{private}s");
}

void sub_25A790E90(uint64_t a1, unint64_t a2, const char *a3)
{
  swift_bridgeObjectRetain_n();
  oslog = sub_25A79B4C0();
  os_log_type_t v6 = sub_25A79B7E0();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136380675;
    swift_bridgeObjectRetain();
    sub_25A6F6E40(a1, a2, &v10);
    sub_25A79B860();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A6DD000, oslog, v6, a3, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v8, -1, -1);
    MEMORY[0x261143A60](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

void sub_25A791028(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  oslog = sub_25A79B4C0();
  os_log_type_t v8 = sub_25A79B7E0();
  if (os_log_type_enabled(oslog, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_bridgeObjectRetain();
    sub_25A6F6E40(a1, a2, &v12);
    sub_25A79B860();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_25A6F6E40(a3, a4, &v12);
    sub_25A79B860();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A6DD000, oslog, v8, "TransparencyReporterLogger: modelName=%{public}smodelVersion=%{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v10, -1, -1);
    MEMORY[0x261143A60](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t TransparencyReporterLogger.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15PrivateMLClient26TransparencyReporterLogger_logger;
  uint64_t v2 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TransparencyReporterLogger.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15PrivateMLClient26TransparencyReporterLogger_logger;
  uint64_t v2 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_25A791328(uint64_t a1, unint64_t a2)
{
}

void sub_25A79134C(uint64_t a1, unint64_t a2)
{
}

void sub_25A791370(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
}

uint64_t dispatch thunk of TransparencyReporter.report(userData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of TransparencyReporter.report(token:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of TransparencyReporter.report(modelName:modelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_25A7913D0()
{
  return type metadata accessor for TransparencyReporterLogger();
}

uint64_t type metadata accessor for TransparencyReporterLogger()
{
  uint64_t result = qword_26A459440;
  if (!qword_26A459440) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A791424()
{
  uint64_t result = sub_25A79B4E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TransparencyReporterLogger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TransparencyReporterLogger);
}

uint64_t dispatch thunk of TransparencyReporterLogger.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of TransparencyReporterLogger.report(userData:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of TransparencyReporterLogger.report(token:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of TransparencyReporterLogger.report(modelName:modelVersion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t TransparencyReporterImpl.__allocating_init(logger:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TransparencyReporterImpl.init(logger:configuration:)(a1, a2);
  return v4;
}

uint64_t TransparencyReporterImpl.init(logger:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25A79B4E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A79B450();
  uint64_t v61 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459450);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
  void *v16 = 0;
  v16[1] = 0xE000000000000000;
  uint64_t v17 = (void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData);
  *uint64_t v17 = 0;
  v17[1] = 0;
  uint64_t v18 = (void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_response);
  *uint64_t v18 = 0;
  v18[1] = 0xE000000000000000;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_finished) = 0;
  uint64_t v65 = v7;
  uint64_t v66 = v6;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v67 = a1;
  uint64_t v60 = v19;
  v19((char *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_logger), a1, v6);
  uint64_t v20 = v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_configuration;
  uint64_t v21 = sub_25A79ADC0();
  uint64_t v62 = *(void *)(v21 - 8);
  uint64_t v63 = v21;
  (*(void (**)(uint64_t, uint64_t))(v62 + 16))(v20, a2);
  uint64_t v22 = sub_25A79AC80();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A79AD90();
  uint64_t v26 = *(void (**)(uint64_t, char *, uint64_t))(v23 + 32);
  v59[1] = v22;
  v26(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_requestIdentifier, v25, v22);
  uint64_t v27 = sub_25A79ADB0();
  BOOL v28 = (uint64_t *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
  *BOOL v28 = v27;
  v28[1] = v29;
  sub_25A79ADA0();
  uint64_t v30 = sub_25A79B520();
  uint64_t v31 = v10;
  uint64_t v32 = (uint64_t *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier);
  uint64_t *v32 = v30;
  v32[1] = v33;
  uint64_t v64 = a2;
  sub_25A79AD80();
  uint64_t v34 = sub_25A79AD70();
  uint64_t v35 = *(void *)(v34 - 8);
  int v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v15, 1, v34);
  if (v36 == 1)
  {
    sub_25A791D08((uint64_t)v15);
    int v37 = 0;
  }
  else
  {
    int v37 = sub_25A79AD60();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v34);
  }
  uint64_t v39 = v66;
  uint64_t v38 = v67;
  uint64_t v40 = v31;
  unint64_t v41 = v60;
  uint64_t v42 = v61;
  uint64_t v43 = v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userID;
  *(_DWORD *)uint64_t v43 = v37;
  *(unsigned char *)(v43 + 4) = v36 == 1;
  v41(v9, v38, v39);
  sub_25A79B430();
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_signPoster, v12, v40);
  sub_25A79B550();
  swift_allocObject();
  *(void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_transparencyReport) = sub_25A79B540();
  swift_retain_n();
  uint64_t v44 = sub_25A79B4C0();
  os_log_type_t v45 = sub_25A79B800();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v70[0] = v47;
    *(_DWORD *)uint64_t v46 = 136315907;
    sub_25A6F2BDC();
    uint64_t v48 = sub_25A79B9F0();
    uint64_t v68 = sub_25A6F6E40(v48, v49, v70);
    sub_25A79B860();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2082;
    uint64_t v50 = *(void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
    unint64_t v51 = *(void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName + 8);
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_25A6F6E40(v50, v51, v70);
    sub_25A79B860();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 22) = 2081;
    uint64_t v52 = *(void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier + 8);
    uint64_t v68 = *(void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier);
    uint64_t v69 = v52;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v53 = sub_25A79B600();
    uint64_t v68 = sub_25A6F6E40(v53, v54, v70);
    sub_25A79B860();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 32) = 2081;
    char v55 = *(unsigned char *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userID + 4);
    LODWORD(v68) = *(_DWORD *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userID);
    BYTE4(v68) = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4584F8);
    uint64_t v56 = sub_25A79B600();
    uint64_t v68 = sub_25A6F6E40(v56, v57, v70);
    sub_25A79B860();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A6DD000, v44, v45, "%s Initialized TransparencyReporter. modelName=%{public}s clientIdentifier=%{private}s userID=%{private}s)", (uint8_t *)v46, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v47, -1, -1);
    MEMORY[0x261143A60](v46, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v64, v63);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v66);
  }
  else
  {
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v64, v63);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v38, v39);
  }
  return v3;
}

uint64_t sub_25A791D08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A459450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A791D68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData);
  *uint64_t v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_finished) = 0;
  return result;
}

uint64_t sub_25A791DB4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A791E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
  *uint64_t v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
  *uint64_t v8 = a3;
  v8[1] = a4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_25A791EAC()
{
  uint64_t v1 = OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_finished;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_finished) & 1) == 0)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData;
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData);
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_response);
    swift_beginAccess();
    uint64_t v7 = *v6;
    unint64_t v8 = v6[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25A792344(v4, v5, v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + v1) = 1;
    swift_retain_n();
    uint64_t v9 = sub_25A79B4C0();
    os_log_type_t v10 = sub_25A79B800();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = v22;
      *(_DWORD *)uint64_t v11 = 136316675;
      sub_25A79AC80();
      sub_25A6F2BDC();
      uint64_t v12 = sub_25A79B9F0();
      sub_25A6F6E40(v12, v13, &v23);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
      unint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName + 8);
      swift_bridgeObjectRetain();
      sub_25A6F6E40(v14, v15, &v23);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 22) = 2082;
      uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
      unint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion + 8);
      swift_bridgeObjectRetain();
      sub_25A6F6E40(v16, v17, &v23);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 32) = 2081;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
      uint64_t v18 = sub_25A79B600();
      sub_25A6F6E40(v18, v19, &v23);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 42) = 2081;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4584F8);
      uint64_t v20 = sub_25A79B600();
      sub_25A6F6E40(v20, v21, &v23);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 52) = 2048;
      if (*(void *)(v3 + 8))
      {
        swift_bridgeObjectRetain();
        sub_25A79B640();
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
      }
      sub_25A79B860();
      swift_release();
      *(_WORD *)(v11 + 62) = 2048;
      swift_bridgeObjectRetain();
      sub_25A79B640();
      swift_release();
      swift_bridgeObjectRelease();
      sub_25A79B860();
      swift_release();
      _os_log_impl(&dword_25A6DD000, v9, v10, "%s Finishing TransparencyReporter. modelName=%{public}s modelVersion=%{public}s clientIdentifier=%{private}s userID=%{private}s len(userData)=%ld\nlen(response)=%ld", (uint8_t *)v11, 0x48u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v22, -1, -1);
      MEMORY[0x261143A60](v11, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_25A792344(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  os_log_t v56 = (os_log_t)sub_25A79B110();
  Class isa = v56[-1].isa;
  MEMORY[0x270FA5388](v56);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A79ADC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 | a4)
  {
    uint64_t v20 = *(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_transparencyReport);
    uint64_t v53 = v14;
    uint64_t v54 = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_configuration, v14);
    if (a2) {
      uint64_t v21 = a1;
    }
    else {
      uint64_t v21 = 0;
    }
    if (a4) {
      uint64_t v22 = a3;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v51 = v22;
    uint64_t v52 = v21;
    if (a4) {
      unint64_t v23 = a4;
    }
    else {
      unint64_t v23 = 0xE000000000000000;
    }
    uint64_t v49 = *(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
    unint64_t v50 = v23;
    unint64_t v55 = a4;
    uint64_t v45 = a3;
    uint64_t v46 = (uint64_t *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
    uint64_t v24 = *(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
    uint64_t v47 = (uint64_t *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
    uint64_t v48 = v24;
    (*((void (**)(char *, void, os_log_t))isa + 13))(v11, *MEMORY[0x263F4F728], v56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25A79B530();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, os_log_t))isa + 1))(v11, v56);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v53);
    uint64_t v25 = v4;
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_25A79B4C0();
    os_log_type_t v27 = sub_25A79B7E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v58 = v29;
      *(_DWORD *)uint64_t v28 = 136447747;
      uint64_t v30 = sub_25A79AC60();
      uint64_t v57 = sub_25A6F6E40(v30, v31, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2082;
      uint64_t v32 = *v46;
      unint64_t v33 = v46[1];
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_25A6F6E40(v32, v33, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 22) = 2082;
      uint64_t v34 = *v47;
      unint64_t v35 = v47[1];
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_25A6F6E40(v34, v35, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 32) = 2082;
      if (*(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier + 8))
      {
        uint64_t v36 = *(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier);
        unint64_t v37 = *(void *)(v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_clientIdentifier + 8);
      }
      else
      {
        uint64_t v36 = 0;
        unint64_t v37 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_25A6F6E40(v36, v37, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 42) = 2081;
      char v38 = *(unsigned char *)(v25 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userID + 4);
      LODWORD(v57) = *(_DWORD *)(v25 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userID);
      BYTE4(v57) = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4584F8);
      uint64_t v39 = sub_25A79B600();
      uint64_t v57 = sub_25A6F6E40(v39, v40, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 52) = 2081;
      if (*(void *)(v25 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData + 8))
      {
        uint64_t v41 = *(void *)(v25 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData);
        unint64_t v42 = *(void *)(v25 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData + 8);
      }
      else
      {
        uint64_t v41 = 0;
        unint64_t v42 = 0xE000000000000000;
      }
      unint64_t v43 = v55;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_25A6F6E40(v41, v42, &v58);
      sub_25A79B860();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 62) = 2049;
      if (v43)
      {
        uint64_t v44 = sub_25A79B640();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v44 = 0;
      }
      uint64_t v57 = v44;
      sub_25A79B860();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A6DD000, v26, v27, "requestIdentifier=%{public}s modelName=%{public}s modelVersion=%{public}s clientIdentifier=%{public}s userID=%{private}s userData=%{private}s responseLen=%{private}ld", (uint8_t *)v28, 0x48u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v29, -1, -1);
      MEMORY[0x261143A60](v28, -1, -1);
    }
    else
    {
      swift_release_n();

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    os_log_t v56 = (os_log_t)sub_25A79B4C0();
    os_log_type_t v17 = sub_25A79B800();
    if (os_log_type_enabled(v56, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_25A6DD000, v56, v17, "Caller failed to provide a prompt or response", v18, 2u);
      MEMORY[0x261143A60](v18, -1, -1);
    }
    os_log_t v19 = v56;
  }
}

uint64_t TransparencyReporterImpl.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_logger;
  uint64_t v2 = sub_25A79B4E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_configuration;
  uint64_t v4 = sub_25A79ADC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_signPoster;
  uint64_t v6 = sub_25A79B450();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_requestIdentifier;
  uint64_t v8 = sub_25A79AC80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TransparencyReporterImpl.__deallocating_deinit()
{
  TransparencyReporterImpl.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A792C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_userData);
  *uint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_finished) = 0;
  return result;
}

uint64_t sub_25A792C8C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A792D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *v4;
  uint64_t v8 = (void *)(*v4 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelName);
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)(v7 + OBJC_IVAR____TtC15PrivateMLClient24TransparencyReporterImpl_modelVersion);
  *uint64_t v9 = a3;
  v9[1] = a4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A792D8C()
{
  return type metadata accessor for TransparencyReporterImpl();
}

uint64_t type metadata accessor for TransparencyReporterImpl()
{
  uint64_t result = qword_26A4594C0;
  if (!qword_26A4594C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A792DE0()
{
  uint64_t result = sub_25A79B4E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25A79ADC0();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_25A79B450();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_25A79AC80();
        if (v4 <= 0x3F) {
          return swift_updateClassMetadata2();
        }
      }
    }
  }
  return result;
}

uint64_t method lookup function for TransparencyReporterImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TransparencyReporterImpl);
}

uint64_t dispatch thunk of TransparencyReporterImpl.__allocating_init(logger:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of TransparencyReporterImpl.report(userData:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of TransparencyReporterImpl.report(token:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of TransparencyReporterImpl.report(modelName:modelVersion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of TransparencyReporterImpl.finish()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t static NSUserDefaults.logInfoTieInferenceRequestAsJson.getter()
{
  if (qword_26A458250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A4595F0;
  v2[1] = unk_26A459600;
  char v3 = byte_26A459610;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

uint64_t static NSUserDefaults.enablePerfMetrics.getter()
{
  if (qword_26A458228 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A459528;
  v2[1] = unk_26A459538;
  char v3 = byte_26A459548;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

uint64_t static NSUserDefaults.modelOptionOverride.getter()
{
  if (qword_26A458230 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A459550;
  v2[1] = *(_OWORD *)&qword_26A459560;
  char v3 = byte_26A459570;
  sub_25A6F2DD8((uint64_t)v2);
  uint64_t v0 = sub_25A793BA0();
  sub_25A6F2E1C((uint64_t)v2);
  return v0;
}

uint64_t static NSUserDefaults.enableDraftModel.getter()
{
  if (qword_26A458240 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A4595A0;
  v2[1] = unk_26A4595B0;
  char v3 = byte_26A4595C0;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

uint64_t static NSUserDefaults.taptoRadarDiagExtension.getter()
{
  if (qword_26A458260 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_26A459640;
  v3[0] = *(_OWORD *)&qword_26A459650;
  *(_OWORD *)((char *)v3 + 9) = *(_OWORD *)((char *)&qword_26A459658 + 1);
  sub_25A7122A0((uint64_t)&v2);
  uint64_t v0 = sub_25A7935F8();
  sub_25A7122E4((uint64_t)&v2);
  return v0;
}

uint64_t static NSUserDefaults.workloadParameterModelOverride.getter()
{
  if (qword_26B32B960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_26B32B930;
  v3[0] = *(_OWORD *)&qword_26B32B940;
  *(_OWORD *)((char *)v3 + 9) = *(_OWORD *)((char *)&qword_26B32B948 + 1);
  sub_25A7122A0((uint64_t)&v2);
  uint64_t v0 = sub_25A7935F8();
  sub_25A7122E4((uint64_t)&v2);
  return v0;
}

uint64_t static NSUserDefaults.workloadParameterModelAdapterOverride.getter()
{
  if (qword_26B32B998 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_26B32B968;
  v3[0] = *(_OWORD *)&qword_26B32B978;
  *(_OWORD *)((char *)v3 + 9) = *(_OWORD *)((char *)&qword_26B32B980 + 1);
  sub_25A7122A0((uint64_t)&v2);
  uint64_t v0 = sub_25A7935F8();
  sub_25A7122E4((uint64_t)&v2);
  return v0;
}

uint64_t static NSUserDefaults.pipelineOverride.getter()
{
  if (qword_26B32B8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26B32B8C8;
  v2[1] = *(_OWORD *)&qword_26B32B8D8;
  char v3 = byte_26B32B8E8;
  sub_25A6F2DD8((uint64_t)v2);
  uint64_t v0 = sub_25A793BA0();
  sub_25A6F2E1C((uint64_t)v2);
  return v0;
}

uint64_t static NSUserDefaults.routingLayerNameOverride.getter()
{
  if (qword_26B32B928 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_26B32B8F8;
  v3[0] = *(_OWORD *)&qword_26B32B908;
  *(_OWORD *)((char *)v3 + 9) = *(_OWORD *)((char *)&qword_26B32B910 + 1);
  sub_25A7122A0((uint64_t)&v2);
  uint64_t v0 = sub_25A7935F8();
  sub_25A7122E4((uint64_t)&v2);
  return v0;
}

uint64_t sub_25A7935F8()
{
  unint64_t v1 = (uint64_t *)v0;
  if (qword_26B32B860 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_26A4582E0 == 1 && (*(unsigned char *)(v0 + 40) & 1) == 0) {
    goto LABEL_19;
  }
  unint64_t v3 = *(void *)(v0 + 24);
  long long v2 = *(void **)(v0 + 32);
  uint64_t v4 = v1[2];
  uint64_t v5 = (void *)sub_25A79B5B0();
  id v6 = objc_msgSend(v2, sel_objectForKey_, v5);

  if (!v6) {
    goto LABEL_19;
  }
  sub_25A79B880();
  swift_unknownObjectRelease();
  sub_25A71C32C(v27, v28);
  sub_25A6F78D8((uint64_t)v28, (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25A79B4E0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A4596A0);
    sub_25A6F78D8((uint64_t)v28, (uint64_t)v27);
    sub_25A7122A0((uint64_t)v1);
    sub_25A7122A0((uint64_t)v1);
    uint64_t v16 = sub_25A79B4C0();
    os_log_type_t v17 = sub_25A79B7F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v26 = v19;
      *(_DWORD *)uint64_t v18 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_25A6F6E40(v4, v3, &v26);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      sub_25A7122E4((uint64_t)v1);
      sub_25A7122E4((uint64_t)v1);
      *(_WORD *)(v18 + 12) = 2080;
      sub_25A6F78D8((uint64_t)v27, (uint64_t)&v24);
      uint64_t v20 = sub_25A79B600();
      uint64_t v24 = sub_25A6F6E40(v20, v21, &v26);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
      *(_WORD *)(v18 + 22) = 2080;
      uint64_t v24 = sub_25A6F6E40(0xD000000000000010, 0x800000025A7A47C0, &v26);
      sub_25A79B860();
      _os_log_impl(&dword_25A6DD000, v16, v17, "Mismatched defaults type. key=%s value=%s type=%s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v19, -1, -1);
      MEMORY[0x261143A60](v18, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
      sub_25A7122E4((uint64_t)v1);
      sub_25A7122E4((uint64_t)v1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
LABEL_19:
    uint64_t v7 = *v1;
    swift_bridgeObjectRetain();
    return v7;
  }
  uint64_t v7 = v24;
  uint64_t v8 = v25;
  if (qword_26A458270 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25A79B4E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A4596A0);
  sub_25A7122A0((uint64_t)v1);
  sub_25A799214(v24, v25);
  sub_25A7122A0((uint64_t)v1);
  sub_25A799214(v24, v25);
  uint64_t v10 = sub_25A79B4C0();
  os_log_type_t v11 = sub_25A79B7D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&v27[0] = sub_25A6F6E40(v4, v3, &v24);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A7122E4((uint64_t)v1);
    sub_25A7122E4((uint64_t)v1);
    *(_WORD *)(v12 + 12) = 2080;
    *(void *)&v27[0] = v7;
    *((void *)&v27[0] + 1) = v8;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25A79B600();
    *(void *)&v27[0] = sub_25A6F6E40(v13, v14, &v24);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A799228(v7, v8);
    sub_25A799228(v7, v8);
    _os_log_impl(&dword_25A6DD000, v10, v11, "Using UserDefaults override. key=%s value=%s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v23, -1, -1);
    MEMORY[0x261143A60](v12, -1, -1);
  }
  else
  {

    sub_25A799228(v24, v25);
    sub_25A799228(v24, v25);
    sub_25A7122E4((uint64_t)v1);
    sub_25A7122E4((uint64_t)v1);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v7;
}

uint64_t sub_25A793BA0()
{
  unint64_t v1 = (uint64_t *)v0;
  if (qword_26B32B860 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_26A4582E0 == 1 && (*(unsigned char *)(v0 + 32) & 1) == 0) {
    goto LABEL_19;
  }
  unint64_t v3 = *(void *)(v0 + 16);
  long long v2 = *(void **)(v0 + 24);
  uint64_t v4 = v1[1];
  uint64_t v5 = (void *)sub_25A79B5B0();
  id v6 = objc_msgSend(v2, sel_objectForKey_, v5);

  if (!v6) {
    goto LABEL_19;
  }
  sub_25A79B880();
  swift_unknownObjectRelease();
  sub_25A71C32C(v25, v26);
  sub_25A6F78D8((uint64_t)v26, (uint64_t)v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
  if ((swift_dynamicCast() & 1) == 0)
  {
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25A79B4E0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A4596A0);
    sub_25A6F78D8((uint64_t)v26, (uint64_t)v25);
    sub_25A6F2DD8((uint64_t)v1);
    sub_25A6F2DD8((uint64_t)v1);
    uint64_t v16 = sub_25A79B4C0();
    os_log_type_t v17 = sub_25A79B7F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v24 = v19;
      *(_DWORD *)uint64_t v18 = 136315650;
      swift_bridgeObjectRetain();
      v23[0] = sub_25A6F6E40(v4, v3, &v24);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      sub_25A6F2E1C((uint64_t)v1);
      sub_25A6F2E1C((uint64_t)v1);
      *(_WORD *)(v18 + 12) = 2080;
      sub_25A6F78D8((uint64_t)v25, (uint64_t)v23);
      uint64_t v20 = sub_25A79B600();
      v23[0] = sub_25A6F6E40(v20, v21, &v24);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      *(_WORD *)(v18 + 22) = 2080;
      v23[0] = sub_25A6F6E40(0xD000000000000024, 0x800000025A7A4820, &v24);
      sub_25A79B860();
      _os_log_impl(&dword_25A6DD000, v16, v17, "Mismatched defaults type. key=%s value=%s type=%s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v19, -1, -1);
      MEMORY[0x261143A60](v18, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      sub_25A6F2E1C((uint64_t)v1);
      sub_25A6F2E1C((uint64_t)v1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
LABEL_19:
    uint64_t v7 = *v1;
    swift_bridgeObjectRetain();
    return v7;
  }
  uint64_t v7 = v23[0];
  if (qword_26A458270 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25A79B4E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A4596A0);
  sub_25A6F2DD8((uint64_t)v1);
  sub_25A79923C(v23[0]);
  sub_25A6F2DD8((uint64_t)v1);
  sub_25A79923C(v23[0]);
  uint64_t v9 = sub_25A79B4C0();
  os_log_type_t v10 = sub_25A79B7D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(void *)&v25[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    sub_25A6F6E40(v4, v3, (uint64_t *)v25);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A6F2E1C((uint64_t)v1);
    sub_25A6F2E1C((uint64_t)v1);
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25A79B600();
    v23[0] = sub_25A6F6E40(v13, v14, (uint64_t *)v25);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A79924C(v7);
    sub_25A79924C(v7);
    _os_log_impl(&dword_25A6DD000, v9, v10, "Using UserDefaults override. key=%s value=%s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v12, -1, -1);
    MEMORY[0x261143A60](v11, -1, -1);
  }
  else
  {

    sub_25A79924C(v23[0]);
    sub_25A79924C(v23[0]);
    sub_25A6F2E1C((uint64_t)v1);
    sub_25A6F2E1C((uint64_t)v1);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  return v7;
}

uint64_t sub_25A79412C()
{
  unint64_t v1 = (void *)v0;
  if (qword_26B32B860 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_26A4582E0 == 1 && (*(unsigned char *)(v0 + 32) & 1) == 0) {
    return *(unsigned __int8 *)v1;
  }
  unint64_t v3 = *(void *)(v0 + 16);
  long long v2 = *(void **)(v0 + 24);
  uint64_t v4 = v1[1];
  uint64_t v5 = (void *)sub_25A79B5B0();
  id v6 = objc_msgSend(v2, sel_objectForKey_, v5);

  if (!v6) {
    return *(unsigned __int8 *)v1;
  }
  sub_25A79B880();
  swift_unknownObjectRelease();
  sub_25A71C32C(v25, v26);
  sub_25A6F78D8((uint64_t)v26, (uint64_t)v25);
  if ((swift_dynamicCast() & 1) == 0)
  {
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25A79B4E0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A4596A0);
    sub_25A6F78D8((uint64_t)v26, (uint64_t)v25);
    sub_25A6F2C80((uint64_t)v1);
    sub_25A6F2C80((uint64_t)v1);
    uint64_t v16 = sub_25A79B4C0();
    os_log_type_t v17 = sub_25A79B7F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v24 = v19;
      *(_DWORD *)uint64_t v18 = 136315650;
      swift_bridgeObjectRetain();
      v23[0] = sub_25A6F6E40(v4, v3, &v24);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      sub_25A6F2CB4((uint64_t)v1);
      sub_25A6F2CB4((uint64_t)v1);
      *(_WORD *)(v18 + 12) = 2080;
      sub_25A6F78D8((uint64_t)v25, (uint64_t)v23);
      uint64_t v20 = sub_25A79B600();
      v23[0] = sub_25A6F6E40(v20, v21, &v24);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      *(_WORD *)(v18 + 22) = 2080;
      v23[0] = sub_25A6F6E40(1819242306, 0xE400000000000000, &v24);
      sub_25A79B860();
      _os_log_impl(&dword_25A6DD000, v16, v17, "Mismatched defaults type. key=%s value=%s type=%s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v19, -1, -1);
      MEMORY[0x261143A60](v18, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      sub_25A6F2CB4((uint64_t)v1);
      sub_25A6F2CB4((uint64_t)v1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
    return *(unsigned __int8 *)v1;
  }
  if (qword_26A458270 != -1) {
    swift_once();
  }
  uint64_t v7 = v23[0] & 1;
  uint64_t v8 = sub_25A79B4E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A4596A0);
  sub_25A6F2C80((uint64_t)v1);
  sub_25A6F2C80((uint64_t)v1);
  uint64_t v9 = sub_25A79B4C0();
  os_log_type_t v10 = sub_25A79B7D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(void *)&v25[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    sub_25A6F6E40(v4, v3, (uint64_t *)v25);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A6F2CB4((uint64_t)v1);
    sub_25A6F2CB4((uint64_t)v1);
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v13 = sub_25A79B600();
    v23[0] = sub_25A6F6E40(v13, v14, (uint64_t *)v25);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A6DD000, v9, v10, "Using UserDefaults override. key=%s value=%s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v12, -1, -1);
    MEMORY[0x261143A60](v11, -1, -1);
  }
  else
  {

    sub_25A6F2CB4((uint64_t)v1);
    sub_25A6F2CB4((uint64_t)v1);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  return v7;
}

uint64_t sub_25A79465C()
{
  unint64_t v1 = (uint64_t *)v0;
  if (qword_26B32B860 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_26A4582E0 == 1 && (*(unsigned char *)(v0 + 40) & 1) == 0) {
    goto LABEL_19;
  }
  unint64_t v3 = *(void *)(v0 + 24);
  long long v2 = *(void **)(v0 + 32);
  uint64_t v4 = v1[2];
  uint64_t v5 = (void *)sub_25A79B5B0();
  id v6 = objc_msgSend(v2, sel_objectForKey_, v5);

  if (!v6) {
    goto LABEL_19;
  }
  sub_25A79B880();
  swift_unknownObjectRelease();
  sub_25A71C32C(v26, v27);
  sub_25A6F78D8((uint64_t)v27, (uint64_t)v26);
  if ((swift_dynamicCast() & 1) == 0)
  {
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25A79B4E0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A4596A0);
    sub_25A6F78D8((uint64_t)v27, (uint64_t)v26);
    sub_25A7122A0((uint64_t)v1);
    sub_25A7122A0((uint64_t)v1);
    os_log_type_t v17 = sub_25A79B4C0();
    os_log_type_t v18 = sub_25A79B7F0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v25 = v20;
      *(_DWORD *)uint64_t v19 = 136315650;
      swift_bridgeObjectRetain();
      v24[0] = sub_25A6F6E40(v4, v3, &v25);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      sub_25A7122E4((uint64_t)v1);
      sub_25A7122E4((uint64_t)v1);
      *(_WORD *)(v19 + 12) = 2080;
      sub_25A6F78D8((uint64_t)v26, (uint64_t)v24);
      uint64_t v21 = sub_25A79B600();
      v24[0] = sub_25A6F6E40(v21, v22, &v25);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
      *(_WORD *)(v19 + 22) = 2080;
      v24[0] = sub_25A6F6E40(0x676E69727453, 0xE600000000000000, &v25);
      sub_25A79B860();
      _os_log_impl(&dword_25A6DD000, v17, v18, "Mismatched defaults type. key=%s value=%s type=%s", (uint8_t *)v19, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261143A60](v20, -1, -1);
      MEMORY[0x261143A60](v19, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
      sub_25A7122E4((uint64_t)v1);
      sub_25A7122E4((uint64_t)v1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
LABEL_19:
    uint64_t v7 = *v1;
    swift_bridgeObjectRetain();
    return v7;
  }
  uint64_t v7 = v24[0];
  uint64_t v8 = v24[1];
  if (qword_26A458270 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25A79B4E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A4596A0);
  sub_25A7122A0((uint64_t)v1);
  swift_bridgeObjectRetain();
  sub_25A7122A0((uint64_t)v1);
  swift_bridgeObjectRetain();
  os_log_type_t v10 = sub_25A79B4C0();
  os_log_type_t v11 = sub_25A79B7D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v24[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&v26[0] = sub_25A6F6E40(v4, v3, v24);
    sub_25A79B860();
    swift_bridgeObjectRelease();
    sub_25A7122E4((uint64_t)v1);
    sub_25A7122E4((uint64_t)v1);
    *(_WORD *)(v12 + 12) = 2080;
    *(void *)&v26[0] = v7;
    *((void *)&v26[0] + 1) = v8;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25A79B600();
    *(void *)&v26[0] = sub_25A6F6E40(v14, v15, v24);
    sub_25A79B860();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A6DD000, v10, v11, "Using UserDefaults override. key=%s value=%s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261143A60](v13, -1, -1);
    MEMORY[0x261143A60](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    sub_25A7122E4((uint64_t)v1);
    sub_25A7122E4((uint64_t)v1);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  return v7;
}

void static NSUserDefaults.workloadParameterModelOverride.setter()
{
  if (qword_26B32B960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_26B32B950;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
  uint64_t v1 = sub_25A79BA30();
  long long v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.workloadParameterModelOverride.modify(void *a1))(uint64_t a1, char a2)
{
  long long v2 = malloc(0x68uLL);
  *a1 = v2;
  if (qword_26B32B960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26B32B940;
  *long long v2 = xmmword_26B32B930;
  v2[1] = v3;
  *(_OWORD *)((char *)v2 + 25) = *(_OWORD *)((char *)&qword_26B32B948 + 1);
  *((void *)v2 + 9) = sub_25A7935F8();
  *((void *)v2 + 10) = v4;
  return sub_25A794D78;
}

void sub_25A794D78(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 88) = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = (void *)qword_26B32B950;
  v3[12] = v3[10];
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v7 = sub_25A79BA30();
    uint64_t v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A794ECC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26B32B930 = 0uLL;
    qword_26B32B940 = 0xD00000000000001ELL;
    qword_26B32B948 = 0x800000025A7A46F0;
    qword_26B32B950 = (uint64_t)v2;
    byte_26B32B958 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

uint64_t static NSUserDefaults.privatemlClientUserDefaults()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2) {
    return (uint64_t)v2;
  }
  uint64_t result = sub_25A79B910();
  __break(1u);
  return result;
}

id static NSUserDefaults.$workloadParameterModelOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B32B960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26B32B948;
  id v6 = (id)qword_26B32B950;
  uint64_t v2 = qword_26B32B950;
  char v4 = byte_26B32B958;
  *(void *)a1 = xmmword_26B32B930;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_26B32B930 + 8);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

void static NSUserDefaults.workloadParameterModelAdapterOverride.setter()
{
  if (qword_26B32B998 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26B32B988;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.workloadParameterModelAdapterOverride.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x68uLL);
  *a1 = v2;
  if (qword_26B32B998 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26B32B978;
  *uint64_t v2 = xmmword_26B32B968;
  v2[1] = v3;
  *(_OWORD *)((char *)v2 + 25) = *(_OWORD *)((char *)&qword_26B32B980 + 1);
  *((void *)v2 + 9) = sub_25A7935F8();
  *((void *)v2 + 10) = v4;
  return sub_25A7952FC;
}

void sub_25A7952FC(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 88) = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = (void *)qword_26B32B988;
  v3[12] = v3[10];
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v7 = sub_25A79BA30();
    uint64_t v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A795450()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26B32B968 = 0uLL;
    qword_26B32B978 = 0xD000000000000025;
    qword_26B32B980 = 0x800000025A7A4790;
    qword_26B32B988 = (uint64_t)v2;
    byte_26B32B990 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$workloadParameterModelAdapterOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B32B998 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26B32B980;
  id v6 = (id)qword_26B32B988;
  uint64_t v2 = qword_26B32B988;
  char v4 = byte_26B32B990;
  *(void *)a1 = xmmword_26B32B968;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_26B32B968 + 8);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t static NSUserDefaults.enableFallBack.getter()
{
  if (qword_26A458218 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A4594D0;
  v2[1] = unk_26A4594E0;
  char v3 = byte_26A4594F0;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

void static NSUserDefaults.enableFallBack.setter()
{
  if (qword_26A458218 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v0 = (void *)qword_26A4594E8;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.enableFallBack.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458218 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A4594E0;
  *uint64_t v2 = xmmword_26A4594D0;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A4594F0;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A79583C;
}

void sub_25A79583C(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  char v4 = (void *)qword_26A4594E8;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A795904()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A4594D0) = 0;
    *((void *)&xmmword_26A4594D0 + 1) = 0x6146656C62616E65;
    unk_26A4594E0 = 0xEE006B6361426C6CLL;
    qword_26A4594E8 = (uint64_t)v2;
    byte_26A4594F0 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$enableFallBack.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458218 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A4594D0 + 1);
  uint64_t v2 = unk_26A4594E0;
  id v7 = (id)qword_26A4594E8;
  uint64_t v4 = qword_26A4594E8;
  char v5 = byte_26A4594F0;
  *(unsigned char *)a1 = xmmword_26A4594D0;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

void static NSUserDefaults.pipelineOverride.setter(uint64_t a1)
{
  if (qword_26B32B8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B32B8E0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
  uint64_t v3 = sub_25A79BA30();
  uint64_t v4 = (void *)sub_25A79B5B0();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4, a1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.pipelineOverride.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x50uLL);
  *a1 = v2;
  if (qword_26B32B8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26B32B8D8;
  *uint64_t v2 = xmmword_26B32B8C8;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26B32B8E8;
  *((void *)v2 + 8) = sub_25A793BA0();
  return sub_25A795C58;
}

void sub_25A795C58(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 72) = *(void *)(*(void *)a1 + 64);
  uint64_t v4 = (void *)qword_26B32B8E0;
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v7 = sub_25A79BA30();
    uint64_t v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A795DAC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26B32B8C8 = xmmword_25A7A2100;
    qword_26B32B8D8 = 0xE800000000000000;
    qword_26B32B8E0 = (uint64_t)v2;
    byte_26B32B8E8 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$pipelineOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B32B8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26B32B8D8;
  id v6 = (id)qword_26B32B8E0;
  uint64_t v2 = qword_26B32B8E0;
  char v4 = byte_26B32B8E8;
  *(_OWORD *)a1 = xmmword_26B32B8C8;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t static NSUserDefaults.serverScope.getter()
{
  if (qword_26A458220 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_26A4594F8;
  v3[0] = *(_OWORD *)&qword_26A459508;
  *(_OWORD *)((char *)v3 + 9) = unk_26A459511;
  sub_25A7122A0((uint64_t)&v2);
  uint64_t v0 = sub_25A79465C();
  sub_25A7122E4((uint64_t)&v2);
  return v0;
}

void static NSUserDefaults.serverScope.setter()
{
  if (qword_26A458220 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_26A459518;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A79BA30();
  long long v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.serverScope.modify(void *a1))(uint64_t a1, char a2)
{
  long long v2 = malloc(0x68uLL);
  *a1 = v2;
  if (qword_26A458220 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26A459508;
  *long long v2 = xmmword_26A4594F8;
  v2[1] = v3;
  *(_OWORD *)((char *)v2 + 25) = unk_26A459511;
  *((void *)v2 + 9) = sub_25A79465C();
  *((void *)v2 + 10) = v4;
  return sub_25A796198;
}

void sub_25A796198(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 88) = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = (void *)qword_26A459518;
  v3[12] = v3[10];
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    uint64_t v7 = sub_25A79BA30();
    uint64_t v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A7962DC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    *(void *)&xmmword_26A4594F8 = 0;
    *((void *)&xmmword_26A4594F8 + 1) = 0xE000000000000000;
    qword_26A459508 = 0x6353726576726553;
    unk_26A459510 = 0xEB0000000065706FLL;
    qword_26A459518 = (uint64_t)v2;
    byte_26A459520 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$serverScope.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458220 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = *((void *)&xmmword_26A4594F8 + 1);
  uint64_t v3 = qword_26A459508;
  uint64_t v4 = unk_26A459510;
  id v8 = (id)qword_26A459518;
  uint64_t v5 = qword_26A459518;
  char v6 = byte_26A459520;
  *(void *)a1 = xmmword_26A4594F8;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v8;
}

void static NSUserDefaults.routingLayerNameOverride.setter()
{
  if (qword_26B32B928 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26B32B918;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.routingLayerNameOverride.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x68uLL);
  *a1 = v2;
  if (qword_26B32B928 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26B32B908;
  *uint64_t v2 = xmmword_26B32B8F8;
  v2[1] = v3;
  *(_OWORD *)((char *)v2 + 25) = *(_OWORD *)((char *)&qword_26B32B910 + 1);
  *((void *)v2 + 9) = sub_25A7935F8();
  *((void *)v2 + 10) = v4;
  return sub_25A796644;
}

void sub_25A796644(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 88) = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = (void *)qword_26B32B918;
  v3[12] = v3[10];
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v5 = sub_25A79BA30();
    char v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v7 = sub_25A79BA30();
    id v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A796798()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26B32B8F8 = 0uLL;
    qword_26B32B908 = 0xD000000000000018;
    qword_26B32B910 = 0x800000025A7A4770;
    qword_26B32B918 = (uint64_t)v2;
    byte_26B32B920 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$routingLayerNameOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B32B928 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26B32B910;
  id v6 = (id)qword_26B32B918;
  uint64_t v2 = qword_26B32B918;
  char v4 = byte_26B32B920;
  *(void *)a1 = xmmword_26B32B8F8;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_26B32B8F8 + 8);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

void static NSUserDefaults.enablePerfMetrics.setter()
{
  if (qword_26A458228 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26A459540;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.enablePerfMetrics.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458228 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A459538;
  *uint64_t v2 = xmmword_26A459528;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A459548;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A796ADC;
}

void sub_25A796ADC(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  char v4 = (void *)qword_26A459540;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A796BA4()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A459528) = 1;
    *((void *)&xmmword_26A459528 + 1) = 0xD000000000000011;
    unk_26A459538 = 0x800000025A7A4870;
    qword_26A459540 = (uint64_t)v2;
    byte_26A459548 = 1;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$enablePerfMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458228 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A459528 + 1);
  uint64_t v2 = unk_26A459538;
  id v7 = (id)qword_26A459540;
  uint64_t v4 = qword_26A459540;
  char v5 = byte_26A459548;
  *(unsigned char *)a1 = xmmword_26A459528;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

void static NSUserDefaults.modelOptionOverride.setter(uint64_t a1)
{
  if (qword_26A458230 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26A459568;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
  uint64_t v3 = sub_25A79BA30();
  uint64_t v4 = (void *)sub_25A79B5B0();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4, a1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.modelOptionOverride.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x50uLL);
  *a1 = v2;
  if (qword_26A458230 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26A459560;
  *uint64_t v2 = xmmword_26A459550;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A459570;
  *((void *)v2 + 8) = sub_25A793BA0();
  return sub_25A796EE8;
}

void sub_25A796EE8(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 72) = *(void *)(*(void *)a1 + 64);
  uint64_t v4 = (void *)qword_26A459568;
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v7 = sub_25A79BA30();
    id v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A79703C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26A459550 = xmmword_25A7A2110;
    qword_26A459560 = 0x800000025A7A4850;
    qword_26A459568 = (uint64_t)v2;
    byte_26A459570 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$modelOptionOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458230 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26A459560;
  id v6 = (id)qword_26A459568;
  uint64_t v2 = qword_26A459568;
  char v4 = byte_26A459570;
  *(_OWORD *)a1 = xmmword_26A459550;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t static NSUserDefaults.overrideModelCatalog.getter()
{
  if (qword_26A458238 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A459578;
  v2[1] = *(_OWORD *)&qword_26A459588;
  char v3 = byte_26A459598;
  sub_25A6F2DD8((uint64_t)v2);
  uint64_t v0 = sub_25A793BA0();
  sub_25A6F2E1C((uint64_t)v2);
  return v0;
}

void static NSUserDefaults.overrideModelCatalog.setter(uint64_t a1)
{
  if (qword_26A458238 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26A459590;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
  uint64_t v3 = sub_25A79BA30();
  char v4 = (void *)sub_25A79B5B0();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4, a1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.overrideModelCatalog.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x50uLL);
  *a1 = v2;
  if (qword_26A458238 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26A459588;
  *uint64_t v2 = xmmword_26A459578;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A459598;
  *((void *)v2 + 8) = sub_25A793BA0();
  return sub_25A797430;
}

void sub_25A797430(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 72) = *(void *)(*(void *)a1 + 64);
  char v4 = (void *)qword_26A459590;
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A459678);
    uint64_t v7 = sub_25A79BA30();
    id v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A797584()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26A459578 = xmmword_25A7A2120;
    qword_26A459588 = 0x800000025A7A4750;
    qword_26A459590 = (uint64_t)v2;
    byte_26A459598 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$overrideModelCatalog.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458238 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26A459588;
  id v6 = (id)qword_26A459590;
  uint64_t v2 = qword_26A459590;
  char v4 = byte_26A459598;
  *(_OWORD *)a1 = xmmword_26A459578;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

void static NSUserDefaults.enableDraftModel.setter()
{
  if (qword_26A458240 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26A4595B8;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.enableDraftModel.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458240 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A4595B0;
  *uint64_t v2 = xmmword_26A4595A0;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A4595C0;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A7978C8;
}

void sub_25A7978C8(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  char v4 = (void *)qword_26A4595B8;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A797990()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A4595A0) = 0;
    *((void *)&xmmword_26A4595A0 + 1) = 0xD000000000000010;
    unk_26A4595B0 = 0x800000025A7A4800;
    qword_26A4595B8 = (uint64_t)v2;
    byte_26A4595C0 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$enableDraftModel.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458240 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A4595A0 + 1);
  uint64_t v2 = unk_26A4595B0;
  id v7 = (id)qword_26A4595B8;
  uint64_t v4 = qword_26A4595B8;
  char v5 = byte_26A4595C0;
  *(unsigned char *)a1 = xmmword_26A4595A0;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t static NSUserDefaults.convertSchemasToGrammars.getter()
{
  if (qword_26A458248 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A4595C8;
  v2[1] = unk_26A4595D8;
  char v3 = byte_26A4595E8;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

void static NSUserDefaults.convertSchemasToGrammars.setter()
{
  if (qword_26A458248 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v0 = (void *)qword_26A4595E0;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.convertSchemasToGrammars.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458248 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A4595D8;
  *uint64_t v2 = xmmword_26A4595C8;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A4595E8;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A797D64;
}

void sub_25A797D64(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  uint64_t v4 = (void *)qword_26A4595E0;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A797E2C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A4595C8) = 0;
    *((void *)&xmmword_26A4595C8 + 1) = 0xD000000000000018;
    unk_26A4595D8 = 0x800000025A7A4730;
    qword_26A4595E0 = (uint64_t)v2;
    byte_26A4595E8 = 1;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$convertSchemasToGrammars.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458248 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A4595C8 + 1);
  uint64_t v2 = unk_26A4595D8;
  id v7 = (id)qword_26A4595E0;
  uint64_t v4 = qword_26A4595E0;
  char v5 = byte_26A4595E8;
  *(unsigned char *)a1 = xmmword_26A4595C8;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

void static NSUserDefaults.logInfoTieInferenceRequestAsJson.setter()
{
  if (qword_26A458250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26A459608;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.logInfoTieInferenceRequestAsJson.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A459600;
  *uint64_t v2 = xmmword_26A4595F0;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A459610;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A798160;
}

void sub_25A798160(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  uint64_t v4 = (void *)qword_26A459608;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A798228()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A4595F0) = 0;
    *((void *)&xmmword_26A4595F0 + 1) = 0xD000000000000020;
    unk_26A459600 = 0x800000025A7A4890;
    qword_26A459608 = (uint64_t)v2;
    byte_26A459610 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$logInfoTieInferenceRequestAsJson.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A4595F0 + 1);
  uint64_t v2 = unk_26A459600;
  id v7 = (id)qword_26A459608;
  uint64_t v4 = qword_26A459608;
  char v5 = byte_26A459610;
  *(unsigned char *)a1 = xmmword_26A4595F0;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t static NSUserDefaults.taptoRadarNoNetworkTest.getter()
{
  if (qword_26A458258 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2[0] = xmmword_26A459618;
  v2[1] = unk_26A459628;
  char v3 = byte_26A459638;
  sub_25A6F2C80((uint64_t)v2);
  char v0 = sub_25A79412C();
  sub_25A6F2CB4((uint64_t)v2);
  return v0 & 1;
}

void static NSUserDefaults.taptoRadarNoNetworkTest.setter()
{
  if (qword_26A458258 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v0 = (void *)qword_26A459630;
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.taptoRadarNoNetworkTest.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  if (qword_26A458258 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = unk_26A459628;
  *uint64_t v2 = xmmword_26A459618;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = byte_26A459638;
  *((unsigned char *)v2 + 33) = sub_25A79412C() & 1;
  return sub_25A798600;
}

void sub_25A798600(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  uint64_t v4 = (void *)qword_26A459630;
  *(unsigned char *)(*(void *)a1 + 34) = *(unsigned char *)(*(void *)a1 + 33);
  uint64_t v5 = sub_25A79BA30();
  id v6 = (void *)sub_25A79B5B0();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v6);
  if (a2)
  {

    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_25A7986C8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    LOBYTE(xmmword_26A459618) = 0;
    *((void *)&xmmword_26A459618 + 1) = 0xD000000000000017;
    unk_26A459628 = 0x800000025A7A4710;
    qword_26A459630 = (uint64_t)v2;
    byte_26A459638 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$taptoRadarNoNetworkTest.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458258 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *((void *)&xmmword_26A459618 + 1);
  uint64_t v2 = unk_26A459628;
  id v7 = (id)qword_26A459630;
  uint64_t v4 = qword_26A459630;
  char v5 = byte_26A459638;
  *(unsigned char *)a1 = xmmword_26A459618;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

void static NSUserDefaults.taptoRadarDiagExtension.setter()
{
  if (qword_26A458260 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_26A459660;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
  uint64_t v1 = sub_25A79BA30();
  uint64_t v2 = (void *)sub_25A79B5B0();
  objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

void (*static NSUserDefaults.taptoRadarDiagExtension.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x68uLL);
  *a1 = v2;
  if (qword_26A458260 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v3 = *(_OWORD *)&qword_26A459650;
  *uint64_t v2 = xmmword_26A459640;
  v2[1] = v3;
  *(_OWORD *)((char *)v2 + 25) = *(_OWORD *)((char *)&qword_26A459658 + 1);
  *((void *)v2 + 9) = sub_25A7935F8();
  *((void *)v2 + 10) = v4;
  return sub_25A798A0C;
}

void sub_25A798A0C(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 88) = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = (void *)qword_26A459660;
  v3[12] = v3[10];
  swift_bridgeObjectRetain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v5 = sub_25A79BA30();
    id v6 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v5, v6);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4594B8);
    uint64_t v7 = sub_25A79BA30();
    id v8 = (void *)sub_25A79B5B0();
    objc_msgSend(v4, sel_setObject_forKey_, v7, v8);
    swift_endAccess();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  free(v3);
}

void sub_25A798B60()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    xmmword_26A459640 = xmmword_25A7A2130;
    qword_26A459650 = 0xD000000000000017;
    qword_26A459658 = 0x800000025A7A47E0;
    qword_26A459660 = (uint64_t)v2;
    byte_26A459668 = 0;
  }
  else
  {
    sub_25A79B910();
    __break(1u);
  }
}

id static NSUserDefaults.$taptoRadarDiagExtension.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A458260 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_26A459658;
  id v6 = (id)qword_26A459660;
  uint64_t v2 = qword_26A459660;
  char v4 = byte_26A459668;
  *(void *)a1 = xmmword_26A459640;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_26A459640 + 8);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t static NSUserDefaults.privatemlClientUserDefaultsJSONString()()
{
  sub_25A79AB10();
  swift_allocObject();
  sub_25A79AB00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A458470);
  sub_25A79AAD0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25A79C170;
  uint64_t v1 = sub_25A79AAC0();
  MEMORY[0x270FA5388](v1);
  sub_25A727B68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A458480);
  sub_25A7134D8();
  sub_25A79B8A0();
  sub_25A79AAE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A79C170;
  *(void *)(inited + 32) = 0xD00000000000001ELL;
  *(void *)(inited + 40) = 0x800000025A7A46F0;
  if (qword_26B32B960 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v15 = xmmword_26B32B930;
  v16[0] = *(_OWORD *)&qword_26B32B940;
  *(_OWORD *)((char *)v16 + 9) = *(_OWORD *)((char *)&qword_26B32B948 + 1);
  sub_25A7122A0((uint64_t)&v15);
  uint64_t v3 = sub_25A7935F8();
  uint64_t v5 = v4;
  sub_25A7122E4((uint64_t)&v15);
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v5;
  unint64_t v17 = sub_25A6FC46C(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A459688);
  sub_25A799060();
  uint64_t v6 = sub_25A79AAF0();
  if (v0)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = v6;
    unint64_t v10 = v7;
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_25A79B5F0();
    MEMORY[0x270FA5388](v11 - 8);
    sub_25A79B5E0();
    uint64_t v12 = sub_25A79B5D0();
    uint64_t v14 = v13;
    sub_25A6F2C28(v9, v10);
    swift_release();
    if (v14) {
      return v12;
    }
    else {
      return 0x6E776F6E6B6E75;
    }
  }
}

unint64_t sub_25A799060()
{
  unint64_t result = qword_26A459690;
  if (!qword_26A459690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A459688);
    sub_25A7990DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459690);
  }
  return result;
}

unint64_t sub_25A7990DC()
{
  unint64_t result = qword_26A459698;
  if (!qword_26A459698)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4594B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A459698);
  }
  return result;
}

void sub_25A799148()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_25A79B5B0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_26A459670 = (uint64_t)v2;
}

uint64_t static NSUserDefaults.group.getter()
{
  if (qword_26A458268 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A459670;
  id v1 = (id)qword_26A459670;
  return v0;
}

uint64_t sub_25A799214(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25A799228(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A79923C(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25A79924C(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t UserDefault.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v77 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = sub_25A79B850();
  uint64_t v72 = *(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v66[-v8];
  uint64_t v79 = v5;
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v69 = &v66[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v75 = &v66[-v13];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v76 = &v66[-v15];
  uint64_t v16 = *(void *)(a1 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v73 = &v66[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v74 = &v66[-v20];
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = &v66[-v21];
  if (qword_26B32B860 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int v23 = byte_26A4582E0;
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16);
  v24(v22, v3, a1);
  if (v23 == 1)
  {
    char v25 = v22[*(int *)(a1 + 36)];
    uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
    v26(v22, a1);
    if ((v25 & 1) == 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v77, v3, v79);
    }
  }
  else
  {
    uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
    v26(v22, a1);
  }
  uint64_t v70 = v26;
  uint64_t v71 = v16;
  os_log_type_t v27 = *(void **)(v3 + *(int *)(a1 + 32));
  uint64_t v28 = (void *)sub_25A79B5B0();
  id v29 = objc_msgSend(v27, sel_objectForKey_, v28);

  if (!v29) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v77, v3, v79);
  }
  sub_25A79B880();
  swift_unknownObjectRelease();
  sub_25A71C32C(v82, v83);
  sub_25A6F78D8((uint64_t)v83, (uint64_t)v82);
  uint64_t v30 = v79;
  int v31 = swift_dynamicCast();
  uint64_t v32 = v78;
  unint64_t v33 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v78 + 56);
  if (v31)
  {
    v33(v9, 0, 1, v30);
    uint64_t v34 = *(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v32 + 32);
    unint64_t v35 = v76;
    uint64_t v73 = (unsigned char *)(v32 + 32);
    uint64_t v72 = v34;
    v34((uint64_t)v76, v9, v30);
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_25A79B4E0();
    __swift_project_value_buffer(v36, (uint64_t)qword_26A4596A0);
    unint64_t v37 = v74;
    v24(v74, v3, a1);
    char v38 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v32 + 16);
    uint64_t v39 = v75;
    v38(v75, v35, v30);
    unint64_t v40 = sub_25A79B4C0();
    os_log_type_t v41 = sub_25A79B7D0();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      *(void *)&v82[0] = v68;
      *(_DWORD *)uint64_t v43 = 136315394;
      int v67 = v42;
      uint64_t v44 = (uint64_t *)&v37[*(int *)(a1 + 28)];
      uint64_t v45 = *v44;
      unint64_t v46 = v44[1];
      swift_bridgeObjectRetain();
      v80[0] = sub_25A6F6E40(v45, v46, (uint64_t *)v82);
      sub_25A79B860();
      uint64_t v30 = v79;
      swift_bridgeObjectRelease();
      v70(v37, a1);
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v47 = v75;
      v38(v69, v75, v30);
      uint64_t v48 = sub_25A79B600();
      v80[0] = sub_25A6F6E40(v48, v49, (uint64_t *)v82);
      unint64_t v35 = v76;
      sub_25A79B860();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v47, v30);
      _os_log_impl(&dword_25A6DD000, v40, (os_log_type_t)v67, "Using UserDefaults override. key=%s value=%s", (uint8_t *)v43, 0x16u);
      uint64_t v50 = v68;
      swift_arrayDestroy();
      MEMORY[0x261143A60](v50, -1, -1);
      MEMORY[0x261143A60](v43, -1, -1);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v39, v30);
      v70(v37, a1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v83);
    return v72(v77, v35, v30);
  }
  else
  {
    v33(v9, 1, 1, v30);
    (*((void (**)(unsigned char *, uint64_t))v72 + 1))(v9, v6);
    if (qword_26A458270 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_25A79B4E0();
    __swift_project_value_buffer(v52, (uint64_t)qword_26A4596A0);
    uint64_t v53 = v73;
    v24(v73, v3, a1);
    sub_25A6F78D8((uint64_t)v83, (uint64_t)v82);
    uint64_t v54 = sub_25A79B4C0();
    os_log_type_t v55 = sub_25A79B7F0();
    if (os_log_type_enabled(v54, v55))
    {
      os_log_t v56 = v53;
      uint64_t v57 = swift_slowAlloc();
      uint64_t v76 = (unsigned char *)swift_slowAlloc();
      uint64_t v81 = v76;
      *(_DWORD *)uint64_t v57 = 136315650;
      uint64_t v58 = (uint64_t *)&v56[*(int *)(a1 + 28)];
      uint64_t v60 = *v58;
      unint64_t v59 = v58[1];
      swift_bridgeObjectRetain();
      v80[0] = sub_25A6F6E40(v60, v59, (uint64_t *)&v81);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      v70(v56, a1);
      *(_WORD *)(v57 + 12) = 2080;
      sub_25A6F78D8((uint64_t)v82, (uint64_t)v80);
      uint64_t v61 = sub_25A79B600();
      v80[0] = sub_25A6F6E40(v61, v62, (uint64_t *)&v81);
      sub_25A79B860();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v82);
      *(_WORD *)(v57 + 22) = 2080;
      uint64_t v63 = sub_25A79BB00();
      v80[0] = sub_25A6F6E40(v63, v64, (uint64_t *)&v81);
      uint64_t v30 = v79;
      sub_25A79B860();
      uint64_t v32 = v78;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A6DD000, v54, v55, "Mismatched defaults type. key=%s value=%s type=%s", (uint8_t *)v57, 0x20u);
      uint64_t v65 = v76;
      swift_arrayDestroy();
      MEMORY[0x261143A60](v65, -1, -1);
      MEMORY[0x261143A60](v57, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v82);
      v70(v53, a1);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v83);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v77, v3, v30);
  }
}

uint64_t UserDefault.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  sub_25A79A09C(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);
  return v4(a1);
}

uint64_t UserDefault.init(key:defaultValue:container:customerBuildEnabled:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for UserDefault();
  uint64_t v15 = (void *)(a7 + v14[7]);
  *uint64_t v15 = a1;
  v15[1] = a2;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a7, a3, a6);
  *(void *)(a7 + v14[8]) = a4;
  *(unsigned char *)(a7 + v14[9]) = a5;
  return result;
}

uint64_t UserDefault.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_25A799D88()
{
  uint64_t v0 = sub_25A79B4E0();
  __swift_allocate_value_buffer(v0, qword_26A4596A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A4596A0);
  return sub_25A79B4D0();
}

uint64_t UserDefault.defaultValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

void (*UserDefault.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 + 16);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v5[5] = v9;
  UserDefault.wrappedValue.getter(a2, (uint64_t)v9);
  return sub_25A799F10;
}

void sub_25A799F10(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  uint64_t v5 = (*a1)[2];
  uint64_t v6 = (*a1)[3];
  uint64_t v7 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    sub_25A79A09C((uint64_t)v3, v7);
    size_t v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    sub_25A79A09C((*a1)[5], v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

Swift::Void __swiftcall UserDefault.removeObject()()
{
  uint64_t v2 = *(void **)(v1 + *(int *)(v0 + 32));
  id v3 = (id)sub_25A79B5B0();
  objc_msgSend(v2, sel_removeObjectForKey_, v3);
}

uint64_t sub_25A79A060(void (*a1)(void))
{
  a1();
  return sub_25A79BB00();
}

void sub_25A79A09C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(v2 + *(int *)(a2 + 32));
  uint64_t v4 = sub_25A79BA10();
  id v5 = (id)sub_25A79B5B0();
  objc_msgSend(v3, sel_setObject_forKey_, v4, v5);
  swift_unknownObjectRelease();
}

uint64_t type metadata accessor for UserDefault()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A79A140@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UserDefault();
  return UserDefault.wrappedValue.getter(v2, a1);
}

void sub_25A79A17C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserDefault();
  sub_25A79A09C(a1, v2);
}

uint64_t sub_25A79A1BC()
{
  return 8;
}

void *sub_25A79A1C8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25A79A1D4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25A79A284(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    void *v10 = *v11;
    v10[1] = v11[1];
    unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v14 = *(void **)v13;
    *(void *)unint64_t v12 = *(void *)v13;
    *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
    swift_bridgeObjectRetain();
    id v15 = v14;
  }
  return v4;
}

void sub_25A79A3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)((v4 + 23) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_25A79A434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void **)v10;
  *(void *)unint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  swift_bridgeObjectRetain();
  id v12 = v11;
  return a1;
}

uint64_t sub_25A79A4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void **)v10;
  id v12 = *(void **)v9;
  *(void *)unint64_t v9 = *(void *)v10;
  id v13 = v11;

  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  return a1;
}

uint64_t sub_25A79A5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  return a1;
}

uint64_t sub_25A79A634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void **)v9;
  *(void *)unint64_t v9 = *(void *)v10;

  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  return a1;
}

uint64_t sub_25A79A6E8(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 9;
    unsigned int v9 = (a2 - v7 + 255) >> (8 * v8);
    if (v8 < 4) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = a1[v8];
        if (!a1[v8]) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)&a1[v8];
        if (*(_WORD *)&a1[v8]) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25A79A858);
      case 4:
        int v13 = *(_DWORD *)&a1[v8];
        if (!v13) {
          break;
        }
LABEL_22:
        int v15 = (v13 - 1) << (8 * v8);
        if (v8 >= 4) {
          int v15 = 0;
        }
        if (((((v6 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
          int v16 = *a1;
        }
        else {
          int v16 = *(_DWORD *)a1;
        }
        return v7 + (v16 | v15) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)&a1[v6 + 7] & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_25A79A86C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 9;
  char v11 = 8 * v10;
  if (v8 >= a3)
  {
    int v15 = 0;
    if (v8 >= a2)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 3:
          goto LABEL_46;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_33;
        default:
LABEL_33:
          if (a2)
          {
LABEL_34:
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v21 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                void *v21 = a2 ^ 0x80000000;
                v21[1] = 0;
              }
              else
              {
                v21[1] = a2 - 1;
              }
            }
            else
            {
              uint64_t v20 = *(void (**)(void))(v6 + 56);
              v20();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = (a3 - v8 + 255) >> v11;
    if (v10 <= 3) {
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
    if (v8 >= a2) {
      goto LABEL_17;
    }
  }
  unsigned int v16 = ~v8 + a2;
  unsigned int v17 = (~(_BYTE)v8 + a2);
  if (v10 < 4) {
    int v18 = (v16 >> v11) + 1;
  }
  else {
    int v18 = 1;
  }
  if (v10 >= 4) {
    unsigned int v19 = v16;
  }
  else {
    unsigned int v19 = v17;
  }
  bzero(a1, v10);
  if (v10 == 1) {
    *a1 = v19;
  }
  else {
    *(_DWORD *)a1 = v19;
  }
  switch(v15)
  {
    case 1:
      a1[v10] = v18;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v18;
      break;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x25A79AA88);
    case 4:
      *(_DWORD *)&a1[v10] = v18;
      break;
    default:
      return;
  }
}

uint64_t sub_25A79AAB0()
{
  return MEMORY[0x270EEDE30]();
}

uint64_t sub_25A79AAC0()
{
  return MEMORY[0x270EEDE40]();
}

uint64_t sub_25A79AAD0()
{
  return MEMORY[0x270EEDE50]();
}

uint64_t sub_25A79AAE0()
{
  return MEMORY[0x270EEDE68]();
}

uint64_t sub_25A79AAF0()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_25A79AB00()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_25A79AB10()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_25A79AB20()
{
  return MEMORY[0x270EEE3D8]();
}

uint64_t sub_25A79AB30()
{
  return MEMORY[0x270EEE418]();
}

uint64_t sub_25A79AB40()
{
  return MEMORY[0x270EEE4B8]();
}

uint64_t sub_25A79AB50()
{
  return MEMORY[0x270EEE528]();
}

uint64_t sub_25A79AB60()
{
  return MEMORY[0x270EEE540]();
}

uint64_t sub_25A79AB70()
{
  return MEMORY[0x270EEE5B0]();
}

uint64_t sub_25A79AB80()
{
  return MEMORY[0x270EEE600]();
}

uint64_t sub_25A79AB90()
{
  return MEMORY[0x270EEE608]();
}

uint64_t sub_25A79ABA0()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_25A79ABB0()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_25A79ABC0()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_25A79ABD0()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_25A79ABE0()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_25A79ABF0()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_25A79AC00()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_25A79AC10()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_25A79AC20()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_25A79AC30()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_25A79AC40()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_25A79AC50()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_25A79AC60()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_25A79AC70()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_25A79AC80()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_25A79ACA0()
{
  return MEMORY[0x270F56F78]();
}

uint64_t sub_25A79ACB0()
{
  return MEMORY[0x270F56F80]();
}

uint64_t sub_25A79ACE0()
{
  return MEMORY[0x270F56F98]();
}

uint64_t sub_25A79ACF0()
{
  return MEMORY[0x270F56FA0]();
}

uint64_t sub_25A79AD20()
{
  return MEMORY[0x270F56FB8]();
}

uint64_t sub_25A79AD30()
{
  return MEMORY[0x270F56FC0]();
}

uint64_t sub_25A79AD40()
{
  return MEMORY[0x270F56FC8]();
}

uint64_t sub_25A79AD50()
{
  return MEMORY[0x270F56FD0]();
}

uint64_t sub_25A79AD60()
{
  return MEMORY[0x270F4C190]();
}

uint64_t sub_25A79AD70()
{
  return MEMORY[0x270F4C1A0]();
}

uint64_t sub_25A79AD80()
{
  return MEMORY[0x270F4C348]();
}

uint64_t sub_25A79AD90()
{
  return MEMORY[0x270F4C350]();
}

uint64_t sub_25A79ADA0()
{
  return MEMORY[0x270F4C368]();
}

uint64_t sub_25A79ADB0()
{
  return MEMORY[0x270F4C380]();
}

uint64_t sub_25A79ADC0()
{
  return MEMORY[0x270F4C388]();
}

uint64_t sub_25A79ADD0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_25A79ADE0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_25A79ADF0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_25A79AE00()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_25A79AE10()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_25A79AE20()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_25A79AE30()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_25A79AE40()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_25A79AE70()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_25A79AE80()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_25A79AE90()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_25A79AEA0()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_25A79AEB0()
{
  return MEMORY[0x270F44B68]();
}

uint64_t sub_25A79AEC0()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_25A79AED0()
{
  return MEMORY[0x270F44B88]();
}

uint64_t sub_25A79AEE0()
{
  return MEMORY[0x270F44B98]();
}

uint64_t sub_25A79AEF0()
{
  return MEMORY[0x270F44BA8]();
}

uint64_t sub_25A79AF00()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_25A79AF10()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_25A79AF20()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_25A79AF30()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_25A79AF40()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_25A79AF50()
{
  return MEMORY[0x270F44C10]();
}

uint64_t sub_25A79AF60()
{
  return MEMORY[0x270F44C18]();
}

uint64_t sub_25A79AF70()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_25A79AF80()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_25A79AF90()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_25A79AFA0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_25A79AFB0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_25A79AFC0()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_25A79AFE0()
{
  return MEMORY[0x270F44CD0]();
}

uint64_t sub_25A79AFF0()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_25A79B000()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_25A79B010()
{
  return MEMORY[0x270F44D30]();
}

uint64_t sub_25A79B020()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_25A79B030()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_25A79B040()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_25A79B050()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_25A79B060()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_25A79B070()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_25A79B080()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_25A79B090()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_25A79B0A0()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_25A79B0B0()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_25A79B0C0()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_25A79B0D0()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_25A79B0E0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_25A79B0F0()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_25A79B100()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_25A79B110()
{
  return MEMORY[0x270F43620]();
}

uint64_t sub_25A79B120()
{
  return MEMORY[0x270F43858]();
}

uint64_t sub_25A79B130()
{
  return MEMORY[0x270F43898]();
}

uint64_t sub_25A79B140()
{
  return MEMORY[0x270F438B8]();
}

uint64_t sub_25A79B150()
{
  return MEMORY[0x270F43978]();
}

uint64_t sub_25A79B160()
{
  return MEMORY[0x270F43990]();
}

uint64_t sub_25A79B170()
{
  return MEMORY[0x270F439A8]();
}

uint64_t sub_25A79B180()
{
  return MEMORY[0x270F43FA0]();
}

uint64_t sub_25A79B190()
{
  return MEMORY[0x270F43FA8]();
}

uint64_t sub_25A79B1A0()
{
  return MEMORY[0x270F43FB0]();
}

uint64_t sub_25A79B1B0()
{
  return MEMORY[0x270F43FB8]();
}

uint64_t sub_25A79B1C0()
{
  return MEMORY[0x270F43FC0]();
}

uint64_t sub_25A79B1D0()
{
  return MEMORY[0x270F43FC8]();
}

uint64_t sub_25A79B1E0()
{
  return MEMORY[0x270F43FD0]();
}

uint64_t sub_25A79B1F0()
{
  return MEMORY[0x270F43FD8]();
}

uint64_t sub_25A79B200()
{
  return MEMORY[0x270F43FE0]();
}

uint64_t sub_25A79B210()
{
  return MEMORY[0x270F43FE8]();
}

uint64_t sub_25A79B220()
{
  return MEMORY[0x270F43FF0]();
}

uint64_t sub_25A79B230()
{
  return MEMORY[0x270F43FF8]();
}

uint64_t sub_25A79B240()
{
  return MEMORY[0x270F44000]();
}

uint64_t sub_25A79B250()
{
  return MEMORY[0x270F44008]();
}

uint64_t sub_25A79B260()
{
  return MEMORY[0x270F44010]();
}

uint64_t sub_25A79B270()
{
  return MEMORY[0x270F44018]();
}

uint64_t sub_25A79B280()
{
  return MEMORY[0x270F44020]();
}

uint64_t sub_25A79B290()
{
  return MEMORY[0x270F44028]();
}

uint64_t sub_25A79B2A0()
{
  return MEMORY[0x270F44030]();
}

uint64_t sub_25A79B2B0()
{
  return MEMORY[0x270F44040]();
}

uint64_t sub_25A79B2C0()
{
  return MEMORY[0x270F44050]();
}

uint64_t sub_25A79B2D0()
{
  return MEMORY[0x270F44058]();
}

uint64_t sub_25A79B2E0()
{
  return MEMORY[0x270F44060]();
}

uint64_t sub_25A79B2F0()
{
  return MEMORY[0x270F44070]();
}

uint64_t sub_25A79B300()
{
  return MEMORY[0x270F44080]();
}

uint64_t sub_25A79B310()
{
  return MEMORY[0x270F44090]();
}

uint64_t sub_25A79B320()
{
  return MEMORY[0x270F440A0]();
}

uint64_t sub_25A79B330()
{
  return MEMORY[0x270F440A8]();
}

uint64_t sub_25A79B340()
{
  return MEMORY[0x270F440B8]();
}

uint64_t sub_25A79B350()
{
  return MEMORY[0x270F440C8]();
}

uint64_t sub_25A79B360()
{
  return MEMORY[0x270F440D8]();
}

uint64_t sub_25A79B370()
{
  return MEMORY[0x270F440E8]();
}

uint64_t sub_25A79B380()
{
  return MEMORY[0x270F440F0]();
}

uint64_t sub_25A79B390()
{
  return MEMORY[0x270F440F8]();
}

uint64_t sub_25A79B3A0()
{
  return MEMORY[0x270F44108]();
}

uint64_t sub_25A79B3B0()
{
  return MEMORY[0x270F44110]();
}

uint64_t sub_25A79B3C0()
{
  return MEMORY[0x270F44118]();
}

uint64_t sub_25A79B3D0()
{
  return MEMORY[0x270F44120]();
}

uint64_t sub_25A79B3E0()
{
  return MEMORY[0x270F441A8]();
}

uint64_t sub_25A79B3F0()
{
  return MEMORY[0x270F44210]();
}

uint64_t sub_25A79B400()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25A79B410()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25A79B420()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25A79B430()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25A79B440()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25A79B450()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25A79B460()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_25A79B470()
{
  return MEMORY[0x270FA2DA8]();
}

uint64_t sub_25A79B480()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_25A79B490()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_25A79B4A0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_25A79B4B0()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_25A79B4C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A79B4D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A79B4E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A79B4F0()
{
  return MEMORY[0x270F2F668]();
}

uint64_t sub_25A79B500()
{
  return MEMORY[0x270F2F678]();
}

uint64_t sub_25A79B510()
{
  return MEMORY[0x270F2F680]();
}

uint64_t sub_25A79B520()
{
  return MEMORY[0x270F2F6A8]();
}

uint64_t sub_25A79B530()
{
  return MEMORY[0x270F2F6D0]();
}

uint64_t sub_25A79B540()
{
  return MEMORY[0x270F2F6D8]();
}

uint64_t sub_25A79B550()
{
  return MEMORY[0x270F2F6E0]();
}

uint64_t sub_25A79B560()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_25A79B570()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25A79B580()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A79B590()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A79B5A0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A79B5B0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_25A79B5C0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_25A79B5D0()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_25A79B5E0()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_25A79B5F0()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_25A79B600()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A79B610()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25A79B620()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25A79B630()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A79B640()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25A79B650()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25A79B660()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A79B670()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A79B680()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25A79B690()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25A79B6B0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25A79B6C0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25A79B6D0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25A79B6E0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25A79B6F0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25A79B700()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25A79B710()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25A79B720()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25A79B730()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A79B740()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25A79B750()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A79B760()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_25A79B770()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A79B780()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A79B790()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25A79B7A0()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_25A79B7B0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25A79B7C0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25A79B7D0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A79B7E0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A79B7F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A79B800()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A79B810()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25A79B820()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25A79B830()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_25A79B840()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_25A79B850()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A79B860()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A79B870()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A79B880()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A79B8A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A79B8B0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A79B8C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A79B8D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A79B8E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A79B8F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A79B900()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A79B910()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25A79B920()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A79B930()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A79B940()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A79B950()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A79B960()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A79B970()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25A79B980()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25A79B990()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25A79B9A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25A79B9B0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25A79B9C0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25A79B9D0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25A79B9E0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25A79B9F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A79BA00()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_25A79BA10()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25A79BA20()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A79BA30()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25A79BA40()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A79BA50()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A79BA60()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A79BA70()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A79BA80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A79BA90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A79BAA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A79BAB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A79BAC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25A79BAD0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25A79BB00()
{
  return MEMORY[0x270FA0128]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C0](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54F8](userNotification, responseFlags, timeout);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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
  return MEMORY[0x270EDA460](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}