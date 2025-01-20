id sub_257D7BD84()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id result;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  id v37;
  unsigned int v38;
  char **v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA08]), sel_init);
  v62 = v3;
  v4 = objc_msgSend(self, sel_sharedContext);
  if (!v4
    || (v5 = v4,
        v6 = objc_msgSend(v4, sel_managedObjectContext),
        v5,
        !v6))
  {
    v6 = v3;
LABEL_28:

    return v2;
  }
  result = objc_msgSend(self, sel_sharedContext);
  if (!result)
  {
    __break(1u);
    goto LABEL_57;
  }
  v8 = result;
  v9 = objc_msgSend(result, sel_managedObjectContext);

  if (!v9)
  {

    goto LABEL_28;
  }
  ((void (*)(void))MEMORY[0x270FA5388])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D3A0);
  v10 = sub_257D94F10();
  v11 = v60;
  if (v60 == 1)
  {
    MEMORY[0x270FA5388](v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D3A8);
    sub_257D94F10();
    v11 = v61;
  }
  if (!v11) {
    goto LABEL_32;
  }
  swift_unknownObjectRetain();
  self;
  v12 = swift_dynamicCastObjCClass();
  if (v12)
  {
    v32 = v12;
    v33 = CGSizeMake(300.0, 300.0);
    v35 = objc_msgSend(self, sel_createTextViewWithNote_size_, v32, v33, v34);
    v36 = self;
    v37 = v35;
    v38 = objc_msgSend(v36, sel_isEnabled);
    v39 = &selRef_setPaperEnabled_;
    if (!v38) {
      v39 = &selRef_setStylusDrawingEnabled_;
    }
    objc_msgSend(v37, *v39, 1);
    objc_msgSend(v37, sel_setDataDetectorTypes_, 0);
    v40 = objc_msgSend(v37, sel_textDragInteraction);
    objc_msgSend(v40, sel_setEnabled_, 0);

    v41 = objc_msgSend(v37, sel_textStorage);
    self;
    v42 = (void *)swift_dynamicCastObjCClass();
    if (v42) {
      objc_msgSend(v42, sel_fixupAfterEditing);
    }

    v43 = v37;
    sub_257D7CBE4(v43);

    objc_msgSend(v43, sel_setUserInteractionEnabled_, 1);
    objc_msgSend(v43, sel_setSelectable_, 0);
    objc_msgSend(v43, sel_setScrollEnabled_, 0);
    v44 = self;
    sub_257D7DFCC(0, &qword_26A05D418);
    objc_msgSend(v44, sel_registerTextAttachmentClass_forFileType_, swift_getObjCClassFromMetadata(), *MEMORY[0x263F14C60]);
    sub_257D7DFCC(0, &qword_26A05D420);
    objc_msgSend(v44, sel_registerTextAttachmentClass_forFileType_, swift_getObjCClassFromMetadata(), *MEMORY[0x263F14C68]);
    v45 = self;
    v46 = v43;
    v47 = objc_msgSend(v45, sel_clearColor);
    objc_msgSend(v46, sel_setBackgroundColor_, v47);

    v48 = objc_msgSend(v45, sel_ICTintColor);
    objc_msgSend(v46, sel_setTintColor_, v48);

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    return v46;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRetain();
  if (!swift_dynamicCastObjCProtocolConditional())
  {
    swift_unknownObjectRelease_n();
LABEL_32:

    swift_bridgeObjectRelease();
    return v2;
  }
  v58 = v9;
  CGSizeMake(300.0, 300.0);
  v13 = CGRectMake();
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B538]), sel_initWithFrame_, v13, v14, v15, v16);
  objc_msgSend(v17, sel_setDelegate_, *(void *)(v1 + 56));
  result = objc_msgSend(v17, sel_webView);
  if (!result)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v18 = result;
  v59 = v17;
  v19 = objc_msgSend(result, sel_scrollView);

  v20 = objc_msgSend(v19, sel_subviews);
  sub_257D7DFCC(0, &qword_26A05D410);
  v21 = sub_257D94E70();

  if (v21 >> 62) {
    goto LABEL_43;
  }
  v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v22)
  {
    v55 = v11;
    v56 = v6;
    v57 = v2;
    v6 = (id)(v21 & 0xC000000000000001);
    v11 = 4;
    while (1)
    {
      v23 = v6 ? (id)MEMORY[0x25A2C2620](v11 - 4, v21) : *(id *)(v21 + 8 * v11);
      v2 = v23;
      v24 = v11 - 3;
      if (__OFADD__(v11 - 4, 1)) {
        break;
      }
      v25 = objc_msgSend(v23, sel_className, v55);
      if (v25)
      {
        v26 = v25;
        v27 = sub_257D94E30();
        v29 = v28;

        if (v29)
        {
          if (v27 == 0x6E65746E6F434B57 && v29 == 0xED00007765695674)
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
LABEL_40:
            sub_257D7CBE4(v2);

LABEL_41:
            v6 = v56;
            v2 = v57;
            goto LABEL_45;
          }
          v31 = sub_257D95020();
          swift_bridgeObjectRelease();
          if (v31)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_40;
          }
        }
      }

      ++v11;
      if (v24 == v22)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_41;
      }
    }
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain_n();
    v22 = sub_257D94FF0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease_n();
LABEL_45:
  v49 = v59;
  if ((uint64_t)objc_msgSend(v62, sel_count) < 1)
  {
    swift_bridgeObjectRetain();
    v51 = (id)sub_257D94E20();
    swift_bridgeObjectRelease();
    objc_msgSend(v59, sel_setHtmlString_attachments_, v51, 0);
  }
  else
  {
    if (objc_msgSend(v59, sel_delegate))
    {
      type metadata accessor for NotesSiriSingleNoteHelper();
      if (swift_dynamicCastClass())
      {
        v50 = v62;
        sub_257D7D600();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    v52 = (void *)sub_257D94E20();
    swift_bridgeObjectRelease();
    v51 = objc_msgSend(v62, sel_allObjects);
    if (!v51)
    {
      sub_257D94E70();
      v51 = (id)sub_257D94E60();
      swift_bridgeObjectRelease();
    }
    v49 = v59;
    objc_msgSend(v59, sel_setHtmlString_attachments_, v52, v51, v55);
  }
  result = objc_msgSend(v49, sel_webView);
  if (result)
  {
    v53 = result;
    v54 = objc_msgSend(result, sel_scrollView);

    objc_msgSend(v54, sel_setScrollEnabled_, 0);
    objc_msgSend(v49, sel_setInsideSiriSnippet_, 1);

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();

    return v49;
  }
LABEL_58:
  __break(1u);
  return result;
}

id sub_257D7C7CC@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X2>, unsigned char *a3@<X3>, uint64_t *a4@<X8>)
{
  sub_257D7DFCC(0, &qword_26A05D430);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v9 = (void *)sub_257D94E20();
  uint64_t v10 = (uint64_t)objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v9, a1);

  if (v10)
  {
    *a2 = objc_msgSend((id)v10, sel_isPasswordProtected);
    id result = objc_msgSend((id)v10, sel_isUnsupported);
  }
  else
  {
    id result = 0;
    *a2 = 0;
    uint64_t v10 = 1;
  }
  *a3 = (_BYTE)result;
  *a4 = v10;
  return result;
}

void sub_257D7C8B0(void *a1@<X1>, unsigned char *a2@<X2>, uint64_t *a3@<X3>, void **a4@<X4>, void *a5@<X8>)
{
  v31 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_257D94610();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D94600();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_257D7DEA0((uint64_t)v10);
    v15 = 0;
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  v16 = (void *)sub_257D945E0();
  id v17 = objc_msgSend(a1, sel_ic_objectIDFromURL_, v16);

  if (!v17)
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v15 = 0;
    goto LABEL_16;
  }
  id v18 = objc_msgSend(a1, sel_ic_existingObjectWithID_, v17);
  if (!v18)
  {
LABEL_9:

    goto LABEL_10;
  }
  v19 = v18;
  self;
  v20 = (void *)swift_dynamicCastObjCClass();
  if (!v20)
  {

    goto LABEL_9;
  }
  v15 = v20;
  *a2 = objc_msgSend(v20, sel_isPlainText);
  id v21 = objc_msgSend(v15, sel_content);
  if (v21)
  {
    v22 = v21;
    uint64_t v30 = sub_257D94E30();
    unint64_t v24 = v23;

    uint64_t v25 = v30;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v24 = 0xE000000000000000;
  }
  *a3 = v25;
  a3[1] = v24;
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v15, sel_attachments);
  if (v26)
  {
    v27 = v26;
    sub_257D94EC0();

    id v28 = (id)sub_257D94EB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA08]), sel_init);
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v29 = *v31;
  *v31 = v28;

LABEL_16:
  *a5 = v15;
}

void sub_257D7CBE4(void *a1)
{
  objc_msgSend(a1, sel_setUserInteractionEnabled_, 0);
  id v2 = objc_msgSend(a1, sel_subviews);
  sub_257D7DFCC(0, &qword_26A05D410);
  unint64_t v3 = sub_257D94E70();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_257D94FF0();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x25A2C2620](i, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    v7 = v6;
    sub_257D7CBE4();
  }
LABEL_10:
  swift_bridgeObjectRelease();
}

id sub_257D7CD10(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v6 = v5;
  if (a2) {
    *(double *)&a1 = 0.0;
  }
  if (a4) {
    *(double *)&a3 = 0.0;
  }
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = a5;
    id v13 = objc_msgSend(v11, sel_textLayoutManager);
    if (v13)
    {
      v14 = v13;
      id v15 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v15, sel_bounds);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      v45.origin.x = v17;
      v45.origin.y = v19;
      v45.size.width = v21;
      v45.size.height = v23;
      CGFloat Height = CGRectGetHeight(v45);
      double v25 = Height + Height;
      double v26 = *(double *)(v6 + 64);
      if (v26 == -1.0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D398);
        sub_257D94D40();
        if (v44 == 1 && *(double *)&qword_26A05D300 != -1.0) {
          goto LABEL_22;
        }
        objc_msgSend(v11, sel_contentSize);
        objc_msgSend(v12, sel_systemLayoutSizeFittingSize_, *(double *)&a1);
        qword_26A05D300 = *(void *)&v27;
        if (v25 >= v27) {
          goto LABEL_22;
        }
        sub_257D94D50();
        id v28 = objc_msgSend(self, sel_defaultCenter);
      }
      else
      {
        qword_26A05D300 = *(void *)(v6 + 64);
        if (v25 >= v26)
        {
LABEL_22:
          double v42 = *(double *)&qword_26A05D300;
          double v43 = *(double *)(v6 + 16);

          double v39 = CGSizeMake(*(double *)&a1, v42 + v43);
          return *(id *)&v39;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D398);
        sub_257D94D50();
        id v28 = objc_msgSend(self, sel_defaultCenter);
      }
      id v40 = v28;
      v41 = (void *)sub_257D94E20();
      objc_msgSend(v40, sel_postNotificationName_object_, v41, 0);

      goto LABEL_22;
    }
  }
  self;
  uint64_t v29 = swift_dynamicCastObjCClass();
  if (!v29)
  {
    objc_msgSend(a5, sel_systemLayoutSizeFittingSize_, *(double *)&a1, *(double *)&a3);
    return *(id *)&v39;
  }
  uint64_t v30 = (void *)v29;
  id v31 = a5;
  id result = objc_msgSend(v30, sel_webView);
  if (result)
  {
    v33 = result;
    id v34 = objc_msgSend(result, sel_scrollView);

    objc_msgSend(v34, sel_contentSize);
    double v36 = v35;

    objc_msgSend(v31, sel_systemLayoutSizeFittingSize_, *(double *)&a1, v36);
    uint64_t v38 = v37;

    return (id)v38;
  }
  __break(1u);
  return result;
}

id sub_257D7D088()
{
  return sub_257D7BD84();
}

id sub_257D7D0E0(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  return sub_257D7CD10(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_257D7D124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_257D7DF00();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_257D7D188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_257D7DF00();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_257D7D1EC()
{
  return sub_257D94C70();
}

void sub_257D7D208()
{
}

uint64_t sub_257D7D230@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = (void *)sub_257D94E20();
    id v8 = sub_257D7D7EC((uint64_t)v7);
    id v9 = objc_msgSend(v8, sel_dataFileURL);
    if (v9)
    {
      uint64_t v10 = v9;
      sub_257D945F0();

      uint64_t v11 = sub_257D94610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
    }
    else
    {

      uint64_t v15 = sub_257D94610();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
    }
    return sub_257D7DF64((uint64_t)v6, a2);
  }
  else
  {
    uint64_t v12 = sub_257D94610();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    return v13(a2, 1, 1, v12);
  }
}

void sub_257D7D600()
{
  uint64_t v0 = sub_257D945B0();
  uint64_t v7 = *(void *)(v0 - 8);
  uint64_t v8 = v0;
  MEMORY[0x270FA5388]();
  id v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D7DFCC(0, &qword_26A05D448);
  unint64_t v3 = (void *)MEMORY[0x25A2C2590](MEMORY[0x263F8EE78]);
  sub_257D94F20();
  sub_257D945A0();
  while (v13)
  {
    sub_257D7DF54(&v12, &v11);
    sub_257D7DFCC(0, &qword_26A05D450);
    if (swift_dynamicCast())
    {
      uint64_t v4 = v10;
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B530]), sel_initWithNoteAttachmentObject_, v10);
      objc_msgSend(v3, sel_ic_addNonNilObject_, v5);
    }
    sub_257D945A0();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v8);
  unint64_t v6 = *(void **)(v9
                + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations);
  *(void *)(v9
            + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations) = v3;
}

id sub_257D7D7EC(uint64_t a1)
{
  uint64_t v3 = sub_257D945B0();
  uint64_t v12 = *(void *)(v3 - 8);
  uint64_t v13 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_retain(*(id *)(v1
                         + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations));
  sub_257D94F40();

  sub_257D945A0();
  while (v17)
  {
    sub_257D7DF54(&v16, &v15);
    sub_257D7DFCC(0, &qword_26A05D440);
    if (swift_dynamicCast())
    {
      id v7 = v14;
      id result = objc_msgSend(v14, sel_contentID);
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = result;
      unsigned int v10 = objc_msgSend(result, sel_isEqual_, a1);

      if (v10)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v13);
        return v7;
      }
    }
    sub_257D945A0();
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v13);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B530]), sel_init);
}

id sub_257D7DA70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotesSiriSingleNoteHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NotesSiriSingleNoteHelper()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for NotesSiriTextEditorWrapper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotesSiriTextEditorWrapper(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t initializeWithCopy for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  id v6 = *(void **)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v4 = *(void **)(a2 + 56);
  uint64_t v5 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v4;
  id v6 = v4;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriTextEditorWrapper(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesSiriTextEditorWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesSiriTextEditorWrapper()
{
  return &type metadata for NotesSiriTextEditorWrapper;
}

uint64_t sub_257D7DDA0()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_257D7DDB0()
{
  unint64_t result = qword_26A05D390;
  if (!qword_26A05D390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D390);
  }
  return result;
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

id sub_257D7DE48@<X0>(uint64_t *a1@<X8>)
{
  return sub_257D7C7CC(*(void *)(v1 + 24), *(unsigned char **)(v1 + 32), *(unsigned char **)(v1 + 40), a1);
}

void sub_257D7DE68(void *a1@<X8>)
{
  sub_257D7C8B0(*(void **)(v1 + 24), *(unsigned char **)(v1 + 32), *(uint64_t **)(v1 + 40), *(void ***)(v1 + 48), a1);
}

double CGRectMake()
{
  return 0.0;
}

uint64_t sub_257D7DEA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_257D7DF00()
{
  unint64_t result = qword_26A05D438;
  if (!qword_26A05D438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D438);
  }
  return result;
}

_OWORD *sub_257D7DF54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_257D7DF64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_257D7DFCC(uint64_t a1, unint64_t *a2)
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

double sub_257D7E008@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v47 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v9 = sub_257D94610();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  long long v16 = (char *)&v41 - v15;
  MEMORY[0x270FA5388](v14);
  double v18 = (char *)&v41 - v17;
  char v48 = 0;
  sub_257D94D30();
  uint64_t v19 = v50;
  sub_257D94600();
  swift_bridgeObjectRelease();
  double v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v20((uint64_t)v8, 1, v9) != 1)
  {
    double v43 = v20;
    char v44 = v13;
    double v42 = v16;
    CGRect v45 = v6;
    uint64_t v46 = v19;
    CGFloat v23 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v23(v18, v8, v9);
    unint64_t v24 = self;
    double v25 = (void *)sub_257D945E0();
    id v26 = objc_msgSend(v24, sel_NotesAppIDForNoteMentionedInURL_, v25);

    if (v26)
    {
      uint64_t v21 = sub_257D94E30();
      unint64_t v22 = v27;

      (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
LABEL_12:
      uint64_t v19 = v46;
      goto LABEL_13;
    }
    id v28 = (void *)sub_257D945E0();
    unsigned int v29 = objc_msgSend(v24, sel_isShowHTMLNoteURL_, v28);

    if (v29)
    {
      uint64_t v30 = (void *)sub_257D945E0();
      id v31 = objc_msgSend(v24, sel_objectIDURIRepresentationForHTMLNoteMentionedInURL_, v30);

      if (v31)
      {
        v32 = v44;
        sub_257D945F0();

        uint64_t v33 = (uint64_t)v45;
        v23(v45, v32, v9);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v33, 0, 1, v9);
        if (v43(v33, 1, v9) != 1)
        {
          id v34 = v42;
          v23(v42, (char *)v33, v9);
          uint64_t v21 = sub_257D945D0();
          unint64_t v22 = v35;
          double v36 = *(void (**)(char *, uint64_t))(v10 + 8);
          v36(v34, v9);
          v36(v18, v9);
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v33 = (uint64_t)v45;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v45, 1, 1, v9);
      }
      sub_257D7DEA0(v33);
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    uint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    goto LABEL_12;
  }
  sub_257D7DEA0((uint64_t)v8);
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
LABEL_13:
  uint64_t v37 = v47;
  id v38 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotesSiriSingleNoteHelper()), sel_init);
  qword_26A05D300 = 0xBFF0000000000000;
  char v39 = v49;
  *(void *)uint64_t v37 = v21;
  *(void *)(v37 + 8) = v22;
  double result = 28.0;
  *(_OWORD *)(v37 + 16) = xmmword_257D95670;
  *(unsigned char *)(v37 + 32) = v39;
  *(void *)(v37 + 40) = v19;
  *(void *)(v37 + 48) = 0x4074800000000000;
  *(void *)(v37 + 56) = v38;
  *(double *)(v37 + 64) = a2;
  return result;
}

uint64_t NotesSiriListView.viewModels.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NotesSiriListView.init(noteIdentifier:headerText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(self, sel_startSharedContextWithOptions_, 66116);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_257D957B0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  NotesSiriListView.init(noteIdentifiers:modernManagedObjectContext:htmlManagedObjectContext:query:)(inited, 0, 0, a3, a4, (uint64_t)v12);
  uint64_t v14 = type metadata accessor for NotesSiriListView();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
  {
    sub_257D8765C((uint64_t)v12, &qword_26A05D4C0);
    uint64_t v16 = 1;
  }
  else
  {
    sub_257D7E97C((uint64_t)v12, a5);
    uint64_t v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a5, v16, 1, v14);
}

id NotesSiriListView.init(noteIdentifiers:modernManagedObjectContext:htmlManagedObjectContext:query:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v31 = a6;
  uint64_t v10 = type metadata accessor for NotesSiriListView();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v13 = MEMORY[0x263F8EE78];
  sub_257D94DD0();
  uint64_t v14 = (uint64_t *)((char *)v13 + *(int *)(v10 + 24));
  uint64_t *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  swift_storeEnumTagMultiPayload();
  if (a2)
  {
    id v15 = a2;
  }
  else
  {
    id v18 = objc_msgSend(self, sel_sharedContext);
    if (!v18
      || (uint64_t v19 = v18,
          id v15 = objc_msgSend(v18, sel_managedObjectContext),
          v19,
          !v15))
    {

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  if (a3)
  {
    id v16 = a2;
    id v17 = a3;
LABEL_10:
    swift_bridgeObjectRetain();
    id v23 = v15;
    id v24 = a3;
    id v25 = v17;
    uint64_t v26 = sub_257D8519C(a1, v25, v30, a5, v23);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *uint64_t v13 = v26;
    uint64_t v27 = v31;
    sub_257D86768((uint64_t)v13, v31, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v27, 0, 1, v10);
    return (id)sub_257D867D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
  }
  double v20 = self;
  id v16 = a2;
  id result = objc_msgSend(v20, sel_sharedContext);
  if (!result)
  {
    __break(1u);
    return result;
  }
  unint64_t v22 = result;
  id v17 = objc_msgSend(result, sel_managedObjectContext);

  if (v17) {
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();

LABEL_12:
  uint64_t v28 = v31;
  swift_bridgeObjectRelease();
  sub_257D867D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v28, 1, 1, v10);
}

uint64_t type metadata accessor for NotesSiriListView()
{
  uint64_t result = qword_26A05D4F0;
  if (!qword_26A05D4F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_257D7E97C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSiriListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NotesSiriListView.init(models:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NotesSiriListView();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v7 = MEMORY[0x263F8EE78];
  sub_257D94DD0();
  uint64_t v8 = (void *)((char *)v7 + *(int *)(v4 + 24));
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRelease();
  void *v7 = a1;
  sub_257D86768((uint64_t)v7, a2, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  return sub_257D867D0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
}

uint64_t NotesSiriListView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4E0);
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    uint64_t v18 = v8;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_257D94FF0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v18;
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    id v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    return v16(a1, 1, 1, v6);
  }
  if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v18 = v8;
  if ((v11 & 0xC000000000000001) != 0)
  {
    uint64_t v12 = MEMORY[0x25A2C2620](0, v11);
    goto LABEL_6;
  }
  if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v12 = *(void *)(v11 + 32);
    swift_retain();
LABEL_6:
    sub_257D7EDC8(v12, (uint64_t)v5);
    swift_release();
    uint64_t v13 = sub_257D94D70();
    sub_257D7F698(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v13, v14, &qword_26A05D4D8, &qword_26A05D4E0);
    sub_257D8765C((uint64_t)v5, &qword_26A05D4D8);
    sub_257D871E4((uint64_t)v10, a1, &qword_26A05D4E0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v6);
  }
  __break(1u);
  return result;
}

uint64_t sub_257D7EDC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v3 = sub_257D94B10();
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  MEMORY[0x270FA5388](v3);
  v69 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_257D949D0();
  uint64_t v67 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  v63 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NotesSiriListView();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v54 = *(void *)(v55 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v53 = (uint64_t)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D868);
  uint64_t v62 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  v56 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D528);
  MEMORY[0x270FA5388](v61);
  v57 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D870);
  uint64_t v66 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v58 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D8);
  MEMORY[0x270FA5388](v65);
  v60 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DAE0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_257D94650();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v52 - v20;
  v52[0] = a1;
  uint64_t v22 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  swift_beginAccess();
  id v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v23(v21, v22, v15);
  uint64_t v24 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
  swift_beginAccess();
  v23(v19, v24, v15);
  uint64_t v25 = v52[1];
  sub_257D842C0((uint64_t)v14);
  uint64_t v26 = sub_257D94680();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v14, 0, 1, v26);
  uint64_t v27 = sub_257D91848((uint64_t)v21, (uint64_t)v19, (uint64_t)v14);
  uint64_t v29 = v28;
  sub_257D8765C((uint64_t)v14, &qword_26A05DAE0);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  v30(v19, v15);
  v30(v21, v15);
  swift_bridgeObjectRelease();
  uint64_t v31 = v52[0];
  uint64_t v75 = v52[0];
  unint64_t v76 = v27;
  uint64_t v77 = v29;
  long long v78 = xmmword_257D957C0;
  long long v79 = xmmword_257D957D0;
  uint64_t v80 = 0x4018000000000000;
  char v81 = 0;
  uint64_t v32 = v25;
  uint64_t v33 = v53;
  sub_257D86768(v32, v53, (uint64_t (*)(void))type metadata accessor for NotesSiriListView);
  unint64_t v34 = (*(unsigned __int8 *)(v55 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v31;
  sub_257D7E97C(v33, v35 + v34);
  uint64_t v36 = v31;
  swift_retain_n();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D538);
  unint64_t v38 = sub_257D86094();
  char v39 = v56;
  sub_257D94C50();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  id v40 = v63;
  sub_257D949B0();
  uint64_t v75 = v37;
  unint64_t v76 = v38;
  swift_getOpaqueTypeConformance2();
  uint64_t v41 = (uint64_t)v57;
  uint64_t v42 = v59;
  sub_257D94C60();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v40, v68);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v42);
  double v43 = v69;
  sub_257D94B00();
  unint64_t v44 = sub_257D85FE4();
  CGRect v45 = v58;
  uint64_t v46 = v61;
  sub_257D94C90();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v43, v71);
  sub_257D8765C(v41, &qword_26A05D528);
  uint64_t v75 = sub_257D7FC44(v36);
  unint64_t v76 = v47;
  uint64_t v73 = v46;
  unint64_t v74 = v44;
  swift_getOpaqueTypeConformance2();
  sub_257D8690C();
  uint64_t v48 = (uint64_t)v60;
  uint64_t v49 = v64;
  sub_257D94C80();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v45, v49);
  uint64_t v75 = sub_257D94750();
  unint64_t v76 = v50;
  sub_257D94840();
  swift_bridgeObjectRelease();
  return sub_257D8765C(v48, &qword_26A05D4D8);
}

