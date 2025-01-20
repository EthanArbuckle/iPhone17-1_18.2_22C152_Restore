uint64_t (*MailEntity.isNew.modify())()
{
  OUTLINED_FUNCTION_14_9();
  return nullsub_1;
}

uint64_t MailEntity.isTwoFactorCode.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 100));
}

uint64_t MailEntity.isTwoFactorCode.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 100)) = v0;
  return result;
}

uint64_t (*MailEntity.isTwoFactorCode.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isFromMe.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 104));
}

uint64_t MailEntity.isFromMe.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 104)) = v0;
  return result;
}

uint64_t (*MailEntity.isFromMe.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isJunk.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 108));
}

uint64_t MailEntity.isJunk.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 108)) = v0;
  return result;
}

uint64_t (*MailEntity.isJunk.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isRead.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 112));
}

uint64_t MailEntity.isRead.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 112)) = v0;
  return result;
}

uint64_t (*MailEntity.isRead.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isVIP.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 116));
}

uint64_t MailEntity.isVIP.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 116)) = v0;
  return result;
}

uint64_t (*MailEntity.isVIP.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isFlagged.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 120));
}

uint64_t MailEntity.isFlagged.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 120)) = v0;
  return result;
}

uint64_t (*MailEntity.isFlagged.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.isSpotlightUpdate.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MailEntity() + 124));
}

uint64_t MailEntity.isSpotlightUpdate.setter()
{
  uint64_t result = OUTLINED_FUNCTION_14_9();
  *(unsigned char *)(v1 + *(int *)(result + 124)) = v0;
  return result;
}

uint64_t (*MailEntity.isSpotlightUpdate.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.notificationId.getter()
{
  return OUTLINED_FUNCTION_17();
}

uint64_t MailEntity.notificationId.setter(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(v2 + *(int *)(type metadata accessor for MailEntity() + 128));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MailEntity.notificationId.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.quotedRegions.getter()
{
  type metadata accessor for MailEntity();
  return swift_bridgeObjectRetain();
}

uint64_t MailEntity.quotedRegions.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_14_9() + 132);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*MailEntity.quotedRegions.modify())()
{
  return nullsub_1;
}

uint64_t MailEntity.init(uniqueId:domainId:donatingBundleId:accountIdentifier:accountHandles:senderHandle:recipientHandles:primaryRecipientHandles:additionalRecipientHandles:subject:htmlContent:htmlTextContent:textContent:isFullyDownloaded:mailboxIdentifiers:attachments:conversationId:dateSent:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:isSpotlightUpdate:notificationId:quotedRegions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, long long *a11, long long a12, long long a13, long long a14, long long a15, long long a16, uint64_t a17, char a18, long long a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t *a24,char a25,char a26,char a27,char a28,char a29,char a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  long long v57 = a11[1];
  long long v58 = *a11;
  long long v56 = a11[2];
  uint64_t v54 = *((void *)a11 + 7);
  uint64_t v55 = *((void *)a11 + 6);
  char v53 = *((unsigned char *)a11 + 64);
  uint64_t v61 = *a24;
  char v60 = *((unsigned char *)a24 + 8);
  v36 = (int *)type metadata accessor for MailEntity();
  uint64_t v37 = a9 + v36[21];
  uint64_t v52 = v37;
  uint64_t v38 = sub_25AAAB800();
  __swift_storeEnumTagSinglePayload(v37, 1, 1, v38);
  uint64_t v51 = a9 + v36[22];
  __swift_storeEnumTagSinglePayload(v51, 1, 1, v38);
  uint64_t v39 = a9 + v36[23];
  *(void *)uint64_t v39 = 0;
  *(unsigned char *)(v39 + 8) = 1;
  uint64_t v50 = v36[24];
  *(unsigned char *)(a9 + v50) = 2;
  uint64_t v49 = v36[25];
  *(unsigned char *)(a9 + v49) = 2;
  uint64_t v40 = v36[26];
  *(unsigned char *)(a9 + v40) = 2;
  uint64_t v41 = v36[27];
  *(unsigned char *)(a9 + v41) = 2;
  uint64_t v42 = v36[28];
  *(unsigned char *)(a9 + v42) = 2;
  uint64_t v43 = v36[29];
  *(unsigned char *)(a9 + v43) = 2;
  uint64_t v44 = v36[30];
  *(unsigned char *)(a9 + v44) = 2;
  uint64_t v45 = v36[31];
  *(unsigned char *)(a9 + v45) = 0;
  v46 = (void *)(a9 + v36[32]);
  void *v46 = 0;
  v46[1] = 0;
  uint64_t v47 = v36[33];
  *(void *)(a9 + v47) = 0;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 72) = v58;
  *(_OWORD *)(a9 + 88) = v57;
  *(_OWORD *)(a9 + 104) = v56;
  *(void *)(a9 + 120) = v55;
  *(void *)(a9 + 128) = v54;
  *(unsigned char *)(a9 + 136) = v53;
  *(_OWORD *)(a9 + 144) = a12;
  *(_OWORD *)(a9 + 160) = a13;
  *(_OWORD *)(a9 + 176) = a14;
  *(_OWORD *)(a9 + 192) = a15;
  *(_OWORD *)(a9 + 208) = a16;
  *(void *)(a9 + 224) = a17;
  *(unsigned char *)(a9 + 232) = a18;
  *(_OWORD *)(a9 + 240) = a19;
  *(void *)(a9 + 256) = a20;
  *(void *)(a9 + 264) = a21;
  sub_25AA236AC(a22, v52);
  sub_25AA236AC(a23, v51);
  *(void *)uint64_t v39 = v61;
  *(unsigned char *)(v39 + 8) = v60;
  *(unsigned char *)(a9 + v50) = a25;
  *(unsigned char *)(a9 + v49) = a26;
  *(unsigned char *)(a9 + v40) = a27;
  *(unsigned char *)(a9 + v41) = a28;
  *(unsigned char *)(a9 + v42) = a29;
  *(unsigned char *)(a9 + v43) = a30;
  *(unsigned char *)(a9 + v44) = a31;
  *(unsigned char *)(a9 + v45) = a32;
  swift_bridgeObjectRelease();
  void *v46 = a33;
  v46[1] = a34;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a9 + v47) = a35;
  return result;
}

uint64_t MailEntity.dateReceivedOrDateSent.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_34();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
  uint64_t v8 = OUTLINED_FUNCTION_14_0(v7);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v19 - v12;
  sub_25AA23608(v1 + *(int *)(v2 + 88), (uint64_t)v11);
  sub_25AAAAF84(v1, v6, (void (*)(void))type metadata accessor for MailEntity);
  uint64_t v14 = sub_25AAAB800();
  OUTLINED_FUNCTION_62_4((uint64_t)v11);
  if (v15)
  {
    sub_25AA23608(v6 + *(int *)(v2 + 84), (uint64_t)v13);
    sub_25AAAB028(v6, (void (*)(void))type metadata accessor for MailEntity);
    sub_25AA23FC0((uint64_t)v11, &qword_26A481400);
    uint64_t result = OUTLINED_FUNCTION_62_4((uint64_t)v13);
    if (!v15)
    {
LABEL_6:
      uint64_t v17 = OUTLINED_FUNCTION_17();
      return v18(v17);
    }
  }
  else
  {
    sub_25AAAB028(v6, (void (*)(void))type metadata accessor for MailEntity);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v13, v11, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v14);
    uint64_t result = OUTLINED_FUNCTION_62_4((uint64_t)v13);
    if (!v15) {
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t MailEntity.Categories.rawValue.getter()
{
  return *(void *)v0;
}

ProactiveSummarizationClient::MailEntity::Categories __swiftcall MailEntity.Categories.init(rawValue:)(ProactiveSummarizationClient::MailEntity::Categories rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static MailEntity.Categories.personal.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.promotion.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.transaction.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.news.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.updates.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.highImpact.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.social.getter(void *a1@<X8>)
{
}

void static MailEntity.Categories.other.getter(void *a1@<X8>)
{
}

uint64_t sub_25AAA620C()
{
  sub_25AAAB084();
  uint64_t result = sub_25AAABA00();
  qword_26A493688 = result;
  return result;
}

Swift::String __swiftcall MailEntity.Categories.userFacingDescription()()
{
  uint64_t v1 = *v0;
  if (_MergedGlobals_1 != -1) {
LABEL_44:
  }
    swift_once();
  uint64_t v2 = qword_26A493688;
  uint64_t v3 = qword_26A493688 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(qword_26A493688 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(qword_26A493688 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v8 << 6);
LABEL_21:
    uint64_t v15 = *(void *)(*(void *)(v2 + 48) + 8 * v11);
    if ((v15 & ~v1) == 0)
    {
      v16 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v11);
      uint64_t v17 = v16[1];
      uint64_t v36 = *v16;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = OUTLINED_FUNCTION_48_2(0, *((void *)v9 + 2) + 1);
      }
      unint64_t v19 = *((void *)v9 + 2);
      unint64_t v18 = *((void *)v9 + 3);
      v20 = v9;
      if (v19 >= v18 >> 1) {
        v20 = sub_25AA41254((char *)(v18 > 1), v19 + 1, 1, (uint64_t)v9);
      }
      *((void *)v20 + 2) = v19 + 1;
      uint64_t v9 = v20;
      v21 = &v20[16 * v19];
      *((void *)v21 + 4) = v36;
      *((void *)v21 + 5) = v17;
      if (v15) {
        v1 &= ~v15;
      }
    }
  }
  int64_t v12 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v12 >= v7) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v8;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v8 = v12 + 1;
  if (v12 + 1 >= v7) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v8);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v8 = v12 + 2;
  if (v12 + 2 >= v7) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v8);
  if (v13)
  {
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v7)
  {
    unint64_t v13 = *(void *)(v3 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v8 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_43;
        }
        if (v8 >= v7) {
          goto LABEL_28;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v8);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v14;
    goto LABEL_20;
  }
