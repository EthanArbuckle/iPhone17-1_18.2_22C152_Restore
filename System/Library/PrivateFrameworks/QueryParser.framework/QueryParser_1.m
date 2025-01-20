void QP::Formatter::setDefaultParse(uint64_t a1, const __CFString ***a2)
{
  CFStringRef v4;
  CFAttributedStringRef v5;
  const __CFString **v6;
  CFNumberRef v7;
  CFNumberRef v8;
  __CFDictionary *v9;
  const __CFString **valuePtr;
  CFRange v11;

  QP::Formatter::clear((const void **)a1);
  v4 = &stru_26D832058;
  if (*a2 && **a2) {
    v4 = **a2;
  }
  v5 = *(const __CFAttributedString **)(a1 + 72);
  v11.length = CFAttributedStringGetLength(v5);
  v11.location = 0;
  CFAttributedStringReplaceString(v5, v11, v4);
  v6 = *a2;
  if (*a2) {
    v6 = (const __CFString **)v6[6];
  }
  valuePtr = v6;
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCFIndexType, &valuePtr);
  if (v7)
  {
    v8 = v7;
    if (kQPParseResultTokenCountKey)
    {
      v9 = *(__CFDictionary **)(a1 + 56);
      if (v9) {
        CFDictionarySetValue(v9, kQPParseResultTokenCountKey, v8);
      }
    }
    CFRelease(v8);
  }
}

void sub_224E0BA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void QP::Formatter::setResultValue(QP::Formatter *this, const __CFString *a2, const void *a3)
{
  if (a2 && a3)
  {
    v3 = (__CFDictionary *)*((void *)this + 7);
    if (v3) {
      CFDictionarySetValue(v3, a2, a3);
    }
  }
}

void QP::Formatter::updateParseWithAnyAttribute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(QP::ParseAttribute **)a3;
  if (!*(unsigned char *)(*(void *)a3 + 72))
  {
    if (QP::ParseAttribute::flag(v6) == 1
      || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a3) == 2
      || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a3) == 3
      || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a3) == 4)
    {
      v9 = *(std::__shared_weak_count **)(a3 + 8);
      v12 = *(QP::ParseAttribute **)a3;
      v13 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, uint64_t, QP::ParseAttribute **))(*(void *)a1 + 64))(a1, a2, &v12);
      v8 = v13;
      if (v13) {
        goto LABEL_5;
      }
      return;
    }
    v6 = *(QP::ParseAttribute **)a3;
  }
  v7 = *(std::__shared_weak_count **)(a3 + 8);
  v10 = v6;
  v11 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, QP::ParseAttribute **))(*(void *)a1 + 72))(a1, a2, &v10);
  v8 = v11;
  if (v11) {
LABEL_5:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
}

void sub_224E0BBE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t QP::Formatter::setParse(uint64_t a1, uint64_t a2)
{
  QP::Formatter::clear((const void **)a1);
  CFStringRef v4 = &stru_26D832058;
  if (*(void *)a2 && **(void **)a2) {
    CFStringRef v4 = **(const __CFString ***)a2;
  }
  CFAttributedStringRef v5 = *(const __CFAttributedString **)(a1 + 72);
  v19.length = CFAttributedStringGetLength(v5);
  v19.location = 0;
  CFAttributedStringReplaceString(v5, v19, v4);
  if (*(unsigned char *)(*(void *)a2 + 81)) {
    return 1;
  }
  uint64_t valuePtr = *(void *)(*(void *)a2 + 48);
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCFIndexType, &valuePtr);
  CFNumberRef v17 = v7;
  if (v7)
  {
    if (kQPParseResultTokenCountKey)
    {
      v8 = *(__CFDictionary **)(a1 + 56);
      if (v8) {
        CFDictionarySetValue(v8, kQPParseResultTokenCountKey, v7);
      }
    }
  }
  v9 = *(std::__shared_weak_count **)(a2 + 8);
  v15 = *(const __CFString ***)a2;
  v16 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, const __CFString ***))(*(void *)a1 + 16))(a1, &v15);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v6)
  {
    v10 = *(const __CFString ***)a2;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1174405120;
    v13[2] = ___ZN2QP9Formatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke;
    v13[3] = &__block_descriptor_tmp_16;
    v13[4] = a1;
    v13[5] = v10;
    v11 = *(std::__shared_weak_count **)(a2 + 8);
    v14 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    QP::Parse::enumerateParseAttributes((uint64_t)v10, (uint64_t)v13);
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return v6;
}

void sub_224E0BDBC(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)(v1 - 48), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = **(void **)(a1 + 40);
  uint64_t v7 = *a2;
  uint64_t v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = v7;
  v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v4 + 56))(v4, v5, &v8);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void sub_224E0BE80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void QP::Formatter::setSuggestionValue(QP::Formatter *this, const __CFString *a2, const void *a3)
{
  if (a2 && a3)
  {
    v3 = (__CFDictionary *)*((void *)this + 8);
    if (v3) {
      CFDictionarySetValue(v3, a2, a3);
    }
  }
}

void QP::Formatter::updateParseWithAttribute(uint64_t *a1, uint64_t a2, CFRange **a3)
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3002000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (QP::ParserGrammar::hasTranslations(a1[3], (uint64_t)&(*a3)[3]))
  {
    CFStringRef v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3802000000;
    v20 = __Block_byref_object_copy__122;
    uint64_t v6 = *a3;
    CFIndex length = 0;
    v23 = 0;
    v21 = __Block_byref_object_dispose__123;
    location = (std::__shared_weak_count *)v6[7].location;
    if (location)
    {
      v23 = std::__shared_weak_count::lock(location);
      if (v23) {
        CFIndex length = v6[6].length;
      }
    }
    if (v18[5])
    {
      uint64_t v8 = a1[3];
      v9 = *a3;
      uint64_t v10 = (uint64_t)&(*a3)[3];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 1174405120;
      v15[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke;
      v15[3] = &unk_26D8319D8;
      v15[4] = &v17;
      v15[5] = &v24;
      v15[6] = a1;
      v15[7] = a2;
      v11 = (std::__shared_weak_count *)a3[1];
      v15[8] = v9;
      v16 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      QP::ParserGrammar::translations(v8, v10, (uint64_t)v15);
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
    }
    _Block_object_dispose(&v17, 8);
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v25[5]);
  if (Count)
  {
    CFStringRef CFStringFromString = QP::createCFStringFromString((uint64_t)&(*a3)[3]);
    CFStringRef v17 = CFStringFromString;
    if (Count == 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v25[5], 0);
      QP::Formatter::setParseAttribute((QP::Formatter *)a1, CFStringFromString, ValueAtIndex, (*a3)[1]);
    }
    else
    {
      QP::Formatter::setParseAttribute((QP::Formatter *)a1, CFStringFromString, (CFTypeRef)v25[5], (*a3)[1]);
    }
    if (CFStringFromString) {
      CFRelease(CFStringFromString);
    }
  }
  _Block_object_dispose(&v24, 8);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_224E0C108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v12 + 40), 0);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *(void *)(result + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v2;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

__n128 __Block_byref_object_copy__122(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = result;
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__123(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke(void *a1, const __CFString *a2)
{
  uint64_t v4 = a1[6];
  unsigned int v5 = QP::ParserGrammar::symbolID(*(void *)(v4 + 24), *(void *)(*(void *)(a1[4] + 8) + 40));
  if (CFStringContainsString(a2, @"%@u"))
  {
    if (QP::ParserGrammar::hasUTIs(*(QP::ParserGrammar **)(v4 + 24), v5))
    {
      uint64_t v6 = *(void *)(v4 + 24);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 0x40000000;
      v15[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2;
      v15[3] = &unk_264706518;
      v15[4] = a1[5];
      v15[5] = a2;
      QP::ParserGrammar::UTIs(v6, v5, (uint64_t)v15);
    }
  }
  else if (CFStringContainsString(a2, @"%@e"))
  {
    if (QP::ParserGrammar::hasFileExtensions(*(QP::ParserGrammar **)(v4 + 24), v5))
    {
      uint64_t v7 = *(void *)(v4 + 24);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 0x40000000;
      v14[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3;
      v14[3] = &unk_264706540;
      v14[4] = a1[5];
      v14[5] = a2;
      QP::ParserGrammar::fileExtensions(v7, v5, (uint64_t)v14);
    }
  }
  else
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a2);
    CFStringRef v10 = (const __CFString *)a1[7];
    uint64_t v11 = a1[8];
    uint64_t v12 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v11 + 112));
    CFStringRef v13 = CFStringCreateWithSubstring(v8, v10, *(CFRange *)(*(void *)(v11 + 104) + 72));
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    v16.CFIndex length = CFStringGetLength(MutableCopy);
    v16.location = 0;
    CFStringFindAndReplace(MutableCopy, @"%@v", v13, v16, 0);
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[5] + 8) + 40), MutableCopy);
    if (v13) {
      CFRelease(v13);
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
}

void sub_224E0C3C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFStringRef *)(a1 + 40));
  CFStringRef CFStringFromString = QP::createCFStringFromString(a2);
  v6.CFIndex length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFStringFindAndReplace(MutableCopy, @"%@u", CFStringFromString, v6, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), MutableCopy);
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

void sub_224E0C4B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFStringRef *)(a1 + 40));
  CFStringRef CFStringFromString = QP::createCFStringFromString(a2);
  v6.CFIndex length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFStringFindAndReplace(MutableCopy, @"%@e", CFStringFromString, v6, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), MutableCopy);
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

void sub_224E0C5A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_64c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 72);
  *(void *)(result + 64) = *(void *)(a2 + 64);
  *(void *)(result + 72) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_64c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 72);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void QP::Formatter::updateParseWithDateAttribute(QP::Formatter *a1, uint64_t a2, CFRange **a3)
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v42 = Mutable;
  uint64_t v7 = *a3;
  location = (std::__shared_weak_count *)(*a3)[7].location;
  if (!location) {
    goto LABEL_59;
  }
  v9 = std::__shared_weak_count::lock(location);
  if (!v9) {
    goto LABEL_59;
  }
  CFStringRef v10 = v9;
  CFIndex length = v7[6].length;
  if (length)
  {
    uint64_t v13 = *(void *)(length + 120);
    uint64_t v12 = *(std::__shared_weak_count **)(length + 128);
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (!v13) {
      goto LABEL_56;
    }
    if (BYTE1((*a3)[4].length))
    {
      LODWORD(valuePtr) = 5;
      CFNumberRef v14 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
      v41 = v14;
      if (v14) {
        CFDictionarySetValue(Mutable, kQPParseAttributeValueDateTypeKey, v14);
      }
      QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateExtensionKey, Mutable, (*a3)[1]);
      ++*((void *)a1 + 10);
      if (v14) {
        CFRelease(v14);
      }
LABEL_56:
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      goto LABEL_58;
    }
    v15 = (CFDateFormatterRef *)*((void *)a1 + 5);
    uint64_t v39 = v13;
    v40 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    value = QP::DateFormatter::copyDisplayForDate(v15, &v39, 0, 0);
    v41 = value;
    if (v40) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v40);
    }
    if (value) {
      CFDictionarySetValue(Mutable, kQPParseAttributeValueDateDisplayKey, value);
    }
    CFRange v16 = (void *)*((void *)a1 + 5);
    uint64_t v36 = v13;
    v37 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    started = QP::DateFormatter::copyStartComponentsForDate(v16, &v36);
    uint64_t valuePtr = started;
    if (v37) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    }
    CFStringRef v17 = (void *)*((void *)a1 + 5);
    uint64_t v33 = v13;
    v34 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v18 = QP::DateFormatter::copyEndComponentsForDate(v17, &v33);
    v35 = v18;
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    if (started)
    {
      if (!v18)
      {
        uint64_t v19 = &kQPParseAttributeValueDateComponentsKey;
        v20 = started;
        goto LABEL_33;
      }
      CFDictionarySetValue(Mutable, kQPParseAttributeValueDateStartComponentsKey, started);
      uint64_t v19 = &kQPParseAttributeValueDateEndComponentsKey;
    }
    else
    {
      if (!v18)
      {
LABEL_34:
        uint64_t v21 = *((void *)a1 + 5);
        uint64_t v30 = v13;
        v31 = v12;
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v22 = QP::DateFormatter::copyFreqComponentsForDate(v21, (uint64_t)&v30);
        v32 = v22;
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
        if (v22) {
          CFDictionarySetValue(Mutable, kQPParseAttributeValueDateFrequencyComponentsKey, v22);
        }
        int v29 = *(_DWORD *)(v13 + 8);
        CFNumberRef v23 = CFNumberCreate(v5, kCFNumberIntType, &v29);
        CFNumberRef v28 = v23;
        if (v23) {
          CFDictionarySetValue(Mutable, kQPParseAttributeValueDateTypeKey, v23);
        }
        int v27 = *(_DWORD *)(v13 + 16);
        CFNumberRef v24 = CFNumberCreate(v5, kCFNumberIntType, &v27);
        if (v24) {
          CFDictionarySetValue(Mutable, kQPParseAttributeValueDateTemporalModifierKey, v24);
        }
        QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateKey, Mutable, (*a3)[1]);
        ++*((void *)a1 + 10);
        if (v24) {
          CFRelease(v24);
        }
        if (v23) {
          CFRelease(v23);
        }
        if (v22) {
          CFRelease(v22);
        }
        if (v18) {
          CFRelease(v18);
        }
        if (started) {
          CFRelease(started);
        }
        if (value) {
          CFRelease(value);
        }
        goto LABEL_56;
      }
      uint64_t v19 = &kQPParseAttributeValueDateComponentsKey;
    }
    v20 = v18;
LABEL_33:
    CFDictionarySetValue(Mutable, *v19, v20);
    goto LABEL_34;
  }
LABEL_58:
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
LABEL_59:
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_224E0C9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va3, a5);
  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  v9 = va_arg(va1, const void *);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  va_copy(va2, va1);
  CFNumberRef v14 = va_arg(va2, const void *);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  va_copy(va3, va2);
  v18 = va_arg(va3, const void *);
  uint64_t v20 = va_arg(va3, void);
  uint64_t v21 = va_arg(va3, void);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v7 - 104), 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)(v7 - 96), 0);
  _Unwind_Resume(a1);
}

CFStringRef QP::Formatter::copyDisplayStringWithStartAndEndDateForRange(QP::DateFormatter **this, const __CFString *a2, const __CFDictionary *a3, const __CFString *a4, const __CFDictionary *a5)
{
  return QP::DateFormatter::copyDisplayStringWithStartAndEndDateForRange(this[5], a2, a3, a4, a5);
}

QP::ParserConfiguration *QP::ParserConfiguration::ParserConfiguration(QP::ParserConfiguration *this, const __CFDictionary *a2)
{
  *((void *)this + 1) = 0;
  uint64_t v4 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  CFAllocatorRef v5 = (char *)this + 16;
  *(void *)this = &unk_26D831A88;
  *((_WORD *)this + 12) = 256;
  *(_DWORD *)((char *)this + 26) = 0;
  CFRange v6 = (BOOL *)this + 26;
  *((unsigned char *)this + 3nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *(_DWORD *)((char *)this + 31) = 65537;
  *((void *)this + 5) = 0;
  uint64_t v7 = (_DWORD *)((char *)this + 40);
  *((_WORD *)this + 18) = 0;
  *((unsigned char *)this + 5nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *((_WORD *)this + 26) = 0;
  *(_WORD *)((char *)this + 55) = 0;
  *((unsigned char *)this + 65) = 0;
  *((unsigned char *)this + 48) = 0;
  *((_WORD *)this + 33) = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  v72 = (void *)((char *)this + 88);
  *(_OWORD *)((char *)this + 104) = 0u;
  CFAllocatorRef v8 = (uint64_t *)((char *)this + 104);
  *(_OWORD *)((char *)this + 168) = 0u;
  v69 = (const void **)((char *)this + 168);
  v73 = (const void **)((char *)this + 176);
  *(_OWORD *)((char *)this + 184) = 0u;
  v9 = (const void **)((char *)this + 184);
  v70 = (const void **)((char *)this + 192);
  v71 = (uint64_t *)((char *)this + 160);
  *(_OWORD *)((char *)this + 216) = 0u;
  v66 = (const void **)((char *)this + 216);
  *((void *)this + 29) = 0;
  v67 = (const void **)((char *)this + 232);
  v68 = (const void **)((char *)this + 208);
  *(_OWORD *)((char *)this + 20nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 12nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0u;
  *((void *)this + 3nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = (char *)this + 240;
  *((void *)this + 31) = (char *)this + 240;
  *((void *)this + 32) = 0;
  QP::ParserConfiguration::updateCalendar(this);
  if (a2)
  {
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionLocaleKey))
    {
      CFLocaleRef Value = (const __CFLocale *)CFDictionaryGetValue(a2, kQPQueryParserOptionLocaleKey);
      if (CFDictionaryContainsKey(a2, kQPQueryParserOptionPreferredLanguagesKey))
      {
        CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(a2, kQPQueryParserOptionPreferredLanguagesKey);
        QP::ParserConfiguration::setLocale(this, Value, v11);
      }
      else
      {
        CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
        uint64_t v13 = (const void *)MEMORY[0x22A6233E0](Value);
        CFArrayAppendValue(Mutable, v13);
        QP::ParserConfiguration::setLocale(this, Value, Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      *((unsigned char *)this + 32) = 0;
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceCalendarRegionKey))
    {
      CFNumberRef v14 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceCalendarRegionKey);
      QP::ParserConfiguration::setCalendarRegion((const void **)this, v14);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceTimezoneKey))
    {
      v15 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceTimezoneKey);
      QP::ParserConfiguration::setCustomTimezone((const void **)this, v15);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceCalendarKey))
    {
      uint64_t v16 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceCalendarKey);
      QP::ParserConfiguration::setCustomCalendar((const void **)this, v16);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceDateKey))
    {
      CFDateRef v17 = (const __CFDate *)CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceDateKey);
      QP::ParserConfiguration::setDate(this, v17);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionContextIdentifierKey))
    {
      CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(a2, kQPQueryParserOptionContextIdentifierKey);
      QP::ParserConfiguration::setAppContext(this, v18);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionBundleIdentifierKey))
    {
      uint64_t v19 = CFDictionaryGetValue(a2, kQPQueryParserOptionBundleIdentifierKey);
      CFTypeRef v20 = CFRetain(v19);
      nlp::CFScopedPtr<__CFString const*>::reset(v9, v20);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionInternalBundleIdentifierKey))
    {
      uint64_t v21 = CFDictionaryGetValue(a2, kQPQueryParserOptionInternalBundleIdentifierKey);
      CFTypeRef v22 = CFRetain(v21);
      nlp::CFScopedPtr<__CFString const*>::reset(v70, v22);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionFormatKey))
    {
      CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a2, kQPQueryParserOptionFormatKey);
      CFNumberGetValue(v23, kCFNumberCFIndexType, v5);
    }
    int v24 = CFDictionaryContainsKey(a2, kQPQueryParserOptionIncludeRankCategoriesKey);
    v25 = (const void **)MEMORY[0x263EFFB40];
    if (v24) {
      *((unsigned char *)this + 21) = CFDictionaryGetValue(a2, kQPQueryParserOptionIncludeRankCategoriesKey) == *v25;
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreAttributedParsesKey)) {
      *((unsigned char *)this + 22) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreAttributedParsesKey);
    }
    if (CFDictionaryContainsKey(a2, @"usePartOfSpeech")) {
      *((unsigned char *)this + 29) = *v25 == CFDictionaryGetValue(a2, @"usePartOfSpeech");
    }
    if (CFDictionaryContainsKey(a2, @"waitForLoad")) {
      *((unsigned char *)this + 34) = CFDictionaryGetValue(a2, @"waitForLoad") == *v25;
    }
    if (CFDictionaryContainsKey(a2, @"waitForGetUnderstanding")) {
      *((unsigned char *)this + 35) = CFDictionaryGetValue(a2, @"waitForGetUnderstanding") == *v25;
    }
    if (CFDictionaryContainsKey(a2, @"forTesting"))
    {
      BOOL v26 = CFDictionaryGetValue(a2, @"forTesting") == *v25;
      *((unsigned char *)this + 36) = v26;
      if (v26)
      {
        if (CFDictionaryContainsKey(a2, @"meContent"))
        {
          v57 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (v57)
          {
            v58 = CFDictionaryGetValue(a2, @"meContent");
            CFDictionarySetValue(v57, @"meContent", v58);
            if (CFDictionaryGetCount(v57))
            {
              CFTypeRef v59 = CFRetain(v57);
              nlp::CFScopedPtr<__CFDictionary const*>::reset(v66, v59);
            }
            CFRelease(v57);
          }
        }
      }
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreFutureDatesKey)) {
      *((unsigned char *)this + 23) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreFutureDatesKey);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnorePastDatesKey)) {
      *((unsigned char *)this + 24) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnorePastDatesKey);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreRecurringDatesKey)) {
      *((unsigned char *)this + 25) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreRecurringDatesKey);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveDatesInFutureKey)) {
      BOOL *v6 = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveDatesInFutureKey);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveDatesInPastKey)) {
      *((unsigned char *)this + 27) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveDatesInPastKey);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveConcreteDatesKey)) {
      *((unsigned char *)this + 28) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveConcreteDatesKey);
    }
    CFURLRef v27 = (const __CFURL *)CFDictionaryGetValue(a2, kQPQueryParserOptionCustomResourceDirectoryKey);
    if (v27)
    {
      CFURLRef v28 = CFURLCopyAbsoluteURL(v27);
      CFStringRef v29 = CFURLCopyFileSystemPath(v28, kCFURLPOSIXPathStyle);
      CFURLRef v30 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v29, kCFURLPOSIXPathStyle, 1u);
      nlp::CFScopedPtr<__CFURL const*>::reset(v69, v30);
      if (v29) {
        CFRelease(v29);
      }
      if (v28) {
        CFRelease(v28);
      }
    }
    v31 = CFDictionaryGetValue(a2, @"username");
    if (v31)
    {
      CFTypeRef v32 = CFRetain(v31);
      nlp::CFScopedPtr<__CFString const*>::reset(v68, v32);
    }
    CFDictionaryRef v33 = (const __CFDictionary *)CFDictionaryGetValue(a2, kQPQueryParserOptionCustomFieldSpecifications);
    QP::ParserConfiguration::setCustomFieldSpecifications(this, v33, 0);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreSingleYearSuggestionKey)) {
      *((unsigned char *)this + 37) = *v25 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreSingleYearSuggestionKey);
    }
    v34 = CFDictionaryGetValue(a2, kQPQueryParserOptionPrivateParsingKey);
    if (v34) {
      *((unsigned char *)this + 49) = *v25 == v34;
    }
    v35 = CFDictionaryGetValue(a2, kQPQueryParserOptionEmbeddingsEnabledKey);
    if (v35) {
      *((unsigned char *)this + 5nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *v25 == v35;
    }
    uint64_t v36 = CFDictionaryGetValue(a2, kQPQueryParserOptionSeparateEmbeddingsEnabledKey);
    if (v36) {
      *((unsigned char *)this + 51) = *v25 == v36;
    }
    v37 = CFDictionaryGetValue(a2, kQPQueryParserOptionEmbeddingsSafetyDisabledKey);
    if (v37) {
      *((unsigned char *)this + 52) = *v25 == v37;
    }
    v38 = CFDictionaryGetValue(a2, @"loadAnnotations");
    if (v38) {
      *((unsigned char *)this + 54) = *v25 == v38;
    }
    uint64_t v39 = CFDictionaryGetValue(a2, kQPQueryParserOptionU2EnabledKey);
    if (v39) {
      *((unsigned char *)this + 55) = *v25 == v39;
    }
    v40 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseLLMParseKey);
    if (v40) {
      *((unsigned char *)this + 56) = *v25 == v40;
    }
    v41 = CFDictionaryGetValue(a2, @"forcePeopleSpans");
    if (v41) {
      nlp::CFScopedPtr<__CFArray const*>::acquire(v67, v41);
    }
    v42 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseECRInProcessKey);
    if (v42) {
      *((unsigned char *)this + 57) = *v25 == v42;
    }
    v43 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseECRForSpansKey);
    if (v43) {
      *((unsigned char *)this + 58) = *v25 == v43;
    }
    v44 = CFDictionaryGetValue(a2, @"useECRForInferredNames");
    if (v44) {
      *((unsigned char *)this + 59) = *v25 == v44;
    }
    v45 = CFDictionaryGetValue(a2, @"useECRForPets");
    if (v45) {
      *((unsigned char *)this + 6nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *v25 == v45;
    }
    v46 = CFDictionaryGetValue(a2, @"useAggressiveECRPersonOverrides");
    if (v46) {
      *((unsigned char *)this + 61) = *v25 == v46;
    }
    v47 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseU2InSpotlightResourcesKey);
    if (v47) {
      *((unsigned char *)this + 66) = *v25 == v47;
    }
    v48 = CFDictionaryGetValue(a2, kQPQueryParserOptionIsEntitySearchKey);
    v49 = CFDictionaryGetValue(a2, kQPQueryParserOptionEnableEntitySearchStemming);
    v50 = CFDictionaryGetValue(a2, kQPQueryParserOptionEnableEntitySearchSpellCorrect);
    if (v48)
    {
      v51 = *v25;
      *((unsigned char *)this + 62) = *v25 == v48;
      *((unsigned char *)this + 63) = v51 == v49;
      *((unsigned char *)this + 64) = v51 == v50;
    }
    v52 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseLexemeSubEntitiesKey);
    if (v52) {
      *((unsigned char *)this + 67) = *v25 == v52;
    }
    CFNumberRef v53 = (const __CFNumber *)CFDictionaryGetValue(a2, @"kMDQueryOptionEmbeddingGenerationTimeout");
    if (v53) {
      CFNumberGetValue(v53, kCFNumberIntType, (char *)this + 44);
    }
  }
  if (!*v9)
  {
    MainBundle = CFBundleGetMainBundle();
    CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
    if (Identifier) {
      v56 = (__CFString *)CFRetain(Identifier);
    }
    else {
      v56 = @"com.apple.spotlight.QueryParser";
    }
    nlp::CFScopedPtr<__CFString const*>::reset(v9, v56);
  }
  if (!*v73)
  {
    CFStringRef v60 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@", @"com.apple.query.parser");
    nlp::CFScopedPtr<__CFString const*>::reset(v73, v60);
  }
  systemListenerEnableForceLoadingAssets(*((unsigned __int8 *)this + 34));
  if (*v8)
  {
    systemListenerSetLocale(*v8, *v71);
  }
  else
  {
    *((unsigned char *)this + 32) = 1;
    CFLocaleRef v61 = copyCurrentLocale();
    CFArrayRef v62 = copyCurrentPreferredLanguages();
    systemListenerEnableAutoUpdatingLocale(1);
    QP::ParserConfiguration::setLocale(this, v61, v62);
    if (v62) {
      CFRelease(v62);
    }
    if (v61) {
      CFRelease(v61);
    }
  }
  CFStringRef v63 = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v8, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (*v72) {
    CFStringRef v64 = (const __CFString *)MEMORY[0x22A623110]();
  }
  else {
    CFStringRef v64 = 0;
  }
  if (CFStringsAreEqual(v63, @"ja") && v64 && CFStringsAreEqual(v64, @"japanese")) {
    *((unsigned char *)this + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 1;
  }
  if (*v4 == 9) {
    _DWORD *v7 = 1;
  }
  QP::ParserConfiguration::updateCalendar(this);
  return this;
}