__n128 sub_257D7F698@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
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
    sub_257D94EE0();
    uint64_t v28 = (void *)sub_257D94B30();
    sub_257D947A0();

    uint64_t v19 = a17;
  }
  sub_257D94870();
  sub_257D877B0(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_257D7F868@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
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
    sub_257D94EE0();
    uint64_t v24 = (void *)sub_257D94B30();
    sub_257D947A0();

    uint64_t v15 = a9;
  }
  sub_257D94870();
  memcpy((void *)v15, v14, 0x268uLL);
  *(_OWORD *)(v15 + 680) = v31;
  *(_OWORD *)(v15 + 696) = v32;
  *(_OWORD *)(v15 + 712) = v33;
  *(_OWORD *)(v15 + 616) = v27;
  *(_OWORD *)(v15 + 632) = v28;
  *(_OWORD *)(v15 + 648) = v29;
  *(_OWORD *)(v15 + 664) = v30;
  return sub_257D872A0((uint64_t)v14);
}

uint64_t sub_257D7FA2C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_257D94EE0();
    id v23 = (void *)sub_257D94B30();
    sub_257D947A0();
  }
  sub_257D94870();
  memcpy(a9, v13, 0x160uLL);
  a9[26] = v29;
  a9[27] = v30;
  a9[28] = v31;
  a9[22] = v25;
  a9[23] = v26;
  a9[24] = v27;
  a9[25] = v28;
  return sub_257D8740C((uint64_t)v13);
}

double sub_257D7FBE8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_257D7F698(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26A05D858, &qword_26A05D860).n128_u64[0];
  return result;
}

uint64_t sub_257D7FC44(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_257D946C0();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_257D946D0();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString + 8);
  uint64_t v41 = *(void *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet + 8);
  uint64_t v42 = v2;
  uint64_t v43 = v4;
  swift_bridgeObjectRetain();
  if (!v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_257D84780(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v16 = v14[2];
  unint64_t v15 = v14[3];
  if (v16 >= v15 >> 1) {
    uint64_t v14 = sub_257D84780((void *)(v15 > 1), v16 + 1, 1, v14);
  }
  v14[2] = v16 + 1;
  uint64_t v17 = &v14[2 * v16];
  v17[4] = v10;
  v17[5] = v9;
  if (v11)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_257D84780(0, v14[2] + 1, 1, v14);
    }
    unint64_t v19 = v14[2];
    unint64_t v18 = v14[3];
    if (v19 >= v18 >> 1) {
      uint64_t v14 = sub_257D84780((void *)(v18 > 1), v19 + 1, 1, v14);
    }
    v14[2] = v19 + 1;
    uint64_t v20 = &v14[2 * v19];
    v20[4] = v41;
    v20[5] = v11;
  }
LABEL_12:
  if (v12)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_257D84780(0, v14[2] + 1, 1, v14);
    }
    unint64_t v22 = v14[2];
    unint64_t v21 = v14[3];
    if (v22 >= v21 >> 1) {
      uint64_t v14 = sub_257D84780((void *)(v21 > 1), v22 + 1, 1, v14);
    }
    v14[2] = v22 + 1;
    id v23 = &v14[2 * v22];
    v23[4] = v13;
    v23[5] = v12;
  }
  if (v43)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_257D84780(0, v14[2] + 1, 1, v14);
    }
    unint64_t v25 = v14[2];
    unint64_t v24 = v14[3];
    if (v25 >= v24 >> 1) {
      uint64_t v14 = sub_257D84780((void *)(v24 > 1), v25 + 1, 1, v14);
    }
    v14[2] = v25 + 1;
    long long v26 = &v14[2 * v25];
    v26[4] = v42;
    v26[5] = v43;
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_257D84780(0, v14[2] + 1, 1, v14);
    }
    unint64_t v28 = v14[2];
    unint64_t v27 = v14[3];
    if (v28 >= v27 >> 1) {
      uint64_t v14 = sub_257D84780((void *)(v27 > 1), v28 + 1, 1, v14);
    }
    v14[2] = v28 + 1;
    long long v29 = &v14[2 * v28];
    v29[4] = v5;
    v29[5] = v7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D878);
  swift_arrayDestroy();
  uint64_t v30 = v14[2];
  if (v30)
  {
    long long v31 = v14 + 5;
    uint64_t v32 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v37 = *(v31 - 1);
      uint64_t v36 = *v31;
      uint64_t v38 = HIBYTE(*v31) & 0xF;
      if ((*v31 & 0x2000000000000000) == 0) {
        uint64_t v38 = v37 & 0xFFFFFFFFFFFFLL;
      }
      if (v38)
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_257D84EE8(0, *(void *)(v32 + 16) + 1, 1);
        }
        unint64_t v34 = *(void *)(v32 + 16);
        unint64_t v33 = *(void *)(v32 + 24);
        if (v34 >= v33 >> 1) {
          sub_257D84EE8(v33 > 1, v34 + 1, 1);
        }
        *(void *)(v32 + 16) = v34 + 1;
        uint64_t v35 = v32 + 16 * v34;
        *(void *)(v35 + 32) = v37;
        *(void *)(v35 + 40) = v36;
      }
      v31 += 2;
      --v30;
    }
    while (v30);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D880);
  sub_257D87A20(&qword_26A05D888, &qword_26A05D880);
  uint64_t v39 = sub_257D94E10();
  swift_release();
  return v39;
}

uint64_t sub_257D8012C(uint64_t a1)
{
  uint64_t v2 = sub_257D94E00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257D94610();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  uint64_t v11 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  uint64_t v12 = (void *)sub_257D945E0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  objc_msgSend(v10, sel_setPunchOutUri_, v12);

  type metadata accessor for NotesSiriListView();
  sub_257D94DC0();
  id v13 = v10;
  sub_257D94DF0();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_257D80358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)&v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_257D94D10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = sub_257D94CF0();
  id v10 = objc_msgSend(self, sel_ICTintColor);
  uint64_t v20 = MEMORY[0x25A2C2320](v10);
  uint64_t KeyPath = swift_getKeyPath();
  int v19 = sub_257D94AF0();
  uint64_t v12 = sub_257D94B60();
  uint64_t v13 = swift_getKeyPath();
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B538], v6);
  uint64_t v14 = swift_getKeyPath();
  (*(void (**)(char *, unsigned char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *uint64_t v5 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7A0);
  sub_257D877B0((uint64_t)v5, a1 + *(int *)(v15 + 36), &qword_26A05D6C0);
  uint64_t v16 = v20;
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = KeyPath;
  *(void *)(a1 + 16) = v16;
  *(_DWORD *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v12;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_257D8765C((uint64_t)v5, &qword_26A05D6C0);
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_257D805F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D588);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v20[-v8];
  sub_257D94D60();
  sub_257D94810();
  uint64_t v27 = v28;
  int v26 = v29;
  uint64_t v25 = v30;
  int v24 = v31;
  uint64_t v22 = v33;
  uint64_t v23 = v32;
  *(void *)uint64_t v9 = sub_257D94930();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D590);
  sub_257D8081C(a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  sub_257D94D60();
  sub_257D94810();
  uint64_t v11 = v34;
  int v21 = v35;
  uint64_t v12 = v36;
  char v13 = v37;
  uint64_t v14 = v38;
  uint64_t v15 = v39;
  sub_257D877B0((uint64_t)v9, (uint64_t)v7, &qword_26A05D588);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v27;
  *(unsigned char *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v25;
  *(unsigned char *)(a2 + 40) = v24;
  uint64_t v16 = v22;
  *(void *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D598);
  sub_257D877B0((uint64_t)v7, a2 + *(int *)(v17 + 48), &qword_26A05D588);
  uint64_t v18 = a2 + *(int *)(v17 + 64);
  *(void *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 8) = 1;
  *(void *)(v18 + 16) = v11;
  *(unsigned char *)(v18 + 24) = v21;
  *(void *)(v18 + 32) = v12;
  *(unsigned char *)(v18 + 40) = v13;
  *(void *)(v18 + 48) = v14;
  *(void *)(v18 + 56) = v15;
  sub_257D8765C((uint64_t)v9, &qword_26A05D588);
  return sub_257D8765C((uint64_t)v7, &qword_26A05D588);
}

uint64_t sub_257D8081C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5A0);
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v59 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5A8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (uint64_t)&v48 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v58 = (uint64_t)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v57 = (uint64_t)&v48 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5B0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v48 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5B8);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  int v26 = (char *)&v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v48 - v27;
  *(void *)uint64_t v28 = sub_257D94A00();
  *((void *)v28 + 1) = 0x4010000000000000;
  v28[16] = 0;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5C0);
  sub_257D80F3C((uint64_t *)a1, (uint64_t)&v28[*(int *)(v29 + 44)]);
  uint64_t v30 = *(void *)a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  sub_257D877B0(v30, (uint64_t)v16, &qword_26A05D428);
  uint64_t v31 = sub_257D94610();
  int v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v16, 1, v31);
  sub_257D8765C((uint64_t)v16, &qword_26A05D428);
  if (v32 == 1)
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5C8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v22, 1, 1, v33);
  }
  else
  {
    uint64_t v56 = sub_257D94CE0();
    sub_257D94D60();
    sub_257D94810();
    uint64_t v55 = v64;
    int v54 = v65;
    uint64_t v53 = v66;
    int v52 = v67;
    uint64_t v51 = v68;
    uint64_t v50 = v69;
    *(void *)uint64_t v8 = sub_257D949F0();
    *((void *)v8 + 1) = 0;
    v8[16] = 1;
    uint64_t v49 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5D8) + 44)];
    uint64_t v34 = v57;
    sub_257D877B0(v30, v57, &qword_26A05D428);
    unsigned __int8 v35 = (_OWORD *)swift_allocObject();
    long long v36 = *(_OWORD *)(a1 + 16);
    v35[1] = *(_OWORD *)a1;
    v35[2] = v36;
    long long v37 = *(_OWORD *)(a1 + 48);
    v35[3] = *(_OWORD *)(a1 + 32);
    v35[4] = v37;
    sub_257D877B0(v34, v58, &qword_26A05D428);
    uint64_t v38 = (void *)swift_allocObject();
    v38[2] = sub_257D8647C;
    v38[3] = v35;
    v38[4] = sub_257D84024;
    v38[5] = 0;
    sub_257D864D0(a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5E0);
    sub_257D86CEC(&qword_26A05D5E8, &qword_26A05D5E0, (void (*)(void))sub_257D86508, (void (*)(void))sub_257D866F4);
    uint64_t v39 = v59;
    sub_257D947E0();
    sub_257D8765C(v34, &qword_26A05D428);
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v49, v39, v61);
    uint64_t v40 = v62;
    sub_257D871E4((uint64_t)v8, v62, &qword_26A05D5A8);
    sub_257D877B0(v40, (uint64_t)v8, &qword_26A05D5A8);
    *(void *)uint64_t v20 = 0;
    v20[8] = 1;
    uint64_t v41 = v55;
    *((void *)v20 + 2) = v56;
    *((void *)v20 + 3) = v41;
    v20[32] = v54;
    *((void *)v20 + 5) = v53;
    v20[48] = v52;
    uint64_t v42 = v50;
    *((void *)v20 + 7) = v51;
    *((void *)v20 + 8) = v42;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D650);
    sub_257D877B0((uint64_t)v8, (uint64_t)&v20[*(int *)(v43 + 64)], &qword_26A05D5A8);
    swift_retain();
    sub_257D8765C(v40, &qword_26A05D5A8);
    sub_257D8765C((uint64_t)v8, &qword_26A05D5A8);
    swift_release();
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5C8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v20, 0, 1, v44);
    sub_257D871E4((uint64_t)v20, (uint64_t)v22, &qword_26A05D5B0);
  }
  sub_257D877B0((uint64_t)v28, (uint64_t)v26, &qword_26A05D5B8);
  sub_257D877B0((uint64_t)v22, (uint64_t)v20, &qword_26A05D5B0);
  uint64_t v45 = v63;
  sub_257D877B0((uint64_t)v26, v63, &qword_26A05D5B8);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5D0);
  sub_257D877B0((uint64_t)v20, v45 + *(int *)(v46 + 48), &qword_26A05D5B0);
  sub_257D8765C((uint64_t)v22, &qword_26A05D5B0);
  sub_257D8765C((uint64_t)v28, &qword_26A05D5B8);
  sub_257D8765C((uint64_t)v20, &qword_26A05D5B0);
  return sub_257D8765C((uint64_t)v26, &qword_26A05D5B8);
}

uint64_t sub_257D80F3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D688);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D690);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D698);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v27 - v20;
  *(void *)uint64_t v21 = sub_257D94930();
  *((void *)v21 + 1) = 0;
  v21[16] = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6A0);
  sub_257D8121C(a1, (uint64_t)&v21[*(int *)(v22 + 44)]);
  *(void *)uint64_t v15 = sub_257D94930();
  *((void *)v15 + 1) = 0;
  v15[16] = 0;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6A8);
  sub_257D8259C(a1, (uint64_t)&v15[*(int *)(v23 + 44)]);
  *(void *)uint64_t v9 = sub_257D94930();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6B0);
  sub_257D82F60((uint64_t)a1, (uint64_t)&v9[*(int *)(v24 + 44)]);
  sub_257D877B0((uint64_t)v21, (uint64_t)v19, &qword_26A05D698);
  sub_257D877B0((uint64_t)v15, (uint64_t)v13, &qword_26A05D690);
  sub_257D877B0((uint64_t)v9, (uint64_t)v7, &qword_26A05D688);
  sub_257D877B0((uint64_t)v19, a2, &qword_26A05D698);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6B8);
  sub_257D877B0((uint64_t)v13, a2 + *(int *)(v25 + 48), &qword_26A05D690);
  sub_257D877B0((uint64_t)v7, a2 + *(int *)(v25 + 64), &qword_26A05D688);
  sub_257D8765C((uint64_t)v9, &qword_26A05D688);
  sub_257D8765C((uint64_t)v15, &qword_26A05D690);
  sub_257D8765C((uint64_t)v21, &qword_26A05D698);
  sub_257D8765C((uint64_t)v7, &qword_26A05D688);
  sub_257D8765C((uint64_t)v13, &qword_26A05D690);
  return sub_257D8765C((uint64_t)v19, &qword_26A05D698);
}

uint64_t sub_257D8121C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D778);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v26[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D780);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v26[-v11];
  *(void *)uint64_t v5 = sub_257D94930();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D788);
  sub_257D814AC(a1, (uint64_t)&v5[*(int *)(v13 + 44)]);
  sub_257D94D60();
  sub_257D94810();
  sub_257D877B0((uint64_t)v5, (uint64_t)v10, &qword_26A05D778);
  uint64_t v14 = &v10[*(int *)(v7 + 44)];
  long long v15 = v37;
  _OWORD *v14 = v36;
  v14[1] = v15;
  v14[2] = v38;
  sub_257D8765C((uint64_t)v5, &qword_26A05D778);
  uint64_t v28 = v12;
  sub_257D871E4((uint64_t)v10, (uint64_t)v12, &qword_26A05D780);
  sub_257D82228((uint64_t)v30);
  uint64_t v16 = v30[0];
  uint64_t v17 = v30[1];
  char v18 = v31;
  uint64_t v19 = v32;
  uint64_t v20 = v33;
  uint64_t v21 = v34;
  int v27 = v35;
  uint64_t v22 = sub_257D949E0();
  sub_257D877B0((uint64_t)v12, (uint64_t)v10, &qword_26A05D780);
  uint64_t v23 = v29;
  sub_257D877B0((uint64_t)v10, v29, &qword_26A05D780);
  uint64_t v24 = v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D790) + 48);
  *(void *)uint64_t v24 = v16;
  *(void *)(v24 + 8) = v17;
  *(unsigned char *)(v24 + 16) = v18;
  *(void *)(v24 + 24) = v19;
  *(void *)(v24 + 32) = v20;
  *(void *)(v24 + 40) = v21;
  *(unsigned char *)(v24 + 48) = v27;
  *(void *)(v24 + 56) = v22;
  *(void *)(v24 + 64) = sub_257D82574;
  *(void *)(v24 + 72) = 0;
  sub_257D868EC(v16, v17, v18);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257D8765C((uint64_t)v28, &qword_26A05D780);
  sub_257D868FC(v16, v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_257D8765C((uint64_t)v10, &qword_26A05D780);
}

uint64_t sub_257D814AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v97 = a2;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D710);
  MEMORY[0x270FA5388](v86);
  v85 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D718);
  uint64_t v4 = MEMORY[0x270FA5388](v78);
  uint64_t v76 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v77 = (uint64_t)&v75 - v6;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D798);
  MEMORY[0x270FA5388](v79);
  char v81 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7A0);
  MEMORY[0x270FA5388](v80);
  uint64_t v84 = (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7A8);
  MEMORY[0x270FA5388](v91);
  v82 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7B0);
  MEMORY[0x270FA5388](v94);
  v96 = (char **)((char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7B8);
  MEMORY[0x270FA5388](v90);
  uint64_t v93 = (uint64_t)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7C0);
  MEMORY[0x270FA5388](v95);
  v92 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7C8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v75 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v75 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v75 - v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7D0);
  MEMORY[0x270FA5388](v25);
  int v27 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C0);
  MEMORY[0x270FA5388](v87);
  uint64_t v29 = (uint64_t *)((char *)&v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v89 = sub_257D94D10();
  uint64_t v30 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v88 = (char *)&v75 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D7D8);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  unsigned __int8 v35 = (char *)&v75 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *a1;
  if (*(unsigned char *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) == 1)
  {
    char v81 = v24;
    v82 = v19;
    uint64_t v84 = v25;
    v85 = v27;
    uint64_t v86 = v13;
    BOOL v37 = *(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) == 1;
    uint64_t v83 = v33;
    uint64_t v75 = v35;
    if (v37)
    {
      uint64_t v38 = sub_257D94CF0();
      LODWORD(v82) = sub_257D94AF0();
      uint64_t v39 = sub_257D94B60();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v41 = v88;
      uint64_t v42 = v89;
      (*(void (**)(char *, void, uint64_t))(v30 + 104))(v88, *MEMORY[0x263F1B538], v89);
      uint64_t v43 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))((char *)v29 + *(int *)(v87 + 28), v41, v42);
      uint64_t *v29 = v43;
      sub_257D877B0((uint64_t)v29, (uint64_t)&v22[*(int *)(v86 + 36)], &qword_26A05D6C0);
      *(void *)uint64_t v22 = v38;
      *((_DWORD *)v22 + 2) = v82;
      *((void *)v22 + 2) = KeyPath;
      *((void *)v22 + 3) = v39;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_257D8765C((uint64_t)v29, &qword_26A05D6C0);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v41, v42);
      swift_release();
      swift_release();
      swift_release();
      uint64_t v56 = (uint64_t)v81;
      sub_257D871E4((uint64_t)v22, (uint64_t)v81, &qword_26A05D7C8);
    }
    else
    {
      uint64_t v49 = sub_257D94CF0();
      LODWORD(v81) = sub_257D94AF0();
      uint64_t v50 = sub_257D94B60();
      uint64_t v51 = swift_getKeyPath();
      int v52 = v88;
      uint64_t v53 = v89;
      (*(void (**)(char *, void, uint64_t))(v30 + 104))(v88, *MEMORY[0x263F1B538], v89);
      uint64_t v54 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))((char *)v29 + *(int *)(v87 + 28), v52, v53);
      uint64_t *v29 = v54;
      sub_257D877B0((uint64_t)v29, (uint64_t)&v16[*(int *)(v86 + 36)], &qword_26A05D6C0);
      *(void *)uint64_t v16 = v49;
      *((_DWORD *)v16 + 2) = v81;
      *((void *)v16 + 2) = v51;
      *((void *)v16 + 3) = v50;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_257D8765C((uint64_t)v29, &qword_26A05D6C0);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v52, v53);
      swift_release();
      swift_release();
      swift_release();
      uint64_t v55 = (uint64_t)v16;
      uint64_t v56 = (uint64_t)v82;
      sub_257D871E4(v55, (uint64_t)v82, &qword_26A05D7C8);
    }
    sub_257D877B0(v56, (uint64_t)v85, &qword_26A05D7C8);
    swift_storeEnumTagMultiPayload();
    sub_257D86DE8();
    uint64_t v57 = (uint64_t)v75;
    sub_257D94AC0();
    uint64_t v58 = v96;
    uint64_t v59 = (uint64_t)v92;
    sub_257D8765C(v56, &qword_26A05D7C8);
    uint64_t v60 = &qword_26A05D7D8;
    sub_257D877B0(v57, v93, &qword_26A05D7D8);
    swift_storeEnumTagMultiPayload();
    sub_257D86D74();
    sub_257D86F28();
    sub_257D94AC0();
    sub_257D877B0(v59, (uint64_t)v58, &qword_26A05D7C0);
    swift_storeEnumTagMultiPayload();
    sub_257D86CEC(&qword_26A05D7E0, &qword_26A05D7C0, (void (*)(void))sub_257D86D74, (void (*)(void))sub_257D86F28);
    sub_257D94AC0();
    sub_257D8765C(v59, &qword_26A05D7C0);
    uint64_t v61 = v57;
  }
  else
  {
    uint64_t v44 = v84;
    uint64_t v45 = (uint64_t)v85;
    uint64_t v46 = v86;
    if (*(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) != 1)
    {
      uint64_t v62 = v96;
      void *v96 = 0;
      *((unsigned char *)v62 + 8) = 1;
      swift_storeEnumTagMultiPayload();
      sub_257D86CEC(&qword_26A05D7E0, &qword_26A05D7C0, (void (*)(void))sub_257D86D74, (void (*)(void))sub_257D86F28);
      return sub_257D94AC0();
    }
    uint64_t v83 = v33;
    if (*(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) == 1)
    {
      sub_257D80358(v84);
      unint64_t v47 = &qword_26A05D7A0;
      sub_257D877B0(v44, (uint64_t)v81, &qword_26A05D7A0);
    }
    else
    {
      uint64_t v64 = sub_257D94CF0();
      int v65 = sub_257D94AF0();
      unsigned __int8 v67 = v88;
      uint64_t v66 = v89;
      (*(void (**)(char *, void, uint64_t))(v30 + 104))(v88, *MEMORY[0x263F1B538], v89);
      uint64_t v68 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))((char *)v29 + *(int *)(v87 + 28), v67, v66);
      uint64_t *v29 = v68;
      sub_257D877B0((uint64_t)v29, v45 + *(int *)(v46 + 36), &qword_26A05D6C0);
      *(void *)uint64_t v45 = v64;
      *(_DWORD *)(v45 + 8) = v65;
      swift_retain();
      sub_257D8765C((uint64_t)v29, &qword_26A05D6C0);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v67, v66);
      swift_release();
      uint64_t v69 = sub_257D94B60();
      uint64_t v70 = swift_getKeyPath();
      uint64_t v71 = v76;
      sub_257D877B0(v45, v76, &qword_26A05D710);
      uint64_t v72 = (uint64_t *)(v71 + *(int *)(v78 + 36));
      *uint64_t v72 = v70;
      v72[1] = v69;
      sub_257D8765C(v45, &qword_26A05D710);
      unint64_t v47 = &qword_26A05D718;
      uint64_t v73 = v71;
      uint64_t v44 = v77;
      sub_257D871E4(v73, v77, &qword_26A05D718);
      sub_257D877B0(v44, (uint64_t)v81, &qword_26A05D718);
    }
    swift_storeEnumTagMultiPayload();
    sub_257D86F64();
    sub_257D86A6C();
    uint64_t v48 = (uint64_t)v82;
    sub_257D94AC0();
    sub_257D8765C(v44, v47);
    uint64_t v60 = &qword_26A05D7A8;
    sub_257D877B0(v48, v93, &qword_26A05D7A8);
    swift_storeEnumTagMultiPayload();
    sub_257D86D74();
    sub_257D86F28();
    uint64_t v74 = (uint64_t)v92;
    sub_257D94AC0();
    sub_257D877B0(v74, (uint64_t)v96, &qword_26A05D7C0);
    swift_storeEnumTagMultiPayload();
    sub_257D86CEC(&qword_26A05D7E0, &qword_26A05D7C0, (void (*)(void))sub_257D86D74, (void (*)(void))sub_257D86F28);
    sub_257D94AC0();
    sub_257D8765C(v74, &qword_26A05D7C0);
    uint64_t v61 = v48;
  }
  return sub_257D8765C(v61, v60);
}

