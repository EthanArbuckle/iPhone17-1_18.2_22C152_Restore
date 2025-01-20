uint64_t sub_25B9DB680()
{
  return sub_25B9DB974(&qword_26A51D788);
}

uint64_t sub_25B9DB68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25B9DBA34(a1, a2, a3, a4, a5, (uint64_t)&qword_26A51D788, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25B9D49A0);
}

uint64_t sub_25B9DB6AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25B9DB6E4(uint64_t a1)
{
  sub_25B9D4B64(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26A51D790);
}

uint64_t sub_25B9DB708()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_25B9DB768()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25B9DBE9C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25B960510;
  sub_25B994D4C();
  return sub_25B9D386C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25B9DB880(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B9D3D2C(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24));
}

uint64_t sub_25B9DB88C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_25B9DB8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25B9D4038(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24), *(void (**)(void, uint64_t, uint64_t, uint64_t, id))(v5 + 32), *(void *)(v5 + 40), *(void *)(v5 + 48), *(void *)(v5 + 56), *(unsigned char *)(v5 + 64), *(void **)(v5 + 72), *(void *)(v5 + 80), *(void *)(v5 + 88));
}

uint64_t sub_25B9DB92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  return v4(v6, a3);
}

uint64_t sub_25B9DB968()
{
  return sub_25B9DB974(&qword_26A51D7B8);
}

uint64_t sub_25B9DB974(uint64_t *a1)
{
  uint64_t v2 = sub_25B94E854(a1);
  sub_25B950790();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 + 24) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v7 | 7;

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v8, v2);
  return MEMORY[0x270FA0238](v1, v9, v10);
}

uint64_t sub_25B9DBA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25B9DBA34(a1, a2, a3, a4, a5, (uint64_t)&qword_26A51D7B8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_25B9D2CEC);
}

uint64_t sub_25B9DBA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_25B9DC1A4();
  uint64_t v14 = *(void *)(sub_25B94E854(v13) - 8);
  uint64_t v15 = *(void *)(v8 + 16);
  uint64_t v16 = v8 + ((*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  return a7(v12, v11, v10, v9, v7, v15, v16);
}

void sub_25B9DBADC(uint64_t a1)
{
  sub_25B9D4B64(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26A51D7C0);
}

uint64_t sub_25B9DBB00()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_25B9DBB60()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_25B9DBE9C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25B95F890;
  sub_25B994D4C();
  return sub_25B9D2044(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25B9DBC68(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B9D25A4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25B9DBC70(uint64_t a1, uint64_t *a2)
{
  sub_25B94E854(a2);
  sub_25B95097C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25B9DBD98()
{
  return v0;
}

uint64_t sub_25B9DBDA8(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_25B9ED2C0();
}

uint64_t sub_25B9DBDD4()
{
  return v0;
}

uint64_t sub_25B9DBDF4()
{
  return v0;
}

uint64_t sub_25B9DBE0C()
{
  return v0;
}

uint64_t sub_25B9DBE28(uint64_t a1, uint64_t a2)
{
  sub_25B9559F0(v2, a2);
  return swift_beginAccess();
}

uint64_t sub_25B9DBE60(uint64_t a1)
{
  return sub_25B9D0230(a1, 1, 0, 1, 0, 1);
}

uint64_t sub_25B9DBE9C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

__n128 sub_25B9DBED8(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  *(void *)(v9 + 72) = a1;
  a1[1].n128_u64[0] = v12;
  a1[1].n128_u8[8] = v10;
  __n128 result = a9;
  a1[2] = a9;
  a1[3].n128_u64[0] = v11;
  return result;
}

uint64_t sub_25B9DBEF8()
{
  return swift_task_alloc();
}

void sub_25B9DBF24(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

id sub_25B9DBF44(float a1)
{
  *uint64_t v2 = a1;
  return v1;
}

uint64_t sub_25B9DBF64()
{
  return v0;
}

uint64_t sub_25B9DBFAC()
{
  return swift_slowAlloc();
}

BOOL sub_25B9DBFC8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_25B9DBFE4()
{
  return swift_slowAlloc();
}

uint64_t sub_25B9DC044()
{
  return v0 + 8;
}

unint64_t sub_25B9DC054(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (result >> 6) + 64) |= 1 << result;
  return result;
}

uint64_t sub_25B9DC0D4()
{
  return v0;
}

uint64_t sub_25B9DC0E8()
{
  return v0;
}

void sub_25B9DC0FC()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_25B9DC118()
{
  return v0;
}

uint64_t sub_25B9DC164()
{
  return sub_25B9CF1F8();
}

uint64_t sub_25B9DC16C()
{
  return sub_25B9ECFF0();
}

uint64_t sub_25B9DC194()
{
  return v0 + 8;
}

uint64_t sub_25B9DC210()
{
  return v0;
}

uint64_t sub_25B9DC220()
{
  return swift_arrayDestroy();
}

uint64_t sub_25B9DC250()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B9DC2A8()
{
  return swift_bridgeObjectRetain();
}

__n128 sub_25B9DC304(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  *(void *)(v9 + 80) = a1;
  __n128 result = a9;
  a1[1] = a9;
  return result;
}

void sub_25B9DC340(uint64_t a1@<X8>)
{
  *(void *)(v2 + 72) = *(void *)(a1 + v1);
}

void sub_25B9DC34C(uint64_t a1@<X8>)
{
  *(void *)(v2 + 64) = *(void *)(a1 + v1);
}

uint64_t sub_25B9DC36C(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t sub_25B9DC378()
{
  return 0;
}

uint64_t sub_25B9DC38C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B9DC3BC(a1, MEMORY[0x263F7F868], a2);
}

uint64_t sub_25B9DC3A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B9DC3BC(a1, MEMORY[0x263F7F918], a2);
}

uint64_t sub_25B9DC3BC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  return _s4Sage24ClassificationXPCRequestC7RequestOwst_0(a3, v8, 1, v7);
}

double sub_25B9DC468@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 88);
    uint64_t v9 = *(void *)(a1 + 104);
    uint64_t v10 = *(void *)(a1 + 128);
    *(unsigned char *)a2 = *(unsigned char *)(a1 + 32);
    *(void *)(a2 + 8) = v3;
    *(void *)(a2 + 16) = v2;
    *(void *)(a2 + 24) = v4;
    *(void *)(a2 + 32) = v5;
    *(void *)(a2 + 40) = v6;
    *(void *)(a2 + 48) = v7;
    *(void *)(a2 + 56) = v8;
    *(unsigned char *)(a2 + 64) = *(unsigned char *)(a1 + 96);
    *(void *)(a2 + 72) = v9;
    *(_OWORD *)(a2 + 80) = *(_OWORD *)(a1 + 112);
    *(void *)(a2 + 96) = v10;
    sub_25B9E2D24(v3, v2, v4, v5, v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    *(void *)(a2 + 88) = 0;
    *(void *)(a2 + 96) = 0;
    *(void *)(a2 + 80) = 1;
  }
  return result;
}

uint64_t TextMessage.SummarizationOptions.requestIdentifier.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.SummarizationOptions.requestIdentifier.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextMessage.SummarizationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.SummarizationOptions.requestedSummarizationStyles.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TextMessage.SummarizationOptions.requestedSummarizationStyles.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.SummarizationOptions.previousMessages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TextMessage.SummarizationOptions.previousMessages.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TextMessage.SummarizationOptions.previousMessages.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.SummarizationOptions.init(requestIdentifier:requestedSummarizationStyles:previousMessages:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t TextMessage.SummarizationOptions.init(requestIdentifier:requestedSummarizationStyles:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  uint64_t v4 = MEMORY[0x263F8EE78];
  a4[2] = a3;
  a4[3] = v4;
  return result;
}

uint64_t TextMessage.SummarizationOptions.init()@<X0>(uint64_t *a1@<X8>)
{
  return sub_25B9DD1E8((uint64_t)&unk_270927CE8, a1);
}

unint64_t sub_25B9DC680(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0xD00000000000001CLL;
  }
  return 0xD000000000000010;
}

unint64_t sub_25B9DC6DC()
{
  return sub_25B9DC680(*v0);
}

uint64_t sub_25B9DC6E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9DD2B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9DC70C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E24CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DC748(uint64_t a1)
{
  unint64_t v2 = sub_25B9E24CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.SummarizationOptions.encode(to:)()
{
}

void TextMessage.SummarizationOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_25B9DD6C4(a1, (uint64_t)&unk_26A51D808, (uint64_t)sub_25B9E24CC, (uint64_t)&type metadata for TextMessage.SummarizationOptions.CodingKeys, a5, a6, a7, a8, vars0, vars8);
}

void sub_25B9DC7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25B9DC814()
{
}

uint64_t (*TextMessage.ClassificationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.ClassificationOptions.isSenderImportant.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t TextMessage.ClassificationOptions.isSenderImportant.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*TextMessage.ClassificationOptions.isSenderImportant.modify())()
{
  return nullsub_1;
}

uint64_t (*TextMessage.ClassificationOptions.previousMessages.modify())()
{
  return nullsub_1;
}

Sage::TextMessage::ClassificationOptions __swiftcall TextMessage.ClassificationOptions.init(requestIdentifier:isSenderImportant:previousMessages:)(Sage::TextMessage::ClassificationOptions requestIdentifier, Swift::Bool_optional isSenderImportant, Swift::OpaquePointer previousMessages)
{
  *(Swift::String *)uint64_t v3 = requestIdentifier.requestIdentifier;
  *(Swift::Bool_optional *)(v3 + 16) = isSenderImportant;
  *(Swift::OpaquePointer *)(v3 + 24) = previousMessages;
  requestIdentifier.previousMessages = previousMessages;
  requestIdentifier.isSenderImportant = isSenderImportant;
  return requestIdentifier;
}

uint64_t sub_25B9DC8AC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2648();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DC8E8(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2648();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.ClassificationOptions.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B94E854(&qword_26A51D818);
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B959380();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E2648();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B9A0B58();
    sub_25B9ED5F0();
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9E25C8((uint64_t)&unk_26A51D800);
    sub_25B9A0A0C();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_25B9E59EC();
  sub_25B961A64();
}