void sub_224E0D6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, const void **a14, const void **a15, const void **a16, const void **a17, const void **a18, const void **a19, const void **a20,const void **a21,const void **a22)
{
  std::__list_imp<QP::Subscriber *>::clear(a13);
  nlp::CFScopedPtr<__CFArray const*>::reset(a16, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(v23 + 28, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(a15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a17, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(v23 + 25, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v24, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a22, 0);
  nlp::CFScopedPtr<__CFURL const*>::reset(a18, 0);
  nlp::CFScopedPtr<__CFArray const*>::reset(a20, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 18, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 17, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 16, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 14, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset(v22, 0);
  nlp::CFScopedPtr<__CFTimeZone const*>::reset(v23 + 12, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset(a21, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset(v23 + 10, 0);
  nlp::CFScopedPtr<__CFDate const*>::reset(a14, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::updateCalendar(QP::ParserConfiguration *this)
{
  uint64_t v2 = (const void **)((char *)this + 80);
  if (!*((void *)this + 10))
  {
    v3 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFCalendarIdentifier)*MEMORY[0x263EFFC90]);
    if (v3)
    {
      uint64_t v4 = v3;
      CFCalendarSetFirstWeekday(v3, 1);
      CFAllocatorRef v5 = v2;
      CFRange v6 = v4;
    }
    else
    {
      CFRange v6 = copyCurrentCalendar(*((const __CFLocale **)this + 13), 0);
      CFAllocatorRef v5 = v2;
    }
    nlp::CFScopedPtr<__CFCalendar *>::reset(v5, v6);
  }
  uint64_t v7 = (__CFCalendar *)*((void *)this + 11);
  if (v7)
  {
    CFStringRef v8 = (const __CFString *)*((void *)this + 14);
    if (v8)
    {
      CFLocaleRef v9 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8);
      CFCalendarSetLocale(*((CFCalendarRef *)this + 11), v9);
      CFRelease(v9);
    }
    else
    {
      CFLocaleRef v11 = (const __CFLocale *)*((void *)this + 13);
      if (v11) {
        CFCalendarSetLocale(v7, v11);
      }
    }
  }
  else
  {
    CFStringRef v10 = copyCurrentCalendar(*((const __CFLocale **)this + 13), *((const __CFString **)this + 14));
    nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 11, v10);
  }
  CFDateRef v12 = (const __CFDate *)*((void *)this + 9);
  QP::ParserConfiguration::setDate(this, v12);
}

uint64_t QP::ParserConfiguration::setLocale(QP::ParserConfiguration *this, const __CFLocale *a2, const __CFArray *a3)
{
  uint64_t v7 = (const void **)((char *)this + 104);
  uint64_t v6 = *((void *)this + 13);
  if (a2 && v6)
  {
    if (CFLocalesAreEqual(v6, a2)) {
      return 0;
    }
    nlp::CFScopedPtr<__CFLocale const*>::reset(v7, 0);
    goto LABEL_8;
  }
  nlp::CFScopedPtr<__CFLocale const*>::reset(v7, 0);
  if (a2)
  {
LABEL_8:
    CFTypeRef v9 = CFRetain(a2);
    nlp::CFScopedPtr<__CFLocale const*>::reset(v7, v9);
    QP::ParserConfiguration::updateCalendar(this);
  }
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, 0);
  CFStringRef v10 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (a3)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFIndex Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      CFIndex v14 = Count;
      for (CFIndex i = 0; i != v14; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, i);
        CFStringRef Copy = CFStringCreateCopy(v11, ValueAtIndex);
        CFArrayAppendValue(Mutable, Copy);
        if (Copy) {
          CFRelease(Copy);
        }
      }
    }
    nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, Mutable);
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  CFTypeRef v19 = CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x263EFFCF8]);
  CFStringRef v20 = (const __CFString *)*MEMORY[0x263EFFCB0];
  CFStringRef v21 = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
  if (!v21)
  {
    CFLocaleRef v22 = CFLocaleCopyCurrent();
    CFStringRef v21 = (const __CFString *)CFLocaleGetValue(v22, v20);
    if (v22) {
      CFRelease(v22);
    }
  }
  if (Value) {
    BOOL v23 = v19 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    CFAllocatorRef v28 = *v10;
    CFStringRef v29 = CFStringCreateWithFormat(*v10, 0, @"%@_%@", Value, v19);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 18, v29);
    CFStringRef v30 = CFStringCreateWithFormat(v28, 0, @"%@-%@", Value, v19);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, v30);
    if (!v21) {
      return 1;
    }
    CFStringRef v31 = CFStringCreateWithFormat(v28, 0, @"%@_%@_%@", Value, v19, v21);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 19, v31);
    CFStringRef v26 = CFStringCreateWithFormat(v28, 0, @"%@-%@_%@", Value, v19, v21);
    CFURLRef v27 = (const void **)((char *)this + 136);
    goto LABEL_29;
  }
  if (!Value)
  {
    if (!v21) {
      return 1;
    }
    goto LABEL_30;
  }
  CFAllocatorRef v24 = *v10;
  CFStringRef v25 = CFStringCreateCopy(*v10, Value);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, v25);
  if (v21)
  {
    CFStringRef v26 = CFStringCreateWithFormat(v24, 0, @"%@_%@", Value, v21);
    CFURLRef v27 = (const void **)((char *)this + 136);
LABEL_29:
    nlp::CFScopedPtr<__CFString const*>::reset(v27, v26);
LABEL_30:
    CFStringRef v32 = CFStringCreateCopy(*v10, v21);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 15, v32);
  }
  return 1;
}

void sub_224E0DD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::setCalendarRegion(const void **this, CFTypeRef cf)
{
  if (cf) {
    cf = CFRetain(cf);
  }
  nlp::CFScopedPtr<__CFString const*>::reset(this + 14, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setCustomTimezone(const void **this, CFTypeRef cf)
{
  if (cf) {
    cf = CFRetain(cf);
  }
  nlp::CFScopedPtr<__CFTimeZone const*>::reset(this + 12, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setCustomCalendar(const void **this, CFTypeRef cf)
{
  if (cf) {
    cf = CFRetain(cf);
  }
  nlp::CFScopedPtr<__CFCalendar *>::reset(this + 11, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setDate(QP::ParserConfiguration *this, CFDateRef otherDate)
{
  CFAllocatorRef v5 = (const void **)((char *)this + 72);
  CFDateRef v4 = (const __CFDate *)*((void *)this + 9);
  if (!otherDate || !v4 || CFDateCompare(v4, otherDate, 0))
  {
    nlp::CFScopedPtr<__CFDate const*>::reset(v5, 0);
    uint64_t v6 = *((void *)this + 11);
    if (v6)
    {
      if (!otherDate) {
        return;
      }
    }
    else
    {
      uint64_t v6 = *((void *)this + 10);
      if (!otherDate) {
        return;
      }
    }
    if (v6)
    {
      CFStringRef v7 = (const __CFString *)MEMORY[0x22A623110]();
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFTypeRef v9 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
      CFStringRef v10 = v9;
      *(void *)&at[1] = v9;
      CFTimeZoneRef v11 = (const __CFTimeZone *)*((void *)this + 12);
      if (v11)
      {
        CFCalendarSetTimeZone(v9, v11);
      }
      else
      {
        CFTimeZoneRef v12 = CFTimeZoneCopyDefault();
        *(void *)&at[0] = v12;
        CFCalendarSetTimeZone(v10, v12);
        if (v12) {
          CFRelease(v12);
        }
      }
      at[0] = MEMORY[0x22A623240](otherDate);
      unsigned int v19 = -1;
      unsigned int v17 = -1;
      unsigned int v18 = -1;
      unsigned int v15 = -1;
      unsigned int v16 = -1;
      unsigned int v14 = -1;
      CFCalendarDecomposeAbsoluteTime(v10, at[0], "dMyHms", &v19, &v18, &v17, &v16, &v15, &v14);
      CFCalendarComposeAbsoluteTime(*((CFCalendarRef *)this + 10), at, "dMyHms", v19, v18, v17, v16, v15, v14);
      CFDateRef v13 = CFDateCreate(v8, at[0]);
      nlp::CFScopedPtr<__CFDate const*>::reset(v5, v13);
      if (v10) {
        CFRelease(v10);
      }
    }
  }
}

void sub_224E0E000(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__CFTimeZone const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

BOOL QP::ParserConfiguration::setAppContext(QP::ParserConfiguration *this, CFStringRef theString)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theString);
  CFStringLowercase(MutableCopy, 0);
  if (CFStringCompare(MutableCopy, @"com.apple.mail", 1uLL)
    && CFStringCompare(MutableCopy, @"com.apple.mobilemail", 1uLL))
  {
    if (CFStringCompare(MutableCopy, @"com.apple.notes", 1uLL)
      && CFStringCompare(MutableCopy, @"com.apple.mobilenotes", 1uLL))
    {
      if (CFStringCompare(MutableCopy, @"com.apple.calendar", 1uLL)
        && CFStringCompare(MutableCopy, @"com.apple.calendarui", 1uLL)
        && CFStringCompare(MutableCopy, @"com.apple.ical.calendarquerygenius", 1uLL)
        && CFStringCompare(MutableCopy, @"com.apple.ical", 1uLL)
        && CFStringCompare(MutableCopy, @"com.apple.mobilecal", 1uLL))
      {
        if (CFStringCompare(MutableCopy, @"com.apple.finder", 1uLL)
          && CFStringCompare(MutableCopy, @"com.apple.documentsapp", 1uLL))
        {
          if (CFStringCompare(MutableCopy, @"com.apple.safari", 1uLL))
          {
            if (CFStringCompare(MutableCopy, @"com.apple.spotlight", 1uLL)
              && CFStringCompare(MutableCopy, @"com.apple.searchd", 1uLL)
              && CFStringCompare(MutableCopy, @"com.apple.pommesctl", 1uLL)
              && !CFStringHasPrefix(MutableCopy, @"com.apple.omniSearch")
              && !CFStringHasPrefix(MutableCopy, @"com.apple.intelligenceflow")
              && !CFStringHasPrefix(MutableCopy, @"com.apple.ondeviceeval"))
            {
              if (CFStringCompare(MutableCopy, @"com.apple.photos", 1uLL)
                && CFStringCompare(MutableCopy, @"com.apple.mobileslideshow", 1uLL))
              {
                if (CFStringCompare(MutableCopy, @"com.apple.reminders.parser", 1uLL))
                {
                  if (CFStringCompare(MutableCopy, @"com.apple.reminders", 1uLL))
                  {
                    if (CFStringCompare(MutableCopy, @"com.apple.queryparser", 1uLL)
                      && CFStringCompare(MutableCopy, @"com.apple.query.parser", 1uLL))
                    {
                      if (CFStringCompare(MutableCopy, @"com.apple.query.search", 1uLL))
                      {
                        CFComparisonResult v9 = CFStringCompare(MutableCopy, @"com.apple.visual-generation", 1uLL);
                        uint64_t v10 = *((void *)this + 1);
                        uint64_t v6 = (const void **)((char *)this + 176);
                        if (v9)
                        {
                          BOOL v4 = v10 != 0;
                          *((void *)this + 1) = 0;
                          CFStringRef v7 = @"com.apple.query.default";
                        }
                        else
                        {
                          BOOL v4 = v10 != 13;
                          *((void *)this + 1) = 13;
                          CFStringRef v7 = @"com.apple.visual-generation";
                        }
                      }
                      else
                      {
                        BOOL v4 = *((void *)this + 1) != 8;
                        *((void *)this + 1) = 8;
                        uint64_t v6 = (const void **)((char *)this + 176);
                        CFStringRef v7 = @"com.apple.query.search";
                      }
                    }
                    else
                    {
                      BOOL v4 = *((void *)this + 1) != 0;
                      *((void *)this + 1) = 0;
                      uint64_t v6 = (const void **)((char *)this + 176);
                      CFStringRef v7 = @"com.apple.query.parser";
                    }
                  }
                  else
                  {
                    BOOL v4 = *((void *)this + 1) != 11;
                    *((void *)this + 1) = 11;
                    uint64_t v6 = (const void **)((char *)this + 176);
                    CFStringRef v7 = @"com.apple.reminders";
                  }
                }
                else
                {
                  BOOL v4 = *((void *)this + 1) != 12;
                  *((void *)this + 1) = 12;
                  uint64_t v6 = (const void **)((char *)this + 176);
                  CFStringRef v7 = @"com.apple.reminders.parser";
                }
              }
              else
              {
                BOOL v4 = *((void *)this + 1) != 9;
                *((void *)this + 1) = 9;
                uint64_t v6 = (const void **)((char *)this + 176);
                CFStringRef v7 = @"com.apple.photos";
              }
              goto LABEL_23;
            }
            BOOL v4 = *((void *)this + 1) != 7;
            uint64_t v5 = 7;
          }
          else
          {
            BOOL v4 = *((void *)this + 1) != 5;
            uint64_t v5 = 5;
          }
        }
        else
        {
          BOOL v4 = *((void *)this + 1) != 4;
          uint64_t v5 = 4;
        }
        *((void *)this + 1) = v5;
        uint64_t v6 = (const void **)((char *)this + 176);
        CFStringRef v7 = @"com.apple.spotlight";
      }
      else
      {
        BOOL v4 = *((void *)this + 1) != 6;
        *((void *)this + 1) = 6;
        uint64_t v6 = (const void **)((char *)this + 176);
        CFStringRef v7 = @"com.apple.calendar";
      }
    }
    else
    {
      BOOL v4 = *((void *)this + 1) != 3;
      *((void *)this + 1) = 3;
      uint64_t v6 = (const void **)((char *)this + 176);
      CFStringRef v7 = @"com.apple.notes";
    }
  }
  else
  {
    BOOL v4 = *((void *)this + 1) != 2;
    *((void *)this + 1) = 2;
    uint64_t v6 = (const void **)((char *)this + 176);
    CFStringRef v7 = @"com.apple.mail";
  }
LABEL_23:
  nlp::CFScopedPtr<__CFString const*>::reset(v6, v7);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v4;
}

void sub_224E0E4B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t QP::ParserConfiguration::setIgnoreAttributedParses(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 22) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setUsePartOfSpeech(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 29) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnoreFutureDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 23) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnorePastDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 24) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnoreRecurringDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 25) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolvePastDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 26) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolveFutureDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 27) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolveConcreteDates(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 28) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

BOOL QP::ParserConfiguration::setCustomFieldSpecifications(QP::ParserConfiguration *this, const __CFDictionary *a2, int a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v6 = (CFDictionaryRef *)((char *)this + 224);
  CFDictionaryRef v5 = (const __CFDictionary *)*((void *)this + 28);
  if (a2)
  {
    if (v5)
    {
      CFIndex Count = CFDictionaryGetCount(v5);
      CFIndex v9 = CFDictionaryGetCount(a2);
      if (Count != v9) {
        return 0;
      }
      int v37 = a3;
      uint64_t v36 = (uint64_t)&v36;
      MEMORY[0x270FA5388](v9);
      unint64_t v10 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
      CFTimeZoneRef v11 = (CFTypeRef *)((char *)&v36 - v10);
      size_t v12 = (unint64_t)(8 * Count) >= 0x200 ? 512 : 8 * Count;
      bzero((char *)&v36 - v10, v12);
      MEMORY[0x270FA5388](v13);
      unsigned int v14 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      CFDictionaryGetKeysAndValues(*v6, (const void **)((char *)&v36 - v10), (const void **)((char *)&v36 - v10));
      MEMORY[0x270FA5388](v15);
      unsigned int v16 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      MEMORY[0x270FA5388](v17);
      unsigned int v18 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      CFDictionaryGetKeysAndValues(a2, (const void **)((char *)&v36 - v10), (const void **)((char *)&v36 - v10));
      if (Count < 1) {
        return 0;
      }
      while (1)
      {
        CFTypeID v19 = CFGetTypeID(*v11);
        if (v19 != CFStringGetTypeID()) {
          break;
        }
        CFTypeID v20 = CFGetTypeID(*v16);
        if (v20 != CFStringGetTypeID()) {
          break;
        }
        CFTypeID v21 = CFGetTypeID(*v14);
        if (v21 != CFDictionaryGetTypeID()) {
          break;
        }
        CFTypeID v22 = CFGetTypeID(*v18);
        if (v22 != CFDictionaryGetTypeID()
          || !CFStringsAreEqual((CFStringRef)*v11, (const __CFString *)*v16)
          || CFEqual(*v18, *v14))
        {
          break;
        }
        ++v18;
        ++v14;
        ++v16;
        ++v11;
        if (!--Count) {
          return 0;
        }
      }
      a3 = v37;
    }
    int v37 = a3;
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, 0);
    CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFIndex v26 = CFDictionaryGetCount(a2);
    uint64_t v36 = (uint64_t)&v36;
    MEMORY[0x270FA5388](v26);
    CFAllocatorRef v28 = (const void **)((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v27 >= 0x200) {
      size_t v29 = 512;
    }
    else {
      size_t v29 = v27;
    }
    bzero((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
    CFDictionaryGetKeysAndValues(a2, v28, 0);
    if (v26 >= 1)
    {
      do
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v24, 0, (CFStringRef)*v28);
        CFMutableStringRef v38 = MutableCopy;
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, MutableCopy);
        CFStringRef v32 = CFDictionaryCreateMutableCopy(v24, 0, Value);
        CFStringRef Copy = CFStringCreateCopy(v24, MutableCopy);
        CFDictionarySetValue(v32, @"ORIGINAL_TEXT", Copy);
        CFStringLowercase(MutableCopy, *((CFLocaleRef *)this + 13));
        CFDictionarySetValue(Mutable, MutableCopy, v32);
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        ++v28;
        --v26;
      }
      while (v26);
    }
    CFTypeRef v34 = CFRetain(Mutable);
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, v34);
    if (v37) {
      (*(void (**)(QP::ParserConfiguration *))(*(void *)this + 32))(this);
    }
    return 1;
  }
  else
  {
    BOOL v23 = v5 != 0;
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, 0);
    if (a3) {
      (*(void (**)(QP::ParserConfiguration *))(*(void *)this + 32))(this);
    }
  }
  return v23;
}

void sub_224E0E9D4(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t QP::ParserConfiguration::setPrivateParsing(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 49) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setEmbeddingsEnabled(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 5nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setSeparateEmbeddingsEnabled(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 51) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setAnnotationsEnabled(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 54) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setU2Enabled(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 55) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setUseLLMParse(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 56) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

unsigned char *QP::ParserConfiguration::setIsEntitySearch(unsigned char *this, const __CFBoolean *a2, const __CFBoolean *a3, const __CFBoolean *a4)
{
  CFBooleanRef v4 = (const __CFBoolean *)*MEMORY[0x263EFFB40];
  this[62] = *MEMORY[0x263EFFB40] == (void)a2;
  this[63] = v4 == a3;
  this[64] = v4 == a4;
  return this;
}

uint64_t QP::ParserConfiguration::update(QP::ParserConfiguration *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 32))();
}

void QP::ParserConfiguration::loadConfigurationResource(QP::ParserConfiguration *this, const __CFURL *a2, __CFError **a3, __CFError **a4)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  *((unsigned char *)this + 33) = 0;
  if (!a2) {
    return;
  }
  CFTypeRef cf = 0;
  CFDictionaryRef DictionaryWithContentsOfURL = (const __CFDictionary *)nlp::createDictionaryWithContentsOfURL(a2, (CFErrorRef *)&cf, a3, a4);
  CFDictionaryRef v7 = DictionaryWithContentsOfURL;
  v39[2] = DictionaryWithContentsOfURL;
  if (!cf)
  {
    if (!DictionaryWithContentsOfURL) {
      return;
    }
    if (*((void *)this + 13)) {
      uint64_t v9 = MEMORY[0x22A6233E0]();
    }
    else {
      uint64_t v9 = 0;
    }
    if (configLogger(void)::token != -1) {
      dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
    }
    unint64_t v10 = configLogger(void)::log;
    if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v9;
      __int16 v43 = 2112;
      CFURLRef v44 = a2;
      _os_log_impl(&dword_224D85000, v10, OS_LOG_TYPE_INFO, "QueryParser: loading %@ from %@", buf, 0x16u);
    }
    *((unsigned char *)this + 33) = 1;
    if (!CFDictionaryContainsKey(v7, @"Contents")) {
      goto LABEL_60;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v7, @"Contents");
    if (CFArrayGetCount(Value) != 3) {
      goto LABEL_60;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
    int v13 = CFDictionaryContainsKey(ValueAtIndex, @"Version");
    unsigned int v14 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
    if (v13)
    {
      CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Version");
      CFNumberRef v16 = CFNumberCreate(*v14, kCFNumberCFIndexType, "\b");
      v39[0] = v16;
      if (configLogger(void)::token != -1) {
        dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
      }
      uint64_t v17 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v15;
        _os_log_impl(&dword_224D85000, v17, OS_LOG_TYPE_INFO, "QueryParser: loading %@ dates version", buf, 0xCu);
      }
      if (CFNumberCompare(v15, v16, 0))
      {
        if (configLogger(void)::token != -1) {
          dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
        }
        unsigned int v18 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = (uint64_t)v16;
          _os_log_impl(&dword_224D85000, v18, OS_LOG_TYPE_INFO, "QueryParser: expected %@ dates version (error)", buf, 0xCu);
        }
        *((unsigned char *)this + 33) = 0;
      }
      if (v16) {
        CFRelease(v16);
      }
    }
    else
    {
      *((unsigned char *)this + 33) = 0;
    }
    CFDictionaryRef v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 1);
    if (CFDictionaryContainsKey(v19, @"Version"))
    {
      CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v19, @"Version");
      CFNumberRef v21 = CFNumberCreate(*v14, kCFNumberCFIndexType, "\t");
      v39[0] = v21;
      if (configLogger(void)::token != -1) {
        dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
      }
      CFTypeID v22 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v20;
        _os_log_impl(&dword_224D85000, v22, OS_LOG_TYPE_INFO, "QueryParser: loading %@ lexicon version", buf, 0xCu);
      }
      if (CFNumberCompare(v20, v21, 0))
      {
        if (configLogger(void)::token != -1) {
          dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
        }
        BOOL v23 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = (uint64_t)v21;
          _os_log_impl(&dword_224D85000, v23, OS_LOG_TYPE_INFO, "QueryParser: expected %@ lexicon version (error)", buf, 0xCu);
        }
        *((unsigned char *)this + 33) = 0;
      }
      if (v21) {
        CFRelease(v21);
      }
    }
    else
    {
      *((unsigned char *)this + 33) = 0;
    }
    CFDictionaryRef v24 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 2);
    if (CFDictionaryContainsKey(v24, @"Version"))
    {
      CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v24, @"Version");
      CFNumberRef v26 = CFNumberCreate(*v14, kCFNumberCFIndexType, &QPPARSER_MIN_RULES_VERSION);
      v39[0] = v26;
      if (configLogger(void)::token != -1) {
        dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
      }
      unint64_t v27 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v25;
        _os_log_impl(&dword_224D85000, v27, OS_LOG_TYPE_INFO, "QueryParser: loading %@ rules version", buf, 0xCu);
      }
      if (CFNumberCompare(v25, v26, 0))
      {
        if (configLogger(void)::token != -1) {
          dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
        }
        CFAllocatorRef v28 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = (uint64_t)v26;
          _os_log_impl(&dword_224D85000, v28, OS_LOG_TYPE_INFO, "QueryParser: expected %@ rules version (error)", buf, 0xCu);
        }
        *((unsigned char *)this + 33) = 0;
      }
      if (v26) {
        CFRelease(v26);
      }
    }
    else
    {
LABEL_60:
      *((unsigned char *)this + 33) = 0;
    }
    if (CFDictionaryContainsKey(v7, @"CanonicalRegions"))
    {
      CFDictionaryRef v29 = (const __CFDictionary *)CFDictionaryGetValue(v7, @"CanonicalRegions");
      QP::ParserConfiguration::setCanonicalRegions((const void **)this, v29);
    }
    if (CFDictionaryContainsKey(v7, @"EnableSuggestions"))
    {
      CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(v7, @"EnableSuggestions");
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v30, kCFNumberIntType, buf);
      int v31 = *(_DWORD *)buf;
      *((unsigned char *)this + 65) = *(_DWORD *)buf != 0;
      if (v31)
      {
        if (configLogger(void)::token != -1) {
          dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
        }
        CFStringRef v32 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v39[0]) = 0;
          _os_log_impl(&dword_224D85000, v32, OS_LOG_TYPE_INFO, "QueryParser: suggestions enabled", (uint8_t *)v39, 2u);
        }
      }
    }
    if (!CFDictionaryContainsKey(v7, @"EnableParsing")) {
      goto LABEL_81;
    }
    CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(v7, @"EnableParsing");
    *(_DWORD *)buf = 0;
    CFNumberGetValue(v33, kCFNumberIntType, buf);
    int v34 = *(_DWORD *)buf;
    *((unsigned char *)this + 48) = *(_DWORD *)buf != 0;
    if (!v34) {
      goto LABEL_81;
    }
    if (*((unsigned char *)this + 49))
    {
      if (configLogger(void)::token != -1) {
        dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
      }
      v35 = configLogger(void)::log;
      if (!os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO)) {
        goto LABEL_81;
      }
      LOWORD(v39[0]) = 0;
      uint64_t v36 = "QueryParser: private parsing enabled";
    }
    else
    {
      if (configLogger(void)::token != -1) {
        dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
      }
      v35 = configLogger(void)::log;
      if (!os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO)) {
        goto LABEL_81;
      }
      LOWORD(v39[0]) = 0;
      uint64_t v36 = "QueryParser: parsing enabled";
    }
    _os_log_impl(&dword_224D85000, v35, OS_LOG_TYPE_INFO, v36, (uint8_t *)v39, 2u);
LABEL_81:
    if (CFDictionaryContainsKey(v7, @"SpaceDelimited"))
    {
      CFNumberRef v37 = (const __CFNumber *)CFDictionaryGetValue(v7, @"SpaceDelimited");
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v37, kCFNumberIntType, buf);
      *((unsigned char *)this + 31) = *(_DWORD *)buf != 0;
    }
    if (CFDictionaryContainsKey(v7, @"ParserReversed"))
    {
      CFNumberRef v38 = (const __CFNumber *)CFDictionaryGetValue(v7, @"ParserReversed");
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v38, kCFNumberIntType, buf);
      *((unsigned char *)this + 3nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(_DWORD *)buf != 0;
    }
    goto LABEL_85;
  }
  if (configLogger(void)::token != -1) {
    dispatch_once(&configLogger(void)::token, &__block_literal_global_18);
  }
  CFAllocatorRef v8 = configLogger(void)::log;
  if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_ERROR)) {
    QP::ParserConfiguration::loadConfigurationResource((uint64_t *)&cf, v8);
  }
  CFRelease(cf);
  if (v7) {
LABEL_85:
  }
    CFRelease(v7);
}