uint64_t sub_257D82228@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A05DAB0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v42[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_257D94570();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v42[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v42[-v11];
  uint64_t v13 = *v1;
  uint64_t v14 = *v1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  swift_beginAccess();
  sub_257D877B0(v14, (uint64_t)v5, (uint64_t *)&unk_26A05DAB0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_257D8765C((uint64_t)v5, (uint64_t *)&unk_26A05DAB0);
    uint64_t v15 = (uint64_t *)(v13 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
    swift_beginAccess();
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v46 = v16;
    uint64_t v47 = v17;
    sub_257D8690C();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_257D94BF0();
    uint64_t v20 = v19;
    char v22 = v21 & 1;
    sub_257D94B90();
    uint64_t v23 = sub_257D94BC0();
    uint64_t v25 = v24;
    char v27 = v26;
    uint64_t v29 = v28;
    swift_release();
    sub_257D868FC(v18, v20, v22);
    swift_bridgeObjectRelease();
    uint64_t result = swift_getKeyPath();
    uint64_t KeyPath = result;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v12, v5, v6);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
    uint64_t v32 = sub_257D94BE0();
    uint64_t v34 = v33;
    char v36 = v35 & 1;
    sub_257D94B90();
    uint64_t v37 = sub_257D94BC0();
    uint64_t v44 = v38;
    uint64_t v45 = v37;
    int v43 = v39;
    uint64_t v29 = v40;
    swift_release();
    sub_257D868FC(v32, v34, v36);
    char v27 = v43;
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v41 = v6;
    uint64_t v25 = v44;
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v41);
    uint64_t v23 = v45;
  }
  *(void *)a1 = v23;
  *(void *)(a1 + 8) = v25;
  *(unsigned char *)(a1 + 16) = v27 & 1;
  *(void *)(a1 + 24) = v29;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_257D82574()
{
  uint64_t v0 = sub_257D94A00();
  return MEMORY[0x25A2C1E80](v0);
}

uint64_t sub_257D8259C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6F0);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - v11;
  *(void *)uint64_t v5 = sub_257D94930();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6F8);
  sub_257D828B4(a1, (uint64_t)&v5[*(int *)(v13 + 44)]);
  sub_257D94D60();
  sub_257D94810();
  sub_257D877B0((uint64_t)v5, (uint64_t)v10, &qword_26A05D6E8);
  uint64_t v14 = &v10[*(int *)(v7 + 44)];
  long long v15 = v47;
  *(_OWORD *)uint64_t v14 = v46;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v48;
  sub_257D8765C((uint64_t)v5, &qword_26A05D6E8);
  uint64_t v16 = (uint64_t)v12;
  char v35 = v12;
  sub_257D871E4((uint64_t)v10, (uint64_t)v12, &qword_26A05D6F0);
  uint64_t v34 = sub_257D94920();
  sub_257D83404(a1, (uint64_t)v38);
  uint64_t v17 = v38[0];
  uint64_t v18 = v38[1];
  int v31 = v39;
  uint64_t v19 = v40;
  uint64_t v20 = v43;
  uint64_t v32 = v42;
  uint64_t v33 = v41;
  uint64_t v21 = v44;
  unsigned __int8 v22 = v45;
  int v30 = sub_257D94AF0();
  uint64_t KeyPath = swift_getKeyPath();
  char v36 = v10;
  sub_257D877B0(v16, (uint64_t)v10, &qword_26A05D6F0);
  uint64_t v24 = v37;
  sub_257D877B0((uint64_t)v10, v37, &qword_26A05D6F0);
  uint64_t v25 = v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D700) + 48);
  uint64_t v26 = v33;
  *(void *)uint64_t v25 = v34;
  *(void *)(v25 + 8) = 0;
  *(unsigned char *)(v25 + 16) = 1;
  *(void *)(v25 + 24) = v17;
  *(void *)(v25 + 32) = v18;
  LOBYTE(v10) = v31;
  *(unsigned char *)(v25 + 40) = v31;
  *(void *)(v25 + 48) = v19;
  *(void *)(v25 + 56) = v26;
  uint64_t v27 = v32;
  *(void *)(v25 + 64) = v32;
  *(void *)(v25 + 72) = v20;
  *(void *)(v25 + 80) = v21;
  *(unsigned char *)(v25 + 88) = v22;
  *(_DWORD *)(v25 + 92) = v30;
  *(void *)(v25 + 96) = KeyPath;
  *(void *)(v25 + 104) = 1;
  *(unsigned char *)(v25 + 112) = 0;
  sub_257D868EC(v17, v18, (char)v10);
  swift_bridgeObjectRetain();
  sub_257D869C4(v26, v27, v20, v21, v22);
  swift_retain();
  sub_257D8765C((uint64_t)v35, &qword_26A05D6F0);
  sub_257D868FC(v17, v18, (char)v10);
  swift_bridgeObjectRelease();
  sub_257D86A18(v26, v27, v20, v21, v22);
  swift_release();
  return sub_257D8765C((uint64_t)v36, &qword_26A05D6F0);
}

uint64_t sub_257D828B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C8);
  MEMORY[0x270FA5388](v37);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6D0);
  uint64_t v5 = MEMORY[0x270FA5388](v43);
  uint64_t v38 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v39 = (uint64_t)&v37 - v7;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D708);
  MEMORY[0x270FA5388](v41);
  uint64_t v42 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_257D94D10();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D710);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D718);
  uint64_t v19 = MEMORY[0x270FA5388](v40);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  if (*(unsigned char *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) == 1
    && *(unsigned char *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) == 1)
  {
    uint64_t v39 = (uint64_t)&v37 - v22;
    uint64_t v23 = sub_257D94CF0();
    LODWORD(v38) = sub_257D94AF0();
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F1B538], v12);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v11 + *(int *)(v9 + 28), v15, v12);
    *uint64_t v11 = KeyPath;
    sub_257D877B0((uint64_t)v11, (uint64_t)&v18[*(int *)(v16 + 36)], &qword_26A05D6C0);
    *(void *)uint64_t v18 = v23;
    *((_DWORD *)v18 + 2) = v38;
    swift_retain();
    sub_257D8765C((uint64_t)v11, &qword_26A05D6C0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_release();
    uint64_t v25 = sub_257D94B60();
    uint64_t v26 = swift_getKeyPath();
    sub_257D877B0((uint64_t)v18, (uint64_t)v21, &qword_26A05D710);
    uint64_t v27 = (uint64_t *)&v21[*(int *)(v40 + 36)];
    uint64_t *v27 = v26;
    v27[1] = v25;
    sub_257D8765C((uint64_t)v18, &qword_26A05D710);
    uint64_t v28 = &qword_26A05D718;
    uint64_t v29 = v39;
    sub_257D871E4((uint64_t)v21, v39, &qword_26A05D718);
    sub_257D877B0(v29, v42, &qword_26A05D718);
    swift_storeEnumTagMultiPayload();
    sub_257D86A6C();
    sub_257D87904(&qword_26A05D768, &qword_26A05D6D0, (void (*)(void))sub_257D86C4C);
    sub_257D94AC0();
    uint64_t v30 = v29;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F1B538], v12);
    uint64_t v31 = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v11 + *(int *)(v9 + 28), v15, v12);
    *uint64_t v11 = v31;
    sub_257D877B0((uint64_t)v11, (uint64_t)&v4[*(int *)(v37 + 36)], &qword_26A05D6C0);
    *(void *)uint64_t v4 = 0;
    v4[8] = 1;
    sub_257D8765C((uint64_t)v11, &qword_26A05D6C0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    sub_257D94D60();
    sub_257D94810();
    uint64_t v32 = v38;
    sub_257D877B0((uint64_t)v4, v38, &qword_26A05D6C8);
    uint64_t v33 = (_OWORD *)(v32 + *(int *)(v43 + 36));
    long long v34 = v46;
    _OWORD *v33 = v45;
    v33[1] = v34;
    v33[2] = v47;
    sub_257D8765C((uint64_t)v4, &qword_26A05D6C8);
    uint64_t v28 = &qword_26A05D6D0;
    uint64_t v35 = v39;
    sub_257D871E4(v32, v39, &qword_26A05D6D0);
    sub_257D877B0(v35, v42, &qword_26A05D6D0);
    swift_storeEnumTagMultiPayload();
    sub_257D86A6C();
    sub_257D87904(&qword_26A05D768, &qword_26A05D6D0, (void (*)(void))sub_257D86C4C);
    sub_257D94AC0();
    uint64_t v30 = v35;
  }
  return sub_257D8765C(v30, v28);
}

uint64_t sub_257D82F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)&v35[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_257D94D10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v35[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6C8);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6D0);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = &v35[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v43 = &v35[-v19];
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B538], v6);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, unsigned char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *uint64_t v5 = KeyPath;
  sub_257D877B0((uint64_t)v5, (uint64_t)&v13[*(int *)(v11 + 44)], &qword_26A05D6C0);
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  sub_257D8765C((uint64_t)v5, &qword_26A05D6C0);
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  sub_257D94D60();
  sub_257D94810();
  uint64_t v21 = (uint64_t)v18;
  sub_257D877B0((uint64_t)v13, (uint64_t)v18, &qword_26A05D6C8);
  uint64_t v22 = &v18[*(int *)(v15 + 44)];
  long long v23 = v52;
  _OWORD *v22 = v51;
  v22[1] = v23;
  v22[2] = v53;
  sub_257D8765C((uint64_t)v13, &qword_26A05D6C8);
  uint64_t v24 = v43;
  sub_257D871E4((uint64_t)v18, (uint64_t)v43, &qword_26A05D6D0);
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_257D94920();
  sub_257D838E8((uint64_t)v44);
  uint64_t v25 = v44[0];
  uint64_t v26 = v44[1];
  LOBYTE(v18) = v45;
  uint64_t v27 = v46;
  uint64_t v37 = v48;
  uint64_t v38 = v47;
  LOBYTE(v13) = v49;
  uint64_t v41 = v50;
  uint64_t v28 = sub_257D94B60();
  uint64_t v29 = swift_getKeyPath();
  int v36 = sub_257D94AF0();
  swift_bridgeObjectRelease();
  uint64_t v40 = v21;
  sub_257D877B0((uint64_t)v24, v21, &qword_26A05D6D0);
  uint64_t v30 = v42;
  sub_257D877B0(v21, v42, &qword_26A05D6D0);
  uint64_t v31 = v30 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D6D8) + 48);
  uint64_t v32 = v38;
  *(void *)uint64_t v31 = v39;
  *(void *)(v31 + 8) = 0;
  *(unsigned char *)(v31 + 16) = 1;
  *(void *)(v31 + 24) = v25;
  *(void *)(v31 + 32) = v26;
  *(unsigned char *)(v31 + 40) = (_BYTE)v18;
  *(void *)(v31 + 48) = v27;
  *(void *)(v31 + 56) = v32;
  uint64_t v33 = v37;
  *(void *)(v31 + 64) = v37;
  *(unsigned char *)(v31 + 72) = (_BYTE)v13;
  *(void *)(v31 + 80) = v41;
  *(void *)(v31 + 88) = v29;
  *(void *)(v31 + 96) = v28;
  *(_DWORD *)(v31 + 104) = v36;
  sub_257D868EC(v25, v26, (char)v18);
  swift_bridgeObjectRetain();
  sub_257D868EC(v32, v33, (char)v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_257D8765C((uint64_t)v43, &qword_26A05D6D0);
  sub_257D868FC(v25, v26, (char)v18);
  swift_bridgeObjectRelease();
  sub_257D868FC(v32, v33, (char)v13);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_257D8765C(v40, &qword_26A05D6D0);
}

uint64_t sub_257D83404@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A05DAB0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_257D94570();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unsigned __int8 v67 = (char *)&v63 - v11;
  uint64_t v12 = a1[2];
  uint64_t v77 = a1[1];
  uint64_t v78 = v12;
  unint64_t v13 = sub_257D8690C();
  swift_bridgeObjectRetain();
  unint64_t v65 = v13;
  uint64_t v14 = sub_257D94BF0();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_257D94B60();
  uint64_t v19 = sub_257D94BC0();
  uint64_t v69 = v20;
  uint64_t v70 = v19;
  int v68 = v21;
  uint64_t v71 = v22;
  swift_release();
  sub_257D868FC(v14, v16, v18);
  swift_bridgeObjectRelease();
  uint64_t v23 = *a1;
  uint64_t v24 = *a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
  swift_beginAccess();
  sub_257D877B0(v24, (uint64_t)v6, (uint64_t *)&unk_26A05DAB0);
  uint64_t v25 = v7;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_257D8765C((uint64_t)v6, (uint64_t *)&unk_26A05DAB0);
    uint64_t v26 = *(void *)(v23 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet + 8);
    if (v26)
    {
      uint64_t v77 = *(void *)(v23 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
      uint64_t v78 = v26;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_257D94BF0();
      uint64_t v29 = v28;
      char v31 = v30 & 1;
      sub_257D94B60();
      uint64_t v32 = sub_257D94BC0();
      uint64_t v34 = v33;
      char v36 = v35;
      uint64_t v38 = v37;
      swift_release();
      sub_257D868FC(v27, v29, v31);
      swift_bridgeObjectRelease();
      uint64_t v72 = v32;
      uint64_t v73 = v34;
      uint64_t v74 = v36 & 1;
      uint64_t v75 = v38;
      char v76 = 1;
      sub_257D94AC0();
      uint64_t v39 = v77;
      uint64_t v40 = v78;
      uint64_t v41 = v79;
      uint64_t v42 = v80;
      unsigned __int8 v43 = v81;
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      unsigned __int8 v43 = -1;
    }
  }
  else
  {
    uint64_t v44 = v8;
    char v45 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v46 = v67;
    uint64_t v64 = v25;
    v45(v67, v6, v25);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v66, v46, v25);
    uint64_t v47 = sub_257D94BE0();
    uint64_t v49 = v48;
    char v51 = v50 & 1;
    sub_257D94B60();
    uint64_t v52 = sub_257D94BC0();
    uint64_t v54 = v53;
    char v56 = v55;
    uint64_t v66 = v57;
    swift_release();
    sub_257D868FC(v47, v49, v51);
    swift_bridgeObjectRelease();
    uint64_t v72 = v52;
    uint64_t v73 = v54;
    uint64_t v74 = v56 & 1;
    uint64_t v75 = v66;
    char v76 = 0;
    sub_257D94AC0();
    uint64_t v39 = v77;
    uint64_t v40 = v78;
    uint64_t v41 = v79;
    uint64_t v42 = v80;
    unsigned __int8 v43 = v81;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v67, v64);
  }
  char v58 = v68;
  char v59 = v68 & 1;
  uint64_t v61 = v69;
  uint64_t v60 = v70;
  *(void *)a2 = v70;
  *(void *)(a2 + 8) = v61;
  *(unsigned char *)(a2 + 16) = v58 & 1;
  *(void *)(a2 + 24) = v71;
  *(void *)(a2 + 32) = v39;
  *(void *)(a2 + 40) = v40;
  *(void *)(a2 + 48) = v41;
  *(void *)(a2 + 56) = v42;
  *(unsigned char *)(a2 + 64) = v43;
  sub_257D868EC(v60, v61, v58 & 1);
  swift_bridgeObjectRetain();
  sub_257D869C4(v39, v40, v41, v42, v43);
  sub_257D86A18(v39, v40, v41, v42, v43);
  sub_257D868FC(v60, v61, v59);
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D838E8@<X0>(uint64_t a1@<X8>)
{
  sub_257D94CF0();
  uint64_t v2 = sub_257D94C00();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_257D946F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_257D8690C();
  uint64_t v9 = sub_257D94BF0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v12 & 1;
  *(void *)(a1 + 56) = v14;
  sub_257D868EC(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_257D868EC(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_257D868FC(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_257D868FC(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D83A6C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v56 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D660);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v55 = (uint64_t)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_257D94860() - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257D94D00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D668);
  uint64_t v10 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  char v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D618);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D608);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  char v51 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B4B8], v6);
  uint64_t v20 = sub_257D94D20();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)&long long v57 = v20;
  sub_257D94C10();
  swift_release();
  uint64_t v21 = v53;
  sub_257D94D60();
  sub_257D94810();
  uint64_t v22 = v52;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v12, v52);
  uint64_t v23 = &v16[*(int *)(v14 + 44)];
  long long v24 = v58;
  *(_OWORD *)uint64_t v23 = v57;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v59;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  uint64_t v25 = *(void *)(v21 + 56);
  uint64_t v26 = v54;
  uint64_t v27 = &v5[*(int *)(v54 + 28)];
  uint64_t v28 = *MEMORY[0x263F19860];
  uint64_t v29 = sub_257D94990();
  char v30 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104);
  v30(v27, v28, v29);
  *(void *)uint64_t v5 = v25;
  *((void *)v5 + 1) = v25;
  uint64_t v31 = *(int *)(v18 + 44);
  uint64_t v32 = (uint64_t)v51;
  uint64_t v33 = &v51[v31];
  uint64_t v34 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_257D86768((uint64_t)v5, (uint64_t)&v51[v31], MEMORY[0x263F19048]);
  *(_WORD *)&v33[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D628) + 36)] = 256;
  sub_257D877B0((uint64_t)v16, v32, &qword_26A05D618);
  sub_257D867D0((uint64_t)v5, v34);
  sub_257D8765C((uint64_t)v16, &qword_26A05D618);
  v30(&v5[*(int *)(v26 + 28)], v28, v29);
  *(void *)uint64_t v5 = v25;
  *((void *)v5 + 1) = v25;
  LODWORD(v16) = sub_257D94AD0();
  sub_257D94800();
  uint64_t v35 = v55;
  sub_257D86768((uint64_t)v5, v55, v34);
  uint64_t v36 = v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D670) + 36);
  long long v37 = v61;
  *(_OWORD *)uint64_t v36 = v60;
  *(_OWORD *)(v36 + 16) = v37;
  *(void *)(v36 + 32) = v62;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D678);
  *(_DWORD *)(v35 + *(int *)(v38 + 52)) = v16;
  *(_WORD *)(v35 + *(int *)(v38 + 56)) = 256;
  uint64_t v39 = sub_257D94D60();
  uint64_t v41 = v40;
  uint64_t v42 = (uint64_t *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D680) + 36));
  *uint64_t v42 = v39;
  v42[1] = v41;
  sub_257D867D0((uint64_t)v5, v34);
  uint64_t v43 = sub_257D94D60();
  uint64_t v45 = v44;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5F8);
  uint64_t v47 = v56;
  uint64_t v48 = v56 + *(int *)(v46 + 36);
  sub_257D877B0(v35, v48, &qword_26A05D660);
  uint64_t v49 = (uint64_t *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D638) + 36));
  *uint64_t v49 = v43;
  v49[1] = v45;
  sub_257D877B0(v32, v47, &qword_26A05D608);
  sub_257D8765C(v35, &qword_26A05D660);
  return sub_257D8765C(v32, &qword_26A05D608);
}

double sub_257D84024@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_257D94CE0();
  sub_257D94D60();
  sub_257D94810();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  double result = *(double *)&v8;
  *(_OWORD *)(a1 + 40) = v8;
  return result;
}

uint64_t sub_257D840A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D568);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D570);
  MEMORY[0x270FA5388](v6 - 8);
  long long v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = v1[1];
  v17[0] = *v1;
  v17[1] = v9;
  long long v10 = v1[3];
  v17[2] = v1[2];
  v17[3] = v10;
  *(void *)char v5 = sub_257D94A00();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D578);
  sub_257D805F8((uint64_t)v17, (uint64_t)&v5[*(int *)(v11 + 44)]);
  uint64_t v12 = sub_257D94D70();
  sub_257D7F698(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1, v12, v13, &qword_26A05D568, &qword_26A05D570);
  sub_257D8765C((uint64_t)v5, &qword_26A05D568);
  char v14 = sub_257D94B50();
  sub_257D877B0((uint64_t)v8, a1, &qword_26A05D570);
  uint64_t v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05D580) + 36);
  *(unsigned char *)uint64_t v15 = v14;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  *(unsigned char *)(v15 + 40) = 1;
  return sub_257D8765C((uint64_t)v8, &qword_26A05D570);
}

uint64_t sub_257D8425C()
{
  return sub_257D948D0();
}

uint64_t sub_257D84280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257D85074(a1, a2, a3, a4, MEMORY[0x263F07690], MEMORY[0x263F19590]);
}

uint64_t sub_257D842C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_257D94910();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D877B0(v2, (uint64_t)v10, &qword_26A05D4D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_257D94680();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_257D94EE0();
    char v14 = sub_257D94B30();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_257D84890(0x656C61636F4CLL, 0xE600000000000000, &v20);
      sub_257D94F60();
      _os_log_impl(&dword_257D79000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C2BB0](v18, -1, -1);
      MEMORY[0x25A2C2BB0](v16, -1, -1);
    }

    sub_257D94900();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_257D84570@<X0>(void (*a1)(uint64_t)@<X1>, void (*a2)(void *__return_ptr)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D658);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D5F8);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v19[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_257D94830();
  if (v11)
  {
    a1(v11);
    sub_257D877B0((uint64_t)v10, (uint64_t)v7, &qword_26A05D5F8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D648);
    sub_257D86508();
    sub_257D866F4();
    sub_257D94AC0();
    swift_release();
    return sub_257D8765C((uint64_t)v10, &qword_26A05D5F8);
  }
  else
  {
    a2(v19);
    uint64_t v13 = v19[1];
    char v14 = v20;
    uint64_t v15 = v21;
    char v16 = v22;
    long long v17 = v23;
    *(void *)uint64_t v7 = v19[0];
    *((void *)v7 + 1) = v13;
    v7[16] = v14;
    *((void *)v7 + 3) = v15;
    v7[32] = v16;
    *(_OWORD *)(v7 + 40) = v17;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D648);
    sub_257D86508();
    sub_257D866F4();
    return sub_257D94AC0();
  }
}

