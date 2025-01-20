id sub_222D6DA18(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  v3 = a3;
  v4 = objc_opt_new();
  [v4 setContactType:0];
  v5 = [v3 givenName];
  [v4 setGivenName:v5];

  v6 = [v3 familyName];
  [v4 setFamilyName:v6];

  v7 = [v3 photo];

  if (v7)
  {
    v8 = UIImagePNGRepresentation(v7);
    [v4 setImageData:v8];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

uint64_t sub_222D6DB00(void *a1)
{
  v2 = [a1 _photo];
  if (!v2)
  {
    v3 = [a1 photoURL];

    if (!v3) {
      goto LABEL_6;
    }
    v4 = (void *)MEMORY[0x263EFF8F8];
    v5 = [a1 photoURL];
    v2 = [v4 dataWithContentsOfURL:v5];

    if (v2)
    {
      v6 = [MEMORY[0x263F1C6B0] imageWithData:v2];
      objc_msgSend(a1, "set_photo:", v6);
    }
  }

LABEL_6:
  return [a1 _photo];
}

uint64_t sub_222D6DBC4()
{
  return 1;
}

void sub_222D6DBCC()
{
  v0 = (UIImage *)_os_crash();
  __break(1u);
  UIImagePNGRepresentation(v0);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}