void sub_224E0F340(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t QP::ParserConfiguration::setCanonicalRegions(const void **this, const __CFDictionary *a2)
{
  v3 = this + 25;
  nlp::CFScopedPtr<__CFDictionary const*>::reset(this + 25, 0);
  if (a2)
  {
    CFTypeRef v4 = CFRetain(a2);
    nlp::CFScopedPtr<__CFDictionary const*>::reset(v3, v4);
  }
  return 1;
}

BOOL QP::ParserConfiguration::setAppContext(QP::ParserConfiguration *this, const __CFString *a2, int a3)
{
  BOOL v5 = QP::ParserConfiguration::setAppContext(this, a2);
  if (v5 && a3) {
    (*(void (**)(QP::ParserConfiguration *))(*(void *)this + 32))(this);
  }
  return v5;
}

uint64_t QP::ParserConfiguration::setCustomResourceDirectory(QP::ParserConfiguration *this, const __CFURL *a2, int a3)
{
  if (!a2) {
    return 0;
  }
  CFDictionaryRef v7 = (const void **)((char *)this + 168);
  CFURLRef v6 = (const __CFURL *)*((void *)this + 21);
  if (v6)
  {
    CFStringRef v8 = CFURLGetString(v6);
    CFStringRef v9 = CFURLGetString(a2);
    if (CFStringsAreEqual(v8, v9)) {
      return 0;
    }
  }
  nlp::CFScopedPtr<__CFURL const*>::reset(v7, 0);
  CFURLRef v11 = CFURLGetBaseURL(a2);
  CFStringRef v12 = CFURLGetString(a2);
  CFStringRef v13 = v12;
  if (v11 && v12)
  {
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v15 = CFURLGetString(v11);
    CFStringRef v16 = CFStringCreateWithFormat(v14, 0, @"%@%@", v15, v13);
    CFURLRef v17 = CFURLCreateWithString(v14, v16, 0);
    nlp::CFScopedPtr<__CFURL const*>::reset(v7, v17);
    if (v16) {
LABEL_11:
    }
      CFRelease(v16);
  }
  else if (v12)
  {
    CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@", v12);
    CFURLRef v19 = CFURLCreateWithString(v18, v16, 0);
    nlp::CFScopedPtr<__CFURL const*>::reset(v7, v19);
    if (v16) {
      goto LABEL_11;
    }
  }
  if (a3) {
    (*(void (**)(QP::ParserConfiguration *))(*(void *)this + 32))(this);
  }
  return 1;
}

void sub_224E0F624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  CFTypeRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t QP::ParserConfiguration::setLocale(QP::ParserConfiguration *this, const __CFLocale *a2, const __CFArray *a3, int a4)
{
  uint64_t v6 = QP::ParserConfiguration::setLocale(this, a2, a3);
  if (v6)
  {
    *((unsigned char *)this + 32) = 0;
    if (a4) {
      (*(void (**)(QP::ParserConfiguration *))(*(void *)this + 32))(this);
    }
  }
  return v6;
}

BOOL QP::ParserConfiguration::setParserFormat(_DWORD *a1, int a2, int a3)
{
  int v4 = a1[4];
  if (v4 != a2)
  {
    a1[4] = a2;
    if (a3) {
      (*(void (**)(_DWORD *))(*(void *)a1 + 32))(a1);
    }
  }
  return v4 != a2;
}

void nlp::CFScopedPtr<__CFTimeZone const*>::reset(const void **a1, const void *a2)
{
  int v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void QP::ParserConfiguration::setFirstWeekDay(QP::ParserConfiguration *this, CFIndex a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = (__CFCalendar *)*((void *)this + 11);
    if (v2) {
      CFCalendarSetFirstWeekday(v2, a2);
    }
  }
}

uint64_t QP::ParserConfiguration::setUseSystemLocale(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 32) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

void nlp::CFScopedPtr<__CFArray const*>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__CFArray const*>::reset(a1, cf);
  }
}

uint64_t QP::ParserConfiguration::setEmbeddingGenerationTimeout(QP::ParserConfiguration *this, CFNumberRef number)
{
  int valuePtr = 0;
  uint64_t result = CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  if (result) {
    *((_DWORD *)this + 11) = valuePtr;
  }
  return result;
}

uint64_t QP::ParserConfiguration::setCanUseEmbeddings(uint64_t this, const __CFBoolean *a2)
{
  *(unsigned char *)(this + 53) = *MEMORY[0x263EFFB40] == (void)a2;
  return this;
}

uint64_t QP::ParserConfiguration::useEra(QP::ParserConfiguration *this)
{
  return *((unsigned __int8 *)this + 20);
}

BOOL QP::ParserConfiguration::regionValidForLanguage(QP::ParserConfiguration *this, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  if (!a4 || !a2 || !*((void *)this + 25)) {
    return 0;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (a3)
  {
    CFStringRef v8 = CFStringCreateWithFormat(v7, 0, @"%@-%@", a2, a3);
    if (!CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8)) {
      goto LABEL_16;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), v8);
  }
  else
  {
    CFStringRef v8 = CFStringCreateWithFormat(v7, 0, @"%@_%@", a2, a4);
    int v10 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8);
    CFDictionaryRef v11 = (const __CFDictionary *)*((void *)this + 25);
    if (v10)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v11, v8);
    }
    else
    {
      if (!CFDictionaryContainsKey(v11, a2)) {
        goto LABEL_16;
      }
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), a2);
    }
  }
  if (!Value
    || (CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(Value, @"ValidRegions"), (v13 = v12) == 0)
    || (v16.CFIndex length = CFArrayGetCount(v12), v16.location = 0, !CFArrayContainsValue(v13, v16, a4)))
  {
LABEL_16:
    char v14 = 1;
    if (!v8) {
      return (v14 & 1) == 0;
    }
    goto LABEL_17;
  }
  char v14 = 0;
  if (v8) {
LABEL_17:
  }
    CFRelease(v8);
  return (v14 & 1) == 0;
}

void sub_224E0F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

const void *QP::ParserConfiguration::canonicalRegionForLanguage(QP::ParserConfiguration *this, const __CFString *key, const __CFString *a3, const __CFString *a4)
{
  uint64_t result = 0;
  if (!key || !*((void *)this + 25)) {
    return result;
  }
  if (a3)
  {
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@-%@", key, a3);
    if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), v8);
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      CFDictionaryRef Value = 0;
      if (!v8) {
        goto LABEL_11;
      }
    }
    CFRelease(v8);
    goto LABEL_11;
  }
  if (!CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), key)) {
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), key);
LABEL_11:
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v10 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"Mappings");
  if (!v10 || (uint64_t result = CFDictionaryGetValue(v10, a4)) == 0)
  {
    return CFDictionaryGetValue(Value, @"CanonicalRegion");
  }
  return result;
}

void sub_224E0FB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::~ParserConfiguration(QP::ParserConfiguration *this)
{
  QP::ParserConfiguration::~ParserConfiguration(this);
  JUMPOUT(0x22A623E20);
}

{
  const void **v2;

  *(void *)this = &unk_26D831A88;
  uint64_t v2 = (const void **)((char *)this + 72);
  std::__list_imp<QP::Subscriber *>::clear((void *)this + 30);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 29, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 28, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 27, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 26, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 25, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 24, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 23, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 22, 0);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)this + 21, 0);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 18, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 17, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 14, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)this + 13, 0);
  nlp::CFScopedPtr<__CFTimeZone const*>::reset((const void **)this + 12, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 11, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 10, 0);
  nlp::CFScopedPtr<__CFDate const*>::reset(v2, 0);
}

void *QP::ParserConfiguration::Attach(void *a1, uint64_t a2)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v5 = a1[30];
  a1 += 30;
  result[1] = a1;
  result[2] = a2;
  *uint64_t result = v5;
  *(void *)(v5 + 8) = result;
  *a1 = result;
  ++a1[2];
  return result;
}

uint64_t QP::ParserConfiguration::Detach(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return std::list<QP::Subscriber *>::remove(a1 + 240, &v3);
}

uint64_t QP::ParserConfiguration::Notify(uint64_t this)
{
  uint64_t v1 = this + 240;
  for (uint64_t i = *(void *)(this + 248); i != v1; uint64_t i = *(void *)(i + 8))
    this = (*(uint64_t (**)(void))(**(void **)(i + 16) + 16))(*(void *)(i + 16));
  return this;
}

void *std::__list_imp<QP::Subscriber *>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        int v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

os_log_t ___ZL12configLoggerv_block_invoke()
{
  v0 = _nlpLoggingSubsystem();
  os_log_t result = os_log_create(v0, "QueryParserConfiguration");
  configLogger(void)::log = (uint64_t)result;
  return result;
}

uint64_t std::list<QP::Subscriber *>::remove(uint64_t a1, void *a2)
{
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  uint64_t v12 = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 == (void *)a1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      uint64_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          uint64_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            uint64_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        std::list<QP::Subscriber *>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8) {
          uint64_t v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
    uint64_t v9 = v12;
  }
  std::__list_imp<QP::Subscriber *>::clear(v11);
  return v9;
}

void sub_224E0FEEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<QP::Subscriber *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::list<QP::Subscriber *>::splice(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    uint64_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

uint64_t QP::PhotosFormatter::setParse(QP::SpotlightFormatter *this, const __CFString ***a2)
{
  if (*((unsigned char *)*a2 + 81))
  {
    QP::SpotlightFormatter::clear(this);
    QP::Formatter::clear((const void **)this);
    int v4 = (std::__shared_weak_count *)a2[1];
    CFTypeID v22 = *a2;
    BOOL v23 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    QP::Formatter::setParse((uint64_t)this, (uint64_t)&v22);
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    uint64_t v18 = 0;
    CFURLRef v19 = &v18;
    uint64_t v20 = 0x2000000000;
    int v21 = 0;
    uint64_t v5 = (uint64_t)*a2;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1174405120;
    v16[2] = ___ZN2QP15PhotosFormatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke;
    v16[3] = &unk_26D831B00;
    v16[5] = this;
    v16[6] = v5;
    uint64_t v6 = (std::__shared_weak_count *)a2[1];
    CFURLRef v17 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v16[4] = &v18;
    QP::Parse::enumerateParseAttributes(v5, (uint64_t)v16);
    int v7 = *((_DWORD *)v19 + 6);
    uint64_t v8 = v7 > 0;
    if (v7 >= 1)
    {
      QP::Formatter::setResultValue(this, kQPParseResultIsEntitySearchKey, (const void *)*MEMORY[0x263EFFB40]);
      uint64_t valuePtr = 3;
      CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
      CFNumberRef v14 = v9;
      QP::Formatter::setResultValue(this, kQPParseResultConfidenceKey, v9);
      if (v9) {
        CFRelease(v9);
      }
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    CFDictionaryRef v10 = (std::__shared_weak_count *)a2[1];
    uint64_t v12 = *a2;
    CFArrayRef v13 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = QP::SpotlightFormatter::setParse((uint64_t)this, &v12);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
  return v8;
}

void sub_224E1015C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN2QP15PhotosFormatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(QP::Formatter **)(a1 + 40);
  if (QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 1
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 2
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 3
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 4)
  {
    uint64_t v5 = **(void **)(a1 + 48);
    uint64_t v6 = *(std::__shared_weak_count **)(a2 + 8);
    uint64_t v12 = *(QP::ParseAttribute **)a2;
    CFArrayRef v13 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(QP::Formatter *, uint64_t, QP::ParseAttribute **))(*(void *)v4 + 64))(v4, v5, &v12);
    int v7 = v13;
    if (v13) {
      goto LABEL_8;
    }
  }
  else
  {
    CFStringRef v8 = **(const __CFString ***)(a1 + 48);
    uint64_t v9 = *(void *)a2;
    uint64_t v10 = *(void *)(a2 + 8);
    v11[0] = v9;
    v11[1] = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    QP::PhotosFormatter::updateEntityParseWithAttribute(v4, v8, v11);
    if (v10)
    {
      int v7 = (std::__shared_weak_count *)v10;
LABEL_8:
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_224E102DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  _Unwind_Resume(exception_object);
}

void QP::PhotosFormatter::updateEntityParseWithAttribute(QP::Formatter *a1, const __CFString *a2, uint64_t *a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v7 = *a3;
  CFStringRef v8 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  uint64_t v9 = (__CFString *)CFStringCreateWithSubstring(v6, a2, *(CFRange *)(*(void *)(v7 + 104) + 72));
  std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  uint64_t v10 = *a3;
  CFDictionaryRef v11 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  uint64_t v12 = *(const char **)(v10 + 104);
  if (v12[23] < 0) {
    uint64_t v12 = *(const char **)v12;
  }
  CFStringRef v13 = CFStringCreateWithCString(v6, v12, 0x8000100u);
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  CFStringRef v14 = kQPParseResultAttributeTypeKey;
  uint64_t v15 = *a3;
  CFRange v16 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  QP::Formatter::setParseAttribute(a1, v14, v13, *(CFRange *)(*(void *)(v15 + 104) + 72));
  std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  uint64_t v17 = *a3;
  uint64_t v18 = *(std::__shared_weak_count **)(*a3 + 112);
  if (v18 && (uint64_t v18 = std::__shared_weak_count::lock(v18)) != 0) {
    uint64_t v19 = *(void *)(v17 + 104);
  }
  else {
    uint64_t v19 = 0;
  }
  if ((*(char *)(v19 + 119) & 0x80000000) == 0)
  {
    uint64_t v20 = *(unsigned __int8 *)(v19 + 119);
    if (!v18) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v20 = *(void *)(v19 + 104);
  if (v18) {
LABEL_9:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
LABEL_10:
  if (v20)
  {
    uint64_t v21 = *a3;
    CFTypeID v22 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
    uint64_t v23 = *(void *)(v21 + 104);
    CFDictionaryRef v24 = (const char *)(v23 + 96);
    if (*(char *)(v23 + 119) < 0) {
      CFDictionaryRef v24 = *(const char **)v24;
    }
    CFStringRef v25 = CFStringCreateWithCString(v6, v24, 0x8000100u);
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    CFStringRef v26 = kQPParseResultAttributeStemKey;
    uint64_t v27 = *a3;
    CFAllocatorRef v28 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
    QP::Formatter::setParseAttribute(a1, v26, v25, *(CFRange *)(*(void *)(v27 + 104) + 72));
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    if (v25) {
      CFRelease(v25);
    }
  }
  CFDictionaryRef v29 = (QP::SpellCheckWrapper *)*((void *)a1 + 25);
  if (v29)
  {
    if (*(unsigned char *)(*((void *)a1 + 1) + 64))
    {
      CFNumberRef v30 = (const void *)QP::SpellCheckWrapper::spellCheck(v29, v9, 10);
      if (v30)
      {
        CFStringRef v31 = kQPParseResultAttributeSpellCorrectKey;
        uint64_t v32 = *a3;
        CFNumberRef v33 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
        QP::Formatter::setParseAttribute(a1, v31, v30, *(CFRange *)(*(void *)(v32 + 104) + 72));
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
      }
    }
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CFRelease(v9);
  }
}

void sub_224E10554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, const void *);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_48c37_ZTSNSt3__110shared_ptrIN2QP5ParseEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_48c37_ZTSNSt3__110shared_ptrIN2QP5ParseEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void QP::PhotosFormatter::update(QP::PhotosFormatter *this)
{
  if (!*((void *)this + 25))
  {
    uint64_t v1 = *((void *)this + 1);
    if (*(unsigned char *)(v1 + 64))
    {
      CFLocaleRef v2 = *(const __CFLocale **)(v1 + 104);
      if (v2) {
        CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
      }
      operator new();
    }
  }
  QP::Formatter::update(this);
}

void sub_224E106C0(_Unwind_Exception *a1)
{
  MEMORY[0x22A623E20](v1, 0xC400A2AC0F1);
  _Unwind_Resume(a1);
}

void QP::PhotosFormatter::updateParseWithDateAttribute(QP::Formatter *a1, const __CFString *a2, CFRange **a3)
{
  int v4 = *a3;
  location = (std::__shared_weak_count *)(*a3)[7].location;
  if (location)
  {
    CFStringRef v8 = std::__shared_weak_count::lock(location);
    if (v8)
    {
      uint64_t v9 = v8;
      CFIndex length = v4[6].length;
      if (!length)
      {
LABEL_106:
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
        return;
      }
      CFTypeRef v128 = 0;
      v129[0] = 0;
      uint64_t v123 = 0;
      v124 = (const void **)&v123;
      uint64_t v125 = 0x3002000000;
      v126 = __Block_byref_object_copy__15;
      v127 = __Block_byref_object_dispose__15;
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      CFArrayRef v122 = Mutable;
      CFArrayRef v13 = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
      CFArrayRef v121 = v13;
      CFStringRef v14 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      v120 = v14;
      uint64_t v114 = 0;
      v115 = &v114;
      uint64_t v116 = 0x3002000000;
      v117 = __Block_byref_object_copy__1_1;
      v118 = __Block_byref_object_dispose__2_1;
      CFMutableArrayRef v119 = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
      uint64_t v110 = 0;
      v111 = &v110;
      uint64_t v112 = 0x2000000000;
      v113 = @"kQPDate";
      if (QP::ParserGrammar::hasTranslations(*((void *)a1 + 3), (uint64_t)&(*a3)[3]))
      {
        CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFMutableDictionaryRef v109 = v15;
        uint64_t v17 = *(void *)(length + 120);
        CFRange v16 = *(std::__shared_weak_count **)(length + 128);
        if (v16) {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CFMutableDictionaryRef v50 = v15;
        v51 = v16;
        if (v17 && !BYTE1((*a3)[4].length))
        {
          long long v18 = *(_OWORD *)(v17 + 140);
          *(_OWORD *)__p = *(_OWORD *)(v17 + 124);
          long long v106 = v18;
          long long v107 = *(_OWORD *)(v17 + 156);
          int v108 = *(_DWORD *)(v17 + 172);
          long long v19 = *(_OWORD *)(v17 + 36);
          long long v101 = *(_OWORD *)(v17 + 20);
          long long v102 = v19;
          long long v103 = *(_OWORD *)(v17 + 52);
          int v104 = *(_DWORD *)(v17 + 68);
          long long v20 = *(_OWORD *)(v17 + 88);
          long long v97 = *(_OWORD *)(v17 + 72);
          long long v98 = v20;
          long long v99 = *(_OWORD *)(v17 + 104);
          int v100 = *(_DWORD *)(v17 + 120);
          int isEmpty = QP::DateComponents::isEmpty((QP::DateComponents *)__p);
          int v22 = *(_DWORD *)(v17 + 8);
          if (v22 > 5) {
            int v23 = isEmpty;
          }
          else {
            int v23 = 0;
          }
          if (v23 == 1)
          {
            BOOL v49 = v22 < 0x5B;
          }
          else if (v22 == 4)
          {
            BOOL v49 = (int)QP::DateComponents::componentsCount((int32x2_t *)&v101) > 1
               || (int)QP::DateComponents::componentsCount((int32x2_t *)&v97) >= 2;
            int v22 = *(_DWORD *)(v17 + 8);
          }
          else
          {
            BOOL v49 = 0;
          }
          if ((v22 - 1) <= 0x3F && ((1 << (v22 - 1)) & 0x8000000008008001) != 0
            || v22 == 102)
          {
            BOOL v49 = 1;
          }
          CFAllocatorRef v28 = (std::__shared_weak_count *)*((void *)a1 + 2);
          uint64_t v95 = *((void *)a1 + 1);
          v96 = v28;
          if (v28)
          {
            atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
            int v22 = *(_DWORD *)(v17 + 8);
          }
          QP::DateConverter::resolveDateComponentsAsRange((uint64_t)&v95, *(unsigned __int16 *)(v17 + 12), v22, &v101, &v97, (uint64_t)__p, v49);
          if (v96) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v96);
          }
          uint64_t v89 = 0;
          v90 = &v89;
          uint64_t v91 = 0x3002000000;
          v92 = __Block_byref_object_copy__1_1;
          v93 = __Block_byref_object_dispose__2_1;
          CFTypeRef v94 = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
          v87[0] = 0;
          v87[1] = v87;
          v87[2] = 0x3002000000;
          v87[3] = __Block_byref_object_copy__1_1;
          v87[4] = __Block_byref_object_dispose__2_1;
          CFTypeRef v88 = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
          v85[0] = 0;
          v85[1] = v85;
          v85[2] = 0x3002000000;
          v85[3] = __Block_byref_object_copy__15;
          v85[4] = __Block_byref_object_dispose__15;
          CFDictionaryRef v29 = (uint64_t *)*((void *)a1 + 5);
          uint64_t v83 = v17;
          v84 = v51;
          if (v51) {
            atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          CFTypeRef started = QP::DateFormatter::copyISODisplayForStartDate(v29, &v83, *(unsigned __int16 *)(v17 + 12), 0, 0, 0);
          if (v84) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v84);
          }
          v81[1] = v81;
          v81[2] = 0x3002000000;
          v81[3] = __Block_byref_object_copy__15;
          v81[4] = __Block_byref_object_dispose__15;
          CFNumberRef v30 = (uint64_t *)*((void *)a1 + 5);
          uint64_t v79 = v17;
          v80 = v51;
          v81[0] = 0;
          if (v51) {
            atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          CFTypeRef v82 = QP::DateFormatter::copyISODisplayForEndDate(v30, &v79, *(unsigned __int16 *)(v17 + 12), 0, 0, 0);
          if (v80) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v80);
          }
          uint64_t v31 = *((void *)a1 + 3);
          uint64_t v32 = *a3;
          uint64_t v33 = (uint64_t)&(*a3)[3];
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 1174405120;
          v66[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke;
          v66[3] = &unk_26D831BE0;
          v66[9] = a1;
          v66[10] = v32;
          int v34 = (std::__shared_weak_count *)a3[1];
          v67 = v34;
          if (v34) {
            atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          BOOL v78 = v49;
          v66[4] = v85;
          v66[5] = v81;
          v66[6] = &v89;
          uint64_t v68 = v17;
          v69 = v51;
          if (v51) {
            atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          long long v70 = v101;
          long long v71 = v102;
          long long v72 = v103;
          long long v74 = v97;
          long long v75 = v98;
          long long v76 = v99;
          int v73 = v104;
          int v77 = v100;
          v66[7] = v87;
          v66[8] = &v110;
          QP::ParserGrammar::translations(v31, v33, (uint64_t)v66);
          CFArrayRef v48 = Mutable;
          CFStringRef v65 = CFStringCreateWithSubstring(v11, a2, *(CFRange *)(length + 72));
          CFStringRef v47 = v65;
          QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateKey, v65, (*a3)[1]);
          CFIndex Count = CFArrayGetCount((CFArrayRef)v90[5]);
          if (Count)
          {
            CFStringRef v36 = CFStringCreateByCombiningStrings(v11, (CFArrayRef)v90[5], @" || ");
            CFStringRef v56 = v36;
            if (CFStringGetLength(v36))
            {
              v46 = v124;
              if (Count <= 1) {
                CFStringRef v37 = CFStringCreateWithFormat(v11, 0, @"%@", v36);
              }
              else {
                CFStringRef v37 = CFStringCreateWithFormat(v11, 0, @"(%@)", v36);
              }
              nlp::CFScopedPtr<__CFString const*>::reset(v46 + 5, v37);
              if (CFStringGetLength((CFStringRef)v124[5])) {
                QP::Formatter::setParseAttribute(a1, kQPParseAttributeDescriptionKey, v124[5], (*a3)[1]);
              }
              ++*((void *)a1 + 10);
            }
            if (v36) {
              CFRelease(v36);
            }
          }
          CFNumberRef v38 = (CFDateFormatterRef *)*((void *)a1 + 5);
          uint64_t v62 = v17;
          CFStringRef v63 = v51;
          if (v51) {
            atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          CFArrayRef Mutable = v48;
          uint64_t v39 = QP::DateFormatter::copyDisplayForDate(v38, &v62, v49, 0);
          CFStringRef v64 = v39;
          if (v63) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v63);
          }
          if (v39)
          {
            CFStringRef v56 = 0;
            v57 = &v56;
            uint64_t v58 = 0x3002000000;
            CFTypeRef v59 = __Block_byref_object_copy__15;
            CFStringRef v60 = __Block_byref_object_dispose__15;
            CFTypeRef cf = 0;
            v40 = *a3;
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 0x40000000;
            v55[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_33;
            v55[3] = &unk_264706618;
            v55[4] = &v56;
            v55[5] = a1;
            QP::ParseAttribute::actionsForRoot((uint64_t)v40, (uint64_t)v55);
            CFStringRef v41 = v57[5];
            if (v41)
            {
              CFStringRef v42 = CFStringCreateWithFormat(v11, 0, v41, v39);
              nlp::CFScopedPtr<__CFString const*>::reset(v129, v42);
              QP::SpotlightFormatter::addDisplay(a1, (__CFString *)v129[0], (*a3)[1]);
              CFDictionarySetValue(v14, @"kQPDisplay", v129[0]);
              v111[3] = @"kQPDateSpecial";
            }
            else
            {
              CFStringRef Copy = CFStringCreateCopy(v11, v39);
              nlp::CFScopedPtr<__CFString const*>::reset(v129, Copy);
              QP::SpotlightFormatter::addDisplay(a1, v39, (*a3)[1]);
              CFDictionarySetValue(v14, @"kQPDisplay", v39);
              CFStringRef v44 = CFStringCreateWithFormat(v11, 0, @"%d", *(unsigned __int16 *)(v17 + 12));
              CFStringRef v54 = v44;
              uint64_t v45 = *((void *)a1 + 3);
              v52[0] = MEMORY[0x263EF8330];
              v52[1] = 1174405120;
              v52[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_44;
              v52[3] = &unk_26D831C18;
              v52[6] = a1;
              v52[7] = v17;
              CFNumberRef v53 = v51;
              if (v51) {
                atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              v52[4] = &v123;
              v52[5] = &v114;
              QP::ParserGrammar::tokens(v45, @"kQPDate", v44, v39, (uint64_t)v52);
              if (v53) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v53);
              }
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v54, 0);
            }
            CFArrayRef Mutable = v48;
            _Block_object_dispose(&v56, 8);
            if (cf) {
              CFRelease(cf);
            }
            CFRelease(v39);
          }
          if (v47) {
            CFRelease(v47);
          }
          if (v69) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v69);
          }
          if (v67) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v67);
          }
          _Block_object_dispose(v81, 8);
          if (v82) {
            CFRelease(v82);
          }
          _Block_object_dispose(v85, 8);
          if (started) {
            CFRelease(started);
          }
          _Block_object_dispose(v87, 8);
          if (v88) {
            CFRelease(v88);
          }
          _Block_object_dispose(&v89, 8);
          if (v94) {
            CFRelease(v94);
          }
        }
        if (v51) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v51);
        }
        if (v50) {
          CFRelease(v50);
        }
        goto LABEL_91;
      }
      CFDictionaryRef v24 = *a3;
      std::string::basic_string[abi:ne180100]<0>(__p, "kQPDateExtension");
      BOOL v25 = QP::equals(&v24[3].location, __p);
      BOOL v26 = v25;
      if (SBYTE7(v106) < 0)
      {
        operator delete(__p[0]);
        if (!v26) {
          goto LABEL_91;
        }
      }
      else if (!v25)
      {
LABEL_91:
        if (!*(unsigned char *)(*((void *)a1 + 1) + 37)
          || (QP::DatePeriod::isSingleYearPeriod(*(QP::DatePeriod **)(length + 120)) & 1) == 0)
        {
          QP::SpotlightFormatter::addTokens(a1, @"kQPTokenDate", (const __CFArray *)v115[5]);
          QP::SpotlightFormatter::addSuggestion(a1, (__CFString *)v129[0]);
        }
        QP::SpotlightFormatter::addDescription(a1, (__CFString *)v124[5]);
        QP::SpotlightFormatter::addAttributes(a1, v14);
        QP::SpotlightFormatter::addPrimaryCategories(a1, Mutable);
        QP::SpotlightFormatter::addSecondaryCategory(a1, v13);
        _Block_object_dispose(&v110, 8);
        _Block_object_dispose(&v114, 8);
        if (v119) {
          CFRelease(v119);
        }
        if (v14) {
          CFRelease(v14);
        }
        if (v13) {
          CFRelease(v13);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        _Block_object_dispose(&v123, 8);
        if (v128) {
          CFRelease(v128);
        }
        if (v129[0]) {
          CFRelease(v129[0]);
        }
        goto LABEL_106;
      }
      CFStringRef v27 = CFStringCreateWithSubstring(v11, a2, *(CFRange *)(length + 72));
      __p[0] = (void *)v27;
      QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateExtensionKey, v27, (*a3)[1]);
      ++*((void *)a1 + 10);
      v111[3] = @"kQPDateExtension";
      if (v27) {
        CFRelease(v27);
      }
      goto LABEL_91;
    }
  }
}