void *sub_257D84780(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4C8);
      long long v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      long long v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_257D876B8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_257D84890(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_257D84964(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_257D87864((uint64_t)v12, *a3);
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
      sub_257D87864((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_257D84964(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_257D94F70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_257D84B20(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_257D94FD0();
  if (!v8)
  {
    sub_257D94FE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_257D95000();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_257D84B20(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_257D84BB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_257D84D98(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_257D84D98(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_257D84BB8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_257D84D30(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_257D94FB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_257D94FE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_257D94E40();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_257D95000();
    __break(1u);
LABEL_14:
    uint64_t result = sub_257D94FE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_257D84D30(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D890);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_257D84D98(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D890);
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
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_257D95000();
  __break(1u);
  return result;
}

uint64_t sub_257D84EE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_257D84F08(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_257D84F08(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_257D95000();
  __break(1u);
  return result;
}

uint64_t sub_257D85074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_257D85144@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257D948B0();
  *a1 = result;
  return result;
}

uint64_t sub_257D85170()
{
  return sub_257D948C0();
}

uint64_t sub_257D8519C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v14 = *v13;
      v18[0] = *(v13 - 1);
      v18[1] = v14;
      swift_bridgeObjectRetain();
      sub_257D8DE24(v18, a2, a3, a4, a5, &v17);
      if (v6)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v15 = swift_bridgeObjectRelease();
      if (v17)
      {
        MEMORY[0x25A2C24B0](v15);
        if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_257D94E90();
        }
        sub_257D94EA0();
        sub_257D94E80();
      }
      v13 += 2;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

uint64_t sub_257D852F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for NotesSiriListView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    int64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    int64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_257D94DE0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v7 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_257D94680();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t destroy for NotesSiriListView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_257D94680();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void *initializeWithCopy for NotesSiriListView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_257D94680();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for NotesSiriListView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    sub_257D8765C((uint64_t)a1 + v10, &qword_26A05D4D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_257D94680();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for NotesSiriListView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_257D94680();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for NotesSiriListView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    sub_257D8765C((uint64_t)a1 + v10, &qword_26A05D4D0);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_257D94680();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257D85AA4);
}

uint64_t sub_257D85AA4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_257D94DE0();
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4E8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriListView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257D85BE8);
}

void *sub_257D85BE8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_257D94DE0();
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4E8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_257D85D18()
{
  sub_257D94DE0();
  if (v0 <= 0x3F)
  {
    sub_257D85DF0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_257D85DF0()
{
  if (!qword_26A05D500)
  {
    sub_257D94680();
    unint64_t v0 = sub_257D947F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A05D500);
    }
  }
}

unint64_t sub_257D85E4C()
{
  unint64_t result = qword_26A05D508;
  if (!qword_26A05D508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D510);
    sub_257D87904(&qword_26A05D518, &qword_26A05D4E0, (void (*)(void))sub_257D85F34);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D508);
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

unint64_t sub_257D85F34()
{
  unint64_t result = qword_26A05D520;
  if (!qword_26A05D520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D4D8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D528);
    sub_257D85FE4();
    swift_getOpaqueTypeConformance2();
    sub_257D86188();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D520);
  }
  return result;
}

unint64_t sub_257D85FE4()
{
  unint64_t result = qword_26A05D530;
  if (!qword_26A05D530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D528);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D538);
    sub_257D86094();
    swift_getOpaqueTypeConformance2();
    sub_257D86188();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D530);
  }
  return result;
}

unint64_t sub_257D86094()
{
  unint64_t result = qword_26A05D540;
  if (!qword_26A05D540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D538);
    sub_257D86134();
    sub_257D87A20(&qword_26A05D550, &qword_26A05D558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D540);
  }
  return result;
}

unint64_t sub_257D86134()
{
  unint64_t result = qword_26A05D548;
  if (!qword_26A05D548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D548);
  }
  return result;
}

unint64_t sub_257D86188()
{
  unint64_t result = qword_26A05D560;
  if (!qword_26A05D560)
  {
    sub_257D94B20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D560);
  }
  return result;
}

uint64_t destroy for NotesSiriListView.NoteRow()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NotesSiriListView.NoteRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NotesSiriListView.NoteRow(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotesSiriListView.NoteRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListView.NoteRow(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesSiriListView.NoteRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesSiriListView.NoteRow()
{
  return &type metadata for NotesSiriListView.NoteRow;
}

uint64_t sub_257D86420()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257D8643C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_257D8647C@<X0>(uint64_t a1@<X8>)
{
  return sub_257D83A6C(v1 + 16, a1);
}

uint64_t sub_257D86484()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_257D864C4@<X0>(uint64_t a1@<X8>)
{
  return sub_257D84570(*(void (**)(uint64_t))(v1 + 16), *(void (**)(void *__return_ptr))(v1 + 32), a1);
}

uint64_t sub_257D864D0(uint64_t a1)
{
  return a1;
}

unint64_t sub_257D86508()
{
  unint64_t result = qword_26A05D5F0;
  if (!qword_26A05D5F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D5F8);
    sub_257D865A8();
    sub_257D87A20(&qword_26A05D630, &qword_26A05D638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D5F0);
  }
  return result;
}

unint64_t sub_257D865A8()
{
  unint64_t result = qword_26A05D600;
  if (!qword_26A05D600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D608);
    sub_257D86648();
    sub_257D87A20(&qword_26A05D620, &qword_26A05D628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D600);
  }
  return result;
}

unint64_t sub_257D86648()
{
  unint64_t result = qword_26A05D610;
  if (!qword_26A05D610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D618);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D610);
  }
  return result;
}

unint64_t sub_257D866F4()
{
  unint64_t result = qword_26A05D640;
  if (!qword_26A05D640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D640);
  }
  return result;
}

uint64_t sub_257D86768(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_257D867D0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_257D86830()
{
  return sub_257D94880();
}

uint64_t sub_257D86854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257D85074(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

uint64_t sub_257D86894@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257D948B0();
  *a1 = result;
  return result;
}

uint64_t sub_257D868C0()
{
  return sub_257D948C0();
}

uint64_t sub_257D868EC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_257D868FC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_257D8690C()
{
  unint64_t result = qword_26A05D6E0;
  if (!qword_26A05D6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D6E0);
  }
  return result;
}

uint64_t sub_257D86960@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_257D948E0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_257D86994()
{
  return sub_257D948F0();
}

uint64_t sub_257D869C4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_257D869DC(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_257D869DC(uint64_t a1, uint64_t a2, char a3)
{
  sub_257D868EC(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_257D86A18(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_257D86A30(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_257D86A30(uint64_t a1, uint64_t a2, char a3)
{
  sub_257D868FC(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_257D86A6C()
{
  unint64_t result = qword_26A05D720;
  if (!qword_26A05D720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D718);
    sub_257D86B0C();
    sub_257D87A20(&qword_26A05D758, &qword_26A05D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D720);
  }
  return result;
}

unint64_t sub_257D86B0C()
{
  unint64_t result = qword_26A05D728;
  if (!qword_26A05D728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D710);
    sub_257D86BAC();
    sub_257D87A20(&qword_26A05D750, &qword_26A05D6C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D728);
  }
  return result;
}

unint64_t sub_257D86BAC()
{
  unint64_t result = qword_26A05D730;
  if (!qword_26A05D730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D738);
    sub_257D87A20(&qword_26A05D740, &qword_26A05D748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D730);
  }
  return result;
}

unint64_t sub_257D86C4C()
{
  unint64_t result = qword_26A05D770;
  if (!qword_26A05D770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D6C8);
    sub_257D87A20(&qword_26A05D750, &qword_26A05D6C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D770);
  }
  return result;
}

uint64_t sub_257D86CEC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_257D86D74()
{
  unint64_t result = qword_26A05D7E8;
  if (!qword_26A05D7E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D7D8);
    sub_257D86DE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D7E8);
  }
  return result;
}

unint64_t sub_257D86DE8()
{
  unint64_t result = qword_26A05D7F0;
  if (!qword_26A05D7F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D7C8);
    sub_257D86E88();
    sub_257D87A20(&qword_26A05D750, &qword_26A05D6C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D7F0);
  }
  return result;
}

unint64_t sub_257D86E88()
{
  unint64_t result = qword_26A05D7F8;
  if (!qword_26A05D7F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D800);
    sub_257D86BAC();
    sub_257D87A20(&qword_26A05D758, &qword_26A05D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D7F8);
  }
  return result;
}

uint64_t sub_257D86F28()
{
  return sub_257D86CEC(&qword_26A05D808, &qword_26A05D7A8, (void (*)(void))sub_257D86F64, (void (*)(void))sub_257D86A6C);
}

unint64_t sub_257D86F64()
{
  unint64_t result = qword_26A05D810;
  if (!qword_26A05D810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D7A0);
    sub_257D87004();
    sub_257D87A20(&qword_26A05D750, &qword_26A05D6C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D810);
  }
  return result;
}

unint64_t sub_257D87004()
{
  unint64_t result = qword_26A05D818;
  if (!qword_26A05D818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D820);
    sub_257D870A4();
    sub_257D87A20(&qword_26A05D758, &qword_26A05D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D818);
  }
  return result;
}

unint64_t sub_257D870A4()
{
  unint64_t result = qword_26A05D828;
  if (!qword_26A05D828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D830);
    sub_257D87144();
    sub_257D87A20(&qword_26A05D740, &qword_26A05D748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D828);
  }
  return result;
}

unint64_t sub_257D87144()
{
  unint64_t result = qword_26A05D838;
  if (!qword_26A05D838)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D840);
    sub_257D87A20(&qword_26A05D848, &qword_26A05D850);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D838);
  }
  return result;
}

uint64_t sub_257D871E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_257D87248@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257D94890();
  *a1 = result;
  return result;
}

uint64_t sub_257D87274()
{
  return sub_257D948A0();
}

uint64_t sub_257D872A0(uint64_t a1)
{
  sub_257D87318(*(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), *(void *)(a1 + 232), *(void *)(a1 + 240), *(void *)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 264), *(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 288), *(void *)(a1 + 296), *(void *)(a1 + 304), *(void *)(a1 + 312), *(void *)(a1 + 320),
    *(void *)(a1 + 328),
    *(void *)(a1 + 336),
    *(void *)(a1 + 344),
    *(void *)(a1 + 352),
    *(void *)(a1 + 360),
    *(unsigned char *)(a1 + 368));
  return a1;
}

uint64_t sub_257D87318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  sub_257D868EC(a4, a5, a6 & 1);
  swift_bridgeObjectRetain();
  if (a25)
  {
    sub_257D868EC(a16, a17, a18 & 1);
    swift_bridgeObjectRetain();
    sub_257D868EC(a20, a21, a22 & 1);
  }
  else
  {
    swift_retain();
    sub_257D868EC(a21, a22, a23 & 1);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_257D8740C(uint64_t a1)
{
  sub_257D87318(*(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    *(void *)(a1 + 256),
    *(void *)(a1 + 264),
    *(void *)(a1 + 272),
    *(unsigned char *)(a1 + 280));
  return a1;
}

uint64_t sub_257D87490()
{
  uint64_t v1 = (int *)(type metadata accessor for NotesSiriListView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_257D94680();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_257D875F8()
{
  type metadata accessor for NotesSiriListView();
  uint64_t v1 = *(void *)(v0 + 16);
  return sub_257D8012C(v1);
}

uint64_t sub_257D8765C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_257D876B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_257D95000();
  __break(1u);
  return result;
}

uint64_t sub_257D877B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_257D87864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_257D878C0()
{
  return sub_257D87904(&qword_26A05D898, &qword_26A05D580, (void (*)(void))sub_257D87980);
}

uint64_t sub_257D87904(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_257D87980()
{
  unint64_t result = qword_26A05D8A0;
  if (!qword_26A05D8A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D570);
    sub_257D87A20(&qword_26A05D8A8, &qword_26A05D568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D8A0);
  }
  return result;
}

uint64_t sub_257D87A20(unint64_t *a1, uint64_t *a2)
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

void NotesSiriSingleNoteView.init(identifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v7 = (int *)(v6 - 8);
  uint64_t v52 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v52 + 64);
  MEMORY[0x270FA5388](v6);
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 0;
  uint64_t v9 = a3 + v7[9];
  sub_257D94600();
  sub_257D94DD0();
  *(void *)(a3 + v7[11]) = 0x4028000000000000;
  uint64_t v10 = a3 + v7[12];
  LOBYTE(v56) = 0;
  sub_257D94D30();
  uint64_t v11 = *((void *)&aBlock + 1);
  *(unsigned char *)uint64_t v10 = aBlock;
  *(void *)(v10 + 8) = v11;
  uint64_t v12 = (void *)(a3 + v7[13]);
  *(void *)&long long v56 = 0xBFF0000000000000;
  sub_257D94D30();
  uint64_t v13 = *((void *)&aBlock + 1);
  *uint64_t v12 = aBlock;
  v12[1] = v13;
  uint64_t v14 = a3 + v7[14];
  LOBYTE(v56) = 0;
  sub_257D94D30();
  uint64_t v15 = *((void *)&aBlock + 1);
  *(unsigned char *)uint64_t v14 = aBlock;
  *(void *)(v14 + 8) = v15;
  uint64_t v16 = (void *)(a3 + v7[15]);
  void *v16 = 0;
  v16[1] = 0xE000000000000000;
  uint64_t v55 = v7[16];
  *(unsigned char *)(a3 + v55) = 0;
  uint64_t v54 = v7[17];
  *(unsigned char *)(a3 + v54) = 0;
  *(void *)(a3 + v7[18]) = 0x4034000000000000;
  *(void *)(a3 + v7[19]) = 0x4038000000000000;
  *(void *)(a3 + v7[20]) = 0x403C000000000000;
  uint64_t v17 = (_OWORD *)(a3 + v7[21]);
  uint64_t v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D8C0);
  sub_257D94D30();
  long long v18 = v62;
  long long v19 = v63;
  long long v20 = v64;
  long long v21 = v65;
  *uint64_t v17 = aBlock;
  v17[1] = v18;
  v17[2] = v19;
  v17[3] = v20;
  _OWORD v17[4] = v21;
  char v22 = self;
  objc_msgSend(v22, sel_startSharedContextWithOptions_, 66116);
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  swift_bridgeObjectRetain();
  id v23 = objc_msgSend(v22, sel_sharedContext);
  if (!v23) {
    goto LABEL_14;
  }
  long long v24 = v23;
  uint64_t v51 = v8;
  id v25 = objc_msgSend(v23, sel_managedObjectContext);

  if (!v25) {
    goto LABEL_14;
  }
  uint64_t v50 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v26 = objc_msgSend(self, sel_sharedContext);
  if (!v26) {
    goto LABEL_19;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_managedObjectContext);

  if (!v28)
  {

LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_257D957B0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  id v30 = v28;
  id v31 = v25;
  unint64_t v32 = sub_257D8519C(inited, v30, 0, 0, v31);
  id v49 = v30;

  id v48 = v31;
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_bridgeObjectRelease();
  *(void *)(a3 + 16) = v32;
  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_257D94FF0();
    if (v33) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v33)
    {
LABEL_7:
      if (v33 >= 1)
      {
        uint64_t v34 = 0;
        unint64_t v53 = v32 & 0xC000000000000001;
        unint64_t v35 = v32;
        do
        {
          if (v53)
          {
            uint64_t v36 = MEMORY[0x25A2C2620](v34, v32);
          }
          else
          {
            uint64_t v36 = *(void *)(v32 + 8 * v34 + 32);
            swift_retain();
          }
          ++v34;
          sub_257D8765C(v9, &qword_26A05D428);
          uint64_t v37 = v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
          swift_beginAccess();
          uint64_t v38 = sub_257D94610();
          uint64_t v39 = *(void *)(v38 - 8);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v9, v37, v38);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v9, 0, 1, v38);
          uint64_t v40 = (uint64_t *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
          swift_beginAccess();
          uint64_t v42 = *v40;
          uint64_t v41 = v40[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          void *v16 = v42;
          v16[1] = v41;
          *(unsigned char *)(a3 + v55) = *(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected);
          *(unsigned char *)(a3 + v54) = *(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported);
          LOBYTE(v41) = *(unsigned char *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote);
          swift_release();
          *(unsigned char *)(a3 + 24) = v41;
          unint64_t v32 = v35;
        }
        while (v33 != v34);
        goto LABEL_16;
      }
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v43 = self;
  uint64_t v44 = v50;
  sub_257D8B578(a3, v50);
  unint64_t v45 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v46 = swift_allocObject();
  sub_257D8B5E0(v44, v46 + v45);
  *(void *)&long long v63 = sub_257D8B644;
  *((void *)&v63 + 1) = v46;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v62 = sub_257D882A8;
  *((void *)&v62 + 1) = &block_descriptor;
  uint64_t v47 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v43, sel_setOpenURLHandler_, v47);
  _Block_release(v47);
}

uint64_t type metadata accessor for NotesSiriSingleNoteView()
{
  uint64_t result = qword_26A05D8E8;
  if (!qword_26A05D8E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_257D88150(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = sub_257D94E00();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  uint64_t v8 = (void *)sub_257D945E0();
  objc_msgSend(v7, sel_setPunchOutUri_, v8);

  type metadata accessor for NotesSiriSingleNoteView();
  sub_257D94DC0();
  id v9 = v7;
  sub_257D94DF0();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (a2) {
    a2(1);
  }
}

uint64_t sub_257D882A8(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = sub_257D94610();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *(void (**)(char *, void *, uint64_t))(a1 + 32);
  sub_257D945F0();
  uint64_t v10 = _Block_copy(a3);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    uint64_t v10 = sub_257D8DB40;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_retain();
  v9(v8, v10, v11);
  sub_257D8DAF8((uint64_t)v10);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_257D88404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = sub_257D949D0();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v7 = v6 - 8;
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A05DA80);
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9B8);
  MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (ValueMetadata **)(v2 + *(int *)(v7 + 52));
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v29 = v15;
  unint64_t v30 = (unint64_t)v16;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D908);
  sub_257D94D40();
  sub_257D7E008((uint64_t)&v29, v32);
  sub_257D8B578(v2, (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v17 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v18 = swift_allocObject();
  sub_257D8B5E0((uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  unint64_t v19 = sub_257D7DDB0();
  sub_257D94C50();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  sub_257D949B0();
  uint64_t v29 = &type metadata for NotesSiriTextEditorWrapper;
  unint64_t v30 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v24;
  sub_257D94C60();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  uint64_t v29 = (ValueMetadata *)sub_257D94710();
  unint64_t v30 = v21;
  sub_257D8690C();
  sub_257D94840();
  swift_bridgeObjectRelease();
  return sub_257D8765C((uint64_t)v13, &qword_26A05D9B8);
}

uint64_t sub_257D887BC(uint64_t a1)
{
  uint64_t v2 = sub_257D94E00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  uint64_t v10 = type metadata accessor for NotesSiriSingleNoteView();
  sub_257D877B0(a1 + *(int *)(v10 + 28), (uint64_t)v8, &qword_26A05D428);
  uint64_t v11 = sub_257D94610();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    uint64_t v13 = (void *)sub_257D945E0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }
  objc_msgSend(v9, sel_setPunchOutUri_, v13);

  sub_257D94DC0();
  id v14 = v9;
  sub_257D94DF0();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t NotesSiriSingleNoteView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v46 = a1;
  uint64_t v3 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_257D94EF0();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  id v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D8C8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D8D0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v1 + *(int *)(v4 + 48);
  char v17 = *(unsigned char *)v16;
  uint64_t v18 = *(void *)(v16 + 8);
  char v48 = v17;
  uint64_t v49 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D398);
  sub_257D94D40();
  *uint64_t v12 = sub_257D94D60();
  v12[1] = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D8D8);
  sub_257D88E5C(v1, (uint64_t)v12 + *(int *)(v20 + 44));
  id v44 = self;
  id v21 = objc_msgSend(v44, sel_defaultCenter);
  if (qword_26A05D308 != -1) {
    swift_once();
  }
  sub_257D94F00();

  sub_257D8B578(v2, (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  uint64_t v41 = v22 | 7;
  uint64_t v42 = v23 + v6;
  uint64_t v24 = swift_allocObject();
  sub_257D8B5E0((uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  uint64_t v40 = v2;
  sub_257D877B0((uint64_t)v12, (uint64_t)v15, &qword_26A05D8C8);
  uint64_t v25 = &v15[*(int *)(v13 + 52)];
  uint64_t v26 = v45;
  uint64_t v27 = v47;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  v43(v25, v9, v47);
  uint64_t v28 = *(int *)(v13 + 56);
  uint64_t v29 = (uint64_t)v15;
  unint64_t v30 = (uint64_t (**)(uint64_t))&v15[v28];
  *unint64_t v30 = sub_257D8B6E8;
  v30[1] = (uint64_t (*)(uint64_t))v24;
  id v31 = *(void (**)(char *, uint64_t))(v26 + 8);
  v31(v9, v27);
  sub_257D8765C((uint64_t)v12, &qword_26A05D8C8);
  id v32 = objc_msgSend(v44, sel_defaultCenter);
  if (qword_26A05D310 != -1) {
    swift_once();
  }
  sub_257D94F00();

  sub_257D8B578(v40, (uint64_t)v7);
  uint64_t v33 = swift_allocObject();
  sub_257D8B5E0((uint64_t)v7, v33 + v23);
  uint64_t v34 = v46;
  sub_257D877B0(v29, v46, &qword_26A05D8D0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D8E0);
  uint64_t v36 = v47;
  v43((char *)(v34 + *(int *)(v35 + 52)), v9, v47);
  uint64_t v37 = (uint64_t (**)(uint64_t))(v34 + *(int *)(v35 + 56));
  *uint64_t v37 = sub_257D8B704;
  v37[1] = (uint64_t (*)(uint64_t))v33;
  v31(v9, v36);
  return sub_257D8765C(v29, &qword_26A05D8D0);
}

uint64_t sub_257D88E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v44 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v43 = v4;
  uint64_t v45 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D910);
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v47 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D918);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  uint64_t v51 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D920);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v43 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D928);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D930);
  uint64_t v20 = v19 - 8;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v43 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v43 - v27;
  *(void *)uint64_t v18 = sub_257D94A00();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D938);
  sub_257D893D0(a1, (uint64_t)&v18[*(int *)(v29 + 44)]);
  sub_257D877B0((uint64_t)v18, (uint64_t)v26, &qword_26A05D928);
  *(void *)&v26[*(int *)(v20 + 44)] = 0;
  sub_257D8765C((uint64_t)v18, &qword_26A05D928);
  sub_257D871E4((uint64_t)v26, (uint64_t)v28, &qword_26A05D930);
  if (*(unsigned char *)(a1 + 24) == 1)
  {
    uint64_t v53 = sub_257D94CD0();
    uint64_t v54 = 0x3F50624DD2F1A9FCLL;
    uint64_t v30 = v45;
    sub_257D8B578(a1, v45);
    unint64_t v31 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v32 = swift_allocObject();
    sub_257D8B5E0(v30, v32 + v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D948);
    sub_257D8CFBC(&qword_26A05D950, &qword_26A05D948, (void (*)(void))sub_257D8CE04);
    uint64_t v33 = v47;
    sub_257D94C50();
    swift_release();
    swift_release();
    uint64_t v35 = v48;
    uint64_t v34 = v49;
    uint64_t v36 = (uint64_t)v46;
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v46, v33, v49);
    uint64_t v37 = v50;
    *(void *)(v36 + *(int *)(v50 + 36)) = 0x3FF0000000000000;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v33, v34);
    sub_257D871E4(v36, (uint64_t)v15, &qword_26A05D918);
    uint64_t v38 = 0;
    uint64_t v39 = v37;
  }
  else
  {
    uint64_t v38 = 1;
    uint64_t v39 = v50;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v51 + 56))(v15, v38, 1, v39);
  sub_257D877B0((uint64_t)v28, (uint64_t)v23, &qword_26A05D930);
  sub_257D877B0((uint64_t)v15, (uint64_t)v13, &qword_26A05D920);
  uint64_t v40 = v52;
  sub_257D877B0((uint64_t)v23, v52, &qword_26A05D930);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D940);
  sub_257D877B0((uint64_t)v13, v40 + *(int *)(v41 + 48), &qword_26A05D920);
  sub_257D8765C((uint64_t)v15, &qword_26A05D920);
  sub_257D8765C((uint64_t)v28, &qword_26A05D930);
  sub_257D8765C((uint64_t)v13, &qword_26A05D920);
  return sub_257D8765C((uint64_t)v23, &qword_26A05D930);
}

