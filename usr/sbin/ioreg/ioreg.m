void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  char *v8;
  CFStringRef v9;
  int v10;
  char *v11;
  int v12;
  char *v13;
  io_registry_entry_t RootEntry;
  io_object_t v15;
  __CFArray *v16;
  __CFArray *v17;
  CFURLRef v18;
  CFURLRef v19;
  __CFWriteStream *v20;
  __CFWriteStream *v21;
  FILE *v22;
  const char *v23;
  char *v24;
  char *v25;
  long long error;
  CFStringRef v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  char *v32;
  int v33;
  int v34;
  uint64_t v35;
  long long v36;
  CFStringRef v37;
  int v38;
  int v39;
  char *v40;
  char *v41;
  char *v42;
  int v43;
  int v44;

  v35 = 0;
  v4 = fileno(__stdoutp);
  if (!isatty(v4) || (v5 = fileno(__stdoutp), ioctl(v5, 0x40087468uLL, &v35))) {
    v6 = 0;
  }
  else {
    v6 = WORD1(v35);
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v24 = 0;
  v25 = "IOService";
  while (2)
  {
    v12 = getopt(a1, a2, ":abc:d:fik:ln:p:rsStw:xy");
    switch(v12)
    {
      case 'S':
      case 's':
        continue;
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'm':
      case 'o':
      case 'q':
      case 'u':
      case 'v':
        goto LABEL_37;
      case 'a':
        v7 |= 1u;
        continue;
      case 'b':
        v7 |= 2u;
        continue;
      case 'c':
        v8 = optarg;
        v9 = CFStringCreateWithCString(kCFAllocatorDefault, optarg, 0x8000100u);
        continue;
      case 'd':
        v10 = atoi(optarg);
        continue;
      case 'f':
        v7 |= 4u;
        continue;
      case 'i':
        v7 |= 0x10u;
        continue;
      case 'k':
        v11 = optarg;
        continue;
      case 'l':
        v7 |= 0x20u;
        continue;
      case 'n':
        v24 = optarg;
        continue;
      case 'p':
        v25 = optarg;
        continue;
      case 'r':
        v7 |= 0x40u;
        continue;
      case 't':
        v7 |= 0x80u;
        continue;
      case 'w':
        v6 = atoi(optarg);
        continue;
      case 'x':
        v7 |= 8u;
        continue;
      case 'y':
        v7 |= 0x100u;
        continue;
      default:
        if (v12 != -1)
        {
LABEL_37:
          fwrite("usage: ioreg [-abfilrtxy] [-c class] [-d depth] [-k key] [-n name] [-p plane] [-w width]\nwhere options are:\n\t-a archive output\n\t-b show object name in bold\n\t-c list properties of objects with the given class\n\t-d limit tree to the given depth\n\t-f enable smart formatting\n\t-i show object inheritance\n\t-k list properties of objects with the given key\n\t-l list properties of all objects\n\t-n list properties of objects with the given name\n\t-p traverse registry over the given plane (IOService is default)\n\t-r show subtrees rooted by the given criteria\n\t-t show location of each subtree\n\t-w clip output to the given line width (0 is unlimited)\n\t-x show data and numbers as hexadecimal\n\t-y do not consider DriverKit classes with -c\n", 0x2D5uLL, 1uLL,
            __stderrp);
          goto LABEL_38;
        }
        byte_10000C028 = (v7 & 8) != 0;
        if (v6
          && (qword_10000C010 = (uint64_t)malloc_type_malloc(v6, 0x172F7D99uLL),
              dword_10000C018 = v6,
              dword_10000C008 = v6,
              !qword_10000C010))
        {
          v22 = __stderrp;
          v23 = "can't allocate buffer";
        }
        else
        {
          if ((v7 & 2) == 0) {
            goto LABEL_33;
          }
          *(void *)&v36 = &unk_10000C029;
          v13 = getenv("TERM");
          if (!v13
            || tgetent(0, v13) < 1
            || (qword_10000C000 = (uint64_t)tgetstr("md", (char **)&v36),
                qword_10000C020 = (uint64_t)tgetstr("me", (char **)&v36),
                (void)v36 - (void)&unk_10000C029 < 0x41uLL))
          {
            if (!qword_10000C000) {
              qword_10000C000 = (uint64_t)&unk_10000783F;
            }
            if (!qword_10000C020) {
              qword_10000C020 = (uint64_t)&unk_10000783F;
            }
LABEL_33:
            RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
            if (RootEntry)
            {
              v15 = RootEntry;
              if ((v7 & 1) == 0)
              {
                if ((v7 & 0x40) != 0)
                {
                  LOWORD(error) = v7;
                  *(_DWORD *)((char *)&error + 2) = 0;
                  WORD3(error) = 0;
                  *((void *)&error + 1) = v8;
                  v27 = v9;
                  v28 = v10;
                  v29 = 0;
                  v30 = v11;
                  v31 = v24;
                  v32 = v25;
                  v33 = v6;
                  v34 = 0;
                  sub_100003C70(RootEntry, 0, 0, (uint64_t)&v36, &error);
                }
                else
                {
                  LOWORD(v36) = v7;
                  *(_DWORD *)((char *)&v36 + 2) = 0;
                  WORD3(v36) = 0;
                  *((void *)&v36 + 1) = v8;
                  v37 = v9;
                  v38 = v10;
                  v39 = 0;
                  v40 = v11;
                  v41 = v24;
                  v42 = v25;
                  v43 = v6;
                  v44 = 0;
                  sub_100003E48(RootEntry, 0, 0, 0, (const char **)&v36);
                }
                goto LABEL_49;
              }
              if ((v7 & 0x40) != 0)
              {
                LOWORD(error) = v7;
                *(_DWORD *)((char *)&error + 2) = 0;
                WORD3(error) = 0;
                *((void *)&error + 1) = v8;
                v27 = v9;
                v28 = v10;
                v29 = 0;
                v30 = v11;
                v31 = v24;
                v32 = v25;
                v33 = v6;
                v34 = 0;
                v16 = sub_10000383C(RootEntry, 0, 0, (uint64_t)&v36, (uint64_t)&error);
              }
              else
              {
                LOWORD(v36) = v7;
                *(_DWORD *)((char *)&v36 + 2) = 0;
                WORD3(v36) = 0;
                *((void *)&v36 + 1) = v8;
                v37 = v9;
                v38 = v10;
                v39 = 0;
                v40 = v11;
                v41 = v24;
                v42 = v25;
                v43 = v6;
                v44 = 0;
                v16 = sub_100003ADC(RootEntry, 0, &v36);
              }
              v17 = v16;
              if (!v16)
              {
LABEL_49:
                IOObjectRelease(v15);
                exit(0);
              }
              *(void *)&error = 0;
              v18 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/dev/stdout", kCFURLPOSIXPathStyle, 0);
              if (v18)
              {
                v19 = v18;
                v20 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v18);
                if (v20)
                {
                  v21 = v20;
                  if (CFWriteStreamOpen(v20))
                  {
                    CFPropertyListWrite(v17, v21, kCFPropertyListXMLFormat_v1_0, 0, (CFErrorRef *)&error);
                    if (!(void)error)
                    {
                      CFWriteStreamClose(v21);
                      CFRelease(v21);
                      CFRelease(v19);
                      CFRelease(v17);
                      goto LABEL_49;
                    }
                    v22 = __stderrp;
                    v23 = "CFPropertyListWrite(): error";
                  }
                  else
                  {
                    v22 = __stderrp;
                    v23 = "can't open file";
                  }
                }
                else
                {
                  v22 = __stderrp;
                  v23 = "can't create file";
                }
              }
              else
              {
                v22 = __stderrp;
                v23 = "can't create path";
              }
            }
            else
            {
              v22 = __stderrp;
              v23 = "can't obtain I/O Kit's root service";
            }
            goto LABEL_57;
          }
          v22 = __stderrp;
          v23 = "can't obtain terminfo";
        }
LABEL_57:
        fprintf(v22, "ioreg: error: %s.\n", v23);
LABEL_38:
        exit(1);
    }
  }
}

