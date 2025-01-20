@interface KeyboardObserver
- (void)keyboardDidHideWithNotification:(id)a3;
- (void)keyboardWillChangeFrameWithNotification:(id)a3;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)keyboardWillShowWithNotification:(id)a3;
@end

@implementation KeyboardObserver

- (void)keyboardWillShowWithNotification:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB430);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1A03AE798();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = &v12[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A03AE778();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[15] = 1;
  swift_retain_n();
  sub_1A03B10B8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_19F900930((uint64_t)v6);
  sub_19F48B93C((uint64_t)v6, &qword_1E94AB430);
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB430);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A03AE798();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AE778();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  sub_1A03ADE18();
  sub_19F900930((uint64_t)v6);
  sub_19F48B93C((uint64_t)v6, &qword_1E94AB430);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)keyboardDidHideWithNotification:(id)a3
{
  uint64_t v3 = sub_1A03AE798();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A03AE778();
  swift_getKeyPath();
  swift_getKeyPath();
  v8[15] = 0;
  sub_1A03ADE18();
  sub_1A03B10B8();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB430);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A03AE798();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AE778();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_1A03ADE18();
  sub_19F900930((uint64_t)v6);
  sub_19F48B93C((uint64_t)v6, &qword_1E94AB430);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end