uint64_t sub_257D893D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v3 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v4 = v3 - 8;
  uint64_t v48 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v49 = v5;
  uint64_t v50 = (uint64_t)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257D946A0();
  MEMORY[0x270FA5388](v6 - 8);
  v45[1] = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_257D94DB0();
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v46 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D980);
  uint64_t v10 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54 - 8);
  uint64_t v47 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D988);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v45 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D990);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)v45 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v45 - v25;
  *(void *)uint64_t v24 = sub_257D94930();
  *((void *)v24 + 1) = 0;
  uint64_t v27 = 1;
  v24[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D998);
  sub_257D899B0(a1);
  uint64_t v28 = (uint64_t)v24;
  uint64_t v29 = v10;
  uint64_t v30 = a1;
  sub_257D871E4(v28, (uint64_t)v26, &qword_26A05D990);
  uint64_t v31 = a1 + *(int *)(v4 + 56);
  char v32 = *(unsigned char *)v31;
  uint64_t v33 = *(void *)(v31 + 8);
  LOBYTE(v59) = v32;
  uint64_t v60 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D398);
  sub_257D94D40();
  if (v56 == 1)
  {
    uint64_t v34 = sub_257D94720();
    uint64_t v61 = MEMORY[0x263F8D310];
    uint64_t v62 = MEMORY[0x263F77998];
    uint64_t v59 = v34;
    uint64_t v60 = v35;
    uint64_t v58 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
    sub_257D94690();
    v55[3] = sub_257D94D80();
    v55[4] = MEMORY[0x263F77548];
    __swift_allocate_boxed_opaque_existential_1(v55);
    sub_257D94D90();
    uint64_t v36 = v46;
    sub_257D94DA0();
    uint64_t v37 = v50;
    sub_257D8B578(v30, v50);
    unint64_t v38 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v39 = swift_allocObject();
    sub_257D8B5E0(v37, v39 + v38);
    sub_257D8D110(&qword_26A05D9A8, MEMORY[0x263F776F0]);
    uint64_t v40 = v47;
    uint64_t v41 = v52;
    sub_257D94C50();
    swift_release();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v36, v41);
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v17, v40, v54);
    uint64_t v27 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v17, v27, 1, v54);
  sub_257D877B0((uint64_t)v26, (uint64_t)v21, &qword_26A05D990);
  sub_257D877B0((uint64_t)v17, (uint64_t)v15, &qword_26A05D988);
  uint64_t v42 = v53;
  sub_257D877B0((uint64_t)v21, v53, &qword_26A05D990);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9A0);
  sub_257D877B0((uint64_t)v15, v42 + *(int *)(v43 + 48), &qword_26A05D988);
  sub_257D8765C((uint64_t)v17, &qword_26A05D988);
  sub_257D8765C((uint64_t)v26, &qword_26A05D990);
  sub_257D8765C((uint64_t)v15, &qword_26A05D988);
  return sub_257D8765C((uint64_t)v21, &qword_26A05D990);
}

uint64_t sub_257D899B0(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v73 = v2;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9B0);
  MEMORY[0x270FA5388](v60);
  uint64_t v63 = (uint64_t)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9B8);
  MEMORY[0x270FA5388](v62);
  uint64_t v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9C0);
  uint64_t v6 = MEMORY[0x270FA5388](v59);
  uint64_t v57 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v58 = (uint64_t)&v57 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9C8);
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9D0);
  MEMORY[0x270FA5388](v75);
  uint64_t v76 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_257D949D0();
  uint64_t v70 = *(void *)(v12 - 8);
  uint64_t v71 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v69 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9D8);
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D9E0);
  uint64_t v16 = MEMORY[0x270FA5388](v74);
  unsigned __int8 v67 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  long long v65 = (char *)&v57 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v72 = (uint64_t)&v57 - v20;
  uint64_t v21 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v64 = *(void *)(v21 - 8);
  uint64_t v22 = *(void *)(v64 + 64);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v57 - v26;
  int v28 = *(unsigned __int8 *)(v1 + *(int *)(v25 + 56));
  sub_257D8B578(v1, (uint64_t)&v57 - v26);
  if (v28 == 1)
  {
    sub_257D8CF60((uint64_t)v27);
LABEL_4:
    uint64_t v30 = sub_257D94A00();
    sub_257D8A350(v1, (uint64_t)v78);
    v79[600] = 1;
    memcpy(&v79[7], v78, 0x250uLL);
    uint64_t v82 = v30;
    uint64_t v83 = 0;
    char v84 = 1;
    memcpy(v85, v79, sizeof(v85));
    sub_257D94D70();
    sub_257D7F868(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v80, 0.0, 1, 0.0, 1);
    sub_257D8D4F4((uint64_t)v78);
    uint64_t v31 = sub_257D94B60();
    uint64_t KeyPath = swift_getKeyPath();
    int v33 = sub_257D94AE0();
    uint64_t v63 = v9;
    int v34 = v33;
    char v35 = sub_257D94B50();
    v79[608] = 1;
    memcpy(v77, v80, 0x2D8uLL);
    v77[91] = KeyPath;
    v77[92] = v31;
    LODWORD(v77[93]) = v34;
    LOBYTE(v77[94]) = v35;
    memset(&v77[95], 0, 32);
    LOBYTE(v77[99]) = 1;
    sub_257D8B578(v1, (uint64_t)v24);
    unint64_t v36 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    uint64_t v37 = swift_allocObject();
    sub_257D8B5E0((uint64_t)v24, v37 + v36);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DA00);
    uint64_t v39 = sub_257D8CFBC(&qword_26A05DA08, &qword_26A05DA00, (void (*)(void))sub_257D8D26C);
    sub_257D94C50();
    swift_release();
    memcpy(v81, v77, 0x319uLL);
    sub_257D8D67C((uint64_t)v81);
    uint64_t v40 = v69;
    sub_257D949B0();
    v77[0] = v38;
    v77[1] = v39;
    swift_getOpaqueTypeConformance2();
    uint64_t v42 = (uint64_t)v67;
    uint64_t v41 = v68;
    sub_257D94C60();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v40, v71);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v15, v41);
    v77[0] = sub_257D94710();
    v77[1] = v43;
    sub_257D8690C();
    uint64_t v44 = (uint64_t)v65;
    sub_257D94840();
    swift_bridgeObjectRelease();
    uint64_t v45 = &qword_26A05D9E0;
    sub_257D8765C(v42, &qword_26A05D9E0);
    uint64_t v46 = v72;
    sub_257D871E4(v44, v72, &qword_26A05D9E0);
    sub_257D877B0(v46, v76, &qword_26A05D9E0);
    swift_storeEnumTagMultiPayload();
    sub_257D8D158();
    sub_257D8D44C();
    sub_257D94AC0();
    uint64_t v47 = v46;
    return sub_257D8765C(v47, v45);
  }
  int v29 = v27[*(int *)(v21 + 60)];
  sub_257D8CF60((uint64_t)v27);
  if (v29 == 1) {
    goto LABEL_4;
  }
  int v48 = *(unsigned __int8 *)(v1 + 24);
  uint64_t v49 = (uint64_t)v5;
  sub_257D88404((uint64_t)v5);
  if (v48 == 1)
  {
    uint64_t v50 = *(void *)(v1 + *(int *)(v21 + 36));
    char v51 = sub_257D94B40();
    uint64_t v52 = v57;
    sub_257D877B0((uint64_t)v5, v57, &qword_26A05D9B8);
    uint64_t v53 = v52 + *(int *)(v59 + 36);
    *(unsigned char *)uint64_t v53 = v51;
    *(void *)(v53 + 8) = v50;
    *(void *)(v53 + 16) = 0;
    *(void *)(v53 + 24) = v50;
    *(void *)(v53 + 32) = 0;
    *(unsigned char *)(v53 + 40) = 0;
    sub_257D8765C((uint64_t)v5, &qword_26A05D9B8);
    uint64_t v54 = &qword_26A05D9C0;
    uint64_t v49 = v58;
    sub_257D871E4(v52, v58, &qword_26A05D9C0);
    sub_257D877B0(v49, v63, &qword_26A05D9C0);
  }
  else
  {
    uint64_t v54 = &qword_26A05D9B8;
    sub_257D877B0((uint64_t)v5, v63, &qword_26A05D9B8);
  }
  swift_storeEnumTagMultiPayload();
  sub_257D8CFBC(&qword_26A05D9E8, &qword_26A05D9C0, (void (*)(void))sub_257D8D038);
  sub_257D8D038();
  uint64_t v55 = (uint64_t)v61;
  sub_257D94AC0();
  sub_257D8765C(v49, v54);
  uint64_t v45 = &qword_26A05D9C8;
  sub_257D877B0(v55, v76, &qword_26A05D9C8);
  swift_storeEnumTagMultiPayload();
  sub_257D8D158();
  sub_257D8D44C();
  sub_257D94AC0();
  uint64_t v47 = v55;
  return sub_257D8765C(v47, v45);
}

uint64_t sub_257D8A350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for NotesSiriSingleNoteView();
  sub_257D94D60();
  sub_257D94810();
  char v4 = v21;
  uint64_t v17 = v22;
  uint64_t v18 = v20;
  char v5 = v23;
  uint64_t v6 = v24;
  uint64_t v7 = v25;
  uint64_t v8 = sub_257D94930();
  sub_257D8A594(a1, (uint64_t)__src);
  v36[336] = 1;
  memcpy(&v36[7], __src, 0x148uLL);
  uint64_t v31 = v8;
  uint64_t v32 = 0;
  char v33 = 1;
  memcpy(v34, v36, sizeof(v34));
  sub_257D94D70();
  sub_257D7FA2C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v19, 0.0, 1, 0.0, 1);
  sub_257D8D714((uint64_t)__src);
  sub_257D94D60();
  sub_257D94810();
  uint64_t v9 = v26;
  char v10 = v27;
  uint64_t v11 = v28;
  char v12 = v29;
  memcpy(__dst, v19, 0x1D0uLL);
  char v40 = 1;
  char v39 = v4;
  char v38 = v5;
  memcpy((void *)(a2 + 64), v19, 0x1D0uLL);
  __dst[480] = 1;
  __dst[472] = v10;
  __dst[464] = v12;
  char v13 = v40;
  char v14 = v39;
  char v15 = v38;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = v18;
  *(unsigned char *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v17;
  *(unsigned char *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v7;
  *(void *)(a2 + 528) = 0;
  *(unsigned char *)(a2 + 536) = 1;
  *(void *)(a2 + 544) = v9;
  *(unsigned char *)(a2 + 552) = v10;
  *(void *)(a2 + 560) = v11;
  *(unsigned char *)(a2 + 568) = v12;
  *(_OWORD *)(a2 + 576) = v30;
  memcpy(v41, v19, 0x1D0uLL);
  sub_257D8D78C((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_257D87318);
  return sub_257D8D78C((uint64_t)v41, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_257D8D57C);
}

uint64_t sub_257D8A594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NotesSiriSingleNoteView();
  sub_257D94D60();
  sub_257D94810();
  char v25 = v53;
  uint64_t v28 = v54;
  uint64_t v29 = v52;
  char v5 = v55;
  uint64_t v26 = v57;
  uint64_t v27 = v56;
  if (*(unsigned char *)(a1 + *(int *)(v4 + 56)) == 1)
  {
    uint64_t v6 = sub_257D94A00();
    sub_257D8AAEC(a1, (uint64_t)&v30);
    *(_OWORD *)&v41[71] = v34;
    *(_OWORD *)&v41[55] = v33;
    *(_OWORD *)&v41[119] = v37;
    *(_OWORD *)&v41[135] = v38;
    *(void *)&v41[167] = v40;
    *(_OWORD *)&v41[151] = v39;
    *(_OWORD *)&v41[87] = v35;
    *(_OWORD *)&v41[103] = v36;
    *(_OWORD *)&v41[7] = v30;
    *(_OWORD *)&v41[23] = v31;
    *(_OWORD *)&v41[39] = v32;
    *(_OWORD *)&v50[113] = *(_OWORD *)&v41[112];
    *(_OWORD *)&v50[129] = *(_OWORD *)&v41[128];
    *(_OWORD *)&v50[145] = *(_OWORD *)&v41[144];
    *(_OWORD *)&v50[160] = *(_OWORD *)&v41[159];
    *(_OWORD *)&v50[49] = *(_OWORD *)&v41[48];
    *(_OWORD *)&v50[65] = *(_OWORD *)&v41[64];
    *(_OWORD *)&v50[81] = *(_OWORD *)&v41[80];
    *(_OWORD *)&v50[97] = *(_OWORD *)&v41[96];
    *(_OWORD *)&v50[1] = *(_OWORD *)v41;
    *(_OWORD *)&v50[17] = *(_OWORD *)&v41[16];
    char v48 = 1;
    long long v49 = (unint64_t)v6;
    v50[0] = 1;
    *(_OWORD *)&v50[33] = *(_OWORD *)&v41[32];
    sub_257D8D8A0((uint64_t)&v49);
  }
  else
  {
    uint64_t v7 = sub_257D94A00();
    sub_257D8ADB8(a1, (uint64_t)&v30);
    *(_OWORD *)&v41[119] = v37;
    *(_OWORD *)&v41[103] = v36;
    *(_OWORD *)&v41[55] = v33;
    *(_OWORD *)&v41[39] = v32;
    *(_OWORD *)&v41[135] = v38;
    *(_OWORD *)&v41[151] = v39;
    *(_OWORD *)&v41[71] = v34;
    *(_OWORD *)&v41[87] = v35;
    *(_OWORD *)&v41[7] = v30;
    *(_OWORD *)&v41[23] = v31;
    *(_OWORD *)&v50[113] = *(_OWORD *)&v41[112];
    *(_OWORD *)&v50[129] = *(_OWORD *)&v41[128];
    *(_OWORD *)&v50[145] = *(_OWORD *)&v41[144];
    *(_OWORD *)&v50[49] = *(_OWORD *)&v41[48];
    *(_OWORD *)&v50[65] = *(_OWORD *)&v41[64];
    *(_OWORD *)&v50[81] = *(_OWORD *)&v41[80];
    *(_OWORD *)&v50[97] = *(_OWORD *)&v41[96];
    *(_OWORD *)&v50[1] = *(_OWORD *)v41;
    *(_OWORD *)&v50[17] = *(_OWORD *)&v41[16];
    char v48 = 1;
    long long v49 = (unint64_t)v7;
    v50[0] = 1;
    *(void *)&v50[160] = *((void *)&v39 + 1);
    *(_OWORD *)&v50[33] = *(_OWORD *)&v41[32];
    sub_257D8D818((uint64_t)&v49);
  }
  sub_257D871E4((uint64_t)&v49, (uint64_t)v46, &qword_26A05DA58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DA68);
  sub_257D87A20(&qword_26A05DA70, &qword_26A05DA60);
  sub_257D87A20(&qword_26A05DA78, &qword_26A05DA68);
  sub_257D94AC0();
  sub_257D94D60();
  sub_257D94810();
  *(_OWORD *)&v50[144] = v68;
  *(_OWORD *)&v50[160] = v69;
  long long v8 = v64;
  *(_OWORD *)&v50[80] = v64;
  *(_OWORD *)&v50[96] = v65;
  long long v9 = v66;
  *(_OWORD *)&v50[112] = v66;
  *(_OWORD *)&v50[128] = v67;
  long long v10 = v60;
  *(_OWORD *)&v50[16] = v60;
  *(_OWORD *)&v50[32] = v61;
  long long v11 = v62;
  *(_OWORD *)&v50[48] = v62;
  *(_OWORD *)&v50[64] = v63;
  long long v12 = v58;
  long long v49 = v58;
  *(_OWORD *)uint64_t v50 = v59;
  long long v13 = v69;
  v46[10] = v68;
  v46[11] = v69;
  long long v14 = v65;
  v46[6] = v64;
  v46[7] = v65;
  long long v15 = v67;
  v46[8] = v66;
  v46[9] = v67;
  long long v16 = v61;
  v46[2] = v60;
  v46[3] = v61;
  long long v17 = v63;
  v46[4] = v62;
  v46[5] = v63;
  long long v18 = v59;
  v46[0] = v58;
  v46[1] = v59;
  *(_OWORD *)(a2 + 224) = v68;
  *(_OWORD *)(a2 + 240) = v13;
  *(_OWORD *)(a2 + 160) = v8;
  *(_OWORD *)(a2 + 176) = v14;
  *(_OWORD *)(a2 + 192) = v9;
  *(_OWORD *)(a2 + 208) = v15;
  *(_OWORD *)(a2 + 96) = v10;
  *(_OWORD *)(a2 + 112) = v16;
  *(_OWORD *)(a2 + 128) = v11;
  *(_OWORD *)(a2 + 144) = v17;
  uint64_t v19 = *(void *)v41;
  char v20 = v41[8];
  uint64_t v21 = *(void *)&v41[16];
  char v22 = v41[24];
  char v51 = v70;
  char v47 = v70;
  LOBYTE(v30) = 1;
  char v48 = v25;
  char v45 = v5;
  *(unsigned char *)(a2 + 256) = v70;
  *(_OWORD *)(a2 + 64) = v12;
  *(_OWORD *)(a2 + 80) = v18;
  char v44 = 1;
  char v43 = v20;
  char v42 = v22;
  char v23 = v48;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v29;
  *(unsigned char *)(a2 + 24) = v23;
  *(void *)(a2 + 32) = v28;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v27;
  *(void *)(a2 + 56) = v26;
  *(void *)(a2 + 264) = 0;
  *(unsigned char *)(a2 + 272) = 1;
  *(void *)(a2 + 280) = v19;
  *(unsigned char *)(a2 + 288) = v20;
  *(void *)(a2 + 296) = v21;
  *(unsigned char *)(a2 + 304) = v22;
  *(_OWORD *)(a2 + 312) = *(_OWORD *)&v41[32];
  sub_257D8D824((uint64_t)v46, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_257D87318);
  return sub_257D8D824((uint64_t)&v49, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_257D8D57C);
}

uint64_t sub_257D8AAEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NotesSiriSingleNoteView() + 52));
  uint64_t v4 = v3[1];
  uint64_t v33 = *v3;
  uint64_t v34 = v4;
  sub_257D8690C();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_257D94BF0();
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_257D94D60();
  sub_257D94810();
  char v11 = v4;
  uint64_t v23 = v35;
  uint64_t v24 = v33;
  char v12 = v36;
  uint64_t v21 = v38;
  uint64_t v22 = v37;
  uint64_t v20 = sub_257D94920();
  sub_257D8ACD4((uint64_t)&v27);
  uint64_t v13 = v27;
  int v14 = v28;
  uint64_t v15 = v29;
  uint64_t v16 = v30;
  char v17 = v31;
  uint64_t v18 = v32;
  LOBYTE(v27) = v10;
  char v43 = 1;
  char v42 = v11;
  char v41 = v12;
  char v40 = 1;
  char v39 = v31;
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = v25;
  *(unsigned char *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v8;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v24;
  *(unsigned char *)(a2 + 56) = v11;
  *(void *)(a2 + 64) = v23;
  *(unsigned char *)(a2 + 72) = v12;
  *(void *)(a2 + 80) = v22;
  *(void *)(a2 + 88) = v21;
  *(void *)(a2 + 96) = v20;
  *(void *)(a2 + 104) = 0;
  *(unsigned char *)(a2 + 112) = 1;
  *(void *)(a2 + 120) = v13;
  *(_DWORD *)(a2 + 128) = v14;
  *(void *)(a2 + 136) = v15;
  *(void *)(a2 + 144) = v16;
  *(unsigned char *)(a2 + 152) = v17;
  *(void *)(a2 + 160) = v18;
  sub_257D868EC(v26, v25, v10);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257D868EC(v15, v16, v17);
  swift_bridgeObjectRetain();
  swift_release();
  sub_257D868FC(v15, v16, v17);
  swift_bridgeObjectRelease();
  sub_257D868FC(v26, v25, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D8ACD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_257D94CF0();
  int v3 = sub_257D94AF0();
  sub_257D946B0();
  sub_257D8690C();
  uint64_t v4 = sub_257D94BF0();
  uint64_t v6 = v5;
  *(void *)a1 = v2;
  *(_DWORD *)(a1 + 8) = v3;
  LOBYTE(v3) = v7 & 1;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v7 & 1;
  *(void *)(a1 + 40) = v8;
  swift_retain();
  sub_257D868EC(v4, v6, v3);
  swift_bridgeObjectRetain();
  sub_257D868FC(v4, v6, v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D8ADB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NotesSiriSingleNoteView() + 52));
  uint64_t v31 = *v3;
  uint64_t v32 = v3[1];
  sub_257D8690C();
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_257D94BF0();
  uint64_t v29 = v4;
  uint64_t v27 = v5;
  char v7 = v6 & 1;
  sub_257D94D60();
  sub_257D94810();
  sub_257D94700();
  uint64_t v8 = sub_257D94BF0();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_257D94B70();
  uint64_t v13 = sub_257D94BA0();
  uint64_t v25 = v14;
  uint64_t v26 = v15;
  char v17 = v16 & 1;
  sub_257D868FC(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_257D94740();
  uint64_t v18 = sub_257D94BF0();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  *(_DWORD *)(a2 + 17) = v30;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v30 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v41;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v41[3];
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v40[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v40;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v39;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v38;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v37;
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v29;
  *(unsigned char *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v31;
  *(unsigned char *)(a2 + 56) = v32;
  *(void *)(a2 + 64) = v33;
  *(unsigned char *)(a2 + 72) = v34;
  *(void *)(a2 + 80) = v35;
  *(void *)(a2 + 88) = v36;
  *(void *)(a2 + 96) = v13;
  *(void *)(a2 + 104) = v25;
  *(unsigned char *)(a2 + 112) = v17;
  *(void *)(a2 + 120) = v26;
  *(void *)(a2 + 128) = v18;
  *(void *)(a2 + 136) = v19;
  *(unsigned char *)(a2 + 144) = v21 & 1;
  *(void *)(a2 + 152) = v23;
  sub_257D868EC(v28, v29, v7);
  swift_bridgeObjectRetain();
  sub_257D868EC(v13, v25, v17);
  swift_bridgeObjectRetain();
  sub_257D868EC(v18, v20, v22);
  swift_bridgeObjectRetain();
  sub_257D868FC(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_257D868FC(v13, v25, v17);
  swift_bridgeObjectRelease();
  sub_257D868FC(v28, v29, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D8B0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v4 = (char *)(a2 + *(int *)(v3 + 40));
  char v5 = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  LOBYTE(v16) = v5;
  uint64_t v17 = v6;
  LOBYTE(v18) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D398);
  sub_257D94D50();
  uint64_t v7 = sub_257D94560();
  if (!v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    return sub_257D8765C((uint64_t)&v18, &qword_26A05D900);
  }
  uint64_t v8 = v7;
  sub_257D94FA0();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_257D8B46C((uint64_t)&v16), (v10 & 1) != 0))
  {
    sub_257D87864(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_257D8CD4C((uint64_t)&v16);
  if (!*((void *)&v19 + 1)) {
    return sub_257D8765C((uint64_t)&v18, &qword_26A05D900);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v12 = v16;
    uint64_t v13 = (uint64_t *)(a2 + *(int *)(v3 + 44));
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    *(void *)&long long v18 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D908);
    return sub_257D94D50();
  }
  return result;
}

uint64_t sub_257D8B240()
{
  return sub_257D94D50();
}

unint64_t static NSNotification.SiriNoteTextViewSizeDidChange.getter()
{
  return 0xD000000000000029;
}

id sub_257D8B2CC()
{
  uint64_t v0 = (void *)sub_257D94E20();
  return v0;
}

unint64_t static NSNotification.SiriNoteIsLong.getter()
{
  return 0xD00000000000001ALL;
}

id sub_257D8B328()
{
  uint64_t v0 = (void *)sub_257D94E20();
  return v0;
}

uint64_t sub_257D8B368()
{
  uint64_t result = sub_257D94E20();
  qword_26A05D8B0 = result;
  return result;
}

id static NSNotificationName.SiriNoteTextViewSizeDidChange.getter()
{
  return sub_257D8B420(&qword_26A05D308, (void **)&qword_26A05D8B0);
}

uint64_t sub_257D8B3C4()
{
  uint64_t result = sub_257D94E20();
  qword_26A05D8B8 = result;
  return result;
}

id static NSNotificationName.SiriNoteIsLong.getter()
{
  return sub_257D8B420(&qword_26A05D310, (void **)&qword_26A05D8B8);
}

id sub_257D8B420(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

unint64_t sub_257D8B46C(uint64_t a1)
{
  uint64_t v2 = sub_257D94F80();
  return sub_257D8B4B0(a1, v2);
}

unint64_t sub_257D8B4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_257D8CDA0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2C25F0](v9, a1);
      sub_257D8CD4C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_257D8B578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_257D8B5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_257D8B644(uint64_t a1, void (*a2)(uint64_t))
{
  type metadata accessor for NotesSiriSingleNoteView();
  sub_257D88150(a1, a2);
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

uint64_t sub_257D8B6E8(uint64_t a1)
{
  return sub_257D8B71C(a1, sub_257D8B0B0);
}

uint64_t sub_257D8B704(uint64_t a1)
{
  return sub_257D8B71C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_257D8B240);
}

uint64_t sub_257D8B71C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for NotesSiriSingleNoteView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_257D8B7A0()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for NotesSiriSingleNoteView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v8 = a3[7];
    __dst = (void *)(a1 + v8);
    unint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = sub_257D94610();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v15 = a3[8];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v18 = sub_257D94DE0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v20 = (char *)v4 + v19;
    char v21 = (char *)a2 + v19;
    char *v20 = *v21;
    *((void *)v20 + 1) = *((void *)v21 + 1);
    uint64_t v22 = a3[11];
    uint64_t v23 = a3[12];
    uint64_t v24 = (void *)((char *)v4 + v22);
    uint64_t v25 = (uint64_t *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (char *)v4 + v23;
    uint64_t v28 = (char *)a2 + v23;
    char *v27 = *v28;
    *((void *)v27 + 1) = *((void *)v28 + 1);
    uint64_t v29 = a3[13];
    uint64_t v30 = a3[14];
    uint64_t v31 = (void *)((char *)v4 + v29);
    uint64_t v32 = (uint64_t *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    *((unsigned char *)v4 + v30) = *((unsigned char *)a2 + v30);
    uint64_t v34 = a3[16];
    *((unsigned char *)v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *(void *)((char *)v4 + v34) = *(uint64_t *)((char *)a2 + v34);
    uint64_t v35 = a3[18];
    *(void *)((char *)v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    *(void *)((char *)v4 + v35) = *(uint64_t *)((char *)a2 + v35);
    uint64_t v36 = a3[19];
    uint64_t v37 = (char *)v4 + v36;
    uint64_t v38 = (uint64_t)a2 + v36;
    uint64_t v39 = *(uint64_t *)((char *)a2 + v36 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v39)
    {
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = v39;
      *((_OWORD *)v37 + 1) = *(_OWORD *)(v38 + 16);
      v37[32] = *(unsigned char *)(v38 + 32);
      uint64_t v40 = *(void *)(v38 + 48);
      *((void *)v37 + 5) = *(void *)(v38 + 40);
      *((void *)v37 + 6) = v40;
      char v42 = *(void **)(v38 + 56);
      uint64_t v41 = *(void *)(v38 + 64);
      *((void *)v37 + 7) = v42;
      *((void *)v37 + 8) = v41;
      swift_bridgeObjectRetain();
      swift_retain();
      id v43 = v42;
    }
    else
    {
      long long v44 = *(_OWORD *)(v38 + 48);
      *((_OWORD *)v37 + 2) = *(_OWORD *)(v38 + 32);
      *((_OWORD *)v37 + 3) = v44;
      *((void *)v37 + 8) = *(void *)(v38 + 64);
      long long v45 = *(_OWORD *)(v38 + 16);
      *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
      *((_OWORD *)v37 + 1) = v45;
    }
    *((void *)v37 + 9) = *(void *)(v38 + 72);
  }
  swift_retain();
  return v4;
}

uint64_t destroy for NotesSiriSingleNoteView(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_257D94610();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[8];
  uint64_t v8 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[19];
  if (*(void *)(v9 + 8))
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_release();
}

uint64_t initializeWithCopy for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = a3[7];
  __dst = (void *)(a1 + v7);
  uint64_t v8 = (const void *)(a2 + v7);
  uint64_t v9 = sub_257D94610();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  uint64_t v20 = a3[11];
  uint64_t v21 = a3[12];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a1 + v21;
  uint64_t v26 = a2 + v21;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  uint64_t v27 = a3[13];
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  void *v29 = *v30;
  v29[1] = v31;
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v32 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);
  uint64_t v33 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  uint64_t v34 = a3[19];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void *)(a2 + v34 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v37)
  {
    *(void *)uint64_t v35 = *(void *)v36;
    *(void *)(v35 + 8) = v37;
    *(_OWORD *)(v35 + 16) = *(_OWORD *)(v36 + 16);
    *(unsigned char *)(v35 + 32) = *(unsigned char *)(v36 + 32);
    uint64_t v38 = *(void *)(v36 + 48);
    *(void *)(v35 + 40) = *(void *)(v36 + 40);
    *(void *)(v35 + 48) = v38;
    uint64_t v40 = *(void **)(v36 + 56);
    uint64_t v39 = *(void *)(v36 + 64);
    *(void *)(v35 + 56) = v40;
    *(void *)(v35 + 64) = v39;
    swift_bridgeObjectRetain();
    swift_retain();
    id v41 = v40;
  }
  else
  {
    long long v42 = *(_OWORD *)(v36 + 48);
    *(_OWORD *)(v35 + 32) = *(_OWORD *)(v36 + 32);
    *(_OWORD *)(v35 + 48) = v42;
    *(void *)(v35 + 64) = *(void *)(v36 + 64);
    long long v43 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    *(_OWORD *)(v35 + 16) = v43;
  }
  *(void *)(v35 + 72) = *(void *)(v36 + 72);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_257D94610();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  uint64_t v25 = a3[12];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  *(unsigned char *)uint64_t v26 = *(unsigned char *)v27;
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  void *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  uint64_t v31 = a3[19];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)(a1 + v31 + 8);
  uint64_t v35 = *(void *)(v33 + 8);
  if (v34)
  {
    if (v35)
    {
      *(void *)uint64_t v32 = *(void *)v33;
      *(void *)(v32 + 8) = *(void *)(v33 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v32 + 16) = *(void *)(v33 + 16);
      *(void *)(v32 + 24) = *(void *)(v33 + 24);
      *(unsigned char *)(v32 + 32) = *(unsigned char *)(v33 + 32);
      *(void *)(v32 + 40) = *(void *)(v33 + 40);
      swift_retain();
      swift_release();
      *(void *)(v32 + 48) = *(void *)(v33 + 48);
      uint64_t v36 = *(void **)(v33 + 56);
      uint64_t v37 = *(void **)(v32 + 56);
      *(void *)(v32 + 56) = v36;
      id v38 = v36;

      *(void *)(v32 + 64) = *(void *)(v33 + 64);
    }
    else
    {
      sub_257D8C36C(v32);
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
      long long v42 = *(_OWORD *)(v33 + 32);
      long long v41 = *(_OWORD *)(v33 + 48);
      long long v43 = *(_OWORD *)(v33 + 16);
      *(void *)(v32 + 64) = *(void *)(v33 + 64);
      *(_OWORD *)(v32 + 32) = v42;
      *(_OWORD *)(v32 + 48) = v41;
      *(_OWORD *)(v32 + 16) = v43;
    }
  }
  else if (v35)
  {
    *(void *)uint64_t v32 = *(void *)v33;
    *(void *)(v32 + 8) = *(void *)(v33 + 8);
    *(void *)(v32 + 16) = *(void *)(v33 + 16);
    *(void *)(v32 + 24) = *(void *)(v33 + 24);
    *(unsigned char *)(v32 + 32) = *(unsigned char *)(v33 + 32);
    *(void *)(v32 + 40) = *(void *)(v33 + 40);
    *(void *)(v32 + 48) = *(void *)(v33 + 48);
    uint64_t v39 = *(void **)(v33 + 56);
    *(void *)(v32 + 56) = v39;
    *(void *)(v32 + 64) = *(void *)(v33 + 64);
    swift_bridgeObjectRetain();
    swift_retain();
    id v40 = v39;
  }
  else
  {
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
    long long v44 = *(_OWORD *)(v33 + 16);
    long long v45 = *(_OWORD *)(v33 + 32);
    long long v46 = *(_OWORD *)(v33 + 48);
    *(void *)(v32 + 64) = *(void *)(v33 + 64);
    *(_OWORD *)(v32 + 32) = v45;
    *(_OWORD *)(v32 + 48) = v46;
    *(_OWORD *)(v32 + 16) = v44;
  }
  *(void *)(v32 + 72) = *(void *)(v33 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_257D8C36C(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_257D94610();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v17 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  uint64_t v18 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  uint64_t v19 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v20 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v21 = a3[19];
  uint64_t v22 = (_OWORD *)(a1 + v21);
  uint64_t v23 = (_OWORD *)(a2 + v21);
  long long v24 = v23[3];
  v22[2] = v23[2];
  v22[3] = v24;
  v22[4] = v23[4];
  long long v25 = v23[1];
  _OWORD *v22 = *v23;
  v22[1] = v25;
  return a1;
}

uint64_t assignWithTake for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_257D94610();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(unsigned char *)uint64_t v21 = *(unsigned char *)v22;
  *(void *)(v21 + 8) = *(void *)(v22 + 8);
  swift_release();
  uint64_t v23 = a3[11];
  long long v24 = (void *)(a1 + v23);
  long long v25 = (void *)(a2 + v23);
  *long long v24 = *v25;
  v24[1] = v25[1];
  swift_release();
  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  swift_release();
  uint64_t v29 = a3[13];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + v34) = *(unsigned char *)(a2 + v34);
  uint64_t v35 = a3[17];
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(void *)(a1 + v35) = *(void *)(a2 + v35);
  uint64_t v36 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  if (!*(void *)(a1 + v36 + 8))
  {
LABEL_11:
    long long v41 = *(_OWORD *)(v38 + 48);
    *(_OWORD *)(v37 + 32) = *(_OWORD *)(v38 + 32);
    *(_OWORD *)(v37 + 48) = v41;
    *(void *)(v37 + 64) = *(void *)(v38 + 64);
    long long v42 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    *(_OWORD *)(v37 + 16) = v42;
    goto LABEL_12;
  }
  uint64_t v39 = *(void *)(v38 + 8);
  if (!v39)
  {
    sub_257D8C36C(a1 + v36);
    goto LABEL_11;
  }
  *(void *)uint64_t v37 = *(void *)v38;
  *(void *)(v37 + 8) = v39;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v37 + 16) = *(_OWORD *)(v38 + 16);
  *(unsigned char *)(v37 + 32) = *(unsigned char *)(v38 + 32);
  *(void *)(v37 + 40) = *(void *)(v38 + 40);
  swift_release();
  *(void *)(v37 + 48) = *(void *)(v38 + 48);
  id v40 = *(void **)(v37 + 56);
  *(void *)(v37 + 56) = *(void *)(v38 + 56);

  *(void *)(v37 + 64) = *(void *)(v38 + 64);
LABEL_12:
  *(void *)(v37 + 72) = *(void *)(v38 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257D8C924);
}