void sub_224E11214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25,const void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,const void *a41,const void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  nlp::CFScopedPtr<__CFString const*>::reset(&a26, 0);
  _Block_object_dispose(&a33, 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v57 + 40), 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a41, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a42, 0);
  if (a56) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a56);
  }
  if (a54) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a54);
  }
  _Block_object_dispose(&STACK[0x200], 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)&STACK[0x228], 0);
  _Block_object_dispose(&STACK[0x240], 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)&STACK[0x268], 0);
  _Block_object_dispose(&STACK[0x270], 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)&STACK[0x298], 0);
  _Block_object_dispose(&STACK[0x2A0], 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)&STACK[0x2C8], 0);
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)&STACK[0x398], 0);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose((const void *)(v58 - 240), 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v58 - 200), 0);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)(v58 - 192), 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v58 - 184), 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v58 - 176), 0);
  _Block_object_dispose((const void *)(v58 - 168), 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v58 - 128), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v58 - 120), 0);
  std::__shared_weak_count::__release_shared[abi:ne180100](v56);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *(void *)(result + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v2;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__1_1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  *(void *)(result + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v2;
  return result;
}

void __Block_byref_object_dispose__2_1(uint64_t a1)
{
}

uint64_t QP::DateComponents::componentsCount(int32x2_t *this)
{
  int v1 = this[1].i32[1];
  BOOL v2 = v1 >= 0;
  if (v1 < 0) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (this[2].i32[0] < 0) {
    int v3 = v2;
  }
  v4.i32[0] = this[2].i32[1];
  v4.i32[1] = this[1].i32[0];
  v4.u64[1] = (unint64_t)vrev64_s32(*this);
  v5.i64[0] = -1;
  v5.i64[1] = -1;
  int32x4_t v6 = (int32x4_t)vandq_s8((int8x16_t)vcgtq_s32(v4, v5), (int8x16_t)xmmword_224E1ED70);
  v6.i32[0] = vaddvq_s32(v6) & 0xF;
  *(int8x8_t *)v6.i8 = vcnt_s8(*(int8x8_t *)v6.i8);
  v6.i16[0] = vaddlv_u8(*(uint8x8_t *)v6.i8);
  return v6.i32[0] + (this[4].i32[0] >= 0) + (this[5].i32[1] >= 0) + (this[6].i32[0] >= 0) + v3;
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = 0;
  CFStringRef v60 = &v59;
  uint64_t v61 = 0x2000000000;
  char v62 = 0;
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 1174405120;
  v39[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2;
  void v39[3] = &unk_26D831B70;
  uint64_t v44 = v5;
  uint64_t v45 = v4;
  int32x4_t v6 = *(std::__shared_weak_count **)(a1 + 88);
  v46 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v58 = *(unsigned char *)(a1 + 216);
  long long v40 = *(_OWORD *)(a1 + 32);
  uint64_t v41 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 104);
  uint64_t v47 = a2;
  uint64_t v48 = v8;
  BOOL v49 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v9 = *(_OWORD *)(a1 + 128);
  long long v50 = *(_OWORD *)(a1 + 112);
  long long v51 = v9;
  long long v52 = *(_OWORD *)(a1 + 144);
  int v10 = *(_DWORD *)(a1 + 160);
  long long v54 = *(_OWORD *)(a1 + 164);
  long long v55 = *(_OWORD *)(a1 + 180);
  long long v56 = *(_OWORD *)(a1 + 196);
  int v11 = *(_DWORD *)(a1 + 212);
  int v53 = v10;
  int v57 = v11;
  uint64_t v42 = *(void *)(a1 + 56);
  __int16 v43 = &v59;
  QP::ParseAttribute::actionsForRoot(v4, (uint64_t)v39);
  if (!*((unsigned char *)v60 + 24))
  {
    uint64_t v12 = *(void *)(v5 + 24);
    CFArrayRef v13 = (void **)(*(void *)(a1 + 80) + 48);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 1174405120;
    v22[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_16;
    v22[3] = &unk_26D831BA8;
    char v38 = *(unsigned char *)(a1 + 216);
    long long v23 = *(_OWORD *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v26 = v5;
    uint64_t v27 = a2;
    uint64_t v24 = v14;
    CFMutableDictionaryRef v15 = *(std::__shared_weak_count **)(a1 + 104);
    uint64_t v28 = *(void *)(a1 + 96);
    CFDictionaryRef v29 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v16 = *(_OWORD *)(a1 + 128);
    long long v30 = *(_OWORD *)(a1 + 112);
    long long v31 = v16;
    long long v32 = *(_OWORD *)(a1 + 144);
    long long v17 = *(_OWORD *)(a1 + 180);
    long long v34 = *(_OWORD *)(a1 + 164);
    int v18 = *(_DWORD *)(a1 + 160);
    long long v35 = v17;
    long long v36 = *(_OWORD *)(a1 + 196);
    int v19 = *(_DWORD *)(a1 + 212);
    int v33 = v18;
    int v37 = v19;
    uint64_t v25 = *(void *)(a1 + 56);
    QP::ParserGrammar::actions(v12, v13, (unsigned __int16)kQPSymbolIdDefault, (unsigned __int16)kQPSymbolIdActionDefault, (uint64_t)v22);
    int v20 = *(_DWORD *)(*(void *)(a1 + 96) + 16);
    if (v20 == 1)
    {
      uint64_t v21 = @"kQPDateDistantPast";
    }
    else
    {
      if (v20 != 2) {
        goto LABEL_13;
      }
      uint64_t v21 = @"kQPDateDistantFuture";
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v21;
LABEL_13:
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
  }
  if (v49) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v49);
  }
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  _Block_object_dispose(&v59, 8);
}

void sub_224E11840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,std::__shared_weak_count *a47,uint64_t a48,uint64_t a49,std::__shared_weak_count *a50)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  if (a50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a50);
  }
  if (a47) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a47);
  }
  _Block_object_dispose((const void *)(v50 - 80), 8);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(v6 + 24);
  long long v9 = (void **)(v7 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1174405120;
  v15[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3;
  v15[3] = &unk_26D831B38;
  char v30 = *(unsigned char *)(a1 + 224);
  long long v16 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v19 = v6;
  uint64_t v17 = v10;
  long long v20 = *(_OWORD *)(a1 + 96);
  int v11 = *(std::__shared_weak_count **)(a1 + 112);
  uint64_t v21 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v12 = *(_OWORD *)(a1 + 136);
  long long v22 = *(_OWORD *)(a1 + 120);
  long long v23 = v12;
  long long v24 = *(_OWORD *)(a1 + 152);
  int v13 = *(_DWORD *)(a1 + 168);
  long long v26 = *(_OWORD *)(a1 + 172);
  long long v27 = *(_OWORD *)(a1 + 188);
  long long v28 = *(_OWORD *)(a1 + 204);
  int v14 = *(_DWORD *)(a1 + 220);
  int v25 = v13;
  int v29 = v14;
  long long v18 = *(_OWORD *)(a1 + 56);
  QP::ParserGrammar::actions(v8, v9, a2, a3, (uint64_t)v15);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

void sub_224E11998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  CFStringRef CFStringFromString = QP::createCFStringFromString(a2);
  CFStringRef v18 = CFStringFromString;
  if (*(unsigned char *)(a1 + 208))
  {
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFStringRef *)(a1 + 80), CFStringFromString, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    CFStringRef v17 = v5;
    CFArrayRef v6 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v19.CFIndex length = CFArrayGetCount(v6);
    v19.location = 0;
    if (!CFArrayContainsValue(v6, v19, v5)) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 8);
    CFDateRef v9 = *(const __CFDate **)(v7 + 72);
    uint64_t v8 = *(__CFCalendar **)(v7 + 80);
    int v10 = *(unsigned __int16 *)(*(void *)(a1 + 88) + 12);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_4;
    v16[3] = &unk_2647065C8;
    v16[4] = *(void *)(a1 + 56);
    QP::enumerateQueryWithAction(v8, v9, CFStringFromString, 0, v10, (unsigned int *)(a1 + 104), (unsigned int *)(a1 + 156), (uint64_t)v16);
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v12 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @" && ");
    CFStringRef v17 = v12;
    if (CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) < 2)
    {
      CFArrayRef v15 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v21.CFIndex length = CFArrayGetCount(v15);
      v21.location = 0;
      if (!CFArrayContainsValue(v15, v21, v12)) {
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
      }
    }
    else
    {
      CFStringRef v13 = CFStringCreateWithFormat(v11, 0, @"(%@)", v12);
      CFArrayRef v14 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v20.CFIndex length = CFArrayGetCount(v14);
      v20.location = 0;
      if (!CFArrayContainsValue(v14, v20, v13)) {
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
      }
      if (v13) {
        CFRelease(v13);
      }
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    if (v12) {
      CFRelease(v12);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
}

void sub_224E11C38(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_4(uint64_t a1, const void *a2)
{
  CFArrayRef v4 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7.CFIndex length = CFArrayGetCount(v4);
  v7.location = 0;
  if (!CFArrayContainsValue(v4, v7, a2))
  {
    CFStringRef v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CFArrayAppendValue(v5, a2);
  }
}

uint64_t __copy_helper_block_e8_88c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE104156(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 96);
  *(void *)(result + 88) = *(void *)(a2 + 88);
  *(void *)(result + 96) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_88c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE104c25_ZTSN2QP14DateComponentsE156c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 96);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void *__copy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE104c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE120172(void *result, void *a2)
{
  uint64_t v2 = a2[11];
  result[10] = a2[10];
  result[11] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[14];
  result[13] = a2[13];
  result[14] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE104c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE120c25_ZTSN2QP14DateComponentsE172c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 112);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 88);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  CFStringRef CFStringFromString = QP::createCFStringFromString(a2);
  CFStringRef v18 = CFStringFromString;
  if (*(unsigned char *)(a1 + 200))
  {
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFStringRef *)(a1 + 72), CFStringFromString, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    CFStringRef v17 = v5;
    CFArrayRef v6 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v19.CFIndex length = CFArrayGetCount(v6);
    v19.location = 0;
    if (!CFArrayContainsValue(v6, v19, v5)) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 8);
    CFDateRef v9 = *(const __CFDate **)(v7 + 72);
    uint64_t v8 = *(__CFCalendar **)(v7 + 80);
    int v10 = *(unsigned __int16 *)(*(void *)(a1 + 80) + 12);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_17;
    v16[3] = &unk_2647065F0;
    v16[4] = *(void *)(a1 + 56);
    QP::enumerateQueryWithAction(v8, v9, CFStringFromString, 0, v10, (unsigned int *)(a1 + 96), (unsigned int *)(a1 + 148), (uint64_t)v16);
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v12 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @" && ");
    CFStringRef v17 = v12;
    if (CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) < 2)
    {
      CFArrayRef v15 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v21.CFIndex length = CFArrayGetCount(v15);
      v21.location = 0;
      if (!CFArrayContainsValue(v15, v21, v12)) {
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
      }
    }
    else
    {
      CFStringRef v13 = CFStringCreateWithFormat(v11, 0, @"(%@)", v12);
      CFArrayRef v14 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v20.CFIndex length = CFArrayGetCount(v14);
      v20.location = 0;
      if (!CFArrayContainsValue(v14, v20, v13)) {
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
      }
      if (v13) {
        CFRelease(v13);
      }
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    if (v12) {
      CFRelease(v12);
    }
  }
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
}

void sub_224E12044(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_17(uint64_t a1, const void *a2)
{
  CFArrayRef v4 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7.CFIndex length = CFArrayGetCount(v4);
  v7.location = 0;
  if (!CFArrayContainsValue(v4, v7, a2))
  {
    CFStringRef v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CFArrayAppendValue(v5, a2);
  }
}

uint64_t __copy_helper_block_e8_80c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE96148(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 88);
  *(void *)(result + 8nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(void *)(a2 + 80);
  *(void *)(result + 88) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_80c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE96c25_ZTSN2QP14DateComponentsE148c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 88);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void *__copy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE96c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE112164(void *result, void *a2)
{
  uint64_t v2 = a2[11];
  result[10] = a2[10];
  result[11] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[13];
  result[12] = a2[12];
  result[13] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE96c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE112c25_ZTSN2QP14DateComponentsE164c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 104);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 88);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_33(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (QP::ParserGrammar::hasSuggestion(*(QP::ParserGrammar **)(v6 + 24), kQPParseAttributeDateKey, a2, a3))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      QP::ParserGrammar::suggestion(*(QP::ParserGrammar **)(v6 + 24), kQPParseAttributeDateKey, a2, a3, &__p);
      CFStringRef CFStringFromString = QP::createCFStringFromString((uint64_t)&__p);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v7 + 40), CFStringFromString);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_224E12290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_44(void *a1, const void *a2, int a3, CFStringRef str, const __CFString *a5)
{
  uint64_t v8 = a1[6];
  IntCFDictionaryRef Value = CFStringGetIntValue(str);
  int v10 = *(CFDateFormatterRef **)(v8 + 40);
  CFAllocatorRef v11 = (std::__shared_weak_count *)a1[8];
  uint64_t v30 = a1[7];
  long long v31 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFStringRef v12 = QP::DateFormatter::copyDisplayForDate(v10, (uint64_t)&v30, IntValue, 1u, 0, 0);
  long long v32 = v12;
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v29 = Mutable;
  CFArrayRef v15 = *(uint64_t **)(v8 + 40);
  long long v16 = (std::__shared_weak_count *)a1[8];
  uint64_t v26 = a1[7];
  long long v27 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFTypeRef started = QP::DateFormatter::copyISODisplayForStartDate(v15, &v26, IntValue, 0, 1, 0);
  long long v28 = started;
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  CFStringRef v18 = *(uint64_t **)(v8 + 40);
  CFRange v19 = (std::__shared_weak_count *)a1[8];
  uint64_t v23 = a1[7];
  long long v24 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFRange v20 = QP::DateFormatter::copyISODisplayForEndDate(v18, &v23, IntValue, 0, 1, 0);
  int v25 = v20;
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (a5)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v13, 0, a5);
    v33.CFIndex length = CFStringGetLength(MutableCopy);
    v33.location = 0;
    CFStringFindAndReplace(MutableCopy, @"%1@", started, v33, 0);
    v34.CFIndex length = CFStringGetLength(MutableCopy);
    v34.location = 0;
    CFStringFindAndReplace(MutableCopy, @"%2@", v20, v34, 0);
    CFDictionarySetValue(Mutable, @"QUERY", MutableCopy);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  else
  {
    long long v22 = *(const void **)(*(void *)(a1[4] + 8) + 40);
    if (v22) {
      CFDictionarySetValue(Mutable, @"QUERY", v22);
    }
  }
  CFDictionarySetValue(Mutable, @"TOKEN", a2);
  CFDictionarySetValue(Mutable, @"TEXT", v12);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[5] + 8) + 40), Mutable);
  if (v20) {
    CFRelease(v20);
  }
  if (started) {
    CFRelease(started);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v12) {
    CFRelease(v12);
  }
}

void sub_224E12540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va3, a5);
  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, const void *);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  va_copy(va2, va1);
  int v10 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFStringRef v12 = va_arg(va3, const void *);
  uint64_t v14 = va_arg(va3, void);
  uint64_t v15 = va_arg(va3, void);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va3, 0);
  _Unwind_Resume(a1);
}

void QP::PhotosFormatter::~PhotosFormatter(QP::PhotosFormatter *this)
{
  QP::PhotosFormatter::~PhotosFormatter(this);
  JUMPOUT(0x22A623E20);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26D831C58;
  uint64_t v2 = *((void *)this + 25);
  *((void *)this + 25) = 0;
  if (v2) {
    MEMORY[0x22A623E20](v2, 0xC400A2AC0F1);
  }
  QP::SpotlightFormatter::~SpotlightFormatter((const void **)this);
}

uint64_t QP::DatePeriod::isSingleYearPeriod(QP::DatePeriod *this)
{
  uint64_t result = QP::DateComponents::isYearOnly((QP::DatePeriod *)((char *)this + 20));
  if (result)
  {
    uint64_t result = QP::DateComponents::isEmpty((QP::DatePeriod *)((char *)this + 124));
    if (result)
    {
      uint64_t result = QP::DateComponents::isEmpty((QP::DatePeriod *)((char *)this + 72));
      if (result)
      {
        int v3 = *((_DWORD *)this + 4);
        return !v3 || v3 == 3;
      }
    }
  }
  return result;
}

uint64_t QP::DateComponents::isYearOnly(QP::DateComponents *this)
{
  if ((*((_DWORD *)this + 5) & 0x80000000) == 0
    && (*((_DWORD *)this + 3) & 0x80000000) != 0
    && (*((_DWORD *)this + 8) & 0x80000000) != 0
    && (*((_DWORD *)this + 4) & 0x80000000) != 0
    && (*((_DWORD *)this + 6) & 0x80000000) != 0
    && (*((_DWORD *)this + 2) & 0x80000000) != 0
    && (*((_DWORD *)this + 1) & 0x80000000) != 0
    && (*(_DWORD *)this & 0x80000000) != 0
    && (*((_DWORD *)this + 7) & 0x80000000) != 0
    && (*((_DWORD *)this + 11) & 0x80000000) != 0
    && (*((_DWORD *)this + 10) & 0x80000000) != 0
    && (*((_DWORD *)this + 9) & 0x80000000) != 0)
  {
    return *((_DWORD *)this + 12) >> 31;
  }
  else
  {
    return 0;
  }
}

CFStringRef copyLocalizedString(__CFBundle *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  return copyLocalizedStringForDomain((unint64_t)a1, 0, a2, a3, a4);
}

CFStringRef copyLocalizedStringForDomain(unint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v10 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x263EFFB08], @"/System/Library/PrivateFrameworks/QueryParser.framework", 0);
  if (v10)
  {
    CFURLRef v11 = v10;
    CFBundleRef v12 = CFBundleCreate(v9, v10);
    if (a1 | (unint64_t)v12)
    {
      CFAllocatorRef v13 = v12;
      if (CFBundleGetLocalizationInfoForLocalization())
      {
        CFStringRef v14 = a2 ? CFStringCreateWithFormat(v9, 0, @"%@%@", a2, a3, 0, 0) : (CFStringRef)CFRetain(a3);
        CFStringRef v16 = v14;
        if (v14)
        {
          uint64_t v17 = CFBundleCopyLocalizationForLocalizationInfo();
          if (v17)
          {
            CFStringRef v18 = (const void *)v17;
            if (a1)
            {
              CFStringRef v19 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v19)
              {
                CFStringRef v15 = v19;
                if (!CFStringsAreEqual(v19, a4)) {
                  goto LABEL_30;
                }
                CFRelease(v15);
              }
            }
            if (v13)
            {
              CFStringRef v20 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v20)
              {
                CFStringRef v15 = v20;
                if (!CFStringsAreEqual(v20, a4)) {
                  goto LABEL_30;
                }
                CFRelease(v15);
              }
            }
            CFRelease(v18);
          }
          CFStringRef v18 = (const void *)CFBundleCopyLocalizationForLocalizationInfo();
          if (v18)
          {
            if (a1)
            {
              CFStringRef v21 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v21)
              {
                CFStringRef v15 = v21;
                if (!CFStringsAreEqual(v21, a4)) {
                  goto LABEL_30;
                }
                CFRelease(v15);
              }
            }
            if (v13)
            {
              CFStringRef v22 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              CFStringRef v15 = v22;
              if (!v22 || !CFStringsAreEqual(v22, a4))
              {
LABEL_30:
                CFRelease(v18);
                CFRelease(v16);
                if (!v13) {
                  goto LABEL_34;
                }
                goto LABEL_33;
              }
              CFRelease(v15);
            }
          }
          CFStringRef v15 = 0;
          goto LABEL_30;
        }
      }
      CFStringRef v15 = 0;
      if (v13) {
LABEL_33:
      }
        CFRelease(v13);
    }
    else
    {
      CFStringRef v15 = 0;
    }
LABEL_34:
    CFRelease(v11);
    return v15;
  }
  return 0;
}

void sub_224E13CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

id createStringFromSet(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v7 count])
  {
    id v22 = v8;
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v9, *(void *)(*((void *)&v23 + 1) + 8 * i));
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    CFStringRef v18 = NSString;
    CFStringRef v19 = [v11 componentsJoinedByString:v10];
    id v8 = v22;
    CFStringRef v20 = objc_msgSend(v18, "stringWithFormat:", v22, v19);
  }
  else
  {
    CFStringRef v20 = 0;
  }

  return v20;
}

id getAccountsManagerInstance()
{
  if (getAccountsManagerInstance_onceToken != -1) {
    dispatch_once(&getAccountsManagerInstance_onceToken, &__block_literal_global_104);
  }
  v0 = (void *)getAccountsManagerInstance_instance;
  return v0;
}

void __getAccountsManagerInstance_block_invoke()
{
  uint64_t v0 = +[QPAccountsManager sharedAccountsManager];
  uint64_t v1 = (void *)getAccountsManagerInstance_instance;
  getAccountsManagerInstance_instance = v0;
}

void *getContentsArray()
{
  uint64_t v0 = getAccountsManagerInstance();
  uint64_t v1 = [v0 contentsArray];

  return v1;
}

void *getMeCardData()
{
  uint64_t v0 = getAccountsManagerInstance();
  uint64_t v1 = [v0 meCard];

  return v1;
}

void __initEntitlements_block_invoke()
{
  uint64_t v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    uint64_t v1 = v0;
    CFErrorRef error = 0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.accounts.allaccounts", &error);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      sPrivateAccountsEntitlement = v5;
      CFRelease(v3);
    }
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
    }
    CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.contacts", &error);
    if (v6)
    {
      CFBooleanRef v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      sPrivateContactsEntitlement = v9;
      CFRelease(v7);
    }
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
    }
    if (!sPrivateContactsEntitlement)
    {
      CFBooleanRef v10 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.Contacts.database-allow", &error);
      if (v10)
      {
        CFBooleanRef v11 = v10;
        CFTypeID v12 = CFGetTypeID(v10);
        BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
        sPrivateContactsEntitlement = v13;
        CFRelease(v11);
      }
      if (error)
      {
        CFRelease(error);
        CFErrorRef error = 0;
      }
    }
    CFRelease(v1);
  }
}

void __accountsLogger_block_invoke()
{
  uint64_t v0 = _nlpLoggingSubsystem();
  os_log_t v1 = os_log_create(v0, "QueryParserAccountsManager");
  CFBooleanRef v2 = (void *)accountsLogger_log;
  accountsLogger_log = (uint64_t)v1;
}

void QPDataDetectorsEnumerateDatesInString(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  CFBooleanRef v6 = getParser();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __QPDataDetectorsEnumerateDatesInString_block_invoke;
  v8[3] = &unk_264706668;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateDatesInString:a1 options:a2 withBlock:v8];
}

void sub_224E149D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id getParser(void)
{
  if (getParser(void)::dateDetectorsParserOnceToken != -1) {
    dispatch_once(&getParser(void)::dateDetectorsParserOnceToken, &__block_literal_global_20);
  }
  uint64_t v0 = (void *)getParser(void)::sDDParser;
  return v0;
}

uint64_t __QPDataDetectorsEnumerateDatesInString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7) {
    *a5 = 1;
  }
  return result;
}

void QPDataDetectorsEnumerateEntitiesInString(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  CFBooleanRef v6 = getParser();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __QPDataDetectorsEnumerateEntitiesInString_block_invoke;
  v8[3] = &unk_264706690;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateEntitiesInString:a1 options:a2 withBlock:v8];
}

void sub_224E14B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __QPDataDetectorsEnumerateEntitiesInString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v8) {
    *a6 = 1;
  }
  return result;
}

void ___ZL9getParserv_block_invoke()
{
  uint64_t v0 = objc_alloc_init(QPDataDetectorsParser);
  os_log_t v1 = (void *)getParser(void)::sDDParser;
  getParser(void)::sDDParser = (uint64_t)v0;
}

uint64_t llmIntentLabel(uint64_t a1)
{
  return [(id)kIntentLLMLabels objectAtIndex:a1];
}

uint64_t llmIntentArgLabel(uint64_t a1)
{
  return [(id)kIntentLLMArgLabels objectAtIndex:a1];
}