__CFArray *sub_10000383C(io_registry_entry_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a2;
  io_registry_entry_t v9 = a1;
  io_iterator_t iterator = 0;
  uint64_t v10 = a3 + 1;
  if (v10 <= a2
    || (long long v11 = *(_OWORD *)(a5 + 16),
        long long v42 = *(_OWORD *)a5,
        long long v43 = v11,
        long long v12 = *(_OWORD *)(a5 + 48),
        long long v44 = *(_OWORD *)(a5 + 32),
        long long v45 = v12,
        !sub_1000045B4(a1, (uint64_t)&v42)))
  {
    v18 = 0;
    goto LABEL_21;
  }
  int v13 = *(_DWORD *)(a5 + 24);
  unsigned int v14 = v13 + a3;
  if (v13) {
    uint64_t v8 = v14;
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  io_registry_entry_t v41 = v9;
  if ((*(_WORD *)a5 & 0x80) != 0)
  {
    if (v13) {
      *(_DWORD *)(a5 + 24) = v14;
    }
    long long v19 = *(_OWORD *)(a5 + 16);
    long long v42 = *(_OWORD *)a5;
    long long v43 = v19;
    long long v20 = *(_OWORD *)(a5 + 48);
    long long v44 = *(_OWORD *)(a5 + 32);
    long long v45 = v20;
    v21 = sub_100003ADC(v9, a3, &v42);
    v22 = v21;
    int v23 = *(_DWORD *)(a5 + 24);
    if (v23) {
      *(_DWORD *)(a5 + 24) = v23 - a3;
    }
    if (a3)
    {
      unsigned int v24 = a3 - 1;
      while (1)
      {
        io_registry_entry_t v25 = *(_DWORD *)(a4 + 4 * v24);
        long long v26 = *(_OWORD *)(a5 + 16);
        long long v42 = *(_OWORD *)a5;
        long long v43 = v26;
        long long v27 = *(_OWORD *)(a5 + 48);
        long long v44 = *(_OWORD *)(a5 + 32);
        long long v45 = v27;
        v28 = sub_100003F94(v25, (uint64_t)&v42);
        if (!v28) {
          break;
        }
        v17 = v28;
        uint64_t v29 = v24;
        CFDictionarySetValue(v28, @"IORegistryEntryChildren", v22);
        CFRelease(v22);
        --v24;
        v22 = v17;
        if (!v29) {
          goto LABEL_19;
        }
      }
      v39 = __stderrp;
      v40 = "can't obtain parent";
LABEL_32:
      fprintf(v39, "ioreg: error: %s.\n", v40);
      exit(1);
    }
    v17 = v21;
  }
  else
  {
    long long v15 = *(_OWORD *)(a5 + 16);
    long long v42 = *(_OWORD *)a5;
    long long v43 = v15;
    long long v16 = *(_OWORD *)(a5 + 48);
    long long v44 = *(_OWORD *)(a5 + 32);
    long long v45 = v16;
    v17 = sub_100003ADC(v9, 0, &v42);
  }
LABEL_19:
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    v39 = __stderrp;
    v40 = "can't create array";
    goto LABEL_32;
  }
  v18 = Mutable;
  CFArrayAppendValue(Mutable, v17);
  CFRelease(v17);
  io_registry_entry_t v9 = v41;
LABEL_21:
  *(_DWORD *)(a4 + 4 * a3) = v9;
  if (!IORegistryEntryGetChildIterator(v9, *(const char **)(a5 + 48), &iterator))
  {
    uint64_t v31 = IOIteratorNext(iterator);
    if (v31)
    {
      uint64_t v32 = v31;
      do
      {
        uint64_t v33 = IOIteratorNext(iterator);
        long long v34 = *(_OWORD *)(a5 + 16);
        long long v42 = *(_OWORD *)a5;
        long long v43 = v34;
        long long v35 = *(_OWORD *)(a5 + 48);
        long long v44 = *(_OWORD *)(a5 + 32);
        long long v45 = v35;
        CFArrayRef v36 = (const __CFArray *)sub_10000383C(v32, v8, v10, a4, &v42);
        if (v36)
        {
          CFArrayRef v37 = v36;
          if (v18)
          {
            v47.length = CFArrayGetCount(v36);
            v47.location = 0;
            CFArrayAppendArray(v18, v37, v47);
            CFRelease(v37);
          }
          else
          {
            v18 = v36;
          }
        }
        IOObjectRelease(v32);
        uint64_t v32 = v33;
      }
      while (v33);
    }
    IOObjectRelease(iterator);
  }
  return v18;
}

__CFDictionary *sub_100003ADC(io_registry_entry_t a1, int a2, long long *a3)
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a1, *((const char **)a3 + 6), &iterator)) {
    return 0;
  }
  uint64_t v7 = IOIteratorNext(iterator);
  long long v8 = a3[1];
  long long v22 = *a3;
  long long v23 = v8;
  long long v9 = a3[3];
  long long v24 = a3[2];
  long long v25 = v9;
  v6 = sub_100003F94(a1, (uint64_t)&v22);
  unsigned int v10 = *((_DWORD *)a3 + 6);
  if ((!v10 || v10 > a2 + 1) && v7)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      long long v12 = Mutable;
      uint64_t v13 = (a2 + 1);
      while (1)
      {
        uint64_t v14 = IOIteratorNext(iterator);
        long long v15 = a3[1];
        long long v22 = *a3;
        long long v23 = v15;
        long long v16 = a3[3];
        long long v24 = a3[2];
        long long v25 = v16;
        v17 = (const void *)sub_100003ADC(v7, v13, &v22);
        if (!v17) {
          break;
        }
        v18 = v17;
        CFArrayAppendValue(v12, v17);
        CFRelease(v18);
        IOObjectRelease(v7);
        uint64_t v7 = v14;
        if (!v14)
        {
          CFDictionarySetValue(v6, @"IORegistryEntryChildren", v12);
          CFRelease(v12);
          goto LABEL_11;
        }
      }
      long long v20 = __stderrp;
      v21 = "can't obtain child";
    }
    else
    {
      long long v20 = __stderrp;
      v21 = "can't create array";
    }
    fprintf(v20, "ioreg: error: %s.\n", v21);
    exit(1);
  }
LABEL_11:
  IOObjectRelease(iterator);
  return v6;
}

uint64_t sub_100003C70(io_registry_entry_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v8 = a2;
  io_iterator_t iterator = 0;
  uint64_t v10 = (a3 + 1);
  if (v10 > a2)
  {
    long long v11 = a5[1];
    long long v36 = *a5;
    long long v37 = v11;
    long long v12 = a5[3];
    long long v38 = a5[2];
    long long v39 = v12;
    if (sub_1000045B4(a1, (uint64_t)&v36))
    {
      int v13 = *((_DWORD *)a5 + 6);
      if (v13) {
        uint64_t v8 = (v13 + a3);
      }
      else {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      if ((*(_WORD *)a5 & 0x80) != 0)
      {
        if (a3)
        {
          uint64_t v23 = 0;
          do
          {
            io_registry_entry_t v24 = *(_DWORD *)(a4 + 4 * v23);
            long long v25 = a5[1];
            long long v36 = *a5;
            long long v37 = v25;
            long long v26 = a5[3];
            long long v38 = a5[2];
            long long v39 = v26;
            sub_100004B30(v24, v23, 2 << v23, (const char **)&v36);
            ++v23;
          }
          while (a3 != v23);
          int v13 = *((_DWORD *)a5 + 6);
        }
        if (v13) {
          *((_DWORD *)a5 + 6) = v13 + a3;
        }
        long long v27 = a5[1];
        long long v36 = *a5;
        long long v37 = v27;
        long long v28 = a5[3];
        long long v38 = a5[2];
        long long v39 = v28;
        sub_100003E48(a1, 0, a3, 0, (const char **)&v36);
        int v29 = *((_DWORD *)a5 + 6);
        if (v29) {
          *((_DWORD *)a5 + 6) = v29 - a3;
        }
      }
      else
      {
        long long v14 = a5[1];
        long long v36 = *a5;
        long long v37 = v14;
        long long v15 = a5[3];
        long long v38 = a5[2];
        long long v39 = v15;
        sub_100003E48(a1, 0, 0, 0, (const char **)&v36);
      }
      sub_100005258((char *)&unk_10000783F, v16, v17, v18, v19, v20, v21, v22, v36);
    }
  }
  *(_DWORD *)(a4 + 4 * a3) = a1;
  uint64_t result = IORegistryEntryGetChildIterator(a1, *((const char **)a5 + 6), &iterator);
  if (!result)
  {
    uint64_t v31 = IOIteratorNext(iterator);
    if (v31)
    {
      uint64_t v32 = v31;
      do
      {
        uint64_t v33 = IOIteratorNext(iterator);
        long long v34 = a5[1];
        long long v36 = *a5;
        long long v37 = v34;
        long long v35 = a5[3];
        long long v38 = a5[2];
        long long v39 = v35;
        sub_100003C70(v32, v8, v10, a4, &v36);
        IOObjectRelease(v32);
        uint64_t v32 = v33;
      }
      while (v33);
    }
    return IOObjectRelease(iterator);
  }
  return result;
}

uint64_t sub_100003E48(io_registry_entry_t a1, int a2, uint64_t a3, unint64_t a4, const char **a5)
{
  io_iterator_t iterator = 0;
  uint64_t result = IORegistryEntryGetChildIterator(a1, a5[6], &iterator);
  if (!result)
  {
    uint64_t v11 = IOIteratorNext(iterator);
    uint64_t v12 = v11;
    uint64_t v13 = (1 << a3) | a4;
    if (!a2) {
      uint64_t v13 = ~(1 << a3) & a4;
    }
    uint64_t v14 = (a3 + 1);
    unsigned int v15 = *((_DWORD *)a5 + 6) - 1;
    uint64_t v16 = v13 | (2 << a3);
    if (!v11) {
      uint64_t v16 = v13 & ~(2 << a3);
    }
    long long v17 = *((_OWORD *)a5 + 1);
    long long v23 = *(_OWORD *)a5;
    long long v24 = v17;
    long long v18 = *((_OWORD *)a5 + 3);
    if (v15 >= v14) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = v13;
    }
    long long v25 = *((_OWORD *)a5 + 2);
    long long v26 = v18;
    sub_100004B30(a1, a3, v19, (const char **)&v23);
    if (*((_DWORD *)a5 + 6) - 1 >= v14 && v12)
    {
      do
      {
        uint64_t v20 = IOIteratorNext(iterator);
        long long v21 = *((_OWORD *)a5 + 1);
        long long v23 = *(_OWORD *)a5;
        long long v24 = v21;
        long long v22 = *((_OWORD *)a5 + 3);
        long long v25 = *((_OWORD *)a5 + 2);
        long long v26 = v22;
        sub_100003E48(v12, v20 != 0, v14, v19, &v23);
        IOObjectRelease(v12);
        uint64_t v12 = v20;
      }
      while (v20);
    }
    return IOObjectRelease(iterator);
  }
  return result;
}