uint64_t sub_257D8C924(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_257D94DE0();
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257D8CA68);
}

uint64_t sub_257D8CA68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_257D94DE0();
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_257D8CB98()
{
  sub_257D8CCB8();
  if (v0 <= 0x3F)
  {
    sub_257D94DE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_257D8CCB8()
{
  if (!qword_26A05DAD0)
  {
    sub_257D94610();
    unint64_t v0 = sub_257D94F50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A05DAD0);
    }
  }
}

uint64_t sub_257D8CD10()
{
  return sub_257D87A20(&qword_26A05D8F8, &qword_26A05D8E0);
}

uint64_t sub_257D8CD4C(uint64_t a1)
{
  return a1;
}

uint64_t sub_257D8CDA0(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_257D8CE04()
{
  unint64_t result = qword_26A05D958;
  if (!qword_26A05D958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D960);
    sub_257D8CEA4();
    sub_257D87A20(&qword_26A05D970, &qword_26A05D978);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D958);
  }
  return result;
}

unint64_t sub_257D8CEA4()
{
  unint64_t result = qword_26A05D968;
  if (!qword_26A05D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D968);
  }
  return result;
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

uint64_t sub_257D8CF60(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_257D8CFBC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_257D8D038()
{
  unint64_t result = qword_26A05D9F0;
  if (!qword_26A05D9F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D9B8);
    sub_257D7DDB0();
    swift_getOpaqueTypeConformance2();
    sub_257D8D110((unint64_t *)&qword_26A05D560, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D9F0);
  }
  return result;
}

uint64_t sub_257D8D110(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_257D8D158()
{
  unint64_t result = qword_26A05D9F8;
  if (!qword_26A05D9F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D9E0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DA00);
    sub_257D8CFBC(&qword_26A05DA08, &qword_26A05DA00, (void (*)(void))sub_257D8D26C);
    swift_getOpaqueTypeConformance2();
    sub_257D8D110((unint64_t *)&qword_26A05D560, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05D9F8);
  }
  return result;
}

unint64_t sub_257D8D26C()
{
  unint64_t result = qword_26A05DA10;
  if (!qword_26A05DA10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DA18);
    sub_257D8D30C();
    sub_257D87A20(&qword_26A05D740, &qword_26A05D748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DA10);
  }
  return result;
}

unint64_t sub_257D8D30C()
{
  unint64_t result = qword_26A05DA20;
  if (!qword_26A05DA20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DA28);
    sub_257D8D3AC();
    sub_257D87A20(&qword_26A05D758, &qword_26A05D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DA20);
  }
  return result;
}

unint64_t sub_257D8D3AC()
{
  unint64_t result = qword_26A05DA30;
  if (!qword_26A05DA30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DA38);
    sub_257D87A20(&qword_26A05DA40, &qword_26A05DA48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DA30);
  }
  return result;
}

unint64_t sub_257D8D44C()
{
  unint64_t result = qword_26A05DA50;
  if (!qword_26A05DA50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D9C8);
    sub_257D8CFBC(&qword_26A05D9E8, &qword_26A05D9C0, (void (*)(void))sub_257D8D038);
    sub_257D8D038();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DA50);
  }
  return result;
}

uint64_t sub_257D8D4F4(uint64_t a1)
{
  sub_257D8D57C(*(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), *(void *)(a1 + 232), *(void *)(a1 + 240), *(void *)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 264), *(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 288), *(void *)(a1 + 296),
    *(void *)(a1 + 304),
    *(void *)(a1 + 312),
    *(void *)(a1 + 320),
    *(void *)(a1 + 328),
    *(void *)(a1 + 336),
    *(unsigned char *)(a1 + 344));
  return a1;
}

uint64_t sub_257D8D57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  sub_257D868FC(a4, a5, a6 & 1);
  if (a25)
  {
    swift_bridgeObjectRelease();
    sub_257D868FC(a16, a17, a18 & 1);
    swift_bridgeObjectRelease();
    sub_257D868FC(a20, a21, a22 & 1);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_257D868FC(a21, a22, a23 & 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D8D67C(uint64_t a1)
{
  sub_257D8D57C(*(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), *(void *)(a1 + 232), *(void *)(a1 + 240), *(void *)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 264), *(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 288), *(void *)(a1 + 296), *(void *)(a1 + 304), *(void *)(a1 + 312), *(void *)(a1 + 320),
    *(void *)(a1 + 328),
    *(void *)(a1 + 336),
    *(void *)(a1 + 344),
    *(void *)(a1 + 352),
    *(void *)(a1 + 360),
    *(unsigned char *)(a1 + 368));
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_257D8D714(uint64_t a1)
{
  sub_257D8D57C(*(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    *(unsigned char *)(a1 + 256));
  return a1;
}

uint64_t sub_257D8D78C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 280);
  a2(*(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), *(void *)(a1 + 224), *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    *(void *)(a1 + 256),
    *(void *)(a1 + 264),
    *(void *)(a1 + 272),
    v4);
  return a1;
}

uint64_t sub_257D8D818(uint64_t result)
{
  *(unsigned char *)(result + 192) = 1;
  return result;
}

uint64_t sub_257D8D824(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 192);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    v4);
  return a1;
}

uint64_t sub_257D8D8A0(uint64_t result)
{
  *(unsigned char *)(result + 192) = 0;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)type metadata accessor for NotesSiriSingleNoteView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[7];
  uint64_t v7 = sub_257D94610();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = v5 + v1[8];
  uint64_t v10 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = v5 + v1[19];
  if (*(void *)(v11 + 8))
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_257D8DAA4()
{
  uint64_t v1 = *(void *)(type metadata accessor for NotesSiriSingleNoteView() - 8);
  return sub_257D887BC(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_257D8DAF8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_257D8DB08()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_257D8DB40(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_257D8DB58()
{
  uint64_t v0 = sub_257D947D0();
  __swift_allocate_value_buffer(v0, qword_26A05DA90);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A05DA90);
  return sub_257D947B0();
}

uint64_t sub_257D8DBA4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_257D8DC10()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_257D8DC68(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D877B0(a1, (uint64_t)v6, &qword_26A05D428);
  uint64_t v7 = *a2 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  sub_257D91BA4((uint64_t)v6, v7, &qword_26A05D428);
  return swift_endAccess();
}

uint64_t sub_257D8DD34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  return sub_257D877B0(v3, a1, &qword_26A05D428);
}

uint64_t sub_257D8DD90(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = sub_257D8519C(a1, v11, a4, a5, v10);

  swift_bridgeObjectRelease();
  return v12;
}

void sub_257D8DE24(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t *a6@<X8>)
{
  v121 = a6;
  uint64_t v115 = a4;
  v116 = a5;
  uint64_t v114 = a3;
  id v111 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v117 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v108 - v10;
  uint64_t v12 = sub_257D94610();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v120 = (char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v112 = (char *)&v108 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v110 = (char *)&v108 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v108 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  v113 = (char *)&v108 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v108 - v25;
  uint64_t v28 = *a1;
  unint64_t v27 = a1[1];
  sub_257D94600();
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v29(v11, 1, v12) == 1)
  {
    sub_257D8765C((uint64_t)v11, &qword_26A05D428);
    if (qword_26A05D318 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_257D947D0();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A05DA90);
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_257D947C0();
    os_log_type_t v32 = sub_257D94ED0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      v124 = (void *)v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_257D84890(v28, v27, (uint64_t *)&v124);
      sub_257D94F60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_257D79000, v31, v32, "URL invalid with identifier: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C2BB0](v34, -1, -1);
      MEMORY[0x25A2C2BB0](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_26;
  }
  uint64_t v119 = v13;
  uint64_t v35 = *(void (**)(char *, char *))(v13 + 32);
  uint64_t v118 = v12;
  v35(v26, v11);
  uint64_t v36 = self;
  uint64_t v37 = (void *)sub_257D945E0();
  unsigned int v38 = objc_msgSend(v36, sel_isShowHTMLNoteURL_, v37);

  if (!v38)
  {
LABEL_16:
    uint64_t v56 = (void *)sub_257D945E0();
    unsigned int v57 = objc_msgSend(v36, sel_isShowNoteURL_, v56);

    if (v57
      && (long long v58 = (void *)sub_257D945E0(),
          id v59 = objc_msgSend(v36, sel_NotesAppIDForNoteMentionedInURL_, v58),
          v58,
          v59))
    {
      uint64_t v60 = sub_257D94E30();
      uint64_t v62 = v61;

      MEMORY[0x270FA5388](v63);
      *(&v108 - 4) = v60;
      *(&v108 - 3) = v62;
      long long v64 = v116;
      *(&v108 - 2) = (uint64_t)v116;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DAF0);
      uint64_t v65 = v122;
      sub_257D94F10();
      swift_bridgeObjectRelease();
      long long v66 = v124;
      if (v124)
      {
        type metadata accessor for NoteViewModel();
        uint64_t v51 = swift_allocObject();
        uint64_t v67 = v115;
        swift_bridgeObjectRetain();
        id v68 = v64;
        sub_257D8ECCC(v66, v68, v114, v67);
        (*(void (**)(char *, uint64_t))(v119 + 8))(v26, v118);
        goto LABEL_27;
      }
      uint64_t v72 = v118;
      if (qword_26A05D318 != -1) {
        swift_once();
      }
      uint64_t v84 = sub_257D947D0();
      __swift_project_value_buffer(v84, (uint64_t)qword_26A05DA90);
      uint64_t v85 = v119;
      uint64_t v86 = v112;
      (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v112, v26, v72);
      uint64_t v87 = sub_257D947C0();
      os_log_type_t v88 = sub_257D94ED0();
      if (os_log_type_enabled(v87, v88))
      {
        uint64_t v89 = (uint8_t *)swift_slowAlloc();
        uint64_t v90 = swift_slowAlloc();
        v124 = (void *)v90;
        v109 = v26;
        *(_DWORD *)uint64_t v89 = 136315138;
        uint64_t v122 = v65;
        sub_257D91A6C();
        uint64_t v91 = sub_257D95010();
        uint64_t v123 = sub_257D84890(v91, v92, (uint64_t *)&v124);
        sub_257D94F60();
        swift_bridgeObjectRelease();
        uint64_t v93 = *(void (**)(char *, uint64_t))(v85 + 8);
        v93(v112, v72);
        _os_log_impl(&dword_257D79000, v87, v88, "Modern note not found with url: %s", v89, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2C2BB0](v90, -1, -1);
        MEMORY[0x25A2C2BB0](v89, -1, -1);

        v93(v109, v72);
        goto LABEL_26;
      }

      uint64_t v80 = *(void (**)(char *, uint64_t))(v85 + 8);
      v80(v86, v72);
      unsigned __int8 v81 = v26;
    }
    else
    {
      if (qword_26A05D318 != -1) {
        swift_once();
      }
      uint64_t v69 = sub_257D947D0();
      __swift_project_value_buffer(v69, (uint64_t)qword_26A05DA90);
      uint64_t v70 = v119;
      uint64_t v71 = v120;
      uint64_t v72 = v118;
      (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v120, v26, v118);
      uint64_t v73 = sub_257D947C0();
      os_log_type_t v74 = sub_257D94ED0();
      if (!os_log_type_enabled(v73, v74))
      {

        uint64_t v82 = *(void (**)(char *, uint64_t))(v70 + 8);
        v82(v71, v72);
        v82(v26, v72);
        goto LABEL_26;
      }
      uint64_t v75 = (uint8_t *)swift_slowAlloc();
      uint64_t v76 = swift_slowAlloc();
      v109 = v26;
      uint64_t v77 = v76;
      v124 = (void *)v76;
      *(_DWORD *)uint64_t v75 = 136315138;
      sub_257D91A6C();
      uint64_t v78 = sub_257D95010();
      uint64_t v123 = sub_257D84890(v78, v79, (uint64_t *)&v124);
      sub_257D94F60();
      swift_bridgeObjectRelease();
      uint64_t v80 = *(void (**)(char *, uint64_t))(v119 + 8);
      v80(v120, v72);
      _os_log_impl(&dword_257D79000, v73, v74, "UUID invalid: %s", v75, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C2BB0](v77, -1, -1);
      MEMORY[0x25A2C2BB0](v75, -1, -1);

      unsigned __int8 v81 = v109;
    }
    v80(v81, v72);
LABEL_26:
    uint64_t v51 = 0;
    goto LABEL_27;
  }
  v109 = v26;
  uint64_t v39 = (void *)sub_257D945E0();
  id v40 = objc_msgSend(v36, sel_objectIDURIRepresentationForHTMLNoteMentionedInURL_, v39);

  if (!v40)
  {
    uint64_t v42 = (uint64_t)v117;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v119 + 56))(v117, 1, 1, v118);
    goto LABEL_14;
  }
  sub_257D945F0();

  uint64_t v42 = (uint64_t)v117;
  uint64_t v41 = v118;
  ((void (*)(char *, char *, uint64_t))v35)(v117, v22, v118);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v119 + 56))(v42, 0, 1, v41);
  if (v29((char *)v42, 1, v41) == 1)
  {
LABEL_14:
    sub_257D8765C(v42, &qword_26A05D428);
LABEL_15:
    uint64_t v26 = v109;
    goto LABEL_16;
  }
  long long v43 = v113;
  uint64_t v44 = v118;
  ((void (*)(char *, uint64_t, uint64_t))v35)(v113, v42, v118);
  long long v45 = (void *)sub_257D945E0();
  id v46 = v111;
  char v47 = (char *)objc_msgSend(v111, sel_ic_objectIDFromURL_, v45);

  if (!v47)
  {
    (*(void (**)(char *, uint64_t))(v119 + 8))(v43, v44);
    goto LABEL_15;
  }
  MEMORY[0x270FA5388](v48);
  *(&v108 - 2) = (uint64_t)v46;
  *(&v108 - 1) = (uint64_t)v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DAF8);
  uint64_t v49 = v122;
  sub_257D94F10();
  uint64_t v50 = (uint64_t)v124;
  if (v124)
  {
    type metadata accessor for NoteViewModel();
    uint64_t v51 = swift_allocObject();
    uint64_t v52 = v115;
    swift_bridgeObjectRetain();
    id v53 = v46;
    sub_257D904C8(v50, v53, v114, v52);

    uint64_t v54 = v118;
    char v55 = *(void (**)(char *, uint64_t))(v119 + 8);
    v55(v43, v118);
    v55(v109, v54);
LABEL_27:
    uint64_t v83 = v121;
    goto LABEL_28;
  }
  uint64_t v122 = v49;
  uint64_t v94 = v118;
  uint64_t v95 = v109;
  if (qword_26A05D318 != -1) {
    swift_once();
  }
  uint64_t v96 = sub_257D947D0();
  __swift_project_value_buffer(v96, (uint64_t)qword_26A05DA90);
  uint64_t v97 = v119;
  v98 = v110;
  (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v110, v95, v94);
  v99 = sub_257D947C0();
  os_log_type_t v100 = sub_257D94ED0();
  if (os_log_type_enabled(v99, v100))
  {
    v101 = v98;
    v102 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = swift_slowAlloc();
    v124 = (void *)v103;
    v120 = v47;
    *(_DWORD *)v102 = 136315138;
    v117 = (char *)(v102 + 4);
    sub_257D91A6C();
    uint64_t v104 = sub_257D95010();
    uint64_t v123 = sub_257D84890(v104, v105, (uint64_t *)&v124);
    sub_257D94F60();
    swift_bridgeObjectRelease();
    v106 = *(void (**)(char *, uint64_t))(v97 + 8);
    v106(v101, v94);
    _os_log_impl(&dword_257D79000, v99, v100, "HTML note not found with url: %s", v102, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2C2BB0](v103, -1, -1);
    MEMORY[0x25A2C2BB0](v102, -1, -1);

    v106(v113, v94);
    v106(v109, v94);
  }
  else
  {

    v107 = *(void (**)(char *, uint64_t))(v97 + 8);
    v107(v98, v94);
    v107(v43, v94);
    v107(v95, v94);
  }
  uint64_t v51 = 0;
  uint64_t v83 = v121;