uint64_t getEnumValueFromIntentString(uint64_t a1)
{
  os_log_t v1 = [(id)intentNameToEnumMapping objectForKeyedSubscript:a1];
  CFBooleanRef v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_224E14C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getEnumValueFromIntentArgString(uint64_t a1)
{
  os_log_t v1 = [(id)argNameToEnumMapping objectForKeyedSubscript:a1];
  CFBooleanRef v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_224E14CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL nlp::BurstTrieAdd(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 2080) || (*(unsigned char *)(a1 + 2064) & 1) != 0) {
    return 0;
  }
  int v5 = 0;
  int v22 = 0;
  int v6 = a3 - 1;
  if ((a3 - 1) <= 0x3FE)
  {
    int v7 = a4;
    if (a4)
    {
      uint64_t v9 = 0;
      CFBooleanRef v10 = (int *)a1;
      while (1)
      {
        uint64_t v11 = *(void *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1];
        if ((v11 & 3) != 1) {
          break;
        }
        CFBooleanRef v10 = (int *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
        if (a3 == ++v9)
        {
          int v12 = *v10;
          int *v10 = a4;
          if (!v12) {
            goto LABEL_17;
          }
LABEL_18:
          int v5 = 1;
          return v5 != 0;
        }
      }
      if ((v11 & 3) != 2)
      {
        uint64_t v17 = (unsigned __int8 *)(a2 + v9);
        CFStringRef v18 = (const void *)(a2 + v9 + 1);
        unsigned int v19 = v6 - v9;
        size_t v20 = (v6 - v9);
        unint64_t v21 = (unint64_t)malloc_type_calloc(1uLL, v20 + 15, 0x64AF1970uLL);
        memcpy((void *)(v21 + 14), v18, v20);
        *(unsigned char *)(v21 + 14 + v19) = 0;
        *(_WORD *)(v21 + 12) = v19;
        *(_DWORD *)(v21 + 8) = v7;
        *(void *)unint64_t v21 = 0;
        *(void *)&v10[2 * *v17 + 1] = v21 | 2;
        goto LABEL_17;
      }
      long long v23 = (unsigned __int16 *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
      unsigned int v14 = nlp::addListNode(a1, &v23, a2, a3, (int)v9 + 1, a4, &v22);
      unint64_t v15 = (unint64_t)v23;
      if (v14 >= *(_DWORD *)(a1 + 2088))
      {
        unint64_t v15 = (unint64_t)nlp::burstLevel(a1, v23, &v22);
        uint64_t v16 = 1;
      }
      else
      {
        uint64_t v16 = 2;
      }
      int v5 = v22;
      *(void *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1] = v16 | v15;
      if (v5 == 2)
      {
LABEL_17:
        ++*(_DWORD *)(a1 + 2060);
        goto LABEL_18;
      }
    }
  }
  return v5 != 0;
}

uint64_t nlp::TrieCompletionGetCompletion(uint64_t a1)
{
  if (a1) {
    return a1 + 20;
  }
  else {
    return 0;
  }
}

uint64_t nlp::TrieCompletionGetLength(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t nlp::TrieCompletionGetPayload(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

double nlp::BurstTrieCreateMutable(nlp *this)
{
  return nlp::BurstTrieCreateMutableWithOptions(64, 0);
}

double nlp::BurstTrieCreateMutableWithOptions(int a1, int a2)
{
  CFTypeID v4 = (char *)malloc_type_calloc(1uLL, 0x838uLL, 0x105004014637929uLL);
  if (v4)
  {
    double result = 0.0;
    *(_OWORD *)(v4 + 206nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0u;
    *((_DWORD *)v4 + 519) = 1;
    *((void *)v4 + 26nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
    *(void *)(v4 + 2092) = 0x200000000;
    *((_DWORD *)v4 + 516) = a2;
    *((_DWORD *)v4 + 522) = a1;
  }
  return result;
}

void nlp::BurstTrieRelease(char *a1)
{
  if (a1)
  {
    int v2 = *((_DWORD *)a1 + 519) - 1;
    *((_DWORD *)a1 + 519) = v2;
    if (!v2)
    {
      uint64_t v3 = (void *)*((void *)a1 + 260);
      if (v3)
      {
        if (*((_DWORD *)a1 + 523)) {
          munmap(v3, *(void *)(a1 + 2068));
        }
      }
      else if (a1[2064])
      {
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>((uint64_t)a1);
      }
      else
      {
        nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>((uint64_t)a1);
      }
      free(a1);
    }
  }
}

void nlp::BurstTrieSearch(nlp *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  v18[4] = *MEMORY[0x263EF8340];
  if (a6 < 0)
  {
    unint64_t v15 = 0xFFFFFFFF00000003;
    int v16 = 0;
    uint64_t v17 = a4;
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v18, a5);
    nlp::searchWithContext(a1, a2, a3, 0, (uint64_t)&v15);
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::~__value_func[abi:ne180100](v18);
  }
  else
  {
    CursorWithBytes = (nlp *)nlp::BurstTrieCreateCursorWithBytes((uint64_t)a1, (unsigned __int8 *)a2, a3);
    if (CursorWithBytes)
    {
      int v12 = CursorWithBytes;
      BOOL v13 = operator new(0x20uLL);
      void *v13 = &unk_26D831EC8;
      v13[1] = a2;
      *((_DWORD *)v13 + 4) = a3;
      v13[3] = a5;
      v14[3] = v13;
      nlp::BurstTrieTraverseFromCursor(v12, 0, (uint64_t)v14, a6);
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v14);
      free(v12);
    }
  }
}

void sub_224E15108(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

nlp *nlp::searchWithContext(nlp *result, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  if (a3 <= 0x3FF)
  {
    uint64_t v9 = (uint64_t)result;
    CFBooleanRef v10 = nlp::sharedBuffer(result);
    memcpy(v10, a2, a3);
    v10[a3] = 0;
    uint64_t v11 = *(void *)(v9 + 2080);
    int v12 = *(_DWORD *)(v9 + 2064);
    if (v11)
    {
      uint64_t v13 = (*(_DWORD *)(v11 + 4) & 0xFFFFFFFC) + v11;
      if (v12)
      {
        unsigned int v14 = v18;
        v18[0] = &unk_26D831DB0;
        v18[1] = nlp::containsKey;
        v18[3] = v18;
        nlp::searchDiskLevelRanked(v9, v13, v10, a3, 0, a4, a5, (uint64_t)v18);
      }
      else
      {
        unsigned int v14 = v17;
        v17[0] = &unk_26D831DB0;
        v17[1] = nlp::containsKey;
        v17[3] = v17;
        nlp::searchDiskLevel(v9, v13, v10, a3, 0, a4, a5, (uint64_t)v17);
      }
    }
    else if (v12)
    {
      unsigned int v14 = v16;
      v16[0] = &unk_26D831DB0;
      v16[1] = nlp::containsKey;
      v16[3] = v16;
      nlp::searchLevelRanked(v9, v10, a3, 0, a4, a5, (uint64_t)v16);
    }
    else
    {
      unsigned int v14 = v15;
      v15[0] = &unk_26D831DB0;
      v15[1] = nlp::containsKey;
      v15[3] = v15;
      nlp::searchLevel((int *)v9, v10, a3, 0, a4, a5, (uint64_t)v15);
    }
    return (nlp *)std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v14);
  }
  return result;
}

void sub_224E1534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

void *nlp::BurstTrieCreateCursorWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  int v6 = malloc_type_calloc(0x28uLL, 1uLL, 0xB69D8915uLL);
  if (!nlp::BurstTrieSetCursorWithBytes(a1, (uint64_t)v6, a2, a3) && v6)
  {
    free(v6);
    return 0;
  }
  return v6;
}

nlp *nlp::BurstTrieTraverseFromCursor(nlp *result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (result)
  {
    int v7 = result;
    double result = (nlp *)nlp::sharedBuffer(result);
    uint64_t v8 = (uint64_t)result;
    char v16 = 0;
    int v9 = *((_DWORD *)v7 + 7);
    if (v9)
    {
      if (v9 != 1) {
        return result;
      }
      long long v13 = *(_OWORD *)v7;
      uint64_t v14 = *((void *)v7 + 2);
      CFBooleanRef v10 = (void *)*((void *)v7 + 4);
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v18, a3);
      nlp::traverseFromCompactMapCursor(v10, (uint64_t)&v13, v8, 0x1000u, 0, &v16, a2, (uint64_t)v18);
      uint64_t v11 = v18;
    }
    else
    {
      long long v13 = *(_OWORD *)v7;
      uint64_t v14 = *((void *)v7 + 2);
      int v15 = *((_DWORD *)v7 + 6);
      int v12 = (void *)*((void *)v7 + 4);
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v17, a3);
      nlp::traverseFromMapCursor(v12, (uint64_t)&v13, v8, 0, &v16, a4, a2, (uint64_t)v17);
      uint64_t v11 = v17;
    }
    return (nlp *)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v11);
  }
  return result;
}

void sub_224E15538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float a7)
{
  uint64_t v13 = a3;
  uint64_t v14 = a2;
  int v12 = a4;
  int v11 = a5;
  float v10 = a7;
  uint64_t v9 = a6;
  uint64_t v7 = *(void *)(a1 + 24);
  if (!v7) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, int *, int *, float *, uint64_t *))(*(void *)v7 + 48))(v7, &v14, &v13, &v12, &v11, &v10, &v9);
}

void *nlp::traverseFromCompactMapCursor(void *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned char *a6, uint64_t a7, uint64_t a8)
{
  v69[4] = *MEMORY[0x263EF8340];
  uint64_t v13 = (uint64_t)result;
  switch(*(void *)a2 & 3)
  {
    case 1:
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v68, a8);
      uint64_t v14 = v68;
      nlp::traverseFromCompactMapCursorMappedLevel(v13, (void *)a2, a3, a4, a5, a6, a7, (uint64_t)v68);
      return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v14);
    case 2:
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v66, a8);
      int v15 = *(_DWORD *)(v13 + 2064);
      char v16 = (_DWORD *)((*(void *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(v13 + 2080));
      if (v15)
      {
        uint64_t v17 = (void *)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)v66);
        unsigned int v27 = *v16 - 8;
        if (*v16 == 8) {
          goto LABEL_34;
        }
        unsigned int v28 = 0;
        do
        {
          int v29 = (char *)v16 + v28;
          uint64_t v30 = *((unsigned __int16 *)v29 + 8);
          uint64_t v31 = *(unsigned int *)(a2 + 12);
          if (v30 >= v31)
          {
            long long v32 = v29 + 8;
            int v33 = v30 - v31;
            memcpy((void *)(a3 + a5), &v29[v31 + 18], v30 - (int)v31);
            *(unsigned char *)(a3 + v33 + a5) = 0;
            std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v69, a7, a3, *((unsigned __int16 *)v32 + 4), *((_DWORD *)v32 + 1), (uint64_t)a6, *(float *)v32);
            LODWORD(v3nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *((unsigned __int16 *)v32 + 4);
          }
          v28 += v30 + 10;
        }
        while (v28 < v27);
      }
      else if ((v15 & 4) != 0)
      {
        uint64_t v17 = (void *)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)v66);
        unsigned int v34 = *v16 - 4;
        unsigned int v35 = *(_DWORD *)(a2 + 8);
        if (v35 >= v34) {
          goto LABEL_34;
        }
        do
        {
          long long v36 = (char *)v16 + v35;
          uint64_t v37 = *((unsigned __int16 *)v36 + 4);
          uint64_t v38 = *(unsigned int *)(a2 + 12);
          if (v37 >= v38)
          {
            long long v40 = v36 + 4;
            int v41 = v37 - v38;
            memcpy((void *)(a3 + a5 + v36[10]), &v36[v38 + 11], v37 - (int)v38);
            *(unsigned char *)(a3 + v41 + a5 + v40[6]) = 0;
            std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v69, a7, a3, *((unsigned __int16 *)v40 + 2), *(_DWORD *)v40, (uint64_t)a6, 0.0);
            int v39 = *((unsigned __int16 *)v40 + 2) + *(_DWORD *)(a2 + 8);
          }
          else
          {
            int v39 = v35 + v37;
          }
          unsigned int v35 = v39 + 7;
          *(_DWORD *)(a2 + 8) = v35;
        }
        while (v35 < v34);
      }
      else
      {
        uint64_t v17 = (void *)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)v66);
        unsigned int v18 = *v16 - 4;
        unsigned int v19 = *(_DWORD *)(a2 + 8);
        if (v19 >= v18) {
          goto LABEL_34;
        }
        do
        {
          size_t v20 = (char *)v16 + v19;
          uint64_t v21 = *((unsigned __int16 *)v20 + 4);
          uint64_t v22 = *(unsigned int *)(a2 + 12);
          if (v21 >= v22)
          {
            long long v24 = v20 + 4;
            int v25 = v21 - v22;
            memcpy((void *)(a3 + a5), &v20[v22 + 10], v21 - (int)v22);
            *(unsigned char *)(a3 + v25 + a5) = 0;
            std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v69, a7, a3, *((unsigned __int16 *)v24 + 2), *(_DWORD *)v24, (uint64_t)a6, (float)*(unsigned int *)v24);
            int v23 = *((unsigned __int16 *)v24 + 2) + *(_DWORD *)(a2 + 8);
          }
          else
          {
            int v23 = v19 + v21;
          }
          unsigned int v19 = v23 + 6;
          *(_DWORD *)(a2 + 8) = v19;
        }
        while (v19 < v18);
      }
      uint64_t v17 = v69;
LABEL_34:
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v17);
      uint64_t v14 = v66;
      return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v14);
    case 3:
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v67, a8);
      unint64_t v26 = (*(void *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(v13 + 2080);
      if ((*(unsigned char *)(v13 + 2064) & 1) == 0)
      {
        if (*(_DWORD *)(v26 + 32))
        {
          *(unsigned char *)(a3 + a5) = 0;
          std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v67, a7, a3, a5, *(_DWORD *)(v26 + 32), (uint64_t)a6, 0.0);
          if (a5 >= a4 || *a6) {
            goto LABEL_65;
          }
        }
        else if (a5 >= a4)
        {
          goto LABEL_65;
        }
        uint64_t v42 = a5;
        unint64_t v43 = 0;
        uint64_t v44 = a5 + 1;
        uint64_t v45 = a4 - 1;
        while (1)
        {
          *(unsigned char *)(a3 + v42) = v43;
          if (v43 >> 6 <= 1) {
            uint64_t v46 = 1;
          }
          else {
            uint64_t v46 = v43 >> 6;
          }
          uint64_t v47 = *(void *)(v26 + 8 * (v43 >> 6));
          if ((v47 & (1 << v43)) != 0)
          {
            if (v43 >= 0x40)
            {
              int v48 = 0;
              BOOL v49 = (int8x8_t *)v26;
              do
              {
                int8x8_t v50 = *v49++;
                uint8x8_t v51 = (uint8x8_t)vcnt_s8(v50);
                v51.i16[0] = vaddlv_u8(v51);
                v48 += v51.i32[0];
                --v46;
              }
              while (v46);
            }
            else
            {
              int v48 = 0;
            }
            uint8x8_t v52 = (uint8x8_t)vcnt_s8((int8x8_t)(v47 & ((1 << v43) - 1)));
            v52.i16[0] = vaddlv_u8(v52);
            *(void *)a2 = *(unsigned int *)(v26 + 4 * (v48 + v52.i32[0]) + 36);
            *(void *)(a2 + 8) = 0;
            *(_DWORD *)(a2 + 16) = 0;
            std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)v67);
            nlp::traverseFromCompactMapCursor(v13, a2, a3, v45, v44, a6, a7, v69);
            std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v69);
            if (*a6 || v43 >= 0xFF) {
              goto LABEL_65;
            }
          }
          else if (v43 > 0xFE)
          {
            goto LABEL_65;
          }
          ++v43;
        }
      }
      if (*(_DWORD *)(v26 + 40))
      {
        *(unsigned char *)(a3 + a5) = 0;
        std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v67, a7, a3, a5, *(_DWORD *)(v26 + 40), (uint64_t)a6, *(float *)(v26 + 36));
        if (a5 >= a4 || *a6) {
          goto LABEL_65;
        }
      }
      else if (a5 >= a4)
      {
        goto LABEL_65;
      }
      uint64_t v53 = a5;
      unint64_t v54 = 0;
      uint64_t v55 = a5 + 1;
      uint64_t v56 = a4 - 1;
      break;
    default:
      if (*(void *)a2 != *(_DWORD *)(result[260] + 4)) {
        return result;
      }
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v65, a8);
      uint64_t v14 = v65;
      nlp::traverseFromCompactMapCursorMappedLevel(v13, (void *)a2, a3, a4, a5, a6, a7, (uint64_t)v65);
      return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v14);
  }
  while (1)
  {
    *(unsigned char *)(a3 + v53) = v54;
    uint64_t v57 = v54 >> 6 <= 1 ? 1 : v54 >> 6;
    uint64_t v58 = *(void *)(v26 + 8 * (v54 >> 6));
    if ((v58 & (1 << v54)) != 0) {
      break;
    }
    if (v54 > 0xFE) {
      goto LABEL_65;
    }
LABEL_64:
    ++v54;
  }
  if (v54 >= 0x40)
  {
    int v59 = 0;
    CFStringRef v60 = (int8x8_t *)v26;
    do
    {
      int8x8_t v61 = *v60++;
      uint8x8_t v62 = (uint8x8_t)vcnt_s8(v61);
      v62.i16[0] = vaddlv_u8(v62);
      v59 += v62.i32[0];
      --v57;
    }
    while (v57);
  }
  else
  {
    int v59 = 0;
  }
  uint8x8_t v63 = (uint8x8_t)vcnt_s8((int8x8_t)(v58 & ((1 << v54) - 1)));
  v63.i16[0] = vaddlv_u8(v63);
  *(void *)a2 = *(unsigned int *)(v26 + 4 * (v59 + v63.i32[0]) + 44);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)v67);
  nlp::traverseFromCompactMapCursor(v13, a2, a3, v56, v55, a6, a7, v69);
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v69);
  if (!*a6 && v54 < 0xFF) {
    goto LABEL_64;
  }
LABEL_65:
  uint64_t v14 = v67;
  return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v14);
}

void sub_224E15BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

uint64_t nlp::traverseFromCompactMapCursorMappedLevel(uint64_t result, void *a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = result;
  v23[4] = *MEMORY[0x263EF8340];
  unint64_t v12 = (*a2 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(result + 2080);
  if (*(unsigned char *)(result + 2064))
  {
    if (*(_DWORD *)(v12 + 1024))
    {
      *(unsigned char *)(a3 + a5) = 0;
      double result = std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, *(float *)(v12 + 1032));
      if (a5 >= a4 || *a6) {
        return result;
      }
    }
    else if (a5 >= a4)
    {
      return result;
    }
    uint64_t v16 = 0;
    do
    {
      *(unsigned char *)(a3 + a5) = v16;
      *a2 = *(unsigned int *)(v12 + 4 * v16);
      if (v16) {
        uint64_t v17 = a5 + 1;
      }
      else {
        uint64_t v17 = a5;
      }
      a2[1] = 0;
      a2[2] = 0;
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v23, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v16 != 0), v17, a6, a7, v23);
      double result = (uint64_t)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v23);
      if (*a6) {
        break;
      }
      BOOL v15 = v16++ == 255;
    }
    while (!v15);
  }
  else
  {
    if (*(_DWORD *)(v12 + 1024))
    {
      *(unsigned char *)(a3 + a5) = 0;
      double result = std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, 0.0);
      if (a5 >= a4 || *a6) {
        return result;
      }
    }
    else if (a5 >= a4)
    {
      return result;
    }
    uint64_t v13 = 0;
    do
    {
      *(unsigned char *)(a3 + a5) = v13;
      *a2 = *(unsigned int *)(v12 + 4 * v13);
      a2[1] = 0;
      *((_DWORD *)a2 + 4) = 0;
      if (v13) {
        uint64_t v14 = a5 + 1;
      }
      else {
        uint64_t v14 = a5;
      }
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v22, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v13 != 0), v14, a6, a7, v22);
      double result = (uint64_t)std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v22);
      if (*a6) {
        break;
      }
      BOOL v15 = v13++ == 255;
    }
    while (!v15);
  }
  return result;
}

void sub_224E15E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t nlp::BurstTrieSetCursorWithBytes(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  if (!a1 || !a2 || !nlp::burstTrieSetCursor(a1, a2)) {
    return 0;
  }
  return nlp::BurstTrieCursorAdvanceWithBytes(a2, a3, a4, v7, v8);
}

uint64_t nlp::burstTrieSetCursor(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  *(void *)(a2 + 32) = a1;
  int v2 = *(_DWORD **)(a1 + 2080);
  if (v2)
  {
    if (*v2 == -900339842 || *v2 == 12648430 && v2[7] == 2)
    {
      uint64_t result = 1;
      *(_DWORD *)(a2 + 28) = 1;
      uint64_t v4 = v2[1];
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = v4;
      return result;
    }
    return 0;
  }
  *(_DWORD *)(a2 + 28) = 0;
  *(void *)(a2 + 8) = a1 | 1;
  *(void *)(a2 + 16) = 0;
  return 1;
}