CFMutableDictionaryRef sub_100003F94(io_registry_entry_t entry, uint64_t a2)
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  *(_OWORD *)cStr = 0u;
  long long v38 = 0u;
  uint32_t valuePtr = 0;
  uint64_t entryID = 0;
  CFMutableDictionaryRef properties = 0;
  memset(location, 0, sizeof(location));
  memset(name, 0, sizeof(name));
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  if ((*(_WORD *)a2 & 0x20) != 0
    || (long long v4 = *(_OWORD *)(a2 + 16),
        v29[0] = *(_OWORD *)a2,
        v29[1] = v4,
        long long v5 = *(_OWORD *)(a2 + 48),
        v29[2] = *(_OWORD *)(a2 + 32),
        v29[3] = v5,
        sub_1000045B4(entry, (uint64_t)v29)))
  {
    if (IORegistryEntryCreateCFProperties(entry, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      CFMutableDictionaryRef v6 = 0;
      CFMutableDictionaryRef properties = 0;
    }
    else
    {
      CFMutableDictionaryRef v6 = properties;
    }
    sub_100004848(v6);
  }
  if (!properties)
  {
    CFMutableDictionaryRef properties = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!properties)
    {
      long long v27 = __stderrp;
      long long v28 = "can't create dictionary";
      goto LABEL_47;
    }
  }
  if (IORegistryEntryGetNameInPlane(entry, *(const char **)(a2 + 48), name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (!v7)
  {
    long long v27 = __stderrp;
    long long v28 = "can't create name";
    goto LABEL_47;
  }
  CFStringRef v8 = v7;
  CFDictionarySetValue(properties, @"IORegistryEntryName", v7);
  CFRelease(v8);
  if (!IORegistryEntryGetLocationInPlane(entry, *(const char **)(a2 + 48), location))
  {
    CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, location, 0x8000100u);
    if (!v9)
    {
      long long v27 = __stderrp;
      long long v28 = "can't create location";
      goto LABEL_47;
    }
    CFStringRef v10 = v9;
    CFDictionarySetValue(properties, @"IORegistryEntryLocation", v9);
    CFRelease(v10);
  }
  if (IORegistryEntryGetRegistryEntryID(entry, &entryID))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain identifier");
    uint64_t entryID = -1;
  }
  CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &entryID);
  if (!v11)
  {
    long long v27 = __stderrp;
    long long v28 = "can't create identifier";
    goto LABEL_47;
  }
  CFNumberRef v12 = v11;
  CFDictionarySetValue(properties, @"IORegistryEntryID", v11);
  CFRelease(v12);
  if (_IOObjectGetClass(entry, (char *)1))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
    strcpy(cStr, "<class error>");
  }
  CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v13)
  {
    long long v27 = __stderrp;
    long long v28 = "can't create class";
    goto LABEL_47;
  }
  CFStringRef v14 = v13;
  CFDictionarySetValue(properties, @"IOObjectClass", v13);
  if ((*(_WORD *)a2 & 0x10) != 0)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      long long v27 = __stderrp;
      long long v28 = "can't create array";
      goto LABEL_47;
    }
    uint64_t v16 = Mutable;
    while (1)
    {
      CFStringRef v17 = v14;
      CFArrayInsertValueAtIndex(v16, 0, v14);
      CFStringRef v14 = IOObjectCopySuperclassForClass(v14);
      CFRelease(v17);
      if (!v14) {
        break;
      }
      if (CFEqual(v14, @"OSObject"))
      {
        CFDictionarySetValue(properties, @"IOObjectInheritance", v16);
        CFRelease(v16);
        goto LABEL_27;
      }
    }
    CFDictionarySetValue(properties, @"IOObjectInheritance", v16);
    CFStringRef v14 = (CFStringRef)v16;
  }
LABEL_27:
  CFRelease(v14);
  uint32_t valuePtr = IOObjectGetKernelRetainCount(entry);
  CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v18)
  {
    long long v27 = __stderrp;
    long long v28 = "can't create retain count";
    goto LABEL_47;
  }
  CFNumberRef v19 = v18;
  CFDictionarySetValue(properties, @"IOObjectRetainCount", v18);
  CFRelease(v19);
  if (_IOObjectConformsTo(entry, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime())
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      uint32_t valuePtr = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v31);
    if (v20)
    {
      CFNumberRef v21 = v20;
      CFDictionarySetValue(properties, @"IOServiceState", v20);
      CFRelease(v21);
      CFNumberRef v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v22)
      {
        CFNumberRef v23 = v22;
        CFDictionarySetValue(properties, @"IOServiceBusyState", v22);
        CFRelease(v23);
        CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v30);
        if (v24)
        {
          CFNumberRef v25 = v24;
          CFDictionarySetValue(properties, @"IOServiceBusyTime", v24);
          CFRelease(v25);
          return properties;
        }
        long long v27 = __stderrp;
        long long v28 = "can't create busy time";
      }
      else
      {
        long long v27 = __stderrp;
        long long v28 = "can't create busy state";
      }
    }
    else
    {
      long long v27 = __stderrp;
      long long v28 = "can't create state";
    }
LABEL_47:
    fprintf(v27, "ioreg: error: %s.\n", v28);
    exit(1);
  }
  return properties;
}

BOOL sub_1000045B4(io_registry_entry_t entry, uint64_t a2)
{
  if (*(void *)(a2 + 8))
  {
    if (*(void *)(a2 + 16))
    {
      if ((*(_WORD *)a2 & 0x100) == 0)
      {
        CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(entry, @"IOUserClasses", kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          CFArrayRef v5 = CFProperty;
          CFTypeID TypeID = CFArrayGetTypeID();
          if (TypeID == CFGetTypeID(v5))
          {
            v15.length = CFArrayGetCount(v5);
            v15.io_name_t location = 0;
            int v7 = CFArrayContainsValue(v5, v15, *(const void **)(a2 + 16));
            CFRelease(v5);
            if (v7)
            {
              uint64_t v8 = 1;
              goto LABEL_11;
            }
            return 0;
          }
          CFRelease(v5);
        }
      }
    }
    uint64_t v8 = 1;
    if (!_IOObjectConformsTo(entry, *(const char **)(a2 + 8))) {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_11:
  CFStringRef v9 = *(const char **)(a2 + 32);
  if (v9)
  {
    CFStringRef v10 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
    if (!v10)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create key");
      exit(1);
    }
    CFStringRef v11 = v10;
    uint64_t v8 = (uint64_t)IORegistryEntryCreateCFProperty(entry, v10, kCFAllocatorDefault, 0);
    CFRelease(v11);
    if (!v8) {
      return v8;
    }
    CFRelease((CFTypeRef)v8);
    uint64_t v8 = 1;
  }
  if (*(void *)(a2 + 40))
  {
    memset(location, 0, 128);
    memset(name, 0, sizeof(name));
    if (IORegistryEntryGetNameInPlane(entry, *(const char **)(a2 + 48), name))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
      strcpy(name, "<name error>");
    }
    if (strchr(*(char **)(a2 + 40), 64))
    {
      __strlcat_chk();
      if (!IORegistryEntryGetLocationInPlane(entry, *(const char **)(a2 + 48), location)) {
        __strlcat_chk();
      }
    }
    return !strcmp(*(const char **)(a2 + 40), name);
  }
  return v8;
}