void TextMessage.ClassificationOptions.init(from:)()
{
  sub_25B961A4C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_25B94E854(&qword_26A51D828);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B9A0910();
  sub_25B9E2648();
  sub_25B9A0A34();
  if (v0)
  {
    sub_25B94F65C(v2);
  }
  else
  {
    uint64_t v6 = sub_25B9A0AE0();
    uint64_t v8 = v7;
    sub_25B9A0B58();
    swift_bridgeObjectRetain();
    char v12 = sub_25B9ED520();
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9E25C8((uint64_t)&unk_26A51D810);
    sub_25B9E594C();
    sub_25B9ED590();
    uint64_t v9 = sub_25B961A34();
    v10(v9);
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + 8) = v8;
    *(unsigned char *)(v4 + 16) = v12;
    *(void *)(v4 + 24) = v11;
    swift_bridgeObjectRetain();
    sub_25B94F65C(v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9DCCB4()
{
}

void sub_25B9DCCCC()
{
}

uint64_t TextMessage.ThreadClassificationOptions.requestIdentifier.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.ThreadClassificationOptions.requestIdentifier.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextMessage.ThreadClassificationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.ThreadClassificationOptions.previousMessages.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TextMessage.ThreadClassificationOptions.previousMessages.modify())()
{
  return nullsub_1;
}

Sage::TextMessage::ThreadClassificationOptions __swiftcall TextMessage.ThreadClassificationOptions.init(requestIdentifier:previousMessages:)(Swift::String requestIdentifier, Swift::OpaquePointer previousMessages)
{
  *(Swift::String *)uint64_t v2 = requestIdentifier;
  *(Swift::OpaquePointer *)(v2 + 16) = previousMessages;
  result.requestIdentifier = requestIdentifier;
  result.previousMessages = previousMessages;
  return result;
}

uint64_t sub_25B9DCDB8(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2694();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DCDF4(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2694();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.ThreadClassificationOptions.encode(to:)()
{
  sub_25B961A4C();
  unint64_t v2 = v1;
  sub_25B94E854(&qword_26A51D830);
  sub_25B950790();
  MEMORY[0x270FA5388](v3);
  sub_25B959380();
  sub_25B94F2E0(v2, v2[3]);
  sub_25B9E2694();
  sub_25B9A0C1C();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B9A0B58();
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9E25C8((uint64_t)&unk_26A51D800);
    sub_25B9A0A0C();
  }
  sub_25B9E5920();
  sub_25B959038();
  v4();
  sub_25B9E59EC();
  sub_25B961A64();
}

void TextMessage.ThreadClassificationOptions.init(from:)()
{
  sub_25B961A4C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_25B94E854(&qword_26A51D840);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B9A0910();
  sub_25B9E2694();
  sub_25B9A0A34();
  if (v0)
  {
    sub_25B94F65C(v2);
  }
  else
  {
    uint64_t v6 = sub_25B9A0AE0();
    uint64_t v8 = v7;
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9A0B58();
    sub_25B9E25C8((uint64_t)&unk_26A51D810);
    swift_bridgeObjectRetain();
    sub_25B9E594C();
    sub_25B9ED590();
    uint64_t v9 = sub_25B961A34();
    v10(v9);
    *uint64_t v4 = v6;
    v4[1] = v8;
    v4[2] = v11;
    swift_bridgeObjectRetain();
    sub_25B94F65C(v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9DD14C()
{
}

void sub_25B9DD164()
{
}

uint64_t (*TextMessage.ThreadSummarizationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t (*TextMessage.ThreadSummarizationOptions.requestedSummarizationStyles.modify())()
{
  return nullsub_1;
}

uint64_t (*TextMessage.ThreadSummarizationOptions.previousMessages.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.ThreadSummarizationOptions.init()@<X0>(uint64_t *a1@<X8>)
{
  return sub_25B9DD1E8((uint64_t)&unk_270927F38, a1);
}

uint64_t sub_25B9DD1E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_25B9EC300();
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B950870();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_25B99DB00(a1);
  sub_25B9EC2F0();
  uint64_t v12 = sub_25B9EC2C0();
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  *a2 = v12;
  a2[1] = v14;
  uint64_t v16 = MEMORY[0x263F8EE78];
  a2[2] = v11;
  a2[3] = v16;
  return result;
}

uint64_t sub_25B9DD2B8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025B9EFAB0 || (sub_25B9A0948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000025B9F11E0 || (sub_25B9A0948() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025B9F1220)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_25B9A0948();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B9DD3D8(uint64_t a1)
{
  unint64_t v2 = sub_25B9E26E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DD414(uint64_t a1)
{
  unint64_t v2 = sub_25B9E26E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.ThreadSummarizationOptions.encode(to:)()
{
}

void sub_25B9DD48C()
{
  sub_25B961A4C();
  uint64_t v13 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = sub_25B94E854(v4);
  sub_25B950790();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_25B958FE4();
  uint64_t v9 = v3[3];
  uint64_t v10 = v3;
  uint64_t v12 = v11;
  sub_25B94F2E0(v10, v9);
  v13();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B94E854(&qword_26A51C1C8);
    sub_25B9E2560((uint64_t)&unk_26A51C1D0);
    sub_25B9E59D8();
    sub_25B9ED660();
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9E25C8((uint64_t)&unk_26A51D800);
    sub_25B9E59D8();
    sub_25B9ED660();
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v5);
  sub_25B9E59EC();
  sub_25B961A64();
}

void TextMessage.ThreadSummarizationOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_25B9DD6C4(a1, (uint64_t)&unk_26A51D858, (uint64_t)sub_25B9E26E0, (uint64_t)&type metadata for TextMessage.ThreadSummarizationOptions.CodingKeys, a5, a6, a7, a8, vars0, vars8);
}

void sub_25B9DD6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_25B961A4C();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v24 = v15;
  sub_25B94E854(v16);
  sub_25B950790();
  MEMORY[0x270FA5388](v17);
  sub_25B95BA7C();
  sub_25B94F2E0(v14, v14[3]);
  v12();
  sub_25B9ED7A0();
  if (v10)
  {
    sub_25B94F65C((uint64_t)v14);
  }
  else
  {
    LOBYTE(a10) = 0;
    uint64_t v18 = sub_25B9ED540();
    uint64_t v20 = v19;
    uint64_t v23 = v18;
    sub_25B94E854(&qword_26A51C1C8);
    sub_25B9E2560((uint64_t)&unk_26A51C200);
    swift_bridgeObjectRetain();
    sub_25B9ED590();
    sub_25B94E854(&qword_26A51D7F8);
    sub_25B9E25C8((uint64_t)&unk_26A51D810);
    swift_bridgeObjectRetain();
    sub_25B9ED590();
    uint64_t v21 = sub_25B9E584C();
    v22(v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t *v24 = v23;
    v24[1] = v20;
    v24[2] = a10;
    v24[3] = a10;
    sub_25B94F65C((uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9DD9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25B9DD9B8()
{
}

uint64_t (*TextMessage.VisualPromptOptions.useCase.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.VisualPromptOptions.extractVisualConcepts.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t TextMessage.VisualPromptOptions.extractVisualConcepts.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*TextMessage.VisualPromptOptions.extractVisualConcepts.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.VisualPromptOptions.extractVisualTopLine.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t TextMessage.VisualPromptOptions.extractVisualTopLine.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*TextMessage.VisualPromptOptions.extractVisualTopLine.modify())()
{
  return nullsub_1;
}

Sage::TextMessage::VisualPromptOptions __swiftcall TextMessage.VisualPromptOptions.init(useCase:)(Sage::SummarizationClient::VisualPromptUseCase useCase)
{
  *(unsigned char *)uint64_t v1 = *(unsigned char *)useCase;
  *(_WORD *)(v1 + 1) = 1;
  result.useCase = useCase;
  return result;
}

uint64_t sub_25B9DDA6C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E272C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DDAA8(uint64_t a1)
{
  unint64_t v2 = sub_25B9E272C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.VisualPromptOptions.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B94E854(&qword_26A51D860);
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B959380();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E272C();
  sub_25B9A0C1C();
  sub_25B99E034();
  sub_25B9ED660();
  if (!v0)
  {
    sub_25B9ED620();
    sub_25B9ED620();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_25B961A64();
}

void TextMessage.VisualPromptOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  sub_25B961A4C();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_25B94E854(&qword_26A51D870);
  sub_25B950790();
  MEMORY[0x270FA5388](v18);
  sub_25B9A0910();
  sub_25B9E272C();
  sub_25B9ED7A0();
  if (!v13)
  {
    sub_25B99E080();
    sub_25B9ED590();
    char v19 = sub_25B9ED550();
    char v20 = sub_25B9ED550();
    uint64_t v21 = sub_25B961A34();
    v22(v21);
    *uint64_t v17 = a13;
    v17[1] = v19 & 1;
    v17[2] = v20 & 1;
  }
  sub_25B94F65C(v15);
  sub_25B961A64();
}

void sub_25B9DDDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  TextMessage.VisualPromptOptions.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_25B9DDDE4()
{
}

uint64_t (*TextMessage.ThreadVisualPromptOptions.useCase.modify())()
{
  return nullsub_1;
}

Sage::TextMessage::ThreadVisualPromptOptions __swiftcall TextMessage.ThreadVisualPromptOptions.init(useCase:)(Sage::TextMessage::ThreadVisualPromptOptions useCase)
{
  *uint64_t v1 = *(unsigned char *)useCase.useCase;
  return useCase;
}

uint64_t sub_25B9DDE30(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2778();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DDE6C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2778();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.ThreadVisualPromptOptions.encode(to:)()
{
  sub_25B961A4C();
  unint64_t v2 = v1;
  uint64_t v3 = sub_25B94E854(&qword_26A51D878);
  sub_25B950790();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_25B959398();
  sub_25B94F2E0(v2, v2[3]);
  sub_25B9E2778();
  sub_25B9ED7B0();
  sub_25B99E034();
  sub_25B9ED660();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  sub_25B961A64();
}

void TextMessage.ThreadVisualPromptOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  sub_25B961A4C();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_25B94E854(&qword_26A51D888);
  sub_25B950790();
  MEMORY[0x270FA5388](v18);
  sub_25B959398();
  sub_25B9A0910();
  sub_25B9E2778();
  sub_25B9ED7A0();
  if (!v13)
  {
    sub_25B99E080();
    sub_25B9ED590();
    sub_25B994E98();
    v19();
    *uint64_t v17 = a13;
  }
  sub_25B94F65C(v15);
  sub_25B961A64();
}

void sub_25B9DE0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  TextMessage.ThreadVisualPromptOptions.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_25B9DE0CC()
{
}

uint64_t TextMessage.messageID.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.messageID.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TextMessage.messageID.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.sender.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  char v7 = *(unsigned char *)(v1 + 72);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  unsigned __int8 v8 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  sub_25B9974E8(v3, v4, v8);
  return swift_bridgeObjectRetain();
}

__n128 TextMessage.sender.setter(__n128 *a1)
{
  __n128 v12 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  unint64_t v5 = a1[2].n128_u64[1];
  unint64_t v6 = a1[3].n128_u64[0];
  unsigned __int8 v11 = a1[3].n128_u8[8];
  uint64_t v7 = v1[2].n128_i64[0];
  uint64_t v8 = v1[2].n128_i64[1];
  unsigned __int8 v9 = v1[3].n128_u8[0];
  swift_bridgeObjectRelease();
  sub_25B9974FC(v7, v8, v9);
  swift_bridgeObjectRelease();
  __n128 result = v12;
  v1[1] = v12;
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u64[1] = v3;
  v1[3].n128_u8[0] = v4;
  v1[3].n128_u64[1] = v5;
  v1[4].n128_u64[0] = v6;
  v1[4].n128_u8[8] = v11;
  return result;
}

uint64_t (*TextMessage.sender.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.recipients.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TextMessage.recipients.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*TextMessage.recipients.modify())()
{
  return nullsub_1;
}

uint64_t TextMessage.dateReceived.getter()
{
  type metadata accessor for TextMessage();
  sub_25B9EC2B0();
  sub_25B95097C();
  uint64_t v0 = sub_25B9593F8();
  return v1(v0);
}

uint64_t TextMessage.dateReceived.setter()
{
  uint64_t v2 = v1 + *(int *)(sub_25B9E5864() + 28);
  sub_25B9EC2B0();
  sub_25B95097C();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v2, v0, v3);
}

uint64_t (*TextMessage.dateReceived.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.isUnread.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TextMessage() + 32));
}

uint64_t TextMessage.isUnread.setter(char a1)
{
  uint64_t result = type metadata accessor for TextMessage();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*TextMessage.isUnread.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.threadID.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.threadID.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TextMessage() + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TextMessage.threadID.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.body.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.body.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TextMessage() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TextMessage.body.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.tapbacks.getter()
{
  type metadata accessor for TextMessage();
  return swift_bridgeObjectRetain();
}

uint64_t TextMessage.tapbacks.setter()
{
  uint64_t v2 = *(int *)(sub_25B9E5864() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*TextMessage.tapbacks.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.attachments.getter()
{
  type metadata accessor for TextMessage();
  return swift_bridgeObjectRetain();
}

uint64_t TextMessage.attachments.setter()
{
  uint64_t v2 = *(int *)(sub_25B9E5864() + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*TextMessage.attachments.modify())(void)
{
  return nullsub_1;
}

uint64_t TextMessage.init(messageID:sender:recipients:dateReceived:isUnread:threadID:body:tapbacks:attachments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  long long v25 = *a3;
  uint64_t v15 = *((void *)a3 + 2);
  uint64_t v14 = *((void *)a3 + 3);
  char v16 = *((unsigned char *)a3 + 32);
  uint64_t v17 = *((void *)a3 + 5);
  uint64_t v18 = *((void *)a3 + 6);
  uint64_t v19 = *((unsigned __int8 *)a3 + 56);
  char v20 = (int *)type metadata accessor for TextMessage();
  uint64_t v21 = (void *)(a9 + v20[9]);
  v22 = (void *)(a9 + v20[10]);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(_OWORD *)(a9 + 16) = v25;
  *(void *)(a9 + 32) = v15;
  *(void *)(a9 + 40) = v14;
  *(unsigned char *)(a9 + 48) = v16;
  *(void *)(a9 + 56) = v17;
  *(void *)(a9 + 64) = v18;
  *(unsigned char *)(a9 + 72) = v19;
  sub_25B9E5978(a4);
  sub_25B95097C();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 32))(v19, a5);
  *(unsigned char *)(a9 + v20[8]) = a6;
  *uint64_t v21 = a7;
  v21[1] = a8;
  void *v22 = a10;
  v22[1] = a11;
  *(void *)(a9 + v20[11]) = a12;
  *(void *)(a9 + v20[12]) = a13;
  return result;
}

uint64_t sub_25B9DE8B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x496567617373656DLL && a2 == 0xE900000000000044;
  if (v2 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7265646E6573 && a2 == 0xE600000000000000;
    if (v6 || (sub_25B9ED6A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E65697069636572 && a2 == 0xEA00000000007374;
      if (v7 || (sub_25B9ED6A0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6563655265746164 && a2 == 0xEC00000064657669;
        if (v8 || (sub_25B9ED6A0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x646165726E557369 && a2 == 0xE800000000000000;
          if (v9 || (sub_25B9ED6A0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x4449646165726874 && a2 == 0xE800000000000000;
            if (v10 || (sub_25B9ED6A0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 2036625250 && a2 == 0xE400000000000000;
              if (v11 || (sub_25B9ED6A0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x736B636162706174 && a2 == 0xE800000000000000;
                if (v12 || (sub_25B9ED6A0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  char v14 = sub_25B9ED6A0();
                  swift_bridgeObjectRelease();
                  if (v14) {
                    return 8;
                  }
                  else {
                    return 9;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25B9DEC80()
{
  return 9;
}

uint64_t sub_25B9DEC88(char a1)
{
  uint64_t result = 0x496567617373656DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7265646E6573;
      break;
    case 2:
      uint64_t result = 0x6E65697069636572;
      break;
    case 3:
      uint64_t result = 0x6563655265746164;
      break;
    case 4:
      uint64_t result = 0x646165726E557369;
      break;
    case 5:
      uint64_t result = 0x4449646165726874;
      break;
    case 6:
      uint64_t result = 2036625250;
      break;
    case 7:
      uint64_t result = 0x736B636162706174;
      break;
    case 8:
      uint64_t result = 0x656D686361747461;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B9DEDB4()
{
  return sub_25B9DEC88(*v0);
}

uint64_t sub_25B9DEDBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9DE8B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9DEDE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25B9DEC80();
  *a1 = result;
  return result;
}

uint64_t sub_25B9DEE0C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E27C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DEE48(uint64_t a1)
{
  unint64_t v2 = sub_25B9E27C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TextMessage.encode(to:)(void *a1)
{
  uint64_t v4 = sub_25B94E854(&qword_26A51D890);
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B959380();
  sub_25B94F2E0(a1, a1[3]);
  sub_25B9E27C4();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v1)
  {
    sub_25B99E164();
    sub_25B9A0AB8();
    sub_25B9A0A0C();
    sub_25B94E854(&qword_26A51C2C0);
    sub_25B9E2560((uint64_t)&unk_26A51C2C8);
    sub_25B9A0AB8();
    sub_25B9A0A0C();
    type metadata accessor for TextMessage();
    sub_25B9EC2B0();
    sub_25B9E2928((uint64_t)&unk_26A51C2D0);
    sub_25B9A0A0C();
    sub_25B9ED620();
    sub_25B9E58A0();
    sub_25B9E58A0();
    sub_25B94E854(&qword_26A51D8A0);
    sub_25B9E2560((uint64_t)&unk_26A51D8A8);
    sub_25B9A0AB8();
    sub_25B9A0A0C();
    sub_25B94E854(&qword_26A51C2D8);
    sub_25B9E285C((uint64_t)&unk_26A51C2E0);
    sub_25B9A0AB8();
    sub_25B9A0A0C();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void TextMessage.init(from:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v22 = v4;
  uint64_t v5 = sub_25B9EC2B0();
  sub_25B950790();
  uint64_t v23 = v6;
  MEMORY[0x270FA5388](v7);
  sub_25B959398();
  sub_25B94E854(&qword_26A51D8B8);
  sub_25B950790();
  MEMORY[0x270FA5388](v8);
  sub_25B96DA10();
  type metadata accessor for TextMessage();
  sub_25B95097C();
  MEMORY[0x270FA5388](v9);
  sub_25B950870();
  uint64_t v12 = v11 - v10;
  char v14 = (uint64_t *)(v12 + v13[9]);
  *char v14 = 0;
  v14[1] = 0;
  long long v25 = v14;
  v26 = v13;
  uint64_t v15 = v12;
  char v16 = (uint64_t *)(v12 + v13[10]);
  *char v16 = 0;
  v16[1] = 0;
  v24 = v16;
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E27C4();
  sub_25B9ED7A0();
  if (v0)
  {
    sub_25B94F65C((uint64_t)v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v27) = 0;
    *(void *)uint64_t v15 = sub_25B9ED540();
    *(void *)(v15 + 8) = v17;
    sub_25B99E230();
    sub_25B9ED590();
    *(_OWORD *)(v15 + 16) = v27;
    *(_OWORD *)(v15 + 32) = v28;
    *(unsigned char *)(v15 + 48) = v29;
    *(_OWORD *)(v15 + 56) = v30;
    *(unsigned char *)(v15 + 72) = v31;
    sub_25B94E854(&qword_26A51C2C0);
    sub_25B9E2560((uint64_t)&unk_26A51C300);
    sub_25B94E974();
    *(void *)(v15 + 80) = v27;
    sub_25B9E2928((uint64_t)&unk_26A51C308);
    sub_25B9E59B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v15 + v26[7], v1, v5);
    LOBYTE(v27) = 4;
    *(unsigned char *)(v15 + v26[8]) = sub_25B9ED550() & 1;
    *long long v25 = sub_25B9E5958(5);
    v25[1] = v18;
    uint64_t *v24 = sub_25B9E5958(6);
    v24[1] = v19;
    sub_25B94E854(&qword_26A51D8A0);
    sub_25B9E2560((uint64_t)&unk_26A51D8C0);
    sub_25B94E974();
    *(void *)(v15 + v26[11]) = v27;
    sub_25B94E854(&qword_26A51C2D8);
    sub_25B9E285C((uint64_t)&unk_26A51C310);
    sub_25B9E59B8();
    uint64_t v20 = sub_25B9E5810();
    v21(v20);
    *(void *)(v15 + v26[12]) = v27;
    sub_25B9E296C(v15, v22);
    sub_25B94F65C((uint64_t)v3);
    sub_25B9E29D0(v15);
  }
  sub_25B961A64();
}

void sub_25B9DF7C0()
{
}

uint64_t sub_25B9DF7D8(void *a1)
{
  return TextMessage.encode(to:)(a1);
}

BOOL static TextMessage.Tapback.TapbackType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TextMessage.Tapback.TapbackType.hash(into:)()
{
  return sub_25B9ED750();
}

uint64_t sub_25B9DF830(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7472616568 && a2 == 0xE500000000000000;
  if (v2 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701538156 && a2 == 0xE400000000000000;
    if (v6 || (sub_25B9ED6A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656B696C736964 && a2 == 0xE700000000000000;
      if (v7 || (sub_25B9ED6A0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x7369736168706D65 && a2 == 0xE800000000000000;
        if (v8 || (sub_25B9ED6A0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x686775616CLL && a2 == 0xE500000000000000;
          if (v9 || (sub_25B9ED6A0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6E6F697473657571 && a2 == 0xE800000000000000;
            if (v10 || (sub_25B9ED6A0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x696A6F6D65 && a2 == 0xE500000000000000;
              if (v11 || (sub_25B9ED6A0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x69746172656E6567 && a2 == 0xEF696A6F6D456576;
                if (v12 || (sub_25B9ED6A0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x72656B63697473 && a2 == 0xE700000000000000)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  char v14 = sub_25B9ED6A0();
                  swift_bridgeObjectRelease();
                  if (v14) {
                    return 8;
                  }
                  else {
                    return 9;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25B9DFBBC(char a1)
{
  uint64_t result = 0x7472616568;
  switch(a1)
  {
    case 1:
      uint64_t result = 1701538156;
      break;
    case 2:
      uint64_t result = 0x656B696C736964;
      break;
    case 3:
      uint64_t result = 0x7369736168706D65;
      break;
    case 4:
      uint64_t result = 0x686775616CLL;
      break;
    case 5:
      uint64_t result = 0x6E6F697473657571;
      break;
    case 6:
      uint64_t result = 0x696A6F6D65;
      break;
    case 7:
      uint64_t result = 0x69746172656E6567;
      break;
    case 8:
      uint64_t result = 0x72656B63697473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B9DFCCC()
{
  return sub_25B9DFBBC(*v0);
}

uint64_t sub_25B9DFCD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9DF830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9DFCFC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2A2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFD38(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2A2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFD74(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2C40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFDB0(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2C40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFDEC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2B10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFE28(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2B10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFE64(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2BF4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFEA0(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2BF4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFEDC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2AC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFF18(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2AC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFF54(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2CD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9DFF90(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2CD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9DFFCC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2BA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E0008(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2BA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9E0044(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2C8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E0080(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2C8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9E00BC(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2B5C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E00F8(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2B5C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B9E0134(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2A78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E0170(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2A78();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.Tapback.TapbackType.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  sub_25B94E854(&qword_26A51D8D0);
  sub_25B950790();
  MEMORY[0x270FA5388](v6);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D8D8);
  sub_25B950790();
  MEMORY[0x270FA5388](v7);
  sub_25B9E58DC(v8, v28);
  sub_25B94E854(&qword_26A51D8E0);
  sub_25B950790();
  MEMORY[0x270FA5388](v9);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D8E8);
  sub_25B950790();
  MEMORY[0x270FA5388](v10);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D8F0);
  sub_25B950790();
  MEMORY[0x270FA5388](v11);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D8F8);
  sub_25B950790();
  MEMORY[0x270FA5388](v12);
  sub_25B958FE4();
  uint64_t v30 = sub_25B94E854(&qword_26A51D900);
  sub_25B950790();
  MEMORY[0x270FA5388](v13);
  sub_25B958FE4();
  uint64_t v14 = sub_25B94E854(&qword_26A51D908);
  sub_25B950790();
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v16);
  sub_25B96DA28();
  sub_25B94E854(&qword_26A51D910);
  sub_25B950790();
  MEMORY[0x270FA5388](v17);
  sub_25B950870();
  uint64_t v20 = v19 - v18;
  sub_25B94E854(&qword_26A51D918);
  sub_25B950790();
  uint64_t v31 = v21;
  uint64_t v32 = v22;
  MEMORY[0x270FA5388](v21);
  sub_25B959398();
  uint64_t v23 = *v3;
  sub_25B94F2E0(v5, v5[3]);
  sub_25B9E2A2C();
  sub_25B9ED7B0();
  switch(v23)
  {
    case 1:
      sub_25B9E2C8C();
      uint64_t v20 = v31;
      sub_25B9ED5D0();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v2, v14);
      goto LABEL_13;
    case 2:
      sub_25B9E2C40();
      sub_25B9E5828();
      uint64_t v25 = sub_25B9E5920();
      uint64_t v27 = v30;
      goto LABEL_12;
    case 3:
      sub_25B9E2BF4();
      sub_25B9E5828();
      goto LABEL_11;
    case 4:
      sub_25B9E2BA8();
      sub_25B9E5828();
      goto LABEL_11;
    case 5:
      sub_25B9E2B5C();
      sub_25B9E5828();
      goto LABEL_11;
    case 6:
      sub_25B9E2B10();
      sub_25B9E5828();
      goto LABEL_11;
    case 7:
      sub_25B9E2AC4();
      sub_25B9E5828();
      goto LABEL_11;
    case 8:
      sub_25B9E2A78();
      sub_25B9E5828();
LABEL_11:
      uint64_t v25 = sub_25B9E5920();
LABEL_12:
      v26(v25, v27);
LABEL_13:
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1, v20);
      break;
    default:
      sub_25B9E2CD8();
      sub_25B9ED5D0();
      sub_25B959038();
      v24();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1, v31);
      break;
  }
  sub_25B961A64();
}

uint64_t TextMessage.Tapback.TapbackType.hashValue.getter()
{
  return sub_25B9ED790();
}

void TextMessage.Tapback.TapbackType.init(from:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  v36 = v4;
  sub_25B94E854(&qword_26A51D970);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D978);
  sub_25B950790();
  MEMORY[0x270FA5388](v6);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D980);
  sub_25B950790();
  MEMORY[0x270FA5388](v7);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D988);
  sub_25B950790();
  MEMORY[0x270FA5388](v8);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D990);
  sub_25B950790();
  MEMORY[0x270FA5388](v9);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D998);
  sub_25B950790();
  MEMORY[0x270FA5388](v10);
  sub_25B9E58DC(v11, v34);
  sub_25B94E854(&qword_26A51D9A0);
  sub_25B950790();
  MEMORY[0x270FA5388](v12);
  sub_25B958FE4();
  sub_25B94E854(&qword_26A51D9A8);
  sub_25B950790();
  MEMORY[0x270FA5388](v13);
  sub_25B95BA7C();
  sub_25B94E854(&qword_26A51D9B0);
  sub_25B950790();
  MEMORY[0x270FA5388](v14);
  sub_25B96DA28();
  uint64_t v15 = sub_25B94E854(&qword_26A51D9B8);
  sub_25B950790();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_25B96DA10();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E2A2C();
  sub_25B9ED7A0();
  if (v0) {
    goto LABEL_18;
  }
  uint64_t v19 = sub_25B9ED5B0();
  uint64_t v20 = *(void *)(v19 + 16);
  if (!v20)
  {
    uint64_t v27 = v15;
    uint64_t v28 = v17;
LABEL_8:
    uint64_t v29 = sub_25B9ED3D0();
    swift_allocError();
    uint64_t v31 = v30;
    sub_25B94E854(&qword_26A51B2A0);
    *uint64_t v31 = &type metadata for TextMessage.Tapback.TapbackType;
    sub_25B9ED500();
    sub_25B9ED3C0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v31, *MEMORY[0x263F8DCB0], v29);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v1, v27);
    goto LABEL_18;
  }
  uint64_t v35 = v1;
  uint64_t v21 = v15;
  uint64_t v22 = *(unsigned __int8 *)(v19 + 32);
  sub_25B958E48(1, v20, v19, v19 + 32, 0, (2 * v20) | 1);
  uint64_t v24 = v23;
  unint64_t v26 = v25;
  swift_bridgeObjectRelease();
  if (v24 != v26 >> 1)
  {
    uint64_t v27 = v21;
    uint64_t v28 = v17;
    uint64_t v1 = v35;
    goto LABEL_8;
  }
  switch(v22)
  {
    case 1:
      sub_25B9E2C8C();
      sub_25B9E57EC();
      break;
    case 2:
      sub_25B9E2C40();
      sub_25B9E57EC();
      break;
    case 3:
      sub_25B9E2BF4();
      sub_25B9E57EC();
      break;
    case 4:
      sub_25B9E2BA8();
      sub_25B9E57EC();
      break;
    case 5:
      sub_25B9E2B5C();
      sub_25B9E57EC();
      sub_25B9E5920();
      break;
    case 6:
      sub_25B9E2B10();
      sub_25B9E57EC();
      break;
    case 7:
      sub_25B9E2AC4();
      sub_25B9E57EC();
      break;
    case 8:
      sub_25B9E2A78();
      sub_25B9E57EC();
      break;
    default:
      sub_25B9E2CD8();
      sub_25B9E57EC();
      sub_25B9E5920();
      break;
  }
  sub_25B959038();
  v32();
  swift_unknownObjectRelease();
  sub_25B959038();
  v33();
  unsigned char *v36 = v22;
LABEL_18:
  sub_25B94F65C((uint64_t)v3);
  sub_25B961A64();
}

void sub_25B9E0FE4()
{
}

void sub_25B9E0FFC()
{
}

uint64_t TextMessage.Tapback.sender.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(v1 + 64);
  return sub_25B9E2D24(v2, v3, v4, v5, v6);
}

uint64_t TextMessage.Tapback.emoji.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.Tapback.imageDescription.getter()
{
  return sub_25B9593F8();
}

uint64_t TextMessage.Tapback.init(type:sender:emoji:imageDescription:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int v10 = *a1;
  uint64_t result = *(void *)a2;
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v15 = *(unsigned __int8 *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40);
  uint64_t v17 = *(void *)(a2 + 48);
  char v18 = *(unsigned char *)(a2 + 56);
  if (v10 == 6)
  {
    if (!a4) {
      goto LABEL_6;
    }
    uint64_t v19 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v19 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (!v19)
    {
LABEL_6:
      uint64_t v35 = a3;
      uint64_t v36 = a5;
      uint64_t v20 = *(void *)a2;
      uint64_t v21 = *(void *)(a2 + 8);
      uint64_t v33 = *(void *)(a2 + 16);
      uint64_t v22 = *(void *)(a2 + 24);
      uint64_t v34 = *(unsigned __int8 *)(a2 + 32);
      uint64_t v23 = *(void *)(a2 + 40);
      uint64_t v24 = *(void *)(a2 + 48);
      char v25 = *(unsigned char *)(a2 + 56);
      unint64_t v26 = a4;
      sub_25B9E2D24(result, v12, v33, v13, v15);
      uint64_t v27 = qword_26A51B010;
      unint64_t v32 = v26;
      swift_bridgeObjectRetain();
      uint64_t v37 = a6;
      swift_bridgeObjectRetain();
      if (v27 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_25B9ECD70();
      sub_25B9559F0(v28, (uint64_t)qword_26A51C170);
      uint64_t v29 = sub_25B9ECD40();
      os_log_type_t v30 = sub_25B9ED230();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)sub_25B96DB28();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_25B94C000, v29, v30, ".emoji Tapback created without associated emoji character", v31, 2u);
        sub_25B959290();
      }

      uint64_t v14 = v33;
      uint64_t v15 = v34;
      sub_25B9E2D90(v20, v21, v33, v22, v34);
      a6 = v37;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a4 = v32;
      char v18 = v25;
      uint64_t v16 = v23;
      uint64_t v17 = v24;
      uint64_t v13 = v22;
      uint64_t v12 = v21;
      uint64_t result = v20;
      a3 = v35;
      a5 = v36;
      LOBYTE(v10) = 6;
    }
  }
  *(unsigned char *)a7 = v10;
  *(void *)(a7 + 8) = result;
  *(void *)(a7 + 16) = v12;
  *(void *)(a7 + 24) = v14;
  *(void *)(a7 + 32) = v13;
  *(void *)(a7 + 40) = v15;
  *(void *)(a7 + 48) = v16;
  *(void *)(a7 + 56) = v17;
  *(unsigned char *)(a7 + 64) = v18;
  *(void *)(a7 + 72) = a3;
  *(void *)(a7 + 80) = a4;
  *(void *)(a7 + 88) = a5;
  *(void *)(a7 + 96) = a6;
  return result;
}

double TextMessage.Tapback.init(type:emoji:imageDescription:)@<D0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int v11 = *a1;
  if (v11 == 6)
  {
    if (!a3) {
      goto LABEL_6;
    }
    uint64_t v12 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v12 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (!v12)
    {
LABEL_6:
      uint64_t v13 = sub_25B9E587C();
      sub_25B9E2D24(v13, v14, v15, v16, v17);
      uint64_t v18 = qword_26A51B010;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v18 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_25B9ECD70();
      sub_25B9559F0(v19, (uint64_t)qword_26A51C170);
      uint64_t v20 = sub_25B9ECD40();
      os_log_type_t v21 = sub_25B9ED230();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)sub_25B96DB28();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_25B94C000, v20, v21, ".emoji Tapback created without associated emoji character", v22, 2u);
        sub_25B959290();
      }

      uint64_t v23 = sub_25B9E587C();
      sub_25B9E2D90(v23, v24, v25, v26, v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  *(unsigned char *)a6 = v11;
  *(_OWORD *)(a6 + 8) = xmmword_25B9F90C0;
  double result = 0.0;
  *(_OWORD *)(a6 + 24) = 0u;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 49) = 0u;
  *(void *)(a6 + 72) = a2;
  *(void *)(a6 + 80) = a3;
  *(void *)(a6 + 88) = a4;
  *(void *)(a6 + 96) = a5;
  return result;
}

uint64_t sub_25B9E1418(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7265646E6573 && a2 == 0xE600000000000000;
    if (v6 || (sub_25B9ED6A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x696A6F6D65 && a2 == 0xE500000000000000;
      if (v7 || (sub_25B9ED6A0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000025B9F1D50)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v8 = sub_25B9ED6A0();
        swift_bridgeObjectRelease();
        if (v8) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

unint64_t sub_25B9E15A8(char a1)
{
  unint64_t result = 1701869940;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7265646E6573;
      break;
    case 2:
      unint64_t result = 0x696A6F6D65;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25B9E1630()
{
  return sub_25B9E15A8(*v0);
}

uint64_t sub_25B9E1638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9E1418(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9E1660(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2DFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E169C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E2DFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void TextMessage.Tapback.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B94E854(&qword_26A51D9C0);
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B959380();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E2DFC();
  sub_25B9ED7B0();
  sub_25B9E2E48();
  sub_25B9A0A0C();
  if (!v0)
  {
    sub_25B99E164();
    sub_25B9ED600();
    sub_25B9E58A0();
    sub_25B9E58A0();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_25B9E59EC();
  sub_25B961A64();
}

void TextMessage.Tapback.init(from:)()
{
  sub_25B961A4C();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_25B94E854(&qword_26A51D9D8);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B96DA28();
  sub_25B94F2E0(v2, v2[3]);
  sub_25B9E2DFC();
  sub_25B9ED7A0();
  if (v0)
  {
    sub_25B94F65C((uint64_t)v2);
  }
  else
  {
    sub_25B9E2E94();
    sub_25B9E58F8();
    sub_25B9ED590();
    sub_25B99E230();
    sub_25B9E58F8();
    sub_25B9ED530();
    sub_25B9E2D24(v21, v22, v23, v24, v25);
    uint64_t v19 = sub_25B9E592C();
    uint64_t v20 = v6;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25B9E592C();
    uint64_t v18 = v7;
    sub_25B994E98();
    v8();
    sub_25B9E594C();
    sub_25B9E2D24(v9, v10, v11, v12, v25);
    swift_bridgeObjectRetain();
    sub_25B9E594C();
    sub_25B9E2D90(v13, v14, v15, v16, v25);
    *(unsigned char *)uint64_t v4 = v21;
    *(void *)(v4 + 8) = v21;
    *(void *)(v4 + 16) = v22;
    *(void *)(v4 + 24) = v23;
    *(void *)(v4 + 32) = v24;
    *(void *)(v4 + 40) = v25;
    *(void *)(v4 + 48) = v26;
    *(void *)(v4 + 56) = v27;
    *(unsigned char *)(v4 + 64) = v28;
    *(void *)(v4 + 72) = v19;
    *(void *)(v4 + 80) = v20;
    *(void *)(v4 + 88) = v17;
    *(void *)(v4 + 96) = v18;
    sub_25B94F65C((uint64_t)v2);
    sub_25B9E2D90(v21, v22, v23, v24, v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9E1C7C()
{
}

void sub_25B9E1C94()
{
}

double TextMessage.tapback.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  if (qword_26A51B010 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25B9ECD70();
  sub_25B9559F0(v4, (uint64_t)qword_26A51C170);
  uint64_t v5 = sub_25B9ECD40();
  os_log_type_t v6 = sub_25B9ED230();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)sub_25B96DB28();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25B94C000, v5, v6, "TextMesssage.tapback is deperecated; use the array version.", v7, 2u);
    sub_25B959290();
  }

  uint64_t v8 = *(void *)(v2 + *(int *)(type metadata accessor for TextMessage() + 44));
  return sub_25B9DC468(v8, a1);
}

double sub_25B9E1DA8@<D0>(uint64_t a1@<X8>)
{
  TextMessage.tapback.getter((uint64_t)v7);
  uint64_t v2 = v10;
  long long v3 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = v7[3];
  *(_OWORD *)(a1 + 32) = v7[2];
  *(_OWORD *)(a1 + 48) = v4;
  double result = *(double *)&v8;
  long long v6 = v9;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v6;
  *(void *)(a1 + 96) = v2;
  return result;
}

uint64_t sub_25B9E1DFC(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  uint64_t v9 = a1[9];
  uint64_t v10 = a1[10];
  uint64_t v11 = a1[11];
  uint64_t v12 = a1[12];
  v14[0] = *a1;
  v14[1] = v1;
  v14[2] = v2;
  v14[3] = v3;
  v14[4] = v4;
  v14[5] = v5;
  v14[6] = v6;
  v14[7] = v7;
  v14[8] = v8;
  v14[9] = v9;
  v14[10] = v10;
  v14[11] = v11;
  v14[12] = v12;
  sub_25B9E2EE0(v14[0], v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return TextMessage.tapback.setter(v14);
}

uint64_t TextMessage.tapback.setter(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[2];
  uint64_t v20 = a1[5];
  uint64_t v21 = a1[4];
  uint64_t v5 = a1[8];
  uint64_t v18 = a1[7];
  uint64_t v19 = a1[6];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[11];
  uint64_t v9 = a1[12];
  if (qword_26A51B010 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25B9ECD70();
  sub_25B9559F0(v10, (uint64_t)qword_26A51C170);
  uint64_t v11 = sub_25B9ECD40();
  os_log_type_t v12 = sub_25B9ED230();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)sub_25B96DB28();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25B94C000, v11, v12, "TextMesssage.tapback is deperecated; use the array version.", v13, 2u);
    sub_25B959290();
  }

  if (v7 == 1)
  {
    uint64_t v14 = *(int *)(type metadata accessor for TextMessage() + 44);
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v2 + v14) = MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25B94E854(&qword_26A51D9E8);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25B9F6AE0;
    *(unsigned char *)(v16 + 32) = v4;
    *(void *)(v16 + 40) = v3;
    *(void *)(v16 + 48) = v23;
    *(void *)(v16 + 56) = v22;
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 72) = v20;
    *(void *)(v16 + 80) = v19;
    *(void *)(v16 + 88) = v18;
    *(unsigned char *)(v16 + 96) = v5;
    *(void *)(v16 + 104) = v6;
    *(void *)(v16 + 112) = v7;
    *(void *)(v16 + 120) = v8;
    *(void *)(v16 + 128) = v9;
    uint64_t v17 = *(int *)(type metadata accessor for TextMessage() + 44);
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v2 + v17) = v16;
  }
  return result;
}

void (*TextMessage.tapback.modify(void *a1))(uint64_t **a1)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  TextMessage.tapback.getter((uint64_t)v3);
  return sub_25B9E20D8;
}

void sub_25B9E20D8(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25B9E59F8();
  if (v2)
  {
    sub_25B9E58BC();
    sub_25B9E2EE0(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
    TextMessage.tapback.setter(v22);
    uint64_t v14 = sub_25B9E59F8();
    sub_25B9E2F5C(v14, v15, v16, v17, v18, v19, v20, v21, v1[8], v1[9], v1[10]);
  }
  else
  {
    sub_25B9E58BC();
    TextMessage.tapback.setter(v22);
  }
  free(v1);
}

uint64_t TextMessage.init(messageID:sender:recipients:dateReceived:isUnread:threadID:body:tapback:attachments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t *a12, uint64_t a13)
{
  uint64_t v14 = *a3;
  uint64_t v15 = a3[3];
  uint64_t v36 = a3[2];
  uint64_t v37 = a3[1];
  uint64_t v16 = *((unsigned __int8 *)a3 + 32);
  uint64_t v17 = a3[5];
  uint64_t v18 = a3[6];
  char v35 = *((unsigned char *)a3 + 56);
  uint64_t v19 = a12[10];
  if (v19 == 1)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v21 = a12[12];
    uint64_t v33 = a12[9];
    uint64_t v34 = a12[11];
    uint64_t v31 = a12[7];
    uint64_t v32 = a12[8];
    long long v29 = *(_OWORD *)(a12 + 3);
    long long v30 = *(_OWORD *)(a12 + 5);
    long long v28 = *(_OWORD *)(a12 + 1);
    uint64_t v22 = *a12;
    sub_25B94E854(&qword_26A51D9E8);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_25B9F6AE0;
    *(unsigned char *)(v20 + 32) = v22;
    *(_OWORD *)(v20 + 40) = v28;
    *(_OWORD *)(v20 + 56) = v29;
    *(_OWORD *)(v20 + 72) = v30;
    *(void *)(v20 + 88) = v31;
    *(unsigned char *)(v20 + 96) = v32;
    *(void *)(v20 + 104) = v33;
    *(void *)(v20 + 112) = v19;
    *(void *)(v20 + 120) = v34;
    *(void *)(v20 + 128) = v21;
  }
  uint64_t v23 = (int *)type metadata accessor for TextMessage();
  uint64_t v24 = (void *)(a9 + v23[9]);
  uint64_t v25 = (void *)(a9 + v23[10]);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v14;
  *(void *)(a9 + 24) = v37;
  *(void *)(a9 + 32) = v36;
  *(void *)(a9 + 40) = v15;
  *(unsigned char *)(a9 + 48) = v16;
  *(void *)(a9 + 56) = v17;
  *(void *)(a9 + 64) = v18;
  *(unsigned char *)(a9 + 72) = v35;
  sub_25B9E5978(a4);
  sub_25B95097C();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 32))(v16, a5);
  *(unsigned char *)(a9 + v23[8]) = a6 & 1;
  void *v24 = a7;
  v24[1] = a8;
  *uint64_t v25 = a10;
  v25[1] = a11;
  *(void *)(a9 + v23[11]) = v20;
  *(void *)(a9 + v23[12]) = a13;
  return result;
}

__n128 TextMessage.init(messageID:sender:recipients:dateReceived:isUnread:threadID:body:attachments:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unsigned __int8 a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, uint64_t a10, uint64_t a11, unint64_t a12)
{
  __n128 v26 = *a3;
  unint64_t v15 = a3[1].n128_u64[0];
  unint64_t v14 = a3[1].n128_u64[1];
  unsigned __int8 v16 = a3[2].n128_u8[0];
  unint64_t v17 = a3[2].n128_u64[1];
  unint64_t v18 = a3[3].n128_u64[0];
  unsigned __int8 v19 = a3[3].n128_u8[8];
  uint64_t v20 = (int *)type metadata accessor for TextMessage();
  uint64_t v21 = (char *)a9 + v20[7];
  sub_25B9EC2B0();
  sub_25B95097C();
  (*(void (**)(char *, uint64_t))(v22 + 32))(v21, a5);
  uint64_t v23 = (unint64_t *)((char *)a9->n128_u64 + v20[9]);
  uint64_t v24 = (unint64_t *)((char *)a9->n128_u64 + v20[10]);
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  __n128 result = v26;
  a9[1] = v26;
  a9[2].n128_u64[0] = v15;
  a9[2].n128_u64[1] = v14;
  a9[3].n128_u8[0] = v16;
  a9[3].n128_u64[1] = v17;
  a9[4].n128_u64[0] = v18;
  a9[4].n128_u8[8] = v19;
  a9[5].n128_u64[0] = a4;
  a9->n128_u8[v20[8]] = a6;
  *uint64_t v23 = a7;
  v23[1] = a8;
  void *v24 = a10;
  v24[1] = a11;
  *(unint64_t *)((char *)a9->n128_u64 + v20[11]) = MEMORY[0x263F8EE78];
  *(unint64_t *)((char *)a9->n128_u64 + v20[12]) = a12;
  return result;
}

Sage::TextMessage::VisualPromptOptions __swiftcall TextMessage.VisualPromptOptions.init()()
{
  *(_WORD *)uint64_t v0 = 259;
  *(unsigned char *)(v0 + 2) = 0;
  return result;
}

Sage::TextMessage::VisualPromptOptions __swiftcall TextMessage.VisualPromptOptions.init(extractVisualConcepts:extractVisualTopLine:)(Swift::Bool extractVisualConcepts, Swift::Bool extractVisualTopLine)
{
  *char v2 = 3;
  v2[1] = extractVisualConcepts;
  v2[2] = extractVisualTopLine;
  result.useCase = extractVisualConcepts;
  return result;
}

unint64_t sub_25B9E24CC()
{
  unint64_t result = qword_26A51D7F0;
  if (!qword_26A51D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D7F0);
  }
  return result;
}

uint64_t type metadata accessor for TextMessage()
{
  uint64_t result = qword_26A51D9F8;
  if (!qword_26A51D9F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25B9E2560(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_25B9524FC(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25B9E25C8(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_25B9524FC(&qword_26A51D7F8);
    sub_25B9E2928(v4);
    unint64_t result = sub_25B9A0B38();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25B9E2648()
{
  unint64_t result = qword_26A51D820;
  if (!qword_26A51D820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D820);
  }
  return result;
}

unint64_t sub_25B9E2694()
{
  unint64_t result = qword_26A51D838;
  if (!qword_26A51D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D838);
  }
  return result;
}

unint64_t sub_25B9E26E0()
{
  unint64_t result = qword_26A51D850;
  if (!qword_26A51D850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D850);
  }
  return result;
}

unint64_t sub_25B9E272C()
{
  unint64_t result = qword_26A51D868;
  if (!qword_26A51D868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D868);
  }
  return result;
}

unint64_t sub_25B9E2778()
{
  unint64_t result = qword_26A51D880;
  if (!qword_26A51D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D880);
  }
  return result;
}

unint64_t sub_25B9E27C4()
{
  unint64_t result = qword_26A51D898;
  if (!qword_26A51D898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D898);
  }
  return result;
}

unint64_t sub_25B9E2810()
{
  unint64_t result = qword_26A51D8B0;
  if (!qword_26A51D8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D8B0);
  }
  return result;
}

unint64_t sub_25B9E285C(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_25B9524FC(&qword_26A51C2D8);
    sub_25B9E2928(v4);
    unint64_t result = sub_25B9A0B38();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25B9E28DC()
{
  unint64_t result = qword_26A51D8C8;
  if (!qword_26A51D8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D8C8);
  }
  return result;
}

unint64_t sub_25B9E2928(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25B9E296C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B9E29D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TextMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25B9E2A2C()
{
  unint64_t result = qword_26A51D920;
  if (!qword_26A51D920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D920);
  }
  return result;
}

unint64_t sub_25B9E2A78()
{
  unint64_t result = qword_26A51D928;
  if (!qword_26A51D928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D928);
  }
  return result;
}

unint64_t sub_25B9E2AC4()
{
  unint64_t result = qword_26A51D930;
  if (!qword_26A51D930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D930);
  }
  return result;
}

unint64_t sub_25B9E2B10()
{
  unint64_t result = qword_26A51D938;
  if (!qword_26A51D938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D938);
  }
  return result;
}

unint64_t sub_25B9E2B5C()
{
  unint64_t result = qword_26A51D940;
  if (!qword_26A51D940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D940);
  }
  return result;
}

unint64_t sub_25B9E2BA8()
{
  unint64_t result = qword_26A51D948;
  if (!qword_26A51D948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D948);
  }
  return result;
}

unint64_t sub_25B9E2BF4()
{
  unint64_t result = qword_26A51D950;
  if (!qword_26A51D950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D950);
  }
  return result;
}

unint64_t sub_25B9E2C40()
{
  unint64_t result = qword_26A51D958;
  if (!qword_26A51D958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D958);
  }
  return result;
}

unint64_t sub_25B9E2C8C()
{
  unint64_t result = qword_26A51D960;
  if (!qword_26A51D960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D960);
  }
  return result;
}

unint64_t sub_25B9E2CD8()
{
  unint64_t result = qword_26A51D968;
  if (!qword_26A51D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D968);
  }
  return result;
}

uint64_t sub_25B9E2D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    sub_25B9974E8(a3, a4, a5);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25B9E2D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    sub_25B9974FC(a3, a4, a5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25B9E2DFC()
{
  unint64_t result = qword_26A51D9C8;
  if (!qword_26A51D9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D9C8);
  }
  return result;
}

unint64_t sub_25B9E2E48()
{
  unint64_t result = qword_26A51D9D0;
  if (!qword_26A51D9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D9D0);
  }
  return result;
}

unint64_t sub_25B9E2E94()
{
  unint64_t result = qword_26A51D9E0;
  if (!qword_26A51D9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D9E0);
  }
  return result;
}

uint64_t sub_25B9E2EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11 != 1)
  {
    sub_25B9E2D24(a2, a3, a4, a5, a6);
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25B9E2F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11 != 1)
  {
    sub_25B9E2D90(a2, a3, a4, a5, a6);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25B9E300C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25B9E2928((uint64_t)&qword_26A51B2E8);
  unint64_t result = sub_25B9E2928((uint64_t)&qword_26A51B220);
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25B9E3094()
{
  unint64_t result = qword_26A51D9F0;
  if (!qword_26A51D9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51D9F0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TextMessage(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    a1 = v12 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    int v9 = *((unsigned __int8 *)a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9 == 255)
    {
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    }
    else
    {
      uint64_t v10 = a2[4];
      uint64_t v11 = a2[5];
      sub_25B9563BC(v10, v11, v9);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v11;
      *(unsigned char *)(a1 + 48) = v9;
    }
    uint64_t v13 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v13;
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    *(void *)(a1 + 80) = a2[10];
    uint64_t v14 = a3[7];
    uint64_t v15 = a1 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_25B9EC2B0();
    unint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v15, v16, v17);
    uint64_t v19 = a3[9];
    *(unsigned char *)(a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[10];
    uint64_t v24 = a3[11];
    uint64_t v25 = (void *)(a1 + v23);
    __n128 v26 = (uint64_t *)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    *(void *)(a1 + v24) = *(uint64_t *)((char *)a2 + v24);
    *(void *)(a1 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TextMessage(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != 255) {
    sub_25B9566FC(*(void *)(a1 + 32), *(void *)(a1 + 40), v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TextMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  int v8 = *(unsigned __int8 *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 == 255)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    sub_25B9563BC(v9, v10, v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    *(unsigned char *)(a1 + 48) = v8;
  }
  uint64_t v11 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25B9EC2B0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  uint64_t v17 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  unint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *unint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a3[10];
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v21);
  uint64_t v24 = (void *)(a2 + v21);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextMessage(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (long long *)(a1 + 32);
  uint64_t v7 = (long long *)(a2 + 32);
  int v8 = *(unsigned __int8 *)(a2 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == 255)
  {
    if (v8 == 255)
    {
      long long v17 = *v7;
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *uint64_t v6 = v17;
    }
    else
    {
      uint64_t v14 = *(void *)(a2 + 32);
      uint64_t v15 = *(void *)(a2 + 40);
      sub_25B9563BC(v14, v15, *(unsigned char *)(a2 + 48));
      *(void *)(a1 + 32) = v14;
      *(void *)(a1 + 40) = v15;
      *(unsigned char *)(a1 + 48) = v8;
    }
  }
  else if (v8 == 255)
  {
    sub_25B997800(a1 + 32);
    char v16 = *(unsigned char *)(a2 + 48);
    *uint64_t v6 = *v7;
    *(unsigned char *)(a1 + 48) = v16;
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    sub_25B9563BC(v9, v10, *(unsigned char *)(a2 + 48));
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    unsigned __int8 v13 = *(unsigned char *)(a1 + 48);
    *(unsigned char *)(a1 + 48) = v8;
    sub_25B9566FC(v11, v12, v13);
  }
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  __n128 v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  void *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TextMessage(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 57);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + 57) = v8;
  uint64_t v12 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t assignWithTake for TextMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  long long v8 = (_OWORD *)(a2 + 32);
  int v9 = *(unsigned __int8 *)(a1 + 48);
  if (v9 == 255) {
    goto LABEL_5;
  }
  int v10 = *(unsigned __int8 *)(a2 + 48);
  if (v10 == 255)
  {
    sub_25B997800(a1 + 32);
LABEL_5:
    *(_OWORD *)(a1 + 32) = *v8;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *v8;
  *(unsigned char *)(a1 + 48) = v10;
  sub_25B9566FC(v11, v12, v9);
LABEL_6:
  uint64_t v13 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v13;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  void *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TextMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B9E39CC);
}

uint64_t sub_25B9E39CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25B9EC2B0();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return _s4Sage24ClassificationXPCRequestC7RequestOwet_0(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TextMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B9E3A68);
}

uint64_t sub_25B9E3A68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25B9EC2B0();
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return _s4Sage24ClassificationXPCRequestC7RequestOwst_0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25B9E3AE8()
{
  uint64_t result = sub_25B9EC2B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for TextMessage.SummarizationOptions()
{
}

void type metadata accessor for TextMessage.ClassificationOptions()
{
}

void *sub_25B9E3BE4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void type metadata accessor for TextMessage.ThreadClassificationOptions()
{
}

uint64_t _s4Sage11TextMessageV20SummarizationOptionsVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s4Sage11TextMessageV20SummarizationOptionsVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s4Sage11TextMessageV20SummarizationOptionsVwca_0(void *a1, void *a2)
{
  sub_25B9A0BD0(a1, a2);
  v3[1] = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[2] = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[3] = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s4Sage11TextMessageV20SummarizationOptionsVwta_0(void *a1, void *a2)
{
  sub_25B9A0BD0(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  swift_bridgeObjectRelease();
  return v3;
}

void type metadata accessor for TextMessage.ThreadSummarizationOptions()
{
}

void type metadata accessor for TextMessage.VisualPromptOptions()
{
}

void type metadata accessor for TextMessage.ThreadVisualPromptOptions()
{
}

uint64_t destroy for TextMessage.Tapback(uint64_t a1)
{
  if (*(void *)(a1 + 16) != 1)
  {
    swift_bridgeObjectRelease();
    int v2 = *(unsigned __int8 *)(a1 + 40);
    if (v2 != 255) {
      sub_25B9566FC(*(void *)(a1 + 24), *(void *)(a1 + 32), v2);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TextMessage.Tapback(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5 == 1)
  {
    long long v6 = *(_OWORD *)(a2 + 24);
    *uint64_t v4 = *(_OWORD *)(a2 + 8);
    v4[1] = v6;
    v4[2] = *(_OWORD *)(a2 + 40);
    *(_OWORD *)((char *)v4 + 41) = *(_OWORD *)(a2 + 49);
  }
  else
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v5;
    int v7 = *(unsigned __int8 *)(a2 + 40);
    swift_bridgeObjectRetain();
    if (v7 == 255)
    {
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    }
    else
    {
      uint64_t v8 = *(void *)(a2 + 24);
      uint64_t v9 = *(void *)(a2 + 32);
      sub_25B9563BC(v8, v9, v7);
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = v9;
      *(unsigned char *)(a1 + 40) = v7;
    }
    uint64_t v10 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v10;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    swift_bridgeObjectRetain();
  }
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;
  uint64_t v12 = *(void *)(a2 + 88);
  uint64_t v13 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextMessage.Tapback(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (long long *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *v5;
      long long v8 = *(_OWORD *)(a2 + 24);
      long long v9 = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
      *(_OWORD *)(a1 + 24) = v8;
      *(_OWORD *)(a1 + 40) = v9;
      *uint64_t v4 = v7;
    }
    else
    {
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      int v13 = *(unsigned __int8 *)(a2 + 40);
      swift_bridgeObjectRetain();
      if (v13 == 255)
      {
        long long v24 = *(_OWORD *)(a2 + 24);
        *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
        *(_OWORD *)(a1 + 24) = v24;
      }
      else
      {
        uint64_t v14 = *(void *)(a2 + 24);
        uint64_t v15 = *(void *)(a2 + 32);
        sub_25B9563BC(v14, v15, v13);
        *(void *)(a1 + 24) = v14;
        *(void *)(a1 + 32) = v15;
        *(unsigned char *)(a1 + 40) = v13;
      }
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_25B9E4148(a1 + 8);
    long long v11 = v5[1];
    long long v10 = v5[2];
    long long v12 = *v5;
    *(_OWORD *)((char *)v4 + 41) = *(long long *)((char *)v5 + 41);
    v4[1] = v11;
    v4[2] = v10;
    *uint64_t v4 = v12;
  }
  else
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v16 = (long long *)(a1 + 24);
    uint64_t v17 = (long long *)(a2 + 24);
    int v18 = *(unsigned __int8 *)(a2 + 40);
    if (*(unsigned __int8 *)(a1 + 40) == 255)
    {
      if (v18 == 255)
      {
        long long v28 = *v17;
        *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
        *uint64_t v16 = v28;
      }
      else
      {
        uint64_t v25 = *(void *)(a2 + 24);
        uint64_t v26 = *(void *)(a2 + 32);
        sub_25B9563BC(v25, v26, *(unsigned char *)(a2 + 40));
        *(void *)(a1 + 24) = v25;
        *(void *)(a1 + 32) = v26;
        *(unsigned char *)(a1 + 40) = v18;
      }
    }
    else if (v18 == 255)
    {
      sub_25B997800(a1 + 24);
      char v27 = *(unsigned char *)(a2 + 40);
      *uint64_t v16 = *v17;
      *(unsigned char *)(a1 + 40) = v27;
    }
    else
    {
      uint64_t v19 = *(void *)(a2 + 24);
      uint64_t v20 = *(void *)(a2 + 32);
      sub_25B9563BC(v19, v20, *(unsigned char *)(a2 + 40));
      uint64_t v21 = *(void *)(a1 + 24);
      uint64_t v22 = *(void *)(a1 + 32);
      *(void *)(a1 + 24) = v19;
      *(void *)(a1 + 32) = v20;
      unsigned __int8 v23 = *(unsigned char *)(a1 + 40);
      *(unsigned char *)(a1 + 40) = v18;
      sub_25B9566FC(v21, v22, v23);
    }
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25B9E4148(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for TextMessage.Tapback(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for TextMessage.Tapback(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (_OWORD *)(a2 + 8);
  if (*(void *)(a1 + 16) == 1) {
    goto LABEL_4;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6 != 1)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v6;
    swift_bridgeObjectRelease();
    long long v8 = (_OWORD *)(a2 + 24);
    int v9 = *(unsigned __int8 *)(a1 + 40);
    if (v9 != 255)
    {
      int v10 = *(unsigned __int8 *)(a2 + 40);
      if (v10 != 255)
      {
        uint64_t v11 = *(void *)(a1 + 24);
        uint64_t v12 = *(void *)(a1 + 32);
        *(_OWORD *)(a1 + 24) = *v8;
        *(unsigned char *)(a1 + 40) = v10;
        sub_25B9566FC(v11, v12, v9);
LABEL_10:
        uint64_t v13 = *(void *)(a2 + 56);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = v13;
        swift_bridgeObjectRelease();
        *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
        goto LABEL_11;
      }
      sub_25B997800(a1 + 24);
    }
    *(_OWORD *)(a1 + 24) = *v8;
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    goto LABEL_10;
  }
  sub_25B9E4148((uint64_t)v4);
LABEL_4:
  long long v7 = v5[1];
  *uint64_t v4 = *v5;
  v4[1] = v7;
  v4[2] = v5[2];
  *(_OWORD *)((char *)v4 + 41) = *(_OWORD *)((char *)v5 + 41);
LABEL_11:
  uint64_t v14 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TextMessage.Tapback(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 104))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 80);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
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

uint64_t storeEnumTagSinglePayload for TextMessage.Tapback(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(void *)(result + 80) = a2;
    }
  }
  return result;
}

void type metadata accessor for TextMessage.Tapback()
{
}

void type metadata accessor for TextMessage.Tapback.TapbackType()
{
}

unsigned char *_s4Sage11TextMessageV25ThreadVisualPromptOptionsVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)sub_25B9E59B0((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)sub_25B9E5998((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B9E4450);
      case 4:
        uint64_t result = (unsigned char *)sub_25B9E59A0((uint64_t)result, v6);
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
          uint64_t result = sub_25B9E59A8(result, a2 + 3);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.CodingKeys()
{
  return &type metadata for TextMessage.Tapback.CodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.CodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.CodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.HeartCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.HeartCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.LikeCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.LikeCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.DislikeCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.DislikeCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.EmphasisCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.EmphasisCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.LaughCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.LaughCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.QuestionCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.QuestionCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.EmojiCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.EmojiCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.GenerativeEmojiCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.GenerativeEmojiCodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.Tapback.TapbackType.StickerCodingKeys()
{
  return &type metadata for TextMessage.Tapback.TapbackType.StickerCodingKeys;
}

uint64_t _s4Sage11TextMessageV7TapbackV11TapbackTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_25B9C9D78(-1);
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return sub_25B9C9D78((*a1 | (v4 << 8)) - 9);
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
      return sub_25B9C9D78((*a1 | (v4 << 8)) - 9);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_25B9C9D78((*a1 | (v4 << 8)) - 9);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return sub_25B9C9D78(v8);
}

unsigned char *_s4Sage11TextMessageV7TapbackV11TapbackTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)sub_25B9E59B0((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)sub_25B9E5998((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B9E4668);
      case 4:
        uint64_t result = (unsigned char *)sub_25B9E59A0((uint64_t)result, v6);
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
          uint64_t result = sub_25B9E59A8(result, a2 + 8);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextMessage.CodingKeys()
{
  return &type metadata for TextMessage.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TextMessage.ThreadVisualPromptOptions.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25B9E473CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TextMessage.ThreadVisualPromptOptions.CodingKeys()
{
  return &type metadata for TextMessage.ThreadVisualPromptOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.VisualPromptOptions.CodingKeys()
{
  return &type metadata for TextMessage.VisualPromptOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.ThreadSummarizationOptions.CodingKeys()
{
  return &type metadata for TextMessage.ThreadSummarizationOptions.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TextMessage.ThreadClassificationOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x25B9E4864);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextMessage.ThreadClassificationOptions.CodingKeys()
{
  return &type metadata for TextMessage.ThreadClassificationOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for TextMessage.ClassificationOptions.CodingKeys()
{
  return &type metadata for TextMessage.ClassificationOptions.CodingKeys;
}

unsigned char *_s4Sage11TextMessageV19VisualPromptOptionsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)sub_25B9E59B0((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)sub_25B9E5998((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B9E4968);
      case 4:
        uint64_t result = (unsigned char *)sub_25B9E59A0((uint64_t)result, v6);
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
          uint64_t result = sub_25B9E59A8(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextMessage.SummarizationOptions.CodingKeys()
{
  return &type metadata for TextMessage.SummarizationOptions.CodingKeys;
}

unint64_t sub_25B9E49A4()
{
  unint64_t result = qword_26A51DA08;
  if (!qword_26A51DA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA08);
  }
  return result;
}

unint64_t sub_25B9E49F4()
{
  unint64_t result = qword_26A51DA10;
  if (!qword_26A51DA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA10);
  }
  return result;
}

unint64_t sub_25B9E4A44()
{
  unint64_t result = qword_26A51DA18;
  if (!qword_26A51DA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA18);
  }
  return result;
}

unint64_t sub_25B9E4A94()
{
  unint64_t result = qword_26A51DA20;
  if (!qword_26A51DA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA20);
  }
  return result;
}

unint64_t sub_25B9E4AE4()
{
  unint64_t result = qword_26A51DA28;
  if (!qword_26A51DA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA28);
  }
  return result;
}

unint64_t sub_25B9E4B34()
{
  unint64_t result = qword_26A51DA30;
  if (!qword_26A51DA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA30);
  }
  return result;
}

unint64_t sub_25B9E4B84()
{
  unint64_t result = qword_26A51DA38;
  if (!qword_26A51DA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA38);
  }
  return result;
}

unint64_t sub_25B9E4BD4()
{
  unint64_t result = qword_26A51DA40;
  if (!qword_26A51DA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA40);
  }
  return result;
}

unint64_t sub_25B9E4C24()
{
  unint64_t result = qword_26A51DA48;
  if (!qword_26A51DA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA48);
  }
  return result;
}

unint64_t sub_25B9E4C74()
{
  unint64_t result = qword_26A51DA50;
  if (!qword_26A51DA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA50);
  }
  return result;
}

unint64_t sub_25B9E4CC4()
{
  unint64_t result = qword_26A51DA58;
  if (!qword_26A51DA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA58);
  }
  return result;
}

unint64_t sub_25B9E4D14()
{
  unint64_t result = qword_26A51DA60;
  if (!qword_26A51DA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA60);
  }
  return result;
}

unint64_t sub_25B9E4D64()
{
  unint64_t result = qword_26A51DA68;
  if (!qword_26A51DA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA68);
  }
  return result;
}

unint64_t sub_25B9E4DB4()
{
  unint64_t result = qword_26A51DA70;
  if (!qword_26A51DA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA70);
  }
  return result;
}

unint64_t sub_25B9E4E04()
{
  unint64_t result = qword_26A51DA78;
  if (!qword_26A51DA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA78);
  }
  return result;
}

unint64_t sub_25B9E4E54()
{
  unint64_t result = qword_26A51DA80;
  if (!qword_26A51DA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA80);
  }
  return result;
}

unint64_t sub_25B9E4EA4()
{
  unint64_t result = qword_26A51DA88;
  if (!qword_26A51DA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA88);
  }
  return result;
}

unint64_t sub_25B9E4EF4()
{
  unint64_t result = qword_26A51DA90;
  if (!qword_26A51DA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA90);
  }
  return result;
}

unint64_t sub_25B9E4F44()
{
  unint64_t result = qword_26A51DA98;
  if (!qword_26A51DA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DA98);
  }
  return result;
}

unint64_t sub_25B9E4F94()
{
  unint64_t result = qword_26A51DAA0;
  if (!qword_26A51DAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAA0);
  }
  return result;
}

unint64_t sub_25B9E4FE4()
{
  unint64_t result = qword_26A51DAA8;
  if (!qword_26A51DAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAA8);
  }
  return result;
}

unint64_t sub_25B9E5034()
{
  unint64_t result = qword_26A51DAB0;
  if (!qword_26A51DAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAB0);
  }
  return result;
}

unint64_t sub_25B9E5084()
{
  unint64_t result = qword_26A51DAB8;
  if (!qword_26A51DAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAB8);
  }
  return result;
}

unint64_t sub_25B9E50D4()
{
  unint64_t result = qword_26A51DAC0;
  if (!qword_26A51DAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAC0);
  }
  return result;
}

unint64_t sub_25B9E5124()
{
  unint64_t result = qword_26A51DAC8;
  if (!qword_26A51DAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAC8);
  }
  return result;
}

unint64_t sub_25B9E5174()
{
  unint64_t result = qword_26A51DAD0;
  if (!qword_26A51DAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAD0);
  }
  return result;
}

unint64_t sub_25B9E51C4()
{
  unint64_t result = qword_26A51DAD8;
  if (!qword_26A51DAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAD8);
  }
  return result;
}

unint64_t sub_25B9E5214()
{
  unint64_t result = qword_26A51DAE0;
  if (!qword_26A51DAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAE0);
  }
  return result;
}

unint64_t sub_25B9E5264()
{
  unint64_t result = qword_26A51DAE8;
  if (!qword_26A51DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAE8);
  }
  return result;
}

unint64_t sub_25B9E52B4()
{
  unint64_t result = qword_26A51DAF0;
  if (!qword_26A51DAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAF0);
  }
  return result;
}

unint64_t sub_25B9E5304()
{
  unint64_t result = qword_26A51DAF8;
  if (!qword_26A51DAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DAF8);
  }
  return result;
}

unint64_t sub_25B9E5354()
{
  unint64_t result = qword_26A51DB00;
  if (!qword_26A51DB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB00);
  }
  return result;
}

unint64_t sub_25B9E53A4()
{
  unint64_t result = qword_26A51DB08;
  if (!qword_26A51DB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB08);
  }
  return result;
}

unint64_t sub_25B9E53F4()
{
  unint64_t result = qword_26A51DB10;
  if (!qword_26A51DB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB10);
  }
  return result;
}

unint64_t sub_25B9E5444()
{
  unint64_t result = qword_26A51DB18;
  if (!qword_26A51DB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB18);
  }
  return result;
}

unint64_t sub_25B9E5494()
{
  unint64_t result = qword_26A51DB20;
  if (!qword_26A51DB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB20);
  }
  return result;
}

unint64_t sub_25B9E54E4()
{
  unint64_t result = qword_26A51DB28;
  if (!qword_26A51DB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB28);
  }
  return result;
}

unint64_t sub_25B9E5534()
{
  unint64_t result = qword_26A51DB30;
  if (!qword_26A51DB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB30);
  }
  return result;
}

unint64_t sub_25B9E5584()
{
  unint64_t result = qword_26A51DB38;
  if (!qword_26A51DB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB38);
  }
  return result;
}

unint64_t sub_25B9E55D4()
{
  unint64_t result = qword_26A51DB40;
  if (!qword_26A51DB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB40);
  }
  return result;
}