uint64_t nlp::BurstTrieCursorAdvanceWithBytes(uint64_t result, unsigned __int8 *a2, unsigned int a3, __n128 a4, __n128 a5)
{
  if (result)
  {
    uint64_t v5 = result;
    int v6 = *(_DWORD *)(result + 28);
    if (v6)
    {
      if (v6 == 1)
      {
        uint64_t v7 = *(void *)result;
        uint64_t v8 = *(void *)(result + 8);
        int v9 = *(_DWORD *)(result + 16);
        int v10 = *(_DWORD *)(result + 20);
        uint64_t result = nlp::advanceCompactMapCursor(*(void *)(result + 32), result, a2, a3, a4.n128_f64[0], a5);
        if (!result)
        {
          *(void *)uint64_t v5 = v7;
          *(void *)(v5 + 8) = v8;
          *(_DWORD *)(v5 + 16) = v9;
          *(_DWORD *)(v5 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v10;
          return result;
        }
        return 1;
      }
      return 0;
    }
    else
    {
      uint64_t v12 = *(void *)result;
      uint64_t v11 = *(void *)(result + 8);
      uint64_t v13 = *(void *)(result + 16);
      int v14 = *(_DWORD *)(result + 24);
      uint64_t result = nlp::advanceMapCursor(*(void *)(result + 32), result, a2, a3, a4);
      if (result) {
        return 1;
      }
      *(void *)uint64_t v5 = v12;
      *(void *)(v5 + 8) = v11;
      *(void *)(v5 + 16) = v13;
      *(_DWORD *)(v5 + 24) = v14;
    }
  }
  return result;
}

BOOL nlp::advanceCompactMapCursor(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, double a5, __n128 a6)
{
  uint64_t v6 = *(void *)a2;
  size_t v7 = a4;
  switch(*(void *)a2 & 3)
  {
    case 1:
      goto LABEL_3;
    case 2:
      int v13 = *(_DWORD *)(a1 + 2064);
      int v14 = (int *)((v6 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a1 + 2080));
      int v15 = *v14;
      if ((v13 & 1) == 0)
      {
        unsigned int v16 = v15 - 4;
        if (v15 == 4) {
          goto LABEL_21;
        }
        uint64_t v17 = *(unsigned int *)(a2 + 8);
        if ((v13 & 4) != 0)
        {
          if (a4)
          {
            if (v17 < v16)
            {
              unsigned int v45 = 0;
              while (1)
              {
                uint64_t v46 = (char *)v14 + v17;
                uint64_t v47 = v46 + 4;
                uint64_t v48 = v46[10];
                LODWORD(v49) = v48;
                if (v48 < a4)
                {
                  if (v48 <= *((unsigned __int16 *)v47 + 2)) {
                    uint64_t v49 = *((unsigned __int16 *)v47 + 2);
                  }
                  else {
                    uint64_t v49 = v48;
                  }
                  uint64_t v50 = v48;
                  while (v49 != v50)
                  {
                    if (v47[(v50 + *(_DWORD *)(a2 + 12)) + 7] != a3[v45 + v50])
                    {
                      LODWORD(v49) = v50;
                      break;
                    }
                    if (a4 == ++v50)
                    {
                      LODWORD(v49) = a4;
                      break;
                    }
                  }
                }
                v45 += v49;
                int v51 = *((unsigned __int16 *)v47 + 2);
                if (v45 == a4) {
                  break;
                }
                int v22 = 0;
                LODWORD(v17) = v17 + v51 + 7;
                *(_DWORD *)(a2 + 8) = v17;
                if (v17 >= v16) {
                  goto LABEL_89;
                }
              }
              unsigned int v63 = *(_DWORD *)(a2 + 12) + a4;
              *(_DWORD *)(a2 + 16) = 0;
              if (v51 + v48 == v63) {
                *(_DWORD *)(a2 + 16) = *(_DWORD *)v47;
              }
              goto LABEL_87;
            }
LABEL_21:
            int v22 = 0;
            goto LABEL_89;
          }
          uint8x8_t v62 = (char *)v14 + v17;
          if (*(unsigned __int16 *)((char *)v14 + v17 + 8) + *((unsigned __int8 *)v14 + v17 + 10))
          {
LABEL_78:
            *(_DWORD *)(a2 + 16) = 0;
            goto LABEL_88;
          }
        }
        else
        {
          if (a4)
          {
            if (v17 < v16)
            {
              uint64_t v18 = *(unsigned int *)(a2 + 12);
              while (1)
              {
                unsigned int v19 = (char *)v14 + v17;
                unsigned int v20 = *((unsigned __int16 *)v19 + 4);
                if (v20 >= v18)
                {
                  uint64_t v21 = v19 + 4;
                  if (!memcmp(&v19[v18 + 10], a3, v7)) {
                    break;
                  }
                }
                int v22 = 0;
                LODWORD(v17) = v17 + v20 + 6;
                *(_DWORD *)(a2 + 8) = v17;
                if (v17 >= v16) {
                  goto LABEL_89;
                }
              }
              *(_DWORD *)(a2 + 16) = 0;
              if (v20 - v18 == a4) {
                *(_DWORD *)(a2 + 16) = *v21;
              }
              unsigned int v63 = v18 + a4;
LABEL_87:
              *(_DWORD *)(a2 + 12) = v63;
              goto LABEL_88;
            }
            goto LABEL_21;
          }
          uint8x8_t v62 = (char *)v14 + v17;
          if (*(_WORD *)((char *)v14 + v17 + 8)) {
            goto LABEL_78;
          }
        }
        *(_DWORD *)(a2 + 16) = 0;
        *(_DWORD *)(a2 + 16) = *((_DWORD *)v62 + 1);
        goto LABEL_88;
      }
      if (v15 == 4) {
        goto LABEL_21;
      }
      unsigned int v35 = *(_DWORD *)(a2 + 8);
      a6.n128_u64[0] = *(void *)(a2 + 12);
      float v36 = *(float *)(a2 + 20);
      unsigned int v37 = v15 - 8;
      if (v15 == 8)
      {
        int v22 = 0;
LABEL_76:
        *(_DWORD *)(a2 + 8) = v35;
        *(void *)(a2 + 12) = a6.n128_u64[0];
        *(float *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v36;
        goto LABEL_89;
      }
      unsigned int v38 = 0;
      int v22 = 0;
      uint64_t v39 = a6.n128_u32[0];
      unsigned __int32 v40 = a6.n128_u32[0] + a4;
      while (2)
      {
        while (1)
        {
          int v41 = (char *)v14 + v38;
          unsigned __int32 v42 = *((unsigned __int16 *)v41 + 8);
          if (v40 <= v42) {
            break;
          }
          v38 += v42 + 10;
          if (v38 >= v37) {
            goto LABEL_76;
          }
        }
        __n128 v67 = a6;
        unsigned int v65 = v35;
        uint64_t v66 = v39;
        CFStringRef v64 = v41 + 8;
        if (memcmp(&v41[v39 + 18], a3, v7))
        {
          unsigned int v35 = v65;
          a6 = v67;
          goto LABEL_39;
        }
        a6 = v67;
        if (v40 != v42)
        {
          HIDWORD(v43) = 0;
          BOOL v44 = v22 == 0;
          unsigned int v35 = v65;
          if (!v22)
          {
            unsigned int v35 = v38;
            float v36 = 0.0;
          }
          int v22 = 1;
          if (v44)
          {
            LODWORD(v43) = v67.n128_u32[0] + a4;
            a6.n128_f64[0] = v43;
          }
LABEL_39:
          v38 += v42 + 10;
          uint64_t v39 = v66;
          if (v38 >= v37) {
            goto LABEL_76;
          }
          continue;
        }
        break;
      }
      *(_DWORD *)(a2 + 16) = 0;
      *(_DWORD *)(a2 + 16) = v64[1];
      *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *v64;
      *(_DWORD *)(a2 + 8) = v38;
      *(_DWORD *)(a2 + 12) = v40;
LABEL_88:
      int v22 = 1;
LABEL_89:
      BOOL v61 = v22 == 0;
      return !v61;
    case 3:
      int v23 = (int8x8_t *)((v6 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a1 + 2080));
      if (*(unsigned char *)(a1 + 2064))
      {
        if (a4)
        {
          unsigned int v30 = *a3;
          LODWORD(v31) = v30 >> 6;
          int8x8_t v32 = v23[v30 >> 6];
          uint64_t v33 = 1 << v30;
          if (((1 << v30) & *(void *)&v32) != 0)
          {
            if (v30 >= 0x40)
            {
              int v34 = 0;
              if (v31 <= 1) {
                uint64_t v31 = 1;
              }
              else {
                uint64_t v31 = v31;
              }
              uint64_t v57 = v23;
              do
              {
                int8x8_t v58 = *v57++;
                uint8x8_t v59 = (uint8x8_t)vcnt_s8(v58);
                v59.i16[0] = vaddlv_u8(v59);
                v34 += v59.i32[0];
                --v31;
              }
              while (v31);
            }
            else
            {
              int v34 = 0;
            }
            uint8x8_t v60 = (uint8x8_t)vcnt_s8((int8x8_t)((v33 - 1) & *(void *)&v32));
            v60.i16[0] = vaddlv_u8(v60);
            uint64_t v56 = v23[5].u32[v34 + v60.i32[0] + 1];
            goto LABEL_73;
          }
LABEL_41:
          int v12 = 0;
          goto LABEL_74;
        }
        *(_DWORD *)(a2 + 16) = v23[5].i32[0];
        *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v23[4].i32[1];
      }
      else
      {
        if (a4)
        {
          unsigned int v24 = *a3;
          LODWORD(v25) = v24 >> 6;
          int8x8_t v26 = v23[v24 >> 6];
          uint64_t v27 = 1 << v24;
          if (((1 << v24) & *(void *)&v26) != 0)
          {
            if (v24 >= 0x40)
            {
              int v28 = 0;
              if (v25 <= 1) {
                uint64_t v25 = 1;
              }
              else {
                uint64_t v25 = v25;
              }
              uint8x8_t v52 = v23;
              do
              {
                int8x8_t v53 = *v52++;
                uint8x8_t v54 = (uint8x8_t)vcnt_s8(v53);
                v54.i16[0] = vaddlv_u8(v54);
                v28 += v54.i32[0];
                --v25;
              }
              while (v25);
            }
            else
            {
              int v28 = 0;
            }
            uint8x8_t v55 = (uint8x8_t)vcnt_s8((int8x8_t)((v27 - 1) & *(void *)&v26));
            v55.i16[0] = vaddlv_u8(v55);
            uint64_t v56 = v23[4].u32[v28 + v55.i32[0] + 1];
LABEL_73:
            nlp::updateCompactMapCursorPointer(a1, a2, v56);
            int v12 = nlp::advanceCompactMapCursor(a1, a2, a3 + 1, a4 - 1);
            goto LABEL_74;
          }
          goto LABEL_41;
        }
        *(_DWORD *)(a2 + 16) = v23[4].i32[0];
      }
      int v12 = 1;
LABEL_74:
      BOOL v61 = v12 == 0;
      return !v61;
    default:
      if (v6 == *(_DWORD *)(*(void *)(a1 + 2080) + 4))
      {
LABEL_3:
        int v12 = nlp::advanceCompactMapCursorMappedLevel(a1, a2, a3, a4);
        goto LABEL_74;
      }
      return 0;
  }
}

uint64_t nlp::advanceMapCursor(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v9 = *(void *)(a2 + 8);
  if ((v9 & 3) == 2)
  {
    int v12 = nlp::advanceMapCursorTrieList(a1, a2, a3, a4, a5);
    return v12 != 0;
  }
  if ((v9 & 3) != 1) {
    return 0;
  }
  int v10 = (_DWORD *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
  if (*(unsigned char *)(a1 + 2064))
  {
    if (a4)
    {
      uint64_t v11 = (uint64_t *)&v10[2 * *a3 + 3];
      goto LABEL_10;
    }
    *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v10[2];
    *(_DWORD *)(a2 + 24) = v10[1];
  }
  else
  {
    if (a4)
    {
      uint64_t v11 = (uint64_t *)&v10[2 * *a3 + 1];
LABEL_10:
      nlp::updateMapCursorPointer(a1, a2, *v11);
      int v12 = nlp::advanceMapCursor(a1, a2, a3 + 1, a4 - 1);
      return v12 != 0;
    }
    *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *v10;
  }
  return 1;
}

void *nlp::sharedBuffer(nlp *this)
{
  {
    pthread_key_t v3 = 0;
    pthread_key_create(&v3, MEMORY[0x263EF88C0]);
    nlp::sharedBuffer(void)::key = v3;
  }
  os_log_t v1 = pthread_getspecific(nlp::sharedBuffer(void)::key);
  if (!v1)
  {
    os_log_t v1 = malloc_type_malloc(0x1000uLL, 0xEDA05693uLL);
    pthread_setspecific(nlp::sharedBuffer(void)::key, v1);
  }
  return v1;
}

void sub_224E16714(_Unwind_Exception *a1)
{
}

void *nlp::traverseFromMapCursor(void *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned char *a5, int a6, uint64_t a7, uint64_t a8)
{
  v61[4] = *MEMORY[0x263EF8340];
  int v14 = *((_DWORD *)result + 516);
  uint64_t v15 = *(void *)(a2 + 8) & 3;
  if (v15 != 2)
  {
    if (v15 != 1) {
      return result;
    }
    uint64_t v16 = (uint64_t)result;
    if ((v14 & 1) == 0)
    {
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v59, a8);
      uint64_t v17 = (int *)(*(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      if (*v17)
      {
        std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v59, a7, a3, a4, *v17, (uint64_t)a5, *(float *)(a2 + 24));
        if (!a6 || *a5) {
          goto LABEL_48;
        }
      }
      else if (!a6)
      {
LABEL_48:
        uint64_t v47 = v59;
        return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v47);
      }
      uint64_t v48 = 0;
      uint64_t v49 = (a6 - 1);
      uint64_t v50 = v17 + 1;
      do
      {
        *(unsigned char *)(a3 + a4) = v48;
        nlp::updateMapCursorPointer(v16, a2, *(void *)&v50[2 * v48]);
        std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, (uint64_t)v59);
        nlp::traverseFromMapCursor(v16, a2, a3, a4 + 1, a5, v49, a7, v61);
        std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v61);
        if (*a5) {
          break;
        }
        BOOL v51 = v48++ == 255;
      }
      while (!v51);
      goto LABEL_48;
    }
    std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
    unint64_t v31 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    int v32 = *(_DWORD *)(v31 + 8);
    if (v32)
    {
      std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v60, a7, a3, a4, v32, (uint64_t)a5, *(float *)(a2 + 24));
      if (!a6 || *a5) {
        goto LABEL_54;
      }
    }
    else if (!a6)
    {
LABEL_54:
      uint64_t v47 = v60;
      return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v47);
    }
    uint64_t v52 = 0;
    uint64_t v53 = (a6 - 1);
    unint64_t v54 = v31 + 12;
    do
    {
      *(unsigned char *)(a3 + a4) = v52;
      nlp::updateMapCursorPointer(v16, a2, *(void *)(v54 + 8 * v52));
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, (uint64_t)v60);
      nlp::traverseFromMapCursor(v16, a2, a3, a4 + 1, a5, v53, a7, v61);
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v61);
      if (*a5) {
        break;
      }
      BOOL v51 = v52++ == 255;
    }
    while (!v51);
    goto LABEL_54;
  }
  if (v14)
  {
    std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v58, a8);
    unint64_t v33 = *(void *)a2 & 0xFFFFFFFFFFFFFFFCLL;
    if (!v33) {
      goto LABEL_42;
    }
    uint64_t v56 = (unsigned __int8 *)(v33 + 22);
    unsigned int v34 = a4;
    uint64_t v35 = *(unsigned int *)(a2 + 16);
    unsigned int v36 = v34;
    unsigned int v37 = (void *)(a3 + v34);
    while (1)
    {
      uint64_t v38 = *(unsigned __int16 *)(v33 + 20);
      if (v38 >= v35)
      {
        size_t v39 = v38 - (int)v35;
        if (a6 < 0 || (int)v39 <= a6)
        {
          if (v35)
          {
            unsigned __int32 v40 = (unsigned __int8 *)(v33 + 22);
            int v41 = v56;
            uint64_t v42 = v35;
            while (1)
            {
              int v44 = *v40++;
              int v43 = v44;
              int v45 = *v41++;
              if (v43 != v45) {
                break;
              }
              if (!--v42) {
                goto LABEL_38;
              }
            }
          }
          else
          {
LABEL_38:
            unsigned int v46 = v39 + v36;
            memcpy(v37, (const void *)(v33 + v35 + 22), v39);
            *(unsigned char *)(a3 + v46) = 0;
            std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v58, a7, a3, v46, *(_DWORD *)(v33 + 16), (uint64_t)a5, *(float *)(v33 + 12));
          }
        }
      }
      unint64_t v33 = *(void *)v33;
      if (!v33) {
        goto LABEL_40;
      }
    }
  }
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v57, a8);
  unsigned int v55 = a4;
  unint64_t v18 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v19 = *(unsigned int *)(a2 + 16);
  if (v19 > *(unsigned __int16 *)(v18 + 12)) {
    __assert_rtn("traverseFromMapCursorTrieList", "BurstTrie.cpp", 1957, "cursor.prfxlen <= head->restlen");
  }
  if (!v18) {
    goto LABEL_40;
  }
  unint64_t v20 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  while (v20 == v18)
  {
    unsigned int v21 = *(unsigned __int16 *)(v18 + 12);
LABEL_20:
    int v28 = v21 - v19;
    if (a6 < 0 || v28 <= a6)
    {
      unsigned int v29 = v28 + v55;
      memcpy((void *)(a3 + v55), (const void *)(v20 + v19 + 14), v28);
      *(unsigned char *)(a3 + v29) = 0;
      uint64_t v30 = std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, (uint64_t)v57);
      std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(v30, a7, a3, v29, *(_DWORD *)(v20 + 8), (uint64_t)a5, 0.0);
      std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v61);
    }
    unint64_t v20 = *(void *)v20;
    if (!v20) {
      goto LABEL_40;
    }
  }
  unsigned int v21 = *(unsigned __int16 *)(v20 + 12);
  if (v21 <= (unsigned __int16)v19) {
    goto LABEL_40;
  }
  if (!v19) {
    goto LABEL_20;
  }
  int v22 = (unsigned __int8 *)(v20 + 14);
  int v23 = (unsigned __int8 *)(v18 + 14);
  uint64_t v24 = v19;
  while (1)
  {
    int v26 = *v22++;
    int v25 = v26;
    int v27 = *v23++;
    if (v25 != v27) {
      break;
    }
    if (!--v24) {
      goto LABEL_20;
    }
  }
LABEL_40:
  if ((v14 & 1) == 0)
  {
    uint64_t v47 = v57;
    return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v47);
  }
LABEL_42:
  uint64_t v47 = v58;
  return std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](v47);
}

void sub_224E16B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(uint64_t a1)
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t v6 = *(void *)(v3 + 12);
    uint64_t v5 = (void *)(v3 + 12);
    uint64_t v4 = v6;
    uint64_t v7 = v6 & 3;
    if (v7 == 2)
    {
      uint64_t v8 = (void *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        uint64_t v9 = (void *)*v8;
        free(v8);
        uint64_t v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

void nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(uint64_t a1)
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t v6 = *(void *)(v3 + 4);
    uint64_t v5 = (void *)(v3 + 4);
    uint64_t v4 = v6;
    uint64_t v7 = v6 & 3;
    if (v7 == 2)
    {
      uint64_t v8 = (void *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        uint64_t v9 = (void *)*v8;
        free(v8);
        uint64_t v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

uint64_t nlp::addListNode(uint64_t a1, void *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int *a7)
{
  int v12 = a2;
  uint64_t v13 = a1;
  int v14 = (uint64_t *)*a2;
  uint64_t v15 = malloc_type_calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1), 0xDF779D89uLL);
  uint64_t v16 = (const void *)(a3 + a5);
  if (v14)
  {
    unsigned int v36 = v12;
    uint64_t v37 = v13;
    uint64_t v38 = a7;
    uint64_t v17 = 0;
    char v18 = 1;
LABEL_3:
    uint64_t v19 = a6;
    uint64_t v20 = 0;
    uint64_t v21 = v17;
    int v22 = &v15[v17];
    do
    {
      size_t v23 = *((unsigned __int16 *)v14 + 6);
      if (v23 + a5 == a4 && !memcmp(v16, (char *)v14 + 14, v23))
      {
        char v18 = 0;
        a6 = v19;
        *((_DWORD *)v14 + 2) = v19;
        uint64_t v17 = v21 + v20 + 1;
        v15[v21 + v20] = v14;
        int v14 = (uint64_t *)*v14;
        if (v14) {
          goto LABEL_3;
        }
        uint64_t v24 = (v21 + v20 + 1);
        int v25 = 1;
        goto LABEL_15;
      }
      v22[v20] = v14;
      int v14 = (uint64_t *)*v14;
      ++v20;
    }
    while (v14);
    uint64_t v26 = v21 + v20;
    if (v18)
    {
      uint64_t v13 = v37;
      a7 = v38;
      LODWORD(a6) = v19;
      int v12 = v36;
      goto LABEL_13;
    }
    int v25 = 1;
    uint64_t v24 = v26;
LABEL_15:
    uint64_t v13 = v37;
    a7 = v38;
    int v12 = v36;
  }
  else
  {
    LODWORD(v26) = 0;
LABEL_13:
    size_t v27 = a4 - a5;
    int v28 = (char *)malloc_type_calloc(1uLL, v27 + 15, 0x64AF1970uLL);
    memcpy(v28 + 14, v16, v27);
    v28[v27 + 14] = 0;
    *((_WORD *)v28 + 6) = v27;
    *((_DWORD *)v28 + 2) = a6;
    uint64_t v24 = (v26 + 1);
    int v25 = 2;
    *(void *)int v28 = 0;
    v15[v26] = v28;
  }
  qsort(v15, (int)v24, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
  unsigned int v29 = (void *)*v15;
  uint64_t v30 = (void *)*v15;
  if ((int)v24 >= 2)
  {
    unint64_t v31 = v15 + 1;
    uint64_t v32 = v24 - 1;
    unint64_t v33 = (void *)*v15;
    do
    {
      unsigned int v34 = (void *)*v31++;
      uint64_t v30 = v34;
      *unint64_t v33 = v34;
      unint64_t v33 = v34;
      --v32;
    }
    while (v32);
  }
  *uint64_t v30 = 0;
  void *v12 = v29;
  free(v15);
  *a7 = v25;
  if (v24 > *(_DWORD *)(v13 + 2088)) {
    nlp::addListNode();
  }
  return v24;
}

_DWORD *nlp::burstLevel(uint64_t a1, unsigned __int16 *a2, int *a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x804uLL, 0x10000406A7154B6uLL);
  if (a2)
  {
    do
    {
      int v7 = a2[6];
      uint64_t v8 = *((unsigned int *)a2 + 2);
      if (a2[6])
      {
        uint64_t v9 = *(void *)&v6[2 * *((unsigned __int8 *)a2 + 14) + 1];
        if (v9)
        {
          unint64_t v19 = v9 & 0xFFFFFFFFFFFFFFFCLL;
          unsigned int v10 = nlp::addListNode(a1, &v19, (uint64_t)(a2 + 7), v7, 1u, v8, a3);
          uint64_t v11 = v19;
          if (v10 >= *(_DWORD *)(a1 + 2088))
          {
            uint64_t v11 = nlp::burstLevel(a1, v19, a3);
            uint64_t v12 = 1;
          }
          else
          {
            uint64_t v12 = 2;
          }
          uint64_t v15 = v12 | v11;
          uint64_t v16 = *((unsigned __int8 *)a2 + 14);
        }
        else
        {
          size_t v13 = (v7 - 1);
          unint64_t v14 = (unint64_t)malloc_type_calloc(1uLL, v13 + 15, 0x64AF1970uLL);
          memcpy((void *)(v14 + 14), (char *)a2 + 15, v13);
          *(unsigned char *)(v14 + 14 + v13) = 0;
          *(_WORD *)(v14 + 12) = v13;
          *(_DWORD *)(v14 + 8) = v8;
          *(void *)unint64_t v14 = 0;
          uint64_t v15 = v14 | 2;
          uint64_t v16 = *((unsigned __int8 *)a2 + 14);
        }
        *(void *)&v6[2 * v16 + 1] = v15;
      }
      else
      {
        _DWORD *v6 = v8;
      }
      uint64_t v17 = *(unsigned __int16 **)a2;
      free(a2);
      a2 = v17;
    }
    while (v17);
  }
  return v6;
}

uint64_t nlp::nodeStringCompare(nlp *this, void *a2, const void *a3)
{
  uint64_t v3 = *(void *)this;
  uint64_t v4 = *a2;
  uint64_t v5 = (const void *)(*(void *)this + 14);
  uint64_t v6 = (const void *)(*a2 + 14);
  unsigned int v7 = *(unsigned __int16 *)(v3 + 12);
  unsigned int v8 = *(unsigned __int16 *)(v4 + 12);
  unsigned int v9 = v7 - v8;
  if ((int)v7 >= (int)v8) {
    size_t v10 = v8;
  }
  else {
    size_t v10 = v7;
  }
  LODWORD(result) = memcmp(v5, v6, v10);
  if (result) {
    return result;
  }
  else {
    return v9;
  }
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22A623E20);
}

BOOL nlp::searchDiskLevelRanked(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  char v38 = 0;
  if (a5 < a4)
  {
    int v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
    uint64_t v16 = v15 & 3;
    switch(v16)
    {
      case 3:
        uint64_t v34 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v43, a8);
        char v18 = v43;
        uint64_t v19 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v34), a3, a4, a5 + 1, a6, a7, (uint64_t)v43);
        goto LABEL_29;
      case 2:
        uint64_t v35 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v42, a8);
        char v18 = v42;
        uint64_t v19 = nlp::searchDiskPageRanked((unsigned int *)((v15 & 0xFFFFFFFC) + v35), a3, a4, a5 + 1, a6, a7, (uint64_t)v42);
        goto LABEL_29;
      case 1:
        uint64_t v17 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v44, a8);
        char v18 = v44;
        uint64_t v19 = nlp::searchDiskLevelRanked(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v44);
LABEL_29:
        BOOL v25 = v19;
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v18);
        return v25;
    }
    return 0;
  }
  int v20 = *(_DWORD *)(a2 + 1024);
  if (!v20)
  {
    if (a6) {
      return 0;
    }
    goto LABEL_15;
  }
  int v21 = *(_DWORD *)(a2 + 1032);
  char v22 = a6;
  size_t v23 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  v23[4] = a4;
  *((unsigned char *)v23 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v23 + 5, a3, a4);
  v23[2] = v20;
  _DWORD *v23 = v21;
  v23[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v23, 1, (uint64_t)&v38);
  BOOL v24 = v23[3]-- == 1;
  if (v24) {
    free(v23);
  }
  BOOL v25 = v38 != 0;
  if (!v38 && (v22 & 1) == 0)
  {
LABEL_15:
    uint64_t v26 = 0;
    uint64_t v27 = (a4 + 1);
    while (1)
    {
      int v28 = *(_DWORD *)(a2 + 4 * v26);
      a3[a5] = v26;
      uint64_t v29 = v28 & 3;
      switch(v29)
      {
        case 3:
          uint64_t v32 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v40, a8);
          char v38 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v28 & 0xFFFFFFFC) + v32), a3, v27, a5 + 1, 0, a7, (uint64_t)v40);
          unint64_t v31 = v40;
          break;
        case 2:
          uint64_t v33 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v39, a8);
          char v38 = nlp::searchDiskPageRanked((unsigned int *)((v28 & 0xFFFFFFFC) + v33), a3, v27, a5 + 1, 0, a7, (uint64_t)v39);
          unint64_t v31 = v39;
          break;
        case 1:
          uint64_t v30 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v41, a8);
          char v38 = nlp::searchDiskLevelRanked(a1, (v28 & 0xFFFFFFFC) + v30, a3, v27, a5 + 1, 0, a7, v41);
          unint64_t v31 = v41;
          break;
        default:
          goto LABEL_23;
      }
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v31);
LABEL_23:
      BOOL v25 = v38 != 0;
      if (!v38)
      {
        BOOL v24 = v26++ == 255;
        if (!v24) {
          continue;
        }
      }
      return v25;
    }
  }
  return v25;
}

void sub_224E17464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

uint64_t nlp::containsKey(uint64_t result, _DWORD *a2, int a3, unsigned char *a4)
{
  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
LABEL_5:
      *(_DWORD *)(result + 4) = a2[2];
      *(_DWORD *)(result + 8) = *a2;
LABEL_8:
      *a4 = 1;
      return result;
    }
    if (!*(_DWORD *)result)
    {
      if (!a3) {
        return result;
      }
      goto LABEL_5;
    }
    char v5 = 0;
    if (*(void *)(result + 48))
    {
      uint64_t result = std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(result + 24, *(void *)(result + 16), (uint64_t)a2, (uint64_t)&v5);
      if (v5) {
        goto LABEL_8;
      }
    }
  }
  return result;
}

BOOL nlp::searchDiskLevel(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  char v37 = 0;
  if (a5 < a4)
  {
    int v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
    uint64_t v16 = v15 & 3;
    switch(v16)
    {
      case 3:
        uint64_t v33 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v42, a8);
        char v18 = v42;
        uint64_t v19 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v33), a3, a4, a5 + 1, a6, a7, (uint64_t)v42);
        goto LABEL_29;
      case 2:
        uint64_t v34 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v41, a8);
        char v18 = v41;
        uint64_t v19 = nlp::searchDiskPage(a1, (unsigned int *)((v15 & 0xFFFFFFFC) + v34), a3, a4, a5 + 1, a6, a7, (uint64_t)v41);
        goto LABEL_29;
      case 1:
        uint64_t v17 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v43, a8);
        char v18 = v43;
        uint64_t v19 = nlp::searchDiskLevel(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v43);
LABEL_29:
        BOOL v24 = v19;
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v18);
        return v24;
    }
    return 0;
  }
  int v20 = *(_DWORD *)(a2 + 1024);
  if (!v20)
  {
    if (a6) {
      return 0;
    }
    goto LABEL_15;
  }
  char v21 = a6;
  char v22 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  void v22[4] = a4;
  *((unsigned char *)v22 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v22 + 5, a3, a4);
  v22[2] = v20;
  _DWORD *v22 = 0;
  v22[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v22, 1, (uint64_t)&v37);
  BOOL v23 = v22[3]-- == 1;
  if (v23) {
    free(v22);
  }
  BOOL v24 = v37 != 0;
  if (!v37 && (v21 & 1) == 0)
  {
LABEL_15:
    uint64_t v25 = 0;
    uint64_t v26 = (a4 + 1);
    while (1)
    {
      int v27 = *(_DWORD *)(a2 + 4 * v25);
      a3[a5] = v25;
      uint64_t v28 = v27 & 3;
      switch(v28)
      {
        case 3:
          uint64_t v31 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v39, a8);
          char v37 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v27 & 0xFFFFFFFC) + v31), a3, v26, a5 + 1, 0, a7, (uint64_t)v39);
          uint64_t v30 = v39;
          break;
        case 2:
          uint64_t v32 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v38, a8);
          char v37 = nlp::searchDiskPage(a1, (unsigned int *)((v27 & 0xFFFFFFFC) + v32), a3, v26, a5 + 1, 0, a7, (uint64_t)v38);
          uint64_t v30 = v38;
          break;
        case 1:
          uint64_t v29 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v40, a8);
          char v37 = nlp::searchDiskLevel(a1, (v27 & 0xFFFFFFFC) + v29, a3, v26, a5 + 1, 0, a7, v40);
          uint64_t v30 = v40;
          break;
        default:
          goto LABEL_23;
      }
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v30);
LABEL_23:
      BOOL v24 = v37 != 0;
      if (!v37)
      {
        BOOL v23 = v25++ == 255;
        if (!v23) {
          continue;
        }
      }
      return v24;
    }
  }
  return v24;
}

void sub_224E178A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

BOOL nlp::searchLevelRanked(uint64_t a1, unsigned char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v33 = 0;
  if (a4 < a3)
  {
    uint64_t v14 = *(void *)(a1 + 8 * a2[a4] + 12);
    if ((v14 & 3) == 2)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v36, a7);
      int v15 = v36;
      uint64_t v16 = nlp::searchListRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v36);
      goto LABEL_25;
    }
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v37, a7);
      int v15 = v37;
      uint64_t v16 = nlp::searchLevelRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v37);