void sub_100004848(void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFSetGetTypeID())
    {
      CFNumberRef v22 = __stderrp;
      CFNumberRef v23 = "Root object cannot be a CFSet";
LABEL_22:
      fprintf(v22, "ioreg: error: %s.\n", v23);
      exit(1);
    }
    if (v2 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      long long v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      CFArrayRef v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, v4, v5);
      if (Count >= 1)
      {
        CFMutableDictionaryRef v6 = v5;
        int v7 = v4;
        do
        {
          CFTypeID v8 = CFGetTypeID(*v6);
          if (v8 == CFSetGetTypeID())
          {
            CFIndex v9 = CFSetGetCount((CFSetRef)*v6);
            CFStringRef v10 = (const void **)malloc_type_malloc(8 * v9, 0xC0040B8AA526DuLL);
            CFSetGetValues((CFSetRef)*v6, v10);
            CFArrayRef v11 = CFArrayCreate(kCFAllocatorDefault, v10, v9, &kCFTypeArrayCallBacks);
            if (!v11) {
              goto LABEL_21;
            }
            CFArrayRef v12 = v11;
            CFDictionaryReplaceValue((CFMutableDictionaryRef)a1, *v7, v11);
            CFTypeRef *v6 = v12;
            CFRelease(v12);
            free(v10);
          }
          CFTypeRef v13 = *v6++;
          sub_100004848(v13);
          ++v7;
          --Count;
        }
        while (Count);
      }
      free(v4);
      free(v5);
    }
    else if (v2 == CFArrayGetTypeID())
    {
      CFIndex v14 = CFArrayGetCount((CFArrayRef)a1);
      if (v14 >= 1)
      {
        CFIndex v15 = v14;
        for (CFIndex i = 0; v15 != i; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
          CFTypeID v18 = CFGetTypeID(ValueAtIndex);
          if (v18 == CFSetGetTypeID())
          {
            CFIndex v19 = CFSetGetCount((CFSetRef)ValueAtIndex);
            CFNumberRef v20 = (const void **)malloc_type_malloc(8 * v19, 0xC0040B8AA526DuLL);
            CFSetGetValues((CFSetRef)ValueAtIndex, v20);
            CFArrayRef v21 = CFArrayCreate(kCFAllocatorDefault, v20, v19, &kCFTypeArrayCallBacks);
            if (!v21)
            {
LABEL_21:
              CFNumberRef v22 = __stderrp;
              CFNumberRef v23 = "can't create array for set replacement";
              goto LABEL_22;
            }
            ValueAtIndex = v21;
            CFArraySetValueAtIndex((CFMutableArrayRef)a1, i, v21);
            CFRelease(ValueAtIndex);
            free(v20);
          }
          sub_100004848(ValueAtIndex);
        }
      }
    }
  }
}

void sub_100004B30(io_registry_entry_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  memset(v147, 0, sizeof(v147));
  context[0] = a1;
  context[1] = a2;
  uint64_t v140 = a3;
  long long v8 = *((_OWORD *)a4 + 1);
  long long v141 = *(_OWORD *)a4;
  long long v142 = v8;
  long long v9 = *((_OWORD *)a4 + 3);
  long long v143 = *((_OWORD *)a4 + 2);
  long long v144 = v9;
  KernelRetainCFIndex Count = 0;
  unint64_t v136 = 0;
  uint64_t v137 = 0;
  memset(location, 0, sizeof(location));
  memset(name, 0, sizeof(name));
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryGetNameInPlane(a1, a4[6], name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }
  sub_100005150(1, a2, a3, v10, v11, v12, v13, v14, v127);
  if ((*(_WORD *)a4 & 2) != 0) {
    tputs((const char *)qword_10000C000, 1, j__putchar);
  }
  sub_10000522C("%s", v15, v16, v17, v18, v19, v20, v21, (char)name);
  if ((*(_WORD *)a4 & 2) != 0) {
    tputs((const char *)qword_10000C020, 1, j__putchar);
  }
  if (!IORegistryEntryGetLocationInPlane(a1, a4[6], location)) {
    sub_10000522C("@%s", v22, v23, v24, v25, v26, v27, v28, (char)location);
  }
  sub_10000522C("  <class ", v22, v23, v24, v25, v26, v27, v28, v128);
  if ((*(_WORD *)a4 & 0x10) != 0)
  {
    CFStringRef v36 = _IOObjectCopyClass(a1);
    if (v36)
    {
      CFStringRef v37 = v36;
      CFMutableArrayRef Mutable = CFStringCreateMutable(0, 512);
      if (Mutable)
      {
        long long v39 = Mutable;
        CFStringInsert(Mutable, 0, v37);
        CFStringRef Copy = CFStringCreateCopy(0, v37);
        if (Copy)
        {
          CFStringRef v41 = Copy;
          CFStringRef v42 = IOObjectCopySuperclassForClass(Copy);
          CFRelease(v41);
          if (v42)
          {
            while (!CFEqual(v42, @"OSObject"))
            {
              CFStringInsert(v39, 0, @":");
              CFStringInsert(v39, 0, v42);
              CFStringRef v43 = IOObjectCopySuperclassForClass(v42);
              CFRelease(v42);
              CFStringRef v42 = v43;
              if (!v43) {
                goto LABEL_21;
              }
            }
            CFRelease(v42);
          }
        }
LABEL_21:
        CStringPtr = CFStringGetCStringPtr(v39, 0x8000100u);
        if (CStringPtr) {
          sub_10000522C("%s", v45, v46, v47, v48, v49, v50, v51, (char)CStringPtr);
        }
        CFRelease(v39);
      }
      CFRelease(v37);
    }
  }
  else
  {
    if (_IOObjectGetClass(a1, (char *)1))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
      strcpy((char *)v147, "<class error>");
    }
    sub_10000522C("%s", v29, v30, v31, v32, v33, v34, v35, (char)v147);
  }
  uint64_t entryID = 0;
  if (!IORegistryEntryGetRegistryEntryID(a1, &entryID)) {
    sub_10000522C(", id 0x%llx", v52, v53, v54, v55, v56, v57, v58, entryID);
  }
  if (_IOObjectConformsTo(a1, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime())
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      char v66 = 0;
      unint64_t v136 = 0;
      uint64_t v137 = 0;
      KernelRetainCFIndex Count = 0;
    }
    else
    {
      char v66 = v137;
    }
    v67 = (v66 & 2) != 0 ? &unk_10000783F : "!";
    sub_10000522C(", %sregistered, %smatched, %sactive", v59, v60, v61, v62, v63, v64, v65, (char)v67);
    sub_10000522C(", busy %ld", v68, v69, v70, v71, v72, v73, v74, KernelRetainCount);
    if (v136) {
      sub_10000522C(" (%lld ms)", v75, v76, v77, v78, v79, v80, v81, v136 / 0xF4240);
    }
  }
  KernelRetainCFIndex Count = IOObjectGetKernelRetainCount(a1);
  sub_10000522C(", retain %ld", v82, v83, v84, v85, v86, v87, v88, KernelRetainCount);
  sub_100005258(">", v89, v90, v91, v92, v93, v94, v95, v129);
  if ((*(_WORD *)a4 & 0x20) != 0
    || (long long v103 = *((_OWORD *)a4 + 1),
        v133[0] = *(_OWORD *)a4,
        v133[1] = v103,
        long long v104 = *((_OWORD *)a4 + 3),
        v133[2] = *((_OWORD *)a4 + 2),
        v133[3] = v104,
        sub_1000045B4(a1, (uint64_t)v133)))
  {
    unsigned int v105 = 0;
    unsigned int v106 = a2 + 1;
    do
    {
      if (((1 << v105) & (unint64_t)a3) != 0) {
        v107 = "| ";
      }
      else {
        v107 = "  ";
      }
      sub_10000522C(v107, v96, v97, v98, v99, v100, v101, v102, v130);
      ++v105;
    }
    while (v105 <= v106);
    sub_100005258("{", v96, v97, v98, v99, v100, v101, v102, v130);
    if (IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      CFMutableDictionaryRef properties = 0;
    }
    else
    {
      CFDictionaryRef v108 = properties;
      if (properties)
      {
LABEL_45:
        CFDictionaryApplyFunction(v108, (CFDictionaryApplierFunction)sub_1000052C0, context);
        unsigned int v116 = 0;
        do
        {
          if (((1 << v116) & (unint64_t)a3) != 0) {
            v117 = "| ";
          }
          else {
            v117 = "  ";
          }
          sub_10000522C(v117, v109, v110, v111, v112, v113, v114, v115, v131);
          ++v116;
        }
        while (v116 <= v106);
        sub_100005258("}", v109, v110, v111, v112, v113, v114, v115, v131);
        unsigned int v125 = 0;
        do
        {
          if (((1 << v125) & (unint64_t)a3) != 0) {
            v126 = "| ";
          }
          else {
            v126 = "  ";
          }
          sub_10000522C(v126, v118, v119, v120, v121, v122, v123, v124, v132);
          ++v125;
        }
        while (v125 <= v106);
        sub_100005258((char *)&unk_10000783F, v118, v119, v120, v121, v122, v123, v124, v132);
        CFRelease(properties);
        return;
      }
    }
    CFDictionaryRef v108 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef properties = v108;
    if (!v108)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create dictionary");
      exit(1);
    }
    goto LABEL_45;
  }
}