LABEL_28:
  swift_release();
  if (v1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = OUTLINED_FUNCTION_48_2(0, *((void *)v9 + 2) + 1);
    }
    unint64_t v23 = *((void *)v9 + 2);
    unint64_t v22 = *((void *)v9 + 3);
    if (v23 >= v22 >> 1) {
      uint64_t v9 = OUTLINED_FUNCTION_48_2((char *)(v22 > 1), v23 + 1);
    }
    *((void *)v9 + 2) = v23 + 1;
    v24 = &v9[16 * v23];
    *((void *)v24 + 4) = 0x6E776F6E6B6E55;
    v25 = v24 + 32;
    unint64_t v26 = 0xE700000000000000;
    goto LABEL_34;
  }
  if (!*((void *)v9 + 2))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = OUTLINED_FUNCTION_48_2(0, 1);
    }
    unint64_t v33 = *((void *)v9 + 2);
    unint64_t v32 = *((void *)v9 + 3);
    if (v33 >= v32 >> 1) {
      uint64_t v9 = OUTLINED_FUNCTION_48_2((char *)(v32 > 1), v33 + 1);
    }
    *((void *)v9 + 2) = v33 + 1;
    v34 = &v9[16 * v33];
    *((void *)v34 + 4) = 1701736270;
    v25 = v34 + 32;
    unint64_t v26 = 0xE400000000000000;
LABEL_34:
    *((void *)v25 + 1) = v26;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32EDD0);
  sub_25AA483D0();
  uint64_t v27 = sub_25AAABA10();
  v29 = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = v27;
  v31 = v29;
  result._object = v31;
  result._countAndFlagsBits = v30;
  return result;
}

ProactiveSummarizationClient::MailEntity::Categories sub_25AAA6594(Swift::Int *a1)
{
  return MailEntity.Categories.init(rawValue:)(*a1);
}

uint64_t sub_25AAA659C()
{
  return sub_25AAABC90();
}

uint64_t sub_25AAA65E4()
{
  return sub_25AAABC60();
}

uint64_t sub_25AAA661C()
{
  return sub_25AAA6624();
}

uint64_t sub_25AAA6624()
{
  return sub_25AAAC2B0();
}

uint64_t sub_25AAA666C()
{
  return sub_25AAA6674();
}

uint64_t sub_25AAA6674()
{
  return sub_25AAAC290();
}

uint64_t sub_25AAA669C()
{
  return sub_25AAA66A4();
}

uint64_t sub_25AAA66A4()
{
  return sub_25AAAC2B0();
}