unint64_t sub_25B9E5624()
{
  unint64_t result = qword_26A51DB48;
  if (!qword_26A51DB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB48);
  }
  return result;
}

unint64_t sub_25B9E5674()
{
  unint64_t result = qword_26A51DB50;
  if (!qword_26A51DB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB50);
  }
  return result;
}

unint64_t sub_25B9E56C4()
{
  unint64_t result = qword_26A51DB58;
  if (!qword_26A51DB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB58);
  }
  return result;
}

unint64_t sub_25B9E5714()
{
  unint64_t result = qword_26A51DB60;
  if (!qword_26A51DB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB60);
  }
  return result;
}

unint64_t sub_25B9E5764()
{
  unint64_t result = qword_26A51DB68;
  if (!qword_26A51DB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB68);
  }
  return result;
}

uint64_t sub_25B9E57EC()
{
  return sub_25B9ED4F0();
}

uint64_t sub_25B9E5810()
{
  return v0;
}

uint64_t sub_25B9E5828()
{
  return sub_25B9ED5D0();
}

uint64_t sub_25B9E584C()
{
  return v0;
}

uint64_t sub_25B9E5864()
{
  return type metadata accessor for TextMessage();
}

uint64_t sub_25B9E587C()
{
  return 0;
}

uint64_t sub_25B9E58A0()
{
  return sub_25B9ED5E0();
}