uint64_t sub_100005150(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = a2;
  if (a1)
  {
    if (a2)
    {
      int v11 = 0;
      do
      {
        if (((1 << v11) & (unint64_t)a3) != 0) {
          uint64_t v12 = "| ";
        }
        else {
          uint64_t v12 = "  ";
        }
        sub_10000522C(v12, a2, a3, a4, a5, a6, a7, a8, v17);
        ++v11;
      }
      while (v10 != v11);
    }
    return sub_10000522C("+-o ", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    unsigned int v14 = 0;
    unsigned int v15 = a2 + 1;
    do
    {
      if (((1 << v14) & (unint64_t)a3) != 0) {
        uint64_t v16 = "| ";
      }
      else {
        uint64_t v16 = "  ";
      }
      uint64_t result = sub_10000522C(v16, a2, a3, a4, a5, a6, a7, a8, v17);
      ++v14;
    }
    while (v14 <= v15);
  }
  return result;
}

uint64_t sub_10000522C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_100006288(a1, &a9);
}

uint64_t sub_100005258(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100006288(a1, &a9);
  if (byte_10000C01C == 1) {
    putchar(36);
  }
  uint64_t result = putchar(10);
  byte_10000C01C = 0;
  dword_10000C018 = dword_10000C008;
  return result;
}

uint64_t sub_1000052C0(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = a3;
  unsigned int v12 = 0;
  uint64_t v13 = *(void *)(a3 + 8);
  unsigned int v14 = *(_DWORD *)(a3 + 4) + 1;
  do
  {
    if ((v13 & (1 << v12)) != 0) {
      unsigned int v15 = "| ";
    }
    else {
      unsigned int v15 = "  ";
    }
    sub_10000522C(v15, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
    ++v12;
  }
  while (v12 <= v14);
  sub_10000522C("  ", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
  sub_10000636C(a1, v16, v17, v18, v19, v20, v21, v22, v345);
  sub_10000522C(" = ", v23, v24, v25, v26, v27, v28, v29, v346);
  if ((*(_WORD *)(v9 + 16) & 4) == 0)
  {
    sub_10000636C(a2, v30, v31, v32, v33, v34, v35, v36, v347);
    long long v44 = (char *)&unk_10000783F;
LABEL_8:
    return sub_100005258(v44, v37, v38, v39, v40, v41, v42, v43, a9);
  }
  io_registry_entry_t v46 = *(_DWORD *)v9;
  uint64_t v374 = v9;
  if (CFEqual(a1, @"reg"))
  {
    io_registry_entry_t parent = 0;
    memset(name, 0, 128);
    if (!IORegistryEntryGetParentEntry(v46, "IODeviceTree", &parent))
    {
      if (IORegistryEntryGetNameInPlane(parent, "IODeviceTree", (char *)name))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "could not get name of parent");
        strcpy((char *)name, "<name error>");
      }
      IOObjectRelease(parent);
      BOOL v75 = LOWORD(name[0]) == 25456 && BYTE2(name[0]) == 105;
      if (v75) {
        return sub_100006998(a2, v9, v69, v70, v71, v72, v73, v74, v347);
      }
    }
    goto LABEL_29;
  }
  if (CFEqual(a1, @"assigned-addresses"))
  {
    return sub_100006998(a2, v9, v47, v48, v49, v50, v51, v52, a9);
  }
  if (CFEqual(a1, @"slot-names"))
  {
    CFTypeID v97 = CFGetTypeID(a2);
    if (v97 == CFDataGetTypeID())
    {
      if (!CFDataGetLength((CFDataRef)a2) || (BytePtr = CFDataGetBytePtr((CFDataRef)a2), !*(_DWORD *)BytePtr))
      {
        long long v44 = "<>";
        goto LABEL_8;
      }
      uint64_t v99 = BytePtr;
      uint64_t v100 = (const char *)(BytePtr + 4);
      uint64_t result = sub_100005258((char *)&unk_10000783F, v37, v38, v39, v40, v41, v42, v43, v347);
      for (uint64_t i = 0; i != 32; ++i)
      {
        if ((*(_DWORD *)v99 >> i))
        {
          unsigned int v109 = 0;
          uint64_t v110 = *(void *)(v374 + 8);
          unsigned int v111 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v110 & (1 << v109)) != 0) {
              uint64_t v112 = "| ";
            }
            else {
              uint64_t v112 = "  ";
            }
            sub_10000522C(v112, v101, v102, v103, v104, v105, v106, v107, v349);
            ++v109;
          }
          while (v109 <= v111);
          sub_100005258("    %02lu: %s", v101, v102, v103, v104, v105, v106, v107, i);
          uint64_t result = strlen(v100);
          v100 += result + 1;
        }
      }
      return result;
    }
    v342 = __stderrp;
    v343 = "invalid phys addr";
    goto LABEL_222;
  }
  if (CFEqual(a1, @"ranges"))
  {
    CFTypeID v113 = CFGetTypeID(a2);
    if (v113 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength((CFDataRef)a2);
      if (!Length)
      {
        v294 = "<>";
        return sub_100005258(v294, v85, v86, v87, v88, v89, v90, v91, v347);
      }
      CFIndex v115 = Length;
      io_registry_entry_t parent = 0;
      unsigned int v116 = CFDataGetBytePtr((CFDataRef)a2);
      unint64_t v366 = v115;
      if (IORegistryEntryGetParentEntry(*(_DWORD *)v9, "IODeviceTree", &parent))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get device tree parent");
        io_registry_entry_t v117 = 0;
        io_registry_entry_t parent = 0;
      }
      else
      {
        io_registry_entry_t v117 = parent;
      }
      int v118 = sub_100006C98(v117, @"#address-cells");
      IOObjectRelease(parent);
      int v119 = sub_100006C98(*(_DWORD *)v9, @"#address-cells");
      int v371 = sub_100006C98(*(_DWORD *)v9, @"#size-cells");
      sub_100005258((char *)&unk_10000783F, v120, v121, v122, v123, v124, v125, v126, v347);
      unsigned int v134 = 0;
      uint64_t v135 = *(void *)(v9 + 8);
      unsigned int v136 = *(_DWORD *)(v9 + 4) + 1;
      do
      {
        if ((v135 & (1 << v134)) != 0) {
          uint64_t v137 = "| ";
        }
        else {
          uint64_t v137 = "  ";
        }
        sub_10000522C(v137, v127, v128, v129, v130, v131, v132, v133, v350);
        ++v134;
      }
      while (v134 <= v136);
      sub_10000522C("    ", v127, v128, v129, v130, v131, v132, v133, v350);
      uint64_t v145 = 0;
      name[0] = v119;
      name[1] = v118;
      name[2] = v371;
      do
      {
        sub_10000522C("%s", v138, v139, v140, v141, v142, v143, v144, (char)(&off_100008348)[v145]);
        uint64_t v153 = name[v145];
        if ((int)v153 < 2)
        {
          sub_10000522C(" ", v146, v147, v148, v149, v150, v151, v152, v351);
        }
        else
        {
          sub_10000522C("-", v146, v147, v148, v149, v150, v151, v152, v351);
          uint64_t v154 = v153 - 1;
          do
          {
            if (--v154) {
              v155 = "---------";
            }
            else {
              v155 = "-------- ";
            }
            sub_10000522C(v155, v138, v139, v140, v141, v142, v143, v144, v352);
          }
          while (v154);
        }
        ++v145;
      }
      while (v145 != 3);
      int v156 = v119 + v118 + v371;
      uint64_t result = sub_100005258((char *)&unk_10000783F, v138, v139, v140, v141, v142, v143, v144, v352);
      unint64_t v164 = 4 * v156;
      if (v164 <= v366)
      {
        uint64_t v165 = 0;
        unint64_t v166 = v366 / v164;
        if ((unint64_t)v156 <= 1) {
          uint64_t v167 = 1;
        }
        else {
          uint64_t v167 = v156;
        }
        uint64_t v367 = v167;
        if (v166 <= 1) {
          uint64_t v168 = 1;
        }
        else {
          uint64_t v168 = v166;
        }
        do
        {
          unsigned int v169 = 0;
          uint64_t v170 = *(void *)(v374 + 8);
          unsigned int v171 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v170 & (1 << v169)) != 0) {
              v172 = "| ";
            }
            else {
              v172 = "  ";
            }
            sub_10000522C(v172, v157, v158, v159, v160, v161, v162, v163, v353);
            ++v169;
          }
          while (v169 <= v171);
          sub_10000522C("    ", v157, v158, v159, v160, v161, v162, v163, v353);
          if (v156)
          {
            uint64_t v180 = v367;
            do
            {
              int v181 = *(_DWORD *)v116;
              v116 += 4;
              sub_10000522C("%08lx ", v173, v174, v175, v176, v177, v178, v179, v181);
              --v180;
            }
            while (v180);
          }
          uint64_t result = sub_100005258((char *)&unk_10000783F, v173, v174, v175, v176, v177, v178, v179, v354);
          ++v165;
        }
        while (v165 != v168);
      }
      return result;
    }
    v342 = __stderrp;
    v343 = "invalid ranges";