LABEL_28:
  *uint64_t v83 = v51;
}

void sub_257D8EBB0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v4 = objc_msgSend(a1, sel_ic_existingObjectWithID_, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_dynamicCastObjCProtocolConditional();
    if (v6)
    {
      *a3 = v6;
      return;
    }
  }
  *a3 = 0;
}

void sub_257D8EC2C(uint64_t a1@<X2>, void *a2@<X8>)
{
  sub_257D7DFCC(0, &qword_26A05D430);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v5 = (void *)sub_257D94E20();
  id v6 = objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v5, a1);

  *a2 = v6;
}

uint64_t sub_257D8ECCC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_257D945C0();
  uint64_t v9 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  uint64_t v10 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *uint64_t v10 = 0;
  v10[1] = 0xE000000000000000;
  id v11 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *id v11 = 0;
  v11[1] = 0xE000000000000000;
  uint64_t v12 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *uint64_t v12 = 0;
  v12[1] = 0xE000000000000000;
  sub_257D94640();
  sub_257D94640();
  uint64_t v13 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *uint64_t v13 = 0;
  v13[1] = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 1;
  uint64_t v14 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  uint64_t v15 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  uint64_t v17 = sub_257D94570();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  v18(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, 1, 1, v17);
  uint64_t v19 = (void *)swift_allocObject();
  void v19[2] = a1;
  void v19[3] = v4;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a2;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_257D91C58;
  *(void *)(v20 + 24) = v19;
  v25[4] = sub_257D91CDC;
  v25[5] = v20;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 1107296256;
  v25[2] = sub_257D904A0;
  v25[3] = &block_descriptor_67;
  uint64_t v21 = _Block_copy(v25);
  id v22 = a1;
  swift_retain();
  id v23 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v23, sel_performBlockAndWait_, v21);

  _Block_release(v21);
  LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v23 & 1) == 0) {
    return v4;
  }
  __break(1u);
  return result;
}

void sub_257D8F004(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v141 = a5;
  uint64_t v142 = a3;
  uint64_t v143 = a4;
  uint64_t v144 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A05DAB0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v140 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v138 = (char *)&v130 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DB60);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v130 - v14;
  uint64_t v16 = sub_257D94650();
  uint64_t v146 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v130 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  id v22 = (char *)&v130 - v21;
  MEMORY[0x270FA5388](v20);
  v145 = (char *)&v130 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  v139 = (char *)&v130 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v130 - v27;
  uint64_t v29 = sub_257D94610();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v130 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  id v147 = a1;
  v148 = (char *)&v130 - v34;
  id v35 = objc_msgSend(a1, sel_identifier);
  if (!v35) {
    return;
  }
  uint64_t v36 = v35;
  uint64_t v137 = v16;
  id v37 = (id)NotesAppURLForNoteIdentifier();

  if (!v37)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v28, 1, 1, v29);
    goto LABEL_13;
  }
  sub_257D945F0();

  unsigned int v38 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v38(v28, v33, v29);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v28, 0, 1, v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
  {
LABEL_13:
    uint64_t v83 = &qword_26A05D428;
    uint64_t v84 = (uint64_t)v28;
LABEL_14:
    sub_257D8765C(v84, v83);
    return;
  }
  v136 = v19;
  uint64_t v39 = v148;
  v38(v148, v28, v29);
  id v40 = v147;
  id v41 = objc_msgSend(v147, sel_title);
  if (!v41)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v39, v29);
    return;
  }
  uint64_t v42 = v41;
  uint64_t v134 = sub_257D94E30();
  uint64_t v44 = v43;

  id v45 = objc_msgSend(v40, sel_folder);
  if (!v45)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v148, v29);
    swift_bridgeObjectRelease();
    return;
  }
  id v46 = v45;
  id v135 = v44;
  id v47 = objc_msgSend(v40, sel_creationDate);
  if (!v47)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v146 + 56))(v15, 1, 1, v137);
    goto LABEL_20;
  }
  uint64_t v48 = v47;
  sub_257D94630();

  uint64_t v49 = v146;
  uint64_t v50 = v137;
  v133 = *(void (**)(char *, char *, uint64_t))(v146 + 32);
  v133(v15, v22, v137);
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
  uint64_t v132 = v49 + 56;
  v131 = v51;
  v51(v15, 0, 1, v50);
  v130 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
  if (v130(v15, 1, v50) == 1)
  {
LABEL_20:

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v148, v29);
    uint64_t v83 = &qword_26A05DB60;
    uint64_t v84 = (uint64_t)v15;
    goto LABEL_14;
  }
  v133(v145, v15, v50);
  id v52 = objc_msgSend(v147, sel_modificationDate);
  if (!v52)
  {
    v131(v13, 1, 1, v50);
    char v55 = v148;
    goto LABEL_22;
  }
  id v53 = v52;
  sub_257D94630();

  v133(v13, v22, v50);
  v131(v13, 0, 1, v50);
  unsigned int v54 = v130(v13, 1, v50);
  char v55 = v148;
  if (v54 == 1)
  {
LABEL_22:

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v145, v50);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v55, v29);
    uint64_t v83 = &qword_26A05DB60;
    uint64_t v84 = (uint64_t)v13;
    goto LABEL_14;
  }
  v133(v136, v13, v50);
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v33, v55, v29);
  uint64_t v56 = v144;
  uint64_t v57 = v144 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 40))(v57, v33, v29);
  swift_endAccess();
  long long v58 = (uint64_t *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  uint64_t v59 = v134;
  uint64_t v134 = (uint64_t)v58;
  uint64_t v60 = (uint64_t)v135;
  uint64_t *v58 = v59;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  id v61 = objc_msgSend(v46, sel_localizedTitle);
  uint64_t v62 = sub_257D94E30();
  uint64_t v64 = v63;

  uint64_t v65 = (uint64_t *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *uint64_t v65 = v62;
  v65[1] = v64;
  swift_bridgeObjectRelease();
  id v135 = v46;
  id v66 = objc_msgSend(v46, sel_account);
  id v67 = objc_msgSend(v66, sel_localizedName);

  uint64_t v68 = sub_257D94E30();
  uint64_t v70 = v69;

  uint64_t v71 = (uint64_t *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *uint64_t v71 = v68;
  v71[1] = v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = v146;
  uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v146 + 16);
  v73(v22, v145, v137);
  uint64_t v74 = v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  swift_beginAccess();
  uint64_t v75 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 40);
  v75(v74, v22, v137);
  swift_endAccess();
  v73(v22, v136, v137);
  uint64_t v76 = v137;
  uint64_t v77 = v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
  swift_beginAccess();
  v75(v77, v22, v76);
  swift_endAccess();
  id v78 = objc_msgSend(self, sel_dateForCurrentSortTypeAccessibilityStringForNote_folderNoteSortType_, v147, 0);
  if (v78)
  {
    unint64_t v79 = v78;
    uint64_t v80 = sub_257D94E30();
    unint64_t v82 = v81;
  }
  else
  {
    uint64_t v80 = 0;
    unint64_t v82 = 0xE000000000000000;
  }
  uint64_t v85 = v143;
  uint64_t v86 = (uint64_t *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *uint64_t v86 = v80;
  v86[1] = v82;
  swift_bridgeObjectRelease();
  id v87 = v147;
  id v88 = objc_msgSend(v147, sel_contentInfoText);
  uint64_t v89 = sub_257D94E30();
  uint64_t v91 = v90;

  unint64_t v92 = (uint64_t *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  uint64_t *v92 = v89;
  v92[1] = v91;
  swift_bridgeObjectRelease();
  unsigned __int8 v93 = objc_msgSend(v87, sel_isPasswordProtected);
  *(unsigned char *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = v93;
  unsigned __int8 v94 = objc_msgSend(v87, sel_isAuthenticated);
  *(unsigned char *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = v94;
  unsigned __int8 v95 = objc_msgSend(v87, sel_isUnsupported);
  *(unsigned char *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = v95;
  unsigned __int8 v96 = objc_msgSend(v87, sel_isSharedViaICloud);
  *(unsigned char *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = v96;
  unsigned __int8 v97 = objc_msgSend(v87, sel_hasUnreadChanges);
  *(unsigned char *)(v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = v97;
  if (!v85) {
    goto LABEL_30;
  }
  id v98 = objc_msgSend(v87, sel_noteAsPlainTextWithoutTitle);
  if (!v98)
  {
    sub_257D94E30();
    id v98 = (id)sub_257D94E20();
    swift_bridgeObjectRelease();
  }
  id v99 = objc_msgSend(v98, sel_ic_whitespaceAndNewlineCoalescedString);

  sub_257D94E30();
  id v100 = objc_allocWithZone(MEMORY[0x263F5B450]);
  swift_bridgeObjectRetain();
  v101 = (void *)sub_257D94E20();
  swift_bridgeObjectRelease();
  id v102 = objc_msgSend(v100, sel_initWithSearchString_, v101);

  uint64_t v103 = (void *)sub_257D94E20();
  id v104 = objc_msgSend(v102, sel_firstMatchInDocumentWithGlobalFallback_, v103);

  unint64_t v105 = (void (*)(char *, char *, uint64_t))self;
  v106 = (void *)sub_257D94E20();
  v107 = self;
  id v108 = objc_msgSend(v107, sel_ICTintColor);
  v133 = v105;
  id v109 = objc_msgSend(v105, sel_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v106, 0, v104, v108, v102, 0.0, 0.0, 286.0, 20.0);

  if (!v109)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v110 = (uint64_t)v138;
  sub_257D94580();

  uint64_t v111 = sub_257D94570();
  uint64_t v112 = *(void *)(v111 - 8);
  v113 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v112 + 56);
  uint64_t v132 = v111;
  v131 = v113;
  v130 = (unsigned int (*)(char *, uint64_t, uint64_t))(v112 + 56);
  ((void (*)(uint64_t, void, uint64_t))v113)(v110, 0, 1);
  swift_bridgeObjectRelease();
  uint64_t v114 = v144 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
  swift_beginAccess();
  sub_257D91BA4(v110, v114, (uint64_t *)&unk_26A05DAB0);
  swift_endAccess();
  id v115 = objc_allocWithZone(MEMORY[0x263F5B450]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v116 = (void *)sub_257D94E20();
  swift_bridgeObjectRelease();
  id v117 = objc_msgSend(v115, sel_initWithSearchString_, v116);

  uint64_t v118 = (void *)sub_257D94E20();
  id v119 = objc_msgSend(v117, sel_firstMatchInDocumentWithGlobalFallback_, v118);

  v120 = (void *)sub_257D94E20();
  id v121 = objc_msgSend(v107, sel_ICTintColor);
  id v122 = objc_msgSend(v133, sel_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v120, 0, v119, v121, v117, 0.0, 0.0, 286.0, 20.0);

  if (!v122)
  {
LABEL_34:
    __break(1u);
    return;
  }
  uint64_t v123 = (uint64_t)v140;
  sub_257D94580();

  v131((char *)v123, 0, 1, v132);
  swift_bridgeObjectRelease();
  uint64_t v56 = v144;
  uint64_t v124 = v144 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  swift_beginAccess();
  sub_257D91BA4(v123, v124, (uint64_t *)&unk_26A05DAB0);
  swift_endAccess();
  uint64_t v76 = v137;
  id v87 = v147;
LABEL_30:
  objc_msgSend(v87, sel_updateThumbnailAttachmentIdentifier);
  id v125 = objc_msgSend(v87, sel_thumbnailAttachmentIdentifier);
  if (v125)
  {
    v126 = v125;
    sub_257D94E30();

    type metadata accessor for NoteViewModel();
    v127 = v139;
    sub_257D8FF44(v141, v139);
    swift_bridgeObjectRelease();
    uint64_t v128 = v56 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
    swift_beginAccess();
    sub_257D91BA4((uint64_t)v127, v128, &qword_26A05D428);
    swift_endAccess();
  }

  v129 = *(void (**)(char *, uint64_t))(v146 + 8);
  v129(v136, v76);
  v129(v145, v76);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v148, v29);
}

uint64_t sub_257D8FF44@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4 = sub_257D94610();
  uint64_t v35 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D7DFCC(0, &qword_26A05DB68);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v11 = (void *)sub_257D94E20();
  id v12 = objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v11, a1);

  if (!v12)
  {
    if (qword_26A05D318 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_257D947D0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A05DA90);
    id v22 = sub_257D947C0();
    os_log_type_t v23 = sub_257D94ED0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_257D79000, v22, v23, "Cannot create attachment for identifier — returning nil preview image", v24, 2u);
      MEMORY[0x25A2C2BB0](v24, -1, -1);
    }

    goto LABEL_16;
  }
  objc_msgSend(self, sel_ic_scale);
  id v14 = objc_msgSend(v12, sel_attachmentPreviewImageWithMinSize_scale_, 25.0, 25.0, v13);
  if (!v14)
  {
    if (qword_26A05D318 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_257D947D0();
    __swift_project_value_buffer(v25, (uint64_t)qword_26A05DA90);
    uint64_t v26 = sub_257D947C0();
    os_log_type_t v27 = sub_257D94ED0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_257D79000, v26, v27, "Cannot create preview image for attachment — returning nil preview image", v28, 2u);
      MEMORY[0x25A2C2BB0](v28, -1, -1);
    }

LABEL_16:
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56);
    return v29((uint64_t)a2, 1, 1, v4);
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_previewImageURL);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_257D945F0();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v18(v9, v6, v4);
    uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56);
    v19(v9, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v9, 1, v4) != 1)
    {

      v18(a2, v9, v4);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v19)(a2, 0, 1, v4);
    }
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56);
    v19(v9, 1, 1, v4);
  }
  sub_257D8765C((uint64_t)v9, &qword_26A05D428);
  if (qword_26A05D318 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_257D947D0();
  __swift_project_value_buffer(v30, (uint64_t)qword_26A05DA90);
  uint64_t v31 = sub_257D947C0();
  os_log_type_t v32 = sub_257D94ED0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_257D79000, v31, v32, "Cannot get previewImageURL for preview image - returning nil preview image", v33, 2u);
    MEMORY[0x25A2C2BB0](v33, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a2, 1, 1, v4);
}

uint64_t sub_257D904A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_257D904C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_257D945C0();
  uint64_t v9 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  uint64_t v10 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *uint64_t v10 = 0;
  v10[1] = 0xE000000000000000;
  uint64_t v11 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *uint64_t v11 = 0;
  v11[1] = 0xE000000000000000;
  id v12 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *id v12 = 0;
  v12[1] = 0xE000000000000000;
  sub_257D94640();
  sub_257D94640();
  double v13 = (void *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *double v13 = 0;
  v13[1] = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 1;
  uint64_t v14 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  uint64_t v15 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  uint64_t v17 = sub_257D94570();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  v18(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, 1, 1, v17);
  uint64_t v19 = (void *)swift_allocObject();
  void v19[2] = a1;
  void v19[3] = v4;
  v19[4] = a3;
  v19[5] = a4;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_257D91B48;
  *(void *)(v20 + 24) = v19;
  v23[4] = sub_257D91B64;
  v23[5] = v20;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 1107296256;
  v23[2] = sub_257D904A0;
  v23[3] = &block_descriptor_0;
  uint64_t v21 = _Block_copy(v23);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a2, sel_performBlockAndWait_, v21);
  swift_unknownObjectRelease();

  _Block_release(v21);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((a2 & 1) == 0) {
    return v4;
  }
  __break(1u);
  return result;
}