void sub_25B9E58DC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void _s4Sage11TextMessageV19VisualPromptOptionsV7useCaseAA19SummarizationClientC0de3UseH0Ovg_0(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25B9E5920()
{
  return v0;
}

uint64_t sub_25B9E592C()
{
  return sub_25B9ED510();
}

uint64_t sub_25B9E5958@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 144) = a1;
  return sub_25B9ED510();
}

uint64_t sub_25B9E5978@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 80) = a1;
  return sub_25B9EC2B0();
}

uint64_t sub_25B9E5998@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t sub_25B9E59A0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *sub_25B9E59A8@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t sub_25B9E59B0@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t sub_25B9E59B8()
{
  return sub_25B9ED590();
}

uint64_t sub_25B9E59D8()
{
  return v0 - 72;
}

uint64_t sub_25B9E59F8()
{
  return *(void *)v0;
}

uint64_t UserNotification.SummarizationOptions.requestIdentifier.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.SummarizationOptions.requestIdentifier.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.SummarizationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.SummarizationOptions.requestedSummarizationStyles.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UserNotification.SummarizationOptions.requestedSummarizationStyles.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.SummarizationOptions.previousNotifications.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*UserNotification.SummarizationOptions.previousNotifications.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.SummarizationOptions.init(requestIdentifier:requestedSummarizationStyles:previousNotifications:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t UserNotification.SummarizationOptions.init(requestIdentifier:requestedSummarizationStyles:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  uint64_t v4 = MEMORY[0x263F8EE78];
  a4[2] = a3;
  a4[3] = v4;
  return result;
}

uint64_t UserNotification.SummarizationOptions.init()@<X0>(uint64_t *a1@<X8>)
{
  return sub_25B9E5D6C((uint64_t)&unk_270928070, a1);
}

unint64_t sub_25B9E5B50(char a1)
{
  unint64_t result = 0xD000000000000011;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001CLL;
    }
    else {
      return 0xD000000000000015;
    }
  }
  return result;
}