LABEL_222:
    fprintf(v342, "ioreg: error: %s.\n", v343);
    exit(1);
  }
  if (CFStringCompare(a1, @"interrupt-map", 0))
  {
    if (CFStringCompare(a1, @"interrupts", 0))
    {
      if (CFEqual(a1, @"interrupt-parent"))
      {
        io_registry_entry_t parent = 0;
        memset((char *)name + 1, 0, 511);
        uint64_t v53 = (int *)CFDataGetBytePtr((CFDataRef)a2);
        uint64_t result = sub_100006D24(*v53, &parent);
        if (result)
        {
          LOBYTE(name[0]) = 0;
          io_registry_entry_t v54 = parent;
          sub_100006E00(parent, (char *)name);
          sub_10000522C("<%08lx>", v55, v56, v57, v58, v59, v60, v61, *v53);
          if (LOBYTE(name[0])) {
            sub_10000522C(" (%s)", v62, v63, v64, v65, v66, v67, v68, (char)name);
          }
          sub_100005258((char *)&unk_10000783F, v62, v63, v64, v65, v66, v67, v68, v348);
          return IOObjectRelease(v54);
        }
        return result;
      }
LABEL_29:
      CFTypeID v76 = CFGetTypeID(a2);
      if (v76 == CFDataGetTypeID())
      {
        CFIndex v84 = CFDataGetLength((CFDataRef)a2);
        uint64_t v92 = (char *)CFDataGetBytePtr((CFDataRef)a2);
        CFIndex v370 = v84;
        if (v84 < 1)
        {
          unsigned int v95 = 0;
          unsigned int v94 = 0;
          CFIndex v93 = 0;
          goto LABEL_151;
        }
        CFIndex v93 = 0;
        unsigned int v94 = 0;
        unsigned int v95 = 0;
LABEL_32:
        if (v92[v93])
        {
          if (v93 >= v84) {
            goto LABEL_151;
          }
          while (1)
          {
            uint64_t v96 = v92[v93];
            if (v92[v93] < 0)
            {
              if (__maskrune(v92[v93], 0x40000uLL))
              {
LABEL_36:
                ++v95;
                goto LABEL_40;
              }
            }
            else if ((_DefaultRuneLocale.__runetype[v96] & 0x40000) != 0)
            {
              goto LABEL_36;
            }
            if ((char)v96 > -2)
            {
              CFIndex v84 = v370;
              if (v92[v93]) {
                goto LABEL_151;
              }
              if (++v93 >= v370) {
                goto LABEL_151;
              }
              goto LABEL_32;
            }
            ++v94;
LABEL_40:
            CFIndex v84 = v370;
            if (v370 == ++v93) {
              goto LABEL_150;
            }
          }
        }
        if (v93 < v84)
        {
          while (!v92[v93])
          {
            if (v84 == ++v93)
            {
LABEL_150:
              CFIndex v93 = v84;
              break;
            }
          }
        }
LABEL_151:
        if (byte_10000C028) {
          CFIndex v295 = 0;
        }
        else {
          CFIndex v295 = v93;
        }
        BOOL v296 = v84 != 1 && v95 >> 2 >= v94;
        if (v296) {
          CFIndex v297 = v295;
        }
        else {
          CFIndex v297 = 0;
        }
        if (v95 && v297 >= v84)
        {
          sub_10000522C("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            int v305 = 0;
            for (uint64_t j = 0; j != v84; ++j)
            {
              while (1)
              {
                char v307 = v92[j];
                if (v307) {
                  break;
                }
                if (v305 == 1)
                {
                  sub_10000522C("\"", v298, v299, v300, v301, v302, v303, v304, v362);
                  int v305 = 0;
                  if (++j != v84) {
                    continue;
                  }
                }
                goto LABEL_216;
              }
              if (!v305)
              {
                if (j) {
                  v308 = ",\"";
                }
                else {
                  v308 = "\"";
                }
                sub_10000522C(v308, v298, v299, v300, v301, v302, v303, v304, v362);
                char v307 = v92[j];
                int v305 = 1;
              }
              sub_10000522C("%c", v298, v299, v300, v301, v302, v303, v304, v307);
            }
            sub_10000522C("\"", v298, v299, v300, v301, v302, v303, v304, v362);
          }
        }
        else
        {
          if (v84 >= 9)
          {
            CFIndex v309 = 0;
            unsigned int v310 = 0;
            unsigned int v311 = (*(_DWORD *)(v9 + 72) - 2 * *(_DWORD *)(v9 + 4) - 20) >> 2;
            if (v311 >= 0x20) {
              uint64_t v312 = 32;
            }
            else {
              uint64_t v312 = v311;
            }
            uint64_t v365 = v312;
            do
            {
              sub_100005258((char *)&unk_10000783F, v85, v86, v87, v88, v89, v90, v91, v347);
              CFIndex v369 = v310 + v312;
              if (v84 >= v369) {
                uint64_t v320 = v312;
              }
              else {
                uint64_t v320 = v84 - v309;
              }
              LOBYTE(name[2]) = 58;
              v321 = (char *)&name[1] + 3;
              unsigned int v322 = v310;
              if (!v310) {
                goto LABEL_189;
              }
              do
              {
                if ((v322 & 0xF) >= 0xA) {
                  char v323 = (v322 & 0xF) + 55;
                }
                else {
                  char v323 = v322 & 0xF | 0x30;
                }
                *v321-- = v323;
                BOOL v296 = v322 >= 0x10;
                v322 >>= 4;
              }
              while (v296);
              if (v321 >= (char *)name) {
LABEL_189:
              }
                memset(name, 48, v321 - (char *)name + 1);
              if (v320 < 1)
              {
                LODWORD(v324) = 0;
                v331 = (char *)&name[2] + 1;
              }
              else
              {
                LODWORD(v324) = 0;
                v325 = (char *)&name[2] + 1;
                do
                {
                  unsigned int v326 = v92[v310 + v324];
                  char *v325 = 32;
                  int v327 = (v326 >> 4) + 55;
                  if (v326 < 0xA0) {
                    LOBYTE(v327) = (v326 >> 4) | 0x30;
                  }
                  v325[1] = v327;
                  unsigned int v328 = v326 & 0xF;
                  char v329 = v326 & 0xF | 0x30;
                  char v330 = (v326 & 0xF) + 55;
                  if (v328 < 0xA) {
                    char v330 = v329;
                  }
                  v331 = v325 + 3;
                  v325[2] = v330;
                  uint64_t v324 = (v324 + 1);
                  v325 += 3;
                }
                while (v320 > v324);
              }
              if (v324 < v312)
              {
                size_t v332 = 3 * (v312 + ~v324) + 3;
                memset(v331, 32, v332);
                v331 += v332;
              }
              unsigned char *v331 = 32;
              v333 = v331 + 1;
              if (v320 >= 1)
              {
                unsigned int v334 = 1;
                do
                {
                  int v335 = v92[v310 - 1 + v334];
                  if ((v335 - 127) < 0xFFFFFFA1) {
                    LOBYTE(v335) = 46;
                  }
                  *v333++ = v335;
                }
                while (v320 > v334++);
              }
              unsigned int v337 = 0;
              unsigned char *v333 = 0;
              uint64_t v338 = *(void *)(v9 + 8);
              unsigned int v339 = *(_DWORD *)(v9 + 4) + 1;
              do
              {
                if ((v338 & (1 << v337)) != 0) {
                  v340 = "| ";
                }
                else {
                  v340 = "  ";
                }
                sub_10000522C(v340, v313, v314, v315, v316, v317, v318, v319, v363);
                ++v337;
              }
              while (v337 <= v339);
              sub_10000522C("    %s", v313, v314, v315, v316, v317, v318, v319, (char)name);
              CFIndex v309 = v369;
              CFIndex v84 = v370;
              unsigned int v310 = v369;
              uint64_t v312 = v365;
            }
            while (v370 > v369);
            goto LABEL_217;
          }
          sub_10000522C("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            do
            {
              char v341 = *v92++;
              sub_10000522C("%02x", v298, v299, v300, v301, v302, v303, v304, v341);
              --v84;
            }
            while (v84);
          }
        }
LABEL_216:
        sub_10000522C(">", v298, v299, v300, v301, v302, v303, v304, v362);
      }
      else
      {
        sub_10000636C(a2, v77, v78, v79, v80, v81, v82, v83, v347);
      }
LABEL_217:
      v294 = (char *)&unk_10000783F;
      return sub_100005258(v294, v85, v86, v87, v88, v89, v90, v91, v347);
    }
    v254 = CFDataGetBytePtr((CFDataRef)a2);
    unint64_t v255 = CFDataGetLength((CFDataRef)a2);
    uint64_t result = sub_100005258((char *)&unk_10000783F, v256, v257, v258, v259, v260, v261, v262, v347);
    if ((uint64_t)(v255 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
    {
      char v270 = 0;
      uint64_t v271 = 0;
      v373 = &v254[4 * (v255 >> 2)];
      uint64_t v272 = (v255 >> 2) - 1;
      do
      {
        unsigned int v273 = 0;
        uint64_t v274 = *(void *)(v374 + 8);
        unsigned int v275 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v274 & (1 << v273)) != 0) {
            v276 = "| ";
          }
          else {
            v276 = "  ";
          }
          sub_10000522C(v276, v263, v264, v265, v266, v267, v268, v269, v361);
          ++v273;
        }
        while (v273 <= v275);
        sub_10000522C("    %02ld: ", v263, v264, v265, v266, v267, v268, v269, v270);
        int v284 = *(_DWORD *)v254;
        if (v271 >= v272)
        {
          uint64_t result = sub_100005258("parent interrupt-map entry: %08lx", v277, v278, v279, v280, v281, v282, v283, *(_DWORD *)v254);
        }
        else
        {
          v254 += 4;
          sub_10000522C("specifier: %08lx (vector: %02lx) sense: %08lx (", v277, v278, v279, v280, v281, v282, v283, v284);
          int v292 = *(_DWORD *)v254;
          if ((*(_DWORD *)v254 & 2) != 0)
          {
            sub_10000522C("HyperTransport vector: %04lx, ", v285, v286, v287, v288, v289, v290, v291, SBYTE2(v292));
            int v292 = *(_DWORD *)v254;
          }
          ++v271;
          BOOL v75 = (v292 & 1) == 0;
          v293 = "level";
          if (v75) {
            v293 = "edge";
          }
          uint64_t result = sub_100005258("%s)", v285, v286, v287, v288, v289, v290, v291, (char)v293);
        }
        v254 += 4;
        ++v271;
        ++v270;
      }
      while (v254 < v373);
    }
  }
  else
  {
    io_registry_entry_t parent = 0;
    memset(name, 0, 512);
    int v182 = sub_100006C98(*(_DWORD *)v9, @"#address-cells");
    int v183 = sub_100006C98(*(_DWORD *)v9, @"#interrupt-cells");
    v184 = (int *)CFDataGetBytePtr((CFDataRef)a2);
    int64_t v185 = CFDataGetLength((CFDataRef)a2) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t result = sub_100005258((char *)&unk_10000783F, v186, v187, v188, v189, v190, v191, v192, v347);
    if (v185 >= 1)
    {
      char v200 = 0;
      v368 = (int *)((char *)v184 + v185);
      uint64_t v364 = v183 + v182;
      do
      {
        unsigned int v201 = 0;
        uint64_t v202 = *(void *)(v9 + 8);
        unsigned int v203 = *(_DWORD *)(v9 + 4) + 1;
        do
        {
          if ((v202 & (1 << v201)) != 0) {
            v204 = "| ";
          }
          else {
            v204 = "  ";
          }
          sub_10000522C(v204, v193, v194, v195, v196, v197, v198, v199, v355);
          ++v201;
        }
        while (v201 <= v203);
        sub_10000522C("    %02ld: ", v193, v194, v195, v196, v197, v198, v199, v200);
        sub_10000522C("  child: ", v205, v206, v207, v208, v209, v210, v211, v356);
        uint64_t v219 = v364;
        if ((int)v364 >= 1)
        {
          do
          {
            int v220 = *v184++;
            sub_10000522C("%08lx ", v212, v213, v214, v215, v216, v217, v218, v220);
            --v219;
          }
          while (v219);
        }
        sub_100005258((char *)&unk_10000783F, v212, v213, v214, v215, v216, v217, v218, v357);
        if (sub_100006D24(*v184, &parent))
        {
          io_registry_entry_t v221 = parent;
        }
        else
        {
          fprintf(__stderrp, "ioreg: error: %s.\n", "error looking up phandle");
          io_registry_entry_t v221 = 0;
          io_registry_entry_t parent = 0;
        }
        int v372 = sub_100006C98(v221, @"#address-cells");
        int v222 = sub_100006C98(v221, @"#interrupt-cells");
        LOBYTE(name[0]) = 0;
        sub_100006E00(v221, (char *)name);
        IOObjectRelease(v221);
        unsigned int v230 = 0;
        uint64_t v231 = *(void *)(v374 + 8);
        unsigned int v232 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v231 & (1 << v230)) != 0) {
            v233 = "| ";
          }
          else {
            v233 = "  ";
          }
          sub_10000522C(v233, v223, v224, v225, v226, v227, v228, v229, v358);
          ++v230;
        }
        while (v230 <= v232);
        sub_100005258("        phandle: %08lx (%s)", v223, v224, v225, v226, v227, v228, v229, *v184);
        unsigned int v241 = 0;
        uint64_t v242 = *(void *)(v374 + 8);
        unsigned int v243 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v242 & (1 << v241)) != 0) {
            v244 = "| ";
          }
          else {
            v244 = "  ";
          }
          sub_10000522C(v244, v234, v235, v236, v237, v238, v239, v240, v359);
          ++v241;
        }
        while (v241 <= v243);
        sub_10000522C("         parent: ", v234, v235, v236, v237, v238, v239, v240, v359);
        ++v184;
        if (v222 + v372 < 1)
        {
          uint64_t v9 = v374;
        }
        else
        {
          uint64_t v252 = v222 + v372;
          uint64_t v9 = v374;
          do
          {
            int v253 = *v184++;
            sub_10000522C("%08lx ", v245, v246, v247, v248, v249, v250, v251, v253);
            --v252;
          }
          while (v252);
        }
        uint64_t result = sub_100005258((char *)&unk_10000783F, v245, v246, v247, v248, v249, v250, v251, v360);
        ++v200;
      }
      while (v184 < v368);
    }
  }
  return result;
}