void sub_257D907F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v108 = a3;
  uint64_t v109 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A05DAB0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v106 = (char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v105 = (char *)&v96 - v9;
  uint64_t v10 = sub_257D94650();
  v107 = *(void **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_257D94610();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v22 = (char *)&v96 - v21;
  os_log_type_t v23 = self;
  id v110 = a1;
  id v24 = objc_msgSend(v23, sel_appURLForHTMLNote_, a1);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    goto LABEL_13;
  }
  uint64_t v25 = v24;
  uint64_t v26 = a2;
  sub_257D945F0();

  os_log_type_t v27 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  v27(v15, v20, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
LABEL_13:
    sub_257D8765C((uint64_t)v15, &qword_26A05D428);
    return;
  }
  v27(v22, v15, v16);
  id v28 = v110;
  id v29 = objc_msgSend(v110, sel_title);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v103 = sub_257D94E30();
    id v104 = v31;

    id v32 = objc_msgSend(v28, sel_folder);
    if (v32)
    {
      id v33 = objc_msgSend(v32, sel_name);
      swift_unknownObjectRelease();
      if (v33)
      {
        uint64_t v101 = sub_257D94E30();
        uint64_t v102 = v34;

        id v35 = objc_msgSend(v28, sel_account);
        if (v35)
        {
          id v36 = objc_msgSend(v35, sel_localizedName);
          swift_unknownObjectRelease();
          if (v36)
          {
            uint64_t v99 = sub_257D94E30();
            uint64_t v38 = v37;

            uint64_t v112 = &unk_2706BFF18;
            id v100 = (id)swift_dynamicCastObjCProtocolConditional();
            if (v100)
            {
              (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
              uint64_t v39 = v26 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
              swift_beginAccess();
              uint64_t v98 = v38;
              unsigned __int8 v97 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 40);
              swift_unknownObjectRetain();
              id v40 = v20;
              id v41 = v28;
              v97(v39, v40, v16);
              uint64_t v42 = v26;
              swift_endAccess();
              long long v43 = (uint64_t *)(v26 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
              swift_beginAccess();
              uint64_t v44 = v103;
              uint64_t v103 = (uint64_t)v43;
              uint64_t v45 = (uint64_t)v104;
              *long long v43 = v44;
              v43[1] = v45;
              swift_bridgeObjectRelease();
              id v46 = (uint64_t *)(v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
              uint64_t v47 = v102;
              *id v46 = v101;
              v46[1] = v47;
              swift_bridgeObjectRelease();
              uint64_t v48 = (uint64_t *)(v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
              uint64_t v49 = v98;
              *uint64_t v48 = v99;
              v48[1] = v49;
              swift_bridgeObjectRelease();
              uint64_t v111 = &unk_2706BFF18;
              uint64_t v50 = swift_dynamicCastObjCProtocolConditional();
              if (v50)
              {
                uint64_t v51 = v50;
                id v52 = self;
                swift_unknownObjectRetain();
                id v53 = objc_msgSend(v52, sel_dateForCurrentSortTypeAccessibilityStringForNote_folderNoteSortType_, v51, 0);
                if (v53)
                {
                  unsigned int v54 = v53;
                  uint64_t v55 = sub_257D94E30();
                  unint64_t v57 = v56;
                }
                else
                {
                  uint64_t v55 = 0;
                  unint64_t v57 = 0xE000000000000000;
                }
                long long v58 = (uint64_t *)(v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
                uint64_t *v58 = v55;
                v58[1] = v57;
                id v41 = v110;
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease();
              }
              id v59 = objc_msgSend(v41, sel_creationDate);
              sub_257D94630();

              uint64_t v60 = v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
              swift_beginAccess();
              id v61 = (void (*)(uint64_t, char *, uint64_t))v107[5];
              v61(v60, v12, v10);
              swift_endAccess();
              id v62 = objc_msgSend(v41, sel_modificationDate);
              sub_257D94630();

              uint64_t v63 = v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
              swift_beginAccess();
              v61(v63, v12, v10);
              swift_endAccess();
              id v64 = v100;
              id v65 = objc_msgSend(v100, sel_contentInfoText);
              uint64_t v66 = sub_257D94E30();
              uint64_t v68 = v67;

              uint64_t v69 = (uint64_t *)(v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
              uint64_t *v69 = v66;
              v69[1] = v68;
              swift_bridgeObjectRelease();
              *(unsigned char *)(v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 0;
              if (!v109)
              {
                (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
                swift_unknownObjectRelease();
                return;
              }
              id v70 = objc_msgSend(v64, sel_noteAsPlainTextWithoutTitle);
              sub_257D94E30();
              uint64_t v72 = v71;

              id v73 = objc_allocWithZone(MEMORY[0x263F5B450]);
              swift_bridgeObjectRetain();
              uint64_t v74 = (void *)sub_257D94E20();
              swift_bridgeObjectRelease();
              id v75 = objc_msgSend(v73, sel_initWithSearchString_, v74);

              uint64_t v76 = (void *)sub_257D94E20();
              id v77 = objc_msgSend(v75, sel_firstMatchInDocumentWithGlobalFallback_, v76);

              id v78 = self;
              uint64_t v102 = v72;
              unint64_t v79 = (void *)sub_257D94E20();
              id v104 = self;
              id v80 = objc_msgSend(v104, sel_ICTintColor);
              v107 = v78;
              id v81 = objc_msgSend(v78, sel_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v79, 0, v77, v80, v75, 0.0, 0.0, 286.0, 20.0);

              if (v81)
              {
                uint64_t v82 = (uint64_t)v105;
                sub_257D94580();

                uint64_t v83 = sub_257D94570();
                uint64_t v84 = *(void *)(v83 - 8);
                id v100 = *(id *)(v84 + 56);
                uint64_t v101 = v83;
                uint64_t v99 = v84 + 56;
                ((void (*)(uint64_t, void, uint64_t))v100)(v82, 0, 1);
                swift_bridgeObjectRelease();
                uint64_t v85 = v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
                swift_beginAccess();
                sub_257D91BA4(v82, v85, (uint64_t *)&unk_26A05DAB0);
                swift_endAccess();
                id v86 = objc_allocWithZone(MEMORY[0x263F5B450]);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                id v87 = (void *)sub_257D94E20();
                swift_bridgeObjectRelease();
                id v88 = objc_msgSend(v86, sel_initWithSearchString_, v87);

                uint64_t v89 = (void *)sub_257D94E20();
                id v90 = objc_msgSend(v88, sel_firstMatchInDocumentWithGlobalFallback_, v89);

                uint64_t v91 = (void *)sub_257D94E20();
                id v92 = objc_msgSend(v104, sel_ICTintColor);
                id v93 = objc_msgSend(v107, sel_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v91, 0, v90, v92, v88, 0.0, 0.0, 286.0, 20.0);

                if (v93)
                {
                  uint64_t v94 = (uint64_t)v106;
                  sub_257D94580();

                  ((void (*)(uint64_t, void, uint64_t, uint64_t))v100)(v94, 0, 1, v101);
                  swift_bridgeObjectRelease();
                  uint64_t v95 = v42 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
                  swift_beginAccess();
                  sub_257D91BA4(v94, v95, (uint64_t *)&unk_26A05DAB0);
                  swift_endAccess();
                  swift_unknownObjectRelease();
                  goto LABEL_17;
                }
              }
              else
              {
                __break(1u);
              }
              __break(1u);
              return;
            }
            swift_bridgeObjectRelease();
          }
        }
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_17:
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
}

uint64_t NoteViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  uint64_t v2 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  uint64_t v4 = sub_257D94650();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate, v4);
  swift_bridgeObjectRelease();
  sub_257D8765C(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail, &qword_26A05D428);
  sub_257D8765C(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle, (uint64_t *)&unk_26A05DAB0);
  sub_257D8765C(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, (uint64_t *)&unk_26A05DAB0);
  return v0;
}

uint64_t NoteViewModel.__deallocating_deinit()
{
  NoteViewModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_257D914BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_257D91518@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  return sub_257D877B0(v3, a2, &qword_26A05D428);
}

uint64_t sub_257D9157C()
{
  return type metadata accessor for NoteViewModel();
}

uint64_t type metadata accessor for NoteViewModel()
{
  uint64_t result = qword_26A05DAC0;
  if (!qword_26A05DAC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_257D915D0()
{
  sub_257D94610();
  if (v0 <= 0x3F)
  {
    sub_257D94650();
    if (v1 <= 0x3F)
    {
      sub_257D917F4(319, (unint64_t *)&qword_26A05DAD0, MEMORY[0x263F06EA8]);
      if (v2 <= 0x3F)
      {
        sub_257D917F4(319, &qword_26A05DAD8, MEMORY[0x263F06828]);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for NoteViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NoteViewModel);
}

uint64_t dispatch thunk of NoteViewModel.title.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of NoteViewModel.thumbnail.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of static NoteViewModel.models(with:modernContext:htmlContext:query:)()
{
  return (*(uint64_t (**)(void))(v0 + 624))();
}

void sub_257D917F4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_257D94F50();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_257D91848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DAE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_257D94680();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D877B0(a3, (uint64_t)v6, &qword_26A05DAE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_257D94670();
    sub_257D8765C((uint64_t)v6, &qword_26A05DAE0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  }
  objc_msgSend(self, sel_currentNoteListSortType);
  uint64_t v11 = sub_257D94620();
  sub_257D94620();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_257D91A6C()
{
  unint64_t result = qword_26A05DAE8;
  if (!qword_26A05DAE8)
  {
    sub_257D94610();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DAE8);
  }
  return result;
}

void sub_257D91AC4(void *a1@<X8>)
{
  sub_257D8EC2C(*(void *)(v1 + 32), a1);
}

void sub_257D91AE4(uint64_t *a1@<X8>)
{
  sub_257D8EBB0(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_257D91B00()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_257D91B48()
{
  sub_257D907F8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_257D91B54()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_257D91B64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_257D91BA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_257D91C08()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_257D91C58()
{
  sub_257D8F004(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_257D91C68()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t NotesSiriListHeaderView.noteCount.getter()
{
  return *(void *)v0;
}

uint64_t NotesSiriListHeaderView.headerText.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotesSiriListHeaderView.defaultFolderUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 28);
  uint64_t v4 = sub_257D94610();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for NotesSiriListHeaderView()
{
  uint64_t result = qword_26A05DC10;
  if (!qword_26A05DC10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NotesSiriListHeaderView.fetchLimit.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 32));
}

uint64_t NotesSiriListHeaderView.aboveFetchLimit.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 36));
}

uint64_t NotesSiriListHeaderView.init(noteCount:headerText:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v7 = type metadata accessor for NotesSiriListHeaderView();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v10 = 0;
  v10[1] = sub_257D94770();
  v10[2] = v11;
  sub_257D94DD0();
  id v12 = objc_msgSend(self, sel_appURLForDefaultFolder);
  sub_257D945F0();

  *(uint64_t *)((char *)v10 + *(int *)(v7 + 32)) = 26;
  uint64_t v13 = *(int *)(v7 + 36);
  *((unsigned char *)v10 + v13) = 0;
  if ((a2 & 1) == 0)
  {
    if (a1 >= 26)
    {
      *uint64_t v10 = 25;
      *((unsigned char *)v10 + v13) = 1;
      if (!a3) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    *uint64_t v10 = a1;
  }
  if (a3)
  {
LABEL_5:
    uint64_t v14 = (void *)sub_257D94E20();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v14, sel_ic_quotedString);

    uint64_t v16 = sub_257D94E30();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();

    v10[1] = v16;
    v10[2] = v18;
  }
LABEL_6:
  uint64_t v19 = v22;
  sub_257D92020((uint64_t)v10, v22);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v19, 0, 1, v7);
  return sub_257D92084((uint64_t)v10);
}

uint64_t sub_257D92020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_257D92084(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t NotesSiriListHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_257D949D0();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NotesSiriListHeaderView();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D860);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DBD0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v29 = v10;
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DBD8);
  uint64_t v14 = MEMORY[0x270FA5388](v31);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v27 - v17;
  sub_257D92514((uint64_t)v9);
  sub_257D92020(v1, (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v20 = swift_allocObject();
  sub_257D929C8((uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  uint64_t v21 = sub_257D92ABC(&qword_26A05DBE0, &qword_26A05D860, (void (*)(void))sub_257D92A8C);
  sub_257D94C50();
  swift_release();
  sub_257D8765C((uint64_t)v9, &qword_26A05D860);
  sub_257D949A0();
  uint64_t v35 = v7;
  uint64_t v36 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v29;
  sub_257D94CB0();
  uint64_t v23 = v33;
  id v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  v24(v4, v33);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v22);
  sub_257D949B0();
  sub_257D94850();
  v24(v4, v23);
  sub_257D8765C((uint64_t)v16, &qword_26A05DBD8);
  uint64_t v35 = sub_257D94730();
  uint64_t v36 = v25;
  sub_257D8690C();
  sub_257D94840();
  swift_bridgeObjectRelease();
  return sub_257D8765C((uint64_t)v18, &qword_26A05DBD8);
}

uint64_t sub_257D92514@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC08);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DBF8);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D858);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v4 = sub_257D94930();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC50);
  sub_257D92BFC(v1, (uint64_t)&v4[*(int *)(v13 + 44)]);
  uint64_t v14 = sub_257D94B80();
  uint64_t KeyPath = swift_getKeyPath();
  sub_257D877B0((uint64_t)v4, (uint64_t)v8, &qword_26A05DC08);
  uint64_t v16 = (uint64_t *)&v8[*(int *)(v6 + 44)];
  uint64_t *v16 = KeyPath;
  v16[1] = v14;
  sub_257D8765C((uint64_t)v4, &qword_26A05DC08);
  LOBYTE(KeyPath) = sub_257D94B40();
  sub_257D877B0((uint64_t)v8, (uint64_t)v12, &qword_26A05DBF8);
  uint64_t v17 = &v12[*(int *)(v10 + 44)];
  *uint64_t v17 = KeyPath;
  *(_OWORD *)(v17 + 8) = 0u;
  *(_OWORD *)(v17 + 24) = 0u;
  v17[40] = 1;
  sub_257D8765C((uint64_t)v8, &qword_26A05DBF8);
  uint64_t v18 = sub_257D94D70();
  sub_257D7FBE8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v22, 0.0, 1, 0.0, 1, v18, v19);
  return sub_257D8765C((uint64_t)v12, &qword_26A05D858);
}

uint64_t sub_257D92750()
{
  uint64_t v0 = sub_257D94E00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  type metadata accessor for NotesSiriListHeaderView();
  uint64_t v5 = (void *)sub_257D945E0();
  objc_msgSend(v4, sel_setPunchOutUri_, v5);

  sub_257D94DC0();
  id v6 = v4;
  sub_257D94DF0();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_257D92894()
{
  uint64_t v1 = (int *)(type metadata accessor for NotesSiriListHeaderView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[9];
  uint64_t v10 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_257D929C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_257D92A2C()
{
  type metadata accessor for NotesSiriListHeaderView();
  return sub_257D92750();
}

uint64_t sub_257D92A8C()
{
  return sub_257D92ABC(&qword_26A05DBE8, &qword_26A05D858, (void (*)(void))sub_257D92B38);
}

uint64_t sub_257D92ABC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_257D92B38()
{
  unint64_t result = qword_26A05DBF0;
  if (!qword_26A05DBF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DBF8);
    sub_257D87A20(&qword_26A05DC00, &qword_26A05DC08);
    sub_257D87A20(&qword_26A05D758, &qword_26A05D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DBF0);
  }
  return result;
}

uint64_t sub_257D92BFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC58);
  uint64_t v64 = *(void *)(v3 - 8);
  uint64_t v65 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v60 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC60);
  MEMORY[0x270FA5388](v62);
  id v59 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC68);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  id v61 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v63 = (uint64_t)&v53 - v9;
  uint64_t v57 = sub_257D949D0();
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC70);
  MEMORY[0x270FA5388](v12 - 8);
  unsigned int v54 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC78);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v67 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v68 = (uint64_t)&v53 - v18;
  uint64_t v55 = a1;
  uint64_t v19 = a1[2];
  uint64_t v69 = a1[1];
  uint64_t v70 = v19;
  unint64_t v58 = sub_257D8690C();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_257D94BF0();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  uint64_t v25 = sub_257D94BB0();
  uint64_t v27 = v26;
  LOBYTE(a1) = v28;
  uint64_t v30 = v29;
  sub_257D868FC(v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v69 = v25;
  uint64_t v70 = v27;
  LOBYTE(v71) = a1 & 1;
  uint64_t v72 = v30;
  sub_257D949C0();
  uint64_t v31 = (uint64_t)v54;
  sub_257D94CA0();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v11, v57);
  sub_257D868FC(v69, v70, v71);
  swift_bridgeObjectRelease();
  LODWORD(a1) = sub_257D94AE0();
  uint64_t v32 = v67;
  sub_257D877B0(v31, v67, &qword_26A05DC70);
  *(_DWORD *)(v32 + *(int *)(v15 + 44)) = a1;
  sub_257D8765C(v31, &qword_26A05DC70);
  sub_257D871E4(v32, v68, &qword_26A05DC78);
  uint64_t v33 = (uint64_t)v55;
  uint64_t v34 = *v55;
  uint64_t v35 = sub_257D94920();
  sub_257D93288(v33, v34, (uint64_t)&v69);
  uint64_t v36 = v69;
  uint64_t v37 = v70;
  uint64_t v38 = v71;
  uint64_t v39 = v72;
  LOBYTE(v22) = v73;
  uint64_t v69 = v35;
  uint64_t v70 = 0;
  LOBYTE(v71) = 0;
  uint64_t v72 = v36;
  uint64_t v73 = v37;
  uint64_t v74 = v38;
  uint64_t v75 = v39;
  char v76 = v22;
  sub_257D94B70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC30);
  sub_257D87A20(&qword_26A05DC28, &qword_26A05DC30);
  id v40 = v60;
  sub_257D94C40();
  sub_257D86A30(v36, v37, v38);
  LODWORD(v36) = sub_257D94AF0();
  uint64_t v42 = v64;
  uint64_t v41 = v65;
  uint64_t v43 = (uint64_t)v59;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v59, v40, v65);
  *(_DWORD *)(v43 + *(int *)(v62 + 36)) = v36;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  uint64_t v69 = sub_257D946E0();
  uint64_t v70 = v44;
  sub_257D94104();
  uint64_t v45 = (uint64_t)v61;
  sub_257D94C80();
  swift_bridgeObjectRelease();
  sub_257D8765C(v43, &qword_26A05DC60);
  uint64_t v46 = v63;
  sub_257D871E4(v45, v63, &qword_26A05DC68);
  uint64_t v48 = v67;
  uint64_t v47 = v68;
  sub_257D877B0(v68, v67, &qword_26A05DC78);
  sub_257D877B0(v46, v45, &qword_26A05DC68);
  uint64_t v49 = v66;
  sub_257D877B0(v48, v66, &qword_26A05DC78);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC88);
  uint64_t v51 = v49 + *(int *)(v50 + 48);
  *(void *)uint64_t v51 = 0;
  *(unsigned char *)(v51 + 8) = 0;
  sub_257D877B0(v45, v49 + *(int *)(v50 + 64), &qword_26A05DC68);
  sub_257D8765C(v46, &qword_26A05DC68);
  sub_257D8765C(v47, &qword_26A05DC78);
  sub_257D8765C(v45, &qword_26A05DC68);
  return sub_257D8765C(v48, &qword_26A05DC78);
}

__n128 NotesSiriListHeaderView.noteCountHelper(noteCount:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_257D94920();
  sub_257D93288(v2, a1, (uint64_t)v9);
  char v6 = v10;
  __n128 result = (__n128)v9[0];
  long long v8 = v9[1];
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  *(__n128 *)(a2 + 24) = result;
  *(_OWORD *)(a2 + 40) = v8;
  *(unsigned char *)(a2 + 56) = v6;
  return result;
}

double sub_257D93288@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_257D94680();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC38);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_257D94970();
  MEMORY[0x270FA5388](v11 - 8);
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 36)) == 1)
  {
    *(void *)&long long v31 = sub_257D94760();
    *((void *)&v31 + 1) = v12;
    sub_257D8690C();
    uint64_t v26 = sub_257D94BF0();
    uint64_t v27 = v13;
    uint64_t v28 = v14 & 1;
    uint64_t v29 = v15;
    char v30 = 0;
  }
  else
  {
    sub_257D94960();
    sub_257D94950();
    *(void *)&long long v31 = a2;
    sub_257D94660();
    sub_257D940A8();
    sub_257D94590();
    sub_257D87A20(&qword_26A05DC48, &qword_26A05DC38);
    sub_257D94940();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_257D94950();
    sub_257D94980();
    id v16 = (id)ICSharedFrameworkBundleIdentifier();
    sub_257D94E30();

    uint64_t v17 = (void *)sub_257D94E20();
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(self, sel_bundleWithIdentifier_, v17);

    uint64_t v26 = sub_257D94BD0();
    uint64_t v27 = v19;
    uint64_t v28 = v20 & 1;
    uint64_t v29 = v21;
    char v30 = 1;
  }
  sub_257D94AC0();
  double result = *(double *)&v31;
  long long v23 = v32;
  char v24 = v33;
  *(_OWORD *)a3 = v31;
  *(_OWORD *)(a3 + 16) = v23;
  *(unsigned char *)(a3 + 32) = v24;
  return result;
}

uint64_t sub_257D935D8()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for NotesSiriListHeaderView(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v7 = a3[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_257D94DE0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)v4 + v12;
    char v14 = (char *)a2 + v12;
    uint64_t v15 = sub_257D94610();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[9];
    *(void *)((char *)v4 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
  }
  return v4;
}

uint64_t destroy for NotesSiriListHeaderView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_257D94610();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

uint64_t initializeWithCopy for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  return a1;
}

void *assignWithCopy for NotesSiriListHeaderView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_257D94610();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_257D94DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_257D94610();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257D93C28);
}

uint64_t sub_257D93C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_257D94DE0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_257D94610();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257D93D68);
}

uint64_t sub_257D93D68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_257D94DE0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_257D94610();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_257D93E94()
{
  uint64_t result = sub_257D94DE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_257D94610();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_257D93F88()
{
  unint64_t result = qword_26A05DC20;
  if (!qword_26A05DC20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DBD8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05D860);
    sub_257D92ABC(&qword_26A05DBE0, &qword_26A05D860, (void (*)(void))sub_257D92A8C);
    swift_getOpaqueTypeConformance2();
    sub_257D86188();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DC20);
  }
  return result;
}

uint64_t sub_257D9406C()
{
  return sub_257D87A20(&qword_26A05DC28, &qword_26A05DC30);
}

unint64_t sub_257D940A8()
{
  unint64_t result = qword_26A05DC40;
  if (!qword_26A05DC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DC40);
  }
  return result;
}

unint64_t sub_257D94104()
{
  unint64_t result = qword_26A05DC80;
  if (!qword_26A05DC80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DC60);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DC30);
    sub_257D87A20(&qword_26A05DC28, &qword_26A05DC30);
    swift_getOpaqueTypeConformance2();
    sub_257D87A20(&qword_26A05D740, &qword_26A05D748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DC80);
  }
  return result;
}

uint64_t NotesSiriSashView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_257D94790();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D94780();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC90) + 36)) = 0x3FF0000000000000;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_257D94304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257D94320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_257D94790();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D94780();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A05DC90) + 36)) = 0x3FF0000000000000;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for NotesSiriSashView()
{
  return &type metadata for NotesSiriSashView;
}

unint64_t sub_257D94430()
{
  unint64_t result = qword_26A05DC98;
  if (!qword_26A05DC98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05DC90);
    sub_257D944AC();
    sub_257D94504();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DC98);
  }
  return result;
}

unint64_t sub_257D944AC()
{
  unint64_t result = qword_26A05DCA0;
  if (!qword_26A05DCA0)
  {
    sub_257D94790();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DCA0);
  }
  return result;
}

unint64_t sub_257D94504()
{
  unint64_t result = qword_26A05DCA8;
  if (!qword_26A05DCA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A05DCB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05DCA8);
  }
  return result;
}

uint64_t sub_257D94560()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_257D94570()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_257D94580()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_257D94590()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_257D945A0()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_257D945B0()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_257D945C0()
{
  return MEMORY[0x270F50748]();
}

uint64_t sub_257D945D0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_257D945E0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_257D945F0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_257D94600()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_257D94610()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_257D94620()
{
  return MEMORY[0x270F50CC0]();
}

uint64_t sub_257D94630()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_257D94640()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_257D94650()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_257D94660()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_257D94670()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_257D94680()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_257D94690()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_257D946A0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_257D946B0()
{
  return MEMORY[0x270F50760]();
}

uint64_t sub_257D946C0()
{
  return MEMORY[0x270F50768]();
}

uint64_t sub_257D946D0()
{
  return MEMORY[0x270F50770]();
}

uint64_t sub_257D946E0()
{
  return MEMORY[0x270F50778]();
}

uint64_t sub_257D946F0()
{
  return MEMORY[0x270F50780]();
}

uint64_t sub_257D94700()
{
  return MEMORY[0x270F50788]();
}

uint64_t sub_257D94710()
{
  return MEMORY[0x270F50790]();
}

uint64_t sub_257D94720()
{
  return MEMORY[0x270F50798]();
}

uint64_t sub_257D94730()
{
  return MEMORY[0x270F507A0]();
}

uint64_t sub_257D94740()
{
  return MEMORY[0x270F507A8]();
}

uint64_t sub_257D94750()
{
  return MEMORY[0x270F507B0]();
}

uint64_t sub_257D94760()
{
  return MEMORY[0x270F507B8]();
}

uint64_t sub_257D94770()
{
  return MEMORY[0x270F507C0]();
}

uint64_t sub_257D94780()
{
  return MEMORY[0x270F51220]();
}

uint64_t sub_257D94790()
{
  return MEMORY[0x270F51228]();
}

uint64_t sub_257D947A0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_257D947B0()
{
  return MEMORY[0x270F50B20]();
}

uint64_t sub_257D947C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_257D947D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_257D947E0()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_257D947F0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_257D94800()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_257D94810()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_257D94820()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_257D94830()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_257D94840()
{
  return MEMORY[0x270F000B8]();
}

uint64_t sub_257D94850()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_257D94860()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_257D94870()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_257D94880()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_257D94890()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_257D948A0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_257D948B0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_257D948C0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_257D948D0()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_257D948E0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_257D948F0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_257D94900()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_257D94910()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_257D94920()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_257D94930()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_257D94940()
{
  return MEMORY[0x270F011E0]();
}

uint64_t sub_257D94950()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_257D94960()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_257D94970()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_257D94980()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_257D94990()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_257D949A0()
{
  return MEMORY[0x270F013E0]();
}

uint64_t sub_257D949B0()
{
  return MEMORY[0x270F01410]();
}

uint64_t sub_257D949C0()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_257D949D0()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_257D949E0()
{
  return MEMORY[0x270F75918]();
}

uint64_t sub_257D949F0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_257D94A00()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_257D94A10()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_257D94A20()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_257D94A40()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_257D94A50()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_257D94A60()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_257D94A70()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_257D94A80()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_257D94A90()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_257D94AB0()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_257D94AC0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_257D94AD0()
{
  return MEMORY[0x270F01D10]();
}

uint64_t sub_257D94AE0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_257D94AF0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_257D94B00()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_257D94B10()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_257D94B20()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_257D94B30()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_257D94B40()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_257D94B50()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_257D94B60()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_257D94B70()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_257D94B80()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_257D94B90()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_257D94BA0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_257D94BB0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_257D94BC0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_257D94BD0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_257D94BE0()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_257D94BF0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_257D94C00()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_257D94C10()
{
  return MEMORY[0x270F510B0]();
}

uint64_t sub_257D94C20()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_257D94C30()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_257D94C40()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_257D94C50()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_257D94C60()
{
  return MEMORY[0x270F03650]();
}

uint64_t sub_257D94C70()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_257D94C80()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_257D94C90()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_257D94CA0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_257D94CB0()
{
  return MEMORY[0x270F03DB8]();
}

uint64_t sub_257D94CC0()
{
  return MEMORY[0x270F510F8]();
}

uint64_t sub_257D94CD0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_257D94CE0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_257D94CF0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_257D94D00()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_257D94D10()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_257D94D20()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_257D94D30()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_257D94D40()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_257D94D50()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_257D94D60()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_257D94D70()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_257D94D80()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_257D94D90()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_257D94DA0()
{
  return MEMORY[0x270F75D60]();
}

uint64_t sub_257D94DB0()
{
  return MEMORY[0x270F75D68]();
}

uint64_t sub_257D94DC0()
{
  return MEMORY[0x270F75E28]();
}

uint64_t sub_257D94DD0()
{
  return MEMORY[0x270F75E40]();
}

uint64_t sub_257D94DE0()
{
  return MEMORY[0x270F75E48]();
}

uint64_t sub_257D94DF0()
{
  return MEMORY[0x270F76080]();
}

uint64_t sub_257D94E00()
{
  return MEMORY[0x270F760B0]();
}

uint64_t sub_257D94E10()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_257D94E20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_257D94E30()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257D94E40()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_257D94E50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_257D94E60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_257D94E70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_257D94E80()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_257D94E90()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_257D94EA0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_257D94EB0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_257D94EC0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_257D94ED0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_257D94EE0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_257D94EF0()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_257D94F00()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_257D94F10()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_257D94F20()
{
  return MEMORY[0x270EF2060]();
}

uint64_t sub_257D94F30()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_257D94F40()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_257D94F50()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_257D94F60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_257D94F70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_257D94F80()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_257D94F90()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_257D94FA0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_257D94FB0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_257D94FC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257D94FD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_257D94FE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_257D94FF0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_257D95000()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_257D95010()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_257D95020()
{
  return MEMORY[0x270F9F7D0]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ICSharedFrameworkBundleIdentifier()
{
  return MEMORY[0x270F50E08]();
}

uint64_t NotesAppURLForNoteIdentifier()
{
  return MEMORY[0x270F50C70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}