unint64_t sub_25B9E5BB0()
{
  return sub_25B9E5B50(*v0);
}

uint64_t sub_25B9E5BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9E5E34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9E5BE0(uint64_t a1)
{
  unint64_t v2 = sub_25B9E92E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E5C1C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E92E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void UserNotification.SummarizationOptions.encode(to:)()
{
}

void UserNotification.SummarizationOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_25B9E6244(a1, (uint64_t)&unk_26A51DB90, (uint64_t)sub_25B9E92E4, (uint64_t)&type metadata for UserNotification.SummarizationOptions.CodingKeys, a5, a6, a7, a8, vars0, vars8);
}

void sub_25B9E5CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25B9E5CE8()
{
}

uint64_t (*UserNotification.ThreadSummarizationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t (*UserNotification.ThreadSummarizationOptions.requestedSummarizationStyles.modify())()
{
  return nullsub_1;
}

uint64_t (*UserNotification.ThreadSummarizationOptions.previousNotifications.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.ThreadSummarizationOptions.init()@<X0>(uint64_t *a1@<X8>)
{
  return sub_25B9E5D6C((uint64_t)&unk_270928160, a1);
}

uint64_t sub_25B9E5D6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_25B9EC300();
  sub_25B950790();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_25B97AE5C();
  uint64_t v9 = sub_25B99DB00(a1);
  sub_25B9EC2F0();
  uint64_t v10 = sub_25B9EC2C0();
  uint64_t v12 = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  *a2 = v10;
  a2[1] = v12;
  uint64_t v14 = MEMORY[0x263F8EE78];
  a2[2] = v9;
  a2[3] = v14;
  return result;
}

uint64_t sub_25B9E5E34(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025B9EFAB0 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000025B9F11E0 || (sub_25B9EB100() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025B9F1D70)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_25B9EB100();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B9E5F50(uint64_t a1)
{
  unint64_t v2 = sub_25B9E93F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E5F8C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E93F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void UserNotification.ThreadSummarizationOptions.encode(to:)()
{
}

void sub_25B9E6004()
{
  sub_25B961A4C();
  uint64_t v14 = v1;
  int v3 = v2;
  uint64_t v5 = sub_25B94E854(v4);
  sub_25B950790();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_25B950870();
  uint64_t v9 = v3[3];
  uint64_t v10 = v3;
  uint64_t v13 = v12 - v11;
  sub_25B94F2E0(v10, v9);
  v14();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B94E854(&qword_26A51C1C8);
    sub_25B99DD84((uint64_t)&unk_26A51C1D0);
    sub_25B9E59D8();
    sub_25B9ED660();
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9E9378((uint64_t)&unk_26A51DB88);
    sub_25B9E59D8();
    sub_25B9ED660();
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v13, v5);
  sub_25B961A64();
}

void UserNotification.ThreadSummarizationOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_25B9E6244(a1, (uint64_t)&unk_26A51DBB0, (uint64_t)sub_25B9E93F8, (uint64_t)&type metadata for UserNotification.ThreadSummarizationOptions.CodingKeys, a5, a6, a7, a8, vars0, vars8);
}

void sub_25B9E6244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_25B961A4C();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  long long v24 = v15;
  sub_25B94E854(v16);
  sub_25B950790();
  MEMORY[0x270FA5388](v17);
  sub_25B950870();
  sub_25B94F2E0(v14, v14[3]);
  v12();
  sub_25B9ED7A0();
  if (v10)
  {
    sub_25B94F65C((uint64_t)v14);
  }
  else
  {
    LOBYTE(a10) = 0;
    uint64_t v18 = sub_25B9ED540();
    uint64_t v20 = v19;
    uint64_t v23 = v18;
    sub_25B94E854(&qword_26A51C1C8);
    sub_25B99DD84((uint64_t)&unk_26A51C200);
    swift_bridgeObjectRetain();
    sub_25B9ED590();
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9E9378((uint64_t)&unk_26A51DB98);
    swift_bridgeObjectRetain();
    sub_25B9ED590();
    uint64_t v21 = sub_25B9E584C();
    v22(v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t *v24 = v23;
    v24[1] = v20;
    v24[2] = a10;
    v24[3] = a10;
    sub_25B94F65C((uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9E6528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25B9E6540()
{
}

uint64_t (*UserNotification.ClassificationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.ClassificationOptions.isSenderImportant.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t UserNotification.ClassificationOptions.isSenderImportant.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*UserNotification.ClassificationOptions.isSenderImportant.modify())()
{
  return nullsub_1;
}

uint64_t (*UserNotification.ClassificationOptions.previousNotifications.modify())()
{
  return nullsub_1;
}

Sage::UserNotification::ClassificationOptions __swiftcall UserNotification.ClassificationOptions.init(requestIdentifier:isSenderImportant:previousNotifications:)(Sage::UserNotification::ClassificationOptions requestIdentifier, Swift::Bool_optional isSenderImportant, Swift::OpaquePointer previousNotifications)
{
  *(Swift::String *)uint64_t v3 = requestIdentifier.requestIdentifier;
  *(Swift::Bool_optional *)(v3 + 16) = isSenderImportant;
  *(Swift::OpaquePointer *)(v3 + 24) = previousNotifications;
  requestIdentifier.previousNotifications = previousNotifications;
  requestIdentifier.isSenderImportant = isSenderImportant;
  return requestIdentifier;
}

Sage::UserNotification::ClassificationOptions __swiftcall UserNotification.ClassificationOptions.init()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_25B9EC300();
  sub_25B950790();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_25B97AE5C();
  sub_25B9EC2F0();
  uint64_t v7 = sub_25B9EC2C0();
  uint64_t v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  *(void *)uint64_t v2 = v7;
  *(void *)(v2 + 8) = v9;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = MEMORY[0x263F8EE78];
  result.previousNotifications._rawValue = v13;
  result.requestIdentifier._object = v11;
  result.requestIdentifier._countAndFlagsBits = v10;
  result.isSenderImportant.value = v12;
  return result;
}

uint64_t sub_25B9E6690(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025B9EFAB0 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025B9F1240 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025B9F1D70)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_25B9ED6A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_25B9E67D0(unsigned __int8 a1)
{
  unint64_t result = 0xD000000000000011;
  if (a1 >= 2u) {
    return 0xD000000000000015;
  }
  return result;
}

unint64_t sub_25B9E682C()
{
  return sub_25B9E67D0(*v0);
}

uint64_t sub_25B9E6834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9E6690(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9E685C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E9444();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E6898(uint64_t a1)
{
  unint64_t v2 = sub_25B9E9444();
  return MEMORY[0x270FA00B8](a1, v2);
}

void UserNotification.ClassificationOptions.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B94E854(&qword_26A51DBB8);
  sub_25B950790();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_25B959380();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E9444();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B9A0B58();
    sub_25B9ED5F0();
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9E9378((uint64_t)&unk_26A51DB88);
    sub_25B9ED660();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_25B961A64();
}

void UserNotification.ClassificationOptions.init(from:)()
{
  sub_25B961A4C();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_25B94E854(&qword_26A51DBC8);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B94F2E0(v2, v2[3]);
  sub_25B9E9444();
  sub_25B9A0A34();
  if (v0)
  {
    sub_25B94F65C((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_25B9A0AE0();
    uint64_t v8 = v7;
    sub_25B9A0B58();
    swift_bridgeObjectRetain();
    char v12 = sub_25B9ED520();
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9E9378((uint64_t)&unk_26A51DB98);
    sub_25B9ED590();
    uint64_t v9 = sub_25B961A34();
    v10(v9);
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + 8) = v8;
    *(unsigned char *)(v4 + 16) = v12;
    *(void *)(v4 + 24) = v11;
    swift_bridgeObjectRetain();
    sub_25B94F65C((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9E6C84()
{
}

void sub_25B9E6C9C()
{
}

uint64_t UserNotification.ThreadClassificationOptions.requestIdentifier.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.ThreadClassificationOptions.requestIdentifier.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.ThreadClassificationOptions.requestIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.ThreadClassificationOptions.previousNotifications.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UserNotification.ThreadClassificationOptions.previousNotifications.modify())()
{
  return nullsub_1;
}

Sage::UserNotification::ThreadClassificationOptions __swiftcall UserNotification.ThreadClassificationOptions.init(requestIdentifier:previousNotifications:)(Swift::String requestIdentifier, Swift::OpaquePointer previousNotifications)
{
  *(Swift::String *)uint64_t v2 = requestIdentifier;
  *(Swift::OpaquePointer *)(v2 + 16) = previousNotifications;
  result.requestIdentifier = requestIdentifier;
  result.previousNotifications = previousNotifications;
  return result;
}

uint64_t sub_25B9E6D88(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025B9EFAB0 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025B9F1D70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_25B9ED6A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_25B9E6E74(char a1)
{
  if (a1) {
    return 0xD000000000000015;
  }
  else {
    return 0xD000000000000011;
  }
}

unint64_t sub_25B9E6EB0()
{
  return sub_25B9E6E74(*v0);
}

uint64_t sub_25B9E6EB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9E6D88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9E6EE0(uint64_t a1)
{
  unint64_t v2 = sub_25B9E9490();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E6F1C(uint64_t a1)
{
  unint64_t v2 = sub_25B9E9490();
  return MEMORY[0x270FA00B8](a1, v2);
}

void UserNotification.ThreadClassificationOptions.encode(to:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B94E854(&qword_26A51DBD0);
  sub_25B950790();
  uint64_t v7 = v5;
  MEMORY[0x270FA5388](v6);
  sub_25B959380();
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E9490();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v0)
  {
    sub_25B9A0B58();
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9E9378((uint64_t)&unk_26A51DB88);
    sub_25B9ED660();
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v4);
  sub_25B961A64();
}

void UserNotification.ThreadClassificationOptions.init(from:)()
{
  sub_25B961A4C();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_25B94E854(&qword_26A51DBE0);
  sub_25B950790();
  MEMORY[0x270FA5388](v5);
  sub_25B94F2E0(v2, v2[3]);
  sub_25B9E9490();
  sub_25B9A0A34();
  if (v0)
  {
    sub_25B94F65C((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_25B9A0AE0();
    uint64_t v8 = v7;
    sub_25B94E854(&qword_26A51DB80);
    sub_25B9A0B58();
    sub_25B9E9378((uint64_t)&unk_26A51DB98);
    swift_bridgeObjectRetain();
    sub_25B9ED590();
    uint64_t v9 = sub_25B961A34();
    v10(v9);
    *uint64_t v4 = v6;
    v4[1] = v8;
    v4[2] = v11;
    swift_bridgeObjectRetain();
    sub_25B94F65C((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25B961A64();
}

void sub_25B9E72AC()
{
}

void sub_25B9E72C4()
{
}

uint64_t UserNotification.NotificationType.rawValue.getter()
{
  return *(void *)v0;
}

Sage::UserNotification::NotificationType __swiftcall UserNotification.NotificationType.init(rawValue:)(Sage::UserNotification::NotificationType rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static UserNotification.NotificationType.communication.getter(void *a1@<X8>)
{
}

void static UserNotification.NotificationType.timeSensitive.getter(void *a1@<X8>)
{
}

void static UserNotification.NotificationType.critical.getter(void *a1@<X8>)
{
}

Sage::UserNotification::NotificationType sub_25B9E7304(Swift::Int *a1)
{
  return UserNotification.NotificationType.init(rawValue:)(*a1);
}

uint64_t sub_25B9E730C()
{
  return sub_25B9ED050();
}

uint64_t sub_25B9E736C()
{
  return sub_25B9ED030();
}

void sub_25B9E73C0(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25B9E73C8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25B9E73D4(*a1, *v2, a2);
}

uint64_t sub_25B9E73D4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_25B9E73E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25B9E73EC(*a1, *v2, a2);
}

uint64_t sub_25B9E73EC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_25B9E73F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25B9E7404(*a1, *v2, a2);
}

uint64_t sub_25B9E7404@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_25B9E7410(void *a1, uint64_t *a2)
{
  return sub_25B9E7418(a1, *a2);
}

BOOL sub_25B9E7418(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_25B9E7444@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B9E744C(*a1, a2);
}

uint64_t sub_25B9E744C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_25B9E7474@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25B9E747C(*a1, a2);
}

uint64_t sub_25B9E747C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_25B9E749C(uint64_t *a1)
{
  return sub_25B9E74A4(*a1);
}

uint64_t sub_25B9E74A4(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_25B9E74B4(uint64_t *a1)
{
  return sub_25B9E74BC(*a1);
}

uint64_t sub_25B9E74BC(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_25B9E74CC(uint64_t *a1)
{
  return sub_25B9E74D4(*a1);
}

uint64_t sub_25B9E74D4(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_25B9E74E4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25B9E74F0(*a1, *v2, a2);
}

uint64_t sub_25B9E74F0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_25B9E74FC(uint64_t *a1)
{
  return sub_25B9E7508(*a1, *v1);
}

BOOL sub_25B9E7508(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_25B9E7514(uint64_t *a1)
{
  return sub_25B9E7520(*a1, *v1);
}

BOOL sub_25B9E7520(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_25B9E752C(uint64_t *a1)
{
  return sub_25B9E7538(*a1, *v1);
}

BOOL sub_25B9E7538(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_25B9E7544()
{
  return sub_25B9E754C(*v0);
}

BOOL sub_25B9E754C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_25B9E7558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_25B9E7570(uint64_t *a1)
{
  return sub_25B9E7578(*a1);
}

uint64_t sub_25B9E7578(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

Sage::UserNotification::NotificationType sub_25B9E7588@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = UserNotification.NotificationType.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_25B9E75B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UserNotification.NotificationType.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_25B9E75DC(uint64_t *a1, uint64_t *a2)
{
  return sub_25B9BA518(*a1, *a2);
}

uint64_t sub_25B9E75EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t UserNotification.notificationID.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.notificationID.setter()
{
  uint64_t result = sub_25B9A09D4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.notificationID.modify())()
{
  return nullsub_1;
}

void UserNotification.notificationType.getter(void *a1@<X8>)
{
}

void *UserNotification.notificationType.setter(void *result)
{
  *(void *)(v1 + 16) = *result;
  return result;
}

uint64_t (*UserNotification.notificationType.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.contacts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*UserNotification.contacts.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.sender.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = *(void *)(v1 + 72);
  uint64_t v8 = *(void *)(v1 + 80);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(v1 + 88);
  return sub_25B9E2D24(v2, v3, v4, v5, v6);
}

__n128 UserNotification.sender.setter(long long *a1)
{
  long long v6 = a1[1];
  long long v7 = *a1;
  __n128 v5 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  char v3 = *((unsigned char *)a1 + 56);
  sub_25B9E2D90(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
  *(_OWORD *)(v1 + 32) = v7;
  *(_OWORD *)(v1 + 48) = v6;
  __n128 result = v5;
  *(__n128 *)(v1 + 64) = v5;
  *(void *)(v1 + 80) = v2;
  *(unsigned char *)(v1 + 88) = v3;
  return result;
}

uint64_t (*UserNotification.sender.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.recipients.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UserNotification.recipients.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t (*UserNotification.recipients.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UserNotification.attachments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 104) = a1;
  return result;
}

uint64_t (*UserNotification.attachments.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.dateReceived.getter()
{
  type metadata accessor for UserNotification();
  sub_25B9EC2B0();
  sub_25B95097C();
  uint64_t v0 = sub_25B9593F8();
  return v1(v0);
}

uint64_t UserNotification.dateReceived.setter()
{
  uint64_t v2 = v1 + *(int *)(sub_25B9EB05C() + 40);
  sub_25B9EC2B0();
  sub_25B95097C();
  __n128 v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v2, v0, v3);
}

uint64_t (*UserNotification.dateReceived.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.isGroupMessage.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification() + 44));
}

uint64_t UserNotification.isGroupMessage.setter(char a1)
{
  uint64_t result = type metadata accessor for UserNotification();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*UserNotification.isGroupMessage.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.appBundleID.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.appBundleID.setter()
{
  sub_25B9EB040();
  uint64_t result = sub_25B9EB144();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.appBundleID.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.threadID.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.threadID.setter()
{
  sub_25B9EB040();
  uint64_t result = sub_25B9EB144();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.threadID.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.title.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.title.setter()
{
  sub_25B9EB040();
  uint64_t result = sub_25B9EB144();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.title.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.subtitle.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.subtitle.setter()
{
  sub_25B9EB040();
  uint64_t result = sub_25B9EB144();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.subtitle.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.body.getter()
{
  return sub_25B9593F8();
}

uint64_t UserNotification.body.setter()
{
  sub_25B9EB040();
  uint64_t result = sub_25B9EB144();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UserNotification.body.modify())(void)
{
  return nullsub_1;
}

uint64_t UserNotification.init(notificationID:notificationType:sender:recipients:attachments:dateReceived:isGroupMessage:appBundleID:threadID:title:subtitle:body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20 = *a3;
  long long v33 = a4[1];
  long long v34 = *a4;
  long long v32 = a4[2];
  uint64_t v21 = *((void *)a4 + 6);
  char v22 = *((unsigned char *)a4 + 56);
  *(void *)(a9 + 24) = MEMORY[0x263F8EE78];
  uint64_t v23 = (int *)type metadata accessor for UserNotification();
  long long v24 = (void *)(a9 + v23[12]);
  uint64_t v25 = (void *)(a9 + v23[13]);
  uint64_t v26 = (void *)(a9 + v23[14]);
  char v27 = (void *)(a9 + v23[15]);
  long long v28 = (void *)(a9 + v23[16]);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v20;
  *(_OWORD *)(a9 + 32) = v34;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v32;
  *(void *)(a9 + 80) = v21;
  *(unsigned char *)(a9 + 88) = v22;
  *(void *)(a9 + 96) = a5;
  *(void *)(a9 + 104) = a6;
  uint64_t v29 = a9 + v23[10];
  sub_25B9EC2B0();
  sub_25B95097C();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 32))(v29, a7);
  *(unsigned char *)(a9 + v23[11]) = a8;
  void *v24 = a10;
  v24[1] = a11;
  *uint64_t v25 = a12;
  v25[1] = a13;
  void *v26 = a14;
  v26[1] = a15;
  *char v27 = a16;
  v27[1] = a17;
  *long long v28 = a18;
  v28[1] = a19;
  return result;
}

uint64_t sub_25B9E7F44(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6163696669746F6ELL && a2 == 0xEE0044496E6F6974;
  if (v2 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025B9F1D90 || (sub_25B9ED6A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x73746361746E6F63 && a2 == 0xE800000000000000;
    if (v6 || (sub_25B9ED6A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x7265646E6573 && a2 == 0xE600000000000000;
      if (v7 || (sub_25B9ED6A0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6E65697069636572 && a2 == 0xEA00000000007374;
        if (v8 || (sub_25B9ED6A0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
          if (v9 || (sub_25B9ED6A0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6563655265746164 && a2 == 0xEC00000064657669;
            if (v10 || (sub_25B9ED6A0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x4D70756F72477369 && a2 == 0xEE00656761737365;
              if (v11 || (sub_25B9ED6A0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                BOOL v12 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000444965;
                if (v12 || (sub_25B9ED6A0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  BOOL v13 = a1 == 0x4449646165726874 && a2 == 0xE800000000000000;
                  if (v13 || (sub_25B9ED6A0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
                    if (v14 || (sub_25B9ED6A0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 10;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x656C746974627573 && a2 == 0xE800000000000000;
                      if (v15 || (sub_25B9ED6A0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else if (a1 == 2036625250 && a2 == 0xE400000000000000)
                      {
                        swift_bridgeObjectRelease();
                        return 12;
                      }
                      else
                      {
                        char v17 = sub_25B9ED6A0();
                        swift_bridgeObjectRelease();
                        if (v17) {
                          return 12;
                        }
                        else {
                          return 13;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25B9E84CC()
{
  return 13;
}

unint64_t sub_25B9E84D4(char a1)
{
  unint64_t result = 0x6163696669746F6ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x73746361746E6F63;
      break;
    case 3:
      unint64_t result = 0x7265646E6573;
      break;
    case 4:
      unint64_t result = 0x6E65697069636572;
      break;
    case 5:
      unint64_t result = 0x656D686361747461;
      break;
    case 6:
      unint64_t result = 0x6563655265746164;
      break;
    case 7:
      unint64_t result = 0x4D70756F72477369;
      break;
    case 8:
      unint64_t result = 0x6C646E7542707061;
      break;
    case 9:
      unint64_t result = 0x4449646165726874;
      break;
    case 10:
      unint64_t result = 0x656C746974;
      break;
    case 11:
      unint64_t result = 0x656C746974627573;
      break;
    case 12:
      unint64_t result = 2036625250;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25B9E868C()
{
  return sub_25B9E84D4(*v0);
}

uint64_t sub_25B9E8694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B9E7F44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B9E86BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25B9E84CC();
  *a1 = result;
  return result;
}

uint64_t sub_25B9E86E4(uint64_t a1)
{
  unint64_t v2 = sub_25B9E94DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B9E8720(uint64_t a1)
{
  unint64_t v2 = sub_25B9E94DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.encode(to:)(void *a1)
{
  uint64_t v3 = sub_25B94E854(&qword_26A51DBE8);
  sub_25B950790();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_25B950870();
  uint64_t v9 = v8 - v7;
  sub_25B94F2E0(a1, a1[3]);
  sub_25B9E94DC();
  sub_25B9ED7B0();
  sub_25B9ED610();
  if (!v1)
  {
    sub_25B9E9528();
    sub_25B94E9A0();
    sub_25B9ED660();
    sub_25B94E854(&qword_26A51C2C0);
    sub_25B99DD84((uint64_t)&unk_26A51C2C8);
    sub_25B9EB094();
    sub_25B99E164();
    sub_25B94E9A0();
    sub_25B9ED600();
    sub_25B9EB094();
    sub_25B94E854(&qword_26A51C2D8);
    sub_25B9E9574((uint64_t)&unk_26A51C2E0);
    sub_25B9ED660();
    BOOL v10 = (int *)type metadata accessor for UserNotification();
    sub_25B9EC2B0();
    sub_25B9E9640((uint64_t)&unk_26A51C2D0);
    sub_25B9ED660();
    sub_25B9ED620();
    sub_25B9EB15C(v10[12]);
    sub_25B9EAFE8(8);
    sub_25B9EB15C(v10[13]);
    sub_25B9EAFE8(9);
    sub_25B9EB15C(v10[14]);
    sub_25B9EAFE8(10);
    sub_25B9EB15C(v10[15]);
    sub_25B9EAFE8(11);
    sub_25B9EB15C(v10[16]);
    sub_25B9EAFE8(12);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

void UserNotification.init(from:)()
{
  sub_25B961A4C();
  uint64_t v3 = v2;
  uint64_t v33 = v4;
  sub_25B9EC2B0();
  sub_25B950790();
  uint64_t v34 = v6;
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  sub_25B950870();
  uint64_t v9 = v8 - v7;
  sub_25B94E854(&qword_26A51DC00);
  sub_25B950790();
  MEMORY[0x270FA5388](v10);
  sub_25B950870();
  uint64_t v11 = type metadata accessor for UserNotification();
  sub_25B95097C();
  MEMORY[0x270FA5388](v12);
  sub_25B959380();
  *(void *)(v1 + 24) = MEMORY[0x263F8EE78];
  *(_OWORD *)(v1 + 32) = xmmword_25B9F90C0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 73) = 0u;
  sub_25B9EB0F4(*(int *)(v13 + 48));
  v41 = v14;
  sub_25B9EB0F4(*(int *)(v15 + 52));
  v40 = v16;
  sub_25B9EB0F4(*(int *)(v17 + 56));
  v39 = v18;
  sub_25B9EB0F4(*(int *)(v19 + 60));
  v38 = v20;
  sub_25B9EB0F4(*(int *)(v21 + 64));
  uint64_t v36 = (uint64_t)v3;
  uint64_t v37 = v22;
  sub_25B94F2E0(v3, v3[3]);
  sub_25B9E94DC();
  sub_25B9ED7A0();
  if (v0)
  {
    sub_25B94F65C((uint64_t)v3);
    swift_bridgeObjectRelease();
    sub_25B9E2D90(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v42) = 0;
    *(void *)uint64_t v1 = sub_25B9ED540();
    *(void *)(v1 + 8) = v23;
    sub_25B9E95F4();
    sub_25B9EB124();
    sub_25B9ED590();
    *(void *)(v1 + 16) = v42;
    sub_25B94E854(&qword_26A51C2C0);
    sub_25B99DD84((uint64_t)&unk_26A51C300);
    sub_25B9EB0C0();
    *(void *)(v1 + 24) = v42;
    sub_25B99E230();
    sub_25B9EB124();
    sub_25B9ED530();
    *(_OWORD *)(v1 + 32) = v42;
    *(_OWORD *)(v1 + 48) = v43;
    *(_OWORD *)(v1 + 64) = v44;
    *(void *)(v1 + 80) = v45;
    *(unsigned char *)(v1 + 88) = v46;
    sub_25B9EB0C0();
    *(void *)(v1 + 96) = v42;
    sub_25B94E854(&qword_26A51C2D8);
    sub_25B9E9574((uint64_t)&unk_26A51C310);
    sub_25B9EB188();
    *(void *)(v1 + 104) = v42;
    sub_25B9E9640((uint64_t)&unk_26A51C308);
    sub_25B9EB188();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v1 + *(int *)(v11 + 40), v9, v35);
    *(unsigned char *)(v1 + *(int *)(v11 + 44)) = sub_25B9ED550() & 1;
    uint64_t *v41 = sub_25B9EB168(8);
    v41[1] = v24;
    uint64_t *v40 = sub_25B9EB168(9);
    v40[1] = v25;
    uint64_t *v39 = sub_25B9EB074(10);
    v39[1] = v26;
    uint64_t *v38 = sub_25B9EB074(11);
    v38[1] = v27;
    uint64_t v28 = sub_25B9EB074(12);
    uint64_t v30 = v29;
    uint64_t v31 = sub_25B9EB1A8();
    v32(v31);
    swift_bridgeObjectRelease();
    *uint64_t v37 = v28;
    v37[1] = v30;
    sub_25B9E9684(v1, v33);
    sub_25B94F65C(v36);
    sub_25B9E96E8(v1);
  }
  sub_25B961A64();
}

void sub_25B9E9110()
{
}

uint64_t sub_25B9E9128(void *a1)
{
  return UserNotification.encode(to:)(a1);
}

uint64_t UserNotification.init(notificationID:notificationType:contacts:attachments:dateReceived:isGroupMessage:appBundleID:threadID:title:subtitle:body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, char a6@<W6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  swift_bridgeObjectRelease();
  uint64_t v21 = *a3;
  *(void *)(a8 + 24) = MEMORY[0x263F8EE78];
  char v22 = (int *)type metadata accessor for UserNotification();
  uint64_t v23 = (void *)(a8 + v22[12]);
  uint64_t v24 = (void *)(a8 + v22[13]);
  uint64_t v25 = (void *)(a8 + v22[14]);
  uint64_t v26 = (void *)(a8 + v22[15]);
  uint64_t v27 = (void *)(a8 + v22[16]);
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = v21;
  *(_OWORD *)(a8 + 73) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 32) = xmmword_25B9F90C0;
  *(void *)(a8 + 96) = MEMORY[0x263F8EE78];
  *(void *)(a8 + 104) = a4;
  uint64_t v28 = a8 + v22[10];
  sub_25B9EC2B0();
  sub_25B95097C();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 32))(v28, a5);
  *(unsigned char *)(a8 + v22[11]) = a6;
  *uint64_t v23 = a7;
  v23[1] = a9;
  void *v24 = a10;
  v24[1] = a11;
  *uint64_t v25 = a12;
  v25[1] = a13;
  void *v26 = a14;
  v26[1] = a15;
  *uint64_t v27 = a16;
  v27[1] = a17;
  return result;
}

unint64_t sub_25B9E92E4()
{
  unint64_t result = qword_26A51DB78;
  if (!qword_26A51DB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DB78);
  }
  return result;
}

uint64_t type metadata accessor for UserNotification()
{
  uint64_t result = qword_26A51DC30;
  if (!qword_26A51DC30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25B9E9378(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_25B9524FC(&qword_26A51DB80);
    sub_25B9E9640(v4);
    unint64_t result = sub_25B9A0B38();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25B9E93F8()
{
  unint64_t result = qword_26A51DBA8;
  if (!qword_26A51DBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DBA8);
  }
  return result;
}

unint64_t sub_25B9E9444()
{
  unint64_t result = qword_26A51DBC0;
  if (!qword_26A51DBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DBC0);
  }
  return result;
}

unint64_t sub_25B9E9490()
{
  unint64_t result = qword_26A51DBD8;
  if (!qword_26A51DBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DBD8);
  }
  return result;
}

unint64_t sub_25B9E94DC()
{
  unint64_t result = qword_26A51DBF0;
  if (!qword_26A51DBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DBF0);
  }
  return result;
}

unint64_t sub_25B9E9528()
{
  unint64_t result = qword_26A51DBF8;
  if (!qword_26A51DBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DBF8);
  }
  return result;
}

unint64_t sub_25B9E9574(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_25B9524FC(&qword_26A51C2D8);
    sub_25B9E9640(v4);
    unint64_t result = sub_25B9A0B38();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25B9E95F4()
{
  unint64_t result = qword_26A51DC08;
  if (!qword_26A51DC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC08);
  }
  return result;
}

unint64_t sub_25B9E9640(uint64_t a1)
{
  unint64_t result = sub_25B9A0BA4(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25B9E9684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserNotification();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B9E96E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserNotification();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25B9E9748()
{
  unint64_t result = qword_26A51DC10;
  if (!qword_26A51DC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC10);
  }
  return result;
}

unint64_t sub_25B9E9798()
{
  unint64_t result = qword_26A51DC18;
  if (!qword_26A51DC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC18);
  }
  return result;
}

unint64_t sub_25B9E97E8()
{
  unint64_t result = qword_26A51DC20;
  if (!qword_26A51DC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC20);
  }
  return result;
}

unint64_t sub_25B9E9838()
{
  unint64_t result = qword_26A51DC28;
  if (!qword_26A51DC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC28);
  }
  return result;
}

unint64_t sub_25B9E98A4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25B9E9640((uint64_t)&qword_26A51B2D8);
  unint64_t result = sub_25B9E9640((uint64_t)&qword_26A51B200);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UserNotification(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9 == 1)
    {
      long long v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v10;
      *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
      *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    }
    else
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v9;
      int v12 = *((unsigned __int8 *)a2 + 64);
      swift_bridgeObjectRetain();
      if (v12 == 255)
      {
        *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
        *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
      }
      else
      {
        uint64_t v13 = a2[6];
        uint64_t v14 = a2[7];
        sub_25B9563BC(v13, v14, v12);
        *(void *)(a1 + 48) = v13;
        *(void *)(a1 + 56) = v14;
        *(unsigned char *)(a1 + 64) = v12;
      }
      uint64_t v15 = a2[10];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = v15;
      *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
      swift_bridgeObjectRetain();
    }
    uint64_t v16 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v16;
    uint64_t v17 = a3[10];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = sub_25B9EC2B0();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    uint64_t v22 = a3[12];
    *(unsigned char *)(a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = a3[13];
    uint64_t v27 = a3[14];
    uint64_t v28 = (void *)(a1 + v26);
    uint64_t v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = (void *)(a1 + v27);
    long long v32 = (uint64_t *)((char *)a2 + v27);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = a3[15];
    uint64_t v35 = a3[16];
    uint64_t v36 = (void *)(a1 + v34);
    uint64_t v37 = (uint64_t *)((char *)a2 + v34);
    uint64_t v38 = v37[1];
    void *v36 = *v37;
    v36[1] = v38;
    v39 = (void *)(a1 + v35);
    v40 = (uint64_t *)((char *)a2 + v35);
    uint64_t v41 = v40[1];
    void *v39 = *v40;
    v39[1] = v41;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for UserNotification(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40) != 1)
  {
    swift_bridgeObjectRelease();
    int v4 = *(unsigned __int8 *)(a1 + 64);
    if (v4 != 255) {
      sub_25B9566FC(*(void *)(a1 + 48), *(void *)(a1 + 56), v4);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 40);
  uint64_t v6 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 == 1)
  {
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  }
  else
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v8;
    int v10 = *(unsigned __int8 *)(a2 + 64);
    swift_bridgeObjectRetain();
    if (v10 == 255)
    {
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    }
    else
    {
      uint64_t v11 = *(void *)(a2 + 48);
      uint64_t v12 = *(void *)(a2 + 56);
      sub_25B9563BC(v11, v12, v10);
      *(void *)(a1 + 48) = v11;
      *(void *)(a1 + 56) = v12;
      *(unsigned char *)(a1 + 64) = v10;
    }
    uint64_t v13 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v13;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    swift_bridgeObjectRetain();
  }
  uint64_t v14 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v14;
  uint64_t v15 = a3[10];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_25B9EC2B0();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  uint64_t v20 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[13];
  uint64_t v25 = a3[14];
  uint64_t v26 = (void *)(a1 + v24);
  uint64_t v27 = (void *)(a2 + v24);
  uint64_t v28 = v27[1];
  void *v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = (void *)(a1 + v25);
  uint64_t v30 = (void *)(a2 + v25);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[15];
  uint64_t v33 = a3[16];
  uint64_t v34 = (void *)(a1 + v32);
  uint64_t v35 = (void *)(a2 + v32);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  uint64_t v37 = (void *)(a1 + v33);
  uint64_t v38 = (void *)(a2 + v33);
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (long long *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40) == 1)
  {
    if (v8 == 1)
    {
      long long v9 = *v7;
      long long v10 = *(_OWORD *)(a2 + 48);
      long long v11 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
      *(_OWORD *)(a1 + 48) = v10;
      *(_OWORD *)(a1 + 64) = v11;
      *uint64_t v6 = v9;
    }
    else
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      int v15 = *(unsigned __int8 *)(a2 + 64);
      swift_bridgeObjectRetain();
      if (v15 == 255)
      {
        long long v26 = *(_OWORD *)(a2 + 48);
        *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
        *(_OWORD *)(a1 + 48) = v26;
      }
      else
      {
        uint64_t v16 = *(void *)(a2 + 48);
        uint64_t v17 = *(void *)(a2 + 56);
        sub_25B9563BC(v16, v17, v15);
        *(void *)(a1 + 48) = v16;
        *(void *)(a1 + 56) = v17;
        *(unsigned char *)(a1 + 64) = v15;
      }
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      swift_bridgeObjectRetain();
    }
  }
  else if (v8 == 1)
  {
    sub_25B9E4148(a1 + 32);
    long long v13 = *(_OWORD *)(a2 + 48);
    long long v12 = *(_OWORD *)(a2 + 64);
    long long v14 = *v7;
    *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
    *(_OWORD *)(a1 + 48) = v13;
    *(_OWORD *)(a1 + 64) = v12;
    *uint64_t v6 = v14;
  }
  else
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v18 = (long long *)(a1 + 48);
    uint64_t v19 = (long long *)(a2 + 48);
    int v20 = *(unsigned __int8 *)(a2 + 64);
    if (*(unsigned __int8 *)(a1 + 64) == 255)
    {
      if (v20 == 255)
      {
        long long v30 = *v19;
        *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
        *uint64_t v18 = v30;
      }
      else
      {
        uint64_t v27 = *(void *)(a2 + 48);
        uint64_t v28 = *(void *)(a2 + 56);
        sub_25B9563BC(v27, v28, *(unsigned char *)(a2 + 64));
        *(void *)(a1 + 48) = v27;
        *(void *)(a1 + 56) = v28;
        *(unsigned char *)(a1 + 64) = v20;
      }
    }
    else if (v20 == 255)
    {
      sub_25B997800(a1 + 48);
      char v29 = *(unsigned char *)(a2 + 64);
      *uint64_t v18 = *v19;
      *(unsigned char *)(a1 + 64) = v29;
    }
    else
    {
      uint64_t v21 = *(void *)(a2 + 48);
      uint64_t v22 = *(void *)(a2 + 56);
      sub_25B9563BC(v21, v22, *(unsigned char *)(a2 + 64));
      uint64_t v23 = *(void *)(a1 + 48);
      uint64_t v24 = *(void *)(a1 + 56);
      *(void *)(a1 + 48) = v21;
      *(void *)(a1 + 56) = v22;
      unsigned __int8 v25 = *(unsigned char *)(a1 + 64);
      *(unsigned char *)(a1 + 64) = v20;
      sub_25B9566FC(v23, v24, v25);
    }
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[10];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v35 = a3[12];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  void *v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v38 = a3[13];
  uint64_t v39 = (void *)(a1 + v38);
  v40 = (void *)(a2 + v38);
  void *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[14];
  long long v42 = (void *)(a1 + v41);
  long long v43 = (void *)(a2 + v41);
  *long long v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = a3[15];
  uint64_t v45 = (void *)(a1 + v44);
  char v46 = (void *)(a2 + v44);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[16];
  v48 = (void *)(a1 + v47);
  v49 = (void *)(a2 + v47);
  void *v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for UserNotification(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  uint64_t v8 = a3[10];
  long long v9 = (char *)a1 + v8;
  long long v10 = (char *)a2 + v8;
  a1[6] = a2[6];
  uint64_t v11 = sub_25B9EC2B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  uint64_t v13 = a3[14];
  *(_OWORD *)((char *)a1 + a3[13]) = *(_OWORD *)((char *)a2 + a3[13]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  uint64_t v14 = a3[16];
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  *(_OWORD *)((char *)a1 + v14) = *(_OWORD *)((char *)a2 + v14);
  return a1;
}

uint64_t assignWithTake for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40) == 1) {
    goto LABEL_4;
  }
  uint64_t v8 = *(void *)(a2 + 40);
  if (v8 != 1)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v8;
    swift_bridgeObjectRelease();
    long long v10 = (_OWORD *)(a2 + 48);
    int v11 = *(unsigned __int8 *)(a1 + 64);
    if (v11 != 255)
    {
      int v12 = *(unsigned __int8 *)(a2 + 64);
      if (v12 != 255)
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        *(_OWORD *)(a1 + 48) = *v10;
        *(unsigned char *)(a1 + 64) = v12;
        sub_25B9566FC(v13, v14, v11);
LABEL_10:
        uint64_t v15 = *(void *)(a2 + 80);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        *(void *)(a1 + 80) = v15;
        swift_bridgeObjectRelease();
        *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
        goto LABEL_11;
      }
      sub_25B997800(a1 + 48);
    }
    *(_OWORD *)(a1 + 48) = *v10;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    goto LABEL_10;
  }
  sub_25B9E4148(a1 + 32);
LABEL_4:
  long long v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
LABEL_11:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25B9EC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[13];
  long long v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[14];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[15];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (uint64_t *)(a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  void *v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[16];
  uint64_t v41 = (void *)(a1 + v40);
  long long v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  void *v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B9EA510);
}

uint64_t sub_25B9EA510(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25B9EC2B0();
    uint64_t v9 = a1 + *(int *)(a3 + 40);
    return _s4Sage24ClassificationXPCRequestC7RequestOwet_0(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B9EA5AC);
}

uint64_t sub_25B9EA5AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25B9EC2B0();
    uint64_t v8 = v5 + *(int *)(a4 + 40);
    return _s4Sage24ClassificationXPCRequestC7RequestOwst_0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25B9EA62C()
{
  uint64_t result = sub_25B9EC2B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for UserNotification.SummarizationOptions()
{
}

void type metadata accessor for UserNotification.ThreadSummarizationOptions()
{
}

void type metadata accessor for UserNotification.ClassificationOptions()
{
}

void type metadata accessor for UserNotification.ThreadClassificationOptions()
{
}

void type metadata accessor for UserNotification.NotificationType()
{
}

uint64_t getEnumTagSinglePayload for UserNotification.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF4)
  {
    if (a2 + 12 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 12) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v5 = v6 - 13;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UserNotification.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x25B9EA898);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.CodingKeys()
{
  return &type metadata for UserNotification.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UserNotification.ThreadClassificationOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x25B9EA99CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.ThreadClassificationOptions.CodingKeys()
{
  return &type metadata for UserNotification.ThreadClassificationOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.ClassificationOptions.CodingKeys()
{
  return &type metadata for UserNotification.ClassificationOptions.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.ThreadSummarizationOptions.CodingKeys()
{
  return &type metadata for UserNotification.ThreadSummarizationOptions.CodingKeys;
}

unsigned char *_s4Sage16UserNotificationV21ClassificationOptionsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x25B9EAAC4);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.SummarizationOptions.CodingKeys()
{
  return &type metadata for UserNotification.SummarizationOptions.CodingKeys;
}

unint64_t sub_25B9EAB00()
{
  unint64_t result = qword_26A51DC40;
  if (!qword_26A51DC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC40);
  }
  return result;
}

unint64_t sub_25B9EAB50()
{
  unint64_t result = qword_26A51DC48;
  if (!qword_26A51DC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC48);
  }
  return result;
}

unint64_t sub_25B9EABA0()
{
  unint64_t result = qword_26A51DC50;
  if (!qword_26A51DC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC50);
  }
  return result;
}

unint64_t sub_25B9EABF0()
{
  unint64_t result = qword_26A51DC58;
  if (!qword_26A51DC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC58);
  }
  return result;
}

unint64_t sub_25B9EAC40()
{
  unint64_t result = qword_26A51DC60;
  if (!qword_26A51DC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC60);
  }
  return result;
}

unint64_t sub_25B9EAC90()
{
  unint64_t result = qword_26A51DC68;
  if (!qword_26A51DC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC68);
  }
  return result;
}

unint64_t sub_25B9EACE0()
{
  unint64_t result = qword_26A51DC70;
  if (!qword_26A51DC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC70);
  }
  return result;
}

unint64_t sub_25B9EAD30()
{
  unint64_t result = qword_26A51DC78;
  if (!qword_26A51DC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC78);
  }
  return result;
}

unint64_t sub_25B9EAD80()
{
  unint64_t result = qword_26A51DC80;
  if (!qword_26A51DC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC80);
  }
  return result;
}

unint64_t sub_25B9EADD0()
{
  unint64_t result = qword_26A51DC88;
  if (!qword_26A51DC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC88);
  }
  return result;
}

unint64_t sub_25B9EAE20()
{
  unint64_t result = qword_26A51DC90;
  if (!qword_26A51DC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC90);
  }
  return result;
}

unint64_t sub_25B9EAE70()
{
  unint64_t result = qword_26A51DC98;
  if (!qword_26A51DC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DC98);
  }
  return result;
}

unint64_t sub_25B9EAEC0()
{
  unint64_t result = qword_26A51DCA0;
  if (!qword_26A51DCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DCA0);
  }
  return result;
}

unint64_t sub_25B9EAF10()
{
  unint64_t result = qword_26A51DCA8;
  if (!qword_26A51DCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DCA8);
  }
  return result;
}

unint64_t sub_25B9EAF60()
{
  unint64_t result = qword_26A51DCB0;
  if (!qword_26A51DCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A51DCB0);
  }
  return result;
}

uint64_t sub_25B9EAFE8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 128) = a1;
  return sub_25B9ED5E0();
}

uint64_t sub_25B9EB00C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B9EB028()
{
  return v0;
}

uint64_t sub_25B9EB040()
{
  return type metadata accessor for UserNotification();
}

uint64_t sub_25B9EB05C()
{
  return type metadata accessor for UserNotification();
}

uint64_t sub_25B9EB074@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 144) = a1;
  return sub_25B9ED510();
}

uint64_t sub_25B9EB094()
{
  return sub_25B9ED660();
}

uint64_t sub_25B9EB0C0()
{
  return sub_25B9ED590();
}

uint64_t _s4Sage16UserNotificationV20SummarizationOptionsV21previousNotificationsSayACGvg_0()
{
  return swift_bridgeObjectRetain();
}

void sub_25B9EB0F4(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)(v1 + a1);
  *uint64_t v2 = 0;
  v2[1] = 0;
}

uint64_t sub_25B9EB100()
{
  return sub_25B9ED6A0();
}

void sub_25B9EB13C(void *a1@<X8>)
{
  *a1 = v1;
}

uint64_t sub_25B9EB144()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B9EB15C@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t sub_25B9EB168@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 144) = a1;
  return sub_25B9ED510();
}

uint64_t sub_25B9EB188()
{
  return sub_25B9ED590();
}

uint64_t sub_25B9EB1A8()
{
  return *(void *)(v0 - 224);
}

uint64_t dispatch thunk of XPCServiceClientConnectionProtocol.init(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of XPCServiceClientConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of XPCServiceClientConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 32)
                                                                                     + **(int **)(a6 + 32));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_25B9EB348;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_25B9EB348()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B9EB43C()
{
  return sub_25B9EC9C0();
}

uint64_t sub_25B9EB460()
{
  return sub_25B9EC9D0();
}

uint64_t sub_25B9EB484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_25B9EB4AC, 0, 0);
}

uint64_t sub_25B9EB4AC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25B9EB550;
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  return MEMORY[0x270F57710](v4, v5, v2, v3);
}

uint64_t sub_25B9EB550()
{
  sub_25B960524();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for XPCServiceClientConnectionSession()
{
  return self;
}

uint64_t sub_25B9EB644@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_25B9EB86C();
  *a1 = result;
  return result;
}

uint64_t sub_25B9EB690()
{
  return sub_25B9EB43C();
}

uint64_t sub_25B9EB6B4()
{
  return sub_25B9EB460();
}

uint64_t sub_25B9EB6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25B9EB79C;
  return sub_25B9EB484(a1, a2, a3, a4);
}

uint64_t sub_25B9EB79C()
{
  sub_25B960524();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B9EB86C()
{
  uint64_t v0 = swift_allocObject();
  sub_25B94E854(&qword_26A51BD40);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_25B9EC9F0();
  return v0;
}

id XPCValue.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for XPCValue();
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

uint64_t type metadata accessor for XPCValue()
{
  return self;
}

void sub_25B9EB950(void *a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
  unint64_t v5 = v4;
  uint64_t v6 = (void *)sub_25B9EC280();
  sub_25B955A74(v3, v5);
  id v7 = (id)sub_25B9ECFC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);
}

id sub_25B9EBBFC()
{
  uint64_t v0 = sub_25B9ECFD0();
  uint64_t v2 = v1;
  sub_25B94E854((uint64_t *)&unk_26A51DCF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B9F6AE0;
  *(void *)(inited + 32) = sub_25B9ECFD0();
  *(void *)(inited + 40) = v4;
  sub_25B9ED390();
  sub_25B9ED000();
  sub_25B9ED000();
  sub_25B9ED000();
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  uint64_t v5 = sub_25B9ECF80();
  id v6 = objc_allocWithZone(MEMORY[0x263F087E8]);
  return sub_25B9EC03C(v0, v2, 4865, v5);
}

id XPCValue.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id XPCValue.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCValue();
  return objc_msgSendSuper2(&v2, sel_init);
}

id XPCValue.__allocating_init(coder:)(void *a1)
{
  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = v1;
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

void sub_25B9EBECC()
{
}

id XPCValue.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCValue();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25B9EBF80(uint64_t a1)
{
  return sub_25B9EBFE8(a1, MEMORY[0x263F061E0], MEMORY[0x263F061D8], &qword_26A51DCD0);
}

uint64_t sub_25B9EBFB4(uint64_t a1)
{
  return sub_25B9EBFE8(a1, MEMORY[0x263F06128], MEMORY[0x263F06120], &qword_26A51DCD8);
}

uint64_t sub_25B9EBFE8(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

id sub_25B9EC03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)sub_25B9ECFC0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_25B9ECF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t method lookup function for XPCValue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCValue);
}

uint64_t dispatch thunk of static XPCValue.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of XPCValue.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of XPCValue.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t sub_25B9EC160()
{
  return MEMORY[0x270EED980]();
}

uint64_t sub_25B9EC170()
{
  return MEMORY[0x270EEDA58]();
}

uint64_t sub_25B9EC180()
{
  return MEMORY[0x270EEDA80]();
}

uint64_t sub_25B9EC190()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_25B9EC1A0()
{
  return MEMORY[0x270EEDAA0]();
}

uint64_t sub_25B9EC1B0()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_25B9EC1C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25B9EC1D0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25B9EC1E0()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_25B9EC1F0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25B9EC200()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_25B9EC210()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B9EC220()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B9EC230()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B9EC240()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_25B9EC250()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25B9EC260()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_25B9EC270()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B9EC280()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25B9EC290()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_25B9EC2A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B9EC2B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B9EC2C0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25B9EC2D0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25B9EC2E0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25B9EC2F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25B9EC300()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25B9EC310()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25B9EC320()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25B9EC330()
{
  return MEMORY[0x270F4BFC0]();
}

uint64_t sub_25B9EC340()
{
  return MEMORY[0x270F4C160]();
}

uint64_t sub_25B9EC350()
{
  return MEMORY[0x270F7EBA8]();
}

uint64_t sub_25B9EC360()
{
  return MEMORY[0x270F7EBC0]();
}

uint64_t sub_25B9EC370()
{
  return MEMORY[0x270F7EBC8]();
}

uint64_t sub_25B9EC380()
{
  return MEMORY[0x270F7EC40]();
}

uint64_t sub_25B9EC390()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_25B9EC3A0()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_25B9EC3B0()
{
  return MEMORY[0x270F7EC68]();
}

uint64_t sub_25B9EC3C0()
{
  return MEMORY[0x270F7EC70]();
}

uint64_t sub_25B9EC3D0()
{
  return MEMORY[0x270F7EC78]();
}

uint64_t sub_25B9EC3E0()
{
  return MEMORY[0x270F7EC88]();
}

uint64_t sub_25B9EC3F0()
{
  return MEMORY[0x270F7EC90]();
}

uint64_t sub_25B9EC400()
{
  return MEMORY[0x270F7ECC0]();
}

uint64_t sub_25B9EC410()
{
  return MEMORY[0x270F7ECC8]();
}

uint64_t sub_25B9EC430()
{
  return MEMORY[0x270F7ED20]();
}

uint64_t sub_25B9EC440()
{
  return MEMORY[0x270F7ED28]();
}

uint64_t sub_25B9EC450()
{
  return MEMORY[0x270F7ED30]();
}

uint64_t sub_25B9EC460()
{
  return MEMORY[0x270F7ED38]();
}

uint64_t sub_25B9EC470()
{
  return MEMORY[0x270F7ED60]();
}

uint64_t sub_25B9EC480()
{
  return MEMORY[0x270F7ED68]();
}

uint64_t sub_25B9EC490()
{
  return MEMORY[0x270F7ED88]();
}

uint64_t sub_25B9EC4A0()
{
  return MEMORY[0x270F7ED90]();
}

uint64_t sub_25B9EC4B0()
{
  return MEMORY[0x270F7EDE0]();
}

uint64_t sub_25B9EC4C0()
{
  return MEMORY[0x270F7EDE8]();
}

uint64_t sub_25B9EC4D0()
{
  return MEMORY[0x270F7EDF8]();
}

uint64_t sub_25B9EC4E0()
{
  return MEMORY[0x270F7EE20]();
}

uint64_t sub_25B9EC4F0()
{
  return MEMORY[0x270F7EE28]();
}

uint64_t sub_25B9EC500()
{
  return MEMORY[0x270F7EE30]();
}

uint64_t sub_25B9EC510()
{
  return MEMORY[0x270F7EE38]();
}

uint64_t sub_25B9EC520()
{
  return MEMORY[0x270F7EE40]();
}

uint64_t sub_25B9EC540()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_25B9EC550()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_25B9EC560()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_25B9EC580()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_25B9EC590()
{
  return MEMORY[0x270F7EF20]();
}

uint64_t sub_25B9EC5A0()
{
  return MEMORY[0x270F7EF28]();
}

uint64_t sub_25B9EC5B0()
{
  return MEMORY[0x270F7EF30]();
}

uint64_t sub_25B9EC5C0()
{
  return MEMORY[0x270F7EF70]();
}

uint64_t sub_25B9EC5D0()
{
  return MEMORY[0x270F7EF78]();
}

uint64_t sub_25B9EC5E0()
{
  return MEMORY[0x270F7EF80]();
}

uint64_t sub_25B9EC5F0()
{
  return MEMORY[0x270F7EF98]();
}

uint64_t sub_25B9EC600()
{
  return MEMORY[0x270F7EFA0]();
}

uint64_t sub_25B9EC610()
{
  return MEMORY[0x270F7EFA8]();
}

uint64_t sub_25B9EC620()
{
  return MEMORY[0x270F7EFB8]();
}

uint64_t sub_25B9EC630()
{
  return MEMORY[0x270F7EFC0]();
}

uint64_t sub_25B9EC640()
{
  return MEMORY[0x270F7EFC8]();
}

uint64_t sub_25B9EC650()
{
  return MEMORY[0x270F7EFD0]();
}

uint64_t sub_25B9EC660()
{
  return MEMORY[0x270F7EFD8]();
}

uint64_t sub_25B9EC670()
{
  return MEMORY[0x270F7EFE0]();
}

uint64_t sub_25B9EC680()
{
  return MEMORY[0x270F7EFE8]();
}

uint64_t sub_25B9EC690()
{
  return MEMORY[0x270F7F088]();
}

uint64_t sub_25B9EC6A0()
{
  return MEMORY[0x270F7F090]();
}

uint64_t sub_25B9EC6B0()
{
  return MEMORY[0x270F7F098]();
}

uint64_t sub_25B9EC6C0()
{
  return MEMORY[0x270F7F0A0]();
}

uint64_t sub_25B9EC6D0()
{
  return MEMORY[0x270F7F0A8]();
}

uint64_t sub_25B9EC6E0()
{
  return MEMORY[0x270F7F0B0]();
}

uint64_t sub_25B9EC6F0()
{
  return MEMORY[0x270F7F0C8]();
}

uint64_t sub_25B9EC700()
{
  return MEMORY[0x270F7F0D0]();
}

uint64_t sub_25B9EC710()
{
  return MEMORY[0x270F7F0D8]();
}

uint64_t sub_25B9EC720()
{
  return MEMORY[0x270F7F0E0]();
}

uint64_t sub_25B9EC730()
{
  return MEMORY[0x270F7F0E8]();
}

uint64_t sub_25B9EC740()
{
  return MEMORY[0x270F7F0F0]();
}

uint64_t sub_25B9EC750()
{
  return MEMORY[0x270F7F190]();
}

uint64_t sub_25B9EC760()
{
  return MEMORY[0x270F7F198]();
}

uint64_t sub_25B9EC770()
{
  return MEMORY[0x270F7F1A0]();
}

uint64_t sub_25B9EC780()
{
  return MEMORY[0x270F7F390]();
}

uint64_t sub_25B9EC790()
{
  return MEMORY[0x270F7F3A0]();
}

uint64_t sub_25B9EC7A0()
{
  return MEMORY[0x270F7F3C0]();
}

uint64_t sub_25B9EC7B0()
{
  return MEMORY[0x270F7F3D0]();
}

uint64_t sub_25B9EC7C0()
{
  return MEMORY[0x270F7F3E0]();
}

uint64_t sub_25B9EC7D0()
{
  return MEMORY[0x270F7F3F0]();
}

uint64_t sub_25B9EC7E0()
{
  return MEMORY[0x270F7F438]();
}

uint64_t sub_25B9EC7F0()
{
  return MEMORY[0x270F7F278]();
}

uint64_t sub_25B9EC800()
{
  return MEMORY[0x270F7F280]();
}

uint64_t sub_25B9EC810()
{
  return MEMORY[0x270F7F288]();
}

uint64_t sub_25B9EC820()
{
  return MEMORY[0x270F7F290]();
}

uint64_t sub_25B9EC830()
{
  return MEMORY[0x270F7F298]();
}

uint64_t sub_25B9EC840()
{
  return MEMORY[0x270F7F2A0]();
}

uint64_t sub_25B9EC850()
{
  return MEMORY[0x270F7F2A8]();
}

uint64_t sub_25B9EC860()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_25B9EC870()
{
  return MEMORY[0x270F2F880]();
}

uint64_t sub_25B9EC880()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_25B9EC890()
{
  return MEMORY[0x270F2F8E0]();
}

uint64_t sub_25B9EC8A0()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_25B9EC8B0()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_25B9EC8C0()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_25B9EC8D0()
{
  return MEMORY[0x270F2F9A0]();
}

uint64_t sub_25B9EC8E0()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_25B9EC8F0()
{
  return MEMORY[0x270F2FCF8]();
}

uint64_t sub_25B9EC910()
{
  return MEMORY[0x270F2FD10]();
}

uint64_t sub_25B9EC930()
{
  return MEMORY[0x270F2FD28]();
}

uint64_t sub_25B9EC940()
{
  return MEMORY[0x270F2FD40]();
}

uint64_t sub_25B9EC950()
{
  return MEMORY[0x270F2FD98]();
}

uint64_t sub_25B9EC970()
{
  return MEMORY[0x270F2FDB0]();
}

uint64_t sub_25B9EC990()
{
  return MEMORY[0x270F2FDC8]();
}

uint64_t sub_25B9EC9A0()
{
  return MEMORY[0x270F2FDD8]();
}

uint64_t sub_25B9EC9B0()
{
  return MEMORY[0x270F57638]();
}

uint64_t sub_25B9EC9C0()
{
  return MEMORY[0x270F57700]();
}

uint64_t sub_25B9EC9D0()
{
  return MEMORY[0x270F57708]();
}

uint64_t sub_25B9EC9F0()
{
  return MEMORY[0x270F57718]();
}

uint64_t sub_25B9ECA00()
{
  return MEMORY[0x270F57788]();
}

uint64_t sub_25B9ECA20()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25B9ECA30()
{
  return MEMORY[0x270F2FE40]();
}

uint64_t sub_25B9ECA40()
{
  return MEMORY[0x270F2FE48]();
}

uint64_t sub_25B9ECA50()
{
  return MEMORY[0x270F2FE50]();
}

uint64_t sub_25B9ECA60()
{
  return MEMORY[0x270F2FED8]();
}

uint64_t sub_25B9ECA70()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t sub_25B9ECA80()
{
  return MEMORY[0x270F2FF08]();
}

uint64_t sub_25B9ECA90()
{
  return MEMORY[0x270F2FF10]();
}

uint64_t sub_25B9ECAA0()
{
  return MEMORY[0x270F2FF18]();
}

uint64_t sub_25B9ECAB0()
{
  return MEMORY[0x270F2FF20]();
}

uint64_t sub_25B9ECAC0()
{
  return MEMORY[0x270F2FF28]();
}

uint64_t sub_25B9ECAD0()
{
  return MEMORY[0x270F2FF30]();
}

uint64_t sub_25B9ECAE0()
{
  return MEMORY[0x270F2FF60]();
}

uint64_t sub_25B9ECAF0()
{
  return MEMORY[0x270F2FF68]();
}

uint64_t sub_25B9ECB00()
{
  return MEMORY[0x270F2FFA0]();
}

uint64_t sub_25B9ECB10()
{
  return MEMORY[0x270F2FFE8]();
}

uint64_t sub_25B9ECB20()
{
  return MEMORY[0x270F2EFD0]();
}

uint64_t sub_25B9ECB30()
{
  return MEMORY[0x270F2EFD8]();
}

uint64_t sub_25B9ECB40()
{
  return MEMORY[0x270F2EFE0]();
}

uint64_t sub_25B9ECB50()
{
  return MEMORY[0x270F2F110]();
}

uint64_t sub_25B9ECB60()
{
  return MEMORY[0x270F2F118]();
}

uint64_t sub_25B9ECB70()
{
  return MEMORY[0x270F2F120]();
}

uint64_t sub_25B9ECB80()
{
  return MEMORY[0x270F2F128]();
}

uint64_t sub_25B9ECB90()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_25B9ECBA0()
{
  return MEMORY[0x270F2F180]();
}

uint64_t sub_25B9ECBB0()
{
  return MEMORY[0x270F2F1A8]();
}

uint64_t sub_25B9ECBC0()
{
  return MEMORY[0x270F2F1B0]();
}

uint64_t sub_25B9ECBD0()
{
  return MEMORY[0x270F2F270]();
}

uint64_t sub_25B9ECBE0()
{
  return MEMORY[0x270F2F3A0]();
}

uint64_t sub_25B9ECBF0()
{
  return MEMORY[0x270F2F3A8]();
}

uint64_t sub_25B9ECC00()
{
  return MEMORY[0x270F2F3B8]();
}

uint64_t sub_25B9ECC10()
{
  return MEMORY[0x270F2F3C0]();
}

uint64_t sub_25B9ECC20()
{
  return MEMORY[0x270F2F3C8]();
}

uint64_t sub_25B9ECC30()
{
  return MEMORY[0x270F2F3D0]();
}

uint64_t sub_25B9ECC40()
{
  return MEMORY[0x270F2F3E0]();
}

uint64_t sub_25B9ECC50()
{
  return MEMORY[0x270F2F420]();
}

uint64_t sub_25B9ECC60()
{
  return MEMORY[0x270F2F428]();
}

uint64_t sub_25B9ECC70()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_25B9ECC80()
{
  return MEMORY[0x270F2F468]();
}

uint64_t sub_25B9ECCA0()
{
  return MEMORY[0x270F2F488]();
}

uint64_t sub_25B9ECCB0()
{
  return MEMORY[0x270F2F490]();
}

uint64_t sub_25B9ECCC0()
{
  return MEMORY[0x270F2F498]();
}

uint64_t sub_25B9ECCD0()
{
  return MEMORY[0x270F2F4A0]();
}

uint64_t sub_25B9ECCE0()
{
  return MEMORY[0x270F2F4A8]();
}

uint64_t sub_25B9ECCF0()
{
  return MEMORY[0x270F2F4C0]();
}

uint64_t sub_25B9ECD00()
{
  return MEMORY[0x270F2F4C8]();
}

uint64_t sub_25B9ECD10()
{
  return MEMORY[0x270F2F4D0]();
}

uint64_t sub_25B9ECD20()
{
  return MEMORY[0x270F2F4D8]();
}

uint64_t sub_25B9ECD30()
{
  return MEMORY[0x270F2F4E8]();
}

uint64_t sub_25B9ECD40()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B9ECD50()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B9ECD60()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_25B9ECD70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B9ECD80()
{
  return MEMORY[0x270F2F6A0]();
}

uint64_t sub_25B9ECD90()
{
  return MEMORY[0x270F2F6B0]();
}

uint64_t sub_25B9ECDA0()
{
  return MEMORY[0x270F58078]();
}

uint64_t sub_25B9ECDB0()
{
  return MEMORY[0x270F58080]();
}

uint64_t sub_25B9ECDC0()
{
  return MEMORY[0x270F58088]();
}

uint64_t sub_25B9ECDD0()
{
  return MEMORY[0x270F58090]();
}

uint64_t sub_25B9ECDE0()
{
  return MEMORY[0x270F58098]();
}

uint64_t sub_25B9ECDF0()
{
  return MEMORY[0x270F580A0]();
}

uint64_t sub_25B9ECE00()
{
  return MEMORY[0x270F580B0]();
}

uint64_t sub_25B9ECE10()
{
  return MEMORY[0x270F580B8]();
}

uint64_t sub_25B9ECE20()
{
  return MEMORY[0x270F580C8]();
}

uint64_t sub_25B9ECE30()
{
  return MEMORY[0x270F580E8]();
}

uint64_t sub_25B9ECE40()
{
  return MEMORY[0x270F580F8]();
}

uint64_t sub_25B9ECE50()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_25B9ECE60()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_25B9ECE70()
{
  return MEMORY[0x270F58170]();
}

uint64_t sub_25B9ECE80()
{
  return MEMORY[0x270F58188]();
}

uint64_t sub_25B9ECE90()
{
  return MEMORY[0x270F58190]();
}

uint64_t sub_25B9ECEA0()
{
  return MEMORY[0x270F581A0]();
}

uint64_t sub_25B9ECEB0()
{
  return MEMORY[0x270F581C8]();
}

uint64_t sub_25B9ECEC0()
{
  return MEMORY[0x270F58248]();
}

uint64_t sub_25B9ECED0()
{
  return MEMORY[0x270F58250]();
}

uint64_t sub_25B9ECEE0()
{
  return MEMORY[0x270F58280]();
}

uint64_t sub_25B9ECEF0()
{
  return MEMORY[0x270F58290]();
}

uint64_t sub_25B9ECF00()
{
  return MEMORY[0x270F582A8]();
}

uint64_t sub_25B9ECF20()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_25B9ECF30()
{
  return MEMORY[0x270F58338]();
}

uint64_t sub_25B9ECF40()
{
  return MEMORY[0x270F58340]();
}

uint64_t sub_25B9ECF50()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_25B9ECF60()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25B9ECF70()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25B9ECF80()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25B9ECF90()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25B9ECFA0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25B9ECFB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25B9ECFC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B9ECFD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B9ECFE0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B9ECFF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B9ED000()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B9ED010()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B9ED020()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25B9ED030()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25B9ED040()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25B9ED050()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25B9ED060()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B9ED070()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B9ED080()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B9ED090()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B9ED0A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B9ED0B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B9ED0C0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25B9ED0D0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25B9ED0E0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25B9ED0F0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25B9ED100()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_25B9ED120()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25B9ED130()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25B9ED140()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25B9ED150()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25B9ED160()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_25B9ED170()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_25B9ED180()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_25B9ED190()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_25B9ED1A0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_25B9ED1C0()
{
  return MEMORY[0x270FA2110]();
}

uint64_t sub_25B9ED1D0()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_25B9ED1E0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25B9ED1F0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25B9ED200()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25B9ED210()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25B9ED220()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B9ED230()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B9ED240()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B9ED250()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B9ED260()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_25B9ED270()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_25B9ED280()
{
  return MEMORY[0x270EF2050]();
}

uint64_t sub_25B9ED290()
{
  return MEMORY[0x270EF2068]();
}

uint64_t sub_25B9ED2A0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_25B9ED2B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B9ED2C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B9ED2D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B9ED2E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B9ED300()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25B9ED310()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_25B9ED320()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25B9ED330()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25B9ED340()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25B9ED350()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25B9ED360()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25B9ED370()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25B9ED380()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25B9ED390()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B9ED3A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B9ED3B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B9ED3C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25B9ED3D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25B9ED3E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B9ED3F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25B9ED400()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25B9ED410()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25B9ED420()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25B9ED430()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25B9ED440()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B9ED450()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25B9ED460()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25B9ED470()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25B9ED480()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B9ED490()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25B9ED4A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B9ED4B0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25B9ED4C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B9ED4D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B9ED4E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25B9ED4F0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25B9ED500()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25B9ED510()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25B9ED520()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25B9ED530()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25B9ED540()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25B9ED550()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25B9ED560()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25B9ED570()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25B9ED580()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25B9ED590()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25B9ED5A0()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_25B9ED5B0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25B9ED5C0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25B9ED5D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25B9ED5E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25B9ED5F0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25B9ED600()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25B9ED610()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25B9ED620()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25B9ED630()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25B9ED640()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25B9ED650()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25B9ED660()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B9ED670()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_25B9ED680()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25B9ED690()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B9ED6A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B9ED6D0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25B9ED6E0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25B9ED6F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B9ED700()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B9ED710()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B9ED720()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B9ED730()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25B9ED740()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B9ED750()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B9ED760()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25B9ED770()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25B9ED780()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25B9ED790()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B9ED7A0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25B9ED7B0()
{
  return MEMORY[0x270F9FD98]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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