uint64_t sub_100006288(char *__format, va_list a2)
{
  if (dword_10000C008)
  {
    int v2 = vsnprintf((char *)qword_10000C010, dword_10000C018, __format, a2);
    v3 = (char *)qword_10000C010;
    for (uint64_t i = strchr((char *)qword_10000C010, 10); i; uint64_t i = strchr(v3, 10))
      *uint64_t i = 32;
    uint64_t result = printf("%s", v3);
    if (v2 >= dword_10000C018)
    {
      int v2 = dword_10000C018 - 1;
      byte_10000C01C = 1;
    }
    dword_10000C018 -= v2;
  }
  else
  {
    return vprintf(__format, a2);
  }
  return result;
}

void sub_10000636C(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v10 = CFGetTypeID(a1);
  if (v10 == CFArrayGetTypeID())
  {
    char context = 1;
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    sub_10000522C("(", v12, v13, v14, v15, v16, v17, v18, v79);
    v86.io_name_t location = 0;
    v86.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v86, (CFArrayApplierFunction)sub_100006890, &context);
    uint64_t v26 = ")";
LABEL_3:
    sub_10000522C(v26, v19, v20, v21, v22, v23, v24, v25, v80);
    return;
  }
  if (v10 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1)) {
      uint64_t v34 = "Yes";
    }
    else {
      uint64_t v34 = "No";
    }
LABEL_64:
    sub_10000522C(v34, v27, v28, v29, v30, v31, v32, v33, a9);
    return;
  }
  if (v10 == CFDataGetTypeID())
  {
    sub_10000522C("<", v35, v36, v37, v38, v39, v40, v41, v79);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = (char *)CFDataGetBytePtr((CFDataRef)a1);
    if (Length < 1)
    {
      unsigned int v46 = 0;
      unsigned int v45 = 0;
      CFIndex v44 = 0;
LABEL_37:
      if (byte_10000C028) {
        CFIndex v64 = 0;
      }
      else {
        CFIndex v64 = v44;
      }
      if (Length != 1 && v46 >> 2 >= v45) {
        CFIndex v66 = v64;
      }
      else {
        CFIndex v66 = 0;
      }
      if (v46 && v66 >= Length)
      {
        if (Length >= 1)
        {
          int v67 = 0;
          for (uint64_t i = 0; i != Length; ++i)
          {
            while (1)
            {
              char v69 = BytePtr[i];
              if (v69) {
                break;
              }
              if (v67 == 1)
              {
                sub_10000522C("\"", v27, v28, v29, v30, v31, v32, v33, v81);
                int v67 = 0;
                if (++i != Length) {
                  continue;
                }
              }
              goto LABEL_63;
            }
            if (!v67)
            {
              if (i) {
                uint64_t v70 = ",\"";
              }
              else {
                uint64_t v70 = "\"";
              }
              sub_10000522C(v70, v27, v28, v29, v30, v31, v32, v33, v81);
              char v69 = BytePtr[i];
              int v67 = 1;
            }
            sub_10000522C("%c", v27, v28, v29, v30, v31, v32, v33, v69);
          }
          sub_10000522C("\"", v27, v28, v29, v30, v31, v32, v33, v81);
        }
      }
      else if (Length >= 1)
      {
        do
        {
          char v71 = *BytePtr++;
          sub_10000522C("%02x", v27, v28, v29, v30, v31, v32, v33, v71);
          --Length;
        }
        while (Length);
      }
LABEL_63:
      uint64_t v34 = ">";
      goto LABEL_64;
    }
    CFIndex v44 = 0;
    unsigned int v45 = 0;
    unsigned int v46 = 0;
LABEL_12:
    if (BytePtr[v44]) {
      BOOL v47 = v44 < Length;
    }
    else {
      BOOL v47 = 0;
    }
    if (!v47) {
      goto LABEL_37;
    }
    while (1)
    {
      uint64_t v48 = BytePtr[v44];
      if (BytePtr[v44] < 0)
      {
        if (__maskrune(BytePtr[v44], 0x40000uLL))
        {
LABEL_19:
          ++v46;
          goto LABEL_23;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v48] & 0x40000) != 0)
      {
        goto LABEL_19;
      }
      if ((char)v48 > -2)
      {
        if (BytePtr[v44]) {
          goto LABEL_37;
        }
        if (++v44 >= Length) {
          goto LABEL_37;
        }
        goto LABEL_12;
      }
      ++v45;
LABEL_23:
      if (Length == ++v44)
      {
        CFIndex v44 = Length;
        goto LABEL_37;
      }
    }
  }
  if (v10 == CFDictionaryGetTypeID())
  {
    char v83 = 1;
    sub_10000522C("{", v49, v50, v51, v52, v53, v54, v55, v79);
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_1000068E0, &v83);
    uint64_t v26 = "}";
    goto LABEL_3;
  }
  if (v10 == CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
    {
      if (byte_10000C028) {
        uint64_t v63 = "0x%qx";
      }
      else {
        uint64_t v63 = "%qu";
      }
      sub_10000522C(v63, v56, v57, v58, v59, v60, v61, v62, valuePtr);
    }
  }
  else if (v10 == CFSetGetTypeID())
  {
    sub_100006764((const __CFSet *)a1, v72, v73, v74, v75, v76, v77, v78);
  }
  else
  {
    if (v10 != CFStringGetTypeID())
    {
      uint64_t v34 = "<unknown object>";
      goto LABEL_64;
    }
    sub_1000067C8(a1);
  }
}