LABEL_25:
      BOOL v21 = v16;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v15);
      return v21;
    }
    return 0;
  }
  int v17 = *(_DWORD *)(a1 + 8);
  if (!v17)
  {
    if (a5) {
      return 0;
    }
    goto LABEL_14;
  }
  int v18 = *(_DWORD *)(a1 + 4);
  uint64_t v19 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  v19[4] = a4;
  *((unsigned char *)v19 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v19 + 5, a2, a4);
  v19[2] = v17;
  *uint64_t v19 = v18;
  v19[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v19, 1, (uint64_t)&v33);
  BOOL v20 = v19[3]-- == 1;
  if (v20) {
    free(v19);
  }
  BOOL v21 = v33 != 0;
  if (!v33 && (a5 & 1) == 0)
  {
LABEL_14:
    uint64_t v22 = 0;
    uint64_t v23 = (a3 + 1);
    uint64_t v24 = a4 + 1;
    uint64_t v25 = a1 + 12;
    uint64_t v26 = a4;
    while (1)
    {
      uint64_t v27 = *(void *)(v25 + 8 * v22);
      a2[v26] = v22;
      if ((v27 & 3) == 2)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v34, a7);
        unint64_t v31 = v27 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v29 = v34;
        char v30 = nlp::searchListRanked(v31, a2, v23, v24, 0, a6, (uint64_t)v34);
      }
      else
      {
        if ((v27 & 3) != 1) {
          goto LABEL_20;
        }
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v35, a7);
        unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v29 = v35;
        char v30 = nlp::searchLevelRanked(v28, a2, v23, v24, 0, a6, v35);
      }
      char v33 = v30;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v29);
LABEL_20:
      BOOL v21 = v33 != 0;
      if (!v33)
      {
        BOOL v20 = v22++ == 255;
        if (!v20) {
          continue;
        }
      }
      return v21;
    }
  }
  return v21;
}

void sub_224E17B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

BOOL nlp::searchLevel(int *a1, unsigned char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  char v32 = 0;
  if (a4 < a3)
  {
    uint64_t v14 = *(void *)&a1[2 * a2[a4] + 1];
    if ((v14 & 3) == 2)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v35, a7);
      int v15 = v35;
      uint64_t v16 = nlp::searchList(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v35);
      goto LABEL_25;
    }
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v36, a7);
      int v15 = v36;
      uint64_t v16 = nlp::searchLevel(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v36);
LABEL_25:
      BOOL v20 = v16;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v15);
      return v20;
    }
    return 0;
  }
  int v17 = *a1;
  if (!*a1)
  {
    if (a5) {
      return 0;
    }
    goto LABEL_14;
  }
  int v18 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  v18[4] = a4;
  *((unsigned char *)v18 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v18 + 5, a2, a4);
  v18[2] = v17;
  _DWORD *v18 = 0;
  v18[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v18, 1, (uint64_t)&v32);
  BOOL v19 = v18[3]-- == 1;
  if (v19) {
    free(v18);
  }
  BOOL v20 = v32 != 0;
  if (!v32 && (a5 & 1) == 0)
  {
LABEL_14:
    uint64_t v21 = 0;
    uint64_t v22 = (a3 + 1);
    uint64_t v23 = a4 + 1;
    uint64_t v24 = a1 + 1;
    uint64_t v25 = a4;
    while (1)
    {
      uint64_t v26 = *(void *)&v24[2 * v21];
      a2[v25] = v21;
      if ((v26 & 3) == 2)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v33, a7);
        unint64_t v30 = v26 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v28 = v33;
        char v29 = nlp::searchList(v30, a2, v22, v23, 0, a6, (uint64_t)v33);
      }
      else
      {
        if ((v26 & 3) != 1) {
          goto LABEL_20;
        }
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v34, a7);
        unint64_t v27 = v26 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v28 = v34;
        char v29 = nlp::searchLevel(v27, a2, v22, v23, 0, a6, v34);
      }
      char v32 = v29;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v28);
LABEL_20:
      BOOL v20 = v32 != 0;
      if (!v32)
      {
        BOOL v19 = v21++ == 255;
        if (!v19) {
          continue;
        }
      }
      return v20;
    }
  }
  return v20;
}

void sub_224E17E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

BOOL nlp::searchCompactDiskLevelRanked(uint64_t a1, int8x8_t *a2, unsigned char *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  char v55 = 0;
  if (a5 < a4)
  {
    unint64_t v14 = a3[a5];
    uint64_t v15 = v14 >> 6;
    int8x8_t v16 = a2[v14 >> 6];
    uint64_t v17 = 1 << v14;
    if (((1 << v14) & *(void *)&v16) != 0)
    {
      if (v14 >= 0x40)
      {
        int v18 = 0;
        if (v15 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v15;
        }
        size_t v39 = a2;
        do
        {
          int8x8_t v40 = *v39++;
          uint8x8_t v41 = (uint8x8_t)vcnt_s8(v40);
          v41.i16[0] = vaddlv_u8(v41);
          v18 += v41.i32[0];
          --v15;
        }
        while (v15);
      }
      else
      {
        int v18 = 0;
      }
      uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)((v17 - 1) & *(void *)&v16));
      v42.i16[0] = vaddlv_u8(v42);
      __int32 v43 = a2[5].i32[v18 + v42.i32[0] + 1];
      int v44 = v43 & 3;
      switch(v44)
      {
        case 1:
          uint64_t v49 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, a8);
          uint64_t v50 = (v43 & 0xFFFFFFFC) + v49;
          uint64_t v47 = v61;
          uint64_t v48 = nlp::searchDiskLevelRanked(a1, v50, a3, a4, a5 + 1, a6, a7, v61);
          goto LABEL_44;
        case 2:
          uint64_t v51 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v59, a8);
          uint64_t v47 = v59;
          uint64_t v48 = nlp::searchDiskPageRanked((unsigned int *)((v43 & 0xFFFFFFFC) + v51), a3, a4, a5 + 1, a6, a7, (uint64_t)v59);
          goto LABEL_44;
        case 3:
          uint64_t v45 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
          uint64_t v46 = (v43 & 0xFFFFFFFC) + v45;
          uint64_t v47 = v60;
          uint64_t v48 = nlp::searchCompactDiskLevelRanked(a1, v46, a3, a4, a5 + 1, a6, a7, v60);
LABEL_44:
          BOOL v23 = v48;
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v47);
          return v23;
      }
    }
    return 0;
  }
  __int32 v19 = a2[5].i32[0];
  if (!v19)
  {
    if (a6) {
      return 0;
    }
    goto LABEL_13;
  }
  __int32 v20 = a2[4].i32[1];
  uint64_t v21 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  v21[4] = a4;
  *((unsigned char *)v21 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v21 + 5, a3, a4);
  v21[2] = v19;
  *uint64_t v21 = v20;
  v21[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v21, 1, (uint64_t)&v55);
  if (v21[3]-- == 1) {
    free(v21);
  }
  BOOL v23 = v55 != 0;
  if (!v55 && (a6 & 1) == 0)
  {
LABEL_13:
    unint64_t v24 = 0;
    uint64_t v25 = (a4 + 1);
    while (1)
    {
      if (v24 >> 6 <= 1) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = v24 >> 6;
      }
      int8x8_t v27 = a2[v24 >> 6];
      if ((*(void *)&v27 & (1 << v24)) == 0) {
        goto LABEL_29;
      }
      if (v24 >= 0x40)
      {
        int v28 = 0;
        char v29 = a2;
        do
        {
          int8x8_t v30 = *v29++;
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v28 += v31.i32[0];
          --v26;
        }
        while (v26);
      }
      else
      {
        int v28 = 0;
      }
      uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v27 & ((1 << v24) - 1)));
      v32.i16[0] = vaddlv_u8(v32);
      __int32 v33 = a2[5].i32[v28 + v32.i32[0] + 1];
      a3[a5] = v24;
      int v34 = v33 & 3;
      switch(v34)
      {
        case 1:
          uint64_t v37 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v58, a8);
          char v55 = nlp::searchDiskLevelRanked(a1, v37 + (v33 & 0xFFFFFFFC), a3, v25, a5 + 1, 0, a7, v58);
          unsigned int v36 = v58;
          break;
        case 2:
          uint64_t v38 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v56, a8);
          char v55 = nlp::searchDiskPageRanked((unsigned int *)(v38 + (v33 & 0xFFFFFFFC)), a3, v25, a5 + 1, 0, a7, (uint64_t)v56);
          unsigned int v36 = v56;
          break;
        case 3:
          uint64_t v35 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v57, a8);
          char v55 = nlp::searchCompactDiskLevelRanked(a1, v35 + (v33 & 0xFFFFFFFC), a3, v25, a5 + 1, 0, a7, v57);
          unsigned int v36 = v57;
          break;
        default:
          goto LABEL_29;
      }
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v36);
LABEL_29:
      BOOL v23 = v55 != 0;
      if (!v55 && ++v24 != 256) {
        continue;
      }
      return v23;
    }
  }
  return v23;
}

void sub_224E182D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

uint64_t nlp::searchDiskPageRanked(unsigned int *a1, unsigned char *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v37 = 0;
  unsigned int v7 = *a1;
  if (!*a1) {
    return 0;
  }
  int v8 = a4;
  int v9 = a3;
  unsigned int v11 = 0;
  uint64_t v12 = &a2[a4];
  int v13 = a3 - a4;
  size_t __n = (int)(a3 - a4);
  char v29 = v12;
  __dst = &a2[a3];
  size_t v28 = a3;
  while (1)
  {
    unint64_t v14 = (char *)a1 + v11;
    uint64_t v15 = *((unsigned __int16 *)v14 + 8);
    if (v13 > (int)v15) {
      goto LABEL_14;
    }
    int8x8_t v16 = v14 + 8;
    uint64_t v17 = v14 + 18;
    if (memcmp(v14 + 18, v12, __n)) {
      goto LABEL_14;
    }
    char v18 = a5;
    if (v13 == v15) {
      char v18 = 0;
    }
    if (v18) {
      goto LABEL_14;
    }
    size_t v19 = (v15 + v8);
    size_t v20 = (v19 - v9);
    size_t v21 = v28;
    if ((int)v20 >= 1)
    {
      memcpy(__dst, &v17[v15 - (int)v20], v20);
      size_t v21 = v19;
      int v9 = v19;
    }
    a2[v21] = 0;
    int v22 = *((_DWORD *)v16 + 1);
    int v23 = *(_DWORD *)v16;
    unint64_t v24 = malloc_type_malloc(v21 + 21, 0x64E2CA22uLL);
    v24[4] = v9;
    *((unsigned char *)v24 + v21 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
    memcpy(v24 + 5, a2, v21);
    *unint64_t v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v24, v13 == v15, (uint64_t)&v37);
    int v25 = v24[3] - 1;
    v24[3] = v25;
    if (!v25) {
      free(v24);
    }
    int v9 = a3;
    int v8 = a4;
    uint64_t v12 = v29;
    if (v37) {
      return 1;
    }
    LODWORD(v15) = *((unsigned __int16 *)v16 + 4);
LABEL_14:
    v11 += v15 + 10;
    if (v11 >= v7) {
      return 0;
    }
  }
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = a2;
  uint64_t v9 = a3;
  char v8 = a4;
  uint64_t v7 = a5;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, char *, uint64_t *))(*(void *)v5 + 48))(v5, &v10, &v9, &v8, &v7);
}

uint64_t std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a2;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *))(*(void *)v4 + 48))(v4, &v8, &v7, &v6);
}

void std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__func()
{
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26D831DB0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26D831DB0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, void *a2, void *a3, unsigned __int8 *a4, void *a5)
{
  return (*(uint64_t (**)(void, void, void, void))(a1 + 8))(*a2, *a3, *a4, *a5);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target_type()
{
}

void *std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

BOOL nlp::searchCompactDiskLevel(uint64_t a1, int8x8_t *a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  char v55 = 0;
  if (a5 < a4)
  {
    unint64_t v14 = a3[a5];
    uint64_t v15 = v14 >> 6;
    int8x8_t v16 = a2[v14 >> 6];
    uint64_t v17 = 1 << v14;
    if (((1 << v14) & *(void *)&v16) != 0)
    {
      if (v14 >= 0x40)
      {
        int v18 = 0;
        if (v15 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v15;
        }
        uint64_t v38 = a2;
        do
        {
          int8x8_t v39 = *v38++;
          uint8x8_t v40 = (uint8x8_t)vcnt_s8(v39);
          v40.i16[0] = vaddlv_u8(v40);
          v18 += v40.i32[0];
          --v15;
        }
        while (v15);
      }
      else
      {
        int v18 = 0;
      }
      uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)((v17 - 1) & *(void *)&v16));
      v41.i16[0] = vaddlv_u8(v41);
      __int32 v42 = a2[4].i32[v18 + v41.i32[0] + 1];
      int v43 = v42 & 3;
      switch(v43)
      {
        case 1:
          uint64_t v48 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, a8);
          uint64_t v49 = (v42 & 0xFFFFFFFC) + v48;
          uint64_t v46 = v61;
          uint64_t v47 = nlp::searchDiskLevel(a1, v49, a3, a4, a5 + 1, a6, a7, v61);
          goto LABEL_44;
        case 2:
          uint64_t v50 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v59, a8);
          uint64_t v51 = (unsigned int *)((v42 & 0xFFFFFFFC) + v50);
          uint64_t v46 = v59;
          uint64_t v47 = nlp::searchDiskPage(a1, v51, a3, a4, a5 + 1, a6, a7, (uint64_t)v59);
          goto LABEL_44;
        case 3:
          uint64_t v44 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
          uint64_t v45 = (v42 & 0xFFFFFFFC) + v44;
          uint64_t v46 = v60;
          uint64_t v47 = nlp::searchCompactDiskLevel(a1, v45, a3, a4, a5 + 1, a6, a7, v60);
LABEL_44:
          BOOL v22 = v47;
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v46);
          return v22;
      }
    }
    return 0;
  }
  __int32 v19 = a2[4].i32[0];
  if (!v19)
  {
    if (a6) {
      return 0;
    }
    goto LABEL_13;
  }
  size_t v20 = malloc_type_malloc(a4 + 21, 0x64E2CA22uLL);
  v20[4] = a4;
  *((unsigned char *)v20 + a4 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
  memcpy(v20 + 5, a3, a4);
  v20[2] = v19;
  _DWORD *v20 = 0;
  v20[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v20, 1, (uint64_t)&v55);
  if (v20[3]-- == 1) {
    free(v20);
  }
  BOOL v22 = v55 != 0;
  if (!v55 && (a6 & 1) == 0)
  {
LABEL_13:
    unint64_t v23 = 0;
    uint64_t v24 = (a4 + 1);
    while (1)
    {
      if (v23 >> 6 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v23 >> 6;
      }
      int8x8_t v26 = a2[v23 >> 6];
      if ((*(void *)&v26 & (1 << v23)) == 0) {
        goto LABEL_29;
      }
      if (v23 >= 0x40)
      {
        int v27 = 0;
        size_t v28 = a2;
        do
        {
          int8x8_t v29 = *v28++;
          uint8x8_t v30 = (uint8x8_t)vcnt_s8(v29);
          v30.i16[0] = vaddlv_u8(v30);
          v27 += v30.i32[0];
          --v25;
        }
        while (v25);
      }
      else
      {
        int v27 = 0;
      }
      uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v26 & ((1 << v23) - 1)));
      v31.i16[0] = vaddlv_u8(v31);
      __int32 v32 = a2[4].i32[v27 + v31.i32[0] + 1];
      a3[a5] = v23;
      int v33 = v32 & 3;
      switch(v33)
      {
        case 1:
          uint64_t v36 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v58, a8);
          char v55 = nlp::searchDiskLevel(a1, v36 + (v32 & 0xFFFFFFFC), a3, v24, a5 + 1, 0, a7, v58);
          uint64_t v35 = v58;
          break;
        case 2:
          uint64_t v37 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v56, a8);
          char v55 = nlp::searchDiskPage(a1, (unsigned int *)(v37 + (v32 & 0xFFFFFFFC)), a3, v24, a5 + 1, 0, a7, (uint64_t)v56);
          uint64_t v35 = v56;
          break;
        case 3:
          uint64_t v34 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v57, a8);
          char v55 = nlp::searchCompactDiskLevel(a1, v34 + (v32 & 0xFFFFFFFC), a3, v24, a5 + 1, 0, a7, v57);
          uint64_t v35 = v57;
          break;
        default:
          goto LABEL_29;
      }
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](v35);
LABEL_29:
      BOOL v22 = v55 != 0;
      if (!v55 && ++v23 != 256) {
        continue;
      }
      return v22;
    }
  }
  return v22;
}

void sub_224E18BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__value_func[abi:ne180100](va);
  _Unwind_Resume(a1);
}

uint64_t nlp::searchDiskPage(uint64_t a1, unsigned int *a2, char *a3, unsigned int a4, int a5, char a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v9 = a4;
  uint64_t v66 = *MEMORY[0x263EF8340];
  char v64 = 0;
  int v11 = a4 - a5;
  unsigned int v12 = *a2;
  if ((*(unsigned char *)(a1 + 2064) & 4) != 0)
  {
    memset(__s1, 0, sizeof(__s1));
    if (v12)
    {
      size_t v28 = 0;
      unsigned int v29 = 0;
      int v52 = a5 - a4;
      __s2a = &a3[a5];
      uint64_t v51 = &a3[a4];
      do
      {
        uint8x8_t v30 = (char *)a2 + v29;
        uint64_t v31 = v30[10];
        if (v28)
        {
          uint64_t v32 = v28[6];
          if (v31 > v32) {
            memcpy((char *)__s1 + v32, v28 + 7, v31 - v32);
          }
        }
        size_t v28 = v30 + 4;
        unsigned int v33 = *((unsigned __int16 *)v30 + 4);
        int v34 = v33 + v31;
        if ((int)(v33 + v31) >= v11)
        {
          if (v9 == v8 || ((int)v31 >= v11 ? (int v35 = v11) : (int v35 = v31), !memcmp(__s1, __s2a, v35)))
          {
            unsigned int v36 = v11 - v31;
            if (v11 - (int)v31 < 0
              || ((int)v33 >= (int)v36 ? (size_t v37 = v36) : (size_t v37 = v33), !memcmp(v28 + 7, &__s2a[v31], v37)))
            {
              char v38 = a6;
              if (v11 == v34) {
                char v38 = 0;
              }
              if ((v38 & 1) == 0)
              {
                unsigned int v39 = v9;
                unsigned int v40 = v31 + v8;
                size_t v41 = v31 + v8 - v39;
                if ((int)v41 < 1)
                {
                  unsigned int v40 = v39;
                }
                else
                {
                  memcpy(v51, (char *)__s1 + v31 - (int)v41, v41);
                  unsigned int v33 = *((unsigned __int16 *)v28 + 2);
                  LODWORD(v31) = v28[6];
                }
                int v42 = v52 + v33 + v31;
                if (v42 < 1)
                {
                  uint64_t v44 = a3;
                }
                else
                {
                  int v43 = v42 - (v41 & ~((int)v41 >> 31));
                  uint64_t v44 = a3;
                  memcpy(&a3[v40], &v28[v33 - v43 + 7], v43);
                  v40 += v43;
                }
                char v54 = v11 == v34;
                v44[v40] = 0;
                int v45 = *(_DWORD *)v28;
                uint64_t v46 = malloc_type_malloc(v40 + 21, 0x64E2CA22uLL);
                v46[4] = v40;
                *((unsigned char *)v46 + v40 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
                memcpy(v46 + 5, v44, v40);
                _DWORD *v46 = 0;
                v46[2] = v45;
                v46[3] = 1;
                std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v46, v54, (uint64_t)&v64);
                int v47 = v46[3] - 1;
                v46[3] = v47;
                if (!v47) {
                  free(v46);
                }
                unsigned int v9 = a4;
                if (v64) {
                  return 1;
                }
                unsigned int v33 = *((unsigned __int16 *)v28 + 2);
                int v8 = a5;
              }
            }
          }
        }
        v29 += v33 + 7;
      }
      while (v29 < v12);
    }
  }
  else if (v12)
  {
    unsigned int v13 = 0;
    unint64_t v14 = &a3[a5];
    size_t v15 = v11;
    __dst = &a3[a4];
    size_t v50 = a4;
    uint64_t v53 = v14;
    do
    {
      int8x8_t v16 = (char *)a2 + v13;
      uint64_t v17 = *((unsigned __int16 *)v16 + 4);
      if (v11 <= (int)v17)
      {
        int v18 = v16 + 4;
        __int32 v19 = v16 + 10;
        if (!memcmp(v16 + 10, v14, v15))
        {
          char v20 = a6;
          if (v11 == v17) {
            char v20 = 0;
          }
          if ((v20 & 1) == 0)
          {
            size_t v21 = (v17 + v8);
            int v22 = a4;
            size_t v23 = v21 - a4;
            size_t v24 = v50;
            if ((int)v23 >= 1)
            {
              memcpy(__dst, &v19[v17 - (int)v23], v23);
              size_t v24 = v21;
              int v22 = v21;
            }
            a3[v24] = 0;
            int v25 = *(_DWORD *)v18;
            int8x8_t v26 = malloc_type_malloc(v24 + 21, 0x64E2CA22uLL);
            v26[4] = v22;
            *((unsigned char *)v26 + v24 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
            memcpy(v26 + 5, a3, v24);
            *int8x8_t v26 = 0;
            v26[2] = v25;
            v26[3] = 1;
            std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v26, v11 == v17, (uint64_t)&v64);
            int v27 = v26[3] - 1;
            v26[3] = v27;
            if (!v27) {
              free(v26);
            }
            int v8 = a5;
            size_t v15 = v11;
            unint64_t v14 = v53;
            if (v64) {
              return 1;
            }
            LODWORD(v17) = *((unsigned __int16 *)v18 + 2);
          }
        }
      }
      v13 += v17 + 6;
    }
    while (v13 < v12);
  }
  return 0;
}

uint64_t nlp::searchListRanked(uint64_t result, unsigned char *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v30 = 0;
  if (result)
  {
    int v7 = a4;
    uint64_t v10 = result;
    int v11 = &a2[a4];
    size_t v12 = (int)(a3 - a4);
    size_t v26 = a3;
    char v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      uint64_t v14 = *(unsigned __int16 *)(v10 + 20);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 22), v11, v12))
      {
        char v15 = v12 == v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          size_t v16 = (v14 + v7);
          size_t v17 = v16 - a3;
          size_t v18 = v26;
          int v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 22 + v14 - (int)v17), v17);
            size_t v18 = v16;
            int v19 = v16;
          }
          a2[v18] = 0;
          int v20 = *(_DWORD *)(v10 + 16);
          int v21 = *(_DWORD *)(v10 + 12);
          int v22 = malloc_type_malloc(v18 + 21, 0x64E2CA22uLL);
          void v22[4] = v19;
          *((unsigned char *)v22 + v18 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
          memcpy(v22 + 5, a2, v18);
          _DWORD *v22 = v21;
          v22[2] = v20;
          v22[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v22, v12 == v14, (uint64_t)&v30);
          int v23 = v22[3] - 1;
          v22[3] = v23;
          if (!v23) {
            free(v22);
          }
          int v7 = a4;
          char v13 = a5;
          if (v30) {
            break;
          }
        }
      }
      uint64_t v10 = *(void *)v10;
      if (!v10) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t nlp::searchList(uint64_t result, unsigned char *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v29 = 0;
  if (result)
  {
    int v7 = a4;
    uint64_t v10 = result;
    int v11 = &a2[a4];
    size_t v12 = (int)(a3 - a4);
    size_t v25 = a3;
    char v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      uint64_t v14 = *(unsigned __int16 *)(v10 + 12);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 14), v11, v12))
      {
        char v15 = v12 == v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          size_t v16 = (v14 + v7);
          size_t v17 = v16 - a3;
          size_t v18 = v25;
          int v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 14 + v14 - (int)v17), v17);
            size_t v18 = v16;
            int v19 = v16;
          }
          a2[v18] = 0;
          int v20 = *(_DWORD *)(v10 + 8);
          int v21 = malloc_type_malloc(v18 + 21, 0x64E2CA22uLL);
          v21[4] = v19;
          *((unsigned char *)v21 + v18 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
          memcpy(v21 + 5, a2, v18);
          *int v21 = 0;
          v21[2] = v20;
          v21[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v21, v12 == v14, (uint64_t)&v29);
          int v22 = v21[3] - 1;
          v21[3] = v22;
          if (!v22) {
            free(v21);
          }
          int v7 = a4;
          char v13 = a5;
          if (v29) {
            break;
          }
        }
      }
      uint64_t v10 = *(void *)v10;
      if (!v10) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t nlp::advanceCompactMapCursorMappedLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  unint64_t v8 = (*(void *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a1 + 2080);
  if (*(unsigned char *)(a1 + 2064))
  {
    if (!a4)
    {
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
      *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(_DWORD *)(v8 + 1032);
      return 1;
    }
  }
  else if (!a4)
  {
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
    return 1;
  }
  nlp::updateCompactMapCursorPointer(a1, a2, *(unsigned int *)(v8 + 4 * *a3));
  return nlp::advanceCompactMapCursor(a1, a2, a3 + 1, (a4 - 1));
}

