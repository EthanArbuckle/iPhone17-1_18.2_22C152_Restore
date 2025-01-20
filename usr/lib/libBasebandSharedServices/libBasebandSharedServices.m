void Factory::Factory(Factory *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_270EAE558;
}

void Factory::~Factory(Factory *this)
{
  v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void Registry::Registry(Registry *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  v2 = (char *)operator new(0x48uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)v2 = &unk_270EAE5C8;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((void *)this + 3) = v2;
  *(_OWORD *)(v2 + 24) = 0u;
  *((void *)this + 2) = v2 + 24;
}

{
  char *v2;

  *(void *)this = 0;
  *((void *)this + 1) = 0;
  v2 = (char *)operator new(0x48uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)v2 = &unk_270EAE5C8;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((void *)this + 3) = v2;
  *(_OWORD *)(v2 + 24) = 0u;
  *((void *)this + 2) = v2 + 24;
}

uint64_t Registry::getServerConnection@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  v2 = *(uint64_t **)(this + 16);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  *a2 = v4;
  a2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t Registry::getRouterServer@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 16);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v3 = *(void *)(v2 + 24);
  *a2 = v4;
  a2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t Registry::getCommandDriverFactory@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 16);
  uint64_t v4 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  *a2 = v4;
  a2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return (uint64_t)this + 16;
}

void std::__shared_ptr_emplace<RegistryModel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAE5C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<RegistryModel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAE5C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<RegistryModel>::__on_zero_shared(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (std::__shared_weak_count *)a1[6];
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = (std::__shared_weak_count *)a1[6];
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
LABEL_7:
  uint64_t v4 = (std::__shared_weak_count *)a1[4];
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}