uint64_t sub_100006764(const __CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char context = 1;
  sub_10000522C("[", a2, a3, a4, a5, a6, a7, a8, v17);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006948, &context);
  return sub_10000522C("]", v9, v10, v11, v12, v13, v14, v15, v18);
}

void sub_1000067C8(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    sub_10000522C("\"%s\"", v3, v4, v5, v6, v7, v8, v9, (char)CStringPtr);
  }
  else
  {
    CFIndex v10 = CFStringGetLength(a1) + 1;
    uint64_t v11 = (char *)malloc_type_malloc(v10, 0x50DF42A6uLL);
    if (v11)
    {
      uint64_t v12 = v11;
      if (CFStringGetCString(a1, v11, v10, 0x8000100u)) {
        sub_10000522C("\"%s\"", v13, v14, v15, v16, v17, v18, v19, (char)v12);
      }
      free(v12);
    }
  }
}

uint64_t sub_100006890(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    sub_10000522C(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  }

  return sub_10000636C(a1);
}

uint64_t sub_1000068E0(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a3) {
    *a3 = 0;
  }
  else {
    sub_10000522C(",", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v18);
  }
  sub_10000636C(a1);
  sub_10000522C("=", v10, v11, v12, v13, v14, v15, v16, v18);

  return sub_10000636C(a2);
}

uint64_t sub_100006948(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    sub_10000522C(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  }

  return sub_10000636C(a1);
}

uint64_t sub_100006998(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v11 = CFGetTypeID(a1);
  if (v11 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "invalid phys addr");
    exit(1);
  }
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  if (Length)
  {
    unint64_t v20 = Length;
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    uint64_t result = sub_100005258((char *)&unk_10000783F, v22, v23, v24, v25, v26, v27, v28, v77);
    if (v20 >= 0x14)
    {
      uint64_t v37 = 0;
      do
      {
        unsigned int v38 = 0;
        uint64_t v39 = BytePtr;
        uint64_t v40 = &BytePtr[20 * v37];
        char v82 = BYTE2(*(_DWORD *)v40);
        char v83 = (&off_100008360)[((unint64_t)*(unsigned int *)v40 >> 24) & 3];
        uint64_t v41 = *(void *)(a2 + 8);
        unsigned int v42 = *(_DWORD *)(a2 + 4) + 1;
        do
        {
          if ((v41 & (1 << v38)) != 0) {
            uint64_t v43 = "| ";
          }
          else {
            uint64_t v43 = "  ";
          }
          sub_10000522C(v43, v30, v31, v32, v33, v34, v35, v36, v78);
          ++v38;
        }
        while (v38 <= v42);
        BytePtr = v39;
        sub_100005258("    %02lu: phys.hi: %08lx phys.mid: %08lx phys.lo: %08lx", v30, v31, v32, v33, v34, v35, v36, v37);
        unsigned int v51 = 0;
        uint64_t v52 = *(void *)(a2 + 8);
        unsigned int v53 = *(_DWORD *)(a2 + 4) + 1;
        do
        {
          if ((v52 & (1 << v51)) != 0) {
            uint64_t v54 = "| ";
          }
          else {
            uint64_t v54 = "  ";
          }
          sub_10000522C(v54, v44, v45, v46, v47, v48, v49, v50, v79);
          ++v51;
        }
        while (v51 <= v53);
        sub_100005258("        size.hi: %08lx size.lo: %08lx", v44, v45, v46, v47, v48, v49, v50, *(_DWORD *)&v39[20 * v37 + 12]);
        unsigned int v62 = 0;
        uint64_t v63 = *(void *)(a2 + 8);
        unsigned int v64 = *(_DWORD *)(a2 + 4) + 1;
        do
        {
          if ((v63 & (1 << v62)) != 0) {
            uint64_t v65 = "| ";
          }
          else {
            uint64_t v65 = "  ";
          }
          sub_10000522C(v65, v55, v56, v57, v58, v59, v60, v61, v80);
          ++v62;
        }
        while (v62 <= v64);
        sub_100005258("        bus: %lu dev: %lu func: %lu reg: %lu", v55, v56, v57, v58, v59, v60, v61, v82);
        unsigned int v73 = 0;
        uint64_t v74 = *(void *)(a2 + 8);
        unsigned int v75 = *(_DWORD *)(a2 + 4) + 1;
        do
        {
          if ((v74 & (1 << v73)) != 0) {
            uint64_t v76 = "| ";
          }
          else {
            uint64_t v76 = "  ";
          }
          sub_10000522C(v76, v66, v67, v68, v69, v70, v71, v72, v81);
          ++v73;
        }
        while (v73 <= v75);
        uint64_t result = sub_100005258("        type: %s flags: %s%s%s", v66, v67, v68, v69, v70, v71, v72, (char)v83);
        ++v37;
      }
      while (v37 != v20 / 0x14);
    }
  }
  else
  {
    return sub_100005258("<>", v13, v14, v15, v16, v17, v18, v19, a9);
  }
  return result;
}

uint64_t sub_100006C98(io_registry_entry_t a1, CFStringRef key)
{
  CFDataRef v2 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IODeviceTree", key, kCFAllocatorDefault, 3u);
  if (v2)
  {
    CFDataRef v3 = v2;
    uint64_t v4 = *(unsigned int *)CFDataGetBytePtr(v2);
    CFRelease(v3);
  }
  else
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get properties");
    return 0;
  }
  return v4;
}

BOOL sub_100006D24(int a1, io_service_t *a2)
{
  *(_DWORD *)bytes = a1;
  keys = @"AAPL,phandle";
  uint64_t v9 = @"IOPropertyMatch";
  values = CFDataCreate(0, bytes, 4);
  CFTypeRef cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)&v9, &cf, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  *a2 = MatchingService;
  BOOL v5 = MatchingService != 0;
  CFRelease(cf);
  CFRelease(values);
  return v5;
}

void *sub_100006E00(io_registry_entry_t a1, io_string_t path)
{
  if (IORegistryEntryGetPath(a1, "IODeviceTree", path))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get path");
    strcpy(path, "<path error");
  }
  CFDictionaryRef v3 = strchr(path, 58) + 1;
  size_t v4 = strlen(v3) + 1;

  return memmove(path, v3, v4);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return _CFSetGetTypeID();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFWriteStreamCreateWithFile(alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

CFStringRef IOObjectCopySuperclassForClass(CFStringRef classname)
{
  return _IOObjectCopySuperclassForClass(classname);
}

uint32_t IOObjectGetKernelRetainCount(io_object_t object)
{
  return _IOObjectGetKernelRetainCount(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetLocationInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t location)
{
  return _IORegistryEntryGetLocationInPlane(entry, plane, location);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return _IORegistryEntryGetNameInPlane(entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return _IORegistryEntryGetPath(entry, plane, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

uint64_t IOServiceGetBusyStateAndTime()
{
  return _IOServiceGetBusyStateAndTime();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t _IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return __IOObjectConformsTo(object, className);
}

CFStringRef _IOObjectCopyClass(io_object_t object)
{
  return __IOObjectCopyClass(object);
}

uint64_t _IOObjectGetClass(io_object_t object, io_name_t className)
{
  return __IOObjectGetClass(object, className);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void exit(int a1)
{
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int isatty(int a1)
{
  return _isatty(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int tgetent(char *a1, const char *a2)
{
  return _tgetent(a1, a2);
}

char *__cdecl tgetstr(char *a1, char **a2)
{
  return _tgetstr(a1, a2);
}

int tputs(const char *a1, int a2, int (__cdecl *a3)(int))
{
  return _tputs(a1, a2, a3);
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}