uint64_t nlp::updateCompactMapCursorPointer(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2 != a3)
  {
    switch(a3 & 3)
    {
      case 1:
        unint64_t v3 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(result + 2080);
        if ((*(unsigned char *)(result + 2064) & 1) == 0)
        {
          int v4 = *(_DWORD *)(v3 + 1024);
          goto LABEL_13;
        }
        *(_DWORD *)(a2 + 16) = *(_DWORD *)(v3 + 1024);
        int v8 = *(_DWORD *)(v3 + 1032);
        goto LABEL_16;
      case 2:
        int v5 = *(_DWORD *)(result + 2064);
        if ((v5 & 4) != 0)
        {
          int v4 = *(_DWORD *)((a3 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(result + 2080));
          goto LABEL_13;
        }
        uint64_t v6 = (int *)((a3 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(result + 2080));
        if ((v5 & 1) == 0)
        {
          int v4 = *v6;
          goto LABEL_13;
        }
        *(_DWORD *)(a2 + 16) = v6[1];
        int v8 = *v6;
        goto LABEL_16;
      case 3:
        int v7 = (_DWORD *)((a3 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(result + 2080));
        if (*(unsigned char *)(result + 2064))
        {
          *(_DWORD *)(a2 + 16) = v7[10];
          int v8 = v7[9];
LABEL_16:
          *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v8;
        }
        else
        {
          int v4 = v7[8];
LABEL_13:
          *(_DWORD *)(a2 + 16) = v4;
        }
LABEL_17:
        *(void *)a2 = a3;
        *(void *)(a2 + 8) = 0;
        break;
      default:
        *(_DWORD *)(a2 + 16) = 0;
        goto LABEL_17;
    }
  }
  return result;
}

uint64_t nlp::advanceMapCursorTrieList(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a2 + 8);
  if ((*(unsigned char *)(a1 + 2064) & 1) == 0)
  {
    unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v10 = *(unsigned int *)(a2 + 16);
    if (v10 > *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12)) {
      nlp::advanceMapCursorTrieList();
    }
    if (!v9) {
      return 0;
    }
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    while (1)
    {
      unsigned int v12 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v11 != v9)
      {
        unsigned int v12 = *(unsigned __int16 *)(v11 + 12);
        if (v10 >= v12) {
          goto LABEL_19;
        }
        if (v10)
        {
          char v13 = (unsigned __int8 *)(v11 + 14);
          uint64_t v14 = *(unsigned int *)(a2 + 16);
          char v15 = (unsigned __int8 *)(v9 + 14);
          do
          {
            int v17 = *v13++;
            int v16 = v17;
            int v18 = *v15++;
            if (v16 != v18) {
              goto LABEL_19;
            }
          }
          while (--v14);
        }
      }
      LODWORD(v19) = 0;
      int v20 = *(_DWORD *)(a2 + 16);
      if (v10 < v12 && a4)
      {
        unint64_t v19 = 0;
        do
        {
          if (*(unsigned __int8 *)(v11 + v10 + 14 + v19) != a3[v19]) {
            break;
          }
          if (++v19 + v10 >= v12) {
            break;
          }
        }
        while (v19 < a4);
        int v20 = v10 + v19;
      }
      if (v19 == a4)
      {
        *(void *)(a2 + 8) = v11 | 2;
        if (v20 == v12)
        {
          *(_DWORD *)(a2 + 16) = v12;
          *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(_DWORD *)(v11 + 8);
        }
        else
        {
          *(void *)(a2 + 16) = v10 + a4;
        }
        return 1;
      }
LABEL_19:
      unint64_t v11 = *(void *)v11;
      if (!v11) {
        return 0;
      }
    }
  }
  v35[1] = v35;
  v35[0] = *(void *)a2;
  a5.n128_u64[0] = *(void *)(a2 + 16);
  float v22 = *(float *)(a2 + 24);
  __n128 v38 = a5;
  MEMORY[0x270FA5388](a1);
  size_t v24 = (char *)v35 - v23;
  size_t v26 = *(unsigned int *)(a2 + 16);
  memcpy((char *)v35 - v23, (const void *)(v25 + 22), v26);
  unint64_t v27 = *(void *)a2 & 0xFFFFFFFFFFFFFFFCLL;
  if (v27)
  {
    int v37 = 0;
    unsigned int v28 = v26 + a4;
    size_t v36 = a4;
    do
    {
      unsigned int v29 = *(unsigned __int16 *)(v27 + 20);
      if (v28 <= v29 && !memcmp((const void *)(v27 + 22), v24, v26) && !memcmp((const void *)(v27 + 22 + v26), a3, v36))
      {
        if (v28 == v29)
        {
          *(void *)(a2 + 8) = v27 | 2;
          int v34 = *(_DWORD *)(v27 + 16);
          *(_DWORD *)(a2 + 24) = *(_DWORD *)(v27 + 12);
          *(_DWORD *)(a2 + 16) = v28;
          *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v34;
          return 1;
        }
        __n128 v30 = v38;
        HIDWORD(v31) = 0;
        int v32 = v37;
        if (!v37)
        {
          uint64_t v8 = v27 | 2;
          float v22 = 0.0;
        }
        int v37 = 1;
        if (!v32)
        {
          LODWORD(v31) = v38.n128_u32[0] + a4;
          v30.n128_f64[0] = v31;
        }
        __n128 v38 = v30;
      }
      unint64_t v27 = *(void *)v27;
    }
    while (v27);
  }
  else
  {
    int v37 = 0;
  }
  *(void *)a2 = v35[0];
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v38.n128_u64[0];
  *(float *)(a2 + 24) = v22;
  return v37;
}

uint64_t nlp::updateMapCursorPointer(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 8) != a3)
  {
    uint64_t v3 = a3 & 3;
    if ((a3 & 3) != 0)
    {
      if (v3 == 2)
      {
        unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        if ((*(unsigned char *)(result + 2064) & 1) == 0)
        {
          if (*(_WORD *)(v6 + 12)) {
            int v5 = 0;
          }
          else {
            int v5 = *(_DWORD *)(v6 + 8);
          }
          goto LABEL_14;
        }
        *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(v6 + 12);
        *(void *)a2 = a3;
      }
      else if (v3 == 1)
      {
        int v4 = (int *)(a3 & 0xFFFFFFFFFFFFFFFCLL);
        if ((*(unsigned char *)(result + 2064) & 1) == 0)
        {
          int v5 = *v4;
LABEL_14:
          *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v5;
          goto LABEL_15;
        }
        *(_DWORD *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = v4[2];
        *(_DWORD *)(a2 + 24) = v4[1];
      }
    }
    else
    {
      *(void *)(a2 + 2nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0) = 0;
    }
LABEL_15:
    *(void *)(a2 + 8) = a3;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26D831EC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26D831EC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()()
{
}

uint64_t std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void *std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(nlp *this, CFErrorRef *a2, __CFError **a3, __CFError **a4)
{
  return nlp::createDictionaryWithContentsOfURL(this, 0, a2, a4);
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(CFURLRef fileURL, const __CFURL *a2, CFErrorRef *a3, __CFError **a4)
{
  int v5 = (int)a2;
  int v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], fileURL);
  if (v7)
  {
    unint64_t v9 = v7;
    if (CFReadStreamOpen(v7)
      && (!v5 ? (CFOptionFlags v11 = 0) : (CFOptionFlags v11 = 2),
          CFPropertyListRef v12 = CFPropertyListCreateWithStream(0, v9, 0, v11, 0, 0),
          CFReadStreamClose(v9),
          v12))
    {
      CFTypeID v13 = CFGetTypeID(v12);
      if (v13 != CFDictionaryGetTypeID())
      {
        if (a3) {
          *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"Property list at URL is not a dictionary", fileURL, v14);
        }
        CFRelease(v12);
        goto LABEL_15;
      }
    }
    else
    {
      if (!a3)
      {
LABEL_15:
        CFPropertyListRef v12 = 0;
        goto LABEL_16;
      }
      CFPropertyListRef v12 = 0;
      *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"File at URL is not a valid property list", fileURL, v10);
    }
LABEL_16:
    CFRelease(v9);
    return v12;
  }
  CFPropertyListRef v12 = 0;
  if (a3) {
    *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"File at URL is not readable", fileURL, v8);
  }
  return v12;
}

void sub_224E19D84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFReadStream *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

CFErrorRef nlp::createErrorWithMessageAndURL(nlp *this, CFURLRef anURL, const __CFURL *a3)
{
  CFStringRef v4 = CFURLCopyPath(anURL);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@: %@", this, v4);
  CFArrayRef Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v6);
  CFErrorRef v8 = CFErrorCreate(v5, @"com.apple.NLPUtils.ErrorDomain", 0, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

void sub_224E19EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  CFAllocatorRef v5 = va_arg(va1, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFReadStream *>::reset(const void **a1, const void *a2)
{
  CFStringRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void copyEmbeddingDataForInputs_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Did not create valid embedding inputs; Not generating any query embeddings",
    v2,
    v3,
    v4,
    v5,
    0);
}

void copyEmbeddingDataForInputs_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Failed to serialize the embedding data dictionary with error: %@");
}

void copyEmbeddingDataForInputs_cold_3()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_224D85000, v0, OS_LOG_TYPE_ERROR, "[QPNLU][qid=%ld] %@", v1, 0x16u);
}

void copyEmbeddingDataForInputs_cold_4()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] %@");
}

void copyEmbeddingDataForInputs_cold_5()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Received nil query embedding inputs or keys; Not generating any query embeddings",
    v2,
    v3,
    v4,
    v5,
    0);
}

void copyEmbeddingDataForInputs_cold_6()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
    v2,
    v3,
    v4,
    v5,
    0);
}

void __embeddingGeneratorPreheatAsync_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void embeddingGeneratorPreheatSync_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "Embedding preheat failed (time=time=%.2lldns) (%@)");
}

void QP::Parser::embeddingString()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] did not request any query embedding", v2, v3, v4, v5, v6);
}

{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = 2112;
  uint64_t v3 = 0;
  _os_log_error_impl(&dword_224D85000, v0, OS_LOG_TYPE_ERROR, "[QPNLU][qid=%ld] text embedding string is nil (%@), not requesting a text query embedding", v1, 0x16u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] not requesting a text query embedding based on LLM QU parse", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] modified photo embedding string is nil, not requesting a photos query embedding", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] modified photo embedding string is empty, not requesting a photos query embedding", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] empty photo embedding string", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] did not request any query embedding due to nil inputs / keysarray", v2, v3, v4, v5, v6);
}

void QP::Parser::embeddingString(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_224D85000, a2, a3, "[QPNLU][qid=%ld] text embedding string is empty (%@), not requesting a text query embedding", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

uint64_t QP::Parser::embeddingString()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] unsafe intent for context '%lu', avoid embedding search", v3, v4);
  if (qpparserLogger(void)::token == -1) {
    return 1;
  }
  dispatch_once(&qpparserLogger(void)::token, &__block_literal_global_3);
  return 0;
}

{
  uint64_t v0;
  os_log_t v1;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] sensitive query token for context '%lu', avoid embedding search", v3, v4);
  if (qpparserLogger(void)::token == -1) {
    return 1;
  }
  dispatch_once(&qpparserLogger(void)::token, &__block_literal_global_3);
  return 0;
}

void QP::ParserGrammar::tokenCompletions(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_224D85000, a2, OS_LOG_TYPE_FAULT, "m_completion_keys is missing an entry for key %@", (uint8_t *)&v2, 0xCu);
}

uint64_t QP::Lexer::Lexer(std::__shared_weak_count **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return MEMORY[0x22A623E20](a2, 0x20C40D91ED9E0);
}

void ___ZN2QP5LexerC2ENSt3__110shared_ptrINS_19ParserConfigurationEEENS2_INS_13ParserGrammarEEE_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_224D85000, log, OS_LOG_TYPE_ERROR, "QueryParserLexer: unable to load loc tables", v1, 2u);
}

void ___ZN2QP19normalizeQueryTokenEP8NSString_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating apostropheSRegex: %@", v2, v3, v4, v5, v6);
}

void QP::LLMParser::parseInternal()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Got empty QU Parse from LLM spQUParse, skipping generating QUOutput", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] based on LLM QU parse, we won't request query embedding. No SEARCH_TERM is available and intent is not Reservation_Search or Event", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] spQUParse from LLM Parse:%@");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Got empty prediction from ground Truth json file, skipping generating QUOutput", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] spQUParse from ground truth json file:%@");
}

void QP::LLMParser::addTokenInfoAndAttr()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Successfully grounded person", v2, v3, v4, v5, v6);
}

{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = 1024;
  uint64_t v3 = 25;
  _os_log_fault_impl(&dword_224D85000, v0, OS_LOG_TYPE_FAULT, "[QPNLU][qid=%ld] [Recurring Failure] ECR failed %d times", v1, 0x12u);
}

{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8(&dword_224D85000, v0, (uint64_t)v0, "[QPNLU][qid=%ld] Unable to lookup visual identifiers: %@", v1);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_224D85000, v0, (uint64_t)v0, "[QPNLU][qid=%ld] Failed to load file from bundle:%@", v1);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_8(&dword_224D85000, v6, v4, "[QPNLU][qid=%ld] Failed to load ground truth JSON file: %@", v5);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_8(&dword_224D85000, v6, v4, "[QPNLU][qid=%ld] Error parsing JSON data for ground truth: %@", v5);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] parsed groundTruth predictions to jsonObjects successfully", v2, v3, v4, v5, 0);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] loaded non empty data predictions from groundTruth file", v2, v3, v4, v5, 0);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEl_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] started loading groundTruth predictions from filePath: %@");
}

void std::construct_at[abi:ne180100]<QP::LexemeValue,std::string &,std::string,CFRange &,QP::LexemeValue*>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t ___ZL21getUITextCheckerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return QP::U2Parser::U2Parser(v0);
}

void QP::U2Parser::U2Parser(std::__shared_weak_count **a1, std::__shared_weak_count **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
  if (*(char *)(a3 + 79) < 0) {
    operator delete(*(void **)(a3 + 56));
  }
}

void QP::U2Parser::lexemeForArgMediaTypeWithRange(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*((char *)a1 + 23) < 0) {
    a1 = (uint64_t *)*a1;
  }
  int v3 = 138412546;
  uint64_t v4 = a2;
  __int16 v5 = 2080;
  uint8_t v6 = a1;
  _os_log_debug_impl(&dword_224D85000, log, OS_LOG_TYPE_DEBUG, "Found matching Media lexeme for %@ with type %s", (uint8_t *)&v3, 0x16u);
}

void QP::U2Parser::parseInternal()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Unable to parse: no locale set", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Empty U2 output", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Unable to parse: token not found in user query", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] Invalid U2 output", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[QPNLU][qid=%ld] ECR request for all visual identifiers failed: %@");
}

{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_224D85000, v0, OS_LOG_TYPE_DEBUG, "[QPNLU][qid=%ld] Starting U2 parse", v1, 0xCu);
}

void QP::U2Parser::parseInternal(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 25;
  _os_log_fault_impl(&dword_224D85000, log, OS_LOG_TYPE_FAULT, "[QPNLU] [Recurring Failure] U2 parsing timed out %d times", (uint8_t *)v1, 8u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_224D85000, log, OS_LOG_TYPE_ERROR, "[QPNLU] U2 parsing timed out", v1, 2u);
}

void QP::createEmbeddingString()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_224D85000, v0, v1, "[qid=%ld] unsupported character in (%@) avoiding embedding string");
}

void ___ZN2QPL26u2UnderstandingWithTimeoutEPU31objcproto20QUUnderstandingModel11objc_objectPK10__CFStringP7QUSpansbjPU15__autoreleasingP7NSError_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_224D85000, v0, v1, "[QPNLU] Unable to use U2: %@", v2, v3, v4, v5, v6);
}

void QP::QueryParserEngine::QueryParserEngine(QP::Parser **a1, void *a2)
{
  std::unique_ptr<QP::Parser>::reset[abi:ne180100](a1, 0);
  uint64_t v3 = (std::__shared_weak_count *)a2[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)a2[4];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  uint8_t v6 = (std::__shared_weak_count *)a2[2];
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

uint64_t QP::QueryParserEngine::QueryParserEngine(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t QP::QueryParserEngine::init(std::__shared_weak_count **a1, std::__shared_weak_count **a2, std::__shared_weak_count **a3, uint64_t a4)
{
  uint64_t v7 = *a1;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
  if (*a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a3);
  }
  return MEMORY[0x22A623E20](a4, 0x60C4070DDB9DBLL);
}

uint64_t QP::QueryParserEngine::loadKnowledgeSource(uint64_t a1)
{
  uint64_t v2 = (std::__shared_weak_count *)OUTLINED_FUNCTION_1_2(a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return MEMORY[0x22A623E20](v1, 0x10E1C40B7CCE3EALL);
}

{
  uint64_t v1;
  std::__shared_weak_count *v2;

  uint64_t v2 = (std::__shared_weak_count *)OUTLINED_FUNCTION_1_2(a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return MEMORY[0x22A623E20](v1, 0x10E1C4060E1D930);
}

void QP::QueryParserEngine::loadKnowledgeSource(uint64_t a1)
{
  uint64_t v1 = (std::__shared_weak_count *)OUTLINED_FUNCTION_1_2(a1);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  OUTLINED_FUNCTION_0_1();
}

uint64_t QP::QueryParserEngine::loadKnowledgeSource(std::__shared_weak_count **a1, std::__shared_weak_count **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
  return MEMORY[0x22A623E20](a3, 0x10E1C40B6D21925);
}

void QP::QueryParserEngine::setString(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_224D85000, log, OS_LOG_TYPE_DEBUG, "[QPNLU][qid=%ld] queryRef (%@)", (uint8_t *)&v4, 0x16u);
}

void std::construct_at[abi:ne180100]<QP::U2Parser,std::shared_ptr<QP::ParserConfiguration> &,std::shared_ptr<QP::ParserGrammar> &,std::shared_ptr<QP::Lexer> &,QP::U2Parser*>(uint64_t a1)
{
  uint64_t v2 = (std::__shared_weak_count *)OUTLINED_FUNCTION_1_2(a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*v1);
  }
}

void std::construct_at[abi:ne180100]<QP::LLMParser,std::shared_ptr<QP::ParserConfiguration> &,std::shared_ptr<QP::ParserGrammar> &,std::shared_ptr<QP::Lexer> &,std::shared_ptr<QP::Lexer> &,QP::LLMParser*>(std::__shared_weak_count **a1, std::__shared_weak_count **a2, std::__shared_weak_count **a3)
{
  uint64_t v5 = *a1;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
  if (*a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a3);
  }
}

uint64_t QP::Formatter::Formatter(uint64_t a1)
{
  uint64_t v2 = (std::__shared_weak_count *)OUTLINED_FUNCTION_1_2(a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return MEMORY[0x22A623E20](v1, 0x60C40FA586727);
}

void std::construct_at[abi:ne180100]<QP::LexemeExtended,char const(&)[18],std::string,std::string,CFRange &,QP::LexemeExtended*>()
{
  OUTLINED_FUNCTION_0_2();
  if (v2 < 0) {
    operator delete(*v1);
  }
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void QPSpotlightKnowledgeSourceRefresh_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_224D85000, v0, v1, "lexicon loading - timedout", v2, v3, v4, v5, v6);
}

void QPSpotlightKnowledgeContextUpdateResources()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_224D85000, v0, v1, "safety: missing config", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_224D85000, v0, v1, "safety: missing resource", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_224D85000, v0, v1, "safety: unable to load data map", v2, v3, v4, v5, v6);
}

void QPSpotlightKnowledgeContextUpdateResources(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_224D85000, log, OS_LOG_TYPE_ERROR, "safety: unsupported major version: %d != %d", (uint8_t *)v4, 0xEu);
}

void QPSpotlightKnowledgeContextUpdateResources(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_224D85000, a2, OS_LOG_TYPE_ERROR, "safety: unable to load config %@", (uint8_t *)&v3, 0xCu);
}

void __QPSpotlightKnowledgeSourceRefresh_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_224D85000, v0, v1, "could not reload lexicon", v2, v3, v4, v5, v6);
}

void ___ZL42QPSpotlightKnowledgeContextUpdateResourcesP26_SpotlightKnowledgeContexthU13block_pointerFvP9__CFErrorE_block_invoke_cold_1(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_224D85000, log, OS_LOG_TYPE_ERROR, "unable to load lexicon cache in %.1fms", (uint8_t *)&v2, 0xCu);
}

void QP::Formatter::updateParseWithAttribute(void *a1)
{
  _Block_object_dispose(a1, 8);
  int v2 = (std::__shared_weak_count *)a1[6];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void QP::ParserConfiguration::loadConfigurationResource(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_224D85000, a2, OS_LOG_TYPE_ERROR, "QueryParser: %@ (error)", (uint8_t *)&v3, 0xCu);
}

void nlp::addListNode()
{
  __assert_rtn("addListNode", "BurstTrie.cpp", 578, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::advanceMapCursorTrieList()
{
  __assert_rtn("advanceMapCursorTrieList", "BurstTrie.cpp", 1855, "cursor->prfxlen <= head->restlen");
}

uint64_t CCDigest()
{
  return MEMORY[0x270ED7970]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x270ED7990]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFAttributedStringRef CFAttributedStringCreateCopy(CFAllocatorRef alloc, CFAttributedStringRef aStr)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B8](alloc, aStr);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x270EE43C0](alloc, maxLength);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x270EE43E0](aStr, loc, attrName, effectiveRange);
}

CFTypeRef CFAttributedStringGetAttributeAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFTypeRef)MEMORY[0x270EE43E8](aStr, loc, attrName, inRange.location, inRange.length, longestEffectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x270EE43F0](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x270EE4400](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x270EE4408](aStr);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x270EE4410]();
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
}

void CFAttributedStringReplaceAttributedString(CFMutableAttributedStringRef aStr, CFRange range, CFAttributedStringRef replacement)
{
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x270EE44C0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x270EE44C8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

uint64_t CFBundleCopyLocalizationForLocalizationInfo()
{
  return MEMORY[0x270EE4568]();
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

uint64_t CFBundleGetLocalizationInfoForLocalization()
{
  return MEMORY[0x270EE45F8]();
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x270EE46B0](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x270EE46B8](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x270EE46C0]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x270EE46C8](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x270EE46D0](calendar, v3, at);
}

CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar)
{
  return MEMORY[0x270EE46D8](calendar);
}

CFCalendarIdentifier CFCalendarGetIdentifier(CFCalendarRef calendar)
{
  return (CFCalendarIdentifier)MEMORY[0x270EE46E0](calendar);
}

CFRange CFCalendarGetMaximumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit)
{
  CFIndex v2 = MEMORY[0x270EE46E8](calendar, unit);
  result.CFIndex length = v3;
  result.location = v2;
  return result;
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4 = MEMORY[0x270EE46F0](calendar, smallerUnit, biggerUnit, at);
  result.CFIndex length = v5;
  result.location = v4;
  return result;
}

void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy)
{
}

void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale)
{
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4748](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x270EE4878](allocator, tmplate, options, locale);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4888](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A78]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x270EE4AA0](allocator, locale);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4AC0]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
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

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x270EE4F50](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

uint64_t CFStringEncodingUnicodeToBytes()
{
  return MEMORY[0x270EE5140]();
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x270EE5200](theString, theIndex);
  result.CFIndex length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E0]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E8]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5350](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x270EE5418](anURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

uint64_t DDResultGetMatchedString()
{
  return MEMORY[0x270F251C8]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x270F251E0]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x270F251F0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x270F25200]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x270F25208]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x270F25210]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x270F25238]();
}

uint64_t DDScannerCreateWithCacheFile()
{
  return MEMORY[0x270F25248]();
}

uint64_t DDScannerEnableOptionalSource()
{
  return MEMORY[0x270F25258]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x270F25260]();
}

uint64_t DDScannerSetClientTables()
{
  return MEMORY[0x270F25268]();
}

uint64_t DDScannerSetOptions()
{
  return MEMORY[0x270F25270]();
}

uint64_t NLDependencyParserCopyNounPhrasesFromSentence()
{
  return MEMORY[0x270F1A818]();
}

uint64_t NLDependencyParserCreateWithOptions()
{
  return MEMORY[0x270F1A820]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x270F1A858]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x270F1A860]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x270F1A868]();
}

uint64_t NLTaggerSetLocaleForRange()
{
  return MEMORY[0x270F1A870]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x270F1A878]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t SICurrenciesGetCurrencyCode()
{
  return MEMORY[0x270F76D58]();
}

uint64_t SIDataMapCreateWithOptions()
{
  return MEMORY[0x270F76D60]();
}

uint64_t SIDataMapGetCount()
{
  return MEMORY[0x270F76D68]();
}

uint64_t SIDataMapLookupKey()
{
  return MEMORY[0x270F76D70]();
}

uint64_t SIDataMapRelease()
{
  return MEMORY[0x270F76D78]();
}

uint64_t SIGeneralTrieAddKeyWithScore()
{
  return MEMORY[0x270F76D80]();
}

uint64_t SIGeneralTrieContainsKey()
{
  return MEMORY[0x270F76D88]();
}

uint64_t SIGeneralTrieCreateMutableWithOptions()
{
  return MEMORY[0x270F76D90]();
}

uint64_t SIGeneralTrieGetCount()
{
  return MEMORY[0x270F76D98]();
}

uint64_t SIGeneralTrieRelease()
{
  return MEMORY[0x270F76DA0]();
}

uint64_t SIGeneralTrieSearch()
{
  return MEMORY[0x270F76DA8]();
}

uint64_t SIGeoIndexCreateWithOptions()
{
  return MEMORY[0x270F76DB0]();
}

uint64_t SIGeoIndexEnumerateGeoIDForString()
{
  return MEMORY[0x270F76DB8]();
}

uint64_t SIGeoIndexLookupEntry()
{
  return MEMORY[0x270F76DC0]();
}

uint64_t SIGeoIndexRelease()
{
  return MEMORY[0x270F76DC8]();
}

uint64_t SILanguagesGetLanguageIDForIdentifier()
{
  return MEMORY[0x270F76DE0]();
}

uint64_t SILexiconCacheCreateWithOptions()
{
  return MEMORY[0x270F76DE8]();
}

uint64_t SILexiconCacheEnumerateAnnotations()
{
  return MEMORY[0x270F76DF0]();
}

uint64_t SILexiconCacheEnumerateOVSAnnotationsInString()
{
  return MEMORY[0x270F76DF8]();
}

uint64_t SILexiconCacheIsAvailable()
{
  return MEMORY[0x270F76E00]();
}

uint64_t SILexiconCacheLoad()
{
  return MEMORY[0x270F76E08]();
}

uint64_t SILexiconCacheRelease()
{
  return MEMORY[0x270F76E10]();
}

uint64_t SILocalizationCreateWithOptions()
{
  return MEMORY[0x270F76E18]();
}

uint64_t SILocalizationGetTokenType()
{
  return MEMORY[0x270F76E20]();
}

uint64_t SILocalizationLoad()
{
  return MEMORY[0x270F76E28]();
}

uint64_t SILocalizationRelease()
{
  return MEMORY[0x270F76E30]();
}

uint64_t SITrieCompletionGetCompletion()
{
  return MEMORY[0x270F76E38]();
}

uint64_t SITrieCompletionGetLength()
{
  return MEMORY[0x270F76E40]();
}

uint64_t SITrieCompletionGetPayload()
{
  return MEMORY[0x270F76E48]();
}

uint64_t SITrieCompletionGetScore()
{
  return MEMORY[0x270F76E50]();
}

uint64_t SITrieCompletionQueueCreate()
{
  return MEMORY[0x270F76E58]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x270F4A748]();
}

uint64_t _MDPlistContainerGetPlistObjectAtKeyPath()
{
  return MEMORY[0x270F4A780]();
}

uint64_t _MDPlistDictionaryGetCount()
{
  return MEMORY[0x270F4A790]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x270F4A7A0]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x270F4A7A8]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x270F4A7C0]();
}

uint64_t _MDPlistStringGetValue()
{
  return MEMORY[0x270F4A7C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E18](retstr, __val);
}

void std::exception::~exception(std::exception *this)
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

void operator delete(void *__p)
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x270F18A68]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t intentArgLabel()
{
  return MEMORY[0x270F58CB0]();
}

uint64_t intentArgShortLabel()
{
  return MEMORY[0x270F58CB8]();
}

uint64_t intentLabel()
{
  return MEMORY[0x270F58CC0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

UBool u_isWhitespace(UChar32 c)
{
  return MEMORY[0x270F99538](*(void *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x270F99588](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t unum_close()
{
  return MEMORY[0x270F997A0]();
}

uint64_t unum_open()
{
  return MEMORY[0x270F997F0]();
}

uint64_t unum_parseDouble()
{
  return MEMORY[0x270F99800]();
}

uint64_t uset_close()
{
  return MEMORY[0x270F99960]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x270F99970]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x270F99990]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_release(xpc_object_t object)
{
}