ProactiveSummarizationClient::MailEntity::Categories sub_25AAA66E8@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = MailEntity.Categories.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_25AAA6714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MailEntity.Categories.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t static MailEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25AAAB800();
  OUTLINED_FUNCTION_8();
  uint64_t v150 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_2();
  uint64_t v149 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481408);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_246();
  uint64_t v151 = v10;
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = &v142[-v12];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
  uint64_t v15 = OUTLINED_FUNCTION_14_0(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_246();
  uint64_t v148 = v16;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v20 = &v142[-v19];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  unint64_t v23 = &v142[-v22];
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  unint64_t v26 = &v142[-v25];
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  v29 = &v142[-v28];
  MEMORY[0x270FA5388](v27);
  v31 = &v142[-v30];
  BOOL v32 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v32)
  {
    sub_25AAAC1E0();
    uint64_t result = OUTLINED_FUNCTION_22();
    if ((v34 & 1) == 0) {
      return result;
    }
  }
  uint64_t v35 = *(void *)(a1 + 24);
  uint64_t v36 = *(void *)(a2 + 24);
  if (!v35)
  {
    if (v36) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v36) {
    return 0;
  }
  BOOL v37 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && v35 == v36;
  if (v37 || (sub_25AAAC1E0(), uint64_t result = OUTLINED_FUNCTION_22(), (v38 & 1) != 0))
  {
LABEL_15:
    uint64_t v39 = *(void *)(a1 + 40);
    uint64_t v40 = *(void *)(a2 + 40);
    if (v39)
    {
      if (!v40) {
        return 0;
      }
      if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v39 != v40)
      {
        sub_25AAAC1E0();
        uint64_t result = OUTLINED_FUNCTION_22();
        if ((v42 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v40)
    {
      return 0;
    }
    if (*(void *)(a1 + 48) != *(void *)(a2 + 48) || *(void *)(a1 + 56) != *(void *)(a2 + 56))
    {
      sub_25AAAC1E0();
      uint64_t result = OUTLINED_FUNCTION_22();
      if ((v44 & 1) == 0) {
        return result;
      }
    }
    uint64_t v45 = *(void **)(a1 + 64);
    v46 = *(void **)(a2 + 64);
    if (v45)
    {
      if (!v46 || (sub_25AA1CF38(v45, v46) & 1) == 0) {
        return 0;
      }
    }
    else if (v46)
    {
      return 0;
    }
    char v47 = *(unsigned char *)(a1 + 136);
    long long v48 = *(_OWORD *)(a1 + 88);
    v154[0] = *(_OWORD *)(a1 + 72);
    v154[1] = v48;
    long long v49 = *(_OWORD *)(a1 + 120);
    v154[2] = *(_OWORD *)(a1 + 104);
    v154[3] = v49;
    char v155 = v47;
    char v50 = *(unsigned char *)(a2 + 136);
    long long v51 = *(_OWORD *)(a2 + 88);
    v152[0] = *(_OWORD *)(a2 + 72);
    v152[1] = v51;
    long long v52 = *(_OWORD *)(a2 + 120);
    v152[2] = *(_OWORD *)(a2 + 104);
    v152[3] = v52;
    char v153 = v50;
    if (!static EntityHandle.== infix(_:_:)((uint64_t *)v154, (uint64_t *)v152)
      || (sub_25AA1D008(*(void *)(a1 + 144), *(void *)(a2 + 144)) & 1) == 0)
    {
      return 0;
    }
    uint64_t v53 = *(void *)(a2 + 152);
    if (*(void *)(a1 + 152))
    {
      if (!v53) {
        return 0;
      }
      OUTLINED_FUNCTION_49_3(v53);
      swift_bridgeObjectRetain();
      int v54 = OUTLINED_FUNCTION_56_1();
      OUTLINED_FUNCTION_74_3(v54);
      swift_bridgeObjectRelease();
      if ((v145 & 1) == 0) {
        return 0;
      }
    }
    else if (v53)
    {
      return 0;
    }
    uint64_t v55 = *(void *)(a2 + 160);
    if (*(void *)(a1 + 160))
    {
      if (!v55) {
        return 0;
      }
      OUTLINED_FUNCTION_49_3(v55);
      swift_bridgeObjectRetain();
      int v56 = OUTLINED_FUNCTION_56_1();
      OUTLINED_FUNCTION_74_3(v56);
      swift_bridgeObjectRelease();
      if ((v145 & 1) == 0) {
        return 0;
      }
    }
    else if (v55)
    {
      return 0;
    }
    if (*(void *)(a1 + 168) != *(void *)(a2 + 168) || *(void *)(a1 + 176) != *(void *)(a2 + 176))
    {
      sub_25AAAC1E0();
      uint64_t result = OUTLINED_FUNCTION_22();
      if ((v58 & 1) == 0) {
        return result;
      }
    }
    uint64_t v59 = *(void *)(a1 + 184);
    unint64_t v60 = *(void *)(a1 + 192);
    uint64_t v61 = *(void *)(a2 + 184);
    unint64_t v62 = *(void *)(a2 + 192);
    if (v60 >> 60 == 15)
    {
      if (v62 >> 60 == 15) {
        goto LABEL_59;
      }
    }
    else if (v62 >> 60 != 15)
    {
      uint64_t v145 = *(void *)(a1 + 184);
      v147 = (unsigned char *)v61;
      unint64_t v144 = v60;
      uint64_t v146 = v62;
      sub_25AAA50FC(v145, v60);
      uint64_t v67 = OUTLINED_FUNCTION_55_4();
      sub_25AAA50FC(v67, v68);
      uint64_t v69 = OUTLINED_FUNCTION_73_3();
      int v143 = MEMORY[0x26114BB00](v69);
      uint64_t v70 = OUTLINED_FUNCTION_55_4();
      sub_25AA48364(v70, v71);
      uint64_t v72 = OUTLINED_FUNCTION_73_3();
      sub_25AA48364(v72, v73);
      if ((v143 & 1) == 0) {
        return 0;
      }
LABEL_59:
      uint64_t v74 = *(void *)(a1 + 208);
      uint64_t v75 = *(void *)(a2 + 208);
      if (v74)
      {
        if (!v75) {
          return 0;
        }
        if (*(void *)(a1 + 200) != *(void *)(a2 + 200) || v74 != v75)
        {
          sub_25AAAC1E0();
          uint64_t result = OUTLINED_FUNCTION_22();
          if ((v77 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v75)
      {
        return 0;
      }
      uint64_t v78 = *(void *)(a1 + 224);
      uint64_t v79 = *(void *)(a2 + 224);
      if (v78)
      {
        if (!v79) {
          return 0;
        }
        if (*(void *)(a1 + 216) != *(void *)(a2 + 216) || v78 != v79)
        {
          sub_25AAAC1E0();
          uint64_t result = OUTLINED_FUNCTION_22();
          if ((v81 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v79)
      {
        return 0;
      }
      if (*(unsigned __int8 *)(a1 + 232) != *(unsigned __int8 *)(a2 + 232)
        || (sub_25AA1CF38(*(void **)(a1 + 240), *(void **)(a2 + 240)) & 1) == 0
        || (sub_25AA1D0EC(*(void *)(a1 + 248), *(void *)(a2 + 248)) & 1) == 0)
      {
        return 0;
      }
      uint64_t v82 = *(void *)(a1 + 264);
      uint64_t v83 = *(void *)(a2 + 264);
      if (v82)
      {
        if (!v83) {
          return 0;
        }
        if (*(void *)(a1 + 256) != *(void *)(a2 + 256) || v82 != v83)
        {
          sub_25AAAC1E0();
          uint64_t result = OUTLINED_FUNCTION_22();
          if ((v85 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v83)
      {
        return 0;
      }
      uint64_t v146 = type metadata accessor for MailEntity();
      sub_25AA23608(a1 + *(int *)(v146 + 84), (uint64_t)v31);
      OUTLINED_FUNCTION_23_8();
      sub_25AA23608(a2 + *(int *)(v86 + 84), (uint64_t)v29);
      v147 = &v13[*(int *)(v8 + 48)];
      sub_25AA23608((uint64_t)v31, (uint64_t)v13);
      sub_25AA23608((uint64_t)v29, (uint64_t)v147);
      OUTLINED_FUNCTION_21_0((uint64_t)v13);
      if (v32)
      {
        sub_25AA23FC0((uint64_t)v29, &qword_26A481400);
        sub_25AA23FC0((uint64_t)v31, &qword_26A481400);
        OUTLINED_FUNCTION_21_0((uint64_t)v147);
        if (v32)
        {
          sub_25AA23FC0((uint64_t)v13, &qword_26A481400);
LABEL_99:
          uint64_t v92 = v146;
          sub_25AA23608(a1 + *(int *)(v146 + 88), (uint64_t)v23);
          sub_25AA23608(a2 + *(int *)(v92 + 88), (uint64_t)v20);
          uint64_t v93 = v151;
          uint64_t v94 = v151 + *(int *)(v8 + 48);
          sub_25AA23608((uint64_t)v23, v151);
          sub_25AA23608((uint64_t)v20, v94);
          OUTLINED_FUNCTION_21_0(v93);
          if (v32)
          {
            sub_25AA23FC0((uint64_t)v20, &qword_26A481400);
            sub_25AA23FC0((uint64_t)v23, &qword_26A481400);
            OUTLINED_FUNCTION_21_0(v94);
            if (v32)
            {
              sub_25AA23FC0(v151, &qword_26A481400);
LABEL_110:
              OUTLINED_FUNCTION_23_8();
              uint64_t v102 = *(int *)(v101 + 92);
              v103 = (void *)(a1 + v102);
              char v104 = *(unsigned char *)(a1 + v102 + 8);
              v105 = (void *)(a2 + v102);
              int v106 = *(unsigned __int8 *)(a2 + v102 + 8);
              if (v104)
              {
                if (!v106) {
                  return 0;
                }
              }
              else
              {
                if (*v103 != *v105) {
                  LOBYTE(v106) = 1;
                }
                if (v106) {
                  return 0;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v107 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v108 == 2 || ((v109 ^ v108) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v110 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v111 == 2 || ((v112 ^ v111) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v113 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v114 == 2 || ((v115 ^ v114) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v116 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v117 == 2 || ((v118 ^ v117) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v119 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v120 == 2 || ((v121 ^ v120) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v122 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v123 == 2 || ((v124 ^ v123) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              OUTLINED_FUNCTION_12();
              if (v32)
              {
                if (v125 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = OUTLINED_FUNCTION_14();
                if (v126 == 2 || ((v127 ^ v126) & 1) == 0) {
                  return result;
                }
              }
              OUTLINED_FUNCTION_23_8();
              if (*(unsigned __int8 *)(a1 + *(int *)(v128 + 124)) == *(unsigned __int8 *)(a2 + *(int *)(v128 + 124)))
              {
                OUTLINED_FUNCTION_23_8();
                uint64_t v130 = *(int *)(v129 + 128);
                v131 = (void *)(a1 + v130);
                uint64_t v132 = *(void *)(a1 + v130 + 8);
                v133 = (void *)(a2 + v130);
                uint64_t v134 = v133[1];
                if (v132)
                {
                  if (!v134) {
                    return 0;
                  }
                  if (*v131 != *v133 || v132 != v134)
                  {
                    sub_25AAAC1E0();
                    uint64_t result = OUTLINED_FUNCTION_22();
                    if ((v136 & 1) == 0) {
                      return result;
                    }
                  }
                }
                else if (v134)
                {
                  return 0;
                }
                OUTLINED_FUNCTION_23_8();
                uint64_t v138 = *(int *)(v137 + 132);
                uint64_t v139 = *(void *)(a2 + v138);
                if (*(void *)(a1 + v138))
                {
                  if (v139)
                  {
                    swift_bridgeObjectRetain();
                    uint64_t v140 = swift_bridgeObjectRetain();
                    char v141 = sub_25AAA72F8(v140, v139);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (v141) {
                      return 1;
                    }
                  }
                }
                else if (!v139)
                {
                  return 1;
                }
              }
              return 0;
            }
          }
          else
          {
            sub_25AA23608(v151, v148);
            OUTLINED_FUNCTION_21_0(v94);
            if (!v95)
            {
              uint64_t v96 = v150;
              uint64_t v97 = v149;
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v150 + 32))(v149, v94, v4);
              sub_25AAAAFE4((uint64_t)&qword_26A481410);
              uint64_t v98 = v148;
              char v99 = sub_25AAABA20();
              v100 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
              v100(v97, v4);
              sub_25AA23FC0((uint64_t)v20, &qword_26A481400);
              sub_25AA23FC0((uint64_t)v23, &qword_26A481400);
              v100(v98, v4);
              sub_25AA23FC0(v151, &qword_26A481400);
              if ((v99 & 1) == 0) {
                return 0;
              }
              goto LABEL_110;
            }
            sub_25AA23FC0((uint64_t)v20, &qword_26A481400);
            sub_25AA23FC0((uint64_t)v23, &qword_26A481400);
            (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v148, v4);
          }
          uint64_t v88 = v151;
LABEL_108:
          sub_25AA23FC0(v88, &qword_26A481408);
          return 0;
        }
      }
      else
      {
        sub_25AA23608((uint64_t)v13, (uint64_t)v26);
        OUTLINED_FUNCTION_21_0((uint64_t)v147);
        if (!v87)
        {
          (*(void (**)(uint64_t, unsigned char *, uint64_t))(v150 + 32))(v149, v147, v4);
          sub_25AAAAFE4((uint64_t)&qword_26A481410);
          LODWORD(v144) = sub_25AAABA20();
          uint64_t v89 = *(void *)(v150 + 8);
          uint64_t v145 = v150 + 8;
          v147 = (unsigned char *)v89;
          OUTLINED_FUNCTION_42_6();
          v90();
          sub_25AA23FC0((uint64_t)v29, &qword_26A481400);
          sub_25AA23FC0((uint64_t)v31, &qword_26A481400);
          OUTLINED_FUNCTION_42_6();
          v91();
          sub_25AA23FC0((uint64_t)v13, &qword_26A481400);
          if ((v144 & 1) == 0) {
            return 0;
          }
          goto LABEL_99;
        }
        sub_25AA23FC0((uint64_t)v29, &qword_26A481400);
        sub_25AA23FC0((uint64_t)v31, &qword_26A481400);
        (*(void (**)(unsigned char *, uint64_t))(v150 + 8))(v26, v4);
      }
      uint64_t v88 = (uint64_t)v13;
      goto LABEL_108;
    }
    uint64_t v63 = *(void *)(a2 + 184);
    unint64_t v64 = *(void *)(a2 + 192);
    sub_25AAA50FC(v59, v60);
    sub_25AAA50FC(v63, v64);
    uint64_t v65 = OUTLINED_FUNCTION_17();
    sub_25AA48364(v65, v66);
    sub_25AA48364(v63, v64);
    return 0;
  }
  return result;
}

uint64_t sub_25AAA72F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuotedRegion();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_25AAAAF84(a1 + v12, (uint64_t)v10, (void (*)(void))type metadata accessor for QuotedRegion);
        sub_25AAAAF84(a2 + v12, (uint64_t)v7, (void (*)(void))type metadata accessor for QuotedRegion);
        sub_25AAAAFE4((uint64_t)&unk_26A481E40);
        char v15 = sub_25AAABA20();
        sub_25AAAB028((uint64_t)v7, (void (*)(void))type metadata accessor for QuotedRegion);
        sub_25AAAB028((uint64_t)v10, (void (*)(void))type metadata accessor for QuotedRegion);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_25AAA74C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449657571696E75 && a2 == 0xE800000000000000;
  if (v2 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  BOOL v6 = a1 == 0x64496E69616D6F64 && a2 == 0xE800000000000000;
  if (v6 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  if (a1 == 0xD000000000000010 && (OUTLINED_FUNCTION_19((uint64_t)"donatingBundleId"), v2)
    || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_19((uint64_t)"accountIdentifier"), v2)
    || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  BOOL v7 = a1 == 0x48746E756F636361 && a2 == 0xEE0073656C646E61;
  if (v7 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  BOOL v8 = a1 == 0x61487265646E6573 && a2 == 0xEC000000656C646ELL;
  if (v8 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  if (a1 == 0xD000000000000010 && (OUTLINED_FUNCTION_19((uint64_t)"recipientHandles"), v2)
    || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  if (a1 == 0xD000000000000017 && (OUTLINED_FUNCTION_98_2(), v2) || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  if (a1 == 0xD00000000000001ALL && (OUTLINED_FUNCTION_98_2(), v2) || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  BOOL v9 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
  if (v9 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  BOOL v10 = a1 == 0x746E6F436C6D7468 && a2 == 0xEB00000000746E65;
  if (v10 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  BOOL v11 = a1 == 0x747865546C6D7468 && a2 == 0xEF746E65746E6F43;
  if (v11 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  BOOL v12 = a1 == 0x746E6F4374786574 && a2 == 0xEB00000000746E65;
  if (v12 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_19((uint64_t)"isFullyDownloaded"), v2)
    || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  if (a1 == 0xD000000000000012 && (OUTLINED_FUNCTION_98_2(), v2) || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  BOOL v13 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
  if (v13 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  if (a1 == 0x61737265766E6F63 && a2 == 0xEE0064496E6F6974)
  {
    OUTLINED_FUNCTION_67_4();
LABEL_96:
    swift_bridgeObjectRelease();
    return 16;
  }
  if (OUTLINED_FUNCTION_1()) {
    goto LABEL_96;
  }
  BOOL v15 = a1 == 0x746E655365746164 && a2 == 0xE800000000000000;
  if (v15 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  BOOL v16 = a1 == 0x6563655265746164 && a2 == 0xEC00000064657669;
  if (v16 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  BOOL v17 = a1 == 0x657461436C69616DLL && a2 == 0xEE00736569726F67;
  if (v17 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  BOOL v18 = a1 == 0x77654E7369 && a2 == 0xE500000000000000;
  if (v18 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  BOOL v19 = a1 == 0x6361466F77547369 && a2 == 0xEF65646F43726F74;
  if (v19 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 21;
  }
  BOOL v20 = a1 == 0x654D6D6F72467369 && a2 == 0xE800000000000000;
  if (v20 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 22;
  }
  BOOL v21 = a1 == 0x6B6E754A7369 && a2 == 0xE600000000000000;
  if (v21 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 23;
  }
  BOOL v22 = a1 == 0x646165527369 && a2 == 0xE600000000000000;
  if (v22 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 24;
  }
  BOOL v23 = a1 == 0x5049567369 && a2 == 0xE500000000000000;
  if (v23 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  BOOL v24 = a1 == 0x656767616C467369 && a2 == 0xE900000000000064;
  if (v24 || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 26;
  }
  if (a1 == 0xD000000000000011 && (OUTLINED_FUNCTION_19((uint64_t)"isSpotlightUpdate"), v2)
    || (OUTLINED_FUNCTION_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 27;
  }
  if (a1 == 0x6163696669746F6ELL && a2 == 0xEE0064496E6F6974)
  {
    OUTLINED_FUNCTION_67_4();
LABEL_168:
    swift_bridgeObjectRelease();
    return 28;
  }
  if (OUTLINED_FUNCTION_1()) {
    goto LABEL_168;
  }
  if (a1 == 0x65526465746F7571 && a2 == 0xED0000736E6F6967)
  {
    swift_bridgeObjectRelease();
    return 29;
  }
  else
  {
    char v27 = OUTLINED_FUNCTION_1();
    swift_bridgeObjectRelease();
    if (v27) {
      return 29;
    }
    else {
      return 30;
    }
  }
}

uint64_t sub_25AAA7F7C(char a1)
{
  uint64_t result = 0x6449657571696E75;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x64496E69616D6F64;
      break;
    case 2:
      uint64_t result = 0xD000000000000010;
      break;
    case 3:
    case 13:
    case 27:
      uint64_t result = 0xD000000000000011;
      break;
    case 4:
      uint64_t result = 0x48746E756F636361;
      break;
    case 5:
      uint64_t result = 0x61487265646E6573;
      break;
    case 6:
      uint64_t result = 0xD000000000000010;
      break;
    case 7:
      uint64_t result = 0xD000000000000017;
      break;
    case 8:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      uint64_t result = 0x7463656A627573;
      break;
    case 10:
      unsigned int v3 = 1819112552;
      goto LABEL_13;
    case 11:
      uint64_t result = 0x747865546C6D7468;
      break;
    case 12:
      unsigned int v3 = 1954047348;
LABEL_13:
      uint64_t result = v3 | 0x746E6F4300000000;
      break;
    case 14:
      uint64_t result = 0xD000000000000012;
      break;
    case 15:
      uint64_t result = 0x656D686361747461;
      break;
    case 16:
      uint64_t result = 0x61737265766E6F63;
      break;
    case 17:
      uint64_t result = 0x746E655365746164;
      break;
    case 18:
      uint64_t result = 0x6563655265746164;
      break;
    case 19:
      uint64_t result = 0x657461436C69616DLL;
      break;
    case 20:
      uint64_t result = 0x77654E7369;
      break;
    case 21:
      uint64_t result = 0x6361466F77547369;
      break;
    case 22:
      uint64_t result = 0x654D6D6F72467369;
      break;
    case 23:
      uint64_t result = 0x6B6E754A7369;
      break;
    case 24:
      uint64_t result = 0x646165527369;
      break;
    case 25:
      uint64_t result = 0x5049567369;
      break;
    case 26:
      uint64_t result = 0x656767616C467369;
      break;
    case 28:
      uint64_t result = 0x6163696669746F6ELL;
      break;
    case 29:
      uint64_t result = 0x65526465746F7571;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25AAA831C()
{
  return sub_25AAA7F7C(*v0);
}

uint64_t sub_25AAA8324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25AAA74C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_25AAA834C(unsigned char *a1@<X8>)
{
  *a1 = 30;
}

uint64_t sub_25AAA8358(uint64_t a1)
{
  unint64_t v2 = sub_25AAA9548();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AAA8394(uint64_t a1)
{
  unint64_t v2 = sub_25AAA9548();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MailEntity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481DD8);
  OUTLINED_FUNCTION_8();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_34();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AAA9548();
  sub_25AAAC2E0();
  OUTLINED_FUNCTION_41_5();
  if (!v1)
  {
    OUTLINED_FUNCTION_7_5(1);
    OUTLINED_FUNCTION_7_5(2);
    OUTLINED_FUNCTION_41_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B32EDD0);
    sub_25AA1F83C((uint64_t)&qword_26B32EDD8);
    OUTLINED_FUNCTION_38_3();
    sub_25AA1EA24();
    OUTLINED_FUNCTION_72_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A481310);
    sub_25AAA96AC((uint64_t)&qword_26A481318);
    OUTLINED_FUNCTION_72_0();
    OUTLINED_FUNCTION_37_5(7);
    OUTLINED_FUNCTION_37_5(8);
    OUTLINED_FUNCTION_41_5();
    sub_25AAA9594();
    OUTLINED_FUNCTION_38_3();
    OUTLINED_FUNCTION_7_5(11);
    OUTLINED_FUNCTION_7_5(12);
    OUTLINED_FUNCTION_52_4(13);
    OUTLINED_FUNCTION_72_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A481320);
    sub_25AAA9764((uint64_t)&qword_26A481328);
    OUTLINED_FUNCTION_72_0();
    OUTLINED_FUNCTION_7_5(16);
    type metadata accessor for MailEntity();
    sub_25AAAB800();
    sub_25AAAAFE4((uint64_t)&qword_26A481300);
    OUTLINED_FUNCTION_38_3();
    OUTLINED_FUNCTION_38_3();
    sub_25AAA95E0();
    OUTLINED_FUNCTION_38_3();
    OUTLINED_FUNCTION_4_10(20);
    OUTLINED_FUNCTION_4_10(21);
    OUTLINED_FUNCTION_4_10(22);
    OUTLINED_FUNCTION_4_10(23);
    OUTLINED_FUNCTION_4_10(24);
    OUTLINED_FUNCTION_4_10(25);
    OUTLINED_FUNCTION_4_10(26);
    OUTLINED_FUNCTION_52_4(27);
    OUTLINED_FUNCTION_7_5(28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A481DF0);
    sub_25AAA962C((uint64_t)&unk_26A481DF8);
    OUTLINED_FUNCTION_38_3();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t MailEntity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v85 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
  uint64_t v3 = OUTLINED_FUNCTION_14_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_246();
  uint64_t v84 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v83 = (uint64_t)v78 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A481E08);
  OUTLINED_FUNCTION_8();
  uint64_t v87 = v8;
  uint64_t v88 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_2();
  uint64_t v95 = v9;
  uint64_t v10 = type metadata accessor for MailEntity();
  BOOL v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_34();
  uint64_t v14 = v13 - v12;
  *(void *)(v14 + 64) = 0;
  uint64_t v15 = v13 - v12;
  *(void *)(v15 + 152) = 0;
  uint64_t v86 = (void *)(v15 + 152);
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(void *)(v14 + 160) = 0;
  *(_OWORD *)(v14 + 184) = xmmword_25AAB6FC0;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(void *)(v14 + 256) = 0;
  *(void *)(v14 + 264) = 0;
  uint64_t v16 = v14 + v11[23];
  uint64_t v17 = sub_25AAAB800();
  uint64_t v93 = v16;
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  uint64_t v92 = v14 + v11[24];
  __swift_storeEnumTagSinglePayload(v92, 1, 1, v17);
  uint64_t v18 = v14 + v11[25];
  *(void *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 8) = 1;
  OUTLINED_FUNCTION_59_2(2);
  OUTLINED_FUNCTION_59_2(v19);
  OUTLINED_FUNCTION_59_2(v20);
  OUTLINED_FUNCTION_59_2(v21);
  uint64_t v22 = v11[30];
  *(unsigned char *)(v14 + v22) = v23;
  uint64_t v24 = v11[31];
  *(unsigned char *)(v14 + v24) = v23;
  uint64_t v25 = v11[32];
  *(unsigned char *)(v14 + v25) = v23;
  uint64_t v26 = v11[33];
  *(unsigned char *)(v14 + v26) = 0;
  char v27 = (uint64_t *)(v14 + v11[34]);
  *char v27 = 0;
  v27[1] = 0;
  v90 = v27;
  uint64_t v91 = v11[35];
  uint64_t v94 = v14;
  *(void *)(v14 + v91) = 0;
  unsigned int v28 = __swift_project_boxed_opaque_existential_1(v96, v96[3]);
  sub_25AAA9548();
  uint64_t v29 = v89;
  sub_25AAAC2C0();
  if (v29)
  {
    uint64_t v30 = OUTLINED_FUNCTION_57_1();
    uint64_t v33 = v94;
    __swift_destroy_boxed_opaque_existential_1(v30);
    if (v28) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v28 >> 3)) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    if ((v28 >> 5))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if ((v28 >> 6)) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v28 >> 9)) {
      swift_bridgeObjectRelease();
    }
    sub_25AA48364(*(void *)(v33 + 184), *(void *)(v33 + 192));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v28 >> 14)) {
      swift_bridgeObjectRelease();
    }
    if ((v28 >> 15)) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25AA23FC0(v93, &qword_26A481400);
    sub_25AA23FC0(v92, &qword_26A481400);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v31 = v86;
    uint64_t v89 = v17;
    v80 = (void *)v18;
    uint64_t v81 = v22;
    uint64_t v82 = v24;
    uint64_t v79 = v26;
    LOBYTE(v97) = 0;
    uint64_t v32 = sub_25AAAC0C0();
    uint64_t v34 = v94;
    *(void *)uint64_t v94 = v32;
    *(void *)(v34 + 8) = v35;
    *(void *)(v34 + 16) = OUTLINED_FUNCTION_68_4(1);
    *(void *)(v34 + 24) = v36;
    *(void *)(v34 + 32) = OUTLINED_FUNCTION_68_4(2);
    *(void *)(v34 + 40) = v37;
    *(void *)(v34 + 48) = OUTLINED_FUNCTION_69_3(3);
    *(void *)(v34 + 56) = v38;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B32EDD0);
    char v102 = 4;
    sub_25AA1F83C((uint64_t)&qword_26B32E3F0);
    OUTLINED_FUNCTION_71_3();
    v78[3] = v39;
    uint64_t v41 = v40;
    sub_25AAAC0B0();
    v78[2] = v41;
    *(void *)(v34 + 64) = v97;
    char v102 = 5;
    sub_25AA1F89C();
    sub_25AAAC0F0();
    char v42 = v101;
    long long v43 = v98;
    *(_OWORD *)(v34 + 72) = v97;
    *(_OWORD *)(v34 + 88) = v43;
    long long v44 = v100;
    *(_OWORD *)(v34 + 104) = v99;
    *(_OWORD *)(v34 + 120) = v44;
    *(unsigned char *)(v34 + 136) = v42;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481310);
    char v102 = 6;
    sub_25AAA96AC((uint64_t)&qword_26A481378);
    OUTLINED_FUNCTION_71_3();
    v78[1] = v45;
    v78[0] = v46;
    sub_25AAAC0F0();
    *(void *)(v34 + 144) = v97;
    OUTLINED_FUNCTION_26_6(7);
    void *v31 = v97;
    OUTLINED_FUNCTION_26_6(8);
    *(void *)(v34 + 160) = v97;
    uint64_t v47 = OUTLINED_FUNCTION_69_3(9);
    uint64_t v48 = v94;
    *(void *)(v94 + 168) = v47;
    *(void *)(v48 + 176) = v49;
    char v102 = 10;
    sub_25AAA9718();
    OUTLINED_FUNCTION_44_4();
    *(_OWORD *)(v94 + 184) = v97;
    uint64_t v50 = OUTLINED_FUNCTION_27_6(11);
    uint64_t v51 = v94;
    *(void *)(v94 + 200) = v50;
    *(void *)(v51 + 208) = v52;
    uint64_t v53 = OUTLINED_FUNCTION_27_6(12);
    uint64_t v54 = v94;
    *(void *)(v94 + 216) = v53;
    *(void *)(v54 + 224) = v55;
    *(unsigned char *)(v94 + 232) = OUTLINED_FUNCTION_70_2(13) & 1;
    char v102 = 14;
    sub_25AAAC0F0();
    *(void *)(v94 + 240) = v97;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A481320);
    char v102 = 15;
    sub_25AAA9764((uint64_t)&qword_26A481380);
    OUTLINED_FUNCTION_36_5();
    sub_25AAAC0F0();
    *(void *)(v94 + 248) = v97;
    uint64_t v56 = OUTLINED_FUNCTION_27_6(16);
    uint64_t v57 = v94;
    *(void *)(v94 + 256) = v56;
    *(void *)(v57 + 264) = v58;
    LOBYTE(v97) = 17;
    sub_25AAAAFE4((uint64_t)&qword_26A481368);
    OUTLINED_FUNCTION_50_3();
    sub_25AA236AC(v83, v93);
    LOBYTE(v97) = 18;
    OUTLINED_FUNCTION_23_8();
    OUTLINED_FUNCTION_50_3();
    sub_25AA236AC(v84, v92);
    char v102 = 19;
    sub_25AAA97E4();
    OUTLINED_FUNCTION_44_4();
    char v59 = BYTE8(v97);
    unint64_t v60 = v80;
    void *v80 = v97;
    *((unsigned char *)v60 + 8) = v59;
    LOBYTE(v97) = 20;
    uint64_t v61 = sub_25AAAC0A0();
    OUTLINED_FUNCTION_41(v61, v94);
    uint64_t v62 = OUTLINED_FUNCTION_13_7(21);
    OUTLINED_FUNCTION_41(v62, v94);
    uint64_t v63 = OUTLINED_FUNCTION_13_7(22);
    OUTLINED_FUNCTION_41(v63, v94);
    uint64_t v64 = OUTLINED_FUNCTION_13_7(23);
    OUTLINED_FUNCTION_41(v64, v94);
    uint64_t v65 = OUTLINED_FUNCTION_13_7(24);
    OUTLINED_FUNCTION_41(v65, v94);
    *(unsigned char *)(v94 + v82) = OUTLINED_FUNCTION_13_7(25);
    *(unsigned char *)(v94 + v25) = OUTLINED_FUNCTION_13_7(26);
    *(unsigned char *)(v94 + v79) = OUTLINED_FUNCTION_70_2(27) & 1;
    uint64_t v66 = OUTLINED_FUNCTION_27_6(28);
    uint64_t v68 = v67;
    uint64_t v69 = v90;
    swift_bridgeObjectRelease();
    *uint64_t v69 = v66;
    v69[1] = v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A481DF0);
    char v102 = 29;
    sub_25AAA962C((uint64_t)&unk_26A481E20);
    OUTLINED_FUNCTION_36_5();
    sub_25AAAC0B0();
    uint64_t v70 = OUTLINED_FUNCTION_12_9();
    v71(v70);
    uint64_t v72 = v97;
    uint64_t v73 = v91;
    uint64_t v74 = v94;
    swift_bridgeObjectRelease();
    *(void *)(v74 + v73) = v72;
    sub_25AAAAF84(v74, v85, (void (*)(void))type metadata accessor for MailEntity);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v96);
    uint64_t v75 = OUTLINED_FUNCTION_17();
    return sub_25AAAB028(v75, v76);
  }
}

uint64_t (*sub_25AAA94DC())()
{
  return nullsub_1;
}

uint64_t sub_25AAA9514@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MailEntity.init(from:)(a1, a2);
}

uint64_t sub_25AAA952C(void *a1)
{
  return MailEntity.encode(to:)(a1);
}

unint64_t sub_25AAA9548()
{
  unint64_t result = qword_26A493050[0];
  if (!qword_26A493050[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A493050);
  }
  return result;
}

unint64_t sub_25AAA9594()
{
  unint64_t result = qword_26A481DE0;
  if (!qword_26A481DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481DE0);
  }
  return result;
}

unint64_t sub_25AAA95E0()
{
  unint64_t result = qword_26A481DE8;
  if (!qword_26A481DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481DE8);
  }
  return result;
}

unint64_t sub_25AAA962C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A481DF0);
    sub_25AAAAFE4(v4);
    unint64_t result = OUTLINED_FUNCTION_63_0();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25AAA96AC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A481310);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25AAA9718()
{
  unint64_t result = qword_26A481E10;
  if (!qword_26A481E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481E10);
  }
  return result;
}

unint64_t sub_25AAA9764(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A481320);
    sub_25AAAAFE4(v4);
    unint64_t result = OUTLINED_FUNCTION_63_0();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25AAA97E4()
{
  unint64_t result = qword_26A481E18;
  if (!qword_26A481E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481E18);
  }
  return result;
}

unint64_t sub_25AAA9834()
{
  unint64_t result = qword_26A481E30;
  if (!qword_26A481E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481E30);
  }
  return result;
}

unint64_t sub_25AAA9884()
{
  unint64_t result = qword_26A481E38;
  if (!qword_26A481E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481E38);
  }
  return result;
}

unint64_t sub_25AAA98D4()
{
  unint64_t result = qword_26B32E140;
  if (!qword_26B32E140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32E140);
  }
  return result;
}

unint64_t sub_25AAA9924()
{
  unint64_t result = qword_26B32E148;
  if (!qword_26B32E148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32E148);
  }
  return result;
}

unint64_t sub_25AAA9970(uint64_t a1)
{
  unint64_t result = sub_25AAAAFE4((uint64_t)qword_26B32E818);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25AAA99C8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25AAAAFE4((uint64_t)&unk_26B32E810);
  unint64_t result = sub_25AAAAFE4((uint64_t)&unk_26B32E808);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MailEntity(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_27();
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *(void *)a1 = *a2;
    a1 = v25 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = (const void *)a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v12;
    uint64_t v13 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v13;
    *(void *)(a1 + 128) = a2[16];
    *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
    uint64_t v14 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v14;
    uint64_t v15 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v15;
    __dst = (void *)a2[22];
    *(void *)(a1 + 176) = __dst;
    uint64_t v38 = (__n128 *)(a2 + 23);
    unint64_t v16 = a2[24];
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = swift_bridgeObjectRetain();
    if (v16 >> 60 == 15)
    {
      OUTLINED_FUNCTION_58_4(v17, v18, v19, v20, v21, v22, v23, v24, v37, v38);
    }
    else
    {
      OUTLINED_FUNCTION_75_2(v17, v18, v19, v20, v21, v22, v23, v24, v37, (uint64_t *)v38);
      *(void *)(a1 + 184) = v7;
      *(void *)(a1 + 192) = v16;
    }
    OUTLINED_FUNCTION_16_8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_9_6())
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
      OUTLINED_FUNCTION_14_0(v26);
      memcpy(__dst, v8, *(void *)(v27 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_3_6();
      uint64_t v28 = OUTLINED_FUNCTION_6_5();
      v29(v28);
      OUTLINED_FUNCTION_3_9();
    }
    if (OUTLINED_FUNCTION_9_6())
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
      uint64_t v31 = OUTLINED_FUNCTION_14_0(v30);
      OUTLINED_FUNCTION_15_3(v31, v33, *(void *)(v32 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_3_6();
      uint64_t v34 = OUTLINED_FUNCTION_6_5();
      v35(v34);
      OUTLINED_FUNCTION_3_9();
    }
    OUTLINED_FUNCTION_1_5();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MailEntity(uint64_t a1, uint64_t a2)
{
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void *)(a1 + 192);
  if (v4 >> 60 != 15) {
    sub_25AA48378(*(void *)(a1 + 184), v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 84);
  uint64_t v6 = sub_25AAAB800();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    OUTLINED_FUNCTION_9_1();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 88);
  if (!__swift_getEnumTagSinglePayload(v8, 1, v6))
  {
    OUTLINED_FUNCTION_9_1();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v6);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MailEntity()
{
  OUTLINED_FUNCTION_33();
  uint64_t v2 = *(void *)(v1 + 8);
  *(void *)uint64_t v0 = *(void *)v1;
  *(void *)(v0 + 8) = v2;
  uint64_t v3 = *(void *)(v1 + 24);
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
  *(void *)(v0 + 24) = v3;
  unint64_t v4 = *(const void **)(v1 + 40);
  *(void *)(v0 + 32) = *(void *)(v1 + 32);
  *(void *)(v0 + 40) = v4;
  uint64_t v5 = *(void *)(v1 + 56);
  *(void *)(v0 + 48) = *(void *)(v1 + 48);
  *(void *)(v0 + 56) = v5;
  uint64_t v6 = *(void *)(v1 + 72);
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = *(void *)(v1 + 88);
  *(void *)(v0 + 80) = *(void *)(v1 + 80);
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = *(void *)(v1 + 104);
  *(void *)(v0 + 96) = *(void *)(v1 + 96);
  *(void *)(v0 + 104) = v8;
  uint64_t v9 = *(void *)(v1 + 120);
  *(void *)(v0 + 112) = *(void *)(v1 + 112);
  *(void *)(v0 + 120) = v9;
  *(void *)(v0 + 128) = *(void *)(v1 + 128);
  *(unsigned char *)(v0 + 136) = *(unsigned char *)(v1 + 136);
  uint64_t v10 = *(void *)(v1 + 152);
  *(void *)(v0 + 144) = *(void *)(v1 + 144);
  *(void *)(v0 + 152) = v10;
  uint64_t v11 = *(void *)(v1 + 168);
  *(void *)(v0 + 160) = *(void *)(v1 + 160);
  *(void *)(v0 + 168) = v11;
  __dst = *(void **)(v1 + 176);
  *(void *)(v0 + 176) = __dst;
  uint64_t v33 = (__n128 *)(v1 + 184);
  unint64_t v12 = *(void *)(v1 + 192);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = swift_bridgeObjectRetain();
  if (v12 >> 60 == 15)
  {
    OUTLINED_FUNCTION_58_4(v13, v14, v15, v16, v17, v18, v19, v20, v32, v33);
  }
  else
  {
    OUTLINED_FUNCTION_75_2(v13, v14, v15, v16, v17, v18, v19, v20, v32, (uint64_t *)v33);
    *(void *)(v0 + 184) = v3;
    *(void *)(v0 + 192) = v12;
  }
  OUTLINED_FUNCTION_16_8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_9_6())
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    OUTLINED_FUNCTION_14_0(v21);
    memcpy(__dst, v4, *(void *)(v22 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
    uint64_t v23 = OUTLINED_FUNCTION_6_5();
    v24(v23);
    OUTLINED_FUNCTION_3_9();
  }
  if (OUTLINED_FUNCTION_9_6())
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v26 = OUTLINED_FUNCTION_14_0(v25);
    OUTLINED_FUNCTION_15_3(v26, v28, *(void *)(v27 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
    uint64_t v29 = OUTLINED_FUNCTION_6_5();
    v30(v29);
    OUTLINED_FUNCTION_3_9();
  }
  OUTLINED_FUNCTION_1_5();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t assignWithCopy for MailEntity()
{
  OUTLINED_FUNCTION_33();
  void *v5 = *v4;
  *(void *)(v0 + 8) = v4[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
  *(void *)(v0 + 24) = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 32) = *(void *)(v1 + 32);
  *(void *)(v0 + 40) = *(void *)(v1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 48) = *(void *)(v1 + 48);
  *(void *)(v0 + 56) = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  *(void *)(v0 + 80) = *(void *)(v1 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 88) = *(void *)(v1 + 88);
  *(void *)(v0 + 96) = *(void *)(v1 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 104) = *(void *)(v1 + 104);
  *(void *)(v0 + 112) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 120) = *(void *)(v1 + 120);
  *(void *)(v0 + 128) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 136) = *(unsigned char *)(v1 + 136);
  *(void *)(v0 + 144) = *(void *)(v1 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 152) = *(void *)(v1 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 160) = *(void *)(v1 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 168) = *(void *)(v1 + 168);
  *(void *)(v0 + 176) = *(void *)(v1 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(v1 + 184);
  unint64_t v7 = *(void *)(v1 + 192);
  if (*(void *)(v0 + 192) >> 60 == 15)
  {
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *v6;
      sub_25AAA5110(*v6, *(void *)(v1 + 192));
      *(void *)(v0 + 184) = v8;
      *(void *)(v0 + 192) = v7;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v7 >> 60 == 15)
  {
    sub_25AAAA51C(v0 + 184);
LABEL_6:
    *(_OWORD *)(v0 + 184) = *(_OWORD *)v6;
    goto LABEL_8;
  }
  uint64_t v9 = *v6;
  sub_25AAA5110(*v6, *(void *)(v1 + 192));
  uint64_t v10 = *(void *)(v0 + 184);
  unint64_t v11 = *(void *)(v0 + 192);
  *(void *)(v0 + 184) = v9;
  *(void *)(v0 + 192) = v7;
  sub_25AA48378(v10, v11);
LABEL_8:
  *(void *)(v0 + 200) = *(void *)(v1 + 200);
  *(void *)(v0 + 208) = *(void *)(v1 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 216) = *(void *)(v1 + 216);
  *(void *)(v0 + 224) = *(void *)(v1 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 232) = *(unsigned char *)(v1 + 232);
  *(void *)(v0 + 240) = *(void *)(v1 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 248) = *(void *)(v1 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 256) = *(void *)(v1 + 256);
  *(void *)(v0 + 264) = *(void *)(v1 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_61_3();
  int v12 = OUTLINED_FUNCTION_8_7();
  if (v3)
  {
    if (!v12)
    {
      OUTLINED_FUNCTION_3_6();
      uint64_t v13 = OUTLINED_FUNCTION_6_5();
      v14(v13);
      OUTLINED_FUNCTION_3_9();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_27();
  if (v15)
  {
    uint64_t v16 = OUTLINED_FUNCTION_17_5();
    v17(v16);
LABEL_13:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v19 = OUTLINED_FUNCTION_14_0(v18);
    OUTLINED_FUNCTION_15_3(v19, v21, *(void *)(v20 + 64));
    goto LABEL_14;
  }
  uint64_t v40 = OUTLINED_FUNCTION_25_4();
  v41(v40);
LABEL_14:
  int v22 = OUTLINED_FUNCTION_8_7();
  if (!v3)
  {
    OUTLINED_FUNCTION_27();
    if (!v25)
    {
      uint64_t v42 = OUTLINED_FUNCTION_25_4();
      v43(v42);
      goto LABEL_20;
    }
    uint64_t v26 = OUTLINED_FUNCTION_17_5();
    v27(v26);
    goto LABEL_19;
  }
  if (v22)
  {
LABEL_19:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v29 = OUTLINED_FUNCTION_14_0(v28);
    OUTLINED_FUNCTION_15_3(v29, v31, *(void *)(v30 + 64));
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_3_6();
  uint64_t v23 = OUTLINED_FUNCTION_6_5();
  v24(v23);
  OUTLINED_FUNCTION_3_9();
LABEL_20:
  uint64_t v32 = v2[23];
  uint64_t v33 = v0 + v32;
  uint64_t v34 = (uint64_t *)(v1 + v32);
  uint64_t v35 = *v34;
  *(unsigned char *)(v33 + 8) = *((unsigned char *)v34 + 8);
  *(void *)uint64_t v33 = v35;
  OUTLINED_FUNCTION_21(v2[24]);
  OUTLINED_FUNCTION_21(v2[25]);
  OUTLINED_FUNCTION_21(v2[26]);
  OUTLINED_FUNCTION_21(v2[27]);
  OUTLINED_FUNCTION_21(v2[28]);
  OUTLINED_FUNCTION_21(v2[29]);
  OUTLINED_FUNCTION_21(v2[30]);
  OUTLINED_FUNCTION_21(v2[31]);
  uint64_t v36 = v2[32];
  uint64_t v37 = (void *)(v0 + v36);
  uint64_t v38 = (void *)(v1 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + v2[33]) = *(void *)(v1 + v2[33]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25AAAA51C(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for MailEntity()
{
  OUTLINED_FUNCTION_33();
  long long v4 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)v3;
  *(_OWORD *)(v5 + 16) = v4;
  long long v6 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v5 + 48) = v6;
  *(void *)(v5 + 64) = *(void *)(v3 + 64);
  memcpy((void *)(v5 + 72), (const void *)(v3 + 72), 0x41uLL);
  *(void *)(v0 + 144) = *(void *)(v1 + 144);
  *(_OWORD *)(v0 + 152) = *(_OWORD *)(v1 + 152);
  *(_OWORD *)(v0 + 168) = *(_OWORD *)(v1 + 168);
  *(_OWORD *)(v0 + 184) = *(_OWORD *)(v1 + 184);
  *(_OWORD *)(v0 + 200) = *(_OWORD *)(v1 + 200);
  *(_OWORD *)(v0 + 216) = *(_OWORD *)(v1 + 216);
  *(unsigned char *)(v0 + 232) = *(unsigned char *)(v1 + 232);
  long long v7 = *(_OWORD *)(v1 + 256);
  *(_OWORD *)(v0 + 240) = *(_OWORD *)(v1 + 240);
  *(_OWORD *)(v0 + 256) = v7;
  sub_25AAAB800();
  if (OUTLINED_FUNCTION_9_6())
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v9 = OUTLINED_FUNCTION_14_0(v8);
    OUTLINED_FUNCTION_15_3(v9, v11, *(void *)(v10 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
    uint64_t v12 = OUTLINED_FUNCTION_13_5();
    v13(v12);
    OUTLINED_FUNCTION_3_9();
  }
  if (OUTLINED_FUNCTION_9_6())
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v15 = OUTLINED_FUNCTION_14_0(v14);
    OUTLINED_FUNCTION_15_3(v15, v17, *(void *)(v16 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
    uint64_t v18 = OUTLINED_FUNCTION_13_5();
    v19(v18);
    OUTLINED_FUNCTION_3_9();
  }
  uint64_t v20 = v2[23];
  uint64_t v21 = v2[24];
  uint64_t v22 = v0 + v20;
  uint64_t v23 = v1 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  *(unsigned char *)(v0 + v21) = *(unsigned char *)(v1 + v21);
  uint64_t v24 = v2[26];
  *(unsigned char *)(v0 + v2[25]) = *(unsigned char *)(v1 + v2[25]);
  *(unsigned char *)(v0 + v24) = *(unsigned char *)(v1 + v24);
  uint64_t v25 = v2[28];
  *(unsigned char *)(v0 + v2[27]) = *(unsigned char *)(v1 + v2[27]);
  *(unsigned char *)(v0 + v25) = *(unsigned char *)(v1 + v25);
  uint64_t v26 = v2[30];
  *(unsigned char *)(v0 + v2[29]) = *(unsigned char *)(v1 + v2[29]);
  *(unsigned char *)(v0 + v26) = *(unsigned char *)(v1 + v26);
  uint64_t v27 = v2[32];
  *(unsigned char *)(v0 + v2[31]) = *(unsigned char *)(v1 + v2[31]);
  *(_OWORD *)(v0 + v27) = *(_OWORD *)(v1 + v27);
  *(void *)(v0 + v2[33]) = *(void *)(v1 + v2[33]);
  return v0;
}

uint64_t assignWithTake for MailEntity()
{
  OUTLINED_FUNCTION_33();
  uint64_t v5 = v4[1];
  *(void *)uint64_t v0 = *v4;
  *(void *)(v0 + 8) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + 24);
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
  *(void *)(v0 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v1 + 40);
  *(void *)(v0 + 32) = *(void *)(v1 + 32);
  *(void *)(v0 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v1 + 56);
  *(void *)(v0 + 48) = *(void *)(v1 + 48);
  *(void *)(v0 + 56) = v8;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v1 + 80);
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  *(void *)(v0 + 80) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v1 + 96);
  *(void *)(v0 + 88) = *(void *)(v1 + 88);
  *(void *)(v0 + 96) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v1 + 112);
  *(void *)(v0 + 104) = *(void *)(v1 + 104);
  *(void *)(v0 + 112) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v1 + 128);
  *(void *)(v0 + 120) = *(void *)(v1 + 120);
  *(void *)(v0 + 128) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 136) = *(unsigned char *)(v1 + 136);
  *(void *)(v0 + 144) = *(void *)(v1 + 144);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 152) = *(void *)(v1 + 152);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 160) = *(void *)(v1 + 160);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v1 + 176);
  *(void *)(v0 + 168) = *(void *)(v1 + 168);
  *(void *)(v0 + 176) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = (_OWORD *)(v1 + 184);
  unint64_t v15 = *(void *)(v0 + 192);
  if (v15 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v16 = *(void *)(v1 + 192);
  if (v16 >> 60 == 15)
  {
    sub_25AAAA51C(v0 + 184);
LABEL_4:
    *(_OWORD *)(v0 + 184) = *v14;
    goto LABEL_6;
  }
  uint64_t v17 = *(void *)(v0 + 184);
  *(void *)(v0 + 184) = *(void *)v14;
  *(void *)(v0 + 192) = v16;
  sub_25AA48378(v17, v15);
LABEL_6:
  uint64_t v18 = *(void *)(v1 + 208);
  *(void *)(v0 + 200) = *(void *)(v1 + 200);
  *(void *)(v0 + 208) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v1 + 224);
  *(void *)(v0 + 216) = *(void *)(v1 + 216);
  *(void *)(v0 + 224) = v19;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 232) = *(unsigned char *)(v1 + 232);
  *(void *)(v0 + 240) = *(void *)(v1 + 240);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 248) = *(void *)(v1 + 248);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v1 + 264);
  *(void *)(v0 + 256) = *(void *)(v1 + 256);
  *(void *)(v0 + 264) = v20;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_61_3();
  int v21 = OUTLINED_FUNCTION_8_7();
  if (v3)
  {
    if (!v21)
    {
      OUTLINED_FUNCTION_3_6();
      uint64_t v22 = OUTLINED_FUNCTION_13_5();
      v23(v22);
      OUTLINED_FUNCTION_3_9();
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_27();
  if (v24)
  {
    uint64_t v25 = OUTLINED_FUNCTION_17_5();
    v26(v25);
LABEL_11:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v28 = OUTLINED_FUNCTION_14_0(v27);
    OUTLINED_FUNCTION_15_3(v28, v30, *(void *)(v29 + 64));
    goto LABEL_12;
  }
  uint64_t v54 = OUTLINED_FUNCTION_22_6();
  v55(v54);
LABEL_12:
  int v31 = OUTLINED_FUNCTION_8_7();
  if (!v3)
  {
    OUTLINED_FUNCTION_27();
    if (!v34)
    {
      uint64_t v56 = OUTLINED_FUNCTION_22_6();
      v57(v56);
      goto LABEL_18;
    }
    uint64_t v35 = OUTLINED_FUNCTION_17_5();
    v36(v35);
    goto LABEL_17;
  }
  if (v31)
  {
LABEL_17:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v38 = OUTLINED_FUNCTION_14_0(v37);
    OUTLINED_FUNCTION_15_3(v38, v40, *(void *)(v39 + 64));
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_3_6();
  uint64_t v32 = OUTLINED_FUNCTION_13_5();
  v33(v32);
  OUTLINED_FUNCTION_3_9();
LABEL_18:
  uint64_t v41 = v2[23];
  uint64_t v42 = v2[24];
  uint64_t v43 = v0 + v41;
  uint64_t v44 = v1 + v41;
  *(void *)uint64_t v43 = *(void *)v44;
  *(unsigned char *)(v43 + 8) = *(unsigned char *)(v44 + 8);
  *(unsigned char *)(v0 + v42) = *(unsigned char *)(v1 + v42);
  uint64_t v45 = v2[26];
  *(unsigned char *)(v0 + v2[25]) = *(unsigned char *)(v1 + v2[25]);
  *(unsigned char *)(v0 + v45) = *(unsigned char *)(v1 + v45);
  uint64_t v46 = v2[28];
  *(unsigned char *)(v0 + v2[27]) = *(unsigned char *)(v1 + v2[27]);
  *(unsigned char *)(v0 + v46) = *(unsigned char *)(v1 + v46);
  uint64_t v47 = v2[30];
  *(unsigned char *)(v0 + v2[29]) = *(unsigned char *)(v1 + v2[29]);
  *(unsigned char *)(v0 + v47) = *(unsigned char *)(v1 + v47);
  uint64_t v48 = v2[32];
  *(unsigned char *)(v0 + v2[31]) = *(unsigned char *)(v1 + v2[31]);
  uint64_t v49 = (void *)(v0 + v48);
  uint64_t v50 = (uint64_t *)(v1 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  *uint64_t v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  *(void *)(v0 + v2[33]) = *(void *)(v1 + v2[33]);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t getEnumTagSinglePayload for MailEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25AAAAAB0);
}

uint64_t sub_25AAAAAB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v9 = a1 + *(int *)(a3 + 84);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MailEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25AAAAB50);
}

uint64_t sub_25AAAAB50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A481400);
    uint64_t v8 = v5 + *(int *)(a4 + 84);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25AAAABD4()
{
  sub_25AA25768();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for MailEntity.Categories()
{
  return &type metadata for MailEntity.Categories;
}

uint64_t getEnumTagSinglePayload for MailEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE3)
  {
    if (a2 + 29 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 29) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 30;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1E;
  int v5 = v6 - 30;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MailEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 29 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 29) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE2)
  {
    unsigned int v6 = ((a2 - 227) >> 8) + 1;
    *unint64_t result = a2 + 29;
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
        JUMPOUT(0x25AAAAE5CLL);
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
          *unint64_t result = a2 + 29;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MailEntity.CodingKeys()
{
  return &type metadata for MailEntity.CodingKeys;
}

unint64_t sub_25AAAAE98()
{
  unint64_t result = qword_26A4934E0[0];
  if (!qword_26A4934E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A4934E0);
  }
  return result;
}

unint64_t sub_25AAAAEE8()
{
  unint64_t result = qword_26A4935F0;
  if (!qword_26A4935F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4935F0);
  }
  return result;
}

unint64_t sub_25AAAAF38()
{
  unint64_t result = qword_26A4935F8[0];
  if (!qword_26A4935F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A4935F8);
  }
  return result;
}

uint64_t sub_25AAAAF84(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_9_1();
  uint64_t v4 = OUTLINED_FUNCTION_17();
  v5(v4);
  return a2;
}

unint64_t sub_25AAAAFE4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25AAAB028(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_9_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_25AAAB084()
{
  unint64_t result = qword_26A481E48;
  if (!qword_26A481E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A481E48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v4 = v2[23];
  uint64_t v5 = v2[24];
  uint64_t v6 = v0 + v4;
  uint64_t v7 = v1 + v4;
  *(void *)uint64_t v6 = *(void *)v7;
  *(unsigned char *)(v6 + 8) = *(unsigned char *)(v7 + 8);
  *(unsigned char *)(v0 + v5) = *(unsigned char *)(v1 + v5);
  uint64_t v8 = v2[26];
  *(unsigned char *)(v0 + v2[25]) = *(unsigned char *)(v1 + v2[25]);
  *(unsigned char *)(v0 + v8) = *(unsigned char *)(v1 + v8);
  uint64_t v9 = v2[28];
  *(unsigned char *)(v0 + v2[27]) = *(unsigned char *)(v1 + v2[27]);
  *(unsigned char *)(v0 + v9) = *(unsigned char *)(v1 + v9);
  uint64_t v10 = v2[30];
  *(unsigned char *)(v0 + v2[29]) = *(unsigned char *)(v1 + v2[29]);
  *(unsigned char *)(v0 + v10) = *(unsigned char *)(v1 + v10);
  uint64_t v11 = v2[32];
  *(unsigned char *)(v0 + v2[31]) = *(unsigned char *)(v1 + v2[31]);
  uint64_t v12 = (void *)(v0 + v11);
  uint64_t v13 = (void *)(v1 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(void *)(v0 + v2[33]) = *(void *)(v1 + v2[33]);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_4_10@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC140();
}

uint64_t OUTLINED_FUNCTION_7_5@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC130();
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  __swift_getEnumTagSinglePayload(v1, 1, v0);
  return __swift_getEnumTagSinglePayload(v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  return *(void *)(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_13_7@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC0A0();
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return type metadata accessor for MailEntity();
}

uint64_t OUTLINED_FUNCTION_16_8()
{
  uint64_t v3 = *(void *)(v1 + 208);
  *(void *)(v0 + 200) = *(void *)(v1 + 200);
  *(void *)(v0 + 208) = v3;
  uint64_t v4 = *(void *)(v1 + 224);
  *(void *)(v0 + 216) = *(void *)(v1 + 216);
  *(void *)(v0 + 224) = v4;
  *(unsigned char *)(v0 + 232) = *(unsigned char *)(v1 + 232);
  uint64_t v5 = *(void *)(v1 + 248);
  *(void *)(v0 + 240) = *(void *)(v1 + 240);
  *(void *)(v0 + 248) = v5;
  uint64_t v6 = *(void *)(v1 + 264);
  *(void *)(v0 + 256) = *(void *)(v1 + 256);
  *(void *)(v0 + 264) = v6;
  return sub_25AAAB800();
}

uint64_t OUTLINED_FUNCTION_21_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_6@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_25AAAC0B0();
}

uint64_t OUTLINED_FUNCTION_27_6@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC090();
}

uint64_t OUTLINED_FUNCTION_36_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_5@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_25AAAC150();
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return sub_25AAAC150();
}

uint64_t OUTLINED_FUNCTION_41_5()
{
  return sub_25AAAC160();
}

uint64_t OUTLINED_FUNCTION_44_4()
{
  return sub_25AAAC0B0();
}

char *OUTLINED_FUNCTION_48_2(char *a1, int64_t a2)
{
  return sub_25AA41254(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_49_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 288) = a1;
  *(void *)(v2 - 280) = v1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  return sub_25AAAC0B0();
}

uint64_t OUTLINED_FUNCTION_52_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC170();
}

uint64_t OUTLINED_FUNCTION_55_4()
{
  return *(void *)(v0 - 280);
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  uint64_t v2 = *(void *)(v0 - 280);
  uint64_t v3 = *(void *)(v0 - 288);
  return sub_25AA1D008(v2, v3);
}

uint64_t OUTLINED_FUNCTION_57_1()
{
  return *(void *)(v0 - 168);
}

__n128 OUTLINED_FUNCTION_58_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 *a10)
{
  __n128 result = *a10;
  *(__n128 *)(v10 + 184) = *a10;
  return result;
}

void OUTLINED_FUNCTION_59_2(char a1@<W8>)
{
  *(void *)(v2 - 256) = v1;
  *(unsigned char *)(v3 + v1) = a1;
}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return sub_25AAAB800();
}

uint64_t OUTLINED_FUNCTION_62_4(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_64_1()
{
  return type metadata accessor for MailEntity();
}

unint64_t OUTLINED_FUNCTION_67_4()
{
  return 0xEE0064496E6F6974;
}

uint64_t OUTLINED_FUNCTION_68_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC090();
}

uint64_t OUTLINED_FUNCTION_69_3@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC0C0();
}

uint64_t OUTLINED_FUNCTION_70_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return sub_25AAAC0D0();
}

uint64_t OUTLINED_FUNCTION_71_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return sub_25AAAC190();
}

uint64_t OUTLINED_FUNCTION_73_3()
{
  return *(void *)(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_74_3(int a1)
{
  *(_DWORD *)(v1 - 296) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_75_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10)
{
  uint64_t v12 = *a10;
  return sub_25AAA5110(v12, v10);
}

uint64_t sub_25AAAB670()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25AAAB680()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25AAAB690()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25AAAB6A0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25AAAB6B0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_25AAAB6C0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25AAAB6D0()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_25AAAB6E0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25AAAB6F0()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_25AAAB700()
{
  return MEMORY[0x270EEEAC0]();
}

uint64_t sub_25AAAB710()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_25AAAB720()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_25AAAB730()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25AAAB740()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25AAAB750()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25AAAB760()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25AAAB770()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25AAAB780()
{
  return MEMORY[0x270EEFEC0]();
}

uint64_t sub_25AAAB790()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_25AAAB7A0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25AAAB7B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25AAAB7C0()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_25AAAB7D0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25AAAB7E0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25AAAB7F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25AAAB800()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25AAAB810()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25AAAB820()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25AAAB830()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25AAAB840()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25AAAB850()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25AAAB860()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_25AAAB870()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_25AAAB880()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_25AAAB890()
{
  return MEMORY[0x270F28948]();
}

uint64_t sub_25AAAB8A0()
{
  return MEMORY[0x270F28978]();
}

uint64_t sub_25AAAB8B0()
{
  return MEMORY[0x270F28988]();
}

uint64_t sub_25AAAB8C0()
{
  return MEMORY[0x270F289A8]();
}

uint64_t sub_25AAAB8D0()
{
  return MEMORY[0x270F289D8]();
}

uint64_t sub_25AAAB8E0()
{
  return MEMORY[0x270F28A20]();
}

uint64_t sub_25AAAB8F0()
{
  return MEMORY[0x270FA1680]();
}

uint64_t sub_25AAAB900()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_25AAAB910()
{
  return MEMORY[0x270FA1798]();
}

uint64_t sub_25AAAB920()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_25AAAB930()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25AAAB940()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_25AAAB950()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25AAAB960()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25AAAB970()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25AAAB980()
{
  return MEMORY[0x270FA1A80]();
}

uint64_t sub_25AAAB990()
{
  return MEMORY[0x270FA1AC0]();
}

uint64_t sub_25AAAB9A0()
{
  return MEMORY[0x270FA1AF0]();
}

uint64_t sub_25AAAB9B0()
{
  return MEMORY[0x270FA1B30]();
}

uint64_t sub_25AAAB9C0()
{
  return MEMORY[0x270FA1B48]();
}

uint64_t sub_25AAAB9D0()
{
  return MEMORY[0x270FA1B90]();
}

uint64_t sub_25AAAB9E0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_25AAAB9F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25AAABA00()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25AAABA10()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25AAABA20()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25AAABA30()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25AAABA50()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_25AAABA60()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_25AAABA70()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_25AAABA80()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_25AAABA90()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_25AAABAA0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25AAABAB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25AAABAC0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25AAABAD0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25AAABAE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25AAABAF0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25AAABB00()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25AAABB10()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25AAABB20()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25AAABB30()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25AAABB40()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_25AAABB50()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25AAABB60()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25AAABB70()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_25AAABB80()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25AAABB90()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25AAABBA0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25AAABBB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25AAABBC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25AAABBD0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25AAABBE0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25AAABBF0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_25AAABC00()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25AAABC10()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_25AAABC20()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_25AAABC30()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25AAABC40()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25AAABC50()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25AAABC60()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25AAABC70()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_25AAABC80()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25AAABC90()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25AAABCA0()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_25AAABCB0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25AAABCC0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25AAABCD0()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_25AAABCE0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25AAABCF0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25AAABD00()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25AAABD10()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25AAABD20()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25AAABD30()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25AAABD40()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_25AAABD50()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25AAABD60()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25AAABD70()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25AAABD80()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25AAABD90()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25AAABDA0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25AAABDB0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25AAABDC0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25AAABDD0()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_25AAABDE0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25AAABDF0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25AAABE00()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_25AAABE10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25AAABE20()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25AAABE30()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25AAABE40()
{
  return MEMORY[0x270FA1100]();
}

uint64_t sub_25AAABE50()
{
  return MEMORY[0x270FA1108]();
}

uint64_t sub_25AAABE60()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25AAABE70()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_25AAABE80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25AAABE90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25AAABEA0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25AAABEB0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_25AAABEC0()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_25AAABEE0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25AAABEF0()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_25AAABF00()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25AAABF10()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25AAABF20()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25AAABF30()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25AAABF40()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25AAABF50()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25AAABF60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25AAABF70()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25AAABF80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25AAABF90()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25AAABFA0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25AAABFB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25AAABFC0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25AAABFD0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25AAABFE0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25AAABFF0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25AAAC000()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25AAAC010()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25AAAC020()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25AAAC030()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25AAAC040()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25AAAC060()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25AAAC070()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25AAAC080()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25AAAC090()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25AAAC0A0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25AAAC0B0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25AAAC0C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25AAAC0D0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25AAAC0E0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25AAAC0F0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25AAAC100()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25AAAC110()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25AAAC120()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25AAAC130()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25AAAC140()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25AAAC150()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25AAAC160()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25AAAC170()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25AAAC180()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25AAAC190()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25AAAC1A0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25AAAC1B0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25AAAC1C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25AAAC1E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25AAAC1F0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_25AAAC210()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25AAAC220()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25AAAC230()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25AAAC240()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25AAAC250()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25AAAC260()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25AAAC270()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25AAAC280()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25AAAC290()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25AAAC2A0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25AAAC2B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25AAAC2C0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25AAAC2D0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_25AAAC2E0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25AAAC310()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}