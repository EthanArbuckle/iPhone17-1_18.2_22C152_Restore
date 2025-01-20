uint64_t specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = *v2;
  *(void *)(*v2 + 384) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  else
  {
    *(void *)(v4 + 392) = a1;
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = *v2;
  *(void *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  else
  {
    *(void *)(v4 + 416) = a1;
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = *v2;
  *(void *)(*v2 + 432) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  else
  {
    *(void *)(v4 + 440) = a1;
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = *v2;
  *(void *)(*v2 + 456) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  else
  {
    *(void *)(v4 + 464) = a1;
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = *v2;
  *(void *)(*v2 + 480) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  else
  {
    *(void *)(v4 + 488) = a1;
    v5 = specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t partial apply for closure #1 in static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:)()
{
  return closure #1 in static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:)(*(void *)(v0 + 16));
}

uint64_t sub_25F8E637C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #3 in static TokenGenerator.getTurnsForMessage(for:with:binding:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return closure #3 in static TokenGenerator.getTurnsForMessage(for:with:binding:)(a1, a2);
}

uint64_t partial apply for closure #1 in closure #1 in TokenGenerator._streamResponse<A>(configuration:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in TokenGenerator._streamCompletion<A>(configuration:)(a1, *(void *)(v2 + 16), a2, MEMORY[0x263F41618], MEMORY[0x263F41480], MEMORY[0x263F41600]);
}

uint64_t partial apply for closure #2 in closure #1 in TokenGenerator._streamResponse<A>(configuration:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in TokenGenerator._streamCompletion<A>(configuration:)(a1, *(void *)(v2 + 16), a2, MEMORY[0x263F415F8], MEMORY[0x263F41478], MEMORY[0x263F415D8]);
}

uint64_t partial apply for closure #1 in static TokenGenerator.scrubIfNeeded(inputPrompt:stringRenderedPromptSanitizerWithConfiguration:)(uint64_t a1, uint64_t a2)
{
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in InferenceRequestHandler.handleRequest(data:configuration:);
  return closure #1 in static TokenGenerator.scrubIfNeeded(inputPrompt:stringRenderedPromptSanitizerWithConfiguration:)(a1, a2);
}

uint64_t sub_25F8E6538()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in TokenStream.init(throwing:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in TokenStream.init(throwing:)(a1, v4);
}

uint64_t partial apply for closure #2 in TokenStream.init(throwing:)()
{
  return closure #2 in TokenStream.init(throwing:)(*(void *)(v0 + 16));
}

uint64_t sub_25F8E662C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error)(uint64_t a1)
{
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  v6 = (uint64_t (*)(uint64_t, void (*)(void)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error)
                                                       + async function pointer to thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error));
  return v6(a1, v4);
}

uint64_t sub_25F8E671C()
{
  return objectdestroy_293Tm(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
}

uint64_t sub_25F8E6814()
{
  return objectdestroy_17Tm(type metadata accessor for TokenGeneratorChatResponseStringStream);
}

uint64_t objectdestroy_17Tm(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v1 + v4, v6);
  type metadata accessor for PromptCompletionStream(0);
  swift_release();
  uint64_t v7 = v1 + v4 + *(int *)(v2 + 20);
  uint64_t v8 = type metadata accessor for StringResponseSanitizerWithConfiguration();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = v1 + v4 + *(int *)(v2 + 24);
  uint64_t v11 = type metadata accessor for GenerativeFunctionInstrumenter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  return MEMORY[0x270FA0238](v1, v4 + v5, v3 | 7);
}

uint64_t partial apply for specialized closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect()(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for TokenGeneratorChatResponseStringStream(0) - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to specialized closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect()
                                                + async function pointer to specialized closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect());
  return v7(a1, v5);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v9;

  uint64_t v4 = *(void *)(type metadata accessor for TokenGeneratorCompletionResponseStringStream(0) - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to specialized closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect()
                                                + async function pointer to specialized closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect());
  return v7(a1, v5);
}

uint64_t partial apply for specialized closure #2 in closure #1 in withTimeout<A>(timeout:_:)(uint64_t a1)
{
  double v4 = *(double *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  uint64_t v6 = async function pointer to specialized closure #2 in closure #1 in withTimeout<A>(timeout:_:);
  return ((uint64_t (*)(uint64_t, double))((char *)&async function pointer to specialized closure #2 in closure #1 in withTimeout<A>(timeout:_:)
                                                  + v6))(a1, v4);
}

{
  uint64_t v1;
  uint64_t v2;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  double v4 = *(double *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  uint64_t v6 = async function pointer to specialized closure #2 in closure #1 in withTimeout<A>(timeout:_:);
  return ((uint64_t (*)(uint64_t, double))((char *)&async function pointer to specialized closure #2 in closure #1 in withTimeout<A>(timeout:_:)
                                                  + v6))(a1, v4);
}

uint64_t objectdestroy_201Tm()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = type metadata accessor for GenerativeFunctionInstrumenter();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 72) & ~v4;
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + v7 + 8) & ~v7;
  uint64_t v9 = v4 | v7 | 7;
  unint64_t v10 = ((((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v2);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v10, v9);
}

uint64_t partial apply for closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v20 = v1[2];
  uint64_t v18 = v1[3];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for GenerativeFunctionInstrumenter() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v10 = (*(void *)(*(void *)(v5 - 8) + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = (uint64_t)v1 + v7;
  uint64_t v12 = *(void *)((char *)v1 + v8);
  uint64_t v13 = (uint64_t)v1 + v9;
  uint64_t v14 = *(void *)((char *)v1 + v10);
  uint64_t v15 = *(void *)((char *)v1 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8));
  v16 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v16;
  void *v16 = v3;
  v16[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(a1, v11, v12, v13, v14, v15, v20, v18);
}

uint64_t partial apply for closure #2 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 72);
  long long v6 = *(_OWORD *)(v1 + 88);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](closure #2 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:), 0, 0);
}

uint64_t partial apply for closure #2 in closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[9];
  uint64_t v7 = v1[10];
  uint64_t v8 = v1[11];
  uint64_t v10 = v1[12];
  uint64_t v9 = v1[13];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #2 in closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(a1, v6, v7, v8, v10, v9, v4, v5);
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in closure #2 in closure #1 in TokenGenerator._complete<A, B, C, D>(type:configuration:generatingContent:instrumenter:_:)(a1);
}

uint64_t partial apply for closure #1 in TokenGenerator.completeGenerable<A, B, C>(type:configuration:generativeFunctionInstrumenter:scrubbedInputPrompt:)(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  uint64_t v9 = v1[10];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in TokenGenerator.completeGenerable<A, B, C>(type:configuration:generativeFunctionInstrumenter:scrubbedInputPrompt:)(a1, v6, v7, v8, v9, v12, v4, v5);
}

uint64_t sub_25F8E7678()
{
  return objectdestroy_293Tm(&demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>);
}

uint64_t objectdestroy_293Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t objectdestroy_164Tm()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_25F8E7A6C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect()(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1
     + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in closure #1 in TokenGeneratorResponseStringStreamAsyncSequence.collect()(a1, v6, v4, v5);
}

uint64_t objectdestroy_168Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25F8E7E00()
{
  return objectdestroy_17Tm(type metadata accessor for TokenGeneratorCompletionResponseStringStream);
}

uint64_t partial apply for closure #1 in closure #1 in TokenGenerator._oneShotResponse<A, B>(type:configuration:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in closure #1 in TokenGenerator._streamResponse<A>(configuration:)(a1, a2);
}

uint64_t partial apply for closure #1 in closure #1 in TokenGenerator.completeGenerable<A, B, C>(type:configuration:generativeFunctionInstrumenter:scrubbedInputPrompt:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #2 in closure #1 in TokenGenerator._streamResponse<A>(configuration:)(a1, a2);
}

uint64_t Prompt.overestimatedTokenCount()()
{
  uint64_t v29 = type metadata accessor for Prompt.Component.Value();
  uint64_t v0 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v2 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for Prompt.Component();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Prompt.components.getter();
  int64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    v30 = (void *)MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v10 = *(unsigned __int8 *)(v8 + 64);
    v24[1] = v6;
    uint64_t v11 = v6 + ((v10 + 32) & ~v10);
    uint64_t v25 = *(void *)(v8 + 56);
    v26 = v9;
    uint64_t v12 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v27 = v8;
    do
    {
      uint64_t v13 = v28;
      v26(v5, v11, v28);
      Prompt.Component.value.getter();
      uint64_t v14 = Prompt.Component.Value.overestimatedTokenCount()();
      (*v12)(v2, v29);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v13);
      uint64_t v15 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1);
        uint64_t v15 = v30;
      }
      unint64_t v17 = v15[2];
      unint64_t v16 = v15[3];
      if (v17 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
        uint64_t v15 = v30;
      }
      v15[2] = v17 + 1;
      v15[v17 + 4] = v14;
      v11 += v25;
      --v7;
    }
    while (v7);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = v15[2];
    if (v19)
    {
LABEL_9:
      uint64_t v20 = 0;
      v21 = v15 + 4;
      while (1)
      {
        uint64_t v22 = *v21++;
        BOOL v23 = __OFADD__(v20, v22);
        v20 += v22;
        if (v23) {
          break;
        }
        if (!--v19) {
          goto LABEL_15;
        }
      }
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
    uint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v19) {
      goto LABEL_9;
    }
  }
  uint64_t v20 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t TokenGenerator._overestimateTokenCount<A>(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:)
                                                         + async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = protocol witness for ChatLanguageModelProvidingTokenCountable._tokenCount<A>(configuration:) in conformance TokenGenerator;
  return v9(a1, a2, a3);
}

{
  uint64_t v3;
  void *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:)
                                                         + async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = protocol witness for CompletionLanguageModelProvidingTokenCountable._tokenCount<A>(configuration:) in conformance TokenGenerator;
  return v9(a1, a2, a3);
}

uint64_t protocol witness for CompletionLanguageModelProvidingTokenCountOverestimatable._overestimateTokenCount<A>(configuration:) in conformance TokenGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:)
                                                         + async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = protocol witness for CompletionLanguageModelProvidingTokenCountable._tokenCount<A>(configuration:) in conformance TokenGenerator;
  return v9(a1, a2, a3);
}

uint64_t protocol witness for CompletionLanguageModelProvidingTokenCountOverestimatable._overestimateTokenCountSync<A>(configuration:) in conformance TokenGenerator()
{
  return specialized TokenGenerator._overestimateTokenCountSync<A>(configuration:)();
}

uint64_t protocol witness for ChatLanguageModelProvidingTokenCountOverestimatable._overestimateTokenCount<A>(configuration:) in conformance TokenGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:)
                                                         + async function pointer to specialized TokenGenerator._overestimateTokenCount<A>(configuration:));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = protocol witness for CompletionLanguageModelProvidingTokenCountable._tokenCount<A>(configuration:) in conformance TokenGenerator;
  return v9(a1, a2, a3);
}

uint64_t protocol witness for ChatLanguageModelProvidingTokenCountOverestimatable._overestimateTokenCountSync<A>(configuration:) in conformance TokenGenerator()
{
  return specialized TokenGenerator._overestimateTokenCountSync<A>(configuration:)();
}

uint64_t Prompt.Component.Value.overestimatedTokenCount()()
{
  uint64_t v1 = type metadata accessor for SpecialToken();
  uint64_t v51 = *(void *)(v1 - 8);
  v52 = (uint64_t (*)(char *, char *, uint64_t))v1;
  MEMORY[0x270FA5388](v1);
  v50 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for BindableVariable();
  uint64_t v53 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Prompt();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Prompt.Component.Value();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (long long *)((char *)&v49 - v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v49 - v15, v0, v10);
  int v17 = (*(uint64_t (**)(long long *, uint64_t))(v11 + 88))(v16, v10);
  if (v17 == *MEMORY[0x263F62070])
  {
    (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
    uint64_t v18 = (*(uint64_t (**)(char *, long long *, uint64_t))(v7 + 32))(v9, v16, v6);
    uint64_t v19 = Prompt.overestimatedTokenCount()(v18);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v19;
  }
  if (v17 == *MEMORY[0x263F62080])
  {
    (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
    uint64_t v20 = *(char **)v16;
    int64_t v21 = *(void *)(*(void *)v16 + 16);
    if (v21)
    {
      v54[0] = MEMORY[0x263F8EE78];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
      BOOL v23 = *(uint64_t (**)(char *, char *, uint64_t))(v7 + 16);
      uint64_t v22 = v7 + 16;
      uint64_t v24 = *(unsigned __int8 *)(v22 + 64);
      v50 = v20;
      uint64_t v25 = &v20[(v24 + 32) & ~v24];
      uint64_t v51 = *(void *)(v22 + 56);
      v52 = v23;
      v26 = (void (**)(char *, uint64_t))(v22 - 8);
      uint64_t v53 = v22;
      do
      {
        uint64_t v27 = v52(v9, v25, v6);
        uint64_t v28 = Prompt.overestimatedTokenCount()(v27);
        (*v26)(v9, v6);
        uint64_t v29 = v54[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v29 + 16) + 1, 1);
          uint64_t v29 = v54[0];
        }
        unint64_t v31 = *(void *)(v29 + 16);
        unint64_t v30 = *(void *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v54[0];
        }
        *(void *)(v29 + 16) = v31 + 1;
        *(void *)(v29 + 8 * v31 + 32) = v28;
        v25 += v51;
        --v21;
      }
      while (v21);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v35 = *(void *)(v29 + 16);
      if (v35)
      {
LABEL_20:
        uint64_t v36 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v37 = *(void *)(v29 + 8 * v36 + 32);
          BOOL v38 = __OFADD__(v19, v37);
          v19 += v37;
          if (v38) {
            break;
          }
          if (v35 == ++v36)
          {
            swift_bridgeObjectRelease();
            return v19;
          }
        }
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v29 = MEMORY[0x263F8EE78];
      uint64_t v35 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v35) {
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v17 != *MEMORY[0x263F62078])
  {
    if (v17 == *MEMORY[0x263F62050] || v17 == *MEMORY[0x263F62068]) {
      return 1;
    }
    if (v17 == *MEMORY[0x263F62058])
    {
      (*(void (**)(long long *, uint64_t))(v11 + 8))(v16, v10);
      return 1;
    }
    if (v17 == *MEMORY[0x263F62048])
    {
      (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
      uint64_t v40 = v53;
      (*(void (**)(char *, long long *, uint64_t))(v53 + 32))(v5, v16, v3);
      uint64_t v41 = BindableVariable.toValue()();
      uint64_t v19 = Prompt.Component.Value.overestimatedTokenCount()(v41);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v3);
      return v19;
    }
    if (v17 == *MEMORY[0x263F62040])
    {
      (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
      v42 = v50;
      uint64_t v43 = v51;
      v44 = v52;
      (*(void (**)(char *, long long *, uint64_t (*)(char *, char *, uint64_t)))(v51 + 32))(v50, v16, v52);
      uint64_t v45 = SpecialToken.overestimatedTokenCount.getter();
      char v47 = v46;
      (*(void (**)(char *, uint64_t (*)(char *, char *, uint64_t)))(v43 + 8))(v42, v44);
      if (v47) {
        return 1;
      }
      else {
        return v45;
      }
    }
    if (v17 == *MEMORY[0x263F62030])
    {
      (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
      outlined init with take of AsyncIteratorProtocol(v16, (uint64_t)v54);
      __swift_project_boxed_opaque_existential_1(v54, v54[3]);
      uint64_t v48 = dispatch thunk of PromptComponentValueConvertible.toValue()();
      uint64_t v19 = Prompt.Component.Value.overestimatedTokenCount()(v48);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
      return v19;
    }
    (*(void (**)(long long *, uint64_t))(v11 + 8))(v16, v10);
    return 0;
  }
  (*(void (**)(long long *, uint64_t))(v11 + 96))(v16, v10);
  uint64_t v32 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t result = static Prompt.averageCharactersPerToken.getter();
  if (!result)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v32 != 0x8000000000000000 || result != -1) {
    return v32 / result;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t specialized TokenGenerator._overestimateTokenCountSync<A>(configuration:)()
{
  uint64_t v0 = type metadata accessor for Prompt();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  GenerativeConfigurationProtocol.promptContent.getter();
  uint64_t v4 = Prompt.overestimatedTokenCount()();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void (**v19)(char *, uint64_t);
  int v20;
  char *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t result;
  uint64_t v35;
  void (**v36)(char *, uint64_t);
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (**v45)(char *, uint64_t);
  void (**v46)(char *, uint64_t);
  int v47;
  uint64_t (**v48)(char *, uint64_t);
  void (**v49)(char *, char *, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;

  v52 = type metadata accessor for Prompt();
  uint64_t v45 = *(void (***)(char *, uint64_t))(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v51 = (char *)&v35 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = type metadata accessor for ChatMessageRole();
  char v46 = *(void (***)(char *, uint64_t))(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v35 - v5;
  uint64_t v7 = type metadata accessor for ChatMessagePrompt();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  GenerativeConfigurationProtocol.promptContent.getter();
  uint64_t v11 = v54;
  uint64_t v12 = *(void *)(v54 + 16);
  if (v12)
  {
    uint64_t v53 = (void *)MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12, 0);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v13 = v8 + 16;
    uint64_t v15 = (*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64);
    uint64_t v35 = v11;
    unint64_t v16 = v11 + v15;
    uint64_t v41 = *(void *)(v13 + 56);
    uint64_t v49 = (void (**)(char *, char *, uint64_t))(v46 + 2);
    v50 = v14;
    uint64_t v48 = (uint64_t (**)(char *, uint64_t))(v46 + 11);
    char v47 = *MEMORY[0x263F62108];
    int v17 = *MEMORY[0x263F62110];
    v39 = *MEMORY[0x263F62100];
    uint64_t v40 = v17;
    uint64_t v18 = *MEMORY[0x263F62118];
    uint64_t v37 = *MEMORY[0x263F620F8];
    BOOL v38 = v18;
    uint64_t v36 = v46 + 12;
    ++v45;
    ++v46;
    uint64_t v19 = (void (**)(char *, uint64_t))(v13 - 8);
    uint64_t v43 = v7;
    v44 = v4;
    v42 = v13;
    do
    {
      v50(v10, v16, v7);
      ChatMessagePrompt.role.getter();
      (*v49)(v4, v6, v1);
      uint64_t v20 = (*v48)(v4, v1);
      if (v20 == v47)
      {
        (*v36)(v4, v1);
        swift_bridgeObjectRelease();
      }
      else if (v20 != v40 && v20 != v39 && v20 != v38 && v20 != v37)
      {
        goto LABEL_34;
      }
      (*v46)(v6, v1);
      uint64_t v24 = v51;
      ChatMessagePrompt.prompt.getter();
      uint64_t v25 = Prompt.overestimatedTokenCount()();
      (*v45)(v24, v52);
      if (__OFADD__(v25, 2))
      {
        __break(1u);
        goto LABEL_32;
      }
      (*v19)(v10, v7);
      v26 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v26[2] + 1, 1);
        v26 = v53;
      }
      uint64_t v28 = v26[2];
      uint64_t v27 = v26[3];
      if (v28 >= v27 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
        v26 = v53;
      }
      v26[2] = v28 + 1;
      v26[v28 + 4] = v25 + 2;
      v16 += v41;
      --v12;
      uint64_t v7 = v43;
      uint64_t v4 = v44;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v29 = v26[2];
    if (!v29) {
      goto LABEL_28;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v26 = (void *)MEMORY[0x263F8EE78];
    uint64_t v29 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v29)
    {
LABEL_28:
      unint64_t v30 = 0;
LABEL_29:
      swift_bridgeObjectRelease();
      uint64_t result = v30 + 1;
      if (!__OFADD__(v30, 1)) {
        return result;
      }
      goto LABEL_33;
    }
  }
  unint64_t v30 = 0;
  unint64_t v31 = v26 + 4;
  while (1)
  {
    uint64_t v32 = *v31++;
    v33 = __OFADD__(v30, v32);
    v30 += v32;
    if (v33) {
      break;
    }
    if (!--v29) {
      goto LABEL_29;
    }
  }
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
  return result;
}

uint64_t specialized TokenGenerator._overestimateTokenCount<A>(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Prompt();
  v3[2] = v6;
  v3[3] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[4] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = specialized TokenGenerator._overestimateTokenCount<A>(configuration:);
  return GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt()(v7, a2, a3);
}

{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  uint64_t v6 = type metadata accessor for Prompt();
  v3[2] = v6;
  v3[3] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[4] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = specialized TokenGenerator._overestimateTokenCount<A>(configuration:);
  return GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt()(v7, a2, a3);
}

uint64_t specialized TokenGenerator._overestimateTokenCount<A>(configuration:)()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenGeneratorResponsePromptCompletionStream.AsyncIterator.next();
  }
  else {
    uint64_t v2 = specialized TokenGenerator._overestimateTokenCount<A>(configuration:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::Int v4;
  uint64_t (*v5)(Swift::Int);
  uint64_t v7;

  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = Prompt.overestimatedTokenCount()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(Swift::Int))v0[1];
  return v5(v4);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = specialized TokenGenerator._overestimateTokenCount<A>(configuration:);
  }
  else {
    uint64_t v2 = specialized TokenGenerator._overestimateTokenCount<A>(configuration:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a3;
  v4[13] = a4;
  v4[10] = a1;
  v4[11] = a2;
  uint64_t v5 = type metadata accessor for Prompt();
  v4[14] = v5;
  v4[15] = *(void *)(v5 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)));
  v4[18] = v6;
  v4[19] = *(void *)(v6 - 8);
  v4[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:))?);
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionDifference<Character>);
  v4[23] = v7;
  v4[24] = *(void *)(v7 - 8);
  v4[25] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  v4[26] = v8;
  v4[27] = *(void *)(v8 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Prompt.Attachment();
  v4[41] = v9;
  v4[42] = *(void *)(v9 - 8);
  v4[43] = swift_task_alloc();
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Prompt.Delimiter();
  v4[47] = v10;
  v4[48] = *(void *)(v10 - 8);
  v4[49] = swift_task_alloc();
  v4[50] = swift_task_alloc();
  v4[51] = swift_task_alloc();
  v4[52] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  v4[53] = v11;
  v4[54] = *(void *)(v11 - 8);
  v4[55] = swift_task_alloc();
  v4[56] = swift_task_alloc();
  v4[57] = swift_task_alloc();
  v4[58] = swift_task_alloc();
  v4[59] = swift_task_alloc();
  v4[60] = swift_task_alloc();
  v4[61] = swift_task_alloc();
  v4[62] = swift_task_alloc();
  v4[63] = swift_task_alloc();
  v4[64] = swift_task_alloc();
  v4[65] = swift_task_alloc();
  v4[66] = swift_task_alloc();
  v4[67] = swift_task_alloc();
  v4[68] = swift_task_alloc();
  v4[69] = swift_task_alloc();
  v4[70] = swift_task_alloc();
  v4[71] = swift_task_alloc();
  v4[72] = swift_task_alloc();
  v4[73] = swift_task_alloc();
  v4[74] = swift_task_alloc();
  v4[75] = swift_task_alloc();
  v4[76] = swift_task_alloc();
  v4[77] = swift_task_alloc();
  return MEMORY[0x270FA2498](static TokenGenerator.scrubPrompt(_:scrub:), 0, 0);
}

uint64_t static TokenGenerator.scrubPrompt(_:scrub:)()
{
  v150 = v0;
  uint64_t v1 = Prompt.string.getter();
  uint64_t v3 = v2;
  uint64_t v4 = Prompt.delimiters.getter();
  uint64_t v5 = Prompt.attachments.getter();
  uint64_t v132 = v1;
  v0[2] = v1;
  v0[3] = v3;
  int64_t v6 = *(void *)(v4 + 16);
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  v147 = v0;
  uint64_t v133 = v3;
  uint64_t v135 = v5;
  if (v6)
  {
    uint64_t v144 = v0[54];
    uint64_t v8 = v0[48];
    v149 = (void *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
    uint64_t v10 = v8 + 16;
    uint64_t v9 = v11;
    unint64_t v12 = v4 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v141 = *(void *)(v10 + 56);
    uint64_t v13 = v7;
    do
    {
      uint64_t v14 = v0[77];
      uint64_t v15 = v0[52];
      uint64_t v16 = v0[47];
      v9(v15, v12, v16);
      v9(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, uint64_t))(v10 - 8))(v15, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v13[2] + 1, 1);
        uint64_t v13 = v149;
      }
      unint64_t v18 = v13[2];
      unint64_t v17 = v13[3];
      uint64_t v0 = v147;
      if (v18 >= v17 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
        uint64_t v13 = v149;
      }
      uint64_t v19 = v147[77];
      v13[2] = v18 + 1;
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v19, (uint64_t)v13+ ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80))+ *(void *)(v144 + 72) * v18, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      v12 += v141;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    uint64_t v20 = v135;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    int64_t v21 = *(void *)(v135 + 16);
    if (v21) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v20 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    int64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
LABEL_9:
      uint64_t v145 = v0[54];
      uint64_t v22 = v0[42];
      v149 = v7;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
      BOOL v23 = *(void (**)(uint64_t, unint64_t, uint64_t))(v22 + 16);
      v22 += 16;
      unint64_t v24 = v20 + ((*(unsigned __int8 *)(v22 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 64));
      uint64_t v139 = *(void *)(v22 + 56);
      v137 = (void (**)(uint64_t, uint64_t))(v22 - 8);
      uint64_t v25 = v7;
      v26 = v23;
      do
      {
        uint64_t v27 = v0[76];
        unint64_t v28 = v0[46];
        uint64_t v29 = v0[41];
        v26(v28, v24, v29);
        v26(v27, v28, v29);
        swift_storeEnumTagMultiPayload();
        (*v137)(v28, v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v25[2] + 1, 1);
          uint64_t v25 = v149;
        }
        unint64_t v31 = v25[2];
        unint64_t v30 = v25[3];
        uint64_t v0 = v147;
        if (v31 >= v30 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
          uint64_t v25 = v149;
        }
        uint64_t v32 = v147[76];
        v25[2] = v31 + 1;
        outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v32, (uint64_t)v25+ ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80))+ *(void *)(v145 + 72) * v31, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        v24 += v139;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
  v149 = v13;
  specialized Array.append<A>(contentsOf:)((uint64_t)v25);
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(&v149);
  swift_bridgeObjectRelease();
  v33 = v149;
  swift_bridgeObjectRetain();
  uint64_t v34 = specialized _ArrayProtocol.filter(_:)((uint64_t)v33, v132, v133);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v35 = *(void *)(v34 + 16);
  if (!v35)
  {
    swift_bridgeObjectRelease();
    unint64_t v40 = MEMORY[0x263F8EE78];
LABEL_72:
    swift_bridgeObjectRelease();
    v0[78] = v40;
    v118 = (int *)v0[12];
    uint64_t v120 = v0[2];
    uint64_t v119 = v0[3];
    v0[79] = v120;
    v0[80] = v119;
    v148 = (uint64_t (*)(uint64_t, uint64_t))((char *)v118 + *v118);
    swift_bridgeObjectRetain();
    v121 = (void *)swift_task_alloc();
    v0[81] = v121;
    void *v121 = v0;
    v121[1] = static TokenGenerator.scrubPrompt(_:scrub:);
    return v148(v120, v119);
  }
  uint64_t v36 = v0[54];
  uint64_t v37 = v0[48];
  uint64_t v38 = v0[42];
  uint64_t v130 = v0[27];
  uint64_t v131 = 0;
  uint64_t v128 = v0[26];
  uint64_t v39 = v34 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  uint64_t v129 = *(void *)(v36 + 72);
  v140 = (void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
  v136 = (void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
  v138 = (void (**)(uint64_t, uint64_t))(v37 + 8);
  v134 = (void (**)(uint64_t, uint64_t))(v38 + 8);
  v125 = (void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
  v126 = (void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
  v123 = v0 + 39;
  v124 = v0 + 38;
  v127 = v0 + 40;
  unint64_t v40 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v41 = v0[75];
    uint64_t v42 = v0[74];
    outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v39, v41, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v41, v42, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v44 = v0[74];
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v45 = v0[46];
      uint64_t v46 = v0[41];
      (*v136)(v45, v44, v46);
      uint64_t v47 = Prompt.Attachment.position.getter();
      uint64_t v48 = (uint64_t (**)(uint64_t, uint64_t))v134;
    }
    else
    {
      uint64_t v45 = v0[52];
      uint64_t v46 = v0[47];
      (*v140)(v45, v44, v46);
      uint64_t v47 = Prompt.Delimiter.position.getter();
      uint64_t v48 = (uint64_t (**)(uint64_t, uint64_t))v138;
    }
    uint64_t result = (*v48)(v45, v46);
    uint64_t v50 = v47 + v131;
    if (__OFADD__(v47, v131)) {
      break;
    }
    uint64_t v143 = v35;
    unint64_t v146 = v40;
    uint64_t v51 = v0[75];
    uint64_t v52 = v0[73];
    uint64_t v53 = v147[2];
    unint64_t v54 = v147[3];
    swift_bridgeObjectRetain();
    unint64_t v55 = String.index(_:offsetBy:)();
    swift_bridgeObjectRelease();
    outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v51, v52, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    int v56 = swift_getEnumCaseMultiPayload();
    uint64_t v57 = v147[73];
    if (v56 == 1)
    {
      uint64_t v58 = v147[46];
      uint64_t v59 = v147[41];
      (*v136)(v58, v57, v59);
      uint64_t v60 = Prompt.Attachment.position.getter();
      v61 = v134;
    }
    else
    {
      uint64_t v58 = v147[52];
      uint64_t v59 = v147[47];
      (*v140)(v58, v57, v59);
      uint64_t v60 = Prompt.Delimiter.position.getter();
      v61 = v138;
    }
    (*v61)(v58, v59);
    uint64_t v62 = String.count.getter();
    uint64_t v142 = v39;
    if (v55 < 0x4000) {
      goto LABEL_40;
    }
    uint64_t v63 = HIBYTE(v54) & 0xF;
    if ((v54 & 0x2000000000000000) == 0) {
      uint64_t v63 = v53 & 0xFFFFFFFFFFFFLL;
    }
    if (v55 >> 14 != 4 * v63)
    {
      swift_bridgeObjectRetain();
      uint64_t v71 = String.subscript.getter();
      uint64_t v73 = v72;
      swift_bridgeObjectRelease();
      if (v71 == 10 && v73 == 0xE100000000000000)
      {
LABEL_39:
        swift_bridgeObjectRelease();
LABEL_40:
        uint64_t v74 = v60;
        outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v147[75], v147[71], type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        int v75 = swift_getEnumCaseMultiPayload();
        uint64_t v76 = v147[72];
        uint64_t v77 = v147[71];
        if (v75 == 1)
        {
          uint64_t v78 = v147[45];
          uint64_t v79 = v147[46];
          uint64_t v80 = v147[41];
          v81 = *v136;
          (*v136)(v79, v77, v80);
          (*v125)(v78, v79, v80);
          Prompt.Attachment.position.setter();
          (*v134)(v79, v80);
        }
        else
        {
          uint64_t v78 = v147[51];
          uint64_t v82 = v147[52];
          uint64_t v80 = v147[47];
          v81 = *v140;
          (*v140)(v82, v77, v80);
          (*v126)(v78, v82, v80);
          Prompt.Delimiter.position.setter();
          (*v138)(v82, v80);
        }
        v81(v76, v78, v80);
        uint64_t v83 = v147[72];
        uint64_t v84 = v147[40];
        swift_storeEnumTagMultiPayload();
        outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v83, v84, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        *(unsigned char *)(v84 + *(int *)(v128 + 20)) = 0;
        *(unsigned char *)(v84 + *(int *)(v128 + 24)) = v74 == v62;
        unint64_t v40 = v146;
        uint64_t v0 = v147;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v146 + 16) + 1, 1, v146);
        }
        uint64_t v39 = v142;
        uint64_t v85 = v143;
        unint64_t v87 = *(void *)(v40 + 16);
        unint64_t v86 = *(void *)(v40 + 24);
        unint64_t v88 = v87 + 1;
        if (v87 >= v86 >> 1) {
          unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v86 > 1, v87 + 1, 1, v40);
        }
        v89 = v127;
        goto LABEL_48;
      }
      char v92 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v92) {
        goto LABEL_40;
      }
    }
    swift_bridgeObjectRetain();
    String.index(before:)();
    uint64_t v64 = String.subscript.getter();
    uint64_t v66 = v65;
    swift_bridgeObjectRelease();
    if (v64 == 10 && v66 == 0xE100000000000000) {
      goto LABEL_39;
    }
    char v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v67) {
      goto LABEL_40;
    }
    swift_bridgeObjectRetain();
    String.index(before:)();
    uint64_t v68 = String.subscript.getter();
    uint64_t v70 = v69;
    swift_bridgeObjectRelease();
    if (v68 == 13 && v70 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_53:
      uint64_t v94 = v60;
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v147[75], v147[67], type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      int v95 = swift_getEnumCaseMultiPayload();
      uint64_t v96 = v147[68];
      uint64_t v97 = v147[67];
      if (v95 == 1)
      {
        uint64_t v98 = v147[45];
        uint64_t v99 = v147[46];
        uint64_t v100 = v147[41];
        v101 = *v136;
        (*v136)(v99, v97, v100);
        (*v125)(v98, v99, v100);
        Prompt.Attachment.position.setter();
        (*v134)(v99, v100);
      }
      else
      {
        uint64_t v98 = v147[51];
        uint64_t v102 = v147[52];
        uint64_t v100 = v147[47];
        v101 = *v140;
        (*v140)(v102, v97, v100);
        (*v126)(v98, v102, v100);
        Prompt.Delimiter.position.setter();
        (*v138)(v102, v100);
      }
      v101(v96, v98, v100);
      uint64_t v103 = v147[68];
      uint64_t v104 = v147[38];
      swift_storeEnumTagMultiPayload();
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v103, v104, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      *(unsigned char *)(v104 + *(int *)(v128 + 20)) = 0;
      *(unsigned char *)(v104 + *(int *)(v128 + 24)) = v94 == v62;
      unint64_t v40 = v146;
      uint64_t v0 = v147;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v146 + 16) + 1, 1, v146);
      }
      uint64_t v39 = v142;
      uint64_t v85 = v143;
      unint64_t v87 = *(void *)(v40 + 16);
      unint64_t v105 = *(void *)(v40 + 24);
      unint64_t v88 = v87 + 1;
      if (v87 >= v105 >> 1) {
        unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v105 > 1, v87 + 1, 1, v40);
      }
      v89 = v124;
      goto LABEL_48;
    }
    char v93 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    if (v93) {
      goto LABEL_53;
    }
    if (__OFADD__(v131++, 1)) {
      goto LABEL_76;
    }
    uint64_t result = String.insert(_:at:)();
    if (__OFADD__(v50, 1)) {
      goto LABEL_77;
    }
    uint64_t v122 = v60;
    outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v147[75], v147[69], type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    int v107 = swift_getEnumCaseMultiPayload();
    uint64_t v108 = v147[70];
    uint64_t v109 = v147[69];
    if (v107 == 1)
    {
      uint64_t v111 = v147[45];
      uint64_t v110 = v147[46];
      uint64_t v112 = v147[41];
      v113 = *v136;
      (*v136)(v110, v109, v112);
      (*v125)(v111, v110, v112);
      Prompt.Attachment.position.setter();
      (*v134)(v110, v112);
    }
    else
    {
      uint64_t v111 = v147[51];
      uint64_t v114 = v147[52];
      uint64_t v112 = v147[47];
      v113 = *v140;
      (*v140)(v114, v109, v112);
      (*v126)(v111, v114, v112);
      Prompt.Delimiter.position.setter();
      (*v138)(v114, v112);
    }
    v113(v108, v111, v112);
    uint64_t v115 = v147[70];
    uint64_t v116 = v147[39];
    swift_storeEnumTagMultiPayload();
    outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v115, v116, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    *(unsigned char *)(v116 + *(int *)(v128 + 20)) = 1;
    *(unsigned char *)(v116 + *(int *)(v128 + 24)) = v122 == v62;
    unint64_t v40 = v146;
    uint64_t v0 = v147;
    uint64_t v85 = v143;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v146 + 16) + 1, 1, v146);
    }
    unint64_t v87 = *(void *)(v40 + 16);
    unint64_t v117 = *(void *)(v40 + 24);
    unint64_t v88 = v87 + 1;
    if (v87 >= v117 >> 1) {
      unint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v117 > 1, v87 + 1, 1, v40);
    }
    v89 = v123;
LABEL_48:
    uint64_t v90 = *v89;
    uint64_t v91 = v0[75];
    *(void *)(v40 + 16) = v88;
    outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v90, v40+ ((*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80))+ *(void *)(v130 + 72) * v87, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v91, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    v39 += v129;
    uint64_t v35 = v85 - 1;
    if (!v35)
    {
      swift_bridgeObjectRelease();
      goto LABEL_72;
    }
  }
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(uint64_t, uint64_t, uint64_t);
  void (**v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unsigned char *v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (**v56)(uint64_t, uint64_t);
  unint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  char v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (**v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (**v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (**v124)(void, void, void, void);
  unsigned int (**v125)(uint64_t, uint64_t, uint64_t);
  unint64_t v126;
  unint64_t v127;
  unint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void (*v145)(uint64_t, uint64_t, uint64_t);
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void (**v160)(uint64_t, uint64_t);
  uint64_t v161;
  uint64_t v162;
  int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t, uint64_t);
  unint64_t v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void (*v175)(uint64_t, uint64_t, uint64_t);
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSObject *v181;
  os_log_type_t v182;
  BOOL v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint8_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void (*v195)(uint64_t, uint64_t, uint64_t);
  NSObject *v196;
  os_log_type_t v197;
  BOOL v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  void (*v208)(uint64_t, uint64_t);
  uint64_t v209;
  unint64_t v210;
  void (*v211)(uint64_t, uint64_t);
  uint64_t (*v212)(void);
  void (**v214)(uint64_t, uint64_t, uint64_t);
  void (**v215)(uint64_t, uint64_t, uint64_t);
  uint64_t v216;
  void (**v217)(uint64_t, uint64_t, uint64_t);
  unint64_t v218;
  uint64_t v219;
  void (**v220)(uint64_t, uint64_t, uint64_t);
  uint64_t v221;
  unint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  unint64_t v227;
  void (**v228)(uint64_t, uint64_t, uint64_t);
  unint64_t v229;
  unint64_t v230;
  uint64_t v231;
  void (**v232)(uint64_t, uint64_t, uint64_t);
  void (**v233)(uint64_t, uint64_t);
  uint64_t v234;
  void (**v235)(uint64_t, uint64_t);
  uint64_t v236;
  void (**v237)(uint64_t, uint64_t, uint64_t);
  uint64_t v238;
  void (**v239)(uint64_t, uint64_t, uint64_t);
  unint64_t v240;
  void (**v241)(uint64_t, uint64_t);
  uint64_t v242;
  void (**v243)(uint64_t, uint64_t);
  void (**v244)(uint64_t, uint64_t);
  void (**v245)(uint64_t, uint64_t, uint64_t);
  unint64_t v246;
  void (**v247)(uint64_t, uint64_t, uint64_t);
  void (**v248)(uint64_t, uint64_t, uint64_t);
  unsigned int (**v249)(uint64_t, uint64_t, uint64_t);
  uint64_t v250;
  unint64_t v251;
  void (**v252)(uint64_t, uint64_t);
  uint64_t v253;
  unint64_t v254;
  unint64_t v255;
  void (**v256)(uint64_t, uint64_t, uint64_t);
  void (**v257)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v258;
  void (**v259)(uint64_t, uint64_t);
  uint64_t v260;
  uint64_t v261;
  void (**v262)(uint64_t, uint64_t, uint64_t);
  uint64_t v263;
  void (**v264)(uint64_t, uint64_t);
  unint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279[2];
  uint64_t v280;
  uint64_t v281;

  v280 = v0;
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 656);
  uint64_t v1 = *(void *)(v0 + 640);
  uint64_t v2 = *(void *)(v0 + 624);
  *(void *)(v0 + 48) = *(void *)(v0 + 632);
  *(void *)(v0 + 56) = v1;
  lazy protocol witness table accessor for type String and conformance String();
  BidirectionalCollection<>.difference<A>(from:)();
  uint64_t v3 = CollectionDifference.removals.getter();
  v242 = v2;
  v238 = *(void *)(v2 + 16);
  if (v238)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    int64_t v6 = *(void *)(v0 + 384);
    uint64_t v7 = *(void *)(v0 + 336);
    v226 = *(void *)(v0 + 208);
    v273 = *(void *)(v3 + 16);
    v234 = *(void *)(v0 + 216);
    v225 = (*(unsigned __int8 *)(v234 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v234 + 80);
    v230 = *(void *)(v0 + 624) + v225;
    uint64_t v8 = (void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    uint64_t v9 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v259 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    v264 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    v217 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v220 = (void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v268 = v3;
    v223 = v3 + 65;
    v254 = MEMORY[0x263F8EE78];
    while (v5 < *(void *)(v242 + 16))
    {
      v250 = *(void *)(v234 + 72);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v230 + v250 * v5, *(void *)(v0 + 296), type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v10 = v273;
      if (v4 == v273) {
        goto LABEL_15;
      }
      uint64_t v11 = (unsigned char *)(v223 + 40 * v4);
      while (1)
      {
        if (v4 >= *(void *)(v268 + 16))
        {
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
          goto LABEL_132;
        }
        if (*v11 != 1) {
          break;
        }
        unint64_t v12 = *(void *)(v11 - 33);
        outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 296), *(void *)(v0 + 528), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v14 = *(void *)(v0 + 528);
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v15 = *(void *)(v0 + 368);
          uint64_t v16 = *(void *)(v0 + 328);
          (*v9)(v15, v14, v16);
          unint64_t v17 = Prompt.Attachment.position.getter();
          unint64_t v18 = v259;
        }
        else
        {
          uint64_t v15 = *(void *)(v0 + 416);
          uint64_t v16 = *(void *)(v0 + 376);
          (*v8)(v15, v14, v16);
          unint64_t v17 = Prompt.Delimiter.position.getter();
          unint64_t v18 = v264;
        }
        (*v18)(v15, v16);
        if (v12 >= v17) {
          break;
        }
        ++v4;
        v11 += 40;
        if (v273 == v4)
        {
          uint64_t v10 = v273;
          goto LABEL_15;
        }
      }
      uint64_t v10 = v4;
LABEL_15:
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 296), *(void *)(v0 + 520), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v19 = swift_getEnumCaseMultiPayload();
      uint64_t v20 = *(void *)(v0 + 520);
      if (v19 == 1)
      {
        int64_t v21 = *(void *)(v0 + 368);
        uint64_t v22 = *(void *)(v0 + 328);
        (*v9)(v21, v20, v22);
        BOOL v23 = Prompt.Attachment.position.getter();
        unint64_t v24 = v259;
      }
      else
      {
        int64_t v21 = *(void *)(v0 + 416);
        uint64_t v22 = *(void *)(v0 + 376);
        (*v8)(v21, v20, v22);
        BOOL v23 = Prompt.Delimiter.position.getter();
        unint64_t v24 = v264;
      }
      (*v24)(v21, v22);
      if (__OFSUB__(v23, v10)) {
        goto LABEL_133;
      }
      v246 = v10;
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 296), *(void *)(v0 + 512), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v25 = swift_getEnumCaseMultiPayload();
      v26 = *(void *)(v0 + 512);
      uint64_t v27 = *(void *)(v0 + 288);
      if (v25 == 1)
      {
        uint64_t v29 = *(void *)(v0 + 360);
        unint64_t v28 = *(void *)(v0 + 368);
        unint64_t v30 = *(void *)(v0 + 328);
        unint64_t v31 = *v9;
        (*v9)(v28, v26, v30);
        (*v217)(v29, v28, v30);
        Prompt.Attachment.position.setter();
        (*v259)(v28, v30);
      }
      else
      {
        uint64_t v29 = *(void *)(v0 + 408);
        uint64_t v32 = *(void *)(v0 + 416);
        unint64_t v30 = *(void *)(v0 + 376);
        unint64_t v31 = *v8;
        (*v8)(v32, v26, v30);
        (*v220)(v29, v32, v30);
        Prompt.Delimiter.position.setter();
        (*v264)(v32, v30);
      }
      v31(v27, v29, v30);
      v33 = *(void *)(v0 + 288);
      uint64_t v34 = *(void *)(v0 + 296);
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = *(unsigned char *)(v34 + *(int *)(v226 + 24));
      *(unsigned char *)(v33 + *(int *)(v226 + 20)) = *(unsigned char *)(v34 + *(int *)(v226 + 20));
      *(unsigned char *)(v33 + *(int *)(v226 + 24)) = v35;
      uint64_t v36 = v254;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v254 + 16) + 1, 1, v254);
      }
      uint64_t v38 = *(void *)(v36 + 16);
      uint64_t v37 = *(void *)(v36 + 24);
      if (v38 >= v37 >> 1) {
        uint64_t v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v37 > 1, v38 + 1, 1, v36);
      }
      ++v5;
      uint64_t v39 = *(void *)(v0 + 288);
      unint64_t v40 = *(void *)(v0 + 296);
      *(void *)(v36 + 16) = v38 + 1;
      v254 = v36;
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v39, v36 + v225 + v38 * v250, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v40, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v4 = v246;
      if (v5 == v238)
      {
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
    }
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  swift_bridgeObjectRelease();
  uint64_t v36 = MEMORY[0x263F8EE78];
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v41 = CollectionDifference.insertions.getter();
  v269 = *(void *)(v36 + 16);
  if (v269)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = *(void *)(v0 + 384);
    uint64_t v45 = *(void *)(v0 + 336);
    v231 = *(void *)(v0 + 208);
    uint64_t v46 = *(void *)(v41 + 16);
    v260 = *(void *)(v0 + 216);
    v227 = (*(unsigned __int8 *)(v260 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v260 + 80);
    v251 = v36 + v227;
    v243 = (void (**)(uint64_t, uint64_t))(v44 + 8);
    v247 = (void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32);
    v235 = (void (**)(uint64_t, uint64_t))(v45 + 8);
    v239 = (void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32);
    v214 = (void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    v215 = (void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
    v221 = v41 + 32;
    v224 = v41;
    uint64_t v47 = MEMORY[0x263F8EE78];
    v255 = v36;
    v218 = v46;
    do
    {
      if (v43 >= *(void *)(v36 + 16)) {
        goto LABEL_135;
      }
      uint64_t v48 = *(void *)(v0 + 504);
      uint64_t v49 = *(void *)(v0 + 280);
      uint64_t v50 = *(void *)(v260 + 72);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v251 + v50 * v43, v49, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v49, v48, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v51 = swift_getEnumCaseMultiPayload();
      uint64_t v52 = *(void *)(v0 + 504);
      if (v51 == 1)
      {
        uint64_t v53 = *(void *)(v0 + 368);
        unint64_t v54 = *(void *)(v0 + 328);
        (*v239)(v53, v52, v54);
        unint64_t v55 = Prompt.Attachment.position.getter();
        int v56 = v235;
      }
      else
      {
        uint64_t v53 = *(void *)(v0 + 416);
        unint64_t v54 = *(void *)(v0 + 376);
        (*v247)(v53, v52, v54);
        unint64_t v55 = Prompt.Delimiter.position.getter();
        int v56 = v243;
      }
      (*v56)(v53, v54);
      if (__OFADD__(v55, v42)) {
        goto LABEL_136;
      }
      if (v42 == v46)
      {
        uint64_t v42 = v46;
      }
      else
      {
        uint64_t v57 = *(void *)(v224 + 16);
        if (v42 > v57) {
          uint64_t v57 = v42;
        }
        uint64_t v58 = v221 + 40 * v42;
        do
        {
          if (v57 == v42) {
            goto LABEL_130;
          }
          if ((*(unsigned char *)(v58 + 33) & 1) != 0 || *(void *)v58 >= (int64_t)(v55 + v42)) {
            goto LABEL_47;
          }
          if (__OFADD__(v55 + v42, 1)) {
            goto LABEL_131;
          }
          ++v42;
          v58 += 40;
        }
        while (v46 != v42);
        uint64_t v42 = v46;
      }
LABEL_47:
      v274 = v50;
      v265 = v47;
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 280), *(void *)(v0 + 496), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v59 = swift_getEnumCaseMultiPayload();
      uint64_t v60 = *(void *)(v0 + 496);
      v61 = *(void *)(v0 + 272);
      if (v59 == 1)
      {
        uint64_t v63 = *(void *)(v0 + 360);
        uint64_t v62 = *(void *)(v0 + 368);
        uint64_t v64 = *(void *)(v0 + 328);
        uint64_t v65 = *v239;
        (*v239)(v62, v60, v64);
        (*v214)(v63, v62, v64);
        Prompt.Attachment.position.setter();
        (*v235)(v62, v64);
        v65(v61, v63, v64);
      }
      else
      {
        char v67 = *(void *)(v0 + 408);
        uint64_t v66 = *(void *)(v0 + 416);
        uint64_t v68 = *(void *)(v0 + 376);
        uint64_t v69 = *v247;
        (*v247)(v66, v60, v68);
        (*v215)(v67, v66, v68);
        Prompt.Delimiter.position.setter();
        (*v243)(v66, v68);
        v69(v61, v67, v68);
        uint64_t v46 = v218;
      }
      uint64_t v70 = *(void *)(v0 + 272);
      uint64_t v71 = *(void *)(v0 + 280);
      swift_storeEnumTagMultiPayload();
      uint64_t v72 = *(unsigned char *)(v71 + *(int *)(v231 + 24));
      *(unsigned char *)(v70 + *(int *)(v231 + 20)) = *(unsigned char *)(v71 + *(int *)(v231 + 20));
      *(unsigned char *)(v70 + *(int *)(v231 + 24)) = v72;
      uint64_t v47 = v265;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v265 + 16) + 1, 1, v265);
      }
      uint64_t v74 = *(void *)(v47 + 16);
      uint64_t v73 = *(void *)(v47 + 24);
      if (v74 >= v73 >> 1) {
        uint64_t v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v73 > 1, v74 + 1, 1, v47);
      }
      ++v43;
      int v75 = *(void *)(v0 + 272);
      uint64_t v76 = *(void *)(v0 + 280);
      *(void *)(v47 + 16) = v74 + 1;
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v75, v47 + v227 + v74 * v274, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v76, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v36 = v255;
    }
    while (v43 != v269);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v47 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v77 = *(void *)(v47 + 16);
  if (v77)
  {
    v261 = 0;
    uint64_t v78 = *(void *)(v0 + 384);
    uint64_t v79 = *(void *)(v0 + 336);
    uint64_t v80 = *(void *)(v0 + 216);
    v270 = *(void *)(v0 + 208);
    v81 = v47 + ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80));
    v236 = *(void *)(v80 + 72);
    v240 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
    v256 = (void (**)(uint64_t, uint64_t, uint64_t))(v78 + 32);
    v252 = (void (**)(uint64_t, uint64_t))(v78 + 8);
    v248 = (void (**)(uint64_t, uint64_t, uint64_t))(v79 + 32);
    v244 = (void (**)(uint64_t, uint64_t))(v79 + 8);
    v228 = (void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16);
    v232 = (void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16);
    uint64_t v82 = MEMORY[0x263F8EE78];
    while (1)
    {
      v275 = v82;
      uint64_t v83 = *(void *)(v0 + 488);
      uint64_t v84 = *(void *)(v0 + 264);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v81, v84, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v84, v83, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v85 = swift_getEnumCaseMultiPayload();
      unint64_t v86 = *(void *)(v0 + 488);
      if (v85 == 1)
      {
        unint64_t v87 = *(void *)(v0 + 368);
        unint64_t v88 = *(void *)(v0 + 328);
        (*v248)(v87, v86, v88);
        v89 = Prompt.Attachment.position.getter();
        uint64_t v90 = v244;
      }
      else
      {
        unint64_t v87 = *(void *)(v0 + 416);
        unint64_t v88 = *(void *)(v0 + 376);
        (*v256)(v87, v86, v88);
        v89 = Prompt.Delimiter.position.getter();
        uint64_t v90 = v252;
      }
      (*v90)(v87, v88);
      uint64_t v91 = v89 - v261;
      if (__OFSUB__(v89, v261)) {
        goto LABEL_134;
      }
      char v92 = *(void *)(v0 + 264);
      char v93 = *(unsigned __int8 *)(v92 + *(int *)(v270 + 20));
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v92, *(void *)(v0 + 256), type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      if (v93 == 1)
      {
        outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 256), *(void *)(v0 + 480), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        uint64_t v94 = swift_getEnumCaseMultiPayload();
        int v95 = *(void *)(v0 + 480);
        if (v94 == 1)
        {
          uint64_t v96 = *(void *)(v0 + 368);
          uint64_t v97 = *(void *)(v0 + 328);
          (*v248)(v96, v95, v97);
          uint64_t v98 = Prompt.Attachment.position.getter();
          uint64_t v99 = v244;
        }
        else
        {
          uint64_t v96 = *(void *)(v0 + 416);
          uint64_t v97 = *(void *)(v0 + 376);
          (*v256)(v96, v95, v97);
          uint64_t v98 = Prompt.Delimiter.position.getter();
          uint64_t v99 = v252;
        }
        (*v99)(v96, v97);
        outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 256), type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        if (v98)
        {
          if (__OFSUB__(v91, 1)) {
            goto LABEL_138;
          }
          swift_bridgeObjectRetain();
          String.index(_:offsetBy:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          uint64_t v100 = String.subscript.getter();
          uint64_t v102 = v101;
          swift_bridgeObjectRelease();
          if (v100 == 10 && v102 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease();
LABEL_74:
            String.remove(at:)();
            swift_bridgeObjectRelease();
            if (__OFADD__(v261++, 1)) {
              goto LABEL_139;
            }
            goto LABEL_75;
          }
          uint64_t v103 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v103) {
            goto LABEL_74;
          }
        }
      }
      else
      {
        outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 256), type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      }
LABEL_75:
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 264), *(void *)(v0 + 464), type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      unint64_t v105 = swift_getEnumCaseMultiPayload();
      v106 = *(void *)(v0 + 464);
      int v107 = *(void *)(v0 + 472);
      if (v105 == 1)
      {
        uint64_t v109 = *(void *)(v0 + 360);
        uint64_t v108 = *(void *)(v0 + 368);
        uint64_t v110 = *(void *)(v0 + 328);
        uint64_t v111 = *v248;
        (*v248)(v108, v106, v110);
        (*v228)(v109, v108, v110);
        Prompt.Attachment.position.setter();
        (*v244)(v108, v110);
      }
      else
      {
        uint64_t v109 = *(void *)(v0 + 408);
        uint64_t v112 = *(void *)(v0 + 416);
        uint64_t v110 = *(void *)(v0 + 376);
        uint64_t v111 = *v256;
        (*v256)(v112, v106, v110);
        (*v232)(v109, v112, v110);
        Prompt.Delimiter.position.setter();
        (*v252)(v112, v110);
      }
      v111(v107, v109, v110);
      v113 = *(void *)(v0 + 472);
      uint64_t v114 = *(void *)(v0 + 264);
      uint64_t v115 = *(void *)(v0 + 248);
      swift_storeEnumTagMultiPayload();
      LOBYTE(v114) = *(unsigned char *)(v114 + *(int *)(v270 + 24));
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v113, v115, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      *(unsigned char *)(v115 + *(int *)(v270 + 20)) = 0;
      *(unsigned char *)(v115 + *(int *)(v270 + 24)) = v114;
      uint64_t v82 = v275;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v82 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v275 + 16) + 1, 1, v275);
      }
      unint64_t v117 = *(void *)(v82 + 16);
      uint64_t v116 = *(void *)(v82 + 24);
      if (v117 >= v116 >> 1) {
        uint64_t v82 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v116 > 1, v117 + 1, 1, v82);
      }
      v118 = *(void *)(v0 + 264);
      uint64_t v119 = *(void *)(v0 + 248);
      *(void *)(v82 + 16) = v117 + 1;
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v119, v82 + v240 + v117 * v236, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v118, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      v81 += v236;
      if (!--v77)
      {
        swift_bridgeObjectRelease();
        uint64_t v120 = v82;
        goto LABEL_85;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v120 = MEMORY[0x263F8EE78];
LABEL_85:
  v121 = *(void *)(v0 + 384);
  uint64_t v122 = *(void *)(v0 + 336);
  v253 = *(void *)(v0 + 216);
  v266 = *(void *)(v0 + 208);
  v123 = *(void *)(v0 + 152);
  v271 = *(void *)(v0 + 144);
  v124 = (void (**)(void, void, void, void))(v123 + 56);
  v125 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v123 + 48);
  v126 = *(void *)(v120 + 16);
  v241 = (void (**)(uint64_t, uint64_t))(v121 + 8);
  v245 = (void (**)(uint64_t, uint64_t, uint64_t))(v121 + 16);
  v257 = (void (**)(uint64_t, uint64_t, uint64_t))(v122 + 32);
  v262 = (void (**)(uint64_t, uint64_t, uint64_t))(v121 + 32);
  v233 = (void (**)(uint64_t, uint64_t))(v122 + 8);
  v237 = (void (**)(uint64_t, uint64_t, uint64_t))(v122 + 16);
  v127 = 0;
  v276 = swift_bridgeObjectRetain();
  v229 = v276;
  v249 = v125;
  while (1)
  {
    if (v127 == v126)
    {
      (*v124)(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 144));
      v127 = v126;
    }
    else
    {
      if (v127 >= *(void *)(v276 + 16)) {
        goto LABEL_137;
      }
      uint64_t v128 = *(unint64_t **)(v0 + 168);
      uint64_t v129 = *(void *)(v0 + 144);
      uint64_t v130 = *(void *)(v0 + 160) + *(int *)(v271 + 48);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v276+ ((*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80))+ *(void *)(v253 + 72) * v127, v130, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v131 = *(int *)(v271 + 48);
      *uint64_t v128 = v127;
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v130, (uint64_t)v128 + v131, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      (*v124)(v128, 0, 1, v129);
      ++v127;
      v125 = v249;
    }
    uint64_t v132 = *(void *)(v0 + 176);
    uint64_t v133 = *(void *)(v0 + 144);
    outlined init with take of (offset: Int, element: PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:))?(*(void *)(v0 + 168), v132);
    if ((*v125)(v132, 1, v133) == 1) {
      break;
    }
    v134 = *(void *)(v0 + 240);
    uint64_t v135 = *(unint64_t **)(v0 + 176);
    v136 = *v135;
    outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v135 + *(int *)(v271 + 48), v134, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    v137 = *(int *)(v266 + 24);
    if (*(unsigned char *)(v134 + v137))
    {
      v222 = v126;
      v138 = *(void *)(v0 + 448);
      uint64_t v139 = *(void *)(v0 + 240);
      swift_bridgeObjectRetain();
      String.count.getter();
      swift_bridgeObjectRelease();
      v219 = v139;
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v139, v138, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      v140 = swift_getEnumCaseMultiPayload();
      uint64_t v141 = *(void *)(v0 + 448);
      v216 = *(void *)(v0 + 456);
      if (v140 == 1)
      {
        uint64_t v142 = *(void *)(v0 + 360);
        uint64_t v143 = *(void *)(v0 + 368);
        uint64_t v144 = *(void *)(v0 + 328);
        uint64_t v145 = *v257;
        (*v257)(v143, v141, v144);
        (*v237)(v142, v143, v144);
        Prompt.Attachment.position.setter();
        (*v233)(v143, v144);
      }
      else
      {
        uint64_t v142 = *(void *)(v0 + 408);
        unint64_t v146 = *(void *)(v0 + 416);
        uint64_t v144 = *(void *)(v0 + 376);
        uint64_t v145 = *v262;
        (*v262)(v146, v141, v144);
        (*v245)(v142, v146, v144);
        Prompt.Delimiter.position.setter();
        (*v241)(v146, v144);
      }
      v145(v216, v142, v144);
      v147 = *(void *)(v0 + 456);
      v148 = *(void *)(v0 + 232);
      v149 = *(void *)(v0 + 240);
      swift_storeEnumTagMultiPayload();
      LOBYTE(v149) = *(unsigned char *)(v149 + *(int *)(v266 + 20));
      v150 = *(unsigned char *)(v219 + v137);
      outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v147, v148, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      *(unsigned char *)(v148 + *(int *)(v266 + 20)) = v149;
      *(unsigned char *)(v148 + *(int *)(v266 + 24)) = v150;
      uint64_t v151 = v229;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        v126 = v222;
        if ((v136 & 0x8000000000000000) != 0) {
          goto LABEL_101;
        }
      }
      else
      {
        uint64_t v151 = specialized _ArrayBuffer._consumeAndCreateNew()(v229);
        v126 = v222;
        if ((v136 & 0x8000000000000000) != 0)
        {
LABEL_101:
          __break(1u);
          break;
        }
      }
      if (v136 >= *(void *)(v151 + 16)) {
        goto LABEL_140;
      }
      v152 = *(void *)(v0 + 240);
      v229 = v151;
      outlined assign with take of PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 232), v151+ ((*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80))+ *(void *)(v253 + 72) * v136);
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v152, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    }
    else
    {
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(*(void *)(v0 + 240), type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    }
  }
  swift_bridgeObjectRelease();
  v153 = *(void *)(v229 + 16);
  if (v153)
  {
    v267 = *(void *)(v0 + 336);
    v272 = *(void *)(v0 + 384);
    v154 = v229 + ((*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80));
    v277 = *(void *)(v253 + 72);
    v155 = MEMORY[0x263F8EE78];
    v156 = MEMORY[0x263F8EE78];
    do
    {
      v161 = *(void *)(v0 + 440);
      v162 = *(void *)(v0 + 224);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v154, v162, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v162, v161, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v162, type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      v163 = swift_getEnumCaseMultiPayload();
      v164 = *(void *)(v0 + 440);
      if (v163 == 1)
      {
        v166 = *(void *)(v0 + 344);
        v165 = *(void *)(v0 + 352);
        v167 = *(void *)(v0 + 328);
        v168 = *v257;
        (*v257)(v165, v164, v167);
        (*v237)(v166, v165, v167);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v156 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v156 + 16) + 1, 1, v156);
        }
        v170 = *(void *)(v156 + 16);
        v169 = *(void *)(v156 + 24);
        if (v170 >= v169 >> 1) {
          v156 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v169 > 1, v170 + 1, 1, v156);
        }
        v171 = *(void *)(v0 + 344);
        v158 = *(void *)(v0 + 352);
        v159 = *(void *)(v0 + 328);
        *(void *)(v156 + 16) = v170 + 1;
        v168(v156+ ((*(unsigned __int8 *)(v267 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v267 + 80))+ *(void *)(v267 + 72) * v170, v171, v159);
        v160 = v233;
      }
      else
      {
        v173 = *(void *)(v0 + 392);
        v172 = *(void *)(v0 + 400);
        v174 = *(void *)(v0 + 376);
        v175 = *v262;
        (*v262)(v172, v164, v174);
        (*v245)(v173, v172, v174);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v155 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v155 + 16) + 1, 1, v155);
        }
        v177 = *(void *)(v155 + 16);
        v176 = *(void *)(v155 + 24);
        if (v177 >= v176 >> 1) {
          v155 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v176 > 1, v177 + 1, 1, v155);
        }
        v157 = *(void *)(v0 + 392);
        v158 = *(void *)(v0 + 400);
        v159 = *(void *)(v0 + 376);
        *(void *)(v155 + 16) = v177 + 1;
        v175(v155+ ((*(unsigned __int8 *)(v272 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v272 + 80))+ *(void *)(v272 + 72) * v177, v157, v159);
        v160 = v241;
      }
      (*v160)(v158, v159);
      v154 += v277;
      --v153;
    }
    while (v153);
  }
  swift_bridgeObjectRelease();
  v178 = *(void *)(v0 + 80);
  v179 = *(void *)(v0 + 88);
  Prompt.init(string:delimiters:attachments:)();
  if (MEMORY[0x2611FF4B0](v179, v178))
  {
    if (one-time initialization token for prompt == -1)
    {
LABEL_118:
      v180 = type metadata accessor for Logger();
      __swift_project_value_buffer(v180, (uint64_t)static Log.prompt);
      v181 = Logger.logObject.getter();
      v182 = static os_log_type_t.debug.getter();
      v183 = os_log_type_enabled(v181, v182);
      v185 = *(void *)(v0 + 192);
      v184 = *(void *)(v0 + 200);
      v186 = *(void *)(v0 + 184);
      if (v183)
      {
        v187 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v187 = 0;
        _os_log_impl(&dword_25F79F000, v181, v182, "Input validation did not change the original prompt.", v187, 2u);
        MEMORY[0x261201C80](v187, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v184, v186);
      goto LABEL_126;
    }
LABEL_141:
    swift_once();
    goto LABEL_118;
  }
  if (one-time initialization token for prompt != -1) {
    swift_once();
  }
  v188 = *(void *)(v0 + 128);
  v189 = *(void *)(v0 + 136);
  v190 = *(void *)(v0 + 112);
  v191 = *(void *)(v0 + 120);
  v193 = *(void *)(v0 + 80);
  v192 = *(void *)(v0 + 88);
  v194 = type metadata accessor for Logger();
  __swift_project_value_buffer(v194, (uint64_t)static Log.prompt);
  v195 = *(void (**)(uint64_t, uint64_t, uint64_t))(v191 + 16);
  v195(v189, v192, v190);
  v195(v188, v193, v190);
  v196 = Logger.logObject.getter();
  v197 = static os_log_type_t.debug.getter();
  v198 = os_log_type_enabled(v196, v197);
  v200 = *(void *)(v0 + 192);
  v199 = *(void *)(v0 + 200);
  v201 = *(void *)(v0 + 184);
  v202 = *(void *)(v0 + 136);
  v278 = *(void *)(v0 + 128);
  v203 = *(void *)(v0 + 112);
  v204 = *(void *)(v0 + 120);
  if (v198)
  {
    v258 = v197;
    v205 = swift_slowAlloc();
    v263 = swift_slowAlloc();
    v279[0] = v263;
    *(_DWORD *)v205 = 136643075;
    v206 = Prompt.string.getter();
    *(void *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v206, v207, v279);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v208 = *(void (**)(uint64_t, uint64_t))(v204 + 8);
    v208(v202, v203);
    *(_WORD *)(v205 + 12) = 2085;
    v209 = Prompt.string.getter();
    *(void *)(v0 + 72) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v209, v210, v279);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v208(v278, v203);
    _os_log_impl(&dword_25F79F000, v196, v258, "Input validation changed the original prompt from %{sensitive}s to %{sensitive}s", (uint8_t *)v205, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v263, -1, -1);
    MEMORY[0x261201C80](v205, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v199, v201);
  }
  else
  {

    v211 = *(void (**)(uint64_t, uint64_t))(v204 + 8);
    v211(v278, v203);
    v211(v202, v203);
    (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v199, v201);
  }
LABEL_126:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v212 = *(uint64_t (**)(void))(v0 + 8);
  return v212();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[82] = a1;
  v4[83] = a2;
  v4[84] = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = static TokenGenerator.scrubPrompt(_:scrub:);
  }
  else
  {
    uint64_t v5 = static TokenGenerator.scrubPrompt(_:scrub:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1)
{
  return type metadata accessor for InferenceRequestInstrumentation(a1, (uint64_t *)&type metadata singleton initialization cache for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
}

uint64_t type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1)
{
  return type metadata accessor for InferenceRequestInstrumentation(a1, (uint64_t *)&type metadata singleton initialization cache for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(a1, a2, a3, MEMORY[0x263F7FB40]);
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a2;
  uint64_t v53 = type metadata accessor for Prompt.Attachment();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for Prompt.Delimiter();
  uint64_t v7 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  uint64_t v9 = MEMORY[0x270FA5388](v55);
  uint64_t v44 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v43 = (uint64_t)&v40 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v40 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v40 - v17;
  MEMORY[0x270FA5388](v16);
  int64_t v21 = (char *)&v40 - v20;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23)
  {
    unint64_t v41 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v42 = a3;
    uint64_t v24 = a1 + v41;
    uint64_t v54 = *(void *)(v19 + 72);
    uint64_t v48 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v49 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v46 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v47 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    while (1)
    {
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v24, (uint64_t)v21, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v21, (uint64_t)v18, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      uint64_t v25 = a3;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v26 = v52;
        uint64_t v27 = v53;
        (*v47)(v52, v18, v53);
        uint64_t v28 = Prompt.Attachment.position.getter();
        uint64_t v29 = v46;
      }
      else
      {
        v26 = v50;
        uint64_t v27 = v51;
        (*v49)(v50, v18, v51);
        uint64_t v28 = Prompt.Delimiter.position.getter();
        uint64_t v29 = v48;
      }
      (*v29)(v26, v27);
      outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v21, (uint64_t)v15, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
      if (v28 < 0)
      {
        outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v15, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        a3 = v25;
      }
      else
      {
        uint64_t v30 = v43;
        outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v15, v43, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          unint64_t v31 = v52;
          uint64_t v32 = v53;
          (*v47)(v52, (char *)v30, v53);
          uint64_t v33 = Prompt.Attachment.position.getter();
          (*v46)(v31, v32);
        }
        else
        {
          uint64_t v34 = v50;
          uint64_t v35 = v51;
          (*v49)(v50, (char *)v30, v51);
          uint64_t v33 = Prompt.Delimiter.position.getter();
          (*v48)(v34, v35);
        }
        a3 = v25;
        uint64_t v36 = String.count.getter();
        outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v15, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
        if (v36 >= v33)
        {
          outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v21, v44, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
          uint64_t v37 = v56;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v37 + 16) + 1, 1);
            uint64_t v37 = v56;
          }
          unint64_t v39 = *(void *)(v37 + 16);
          unint64_t v38 = *(void *)(v37 + 24);
          if (v39 >= v38 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
            uint64_t v37 = v56;
          }
          *(void *)(v37 + 16) = v39 + 1;
          outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(v44, v37 + v41 + v39 * v54, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
          a3 = v42;
          goto LABEL_5;
        }
      }
      outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)((uint64_t)v21, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
LABEL_5:
      v24 += v54;
      if (!--v23) {
        return v56;
      }
    }
  }
  return result;
}

uint64_t outlined init with take of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of (offset: Int, element: PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:))?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:))?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v6 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v2 = type metadata accessor for Prompt.Delimiter();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v4 = type metadata accessor for Prompt.Delimiter();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(a1, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v4 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v4 = type metadata accessor for Prompt.Delimiter();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(a1, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v4 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata completion function for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)()
{
  uint64_t result = type metadata accessor for Prompt.Delimiter();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Prompt.Attachment();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v7 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v7 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(void *, void *))(*(void *)(v7 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
  }
  return a1;
}

uint64_t destroy for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1)
{
  type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v2 = type metadata accessor for Prompt.Delimiter();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v6 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v6 = type metadata accessor for Prompt.Delimiter();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(a1, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v6 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v6 = type metadata accessor for Prompt.Attachment();
  }
  else {
    uint64_t v6 = type metadata accessor for Prompt.Delimiter();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(a1, type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:));
    type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = type metadata accessor for Prompt.Attachment();
    }
    else {
      uint64_t v6 = type metadata accessor for Prompt.Delimiter();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F8F0AC8);
}

uint64_t sub_25F8F0AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F8F0BAC);
}

uint64_t sub_25F8F0BAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata completion function for PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)()
{
  uint64_t result = type metadata accessor for PromptMovableType in PromptMovableWithMetadata #1 in static TokenGenerator.scrubPrompt(_:scrub:)(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t static _OverrideConfigurationHelper.samplingParameters(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  long long v3 = *(_OWORD *)(a1 + 112);
  long long v19 = *(_OWORD *)(a1 + 96);
  v20[0] = v3;
  long long v4 = *(_OWORD *)(a1 + 16);
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 32);
  long long v6 = v15;
  long long v16 = v5;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 80);
  long long v17 = *(_OWORD *)(a1 + 64);
  long long v9 = v17;
  long long v18 = v8;
  long long v10 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  long long v11 = v14[0];
  v14[1] = v10;
  long long v12 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = v19;
  *(_OWORD *)(a2 + 112) = v12;
  *(_OWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v9;
  *(_OWORD *)(a2 + 80) = v2;
  *(_DWORD *)((char *)v20 + 15) = *(_DWORD *)(a1 + 127);
  *(_DWORD *)(a2 + 127) = *(_DWORD *)(a1 + 127);
  *(_OWORD *)a2 = v11;
  *(_OWORD *)(a2 + 16) = v4;
  return outlined retain of SamplingParameters((uint64_t)v14);
}

uint64_t static _OverrideConfigurationHelper.grammar(_:)(uint64_t a1)
{
  return a1;
}

uint64_t static _OverrideConfigurationHelper.samplingParameters(_:)()
{
  return OverrideHint.value.getter();
}

uint64_t static _OverrideConfigurationHelper.draftCache(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OverrideHint<[String]>);
  OverrideHint.value.getter();
  return v1;
}

uint64_t static _OverrideConfigurationHelper.grammar(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OverrideHint<String>);
  OverrideHint.value.getter();
  return v1;
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  v4[6] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Prompt();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt(), 0, 0);
}

{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  uint64_t v9;

  *(void *)(v4 + 16) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *uint64_t v7 = v4;
  v7[1] = GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt();
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns(), 0, 0);
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt()()
{
  GenerativeConfigurationProtocol.promptContent.getter();
  uint64_t v1 = GenerativeConfigurationProtocol.variableBindings.getter();
  v0[10] = v1;
  GenerativeConfigurationProtocol<>.locale.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PromptComponentValueCustomDataTransformer>);
  uint64_t v2 = swift_allocObject();
  v0[11] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25F91CC30;
  *(void *)(v2 + 56) = &unk_270BC4850;
  *(void *)(v2 + 64) = lazy protocol witness table accessor for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt();
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[2];
  return MEMORY[0x270F7F8C8](v5, v1, v2, v4);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v2 = (void *)*v1;
  v2[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt(), 0, 0);
  }
  else
  {
    uint64_t v4 = v2[8];
    uint64_t v3 = v2[9];
    uint64_t v5 = v2[6];
    long long v6 = v2[7];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v5, &demangling cache variable for type metadata for Locale?);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v2[1];
    return v7();
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v4, &demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  static Prompt.transcript(turns:)(v0[4], v0[2]);
  swift_bridgeObjectRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt()(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    long long v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPrompt(), 0, 0);
  }
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns()(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns(), 0, 0);
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns()()
{
  GenerativeConfigurationProtocol.promptContent.getter();
  uint64_t v1 = v0[2];
  v0[6] = v1;
  uint64_t v2 = GenerativeConfigurationProtocol.chatMessagesPromptBindings.getter();
  v0[7] = v2;
  uint64_t v3 = GenerativeConfigurationProtocol.variableBindings.getter();
  v0[8] = v3;
  long long v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:)
                                                         + async function pointer to specialized static TokenGenerator.render(chatMessagesPromptContent:bindingChatMessagesPrompts:bindingVariables:));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns();
  return v6(v1, v2, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns()(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](GenerativeConfigurationProtocol<>.renderToTokenGenerationPromptTurns(), 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t Prompt.parseAsChatMessagesPrompt()(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
  v2[19] = swift_task_alloc();
  v2[20] = type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(0);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for System();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ChatMessagePrompt();
  v2[28] = v4;
  v2[29] = *(void *)(v4 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Prompt.Component.Value();
  v2[32] = v5;
  v2[33] = *(void *)(v5 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SpecialToken();
  v2[37] = v6;
  v2[38] = *(void *)(v6 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Prompt.SpecialToken();
  v2[42] = v7;
  v2[43] = *(void *)(v7 - 8);
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Prompt.Component();
  v2[50] = v8;
  v2[51] = *(void *)(v8 - 8);
  v2[52] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Prompt();
  v2[53] = v9;
  v2[54] = *(void *)(v9 - 8);
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  return MEMORY[0x270FA2498](Prompt.parseAsChatMessagesPrompt(), 0, 0);
}

uint64_t Prompt.parseAsChatMessagesPrompt()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PromptComponentValueCustomDataTransformer>);
  uint64_t v1 = swift_allocObject();
  v0[57] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_25F91CC30;
  *(void *)(v1 + 56) = &unk_270BC4850;
  *(void *)(v1 + 64) = lazy protocol witness table accessor for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[58] = v2;
  *uint64_t v2 = v0;
  v2[1] = Prompt.parseAsChatMessagesPrompt();
  uint64_t v3 = v0[56];
  return MEMORY[0x270F7F8C0](v3, v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = Prompt.parseAsChatMessagesPrompt();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = Prompt.parseAsChatMessagesPrompt();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unsigned int (**v3)(char *, uint64_t, uint64_t);
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned char *v80;
  uint64_t (*v81)(void);
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unsigned char *v91;
  uint64_t v92;
  uint64_t v93;
  unsigned char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (**v110)(uint64_t, uint64_t);
  char *v111;
  void (**v112)(void, void);
  unint64_t *v113;
  void (**v114)(uint64_t, uint64_t);
  void (**v115)(uint64_t, uint64_t, uint64_t);
  void (**v116)(uint64_t, void);
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  unint64_t *v121;
  uint64_t v122;
  void (**v123)(void, void);
  int v124;
  uint64_t v125;
  unsigned int (**v126)(uint64_t, uint64_t);
  uint64_t v127;
  void (**v128)(char *, uint64_t);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  uint64_t v119 = swift_allocBox();
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v8 = *(void *)(v7 - 8);
  v118 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v118(v6, 1, 3, v7);
  uint64_t v9 = Prompt.components.getter();
  uint64_t v130 = v9;
  v121 = (unint64_t *)swift_allocObject();
  v121[2] = MEMORY[0x263F8EE78];
  v113 = v121 + 2;
  if (!*(void *)(v9 + 16))
  {
LABEL_38:
    long long v10 = (char *)(v0 + 40);
    swift_bridgeObjectRelease();
    uint64_t v63 = *(void *)(v0 + 384);
    swift_beginAccess();
    uint64_t v64 = *MEMORY[0x263F62118];
    uint64_t v65 = type metadata accessor for ChatMessageRole();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 104))(v63, v64, v65);
    v118(v63, 0, 3, v7);
    LOBYTE(v64) = specialized static == infix(_:_:) in State #1 in Prompt.parseAsChatMessagesPrompt()(v6, v63);
    swift_endAccess();
    outlined destroy of State #1 in Prompt.parseAsChatMessagesPrompt()(v63);
    if (v64)
    {
      swift_beginAccess();
      uint64_t v66 = *(void *)(*v113 + 16);
      if (!v66)
      {
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
      uint64_t v68 = *(void *)(v0 + 432);
      char v67 = *(void *)(v0 + 440);
      uint64_t v129 = *(void *)(v0 + 424);
      uint64_t v70 = *(void *)(v0 + 232);
      uint64_t v69 = *(void *)(v0 + 240);
      uint64_t v71 = *(void *)(v0 + 224);
      uint64_t v72 = (*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
      uint64_t v2 = *(void *)(v70 + 72);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v70 + 16))(v69, *v113 + v72 + v2 * (v66 - 1), v71);
      ChatMessagePrompt.prompt.getter();
      uint64_t v1 = *(void *)(v70 + 8);
      ((void (*)(uint64_t, uint64_t))v1)(v69, v71);
      uint64_t v73 = Prompt.components.getter();
      uint64_t v3 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v68 + 8);
      ((void (*)(uint64_t, uint64_t))v3)(v67, v129);
      swift_endAccess();
      uint64_t v74 = *(void *)(v73 + 16);
      swift_bridgeObjectRelease();
      if (!v74)
      {
        long long v10 = (char *)v72;
        swift_beginAccess();
        uint64_t v4 = *v113;
        if (*(void *)(*v113 + 16))
        {
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v83 = *(void *)(v4 + 16);
            if (!v83)
            {
LABEL_59:
              __break(1u);
              JUMPOUT(0x25F8F30C4);
            }
LABEL_49:
            uint64_t v84 = v10;
            uint64_t v85 = *(void *)(v0 + 448);
            uint64_t v109 = *(void *)(v0 + 424);
            unint64_t v86 = v83 - 1;
            ((void (*)(char *, void))v1)(&v84[v4 + (v83 - 1) * v2], *(void *)(v0 + 224));
            *(void *)(v4 + 16) = v86;
            v121[2] = v4;
            swift_endAccess();
            swift_bridgeObjectRetain();
            ChatMessagesPrompt.init(_:)();
            ((void (*)(uint64_t, uint64_t))v3)(v85, v109);
            swift_release();
            swift_release();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            v81 = *(uint64_t (**)(void))(v0 + 8);
            goto LABEL_43;
          }
LABEL_58:
          uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew()(v4);
          uint64_t v83 = *(void *)(v4 + 16);
          if (!v83) {
            goto LABEL_59;
          }
          goto LABEL_49;
        }
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
    }
    int v75 = *(void *)(v0 + 448);
    uint64_t v76 = *(void *)(v0 + 424);
    uint64_t v77 = *(void *)(v0 + 432);
    uint64_t v79 = *(void *)(v0 + 152);
    uint64_t v78 = *(void *)(v0 + 160);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 408) + 56))(v79, 1, 1, *(void *)(v0 + 400));
    lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError, (void (*)(uint64_t))type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError);
    swift_allocError();
    *uint64_t v80 = 3;
    outlined init with take of Prompt.Component?(v79, (uint64_t)&v80[*(int *)(v78 + 20)]);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v75, v76);
    goto LABEL_42;
  }
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v122 = *(void *)(v0 + 344);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 264);
  long long v10 = *(char **)(v0 + 232);
  uint64_t v120 = v7;
  uint64_t v11 = *(void *)(v0 + 208);
  swift_beginAccess();
  uint64_t v3 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v128 = (void (**)(char *, uint64_t))(v4 + 8);
  v126 = (unsigned int (**)(uint64_t, uint64_t))(v2 + 88);
  v124 = *MEMORY[0x263F62040];
  uint64_t v115 = (void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
  uint64_t v116 = (void (**)(uint64_t, void))(v2 + 96);
  uint64_t v114 = (void (**)(uint64_t, uint64_t))(v1 + 8);
  v123 = (void (**)(void, void))(v122 + 8);
  uint64_t v112 = (void (**)(void, void))(v2 + 8);
  uint64_t v110 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v111 = v10;
  uint64_t v7 = v120;
  long long v12 = *(void *)(v9 + 16);
  uint64_t v13 = *(void *)(v0 + 472);
  unint64_t v117 = v6;
  while (2)
  {
    if (!v12)
    {
      __break(1u);
      goto LABEL_56;
    }
    long long v10 = *(char **)(v0 + 392);
    uint64_t v2 = *(void *)(v4 + 16);
    ((void (*)(void, unint64_t, void))v2)(*(void *)(v0 + 416), v9 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), *(void *)(v0 + 400));
    specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    outlined init with copy of State #1 in Prompt.parseAsChatMessagesPrompt()(v6, (uint64_t)v10);
    switch((*v3)(v10, 3, v7))
    {
      case 1u:
        uint64_t v24 = *(void *)(v0 + 288);
        uint64_t v1 = *(void *)(v0 + 256);
        static Prompt.SpecialToken.Chat.defaultInstructions.getter();
        Prompt.Component.value.getter();
        if ((*v126)(v24, v1) == v124)
        {
          uint64_t v25 = *(void *)(v0 + 328);
          uint64_t v27 = *(void *)(v0 + 288);
          v26 = *(void *)(v0 + 296);
          (*v116)(v27, *(void *)(v0 + 256));
          (*v115)(v25, v27, v26);
          uint64_t v28 = SpecialToken.identifier.getter();
          uint64_t v30 = v29;
          unint64_t v31 = Prompt.SpecialToken.identifier.getter();
          uint64_t v33 = *(void *)(v0 + 328);
          uint64_t v34 = *(void *)(v0 + 296);
          if (v28 == v31 && v30 == v32)
          {
            swift_bridgeObjectRelease_n();
            (*v114)(v33, v34);
LABEL_30:
            uint64_t v54 = *(void *)(v0 + 440);
            uint64_t v55 = *(void *)(v0 + 216);
            uint64_t v56 = *(void *)(v0 + 200);
            (*v123)(*(void *)(v0 + 368), *(void *)(v0 + 336));
            Prompt.init(_:)();
            MEMORY[0x261200B00](v54);
            System.toChatMessagePrompt()();
            (*v110)(v55, v56);
            swift_beginAccess();
            uint64_t v57 = *v113;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v57 + 16) + 1, 1, v57);
            }
            uint64_t v2 = *(void *)(v57 + 16);
            uint64_t v58 = *(void *)(v57 + 24);
            if (v2 >= v58 >> 1) {
              uint64_t v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v2 + 1, 1, v57);
            }
            long long v10 = *(char **)(v0 + 416);
            uint64_t v1 = *(void *)(v0 + 400);
            uint64_t v59 = *(void *)(v0 + 384);
            uint64_t v60 = *(void *)(v0 + 248);
            v61 = *(void *)(v0 + 224);
            *(void *)(v57 + 16) = v2 + 1;
            (*((void (**)(unint64_t, uint64_t, uint64_t))v111 + 4))(v57+ ((v111[80] + 32) & ~(unint64_t)v111[80])+ *((void *)v111 + 9) * v2, v60, v61);
            *v113 = v57;
            swift_endAccess();
            (*v128)(v10, v1);
            uint64_t v7 = v120;
            v118(v59, 2, 3, v120);
            uint64_t v49 = v59;
            goto LABEL_35;
          }
          uint64_t v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v114)(v33, v34);
          uint64_t v6 = v117;
          uint64_t v7 = v120;
          if (v1) {
            goto LABEL_30;
          }
        }
        else
        {
          (*v112)(*(void *)(v0 + 288), *(void *)(v0 + 256));
        }
        uint64_t v62 = *(char **)(v0 + 416);
        long long v10 = *(char **)(v0 + 192);
        (*v123)(*(void *)(v0 + 368), *(void *)(v0 + 336));
        _s9PromptKit0A0V15TokenGenerationE019parseAsChatMessagesA0AA0ghA0VyYaKF016onTurnEndSpecialC0L_7isStartySb_tAcDE05ParsefghaO5ErrorVYKF(1, v62, v121, v119, v10);
        if (v13)
        {
          v101 = *(void *)(v0 + 448);
          uint64_t v102 = *(void *)(v0 + 424);
          uint64_t v103 = *(void *)(v0 + 432);
          uint64_t v104 = *(char **)(v0 + 416);
          unint64_t v105 = *(void *)(v0 + 400);
          int v107 = *(void *)(v0 + 184);
          v106 = *(void *)(v0 + 192);
LABEL_54:
          swift_bridgeObjectRelease();
          outlined init with take of Prompt.ParseAsChatMessagesPromptParseError(v106, v107);
          lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError, (void (*)(uint64_t))type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError);
          swift_allocError();
          outlined init with take of Prompt.ParseAsChatMessagesPromptParseError(v107, v108);
          (*v128)(v104, v105);
          (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v101, v102);
          goto LABEL_42;
        }
LABEL_4:
        (*v128)(*(char **)(v0 + 416), *(void *)(v0 + 400));
        goto LABEL_5;
      case 2u:
        uint64_t v35 = *(void *)(v0 + 280);
        uint64_t v36 = *(void *)(v0 + 256);
        static Prompt.SpecialToken.Chat.turnEnd.getter();
        Prompt.Component.value.getter();
        if ((*v126)(v35, v36) == v124)
        {
          uint64_t v37 = *(void *)(v0 + 320);
          unint64_t v38 = *(void *)(v0 + 296);
          unint64_t v39 = *(void *)(v0 + 280);
          (*v116)(v39, *(void *)(v0 + 256));
          (*v115)(v37, v39, v38);
          uint64_t v40 = SpecialToken.identifier.getter();
          uint64_t v42 = v41;
          uint64_t v43 = Prompt.SpecialToken.identifier.getter();
          uint64_t v45 = *(void *)(v0 + 320);
          uint64_t v46 = *(void *)(v0 + 296);
          if (v40 == v43 && v42 == v44)
          {
            swift_bridgeObjectRelease_n();
            (*v114)(v45, v46);
          }
          else
          {
            uint64_t v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            (*v114)(v45, v46);
            if ((v47 & 1) == 0) {
              goto LABEL_52;
            }
          }
          uint64_t v48 = *(char **)(v0 + 416);
          long long v10 = *(char **)(v0 + 400);
          uint64_t v1 = *(void *)(v0 + 384);
          (*v123)(*(void *)(v0 + 360), *(void *)(v0 + 336));
          (*v128)(v48, (uint64_t)v10);
          uint64_t v7 = v120;
          v118(v1, 3, 3, v120);
          uint64_t v49 = v1;
LABEL_35:
          uint64_t v6 = v117;
          outlined assign with take of State #1 in Prompt.parseAsChatMessagesPrompt()(v49, v117);
LABEL_5:
          uint64_t v9 = v130;
          long long v12 = *(void *)(v130 + 16);
          if (!v12) {
            goto LABEL_38;
          }
          continue;
        }
        (*v112)(*(void *)(v0 + 280), *(void *)(v0 + 256));
LABEL_52:
        unint64_t v87 = *(void *)(v0 + 432);
        v125 = *(void *)(v0 + 424);
        v127 = *(void *)(v0 + 448);
        v89 = *(void *)(v0 + 408);
        unint64_t v88 = *(char **)(v0 + 416);
        uint64_t v90 = *(void *)(v0 + 400);
        char v92 = *(void *)(v0 + 176);
        uint64_t v91 = *(unsigned char **)(v0 + 184);
        char v93 = *(void *)(v0 + 160);
        (*v123)(*(void *)(v0 + 360), *(void *)(v0 + 336));
        uint64_t v94 = &v91[*(int *)(v93 + 20)];
        ((void (*)(unsigned char *, char *, uint64_t))v2)(v94, v88, v90);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v89 + 56))(v94, 0, 1, v90);
        *uint64_t v91 = 1;
        lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError, (void (*)(uint64_t))type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError);
        swift_willThrowTypedImpl();
        swift_bridgeObjectRelease();
        outlined init with take of Prompt.ParseAsChatMessagesPromptParseError((uint64_t)v91, v92);
        swift_allocError();
        outlined init with take of Prompt.ParseAsChatMessagesPromptParseError(v92, v95);
        (*v128)(v88, v90);
        (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v127, v125);
LABEL_42:
        swift_release();
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v81 = *(uint64_t (**)(void))(v0 + 8);
LABEL_43:
        return v81();
      case 3u:
        _s9PromptKit0A0V15TokenGenerationE019parseAsChatMessagesA0AA0ghA0VyYaKF016onTurnEndSpecialC0L_7isStartySb_tAcDE05ParsefghaO5ErrorVYKF(0, *(char **)(v0 + 416), v121, v119, *(char **)(v0 + 168));
        if (!v13) {
          goto LABEL_4;
        }
        v101 = *(void *)(v0 + 448);
        uint64_t v102 = *(void *)(v0 + 424);
        uint64_t v103 = *(void *)(v0 + 432);
        uint64_t v104 = *(char **)(v0 + 416);
        unint64_t v105 = *(void *)(v0 + 400);
        int v107 = *(void *)(v0 + 184);
        v106 = *(void *)(v0 + 168);
        goto LABEL_54;
      default:
        long long v10 = *(char **)(v0 + 272);
        uint64_t v1 = *(void *)(v0 + 256);
        static Prompt.SpecialToken.Chat.turnEnd.getter();
        Prompt.Component.value.getter();
        if ((*v126)((uint64_t)v10, v1) == v124)
        {
          uint64_t v14 = *(void *)(v0 + 312);
          long long v15 = *(void *)(v0 + 296);
          long long v16 = *(void *)(v0 + 272);
          (*v116)(v16, *(void *)(v0 + 256));
          (*v115)(v14, v16, v15);
          long long v17 = SpecialToken.identifier.getter();
          long long v19 = v18;
          uint64_t v20 = Prompt.SpecialToken.identifier.getter();
          long long v10 = v21;
          uint64_t v22 = *(void *)(v0 + 312);
          uint64_t v23 = *(void *)(v0 + 296);
          if (v17 == v20 && v19 == v21)
          {
            swift_bridgeObjectRelease_n();
            (*v114)(v22, v23);
            uint64_t v6 = v117;
            uint64_t v7 = v120;
LABEL_25:
            uint64_t v50 = *(char **)(v0 + 416);
            long long v10 = *(char **)(v0 + 400);
            uint64_t v1 = *(void *)(v0 + 384);
            (*v123)(*(void *)(v0 + 352), *(void *)(v0 + 336));
            (*v128)(v50, (uint64_t)v10);
            v118(v1, 3, 3, v7);
            outlined assign with take of State #1 in Prompt.parseAsChatMessagesPrompt()(v1, v6);
            goto LABEL_28;
          }
          uint64_t v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v114)(v22, v23);
          uint64_t v6 = v117;
          uint64_t v7 = v120;
          if (v1) {
            goto LABEL_25;
          }
        }
        else
        {
          (*v112)(*(void *)(v0 + 272), *(void *)(v0 + 256));
        }
        uint64_t v51 = *(void **)(v0 + 416);
        (*v123)(*(void *)(v0 + 352), *(void *)(v0 + 336));
        appendToLastChatMessage #1 (_:) in Prompt.parseAsChatMessagesPrompt()((uint64_t)v51, (uint64_t)v121, v51);
        if (v13)
        {
          uint64_t v96 = *(void *)(v0 + 448);
          uint64_t v97 = *(void *)(v0 + 424);
          uint64_t v98 = *(void *)(v0 + 432);
          uint64_t v99 = *(void *)(v0 + 392);
          (*v128)(*(char **)(v0 + 416), *(void *)(v0 + 400));
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v96, v97);
          uint64_t v100 = type metadata accessor for ChatMessageRole();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v100 - 8) + 8))(v99, v100);
          goto LABEL_42;
        }
        (*v128)(*(char **)(v0 + 416), *(void *)(v0 + 400));
LABEL_28:
        uint64_t v52 = *(void *)(v0 + 392);
        uint64_t v53 = type metadata accessor for ChatMessageRole();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v53 - 8) + 8))(v52, v53);
        goto LABEL_5;
    }
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PromptTemplate.loadRawPromptTemplateFromModelCatalog()()
{
  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModelConfigurationPromptTemplate?);
  v1[3] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for ModelConfigurationPromptTemplate();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResourceBundleIdentifier<AssetBackedLLMBundle>);
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResourceBundleIdentifier<LLMBundle>);
  v1[11] = v4;
  v1[12] = *(void *)(v4 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for PromptTemplate.ModelBundleID();
  v1[15] = v5;
  v1[16] = *(void *)(v5 - 8);
  v1[17] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ModelConfiguration();
  v1[18] = v6;
  v1[19] = *(void *)(v6 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](PromptTemplate.loadRawPromptTemplateFromModelCatalog(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;

  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  PromptTemplate.modelBundleID.getter();
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F41538])
  {
    uint64_t v5 = v0[17];
    uint64_t v6 = v0[14];
    uint64_t v8 = v0[12];
    uint64_t v7 = v0[13];
    uint64_t v9 = v0[11];
    (*(void (**)(uint64_t, void))(v0[16] + 96))(v5, v0[15]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v5, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v9);
    ModelConfiguration.init(modelbundleIdentifier:)();
  }
  else
  {
    if (v4 != *MEMORY[0x263F41540]) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    long long v10 = v0[17];
    uint64_t v11 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    (*(void (**)(uint64_t, void))(v0[16] + 96))(v10, v0[15]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v10, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v6, v9);
    ModelConfiguration.init(modelbundleIdentifier:)();
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  long long v12 = v0[4];
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[3];
  (*(void (**)(void, void, void))(v0[19] + 32))(v0[21], v0[20], v0[18]);
  PromptTemplate.templateID.getter();
  ModelConfiguration.promptTemplate(for:)();
  swift_bridgeObjectRelease();
  long long v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12);
  long long v16 = v0[21];
  long long v17 = v0[18];
  long long v18 = v0[19];
  if (v15 == 1)
  {
    long long v19 = v0[3];
    (*(void (**)(void, void))(v18 + 8))(v0[21], v0[18]);
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v19, &demangling cache variable for type metadata for ModelConfigurationPromptTemplate?);
    uint64_t v20 = 0;
    int64_t v21 = 0;
  }
  else
  {
    uint64_t v24 = v0[5];
    uint64_t v23 = v0[6];
    uint64_t v25 = v0[4];
    (*(void (**)(uint64_t, void, uint64_t))(v24 + 32))(v23, v0[3], v25);
    uint64_t v20 = ModelConfigurationPromptTemplate.rawTemplateString.getter();
    int64_t v21 = v26;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v27(v20, v21);
}

uint64_t static PromptTemplate.PromptTemplateRenderError.== infix(_:_:)()
{
  return 1;
}

void PromptTemplate.PromptTemplateRenderError.hash(into:)()
{
}

Swift::Int PromptTemplate.PromptTemplateRenderError.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t PromptTemplate.loadPromptTemplate()(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[5] = v3;
  *uint64_t v3 = v2;
  v3[1] = PromptTemplate.loadPromptTemplate();
  return PromptTemplate.loadRawPromptTemplateFromModelCatalog()();
}

uint64_t PromptTemplate.loadPromptTemplate()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 48) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = PromptTemplate.loadPromptTemplate();
  }
  else
  {
    *(void *)(v6 + 56) = a2;
    *(void *)(v6 + 64) = a1;
    uint64_t v7 = PromptTemplate.loadPromptTemplate();
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t PromptTemplate.loadPromptTemplate()()
{
  if (*(void *)(v0 + 56) || PromptTemplate.loadRawPromptTemplateFromFallbackPromptTemplateCatalog()().value._object)
  {
    Prompt.init(template:)();
  }
  else
  {
    lazy protocol witness table accessor for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError();
    swift_allocError();
    swift_willThrow();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  if (one-time initialization token for prompt != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.prompt);
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v3 = Logger.logObject.getter();
  uint64_t v4 = static os_log_type_t.error.getter();
  uint64_t v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[6];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x261201A80](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v9;

    _os_log_impl(&dword_25F79F000, v3, v4, "loadRawPromptTemplateFromModelCatalog failed with %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v8, -1, -1);
    MEMORY[0x261201C80](v7, -1, -1);
  }
  else
  {
  }
  if ((unint64_t)PromptTemplate.loadRawPromptTemplateFromFallbackPromptTemplateCatalog()().value._object)
  {
    Prompt.init(template:)();
  }
  else
  {
    lazy protocol witness table accessor for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError();
    swift_allocError();
    swift_willThrow();
  }
  long long v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t protocol witness for PromptComponentValueCustomDataTransformer.render(value:) in conformance Prompt.PromptTemplateTransformer(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #2 in register<A>(documents:registrationCallback:);
  return PromptTemplate.loadPromptTemplate()(a1);
}

void Prompt.ParseAsChatMessagesPromptParseError.problem.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void Prompt.ParseAsChatMessagesPromptParseError.Problem.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL static Prompt.ParseAsChatMessagesPromptParseError.Problem.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int Prompt.ParseAsChatMessagesPromptParseError.Problem.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Prompt.ParseAsChatMessagesPromptParseError.currentComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(0) + 20);
  return outlined init with copy of Prompt.Component?(v3, a1);
}

uint64_t type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(uint64_t a1)
{
  return type metadata accessor for InferenceRequestInstrumentation(a1, (uint64_t *)&type metadata singleton initialization cache for Prompt.ParseAsChatMessagesPromptParseError);
}

uint64_t outlined init with copy of Prompt.Component?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError()
{
  unint64_t result = lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError;
  if (!lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError;
  if (!lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PromptTemplate.PromptTemplateRenderError and conformance PromptTemplate.PromptTemplateRenderError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError.Problem and conformance Prompt.ParseAsChatMessagesPromptParseError.Problem()
{
  unint64_t result = lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError.Problem and conformance Prompt.ParseAsChatMessagesPromptParseError.Problem;
  if (!lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError.Problem and conformance Prompt.ParseAsChatMessagesPromptParseError.Problem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError.Problem and conformance Prompt.ParseAsChatMessagesPromptParseError.Problem);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PromptTemplate.PromptTemplateRenderError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25F8F41E8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptTemplate.PromptTemplateRenderError()
{
  return &type metadata for PromptTemplate.PromptTemplateRenderError;
}

uint64_t *initializeBufferWithCopyOfBuffer for Prompt.ParseAsChatMessagesPromptParseError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for Prompt.Component();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for Prompt.ParseAsChatMessagesPromptParseError(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for Prompt.Component();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *initializeWithCopy for Prompt.ParseAsChatMessagesPromptParseError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Prompt.Component();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithCopy for Prompt.ParseAsChatMessagesPromptParseError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Prompt.Component();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

unsigned char *initializeWithTake for Prompt.ParseAsChatMessagesPromptParseError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Prompt.Component();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithTake for Prompt.ParseAsChatMessagesPromptParseError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Prompt.Component();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for Prompt.ParseAsChatMessagesPromptParseError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F8F4984);
}

uint64_t sub_25F8F4984(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 251)
  {
    unsigned int v4 = *a1;
    if (v4 >= 5) {
      return v4 - 4;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    int v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Prompt.ParseAsChatMessagesPromptParseError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F8F4A44);
}

unsigned char *sub_25F8F4A44(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 251)
  {
    *uint64_t result = a2 + 4;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for Prompt.ParseAsChatMessagesPromptParseError()
{
  type metadata accessor for Prompt.Component?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Prompt.Component?()
{
  if (!lazy cache variable for type metadata for Prompt.Component?)
  {
    type metadata accessor for Prompt.Component();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Prompt.Component?);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for Prompt.ParseAsChatMessagesPromptParseError.Problem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25F8F4CA8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError.Problem()
{
  return &type metadata for Prompt.ParseAsChatMessagesPromptParseError.Problem;
}

uint64_t appendToLastChatMessage #1 (_:) in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = a3;
  uint64_t v5 = type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = type metadata accessor for Prompt.Component();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v15 = (unint64_t *)(a2 + 16);
  swift_beginAccess();
  unint64_t v16 = *(void *)(*(void *)(a2 + 16) + 16);
  if (!v16)
  {
    uint64_t v24 = &v10[*(int *)(v5 + 20)];
    (*(void (**)(char *, void *, uint64_t))(v12 + 16))(v24, v27, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v24, 0, 1, v11);
    *uint64_t v10 = 4;
    lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError, (void (*)(uint64_t))type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError);
    swift_willThrowTypedImpl();
    outlined init with take of Prompt.ParseAsChatMessagesPromptParseError((uint64_t)v10, (uint64_t)v8);
    swift_allocError();
    return outlined init with take of Prompt.ParseAsChatMessagesPromptParseError((uint64_t)v8, v25);
  }
  (*(void (**)(void *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  swift_beginAccess();
  unint64_t v17 = *v15;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *long long v15 = v17;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew()(v17);
    *long long v15 = v17;
  }
  if (v16 > *(void *)(v17 + 16))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v27 = v14;
  type metadata accessor for ChatMessagePrompt();
  uint64_t v8 = (char *)ChatMessagePrompt.prompt.modify();
  unint64_t v17 = Prompt.components.modify();
  uint64_t v14 = v19;
  uint64_t v10 = *v19;
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v14 = v10;
  if ((v20 & 1) == 0)
  {
LABEL_11:
    uint64_t v10 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v10 + 2) + 1, 1, (unint64_t)v10);
    *uint64_t v14 = v10;
  }
  unint64_t v22 = *((void *)v10 + 2);
  unint64_t v21 = *((void *)v10 + 3);
  if (v22 >= v21 >> 1)
  {
    uint64_t v10 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1, (unint64_t)v10);
    *uint64_t v14 = v10;
  }
  *((void *)v10 + 2) = v22 + 1;
  (*(void (**)(char *, void *, uint64_t))(v12 + 32))(&v10[((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v22], v27, v11);
  ((void (*)(char *, void))v17)(v28, 0);
  ((void (*)(char *, void))v8)(v29, 0);
  return swift_endAccess();
}

uint64_t _s9PromptKit0A0V15TokenGenerationE019parseAsChatMessagesA0AA0ghA0VyYaKF016onTurnEndSpecialC0L_7isStartySb_tAcDE05ParsefghaO5ErrorVYKF(int a1, char *a2, unint64_t *a3, uint64_t a4, char *a5)
{
  uint64_t v133 = a5;
  v153 = a3;
  int v132 = a1;
  uint64_t v6 = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  MEMORY[0x270FA5388](v6 - 8);
  v149 = (char *)&v130 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Prompt();
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v146 = (char *)&v130 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = type metadata accessor for ChatMessageRole();
  uint64_t v151 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  uint64_t v145 = (char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ChatMessagePrompt();
  uint64_t v147 = *(void *)(v11 - 8);
  uint64_t v148 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v134 = (char *)&v130 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v131 = (char *)&v130 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v140 = (char *)&v130 - v17;
  MEMORY[0x270FA5388](v16);
  v154 = (char *)&v130 - v18;
  uint64_t v19 = type metadata accessor for Prompt.Component.Value();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v136 = (char *)&v130 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v139 = (char *)&v130 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v142 = (char *)&v130 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v130 - v27;
  uint64_t v29 = type metadata accessor for SpecialToken();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v130 = (char *)&v130 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v135 = (char *)&v130 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v137 = (char *)&v130 - v36;
  MEMORY[0x270FA5388](v35);
  unint64_t v38 = (char *)&v130 - v37;
  uint64_t v159 = type metadata accessor for Prompt.SpecialToken();
  uint64_t v161 = *(void *)(v159 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v159);
  v138 = (char *)&v130 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  uint64_t v141 = (char *)&v130 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v152 = (char *)&v130 - v44;
  MEMORY[0x270FA5388](v43);
  uint64_t v46 = (char *)&v130 - v45;
  uint64_t v150 = swift_projectBox();
  static Prompt.SpecialToken.Chat.instructions.getter();
  uint64_t v47 = a2;
  Prompt.Component.value.getter();
  v156 = *(uint64_t (**)(char *, uint64_t))(v20 + 88);
  int v48 = v156(v28, v19);
  int v155 = *MEMORY[0x263F62040];
  uint64_t v160 = v29;
  uint64_t v158 = v30;
  uint64_t v144 = v19;
  uint64_t v143 = v20;
  if (v48 != v155)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v19);
    uint64_t v54 = v159;
LABEL_6:
    char v53 = 0;
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t))(v20 + 96))(v28, v19);
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v38, v28, v29);
  uint64_t v49 = SpecialToken.identifier.getter();
  uint64_t v51 = v50;
  if (v49 == Prompt.SpecialToken.identifier.getter() && v51 == v52)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v158 + 8))(v38, v160);
    char v53 = 1;
    uint64_t v54 = v159;
    goto LABEL_7;
  }
  char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v38, v160);
  uint64_t v54 = v159;
  if ((v76 & 1) == 0) {
    goto LABEL_6;
  }
  char v53 = 1;
LABEL_7:
  uint64_t v55 = v153 + 2;
  uint64_t v56 = v161 + 8;
  uint64_t v57 = *(void (**)(char *, uint64_t))(v161 + 8);
  v57(v46, v54);
  if (v53)
  {
    uint64_t v58 = *MEMORY[0x263F62110];
    uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v151 + 104);
    uint64_t v60 = v157;
    v59(v145, v58, v157);
    Prompt.init(components:)();
    ChatMessagePrompt.init(role:prompt:)();
    swift_beginAccess();
    unint64_t v61 = *v55;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v55 = v61;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v61 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v61 + 16) + 1, 1, v61);
      *uint64_t v55 = v61;
    }
    unint64_t v64 = *(void *)(v61 + 16);
    unint64_t v63 = *(void *)(v61 + 24);
    if (v64 >= v63 >> 1)
    {
      unint64_t v61 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v63 > 1, v64 + 1, 1, v61);
      *uint64_t v55 = v61;
    }
    *(void *)(v61 + 16) = v64 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v147 + 32))(v61+ ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80))+ *(void *)(v147 + 72) * v64, v154, v148);
    swift_endAccess();
    uint64_t v65 = (uint64_t)v149;
    v59(v149, v58, v60);
    goto LABEL_49;
  }
  uint64_t v66 = v47;
  uint64_t v161 = v56;
  v153 = v55;
  static Prompt.SpecialToken.Chat.user.getter();
  char v67 = v142;
  Prompt.Component.value.getter();
  uint64_t v68 = v144;
  int v69 = v156(v67, v144);
  if (v69 == v155)
  {
    (*(void (**)(char *, uint64_t))(v143 + 96))(v67, v68);
    uint64_t v70 = v137;
    (*(void (**)(char *, char *, uint64_t))(v158 + 32))(v137, v67, v160);
    uint64_t v71 = SpecialToken.identifier.getter();
    uint64_t v73 = v72;
    if (v71 == Prompt.SpecialToken.identifier.getter() && v73 == v74)
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v158 + 8))(v70, v160);
      uint64_t v75 = v157;
LABEL_30:
      v57(v152, v54);
      uint64_t v99 = *MEMORY[0x263F62100];
      uint64_t v100 = *(void (**)(char *, uint64_t, uint64_t))(v151 + 104);
      v100(v145, v99, v75);
      Prompt.init(components:)();
      ChatMessagePrompt.init(role:prompt:)();
      v101 = v153;
      swift_beginAccess();
      unint64_t v102 = *v101;
      char v103 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v101 = v102;
      if ((v103 & 1) == 0)
      {
        unint64_t v102 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v102 + 16) + 1, 1, v102);
        unint64_t *v101 = v102;
      }
      unint64_t v105 = *(void *)(v102 + 16);
      unint64_t v104 = *(void *)(v102 + 24);
      if (v105 >= v104 >> 1)
      {
        unint64_t v102 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v104 > 1, v105 + 1, 1, v102);
        unint64_t *v101 = v102;
      }
      *(void *)(v102 + 16) = v105 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v147 + 32))(v102+ ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80))+ *(void *)(v147 + 72) * v105, v140, v148);
      swift_endAccess();
      uint64_t v65 = (uint64_t)v149;
      v100(v149, v99, v75);
      goto LABEL_49;
    }
    v154 = v66;
    char v98 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v78 = v158;
    (*(void (**)(char *, uint64_t))(v158 + 8))(v70, v160);
    uint64_t v75 = v157;
    uint64_t v68 = v144;
    uint64_t v77 = v143;
    if (v98) {
      goto LABEL_30;
    }
  }
  else
  {
    v154 = v66;
    uint64_t v77 = v143;
    (*(void (**)(char *, uint64_t))(v143 + 8))(v67, v68);
    uint64_t v78 = v158;
  }
  v57(v152, v54);
  uint64_t v79 = v141;
  static Prompt.SpecialToken.Chat.response.getter();
  uint64_t v80 = v139;
  Prompt.Component.value.getter();
  int v81 = v156(v80, v68);
  if (v81 == v155)
  {
    (*(void (**)(char *, uint64_t))(v77 + 96))(v80, v68);
    uint64_t v82 = v78;
    uint64_t v83 = v135;
    (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v135, v80, v160);
    uint64_t v84 = SpecialToken.identifier.getter();
    uint64_t v86 = v85;
    if (v84 == Prompt.SpecialToken.identifier.getter() && v86 == v87)
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v160);
      uint64_t v54 = v159;
      uint64_t v79 = v141;
LABEL_37:
      v57(v79, v54);
      uint64_t v107 = *MEMORY[0x263F62118];
      uint64_t v108 = *(void (**)(char *, uint64_t, uint64_t))(v151 + 104);
      v108(v145, v107, v157);
      Prompt.init(components:)();
      uint64_t v109 = v131;
      ChatMessagePrompt.init(role:prompt:)();
      uint64_t v110 = v153;
      swift_beginAccess();
      unint64_t v111 = *v110;
      char v112 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v110 = v111;
      if ((v112 & 1) == 0)
      {
        unint64_t v111 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v111 + 16) + 1, 1, v111);
        *uint64_t v110 = v111;
      }
      unint64_t v114 = *(void *)(v111 + 16);
      unint64_t v113 = *(void *)(v111 + 24);
      if (v114 >= v113 >> 1)
      {
        unint64_t v111 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v113 > 1, v114 + 1, 1, v111);
        *uint64_t v110 = v111;
      }
      *(void *)(v111 + 16) = v114 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v147 + 32))(v111+ ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80))+ *(void *)(v147 + 72) * v114, v109, v148);
LABEL_48:
      swift_endAccess();
      uint64_t v65 = (uint64_t)v149;
      v108(v149, v107, v157);
LABEL_49:
      uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v65, 0, 3, v121);
      uint64_t v122 = v150;
      swift_beginAccess();
      return outlined assign with take of State #1 in Prompt.parseAsChatMessagesPrompt()(v65, v122);
    }
    char v106 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v78 = v82;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v160);
    uint64_t v54 = v159;
    uint64_t v68 = v144;
    uint64_t v79 = v141;
    if (v106) {
      goto LABEL_37;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v77 + 8))(v80, v68);
  }
  v57(v79, v54);
  unint64_t v88 = v138;
  static Prompt.SpecialToken.Chat.tool.getter();
  v89 = v136;
  Prompt.Component.value.getter();
  int v90 = v156(v89, v68);
  if (v90 == v155)
  {
    (*(void (**)(char *, uint64_t))(v77 + 96))(v89, v68);
    uint64_t v91 = v78;
    char v92 = v130;
    (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v130, v89, v160);
    uint64_t v93 = SpecialToken.identifier.getter();
    uint64_t v95 = v94;
    if (v93 == Prompt.SpecialToken.identifier.getter() && v95 == v96)
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v160);
      unint64_t v88 = v138;
      uint64_t v97 = v151;
LABEL_43:
      v57(v88, v159);
      uint64_t v107 = *MEMORY[0x263F620F8];
      uint64_t v108 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 104);
      v108(v145, v107, v157);
      Prompt.init(components:)();
      ChatMessagePrompt.init(role:prompt:)();
      uint64_t v116 = v153;
      swift_beginAccess();
      unint64_t v117 = *v116;
      char v118 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v116 = v117;
      if ((v118 & 1) == 0)
      {
        unint64_t v117 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v117 + 16) + 1, 1, v117);
        *uint64_t v116 = v117;
      }
      unint64_t v120 = *(void *)(v117 + 16);
      unint64_t v119 = *(void *)(v117 + 24);
      if (v120 >= v119 >> 1)
      {
        unint64_t v117 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v119 > 1, v120 + 1, 1, v117);
        *uint64_t v116 = v117;
      }
      *(void *)(v117 + 16) = v120 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v147 + 32))(v117+ ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80))+ *(void *)(v147 + 72) * v120, v134, v148);
      goto LABEL_48;
    }
    char v115 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v160);
    unint64_t v88 = v138;
    uint64_t v97 = v151;
    if (v115) {
      goto LABEL_43;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v77 + 8))(v89, v68);
  }
  v57(v88, v159);
  if (v132) {
    char v124 = 0;
  }
  else {
    char v124 = 2;
  }
  uint64_t v125 = type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(0);
  v126 = v133;
  v127 = &v133[*(int *)(v125 + 20)];
  uint64_t v128 = type metadata accessor for Prompt.Component();
  uint64_t v129 = *(void *)(v128 - 8);
  (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v127, v154, v128);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v129 + 56))(v127, 0, 1, v128);
  char *v126 = v124;
  lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError, (void (*)(uint64_t))type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError);
  return swift_willThrowTypedImpl();
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t specialized static == infix(_:_:) in State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ChatMessageRole();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (State #1 in Prompt.parseAsChatMessagesPrompt(), State #1 in Prompt.parseAsChatMessagesPrompt()));
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  outlined init with copy of State #1 in Prompt.parseAsChatMessagesPrompt()(a1, (uint64_t)v14);
  outlined init with copy of State #1 in Prompt.parseAsChatMessagesPrompt()(a2, v15);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  switch(v17((uint64_t)v14, 3, v16))
  {
    case 1u:
      if (v17(v15, 3, v16) != 1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2u:
      if (v17(v15, 3, v16) != 2) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 3u:
      if (v17(v15, 3, v16) != 3) {
        goto LABEL_9;
      }
LABEL_5:
      outlined destroy of State #1 in Prompt.parseAsChatMessagesPrompt()((uint64_t)v14);
      char v18 = 1;
      break;
    default:
      outlined init with copy of State #1 in Prompt.parseAsChatMessagesPrompt()((uint64_t)v14, (uint64_t)v10);
      if (v17(v15, 3, v16))
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_9:
        outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v14, &demangling cache variable for type metadata for (State #1 in Prompt.parseAsChatMessagesPrompt(), State #1 in Prompt.parseAsChatMessagesPrompt()));
        char v18 = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
        char v18 = static ChatMessageRole.== infix(_:_:)();
        uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
        v20(v7, v4);
        v20(v10, v4);
        outlined destroy of State #1 in Prompt.parseAsChatMessagesPrompt()((uint64_t)v14);
      }
      break;
  }
  return v18 & 1;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for Prompt.Component() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1)
{
  return type metadata accessor for InferenceRequestInstrumentation(a1, (uint64_t *)&type metadata singleton initialization cache for State #1 in Prompt.parseAsChatMessagesPrompt());
}

unint64_t lazy protocol witness table accessor for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer()
{
  unint64_t result = lazy protocol witness table cache variable for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer;
  if (!lazy protocol witness table cache variable for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Prompt.PromptTemplateTransformer and conformance Prompt.PromptTemplateTransformer);
  }
  return result;
}

uint64_t sub_25F8F687C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t outlined init with copy of State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of Prompt.ParseAsChatMessagesPromptParseError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Prompt.ParseAsChatMessagesPromptParseError(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of Prompt.Component?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Component?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State #1 in Prompt.parseAsChatMessagesPrompt()(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *type metadata accessor for Prompt.PromptTemplateTransformer()
{
  return &unk_270BC4850;
}

uint64_t *initializeBufferWithCopyOfBuffer for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = type metadata accessor for ChatMessageRole();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = type metadata accessor for ChatMessageRole();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *initializeWithCopy for State #1 in Prompt.parseAsChatMessagesPrompt()(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for ChatMessageRole();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithCopy for State #1 in Prompt.parseAsChatMessagesPrompt()(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = type metadata accessor for ChatMessageRole();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)a1, &demangling cache variable for type metadata for (role: ChatMessageRole));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = type metadata accessor for ChatMessageRole();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *initializeWithTake for State #1 in Prompt.parseAsChatMessagesPrompt()(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for ChatMessageRole();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithTake for State #1 in Prompt.parseAsChatMessagesPrompt()(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = type metadata accessor for ChatMessageRole();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)a1, &demangling cache variable for type metadata for (role: ChatMessageRole));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = type metadata accessor for ChatMessageRole();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F8F72A0);
}

uint64_t sub_25F8F72A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F8F7324);
}

uint64_t sub_25F8F7324(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t getEnumTag for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t destructiveInjectEnumTag for State #1 in Prompt.parseAsChatMessagesPrompt()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (role: ChatMessageRole));
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

uint64_t type metadata completion function for State #1 in Prompt.parseAsChatMessagesPrompt()()
{
  uint64_t result = type metadata accessor for ChatMessageRole();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for PromptComponentValueCustomDataTransformer.CustomDataType : PromptComponentValueCustomDataConvertible in Prompt.PromptTemplateTransformer()
{
  return lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(&lazy protocol witness table cache variable for type PromptTemplate and conformance PromptTemplate, MEMORY[0x263F41548]);
}

uint64_t lazy protocol witness table accessor for type Prompt.ParseAsChatMessagesPromptParseError and conformance Prompt.ParseAsChatMessagesPromptParseError(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t static Tooling.argumentsSchema.getter()
{
  uint64_t v0 = type metadata accessor for Schema();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of static Generable.schema.getter();
  Schema.type.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t TokenGenerator.countTokens(in:metadata:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 200) = a1;
  uint64_t v5 = type metadata accessor for Prompt();
  *(void *)(v2 + 208) = v5;
  *(void *)(v2 + 216) = *(void *)(v5 - 8);
  *(void *)(v2 + 224) = swift_task_alloc();
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 48);
  *(_OWORD *)(v2 + 128) = *(_OWORD *)a2;
  *(void *)(v2 + 144) = v6;
  *(void *)(v2 + 152) = v7;
  *(_OWORD *)(v2 + 160) = *(_OWORD *)(a2 + 32);
  *(void *)(v2 + 176) = v8;
  int v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 232) = v9;
  *int v9 = v2;
  v9[1] = TokenGenerator.countTokens(in:metadata:);
  return TokenGenerator._countTokens(in:metadata:)(v2 + 16, a1, (uint64_t *)(v2 + 128));
}

uint64_t TokenGenerator.countTokens(in:metadata:)()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenGenerator.countTokens(in:metadata:);
  }
  else {
    uint64_t v2 = TokenGenerator.countTokens(in:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = v0[2];
  outlined consume of PromptRenderingEnvelope?(v0[3], v0[4]);
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v2 = v0[25];
  int v3 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[26];
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v2, v5);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  int v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = v0[27];
  int v10 = v0[28];
  uint64_t v12 = v0[26];
  if (v9)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v13 = 134218243;
    v0[23] = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2085;
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[24] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl(&dword_25F79F000, v7, v8, "Counted %ld tokens in prompt: %{sensitive}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v18, -1, -1);
    MEMORY[0x261201C80](v13, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[28], v0[26]);
  }

  swift_task_dealloc();
  unint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TokenGenerator.countTokens(prompt:promptTemplateInfo:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 216) = a2;
  uint64_t v7 = type metadata accessor for PromptTemplateInfo();
  *(void *)(v3 + 224) = v7;
  *(void *)(v3 + 232) = *(void *)(v7 - 8);
  *(void *)(v3 + 240) = swift_task_alloc();
  *(void *)(v3 + 248) = swift_task_alloc();
  uint64_t v8 = *(void *)(a3 + 48);
  long long v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 128) = *(_OWORD *)a3;
  long long v10 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 144) = v9;
  *(_OWORD *)(v3 + 160) = v10;
  *(void *)(v3 + 176) = v8;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 256) = v11;
  *uint64_t v11 = v3;
  v11[1] = TokenGenerator.countTokens(prompt:promptTemplateInfo:metadata:);
  return TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:)(v3 + 16, a1, a2, v3 + 128);
}

uint64_t TokenGenerator.countTokens(prompt:promptTemplateInfo:metadata:)()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenGenerator.countTokens(prompt:promptTemplateInfo:metadata:);
  }
  else {
    uint64_t v2 = TokenGenerator.countTokens(prompt:promptTemplateInfo:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = v0[2];
  outlined consume of PromptRenderingEnvelope?(v0[3], v0[4]);
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[28];
  uint64_t v4 = v0[29];
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  long long v9 = os_log_type_enabled(v7, v8);
  long long v10 = v0[31];
  uint64_t v11 = v0[29];
  if (v9)
  {
    uint64_t v17 = v0[28];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v12 = 134218243;
    v0[25] = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2085;
    uint64_t v13 = PromptTemplateInfo.templateID.getter();
    v0[26] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v17);
    _os_log_impl(&dword_25F79F000, v7, v8, "Counted %ld tokens for prompt template: %{sensitive}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v18, -1, -1);
    MEMORY[0x261201C80](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[31], v0[28]);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v1);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  uint64_t v23 = v0;
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[29];
  uint64_t v2 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  long long v9 = os_log_type_enabled(v7, v8);
  long long v10 = (void *)v0[33];
  uint64_t v12 = v0[29];
  uint64_t v11 = v0[30];
  uint64_t v13 = v0[28];
  if (v9)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    BOOL v22 = v21;
    *(_DWORD *)uint64_t v14 = 136643075;
    uint64_t v15 = PromptTemplateInfo.templateID.getter();
    v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    *(_WORD *)(v14 + 12) = 2112;
    MEMORY[0x261201A80](v10);
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v20 = v17;

    _os_log_impl(&dword_25F79F000, v7, v8, "Failed to count tokens for prompt template: %{sensitive}s. %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v21, -1, -1);
    MEMORY[0x261201C80](v14, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v12 + 8))(v0[30], v0[28]);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:constraint:metadata:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, void (**a4)(char *, uint64_t)@<X3>, unsigned int (**a5)(uint64_t, uint64_t, uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v85 = a3;
  uint64_t v92 = a1;
  uint64_t v93 = (void (*)(char *, unint64_t, uint64_t))a6;
  int v90 = a5;
  uint64_t v91 = a4;
  uint64_t v84 = a8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyTooling?);
  MEMORY[0x270FA5388](v10 - 8);
  v89 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = type metadata accessor for AnyTooling();
  uint64_t v88 = *(void *)(v98 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v98);
  uint64_t v97 = (uint64_t)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v87 = (uint64_t)&v72 - v14;
  uint64_t v96 = type metadata accessor for ToolType();
  uint64_t v99 = *(void *)(v96 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v96);
  uint64_t v95 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v94 = (char *)&v72 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v83 = (uint64_t)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v82 = (uint64_t)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for Prompt();
  uint64_t v22 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v24 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for CompletePromptRequest(0);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v86 = (uint64_t *)((char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = type metadata accessor for UUID();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v72 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = a2[6];
  long long v33 = a2[7];
  long long v34 = a2[4];
  long long v108 = a2[5];
  long long v109 = v32;
  v110[0] = v33;
  *(_DWORD *)((char *)v110 + 15) = *(_DWORD *)((char *)a2 + 127);
  long long v35 = a2[3];
  long long v105 = a2[2];
  long long v106 = v35;
  long long v107 = v34;
  long long v36 = a2[1];
  long long v103 = *a2;
  long long v104 = v36;
  uint64_t v38 = *a7;
  uint64_t v37 = (void (*)(char *, char *, uint64_t))a7[1];
  uint64_t v39 = (void (*)(char *, char *, uint64_t))a7[2];
  uint64_t v40 = (void (*)(char *, char *, uint64_t))a7[3];
  uint64_t v41 = (void (*)(char *, char *, uint64_t))a7[4];
  uint64_t v42 = (void (*)(char *, char *, uint64_t))a7[5];
  uint64_t v43 = (void (*)(char *, char *, uint64_t))a7[6];
  uint64_t v79 = v42;
  uint64_t v80 = v43;
  uint64_t v77 = v39;
  uint64_t v78 = v41;
  uint64_t v75 = v38;
  char v76 = v40;
  if (v37)
  {
    uint64_t v73 = v37;
    uint64_t v74 = (void (*)(char *, char *, uint64_t))v38;
    uint64_t v44 = v39;
    uint64_t v45 = v40;
    uint64_t v46 = v41;
    uint64_t v47 = v42;
    int v48 = v43;
    uint64_t v49 = (uint64_t)v37;
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v50 = v29;
    UUID.init()();
    uint64_t v51 = UUID.uuidString.getter();
    uint64_t v73 = v52;
    uint64_t v74 = (void (*)(char *, char *, uint64_t))v51;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v50);
    uint64_t v45 = (void (*)(char *, char *, uint64_t))0x800000025F92DC80;
    int v48 = (void (*)(char *, char *, uint64_t))specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v44 = (void (*)(char *, char *, uint64_t))0xD00000000000004BLL;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v92, v81);
  v101[5] = v108;
  v101[6] = v109;
  v102[0] = v110[0];
  *(_DWORD *)((char *)v102 + 15) = *(_DWORD *)((char *)v110 + 15);
  v101[2] = v105;
  v101[3] = v106;
  v101[4] = v107;
  v101[0] = v103;
  v101[1] = v104;
  uint64_t v53 = v82;
  outlined init with copy of Prompt.Rendering?((uint64_t)v93, v82, &demangling cache variable for type metadata for Constraints?);
  uint64_t v54 = v83;
  outlined init with copy of Prompt.Rendering?((uint64_t)v91, v83, &demangling cache variable for type metadata for ToolChoice?);
  v100[0] = v74;
  v100[1] = v73;
  v100[2] = v44;
  v100[3] = v45;
  v100[4] = v46;
  v100[5] = v47;
  v100[6] = v48;
  outlined copy of RequestMetadata?(v75, v49);
  outlined retain of SamplingParameters((uint64_t)&v103);
  uint64_t v55 = v85;
  swift_bridgeObjectRetain();
  uint64_t v56 = (uint64_t)v90;
  swift_bridgeObjectRetain();
  CompletePromptRequest.init(prompt:parameters:constraint:tools:toolChoice:documents:metadata:)((uint64_t)v24, (uint64_t *)v101, v53, v55, v54, v56, v100, v86);
  uint64_t v57 = *(void *)(v55 + 16);
  if (v57)
  {
    uint64_t v58 = *(void *)(v99 + 16);
    unint64_t v59 = v55 + ((*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80));
    uint64_t v92 = *(void *)(v99 + 72);
    uint64_t v93 = (void (*)(char *, unint64_t, uint64_t))v58;
    v99 += 16;
    int v90 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48);
    uint64_t v91 = (void (**)(char *, uint64_t))(v99 - 8);
    swift_bridgeObjectRetain();
    uint64_t v60 = MEMORY[0x263F8EE78];
    uint64_t v61 = (uint64_t)v89;
    uint64_t v62 = v93;
    unint64_t v63 = v94;
    uint64_t v64 = (uint64_t)v95;
    do
    {
      uint64_t v65 = v96;
      v62(v63, v59, v96);
      v62((char *)v64, (unint64_t)v63, v65);
      AnyTooling.init(_:)(v64, v61);
      (*v91)(v63, v65);
      if ((*v90)(v61, 1, v98) == 1)
      {
        outlined destroy of GenerativeFunctionsInstrumentationEvent?(v61, &demangling cache variable for type metadata for AnyTooling?);
      }
      else
      {
        uint64_t v66 = v61;
        uint64_t v67 = v87;
        outlined init with take of AnyTooling(v66, v87, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        outlined init with take of AnyTooling(v67, v97, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v60 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v60 + 16) + 1, 1, v60);
        }
        unint64_t v69 = *(void *)(v60 + 16);
        unint64_t v68 = *(void *)(v60 + 24);
        if (v69 >= v68 >> 1) {
          uint64_t v60 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v68 > 1, v69 + 1, 1, v60);
        }
        *(void *)(v60 + 16) = v69 + 1;
        outlined init with take of AnyTooling(v97, v60+ ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80))+ *(void *)(v88 + 72) * v69, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        uint64_t v61 = (uint64_t)v89;
      }
      v59 += v92;
      --v57;
    }
    while (v57);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v60 = MEMORY[0x263F8EE78];
  }
  uint64_t v70 = v86;
  TokenGenerator.handleCompletePromptRequest(request:tools:)((uint64_t)v86, v60, v84);
  swift_bridgeObjectRelease();
  return outlined destroy of CompletePromptRequest((uint64_t)v70, type metadata accessor for CompletePromptRequest);
}

uint64_t TokenGenerator.complete(prompt:promptTemplateInfo:parameters:tools:toolChoice:documents:constraint:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v71 = a9;
  uint64_t v65 = a5;
  uint64_t v66 = a7;
  uint64_t v69 = a4;
  uint64_t v70 = a6;
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v68 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v67 = (uint64_t)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for PromptTemplateInfo();
  uint64_t v15 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v64 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt?);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v61 = (uint64_t)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for CompletePromptTemplateRequest(0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for UUID();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v26 = a3[6];
  long long v27 = a3[7];
  long long v28 = a3[4];
  long long v80 = a3[5];
  long long v81 = v26;
  v82[0] = v27;
  *(_DWORD *)((char *)v82 + 15) = *(_DWORD *)((char *)a3 + 127);
  long long v29 = a3[3];
  long long v77 = a3[2];
  long long v78 = v29;
  long long v79 = v28;
  long long v30 = a3[1];
  long long v75 = *a3;
  long long v76 = v30;
  uint64_t v31 = *a8;
  uint64_t v32 = a8[1];
  uint64_t v33 = a8[2];
  uint64_t v34 = a8[3];
  uint64_t v35 = a8[4];
  uint64_t v36 = a8[5];
  unint64_t v37 = a8[6];
  uint64_t v58 = v36;
  unint64_t v59 = v37;
  uint64_t v56 = v33;
  uint64_t v57 = v35;
  uint64_t v54 = v31;
  uint64_t v55 = v34;
  if (v32)
  {
    uint64_t v52 = v32;
    uint64_t v53 = v31;
    uint64_t v38 = v33;
    unint64_t v50 = v37;
    uint64_t v51 = v34;
    uint64_t v39 = v35;
    uint64_t v40 = v36;
  }
  else
  {
    UUID.init()();
    uint64_t v41 = UUID.uuidString.getter();
    uint64_t v52 = v42;
    uint64_t v53 = v41;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    uint64_t v51 = 0x800000025F92DCD0;
    unint64_t v50 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 0xD00000000000005ELL;
  }
  uint64_t v43 = v61;
  outlined init with copy of Prompt.Rendering?(v62, v61, &demangling cache variable for type metadata for Prompt?);
  uint64_t v44 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v64, v63, v60);
  v73[5] = v80;
  v73[6] = v81;
  v74[0] = v82[0];
  *(_DWORD *)((char *)v74 + 15) = *(_DWORD *)((char *)v82 + 15);
  v73[2] = v77;
  v73[3] = v78;
  v73[4] = v79;
  v73[0] = v75;
  v73[1] = v76;
  uint64_t v45 = v67;
  outlined init with copy of Prompt.Rendering?(v65, v67, &demangling cache variable for type metadata for ToolChoice?);
  uint64_t v46 = v68;
  outlined init with copy of Prompt.Rendering?(v66, v68, &demangling cache variable for type metadata for Constraints?);
  v72[0] = v53;
  v72[1] = v52;
  v72[2] = v38;
  v72[3] = v51;
  v72[4] = v39;
  v72[5] = v40;
  v72[6] = v50;
  outlined copy of RequestMetadata?(v54, v32);
  outlined retain of SamplingParameters((uint64_t)&v75);
  uint64_t v47 = v69;
  swift_bridgeObjectRetain();
  uint64_t v48 = v70;
  swift_bridgeObjectRetain();
  CompletePromptTemplateRequest.init(prompt:promptTemplateInfo:parameters:tools:toolChoice:documents:constraint:metadata:)(v43, v44, (uint64_t *)v73, v47, v45, v48, v46, v72, (uint64_t)v21);
  TokenGenerator.handleCompletePromptTemplateRequest(request:)((uint64_t)v21, v71);
  return outlined destroy of CompletePromptRequest((uint64_t)v21, type metadata accessor for CompletePromptTemplateRequest);
}

uint64_t TokenGenerator.complete<A>(prompt:parameters:tools:toolChoice:documents:generating:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (**a4)(char *, uint64_t)@<X3>, unsigned int (**a5)(uint64_t, uint64_t, uint64_t)@<X4>, uint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v40 = a7;
  uint64_t v38 = a5;
  unint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v35 = a1;
  uint64_t v39 = a8;
  uint64_t v41 = a9;
  uint64_t v34 = type metadata accessor for Schema();
  uint64_t v11 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TokenStream<String>);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *(_OWORD *)(a2 + 96);
  long long v21 = *(_OWORD *)(a2 + 112);
  long long v22 = *(_OWORD *)(a2 + 64);
  v43[5] = *(_OWORD *)(a2 + 80);
  v43[6] = v20;
  *(_OWORD *)uint64_t v44 = v21;
  *(_DWORD *)&v44[15] = *(_DWORD *)(a2 + 127);
  long long v23 = *(_OWORD *)(a2 + 48);
  v43[2] = *(_OWORD *)(a2 + 32);
  v43[3] = v23;
  v43[4] = v22;
  long long v24 = *(_OWORD *)(a2 + 16);
  v43[0] = *(_OWORD *)a2;
  v43[1] = v24;
  uint64_t v26 = *a6;
  uint64_t v25 = a6[1];
  uint64_t v27 = a6[3];
  uint64_t v32 = a6[2];
  uint64_t v28 = a6[5];
  uint64_t v33 = a6[4];
  uint64_t v29 = a6[6];
  dispatch thunk of static Generable.schema.getter();
  Schema.type.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v34);
  uint64_t v30 = type metadata accessor for Constraints(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v16, 0, 1, v30);
  v42[0] = v26;
  v42[1] = v25;
  v42[2] = v32;
  v42[3] = v27;
  v42[4] = v33;
  v42[5] = v28;
  v42[6] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:constraint:metadata:)(v35, v43, v36, v37, v38, (uint64_t)v16, v42, (uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v16, &demangling cache variable for type metadata for Constraints?);
  TokenStream<>.map<A>(_:)(v39);
  return outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v19, &demangling cache variable for type metadata for TokenStream<String>);
}

uint64_t TokenGenerator.complete<A>(prompt:promptTemplateInfo:parameters:tools:toolChoice:documents:generating:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = a6;
  uint64_t v40 = a5;
  uint64_t v39 = a4;
  uint64_t v38 = a2;
  uint64_t v37 = a1;
  uint64_t v42 = a8;
  uint64_t v43 = a9;
  uint64_t v44 = a10;
  uint64_t v36 = type metadata accessor for Schema();
  uint64_t v12 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TokenStream<String>);
  MEMORY[0x270FA5388](v18 - 8);
  long long v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v21 = *(_OWORD *)(a3 + 96);
  long long v22 = *(_OWORD *)(a3 + 112);
  long long v23 = *(_OWORD *)(a3 + 64);
  v46[5] = *(_OWORD *)(a3 + 80);
  v46[6] = v21;
  *(_OWORD *)uint64_t v47 = v22;
  *(_DWORD *)&v47[15] = *(_DWORD *)(a3 + 127);
  long long v24 = *(_OWORD *)(a3 + 48);
  v46[2] = *(_OWORD *)(a3 + 32);
  v46[3] = v24;
  v46[4] = v23;
  long long v25 = *(_OWORD *)(a3 + 16);
  v46[0] = *(_OWORD *)a3;
  v46[1] = v25;
  uint64_t v27 = *a7;
  uint64_t v26 = a7[1];
  uint64_t v28 = a7[3];
  uint64_t v34 = a7[2];
  uint64_t v29 = a7[5];
  uint64_t v35 = a7[4];
  uint64_t v30 = a7[6];
  dispatch thunk of static Generable.schema.getter();
  Schema.type.getter();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v36);
  uint64_t v31 = type metadata accessor for Constraints(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v17, 0, 1, v31);
  v45[0] = v27;
  v45[1] = v26;
  v45[2] = v34;
  v45[3] = v28;
  v45[4] = v35;
  v45[5] = v29;
  v45[6] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  TokenGenerator.complete(prompt:promptTemplateInfo:parameters:tools:toolChoice:documents:constraint:metadata:)(v37, v38, v46, v39, v40, v41, (uint64_t)v17, v45, (uint64_t)v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v17, &demangling cache variable for type metadata for Constraints?);
  TokenStream<>.map<A>(_:)(v42);
  return outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v20, &demangling cache variable for type metadata for TokenStream<String>);
}

uint64_t TokenGenerator.render(prompt:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 232) = a2;
  *(void *)(v4 + 240) = v3;
  *(void *)(v4 + 224) = a1;
  uint64_t v6 = type metadata accessor for Prompt();
  *(void *)(v4 + 248) = v6;
  *(void *)(v4 + 256) = *(void *)(v6 - 8);
  *(void *)(v4 + 264) = swift_task_alloc();
  *(void *)(v4 + 272) = swift_task_alloc();
  *(void *)(v4 + 280) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Prompt.Rendering();
  *(void *)(v4 + 288) = v7;
  *(void *)(v4 + 296) = *(void *)(v7 - 8);
  *(void *)(v4 + 304) = swift_task_alloc();
  type metadata accessor for Prompt.Rendering.Source();
  *(void *)(v4 + 312) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Rendering?);
  *(void *)(v4 + 320) = swift_task_alloc();
  uint64_t v8 = type metadata accessor for UUID();
  *(void *)(v4 + 328) = v8;
  *(void *)(v4 + 336) = *(void *)(v8 - 8);
  *(void *)(v4 + 344) = swift_task_alloc();
  long long v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 352) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 368) = v9;
  *(_OWORD *)(v4 + 384) = *(_OWORD *)(a3 + 32);
  *(void *)(v4 + 400) = *(void *)(a3 + 48);
  return MEMORY[0x270FA2498](TokenGenerator.render(prompt:metadata:), 0, 0);
}

uint64_t TokenGenerator.render(prompt:metadata:)()
{
  uint64_t v1 = v0[45];
  if (v1)
  {
    uint64_t v2 = v0[44];
    uint64_t v3 = v2;
    uint64_t v4 = v0[45];
    unint64_t v5 = v0[46];
    unint64_t v6 = v0[47];
    uint64_t v7 = v0[48];
    uint64_t v8 = v0[49];
    unint64_t v9 = v0[50];
  }
  else
  {
    uint64_t v11 = v0[42];
    uint64_t v10 = v0[43];
    uint64_t v12 = v0[41];
    UUID.init()();
    uint64_t v3 = UUID.uuidString.getter();
    uint64_t v4 = v13;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    unint64_t v9 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v1 = v0[45];
    unint64_t v6 = 0x800000025F92DD30;
    uint64_t v2 = v0[44];
    unint64_t v5 = 0xD000000000000018;
  }
  v0[53] = v8;
  v0[54] = v9;
  v0[51] = v4;
  v0[52] = v6;
  v0[16] = v3;
  v0[17] = v4;
  v0[18] = v5;
  v0[19] = v6;
  v0[20] = v7;
  v0[21] = v8;
  v0[22] = v9;
  outlined copy of RequestMetadata?(v2, v1);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[55] = (uint64_t)v14;
  *uint64_t v14 = v0;
  v14[1] = TokenGenerator.render(prompt:metadata:);
  uint64_t v15 = v0[29];
  return TokenGenerator._countTokens(in:metadata:)((uint64_t)(v0 + 2), v15, v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 448) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = TokenGenerator.render(prompt:metadata:);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = TokenGenerator.render(prompt:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(void);
  void *v65;
  uint64_t type;
  uint64_t typea;
  os_log_type_t typeb;
  uint64_t v69;
  uint64_t v70[2];
  void *v71;
  uint64_t v72;

  uint64_t v71 = v0;
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  if (v1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Prompt.Rendering.Source.init(identifier:version:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Prompt.Rendering.init(source:segments:renderedString:originalPrompt:tokenIDs:userInfo:detokenizedString:)();
    uint64_t v3 = 0;
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v3 = 1;
    uint64_t v4 = v0[3];
  }
  unint64_t v5 = v0[40];
  unint64_t v6 = v0[36];
  uint64_t v7 = v0[37];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v3, 1, v6);
  outlined consume of PromptRenderingEnvelope?(v4, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[40], &demangling cache variable for type metadata for Prompt.Rendering?);
    uint64_t v8 = 0x26B3A3000uLL;
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    unint64_t v9 = v0[34];
    uint64_t v10 = v0[31];
    uint64_t v11 = v0[32];
    uint64_t v12 = v0[29];
    uint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v12, v10);
    uint64_t v14 = Logger.logObject.getter();
    uint64_t v15 = static os_log_type_t.error.getter();
    uint64_t v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = v0[34];
    uint64_t v18 = v0[31];
    uint64_t v19 = v0[32];
    if (v16)
    {
      long long v20 = (uint8_t *)swift_slowAlloc();
      type = swift_slowAlloc();
      v70[0] = type;
      *(_DWORD *)long long v20 = 136642819;
      lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
      long long v21 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[25] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
      _os_log_impl(&dword_25F79F000, v14, v15, "Rendered prompt for: %{sensitive}s is empty", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261201C80](type, -1, -1);
      long long v23 = v20;
      uint64_t v8 = 0x26B3A3000;
      MEMORY[0x261201C80](v23, -1, -1);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
    }

    type metadata accessor for TokenGenerationError(0);
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
    uint64_t v47 = (void *)swift_allocError();
    *uint64_t v48 = 0xD000000000000018;
    v48[1] = 0x800000025F92DD50;
    v48[2] = 0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    if (*(void *)(v8 + 760) != -1) {
      swift_once();
    }
    unint64_t v50 = v0[32];
    uint64_t v49 = v0[33];
    uint64_t v51 = v0[31];
    uint64_t v52 = v0[29];
    __swift_project_value_buffer(v13, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v49, v52, v51);
    MEMORY[0x261201A80](v47);
    MEMORY[0x261201A80](v47);
    uint64_t v53 = Logger.logObject.getter();
    uint64_t v54 = static os_log_type_t.error.getter();
    uint64_t v55 = os_log_type_enabled(v53, v54);
    uint64_t v57 = v0[32];
    uint64_t v56 = v0[33];
    uint64_t v58 = v0[31];
    if (v55)
    {
      typeb = v54;
      unint64_t v59 = swift_slowAlloc();
      uint64_t v65 = (void *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      v70[0] = v69;
      *(_DWORD *)unint64_t v59 = 136643075;
      lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
      uint64_t v60 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
      *(_WORD *)(v59 + 12) = 2112;
      MEMORY[0x261201A80](v47);
      uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
      v0[24] = v62;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v65 = v62;

      _os_log_impl(&dword_25F79F000, v53, typeb, "Failed to render prompt: %{sensitive}s. %@", (uint8_t *)v59, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v65, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v69, -1, -1);
      MEMORY[0x261201C80](v59, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v57 + 8))(v0[33], v0[31]);
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v63 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    (*(void (**)(void, void, void))(v0[37] + 32))(v0[28], v0[40], v0[36]);
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    long long v25 = v0[37];
    long long v24 = v0[38];
    uint64_t v27 = v0[35];
    uint64_t v26 = v0[36];
    uint64_t v29 = v0[31];
    uint64_t v28 = v0[32];
    uint64_t v31 = v0[28];
    uint64_t v30 = v0[29];
    uint64_t v32 = type metadata accessor for Logger();
    __swift_project_value_buffer(v32, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v31, v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v30, v29);
    uint64_t v33 = Logger.logObject.getter();
    uint64_t v34 = static os_log_type_t.debug.getter();
    uint64_t v35 = os_log_type_enabled(v33, v34);
    uint64_t v37 = v0[37];
    uint64_t v36 = v0[38];
    uint64_t v38 = v0[35];
    uint64_t v39 = v0[36];
    uint64_t v40 = v0[31];
    uint64_t v41 = v0[32];
    if (v35)
    {
      uint64_t v42 = swift_slowAlloc();
      typea = swift_slowAlloc();
      v70[0] = typea;
      *(_DWORD *)uint64_t v42 = 136643075;
      uint64_t v43 = Prompt.Rendering.renderedString.getter();
      v0[26] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v39);
      *(_WORD *)(v42 + 12) = 2085;
      lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
      uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v38, v40);
      _os_log_impl(&dword_25F79F000, v33, v34, "Rendered prompt text: %{sensitive}s for prompt: %{sensitive}s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261201C80](typea, -1, -1);
      MEMORY[0x261201C80](v42, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v37 + 8))(v0[38], v0[36]);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v38, v40);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v63 = (uint64_t (*)(void))v0[1];
  }
  return v63();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  long long v22 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[56];
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v3 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[31];
  unint64_t v5 = v0[29];
  unint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  unint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = v0[32];
  uint64_t v10 = v0[33];
  uint64_t v12 = v0[31];
  if (v9)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    long long v20 = swift_slowAlloc();
    long long v21 = v20;
    *(_DWORD *)uint64_t v13 = 136643075;
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    *(_WORD *)(v13 + 12) = 2112;
    MEMORY[0x261201A80](v1);
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v16;

    _os_log_impl(&dword_25F79F000, v7, v8, "Failed to render prompt: %{sensitive}s. %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v20, -1, -1);
    MEMORY[0x261201C80](v13, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[33], v0[31]);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t TokenGenerator.render(prompt:promptTemplateInfo:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 224) = a1;
  *(void *)(v4 + 232) = a3;
  uint64_t v8 = type metadata accessor for PromptTemplateInfo();
  *(void *)(v4 + 240) = v8;
  *(void *)(v4 + 248) = *(void *)(v8 - 8);
  *(void *)(v4 + 256) = swift_task_alloc();
  *(void *)(v4 + 264) = swift_task_alloc();
  *(void *)(v4 + 272) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Prompt.Rendering();
  *(void *)(v4 + 280) = v9;
  *(void *)(v4 + 288) = *(void *)(v9 - 8);
  *(void *)(v4 + 296) = swift_task_alloc();
  type metadata accessor for Prompt.Rendering.Source();
  *(void *)(v4 + 304) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Rendering?);
  *(void *)(v4 + 312) = swift_task_alloc();
  uint64_t v10 = *(void *)(a4 + 48);
  long long v11 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v4 + 128) = *(_OWORD *)a4;
  long long v12 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v4 + 144) = v11;
  *(_OWORD *)(v4 + 160) = v12;
  *(void *)(v4 + 176) = v10;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v4 + 320) = v13;
  *uint64_t v13 = v4;
  v13[1] = TokenGenerator.render(prompt:promptTemplateInfo:metadata:);
  return TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:)(v4 + 16, a2, a3, v4 + 128);
}

uint64_t TokenGenerator.render(prompt:promptTemplateInfo:metadata:)()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenGenerator.render(prompt:promptTemplateInfo:metadata:);
  }
  else {
    uint64_t v2 = TokenGenerator.render(prompt:promptTemplateInfo:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(void);
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t type;
  uint64_t typea;
  os_log_type_t typeb;
  uint64_t v70;
  uint64_t v71[2];
  void *v72;
  uint64_t v73;

  uint64_t v72 = v0;
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  if (v1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Prompt.Rendering.Source.init(identifier:version:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Prompt.Rendering.init(source:segments:renderedString:originalPrompt:tokenIDs:userInfo:detokenizedString:)();
    uint64_t v3 = 0;
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v3 = 1;
    uint64_t v4 = v0[3];
  }
  unint64_t v5 = v0[39];
  unint64_t v6 = v0[35];
  uint64_t v7 = v0[36];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v3, 1, v6);
  outlined consume of PromptRenderingEnvelope?(v4, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[39], &demangling cache variable for type metadata for Prompt.Rendering?);
    uint64_t v8 = 0x26B3A3000uLL;
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v9 = v0[33];
    uint64_t v10 = v0[30];
    long long v11 = v0[31];
    long long v12 = v0[29];
    uint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v12, v10);
    uint64_t v14 = Logger.logObject.getter();
    uint64_t v15 = static os_log_type_t.error.getter();
    uint64_t v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = v0[33];
    uint64_t v18 = v0[31];
    if (v16)
    {
      uint64_t v64 = v0[30];
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      type = swift_slowAlloc();
      v71[0] = type;
      *(_DWORD *)uint64_t v19 = 136380675;
      long long v20 = PromptTemplateInfo.templateID.getter();
      v0[25] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v64);
      _os_log_impl(&dword_25F79F000, v14, v15, "Rendered prompt template: %{private}s is empty", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261201C80](type, -1, -1);
      long long v22 = v19;
      uint64_t v8 = 0x26B3A3000;
      MEMORY[0x261201C80](v22, -1, -1);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v18 + 8))(v17, v0[30]);
    }

    type metadata accessor for TokenGenerationError(0);
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
    uint64_t v46 = (void *)swift_allocError();
    *uint64_t v47 = 0xD000000000000018;
    v47[1] = 0x800000025F92DD50;
    v47[2] = 0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    if (*(void *)(v8 + 760) != -1) {
      swift_once();
    }
    uint64_t v49 = v0[31];
    uint64_t v48 = v0[32];
    uint64_t v51 = v0[29];
    unint64_t v50 = v0[30];
    __swift_project_value_buffer(v13, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v51, v50);
    MEMORY[0x261201A80](v46);
    MEMORY[0x261201A80](v46);
    uint64_t v52 = Logger.logObject.getter();
    uint64_t v53 = static os_log_type_t.error.getter();
    uint64_t v54 = os_log_type_enabled(v52, v53);
    uint64_t v56 = v0[31];
    uint64_t v55 = v0[32];
    uint64_t v57 = v0[30];
    if (v54)
    {
      typeb = v53;
      uint64_t v58 = swift_slowAlloc();
      uint64_t v66 = (void *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      v71[0] = v70;
      *(_DWORD *)uint64_t v58 = 136643075;
      unint64_t v59 = PromptTemplateInfo.templateID.getter();
      v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v60, v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
      *(_WORD *)(v58 + 12) = 2112;
      MEMORY[0x261201A80](v46);
      uint64_t v61 = _swift_stdlib_bridgeErrorToNSError();
      v0[24] = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v66 = v61;

      _os_log_impl(&dword_25F79F000, v52, typeb, "Failed to render for prompt template: %{sensitive}s. %@", (uint8_t *)v58, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v66, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v70, -1, -1);
      MEMORY[0x261201C80](v58, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v56 + 8))(v0[32], v0[30]);
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v62 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    (*(void (**)(void, void, void))(v0[36] + 32))(v0[28], v0[39], v0[35]);
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    long long v24 = v0[36];
    long long v23 = v0[37];
    uint64_t v26 = v0[34];
    long long v25 = v0[35];
    uint64_t v28 = v0[30];
    uint64_t v27 = v0[31];
    uint64_t v30 = v0[28];
    uint64_t v29 = v0[29];
    uint64_t v31 = type metadata accessor for Logger();
    __swift_project_value_buffer(v31, (uint64_t)static Log.generator);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v30, v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v29, v28);
    uint64_t v32 = Logger.logObject.getter();
    uint64_t v33 = static os_log_type_t.debug.getter();
    uint64_t v34 = os_log_type_enabled(v32, v33);
    uint64_t v36 = v0[36];
    uint64_t v35 = v0[37];
    uint64_t v37 = v0[34];
    uint64_t v38 = v0[35];
    uint64_t v40 = v0[30];
    uint64_t v39 = v0[31];
    if (v34)
    {
      uint64_t v65 = v0[30];
      uint64_t v41 = swift_slowAlloc();
      typea = swift_slowAlloc();
      v71[0] = typea;
      *(_DWORD *)uint64_t v41 = 136643075;
      uint64_t v42 = Prompt.Rendering.renderedString.getter();
      v0[26] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v38);
      *(_WORD *)(v41 + 12) = 2085;
      uint64_t v44 = PromptTemplateInfo.templateID.getter();
      v0[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v65);
      _os_log_impl(&dword_25F79F000, v32, v33, "Rendered prompt text: %{sensitive}s for prompt template identifer: %{sensitive}s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261201C80](typea, -1, -1);
      MEMORY[0x261201C80](v41, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v36 + 8))(v0[37], v0[35]);
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v40);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v62 = (uint64_t (*)(void))v0[1];
  }
  return v62();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  long long v22 = v0;
  uint64_t v1 = (void *)v0[41];
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v3 = v0[31];
  uint64_t v2 = v0[32];
  unint64_t v5 = v0[29];
  uint64_t v4 = v0[30];
  unint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  long long v11 = v0[31];
  uint64_t v10 = v0[32];
  long long v12 = v0[30];
  if (v9)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    long long v20 = swift_slowAlloc();
    long long v21 = v20;
    *(_DWORD *)uint64_t v13 = 136643075;
    uint64_t v14 = PromptTemplateInfo.templateID.getter();
    v0[23] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    *(_WORD *)(v13 + 12) = 2112;
    MEMORY[0x261201A80](v1);
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v16;

    _os_log_impl(&dword_25F79F000, v7, v8, "Failed to render for prompt template: %{sensitive}s. %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v20, -1, -1);
    MEMORY[0x261201C80](v13, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[32], v0[30]);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t static TokenGenerator.supportsHandlingSensitiveData(with:)()
{
  return 0;
}

uint64_t static TokenGenerator.isAvailable.getter()
{
  v12[1] = *MEMORY[0x263EF8340];
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v1 = domain_answer;
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    __swift_project_value_buffer(v2, (uint64_t)static Log.generator);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      unint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v5 = 67109120;
      LODWORD(v12[0]) = v1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25F79F000, v3, v4, "Failed to determine availability with status code: %d", v5, 8u);
      MEMORY[0x261201C80](v5, -1, -1);
    }
  }
  else
  {
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v12[0] = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x616C696176417369, 0xEB00000000656C62, v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v9 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x65736C6166, 0xE500000000000000, v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25F79F000, v7, v8, "%s: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v10, -1, -1);
      MEMORY[0x261201C80](v9, -1, -1);
    }
  }
  return 0;
}

uint64_t TokenGenerator.configuration.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[8];
  uint64_t v9 = v1[9];
  uint64_t v10 = v1[10];
  uint64_t v11 = v1[11];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  return outlined copy of SessionConfiguration?(v2, v3);
}

void *TokenGenerator.__allocating_init(configuration:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  uint64_t v3 = *(void *)(a1 + 8);
  v15[0] = *(void *)a1;
  uint64_t v14 = v15[0];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  v15[1] = v3;
  v15[2] = v4;
  char v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  uint64_t v19 = v9;
  uint64_t v20 = v8;
  uint64_t v21 = v11;
  uint64_t v22 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = specialized ModelManagerSession.init(configuration:)(v15);
  v2[15] = &type metadata for ModelManagerSession;
  v2[16] = &protocol witness table for ModelManagerSession;
  v2[11] = v10;
  v2[12] = v12;
  v2[2] = v14;
  v2[3] = v3;
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v7;
  v2[7] = v6;
  v2[8] = v9;
  v2[9] = v8;
  v2[10] = v11;
  type metadata accessor for EventReporter();
  swift_allocObject();
  v2[17] = EventReporter.init()();
  return v2;
}

void *TokenGenerator.init(configuration:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 8);
  v15[0] = *(void *)a1;
  uint64_t v14 = v15[0];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  v15[1] = v3;
  v15[2] = v4;
  char v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  uint64_t v19 = v9;
  uint64_t v20 = v8;
  uint64_t v21 = v11;
  uint64_t v22 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = specialized ModelManagerSession.init(configuration:)(v15);
  v2[15] = &type metadata for ModelManagerSession;
  v2[16] = &protocol witness table for ModelManagerSession;
  v2[11] = v10;
  v2[12] = v12;
  v2[2] = v14;
  v2[3] = v3;
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v7;
  v2[7] = v6;
  v2[8] = v9;
  v2[9] = v8;
  v2[10] = v11;
  type metadata accessor for EventReporter();
  swift_allocObject();
  v2[17] = EventReporter.init()();
  return v2;
}

uint64_t TokenGenerator.__allocating_init(session:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  outlined init with copy of PromptCompletionEvent(a1, v2 + 96);
  type metadata accessor for EventReporter();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  swift_allocObject();
  uint64_t v3 = EventReporter.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  *(void *)(v2 + 136) = v3;
  return v2;
}

_OWORD *TokenGenerator.init(session:)(uint64_t a1)
{
  uint64_t v2 = v1;
  outlined init with copy of PromptCompletionEvent(a1, (uint64_t)(v1 + 6));
  type metadata accessor for EventReporter();
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  v1[5] = 0u;
  swift_allocObject();
  uint64_t v4 = EventReporter.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  *((void *)v2 + 17) = v4;
  return v2;
}

uint64_t TokenGenerator.__allocating_init(session:configuration:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = *a2;
  uint64_t v6 = *((unsigned __int8 *)a2 + 24);
  long long v11 = *((_OWORD *)a2 + 3);
  long long v12 = *((_OWORD *)a2 + 2);
  uint64_t v7 = a2[8];
  uint64_t v8 = a2[9];
  outlined init with copy of PromptCompletionEvent(a1, v4 + 96);
  *(void *)(v4 + 16) = v5;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a2 + 1);
  *(void *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 48) = v12;
  *(_OWORD *)(v4 + 64) = v11;
  *(void *)(v4 + 80) = v7;
  *(void *)(v4 + 88) = v8;
  type metadata accessor for EventReporter();
  swift_allocObject();
  uint64_t v9 = EventReporter.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  *(void *)(v4 + 136) = v9;
  return v4;
}

uint64_t TokenGenerator.init(session:configuration:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *a2;
  uint64_t v7 = *((unsigned __int8 *)a2 + 24);
  long long v12 = *((_OWORD *)a2 + 3);
  long long v13 = *((_OWORD *)a2 + 2);
  uint64_t v8 = a2[8];
  uint64_t v9 = a2[9];
  outlined init with copy of PromptCompletionEvent(a1, v3 + 96);
  *(void *)(v3 + 16) = v6;
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(a2 + 1);
  *(void *)(v3 + 40) = v7;
  *(_OWORD *)(v3 + 48) = v13;
  *(_OWORD *)(v3 + 64) = v12;
  *(void *)(v3 + 80) = v8;
  *(void *)(v3 + 88) = v9;
  type metadata accessor for EventReporter();
  swift_allocObject();
  uint64_t v10 = EventReporter.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  *(void *)(v3 + 136) = v10;
  return v3;
}

uint64_t *TokenGenerator.deinit()
{
  int v1 = v0;
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.generator);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25F79F000, v3, v4, "Deinitializing and cancelling session", v5, 2u);
    MEMORY[0x261201C80](v5, -1, -1);
  }

  uint64_t v6 = v1[15];
  uint64_t v7 = v1[16];
  __swift_project_boxed_opaque_existential_1(v1 + 12, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
  outlined consume of SessionConfiguration?(v1[2], v1[3]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v1 + 12));
  swift_release();
  return v1;
}

uint64_t TokenGenerator.__deallocating_deinit()
{
  TokenGenerator.deinit();
  return swift_deallocClassInstance();
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TokenGenerator.contextSize()()
{
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  __swift_project_boxed_opaque_existential_1(v0 + 12, v2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 16))(&v5, v2, v3);
  if (!v1) {
    swift_bridgeObjectRelease();
  }
  return 2048;
}

Swift::Void __swiftcall TokenGenerator.prewarm()()
{
  uint64_t v1 = v0;
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.generator);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25F79F000, v3, v4, "Requesting prewarm", v5, 2u);
    MEMORY[0x261201C80](v5, -1, -1);
  }

  uint64_t v6 = v1[15];
  uint64_t v7 = v1[16];
  __swift_project_boxed_opaque_existential_1(v1 + 12, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
}

uint64_t TokenGenerator.countTokens(in:)(uint64_t a1)
{
  v2[25] = a1;
  v2[26] = v1;
  uint64_t v3 = type metadata accessor for Prompt();
  v2[27] = v3;
  v2[28] = *(void *)(v3 - 8);
  v2[29] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for UUID();
  v2[30] = v4;
  v2[31] = *(void *)(v4 - 8);
  v2[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](TokenGenerator.countTokens(in:), 0, 0);
}

uint64_t TokenGenerator.countTokens(in:)()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[30];
  UUID.init()();
  uint64_t v4 = UUID.uuidString.getter();
  uint64_t v6 = v5;
  v0[33] = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  unint64_t v7 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v0[34] = v7;
  v0[16] = v4;
  v0[17] = v6;
  v0[18] = 0xD000000000000010;
  v0[19] = 0x800000025F92DD70;
  v0[20] = 0;
  v0[21] = 0;
  v0[22] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[35] = (uint64_t)v8;
  *uint64_t v8 = v0;
  v8[1] = TokenGenerator.countTokens(in:);
  uint64_t v9 = v0[25];
  return TokenGenerator._countTokens(in:metadata:)((uint64_t)(v0 + 2), v9, v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = TokenGenerator.countTokens(in:);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = TokenGenerator.countTokens(in:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = v0[2];
  outlined consume of PromptRenderingEnvelope?(v0[3], v0[4]);
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[29];
  uint64_t v5 = v0[27];
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v2, v5);
  unint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = v0[28];
  uint64_t v10 = v0[29];
  long long v12 = v0[27];
  if (v9)
  {
    long long v13 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)long long v13 = 134218243;
    v0[23] = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2085;
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[24] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl(&dword_25F79F000, v7, v8, "Counted %ld tokens in prompt: %{sensitive}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v18, -1, -1);
    MEMORY[0x261201C80](v13, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[29], v0[27]);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  char v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TokenGenerator._countTokens(in:metadata:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 56) = type metadata accessor for OneShotRequest(0);
  *(void *)(v4 + 64) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for UUID();
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = *(void *)(v6 - 8);
  *(void *)(v4 + 88) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Prompt();
  *(void *)(v4 + 96) = v7;
  *(void *)(v4 + 104) = *(void *)(v7 - 8);
  *(void *)(v4 + 112) = swift_task_alloc();
  *(void *)(v4 + 120) = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *a3;
  *(void *)(v4 + 128) = v8;
  *(void *)(v4 + 136) = v9;
  *(_OWORD *)(v4 + 144) = *(_OWORD *)(a3 + 1);
  *(void *)(v4 + 160) = a3[3];
  *(_OWORD *)(v4 + 168) = *((_OWORD *)a3 + 2);
  *(void *)(v4 + 184) = a3[6];
  return MEMORY[0x270FA2498](TokenGenerator._countTokens(in:metadata:), 0, 0);
}

uint64_t TokenGenerator._countTokens(in:metadata:)()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 192) = v7;
  *(void *)(v0 + 200) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v3, v6, v5);
  v7(v2, v3, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = specialized PromptEnvelope.init(sealing:)(v2);
  uint64_t v10 = v9;
  uint64_t v35 = v11;
  uint64_t v13 = v12;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(void *)(v0 + 208) = v14;
  *(void *)(v0 + 216) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v3, v5);
  if (v1)
  {
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 80);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 72);
    UUID.init()();
    uint64_t v16 = UUID.uuidString.getter();
    uint64_t v1 = v20;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    uint64_t v15 = *(void *)(v0 + 168);
  }
  *(void *)(v0 + 224) = v1;
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 184);
  uint64_t v24 = *(void *)(v0 + 152);
  uint64_t v23 = *(void *)(v0 + 160);
  long long v25 = *(_OWORD *)(v0 + 136);
  uint64_t v26 = *(void *)(v0 + 64);
  uint64_t v27 = *(void *)(v0 + 48);
  *(void *)uint64_t v26 = v8;
  *(void *)(v26 + 8) = v10;
  *(void *)(v26 + 16) = v35;
  *(void *)(v26 + 24) = v13;
  *(_OWORD *)(v26 + 32) = v25;
  *(void *)(v26 + 48) = v24;
  *(void *)(v26 + 56) = v23;
  *(void *)(v26 + 64) = v15;
  *(void *)(v26 + 72) = v22;
  *(void *)(v26 + 80) = v21;
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = *(void *)(v27 + 120);
  __swift_project_boxed_opaque_existential_1((void *)(v27 + 96), v28);
  swift_bridgeObjectRetain();
  uint64_t v29 = specialized Set.init<A>(_:)((uint64_t)&outlined read-only object #0 of TokenGenerator._countTokens(in:metadata:));
  *(void *)(v0 + 232) = v29;
  swift_arrayDestroy();
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v30;
  lazy protocol witness table accessor for type CountTokensResponse and conformance CountTokensResponse();
  lazy protocol witness table accessor for type CountTokensResponse and conformance CountTokensResponse();
  void *v30 = v0;
  v30[1] = TokenGenerator._countTokens(in:metadata:);
  uint64_t v31 = *(void *)(v0 + 64);
  uint64_t v32 = *(void *)(v0 + 32);
  return InferenceSessionProtocol.request<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)(v32, v16, v1, v31, v29, (uint64_t)&type metadata for CountTokensResponse, v28, (uint64_t)&type metadata for CountTokensResponse);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = TokenGenerator._countTokens(in:metadata:);
  }
  else {
    uint64_t v2 = TokenGenerator._countTokens(in:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of CompletePromptRequest(*(void *)(v0 + 64), type metadata accessor for OneShotRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void *v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  void *v20;
  NSObject *log;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  uint64_t v24 = v0;
  outlined destroy of CompletePromptRequest(v0[8], type metadata accessor for OneShotRequest);
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v1 = v0[31];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[24];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[5];
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.generator);
  v2(v3, v5, v4);
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[31];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[26];
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[12];
  if (v9)
  {
    log = v7;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v14 = 136643075;
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type Prompt and conformance Prompt, MEMORY[0x263F7FB90]);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v11(v12, v13);
    *(_WORD *)(v14 + 12) = 2112;
    MEMORY[0x261201A80](v10);
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v20 = v17;

    _os_log_impl(&dword_25F79F000, log, v8, "Failed to count tokens in prompt: %{sensitive}s. %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v22, -1, -1);
    MEMORY[0x261201C80](v14, -1, -1);
  }
  else
  {
    v11(v0[14], v0[12]);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = v4;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 48) = type metadata accessor for OneShotRequest(0);
  *(void *)(v5 + 56) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for PromptTemplateInfo();
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 72) = *(void *)(v7 - 8);
  *(void *)(v5 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt?);
  *(void *)(v5 + 88) = swift_task_alloc();
  type metadata accessor for CountTokensPromptTemplateRequest(0);
  *(void *)(v5 + 96) = swift_task_alloc();
  uint64_t v8 = type metadata accessor for UUID();
  *(void *)(v5 + 104) = v8;
  *(void *)(v5 + 112) = *(void *)(v8 - 8);
  *(void *)(v5 + 120) = swift_task_alloc();
  long long v9 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v5 + 128) = *(_OWORD *)a4;
  *(_OWORD *)(v5 + 144) = v9;
  *(_OWORD *)(v5 + 160) = *(_OWORD *)(a4 + 32);
  *(void *)(v5 + 176) = *(void *)(a4 + 48);
  return MEMORY[0x270FA2498](TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:), 0, 0);
}

uint64_t TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:)()
{
  uint64_t v38 = v0;
  uint64_t v1 = v0[17];
  if (v1)
  {
    uint64_t v3 = v0[21];
    unint64_t v2 = v0[22];
    uint64_t v4 = v0[18];
    uint64_t v5 = v0[19];
    uint64_t v33 = v0[16];
    uint64_t v34 = v33;
    uint64_t v43 = v0[17];
    uint64_t v32 = v4;
    uint64_t v35 = v0[20];
    unint64_t v36 = v2;
  }
  else
  {
    uint64_t v7 = v0[14];
    uint64_t v6 = v0[15];
    uint64_t v8 = v0[13];
    UUID.init()();
    uint64_t v33 = UUID.uuidString.getter();
    uint64_t v43 = v9;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v3 = 0;
    unint64_t v36 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    uint64_t v35 = 0;
    uint64_t v1 = v0[17];
    uint64_t v5 = 0x800000025F92E050;
    uint64_t v34 = v0[16];
    uint64_t v32 = 0xD000000000000031;
  }
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[12];
  uint64_t v12 = v0[9];
  uint64_t v13 = (char *)v0[10];
  uint64_t v14 = v0[8];
  uint64_t v15 = v0[4];
  outlined init with copy of Prompt.Rendering?(v0[3], v10, &demangling cache variable for type metadata for Prompt?);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v13, v15, v14);
  v37[0] = v33;
  v37[1] = v43;
  v37[2] = v32;
  v37[3] = v5;
  uint64_t v16 = v35;
  v37[4] = v35;
  v37[5] = v3;
  v37[6] = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of RequestMetadata?(v34, v1);
  CountTokensPromptTemplateRequest.init(prompt:promptTemplateInfo:metadata:)(v10, v13, v37, v11);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = v0[14];
    uint64_t v17 = v0[15];
    uint64_t v19 = v0[13];
    UUID.init()();
    uint64_t v16 = UUID.uuidString.getter();
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    uint64_t v3 = v21;
  }
  v0[23] = v3;
  uint64_t v22 = (void *)v0[5];
  outlined init with copy of AnyTooling(v0[12], v0[7], type metadata accessor for CountTokensPromptTemplateRequest);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = v22[15];
  uint64_t v24 = v22[16];
  __swift_project_boxed_opaque_existential_1(v22 + 12, v23);
  uint64_t v25 = specialized Set.init<A>(_:)((uint64_t)&outlined read-only object #0 of TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:));
  v0[24] = v25;
  swift_arrayDestroy();
  uint64_t v26 = (void *)swift_task_alloc();
  v0[25] = v26;
  unint64_t v27 = lazy protocol witness table accessor for type CountTokensResponse and conformance CountTokensResponse();
  unint64_t v28 = lazy protocol witness table accessor for type CountTokensResponse and conformance CountTokensResponse();
  void *v26 = v0;
  v26[1] = TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:);
  uint64_t v29 = v0[7];
  uint64_t v30 = v0[2];
  unint64_t v41 = v27;
  unint64_t v42 = v28;
  uint64_t v40 = v24;
  return InferenceSessionProtocol.request<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)(v30, v16, v3, v29, v25, (uint64_t)&type metadata for CountTokensResponse, v23, (uint64_t)&type metadata for CountTokensResponse);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0) {
    unint64_t v2 = TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:);
  }
  else {
    unint64_t v2 = TokenGenerator._countTokens(prompt:promptTemplateInfo:metadata:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[12];
  outlined destroy of CompletePromptRequest(v0[7], type metadata accessor for OneShotRequest);
  outlined destroy of CompletePromptRequest(v1, type metadata accessor for CountTokensPromptTemplateRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[12];
  outlined destroy of CompletePromptRequest(v0[7], type metadata accessor for OneShotRequest);
  outlined destroy of CompletePromptRequest(v1, type metadata accessor for CountTokensPromptTemplateRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

Swift::Int TokenGenerator.overestimatedTokenCount(for:)()
{
  return Prompt.overestimatedTokenCount()();
}

uint64_t TokenGenerator.register(documents:)(uint64_t a1)
{
  uint64_t v212 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v1 - 8);
  v199 = (char *)&v182 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = type metadata accessor for XPCCodableObject();
  uint64_t v194 = *(void *)(v195 - 8);
  MEMORY[0x270FA5388](v195);
  v192 = (char *)&v182 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>);
  MEMORY[0x270FA5388](v196);
  uint64_t v193 = (uint64_t)&v182 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<RegisterDocumentResponseElement, Error>, DocumentRegistration>);
  uint64_t v202 = *(void *)(v203 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v203);
  v198 = (char *)&v182 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = v6;
  MEMORY[0x270FA5388](v5);
  v204 = (char *)&v182 - v7;
  uint64_t v190 = type metadata accessor for StreamingRequest(0);
  MEMORY[0x270FA5388](v190);
  v201 = (_OWORD *)((char *)&v182 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v230 = type metadata accessor for URL();
  v247 = *(void (***)(char *, uint64_t))(v230 - 8);
  MEMORY[0x270FA5388](v230);
  v229 = (char *)&v182 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
  v236 = *(void (**)(uint64_t, uint64_t))(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v237 = (char *)&v182 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v242 = (uint64_t)&v182 - v14;
  MEMORY[0x270FA5388](v13);
  v245 = (void (*)(char *, char *, uint64_t))((char *)&v182 - v15);
  uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>.Continuation.BufferingPolicy);
  v246 = *(void (***)(uint64_t, uint64_t))(v227 - 8);
  MEMORY[0x270FA5388](v227);
  v226 = (char *)&v182 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>.Continuation);
  uint64_t v215 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v214 = (char *)&v182 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v225 = (char *)&v182 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v208 = (char *)&v182 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  v224 = (char *)&v182 - v25;
  uint64_t v26 = type metadata accessor for DocumentResource();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v200 = (char *)&v182 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v223 = (char *)&v182 - v30;
  uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: DocumentResource));
  uint64_t v31 = *(void *)(v235 - 8);
  MEMORY[0x270FA5388](v235);
  v210 = (char *)&v182 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: DocumentResource)?);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  v234 = (unint64_t *)((char *)&v182 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v34);
  v233 = (uint64_t *)((char *)&v182 - v36);
  uint64_t v37 = type metadata accessor for UUID();
  uint64_t v38 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)&v182 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v183 = UUID.uuidString.getter();
  v185 = v41;
  unint64_t v42 = *(void (**)(char *, uint64_t))(v38 + 8);
  v187 = v40;
  uint64_t v189 = v37;
  uint64_t v188 = v38 + 8;
  v186 = v42;
  v42(v40, v37);
  unint64_t v43 = MEMORY[0x263F8EE78];
  v184 = (void *)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v44 = *(void (**)(void, void, void))(v212 + 16);
  v239 = (void (**)(uint64_t, char *, uint64_t))(v27 + 16);
  v240 = (void (**)(char *, char *, uint64_t))(v27 + 32);
  v232 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v231 = (unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v31 + 48);
  unsigned int v222 = *MEMORY[0x263F8F680];
  v221 = (void (**)(char *, void, uint64_t))(v246 + 13);
  v220 = (void (**)(char *, uint64_t))(v246 + 1);
  v243 = (void (**)(char *, char *, uint64_t))(v215 + 32);
  v228 = v247 + 1;
  v246 = (void (**)(uint64_t, uint64_t))(v215 + 8);
  uint64_t v209 = v22;
  v241 = (void (**)(uint64_t, uint64_t))(v22 + 8);
  uint64_t v45 = (void (**)(void))(v22 + 32);
  uint64_t v211 = v27;
  v218 = (void (**)(char *, uint64_t))(v27 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v47 = 0;
  rawValue = (void (**)(char *, uint64_t))MEMORY[0x263F8EE80];
  unint64_t v207 = 0x800000025F92DDE0;
  unint64_t v213 = 0x800000025F92DDB0;
  v205 = (void *)MEMORY[0x263F8EE80];
  v206 = (void *)v43;
  uint64_t v249 = v17;
  uint64_t v250 = v10;
  v238 = v45;
  v219 = v44;
  uint64_t v248 = v21;
  uint64_t v217 = v26;
  BOOL v49 = v44 == 0;
  if (v44) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v50 = 1;
  uint64_t v51 = (void (**)(char *, uint64_t))v44;
  uint64_t v52 = v235;
  uint64_t v53 = (uint64_t)v234;
  while (1)
  {
    v247 = rawValue;
    (*v232)(v53, v50, 1, v52);
    uint64_t v58 = v233;
    outlined init with take of Locale?(v53, (uint64_t)v233, &demangling cache variable for type metadata for (offset: Int, element: DocumentResource)?);
    if ((*v231)(v58, 1, v52) == 1) {
      break;
    }
    unint64_t v244 = (unint64_t)v51;
    uint64_t v59 = *v58;
    uint64_t v60 = (char *)v58 + *(int *)(v52 + 48);
    uint64_t v61 = *v240;
    uint64_t v62 = v223;
    (*v240)(v223, v60, v26);
    type metadata accessor for DocumentRegistration();
    uint64_t v63 = v226;
    uint64_t v64 = v227;
    (*v221)(v226, v222, v227);
    uint64_t v65 = v225;
    static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)();
    (*v220)(v63, v64);
    uint64_t v66 = (char *)v245 + *(int *)(v250 + 48);
    (*v45)();
    (*v243)(v66, v65, v249);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v43 + 16) + 1, 1, v43);
    }
    unint64_t v68 = *(void *)(v43 + 16);
    unint64_t v67 = *(void *)(v43 + 24);
    v216 = v61;
    if (v68 >= v67 >> 1) {
      unint64_t v43 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v67 > 1, v68 + 1, 1, v43);
    }
    *(void *)(v43 + 16) = v68 + 1;
    unint64_t v69 = v43 + ((*((unsigned __int8 *)v236 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v236 + 80));
    uint64_t v70 = *((void *)v236 + 9);
    outlined init with take of Locale?((uint64_t)v245, v69 + v70 * v68, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
    uint64_t v71 = v229;
    DocumentResource.url.getter();
    uint64_t v72 = URL.absoluteString.getter();
    uint64_t v74 = v73;
    long long v75 = *v228;
    (*v228)(v71, v230);
    long long v76 = v247;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v252._documents._rawValue = v76;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v59, v72, v74, isUniquelyReferenced_nonNull_native);
    rawValue = (void (**)(char *, uint64_t))v252._documents._rawValue;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = DocumentResource.fileDescriptor.getter();
    if ((result & 0x80000000) != 0)
    {
      uint64_t v89 = *(void *)(v43 + 16);
      if (!v89) {
        goto LABEL_48;
      }
      uint64_t v90 = v242;
      outlined init with copy of Prompt.Rendering?(v69 + (v89 - 1) * v70, v242, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      uint64_t v91 = v90 + *(int *)(v250 + 48);
      type metadata accessor for TokenGenerationError(0);
      lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
      uint64_t v92 = (void *)swift_allocError();
      uint64_t v94 = v93;
      uint64_t v95 = (void *)(v93
                     + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                              + 48));
      uint64_t v26 = v217;
      (*v239)(v94, v62, v217);
      unint64_t v96 = v207;
      *uint64_t v95 = 0xD00000000000001ALL;
      v95[1] = v96;
      v95[2] = 0;
      swift_storeEnumTagMultiPayload();
      v252._documents._rawValue = v92;
      uint64_t v97 = v249;
      AsyncThrowingStream.Continuation.finish(throwing:)();
      (*v218)(v62, v26);
      (*v246)(v91, v97);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*v241)(v90, v248);
LABEL_16:
      uint64_t v45 = v238;
      goto LABEL_17;
    }
    int v78 = DocumentResource.fileDescriptor.getter();
    uint64_t result = (uint64_t)xpc_fd_create(v78);
    if (!result)
    {
      uint64_t v79 = *(void *)(v43 + 16);
      if (!v79)
      {
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        return result;
      }
      uint64_t v80 = v242;
      outlined init with copy of Prompt.Rendering?(v69 + (v79 - 1) * v70, v242, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      uint64_t v81 = v80 + *(int *)(v250 + 48);
      type metadata accessor for TokenGenerationError(0);
      lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
      uint64_t v82 = (void *)swift_allocError();
      uint64_t v84 = v83;
      uint64_t v85 = (void *)(v83
                     + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                              + 48));
      uint64_t v26 = v217;
      (*v239)(v84, v62, v217);
      unint64_t v86 = v213;
      *uint64_t v85 = 0xD000000000000025;
      v85[1] = v86;
      v85[2] = 0;
      swift_storeEnumTagMultiPayload();
      v252._documents._rawValue = v82;
      uint64_t v87 = v249;
      AsyncThrowingStream.Continuation.finish(throwing:)();
      (*v246)(v81, v87);
      (*v241)(v80, v248);
      int v88 = DocumentResource.fileDescriptor.getter();
      close(v88);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v218)(v62, v26);
      goto LABEL_16;
    }
    uint64_t v98 = result;
    uint64_t v99 = v229;
    DocumentResource.url.getter();
    Swift::String v100 = URL.path(percentEncoded:)(1);
    v75(v99, v230);
    swift_unknownObjectRetain();
    v101 = v205;
    char v102 = swift_isUniquelyReferenced_nonNull_native();
    v252._documents._rawValue = v101;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v98, v100._countAndFlagsBits, (uint64_t)v100._object, v102);
    v205 = v252._documents._rawValue;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    DocumentResource.url.getter();
    DocumentResource.fileDescriptor.getter();
    DocumentResource.metadata.getter();
    DocumentResource.init(_:_:_:)();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v206 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v206[2] + 1, 1, (unint64_t)v206);
    }
    uint64_t v26 = v217;
    long long v103 = v216;
    unint64_t v105 = v206[2];
    unint64_t v104 = v206[3];
    if (v105 >= v104 >> 1) {
      v206 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v104 > 1, v105 + 1, 1, (unint64_t)v206);
    }
    uint64_t v45 = v238;
    unint64_t v106 = (unint64_t)v206;
    v206[2] = v105 + 1;
    uint64_t v107 = v211;
    v103((char *)(v106+ ((*(unsigned __int8 *)(v107 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80))+ *(void *)(v211 + 72) * v105), v200, v26);
    swift_unknownObjectRelease();
    int v108 = DocumentResource.fileDescriptor.getter();
    close(v108);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v107 + 8))(v62, v26);
LABEL_17:
    uint64_t v44 = v219;
    unint64_t v47 = v244;
    BOOL v49 = v244 >= (unint64_t)v219;
    if ((void (*)(void, void, void))v244 == v219) {
      goto LABEL_2;
    }
LABEL_3:
    if (v49) {
      goto LABEL_47;
    }
    v247 = (void (**)(char *, uint64_t))(v47 + 1);
    unint64_t v54 = v47;
    uint64_t v55 = v211;
    uint64_t v52 = v235;
    uint64_t v56 = &v210[*(int *)(v235 + 48)];
    (*(void (**)(char *, unint64_t, uint64_t))(v211 + 16))(v56, v212+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v47, v26);
    uint64_t v53 = (uint64_t)v234;
    uint64_t v57 = (char *)v234 + *(int *)(v52 + 48);
    unint64_t *v234 = v54;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v57, v56, v26);
    uint64_t v50 = 0;
    uint64_t v51 = v247;
  }
  swift_bridgeObjectRelease();
  empty = (unint64_t *)xpc_dictionary_create_empty();
  MEMORY[0x270FA5388](empty);
  uint64_t v110 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v110, (void (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in TokenGenerator.register(documents:));
  swift_bridgeObjectRelease();
  metadata.invocationIdentifier._countAndFlagsBits = v183;
  metadata.invocationIdentifier._object = v185;
  metadata.functionIdentifier._countAndFlagsBits = 0xD000000000000014;
  metadata.functionIdentifier._object = (void *)0x800000025F92DD90;
  metadata.clientRequestIdentifier.value._countAndFlagsBits = 0;
  metadata.clientRequestIdentifier.value._object = 0;
  metadata.userInfo._rawValue = v184;
  v111._rawValue = v206;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  RegisterDocumentRequest.init(documents:metadata:)(&v252, v111, &metadata);
  long long v112 = *(_OWORD *)&v252._metadata.invocationIdentifier._object;
  object = v252._metadata.functionIdentifier._object;
  unint64_t v114 = v252._metadata.userInfo._rawValue;
  Swift::String_optional clientRequestIdentifier = v252._metadata.clientRequestIdentifier;
  uint64_t v116 = v201;
  _OWORD *v201 = *(_OWORD *)&v252._documents._rawValue;
  v116[1] = v112;
  *((void *)v116 + 4) = object;
  *(Swift::String_optional *)((char *)v116 + 40) = clientRequestIdentifier;
  *((void *)v116 + 7) = v114;
  swift_storeEnumTagMultiPayload();
  unint64_t v117 = v187;
  UUID.init()();
  v245 = (void (*)(char *, char *, uint64_t))UUID.uuidString.getter();
  uint64_t v119 = v118;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v186(v117, v189);
  uint64_t v235 = v43;
  uint64_t v120 = v191[15];
  uint64_t v121 = v191[16];
  __swift_project_boxed_opaque_existential_1(v191 + 12, v120);
  swift_unknownObjectRetain();
  uint64_t v122 = (uint64_t)v192;
  v234 = empty;
  XPCCodableObject.init(copying:)();
  uint64_t v123 = specialized Set.init<A>(_:)(MEMORY[0x263F8EE78]);
  uint64_t v124 = type metadata accessor for RegisterDocumentResponseElement(0);
  uint64_t v125 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type RegisterDocumentResponseElement and conformance RegisterDocumentResponseElement, (void (*)(uint64_t))type metadata accessor for RegisterDocumentResponseElement);
  uint64_t v126 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type RegisterDocumentResponseElement and conformance RegisterDocumentResponseElement, (void (*)(uint64_t))type metadata accessor for RegisterDocumentResponseElement);
  uint64_t v127 = v235;
  InferenceSessionProtocol.streamingRequest<A>(loggingIdentifier:payload:xpcCodableObject:requiredAssets:expectedResponse:)((uint64_t)v245, v119, v122, v123, v120, v124, v193, v121, v125, v126);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v122, v195);
  type metadata accessor for DocumentRegistration();
  lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<RegisterDocumentResponseElement, Error> and conformance AsyncThrowingStream<A, B>, &demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>);
  AsyncMapSequence.init(_:transform:)();
  int64_t v128 = *(void *)(v127 + 16);
  if (v128)
  {
    v252._documents._rawValue = (void *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v128, 0);
    uint64_t v129 = v127 + ((*((unsigned __int8 *)v236 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v236 + 80));
    unint64_t v244 = *((void *)v236 + 9);
    v240 = (void (**)(char *, char *, uint64_t))(v209 + 16);
    v239 = (void (**)(uint64_t, char *, uint64_t))(v215 + 16);
    uint64_t v131 = v248;
    uint64_t v130 = v249;
    int v132 = v214;
    uint64_t v133 = v243;
    uint64_t v134 = v242;
    do
    {
      outlined init with copy of Prompt.Rendering?(v129, v134, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      uint64_t v135 = *(int *)(v250 + 48);
      v136 = v237;
      v137 = &v237[v135];
      v138 = (char *)(v134 + v135);
      (*v240)(v237, (char *)v134, v131);
      (*v239)((uint64_t)v137, v138, v130);
      v245 = *v133;
      v245(v132, v137, v130);
      (*v241)((uint64_t)v136, v131);
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v134, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      uint64_t v139 = (char *)v252._documents._rawValue;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v139 + 2) + 1, 1);
        uint64_t v139 = (char *)v252._documents._rawValue;
      }
      unint64_t v141 = *((void *)v139 + 2);
      unint64_t v140 = *((void *)v139 + 3);
      int v132 = v214;
      if (v141 >= v140 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v140 > 1, v141 + 1, 1);
        uint64_t v139 = (char *)v252._documents._rawValue;
      }
      *((void *)v139 + 2) = v141 + 1;
      uint64_t v130 = v249;
      uint64_t v133 = v243;
      v245(&v139[((*(unsigned __int8 *)(v215 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v215 + 80))+ *(void *)(v215 + 72) * v141], v132, v249);
      v129 += v244;
      --v128;
    }
    while (v128);
    uint64_t v142 = v235;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v139 = (char *)MEMORY[0x263F8EE78];
    uint64_t v142 = v127;
  }
  uint64_t v143 = type metadata accessor for TaskPriority();
  uint64_t v144 = (uint64_t)v199;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v143 - 8) + 56))(v199, 1, 1, v143);
  uint64_t v145 = v202;
  unint64_t v146 = v198;
  uint64_t v147 = v203;
  (*(void (**)(char *, char *, uint64_t))(v202 + 16))(v198, v204, v203);
  unint64_t v148 = (*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80);
  unint64_t v149 = (v197 + v148 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v150 = swift_allocObject();
  *(void *)(v150 + 16) = 0;
  *(void *)(v150 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v145 + 32))(v150 + v148, v146, v147);
  *(void *)(v150 + v149) = v247;
  *(void *)(v150 + ((v149 + 15) & 0xFFFFFFFFFFFFFFF8)) = v139;
  uint64_t v151 = _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(v144, (uint64_t)&async function pointer to partial apply for closure #3 in TokenGenerator.register(documents:), v150);
  uint64_t v152 = *(void *)(v142 + 16);
  if (!v152) {
    goto LABEL_44;
  }
  uint64_t v153 = v142 + ((*((unsigned __int8 *)v236 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v236 + 80));
  v240 = (void (**)(char *, char *, uint64_t))*((void *)v236 + 9);
  unint64_t v244 = *(void *)(v209 + 16);
  v245 = (void (*)(char *, char *, uint64_t))(v209 + 16);
  v243 = (void (**)(char *, char *, uint64_t))(v215 + 16);
  swift_bridgeObjectRetain();
  v233 = (uint64_t *)v153;
  uint64_t v155 = v248;
  uint64_t v154 = v249;
  uint64_t v156 = v242;
  uint64_t v157 = v241;
  v239 = (void (**)(uint64_t, char *, uint64_t))v151;
  do
  {
    uint64_t v158 = *(int *)(v250 + 48);
    uint64_t v159 = (char *)(v156 + v158);
    uint64_t v160 = (char *)(v153 + v158);
    ((void (*)(uint64_t, uint64_t, uint64_t))v244)(v156, v153, v155);
    uint64_t v161 = *v243;
    (*v243)(v159, v160, v154);
    swift_retain();
    AsyncThrowingStream.Continuation.onTermination.setter();
    v162 = *v246;
    (*v246)((uint64_t)v159, v154);
    (*v157)(v156, v155);
    v153 += (uint64_t)v240;
    --v152;
  }
  while (v152);
  v236 = v162;
  v241 = (void (**)(uint64_t, uint64_t))v161;
  uint64_t v163 = v235;
  swift_bridgeObjectRelease();
  int64_t v164 = *(void *)(v163 + 16);
  if (v164)
  {
    v252._documents._rawValue = (void *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v164, 0);
    uint64_t v165 = v242;
    uint64_t v166 = v248;
    v167 = v208;
    v168 = v238;
    uint64_t v169 = (uint64_t)v233;
    do
    {
      outlined init with copy of Prompt.Rendering?(v169, v165, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      uint64_t v170 = *(int *)(v250 + 48);
      v171 = v237;
      v172 = &v237[v170];
      uint64_t v173 = v165 + v170;
      ((void (*)(char *, uint64_t, uint64_t))v244)(v237, v165, v166);
      uint64_t v174 = v173;
      uint64_t v175 = v249;
      ((void (*)(char *, uint64_t, uint64_t))v241)(v172, v174, v249);
      v176 = *v168;
      ((void (*)(char *, char *, uint64_t))v176)(v167, v171, v166);
      v236((uint64_t)v172, v175);
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v165, &demangling cache variable for type metadata for (stream: AsyncThrowingStream<DocumentRegistration, Error>, continuation: AsyncThrowingStream<DocumentRegistration, Error>.Continuation));
      v177 = v252._documents._rawValue;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v177[2] + 1, 1);
        v177 = v252._documents._rawValue;
      }
      unint64_t v179 = v177[2];
      unint64_t v178 = v177[3];
      v167 = v208;
      if (v179 >= v178 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v178 > 1, v179 + 1, 1);
        v167 = v208;
        v177 = v252._documents._rawValue;
      }
      v177[2] = v179 + 1;
      unint64_t v180 = (unint64_t)v177
           + ((*(unsigned __int8 *)(v209 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v209 + 80))
           + *(void *)(v209 + 72) * v179;
      v181 = v238;
      ((void (*)(unint64_t, char *, uint64_t))v176)(v180, v167, v166);
      v168 = v181;
      v169 += (uint64_t)v240;
      --v164;
    }
    while (v164);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
LABEL_44:
    swift_unknownObjectRelease();
    swift_release();
    v177 = (void *)MEMORY[0x263F8EE78];
  }
  (*(void (**)(char *, uint64_t))(v202 + 8))(v204, v203);
  outlined destroy of CompletePromptRequest((uint64_t)v201, type metadata accessor for StreamingRequest);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)v177;
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed RegisterDocumentResponseElement) -> (@out DocumentRegistration)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DocumentResourceIdentifier();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DocumentRegistration.Progress();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = swift_task_alloc();
  type metadata accessor for DocumentRegistrationStatusEnvelope(0);
  uint64_t v10 = swift_task_alloc();
  outlined init with copy of AnyTooling(a2, v10, type metadata accessor for DocumentRegistrationStatusEnvelope);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v6, v10, v4);
      type metadata accessor for DocumentRegistrationEnvelope(0);
      static DocumentRegistration.finished(identifier:url:)();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
    }
    else
    {
      type metadata accessor for DocumentRegistrationEnvelope(0);
      static DocumentRegistration.error(description:url:)();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    DocumentRegistration.Progress.init(progress:bytes:totalBytes:)();
    type metadata accessor for DocumentRegistrationEnvelope(0);
    static DocumentRegistration.registering(progress:url:)();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v2 + 8);
  return thunk for @escaping @callee_guaranteed (@in_guaranteed CompletePromptResponseElement) -> (@out PromptCompletionEvent)specialized (v12);
}

uint64_t closure #3 in TokenGenerator.register(documents:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>.Continuation.YieldResult);
  v6[13] = v7;
  v6[14] = *(void *)(v7 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = type metadata accessor for TokenGenerationError(0);
  v6[17] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DocumentRegistration.InternalStatus();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>.Continuation);
  v6[21] = v9;
  v6[22] = *(void *)(v9 - 8);
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  v6[25] = v10;
  v6[26] = *(void *)(v10 - 8);
  v6[27] = swift_task_alloc();
  v6[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RegisterDocumentResponseElement?);
  v6[29] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for RegisterDocumentResponseElement(0);
  v6[30] = v11;
  v6[31] = *(void *)(v11 - 8);
  v6[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DocumentRegistration?);
  v6[33] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for DocumentRegistration();
  v6[34] = v12;
  v6[35] = *(void *)(v12 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>);
  v6[39] = swift_task_alloc();
  v6[40] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator);
  v6[41] = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<RegisterDocumentResponseElement, Error>, DocumentRegistration>.Iterator);
  v6[42] = v13;
  v6[43] = *(void *)(v13 - 8);
  v6[44] = swift_task_alloc();
  v6[45] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #3 in TokenGenerator.register(documents:), 0, 0);
}

uint64_t closure #3 in TokenGenerator.register(documents:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<RegisterDocumentResponseElement, Error>, DocumentRegistration>);
  MEMORY[0x261201120]();
  lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<RegisterDocumentResponseElement, Error> and conformance AsyncThrowingStream<A, B>, &demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  AsyncMapSequence.Iterator.transform.getter();
  AsyncMapSequence.Iterator.init(_:transform:)();
  *(_DWORD *)(v0 + 408) = *MEMORY[0x263F41568];
  *(_DWORD *)(v0 + 412) = *MEMORY[0x263F41578];
  *(_DWORD *)(v0 + 416) = *MEMORY[0x263F41570];
  *(void *)(v0 + 368) = AsyncMapSequence.Iterator.baseIterator.modify();
  uint64_t v1 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator and conformance AsyncThrowingStream<A, B>.Iterator, &demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v2;
  *uint64_t v2 = v0;
  v2[1] = closure #3 in TokenGenerator.register(documents:);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 232);
  return MEMORY[0x270FA1E80](v4, v3, v1);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = closure #3 in TokenGenerator.register(documents:);
  }
  else
  {
    (*(void (**)(void))(v2 + 368))();
    uint64_t v3 = closure #3 in TokenGenerator.register(documents:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(void);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, unint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  uint64_t v1 = *(void *)(v0 + 232);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 248) + 48))(v1, 1, *(void *)(v0 + 240)) == 1)
  {
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v1, &demangling cache variable for type metadata for RegisterDocumentResponseElement?);
    uint64_t v2 = *(void *)(v0 + 272);
    uint64_t v3 = *(void *)(v0 + 280);
    uint64_t v4 = *(void *)(v0 + 264);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v4, 1, 1, v2);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      uint64_t v5 = *(void *)(v0 + 264);
      (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v5, &demangling cache variable for type metadata for DocumentRegistration?);
LABEL_19:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
      return v59();
    }
    (*(void (**)(void, void, void))(*(void *)(v0 + 280) + 32))(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
    if ((static Task<>.isCancelled.getter() & 1) == 0)
    {
      uint64_t v16 = *(void *)(v0 + 224);
      uint64_t v17 = *(void *)(v0 + 200);
      uint64_t v18 = *(void *)(v0 + 208);
      uint64_t v19 = *(void *)(v0 + 88);
      DocumentRegistration.url.getter();
      uint64_t v20 = URL.absoluteString.getter();
      uint64_t v22 = v21;
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
      if (*(void *)(v19 + 16))
      {
        uint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v22);
        if (v24)
        {
          uint64_t v25 = *(void *)(*(void *)(*(void *)(v0 + 88) + 56) + 8 * v23);
          uint64_t v26 = swift_bridgeObjectRelease();
          if ((v25 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else
          {
            uint64_t v29 = *(void *)(v0 + 96);
            if (v25 < *(void *)(v29 + 16))
            {
              uint64_t v30 = *(_DWORD *)(v0 + 408);
              uint64_t v32 = *(void *)(v0 + 152);
              uint64_t v31 = *(void *)(v0 + 160);
              uint64_t v33 = *(void *)(v0 + 144);
              (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 176) + 16))(*(void *)(v0 + 192), v29+ ((*(unsigned __int8 *)(*(void *)(v0 + 176) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 176) + 80))+ *(void *)(*(void *)(v0 + 176) + 72) * v25, *(void *)(v0 + 168));
              DocumentRegistration.internalStatus.getter();
              uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 88))(v31, v33);
              if (v34 == v30)
              {
                uint64_t v35 = *(void *)(v0 + 288);
                uint64_t v36 = *(void *)(v0 + 296);
                uint64_t v37 = *(void *)(v0 + 272);
                uint64_t v38 = *(void *)(v0 + 280);
                uint64_t v39 = *(void *)(v0 + 192);
                unint64_t v41 = *(void *)(v0 + 168);
                uint64_t v40 = *(void *)(v0 + 176);
                unint64_t v43 = *(void *)(v0 + 112);
                unint64_t v42 = *(void *)(v0 + 120);
                uint64_t v90 = *(void *)(v0 + 104);
                uint64_t v94 = *(void *)(v0 + 160);
                (*(void (**)(void))(*(void *)(v0 + 152) + 96))();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v35, v36, v37);
                AsyncThrowingStream.Continuation.yield(_:)();
                (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v90);
                (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
                (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
                uint64_t v44 = type metadata accessor for DocumentRegistration.Progress();
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8))(v94, v44);
              }
              else if (v34 == *(_DWORD *)(v0 + 412))
              {
                uint64_t v61 = *(void *)(v0 + 288);
                uint64_t v60 = *(void *)(v0 + 296);
                uint64_t v63 = *(void *)(v0 + 272);
                uint64_t v62 = *(void *)(v0 + 280);
                uint64_t v64 = *(void *)(v0 + 192);
                uint64_t v66 = *(void *)(v0 + 168);
                uint64_t v65 = *(void *)(v0 + 176);
                uint64_t v95 = *(void *)(v0 + 160);
                unint64_t v67 = *(void *)(v0 + 112);
                unint64_t v68 = *(void *)(v0 + 120);
                int v88 = *(void *)(v0 + 104);
                (*(void (**)(void))(*(void *)(v0 + 152) + 96))();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v61, v60, v63);
                AsyncThrowingStream.Continuation.yield(_:)();
                (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v88);
                *(void *)(v0 + 72) = 0;
                AsyncThrowingStream.Continuation.finish(throwing:)();
                (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
                (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v63);
                unint64_t v69 = type metadata accessor for DocumentResourceIdentifier();
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v69 - 8) + 8))(v95, v69);
              }
              else
              {
                uint64_t v72 = *(void *)(v0 + 280);
                uint64_t v92 = *(void *)(v0 + 192);
                unint64_t v96 = *(void *)(v0 + 272);
                uint64_t v73 = *(void *)(v0 + 176);
                unint64_t v86 = *(void *)(v0 + 296);
                uint64_t v89 = *(void *)(v0 + 168);
                long long v75 = *(void *)(v0 + 152);
                uint64_t v74 = *(uint64_t **)(v0 + 160);
                long long v76 = *(void *)(v0 + 136);
                if (v34 == *(_DWORD *)(v0 + 416))
                {
                  (*(void (**)(uint64_t *, void))(v75 + 96))(v74, *(void *)(v0 + 144));
                  int v78 = *v74;
                  long long v77 = v74[1];
                  uint64_t v79 = (void *)(v76
                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                                          + 48));
                  DocumentRegistration.url.getter();
                  DocumentResource.init(url:)();
                  *uint64_t v79 = v78;
                  v79[1] = v77;
                  v79[2] = 0;
                  swift_storeEnumTagMultiPayload();
                  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
                  uint64_t v80 = swift_allocError();
                  outlined init with copy of AnyTooling(v76, v81, type metadata accessor for TokenGenerationError);
                  *(void *)(v0 + 64) = v80;
                  AsyncThrowingStream.Continuation.finish(throwing:)();
                  outlined destroy of CompletePromptRequest(v76, type metadata accessor for TokenGenerationError);
                  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v92, v89);
                  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v86, v96);
                }
                else
                {
                  uint64_t v85 = *(void *)(v0 + 144);
                  uint64_t v82 = (void *)(v76
                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                                          + 48));
                  DocumentRegistration.url.getter();
                  DocumentResource.init(url:)();
                  *uint64_t v82 = 0xD00000000000001CLL;
                  v82[1] = 0x800000025F92DF40;
                  v82[2] = 0;
                  swift_storeEnumTagMultiPayload();
                  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
                  uint64_t v83 = swift_allocError();
                  outlined init with copy of AnyTooling(v76, v84, type metadata accessor for TokenGenerationError);
                  *(void *)(v0 + 56) = v83;
                  AsyncThrowingStream.Continuation.finish(throwing:)();
                  outlined destroy of CompletePromptRequest(v76, type metadata accessor for TokenGenerationError);
                  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v92, v89);
                  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v86, v96);
                  (*(void (**)(uint64_t *, uint64_t))(v75 + 8))(v74, v85);
                }
              }
              *(void *)(v0 + 368) = AsyncMapSequence.Iterator.baseIterator.modify();
              uint64_t v70 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator and conformance AsyncThrowingStream<A, B>.Iterator, &demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator);
              uint64_t v71 = (void *)swift_task_alloc();
              *(void *)(v0 + 376) = v71;
              *uint64_t v71 = v0;
              v71[1] = closure #3 in TokenGenerator.register(documents:);
              uint64_t v27 = *(void *)(v0 + 320);
              uint64_t v26 = *(void *)(v0 + 232);
              uint64_t v28 = v70;
              return MEMORY[0x270FA1E80](v26, v27, v28);
            }
          }
          __break(1u);
          return MEMORY[0x270FA1E80](v26, v27, v28);
        }
      }
      uint64_t v45 = *(void *)(v0 + 96);
      swift_bridgeObjectRelease();
      uint64_t v46 = *(void *)(v45 + 16);
      if (v46)
      {
        unint64_t v47 = *(void *)(v0 + 176);
        uint64_t v48 = *(void *)(v0 + 136);
        BOOL v49 = *(void *)(v0 + 96)
            + ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80));
        uint64_t v91 = *(void *)(v47 + 72);
        uint64_t v87 = *(void (**)(uint64_t, unint64_t, uint64_t))(v47 + 16);
        swift_bridgeObjectRetain();
        do
        {
          uint64_t v51 = *(void *)(v0 + 176);
          uint64_t v50 = *(void *)(v0 + 184);
          uint64_t v52 = *(void *)(v0 + 168);
          uint64_t v53 = *(void **)(v0 + 136);
          v87(v50, v49, v52);
          *uint64_t v53 = 0xD00000000000002ALL;
          *(void *)(v48 + 8) = 0x800000025F92DF10;
          *(void *)(v48 + 16) = 0;
          swift_storeEnumTagMultiPayload();
          lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
          unint64_t v54 = swift_allocError();
          outlined init with copy of AnyTooling((uint64_t)v53, v55, type metadata accessor for TokenGenerationError);
          *(void *)(v0 + 48) = v54;
          AsyncThrowingStream.Continuation.finish(throwing:)();
          outlined destroy of CompletePromptRequest((uint64_t)v53, type metadata accessor for TokenGenerationError);
          (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
          v49 += v91;
          --v46;
        }
        while (v46);
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v56 = *(void *)(v0 + 360);
    uint64_t v57 = *(void *)(v0 + 336);
    uint64_t v58 = *(void *)(v0 + 344);
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 272));
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v57);
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)(v0 + 352);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v8 = *(void *)(v0 + 336);
  uint64_t v9 = *(void *)(v0 + 344);
  outlined init with take of AnyTooling(v1, *(void *)(v0 + 256), type metadata accessor for RegisterDocumentResponseElement);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
  uint64_t v10 = (int *)AsyncMapSequence.Iterator.transform.getter();
  *(void *)(v0 + 392) = v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t))((char *)v10 + *v10);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v12;
  *uint64_t v12 = v0;
  v12[1] = closure #3 in TokenGenerator.register(documents:);
  uint64_t v14 = *(void *)(v0 + 256);
  uint64_t v13 = *(void *)(v0 + 264);
  return v93(v13, v14);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 336);
  (*(void (**)(void))(v0 + 368))();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  uint64_t v1 = *(void *)(*(void *)v0 + 256);
  swift_task_dealloc();
  swift_release();
  outlined destroy of CompletePromptRequest(v1, type metadata accessor for RegisterDocumentResponseElement);
  return MEMORY[0x270FA2498](closure #3 in TokenGenerator.register(documents:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(void);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, unint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 264);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) != 1)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 280) + 32))(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
    if ((static Task<>.isCancelled.getter() & 1) == 0)
    {
      uint64_t v5 = *(void *)(v0 + 224);
      uint64_t v6 = *(void *)(v0 + 200);
      uint64_t v7 = *(void *)(v0 + 208);
      uint64_t v8 = *(void *)(v0 + 88);
      DocumentRegistration.url.getter();
      uint64_t v9 = URL.absoluteString.getter();
      uint64_t v11 = v10;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
      if (*(void *)(v8 + 16))
      {
        uint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v11);
        if (v13)
        {
          uint64_t v14 = *(void *)(*(void *)(*(void *)(v0 + 88) + 56) + 8 * v12);
          uint64_t v15 = swift_bridgeObjectRelease();
          if ((v14 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else
          {
            uint64_t v18 = *(void *)(v0 + 96);
            if (v14 < *(void *)(v18 + 16))
            {
              uint64_t v19 = *(_DWORD *)(v0 + 408);
              uint64_t v21 = *(void *)(v0 + 152);
              uint64_t v20 = *(void *)(v0 + 160);
              uint64_t v22 = *(void *)(v0 + 144);
              (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 176) + 16))(*(void *)(v0 + 192), v18+ ((*(unsigned __int8 *)(*(void *)(v0 + 176) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 176) + 80))+ *(void *)(*(void *)(v0 + 176) + 72) * v14, *(void *)(v0 + 168));
              DocumentRegistration.internalStatus.getter();
              uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22);
              if (v23 == v19)
              {
                uint64_t v24 = *(void *)(v0 + 288);
                uint64_t v25 = *(void *)(v0 + 296);
                uint64_t v26 = *(void *)(v0 + 272);
                uint64_t v27 = *(void *)(v0 + 280);
                uint64_t v28 = *(void *)(v0 + 192);
                uint64_t v30 = *(void *)(v0 + 168);
                uint64_t v29 = *(void *)(v0 + 176);
                uint64_t v32 = *(void *)(v0 + 112);
                uint64_t v31 = *(void *)(v0 + 120);
                uint64_t v80 = *(void *)(v0 + 104);
                uint64_t v83 = *(void *)(v0 + 160);
                (*(void (**)(void))(*(void *)(v0 + 152) + 96))();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v24, v25, v26);
                AsyncThrowingStream.Continuation.yield(_:)();
                (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v80);
                (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
                (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
                uint64_t v33 = type metadata accessor for DocumentRegistration.Progress();
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v83, v33);
              }
              else if (v23 == *(_DWORD *)(v0 + 412))
              {
                uint64_t v51 = *(void *)(v0 + 288);
                uint64_t v50 = *(void *)(v0 + 296);
                uint64_t v53 = *(void *)(v0 + 272);
                uint64_t v52 = *(void *)(v0 + 280);
                unint64_t v54 = *(void *)(v0 + 192);
                uint64_t v56 = *(void *)(v0 + 168);
                uint64_t v55 = *(void *)(v0 + 176);
                uint64_t v84 = *(void *)(v0 + 160);
                uint64_t v57 = *(void *)(v0 + 112);
                uint64_t v58 = *(void *)(v0 + 120);
                int v78 = *(void *)(v0 + 104);
                (*(void (**)(void))(*(void *)(v0 + 152) + 96))();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v51, v50, v53);
                AsyncThrowingStream.Continuation.yield(_:)();
                (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v78);
                *(void *)(v0 + 72) = 0;
                AsyncThrowingStream.Continuation.finish(throwing:)();
                (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
                (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v53);
                uint64_t v59 = type metadata accessor for DocumentResourceIdentifier();
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v59 - 8) + 8))(v84, v59);
              }
              else
              {
                uint64_t v62 = *(void *)(v0 + 280);
                uint64_t v82 = *(void *)(v0 + 192);
                uint64_t v85 = *(void *)(v0 + 272);
                uint64_t v63 = *(void *)(v0 + 176);
                long long v76 = *(void *)(v0 + 296);
                uint64_t v79 = *(void *)(v0 + 168);
                uint64_t v65 = *(void *)(v0 + 152);
                uint64_t v64 = *(uint64_t **)(v0 + 160);
                uint64_t v66 = *(void *)(v0 + 136);
                if (v23 == *(_DWORD *)(v0 + 416))
                {
                  (*(void (**)(uint64_t *, void))(v65 + 96))(v64, *(void *)(v0 + 144));
                  unint64_t v68 = *v64;
                  unint64_t v67 = v64[1];
                  unint64_t v69 = (void *)(v66
                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                                          + 48));
                  DocumentRegistration.url.getter();
                  DocumentResource.init(url:)();
                  *unint64_t v69 = v68;
                  v69[1] = v67;
                  v69[2] = 0;
                  swift_storeEnumTagMultiPayload();
                  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
                  uint64_t v70 = swift_allocError();
                  outlined init with copy of AnyTooling(v66, v71, type metadata accessor for TokenGenerationError);
                  *(void *)(v0 + 64) = v70;
                  AsyncThrowingStream.Continuation.finish(throwing:)();
                  outlined destroy of CompletePromptRequest(v66, type metadata accessor for TokenGenerationError);
                  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v82, v79);
                  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v76, v85);
                }
                else
                {
                  long long v75 = *(void *)(v0 + 144);
                  uint64_t v72 = (void *)(v66
                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (document: DocumentResource, TokenGenerationError.Context))
                                          + 48));
                  DocumentRegistration.url.getter();
                  DocumentResource.init(url:)();
                  *uint64_t v72 = 0xD00000000000001CLL;
                  v72[1] = 0x800000025F92DF40;
                  v72[2] = 0;
                  swift_storeEnumTagMultiPayload();
                  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
                  uint64_t v73 = swift_allocError();
                  outlined init with copy of AnyTooling(v66, v74, type metadata accessor for TokenGenerationError);
                  *(void *)(v0 + 56) = v73;
                  AsyncThrowingStream.Continuation.finish(throwing:)();
                  outlined destroy of CompletePromptRequest(v66, type metadata accessor for TokenGenerationError);
                  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v82, v79);
                  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v76, v85);
                  (*(void (**)(uint64_t *, uint64_t))(v65 + 8))(v64, v75);
                }
              }
              *(void *)(v0 + 368) = AsyncMapSequence.Iterator.baseIterator.modify();
              uint64_t v60 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator and conformance AsyncThrowingStream<A, B>.Iterator, &demangling cache variable for type metadata for AsyncThrowingStream<RegisterDocumentResponseElement, Error>.Iterator);
              uint64_t v61 = (void *)swift_task_alloc();
              *(void *)(v0 + 376) = v61;
              *uint64_t v61 = v0;
              v61[1] = closure #3 in TokenGenerator.register(documents:);
              uint64_t v16 = *(void *)(v0 + 320);
              uint64_t v15 = *(void *)(v0 + 232);
              uint64_t v17 = v60;
              return MEMORY[0x270FA1E80](v15, v16, v17);
            }
          }
          __break(1u);
          return MEMORY[0x270FA1E80](v15, v16, v17);
        }
      }
      uint64_t v34 = *(void *)(v0 + 96);
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void *)(v34 + 16);
      if (v35)
      {
        uint64_t v36 = *(void *)(v0 + 176);
        uint64_t v37 = *(void *)(v0 + 136);
        uint64_t v38 = *(void *)(v0 + 96)
            + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
        uint64_t v81 = *(void *)(v36 + 72);
        long long v77 = *(void (**)(uint64_t, unint64_t, uint64_t))(v36 + 16);
        swift_bridgeObjectRetain();
        do
        {
          uint64_t v40 = *(void *)(v0 + 176);
          uint64_t v39 = *(void *)(v0 + 184);
          unint64_t v41 = *(void *)(v0 + 168);
          unint64_t v42 = *(void **)(v0 + 136);
          v77(v39, v38, v41);
          char *v42 = 0xD00000000000002ALL;
          *(void *)(v37 + 8) = 0x800000025F92DF10;
          *(void *)(v37 + 16) = 0;
          swift_storeEnumTagMultiPayload();
          lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
          unint64_t v43 = swift_allocError();
          outlined init with copy of AnyTooling((uint64_t)v42, v44, type metadata accessor for TokenGenerationError);
          *(void *)(v0 + 48) = v43;
          AsyncThrowingStream.Continuation.finish(throwing:)();
          outlined destroy of CompletePromptRequest((uint64_t)v42, type metadata accessor for TokenGenerationError);
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
          v38 += v81;
          --v35;
        }
        while (v35);
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v45 = *(void *)(v0 + 360);
    uint64_t v46 = *(void *)(v0 + 336);
    unint64_t v47 = *(void *)(v0 + 344);
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 272));
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v46);
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)(v0 + 264);
  (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v4, &demangling cache variable for type metadata for DocumentRegistration?);
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
  return v48();
}

uint64_t closure #1 in closure #4 in TokenGenerator.register(documents:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>.Continuation.Termination);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  int v8 = *MEMORY[0x263F8F650];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1 == v8)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    return MEMORY[0x261200E80](a2, MEMORY[0x263F8EE60] + 8, v10, MEMORY[0x263F8E4E0]);
  }
  return result;
}

uint64_t TokenGenerator.complete(prompt:parameters:schema:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v40 = a3;
  uint64_t v43 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v42 = (void (**)(char *, uint64_t))((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Schema();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v38 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v41 = (uint64_t)&v37 - v17;
  uint64_t v18 = type metadata accessor for UUID();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = *(_OWORD *)(a2 + 96);
  long long v23 = *(_OWORD *)(a2 + 112);
  long long v24 = *(_OWORD *)(a2 + 64);
  long long v53 = *(_OWORD *)(a2 + 80);
  long long v54 = v22;
  v55[0] = v23;
  *(_DWORD *)((char *)v55 + 15) = *(_DWORD *)(a2 + 127);
  long long v25 = *(_OWORD *)(a2 + 48);
  long long v50 = *(_OWORD *)(a2 + 32);
  long long v51 = v25;
  long long v52 = v24;
  long long v26 = *(_OWORD *)(a2 + 16);
  long long v48 = *(_OWORD *)a2;
  long long v49 = v26;
  UUID.init()();
  uint64_t v39 = UUID.uuidString.getter();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  unint64_t v29 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  outlined init with copy of Prompt.Rendering?(v40, (uint64_t)v9, &demangling cache variable for type metadata for Schema?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v9, &demangling cache variable for type metadata for Schema?);
    uint64_t v30 = type metadata accessor for Constraints(0);
    uint64_t v31 = v41;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v41, 1, 1, v30);
  }
  else
  {
    uint64_t v32 = v38;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v38, v9, v10);
    Schema.type.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v32, v10);
    uint64_t v33 = type metadata accessor for Constraints(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v16, 0, 1, v33);
    uint64_t v31 = v41;
    outlined init with take of Locale?((uint64_t)v16, v41, &demangling cache variable for type metadata for Constraints?);
  }
  v46[5] = v53;
  v46[6] = v54;
  v47[0] = v55[0];
  *(_DWORD *)((char *)v47 + 15) = *(_DWORD *)((char *)v55 + 15);
  v46[2] = v50;
  v46[3] = v51;
  v46[4] = v52;
  v46[0] = v48;
  v46[1] = v49;
  uint64_t v34 = type metadata accessor for ToolChoice();
  uint64_t v35 = v42;
  (*(void (**)(void (**)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v42, 1, 1, v34);
  v45[0] = v39;
  v45[1] = v28;
  v45[2] = 0xD000000000000023;
  v45[3] = 0x800000025F92DE00;
  v45[4] = 0;
  v45[5] = 0;
  v45[6] = v29;
  TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:constraint:metadata:)(v44, v46, MEMORY[0x263F8EE78], v35, MEMORY[0x263F8EE78], v31, v45, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v35, &demangling cache variable for type metadata for ToolChoice?);
  return outlined destroy of GenerativeFunctionsInstrumentationEvent?(v31, &demangling cache variable for type metadata for Constraints?);
}

uint64_t AnyTooling.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v45 = type metadata accessor for ToolType();
  uint64_t v43 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v39 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for GenerationSchema();
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for ToolType.Function();
  uint64_t v7 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ToolType.Type();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v38 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (long long *)((char *)&v38 - v14);
  uint64_t v16 = type metadata accessor for AnyTooling();
  uint64_t v44 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  ToolType.type.getter();
  int v19 = (*(uint64_t (**)(long long *, uint64_t))(v11 + 88))(v15, v10);
  if (v19 == *MEMORY[0x263F40E48])
  {
    (*(void (**)(long long *, uint64_t))(v11 + 96))(v15, v10);
    uint64_t v20 = v15;
    uint64_t v21 = v40;
    uint64_t v22 = (*(uint64_t (**)(char *, long long *, uint64_t))(v7 + 32))(v9, v20, v40);
    *uint64_t v18 = MEMORY[0x261200360](v22);
    v18[1] = v23;
    v18[2] = MEMORY[0x261200350]();
    v18[3] = v24;
    MEMORY[0x261200340]();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(a1, v45);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))((char *)v18 + *(int *)(v16 + 24), v6, v42);
    long long v25 = (uint64_t *)((char *)v18 + *(int *)(v16 + 28));
    *long long v25 = 0;
    v25[1] = 0;
LABEL_5:
    uint64_t v32 = v46;
    outlined init with take of AnyTooling((uint64_t)v18, v46, (uint64_t (*)(void))type metadata accessor for AnyTooling);
    uint64_t v33 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v32, v33, 1, v16);
  }
  uint64_t v40 = (uint64_t)v6;
  uint64_t v26 = v43;
  if (v19 == *MEMORY[0x263F40E40])
  {
    (*(void (**)(long long *, uint64_t))(v11 + 96))(v15, v10);
    outlined init with take of AsyncIteratorProtocol(v15, (uint64_t)v48);
    __swift_project_boxed_opaque_existential_1(v48, v49);
    *uint64_t v18 = dispatch thunk of Tooling.name.getter();
    v18[1] = v27;
    __swift_project_boxed_opaque_existential_1(v48, v49);
    v18[2] = dispatch thunk of Tooling.usageDescription.getter();
    v18[3] = v28;
    __swift_project_boxed_opaque_existential_1(v48, v49);
    swift_getDynamicType();
    uint64_t v29 = v40;
    static Tooling.argumentsSchema.getter();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(a1, v45);
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))((char *)v18 + *(int *)(v16 + 24), v29, v42);
    outlined init with copy of PromptCompletionEvent((uint64_t)v48, (uint64_t)v47);
    uint64_t v30 = swift_allocObject();
    outlined init with take of AsyncIteratorProtocol(v47, v30 + 16);
    uint64_t v31 = (uint64_t *)((char *)v18 + *(int *)(v16 + 28));
    *uint64_t v31 = &async function pointer to partial apply for closure #1 in AnyTooling.init(_:);
    v31[1] = v30;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    goto LABEL_5;
  }
  if (v19 == *MEMORY[0x263F40E38] || v19 == *MEMORY[0x263F40E30])
  {
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(a1, v45);
    uint64_t v33 = 1;
    uint64_t v32 = v46;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v32, v33, 1, v16);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v39, a1, v45);
  v48[0] = 0;
  v48[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(26);
  v35._object = (void *)0x800000025F92CC30;
  v35._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v35);
  uint64_t v36 = v38;
  ToolType.type.getter();
  _print_unlocked<A, B>(_:_:)();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v36, v10);
  v37._countAndFlagsBits = 0x6465737520;
  v37._object = (void *)0xE500000000000000;
  String.append(_:)(v37);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t TokenGenerator.handleCompletePromptRequest(request:tools:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v62 = a3;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v63);
  uint64_t v60 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v59 = (char *)&v51 - v6;
  uint64_t v7 = type metadata accessor for CompletePromptRequest(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = specialized Set.init<A>(_:)((uint64_t)&outlined read-only object #0 of TokenGenerator.handleCompletePromptRequest(request:tools:));
  swift_arrayDestroy();
  uint64_t v55 = v7;
  uint64_t v15 = a1 + *(int *)(v7 + 40);
  uint64_t v16 = *(void *)(v15 + 32);
  uint64_t v17 = *(void *)(v15 + 40);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  if (v17)
  {
    uint64_t v64 = v16;
  }
  else
  {
    UUID.init()();
    uint64_t v64 = UUID.uuidString.getter();
    uint64_t v17 = v18;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  long long v52 = type metadata accessor for CompletePromptRequest;
  outlined init with copy of AnyTooling(a1, (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CompletePromptRequest);
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v20 = (v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = v8;
  unint64_t v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v51 = a1;
  uint64_t v24 = swift_allocObject();
  outlined init with take of AnyTooling((uint64_t)v10, v24 + v19, type metadata accessor for CompletePromptRequest);
  uint64_t v25 = v56;
  uint64_t v26 = v57;
  *(void *)(v24 + v20) = v57;
  uint64_t v27 = (uint64_t *)(v24 + v21);
  *uint64_t v27 = v64;
  v27[1] = v17;
  *(void *)(v24 + v23) = v25;
  uint64_t v28 = v58;
  *(void *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8)) = v58;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  uint64_t v54 = swift_allocBox();
  uint64_t v30 = v29;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CompletePromptRequest?);
  uint64_t v53 = swift_allocBox();
  uint64_t v33 = v32;
  outlined init with copy of AnyTooling(v51, v32, v52);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v33, 0, 1, v55);
  uint64_t v34 = type metadata accessor for PromptCompletion.Aggregator(0);
  uint64_t v35 = swift_allocBox();
  Swift::String v37 = v36;
  uint64_t v38 = MEMORY[0x263F8EE78];
  *uint64_t v36 = MEMORY[0x263F8EE78];
  v36[1] = 0;
  v36[2] = 0;
  v36[3] = -1;
  v36[4] = -1;
  v36[5] = 0;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v39 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37[6] = specialized Dictionary.init(dictionaryLiteral:)(v38);
  uint64_t v40 = (char *)v37 + *(int *)(v34 + 32);
  uint64_t v41 = type metadata accessor for Prompt.Rendering();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 1, 1, v41);
  uint64_t v42 = *(int *)(v34 + 36);
  *(void *)((char *)v37 + v42) = specialized Dictionary.init(dictionaryLiteral:)(v38);
  uint64_t v43 = (void *)swift_allocObject();
  uint64_t v44 = v54;
  v43[2] = v53;
  v43[3] = v44;
  uint64_t v45 = v64;
  v43[4] = v26;
  v43[5] = v45;
  v43[6] = v17;
  long long v43[7] = v39;
  v43[8] = v35;
  v43[9] = v28;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  uint64_t v46 = v59;
  AsyncThrowingStream.init<>(unfolding:)();
  long long v48 = v60;
  uint64_t v47 = v61;
  uint64_t v49 = v63;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v60, v46, v63);
  specialized TokenStream.init<A>(streamResponse:bufferResponse:)(v48, (uint64_t)&async function pointer to partial apply for closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:), v24, v62);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v49);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t TokenGenerator.handleCompletePromptTemplateRequest(request:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v55 = a2;
  uint64_t v5 = type metadata accessor for CompletePromptTemplateRequest(0);
  uint64_t v6 = v5 - 8;
  uint64_t v52 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v53 = v7;
  uint64_t v54 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for StreamingRequest(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>);
  MEMORY[0x270FA5388](v47);
  uint64_t v46 = (uint64_t)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>);
  uint64_t v50 = *(void *)(v12 - 8);
  uint64_t v51 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v49 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v48 = (char *)&v42 - v15;
  uint64_t v16 = type metadata accessor for UUID();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = specialized Set.init<A>(_:)((uint64_t)&outlined read-only object #0 of TokenGenerator.handleCompletePromptTemplateRequest(request:));
  swift_arrayDestroy();
  uint64_t v20 = a1 + *(int *)(v6 + 52);
  uint64_t v21 = *(void *)(v20 + 32);
  uint64_t v22 = *(void *)(v20 + 40);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  if (v22)
  {
    uint64_t v44 = v21;
  }
  else
  {
    UUID.init()();
    uint64_t v44 = UUID.uuidString.getter();
    uint64_t v22 = v23;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  uint64_t v25 = v3[15];
  uint64_t v24 = v3[16];
  uint64_t v43 = v3;
  __swift_project_boxed_opaque_existential_1(v3 + 12, v25);
  outlined init with copy of AnyTooling(a1, (uint64_t)v10, type metadata accessor for CompletePromptTemplateRequest);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = type metadata accessor for CompletePromptResponseElement(0);
  uint64_t v42 = a1;
  uint64_t v27 = v26;
  uint64_t v28 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
  uint64_t v29 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
  uint64_t v41 = v28;
  uint64_t v30 = v45;
  uint64_t v31 = v44;
  InferenceSessionProtocol.streamingRequest<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)(v44, v22, v45, v25, v27, v24, v46, v41, v29);
  outlined destroy of CompletePromptRequest((uint64_t)v10, type metadata accessor for StreamingRequest);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<CompletePromptResponseElement, Error> and conformance AsyncThrowingStream<A, B>, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>);
  uint64_t v32 = v48;
  AsyncMapSequence.init(_:transform:)();
  uint64_t v33 = v54;
  outlined init with copy of AnyTooling(v42, v54, type metadata accessor for CompletePromptTemplateRequest);
  unint64_t v34 = (*(unsigned __int8 *)(v52 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  unint64_t v35 = (v53 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = (void *)swift_allocObject();
  v36[2] = v43;
  v36[3] = v31;
  v36[4] = v22;
  outlined init with take of AnyTooling(v33, (uint64_t)v36 + v34, type metadata accessor for CompletePromptTemplateRequest);
  *(void *)((char *)v36 + v35) = v30;
  uint64_t v38 = v49;
  uint64_t v37 = v50;
  uint64_t v39 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v32, v51);
  swift_retain();
  specialized TokenStream.init<A>(streamResponse:bufferResponse:)(v38, (uint64_t)&async function pointer to partial apply for closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:), (uint64_t)v36, v55);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v32, v39);
}

uint64_t TokenGenerator.complete<A>(prompt:parameters:generating:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  v33[1] = a3;
  uint64_t v36 = a1;
  uint64_t v37 = a4;
  uint64_t v35 = type metadata accessor for UUID();
  uint64_t v34 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Schema();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (void (**)(char *, uint64_t))((char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TokenStream<String>);
  MEMORY[0x270FA5388](v17 - 8);
  unint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *(_OWORD *)(a2 + 96);
  long long v21 = *(_OWORD *)(a2 + 112);
  long long v22 = *(_OWORD *)(a2 + 64);
  v39[5] = *(_OWORD *)(a2 + 80);
  v39[6] = v20;
  v40[0] = v21;
  *(_DWORD *)((char *)v40 + 15) = *(_DWORD *)(a2 + 127);
  long long v23 = *(_OWORD *)(a2 + 48);
  v39[2] = *(_OWORD *)(a2 + 32);
  v39[3] = v23;
  v39[4] = v22;
  long long v24 = *(_OWORD *)(a2 + 16);
  v39[0] = *(_OWORD *)a2;
  v39[1] = v24;
  uint64_t v25 = type metadata accessor for ToolChoice();
  (*(void (**)(void (**)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v16, 1, 1, v25);
  dispatch thunk of static Generable.schema.getter();
  Schema.type.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v26 = type metadata accessor for Constraints(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v13, 0, 1, v26);
  UUID.init()();
  uint64_t v27 = UUID.uuidString.getter();
  uint64_t v29 = v28;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
  uint64_t v30 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8EE78];
  unint64_t v31 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v38[0] = v27;
  v38[1] = v29;
  v38[2] = 0xD000000000000027;
  v38[3] = 0x800000025F92DE30;
  v38[5] = 0;
  v38[6] = v31;
  v38[4] = 0;
  TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:constraint:metadata:)(v36, v39, (uint64_t)v30, v16, v30, (uint64_t)v13, v38, (uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v13, &demangling cache variable for type metadata for Constraints?);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v16, &demangling cache variable for type metadata for ToolChoice?);
  TokenStream<>.map<A>(_:)(v37);
  return outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v19, &demangling cache variable for type metadata for TokenStream<String>);
}

uint64_t TokenGenerator.complete(prompt:parameters:grammar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (void (**)(char *, uint64_t))((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v16 = *(_OWORD *)(a2 + 96);
  long long v17 = *(_OWORD *)(a2 + 112);
  long long v18 = *(_OWORD *)(a2 + 64);
  long long v42 = *(_OWORD *)(a2 + 80);
  long long v43 = v16;
  v44[0] = v17;
  *(_DWORD *)((char *)v44 + 15) = *(_DWORD *)(a2 + 127);
  long long v19 = *(_OWORD *)(a2 + 48);
  long long v39 = *(_OWORD *)(a2 + 32);
  long long v40 = v19;
  long long v41 = v18;
  long long v20 = *(_OWORD *)(a2 + 16);
  long long v37 = *(_OWORD *)a2;
  long long v38 = v20;
  UUID.init()();
  uint64_t v21 = UUID.uuidString.getter();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  long long v24 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8EE78];
  unint64_t v25 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v35[5] = v42;
  v35[6] = v43;
  v36[0] = v44[0];
  *(_DWORD *)((char *)v36 + 15) = *(_DWORD *)((char *)v44 + 15);
  v35[2] = v39;
  v35[3] = v40;
  v35[4] = v41;
  v35[0] = v37;
  v35[1] = v38;
  uint64_t v26 = type metadata accessor for ToolChoice();
  (*(void (**)(void (**)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v11, 1, 1, v26);
  uint64_t v27 = v31;
  *uint64_t v8 = v30;
  v8[1] = v27;
  uint64_t v28 = type metadata accessor for Constraints(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v8, 0, 1, v28);
  v34[0] = v21;
  v34[1] = v23;
  v34[2] = 0xD000000000000024;
  v34[3] = 0x800000025F92DE60;
  v34[4] = 0;
  v34[5] = 0;
  v34[6] = v25;
  swift_bridgeObjectRetain();
  TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:constraint:metadata:)(v33, v35, (uint64_t)v24, v11, v24, (uint64_t)v8, v34, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v8, &demangling cache variable for type metadata for Constraints?);
  return outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v11, &demangling cache variable for type metadata for ToolChoice?);
}

uint64_t TokenGenerator.complete(prompt:parameters:tools:toolChoice:documents:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v64 = a6;
  uint64_t v62 = a1;
  uint64_t v63 = a4;
  uint64_t v75 = type metadata accessor for GenerationSchema();
  int64_t v77 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v74 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = type metadata accessor for Schema();
  uint64_t v66 = *(void (***)(char *, uint64_t))(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v72 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for AnyTooling();
  uint64_t v68 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  unint64_t v69 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for ToolType();
  uint64_t v76 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolChoice?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v61 = (uint64_t)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Constraints?);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v60 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Prompt();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v57 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v59 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CompletePromptRequest(0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v58 = (uint64_t *)((char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = type metadata accessor for UUID();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v26 = a2[6];
  long long v27 = a2[7];
  long long v28 = a2[4];
  long long v86 = a2[5];
  long long v87 = v26;
  v88[0] = v27;
  *(_DWORD *)((char *)v88 + 15) = *(_DWORD *)((char *)a2 + 127);
  long long v29 = a2[3];
  long long v83 = a2[2];
  long long v84 = v29;
  long long v85 = v28;
  long long v30 = a2[1];
  long long v81 = *a2;
  long long v82 = v30;
  UUID.init()();
  uint64_t v31 = (void (*)(char *, char *, uint64_t))UUID.uuidString.getter();
  uint64_t v55 = v32;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  uint64_t v33 = MEMORY[0x263F8EE78];
  uint64_t v54 = (void (*)(char *, char *, uint64_t))specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  int64_t v34 = *(void *)(a3 + 16);
  if (v34)
  {
    uint64_t v51 = v31;
    uint64_t v52 = a5;
    *(void *)&v79[0] = v33;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v34, 0);
    uint64_t v35 = (uint64_t)v69;
    unint64_t v36 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
    uint64_t v53 = a3;
    uint64_t v37 = a3 + v36;
    uint64_t v38 = *(void *)(v68 + 72);
    unint64_t v67 = (void (**)(char *, uint64_t, uint64_t))(v77 + 16);
    uint64_t v68 = v38;
    uint64_t v65 = v76 + 32;
    ++v66;
    long long v39 = v74;
    long long v40 = v72;
    do
    {
      int64_t v77 = v34;
      outlined init with copy of AnyTooling(v37, v35, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      (*v67)(v39, v35 + *(int *)(v71 + 24), v75);
      Schema.init(type:)();
      static ToolType.function(name:description:parameters:)();
      (*v66)(v40, v73);
      outlined destroy of CompletePromptRequest(v35, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      uint64_t v33 = *(void *)&v79[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v33 + 16) + 1, 1);
        uint64_t v33 = *(void *)&v79[0];
      }
      unint64_t v42 = *(void *)(v33 + 16);
      unint64_t v41 = *(void *)(v33 + 24);
      if (v42 >= v41 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v41 > 1, v42 + 1, 1);
        uint64_t v33 = *(void *)&v79[0];
      }
      *(void *)(v33 + 16) = v42 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v33+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(void *)(v76 + 72) * v42, v13, v70);
      *(void *)&v79[0] = v33;
      v37 += v68;
      int64_t v34 = v77 - 1;
    }
    while (v77 != 1);
    uint64_t v43 = v64;
    a5 = v52;
    a3 = v53;
    uint64_t v31 = v51;
  }
  else
  {
    uint64_t v43 = v64;
  }
  uint64_t v44 = (uint64_t)v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v59, v62, v57);
  v79[5] = v86;
  v79[6] = v87;
  v80[0] = v88[0];
  *(_DWORD *)((char *)v80 + 15) = *(_DWORD *)((char *)v88 + 15);
  v79[2] = v83;
  v79[3] = v84;
  v79[4] = v85;
  v79[0] = v81;
  v79[1] = v82;
  uint64_t v45 = type metadata accessor for Constraints(0);
  uint64_t v46 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v60, 1, 1, v45);
  uint64_t v47 = v61;
  outlined init with copy of Prompt.Rendering?(v63, v61, &demangling cache variable for type metadata for ToolChoice?);
  v78[0] = v31;
  v78[1] = v55;
  v78[2] = (void (*)(char *, char *, uint64_t))0xD000000000000037;
  v78[3] = (void (*)(char *, char *, uint64_t))0x800000025F92DE90;
  v78[4] = 0;
  v78[5] = 0;
  v78[6] = v54;
  outlined retain of SamplingParameters((uint64_t)&v81);
  swift_bridgeObjectRetain();
  long long v48 = v58;
  CompletePromptRequest.init(prompt:parameters:constraint:tools:toolChoice:documents:metadata:)(v44, (uint64_t *)v79, v46, v33, v47, a5, v78, v58);
  TokenGenerator.handleCompletePromptRequest(request:tools:)((uint64_t)v48, a3, v43);
  return outlined destroy of CompletePromptRequest((uint64_t)v48, type metadata accessor for CompletePromptRequest);
}

uint64_t closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[51] = a6;
  v7[52] = a7;
  v7[49] = a4;
  v7[50] = a5;
  v7[47] = a2;
  v7[48] = a3;
  v7[46] = a1;
  v7[53] = type metadata accessor for OneShotRequest(0);
  v7[54] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for CompletePromptRequest(0);
  v7[55] = v8;
  v7[56] = *(void *)(v8 - 8);
  v7[57] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletion?);
  v7[58] = swift_task_alloc();
  v7[59] = swift_task_alloc();
  v7[60] = swift_task_alloc();
  v7[61] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CompletePromptRequest?);
  v7[62] = swift_task_alloc();
  v7[63] = swift_task_alloc();
  v7[64] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:), 0, 0);
}

uint64_t closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:)()
{
  uint64_t v1 = v0[63];
  uint64_t v2 = v0[64];
  uint64_t v3 = v0[61];
  uint64_t v4 = v0[55];
  uint64_t v5 = v0[56];
  outlined init with copy of AnyTooling(v0[47], v2, type metadata accessor for CompletePromptRequest);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v2, 0, 1, v4);
  uint64_t v6 = type metadata accessor for PromptCompletion(0);
  v0[65] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v0[66] = v7;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v0[67] = v8;
  v0[68] = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v3, 1, 1, v6);
  outlined init with copy of Prompt.Rendering?(v2, v1, &demangling cache variable for type metadata for CompletePromptRequest?);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  v0[69] = v9;
  v0[70] = (v5 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v9(v1, 1, v4) == 1)
  {
    uint64_t v10 = v0[66];
    uint64_t v11 = v0[65];
    uint64_t v13 = v0[60];
    uint64_t v12 = v0[61];
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[63], &demangling cache variable for type metadata for CompletePromptRequest?);
    outlined init with copy of Prompt.Rendering?(v12, v13, &demangling cache variable for type metadata for PromptCompletion?);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v11);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v15 = v0[64];
      uint64_t v16 = v0[60];
      uint64_t v17 = v0[46];
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[61], &demangling cache variable for type metadata for PromptCompletion?);
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v15, &demangling cache variable for type metadata for CompletePromptRequest?);
      outlined init with take of AnyTooling(v16, v17, type metadata accessor for PromptCompletion);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v18 = (uint64_t (*)(void))v0[1];
      return v18();
    }
  }
  else
  {
    uint64_t v19 = v0[48];
    uint64_t v20 = v0[57];
    uint64_t v21 = v0[54];
    outlined init with take of AnyTooling(v0[63], v20, type metadata accessor for CompletePromptRequest);
    uint64_t v22 = *(void *)(v19 + 120);
    __swift_project_boxed_opaque_existential_1((void *)(v19 + 96), v22);
    outlined init with copy of AnyTooling(v20, v21, type metadata accessor for CompletePromptRequest);
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = (void *)swift_task_alloc();
    v0[71] = v23;
    lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
    lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
    *uint64_t v23 = v0;
    v23[1] = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
    uint64_t v24 = v0[54];
    uint64_t v25 = v0[50];
    uint64_t v26 = v0[51];
    uint64_t v27 = v0[49];
    return InferenceSessionProtocol.request<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)((uint64_t)(v0 + 2), v27, v25, v24, v26, (uint64_t)&type metadata for CompletePromptResponse, v22, (uint64_t)&type metadata for CompletePromptResponse);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 576) = v0;
  swift_task_dealloc();
  outlined destroy of CompletePromptRequest(*(void *)(v2 + 432), type metadata accessor for OneShotRequest);
  if (v0) {
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  else {
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  long long v1;
  long long v2;
  long long v3;
  long long v4;
  long long v5;
  void (*v6)(void *, void, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  uint64_t v1 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 320) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 336) = v1;
  *(_OWORD *)(v0 + 352) = *(_OWORD *)(v0 + 176);
  uint64_t v2 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 256) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 272) = v2;
  uint64_t v3 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 288) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 304) = v3;
  uint64_t v4 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 + 208) = v4;
  uint64_t v5 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 224) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 240) = v5;
  uint64_t v6 = *(void (**)(void *, void, uint64_t, uint64_t))(v0 + 536);
  uint64_t v7 = *(void *)(v0 + 528);
  uint64_t v8 = *(void *)(v0 + 520);
  uint64_t v9 = *(void *)(v0 + 488);
  uint64_t v11 = *(void *)(v0 + 464);
  uint64_t v10 = *(void **)(v0 + 472);
  PromptCompletionEnvelope.unseal()(v10);
  outlined release of CompletePromptResponse((void *)(v0 + 192));
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v9, &demangling cache variable for type metadata for PromptCompletion?);
  v6(v10, 0, 1, v8);
  outlined init with take of Locale?((uint64_t)v10, v9, &demangling cache variable for type metadata for PromptCompletion?);
  outlined init with copy of Prompt.Rendering?(v9, v11, &demangling cache variable for type metadata for PromptCompletion?);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v11, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 584) = v13;
    *uint64_t v13 = v0;
    v13[1] = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
    uint64_t v14 = *(void *)(v0 + 496);
    uint64_t v16 = *(void *)(v0 + 456);
    uint64_t v15 = *(void *)(v0 + 464);
    uint64_t v17 = *(void *)(v0 + 416);
    return TokenGenerator.nextRequest(for:invoking:previousRequest:)(v14, v15, v17, v16);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  else
  {
    outlined destroy of CompletePromptRequest(*(void *)(v2 + 464), type metadata accessor for PromptCompletion);
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  unsigned int (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v1 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[69];
  uint64_t v2 = v0[63];
  uint64_t v3 = v0[64];
  uint64_t v4 = v0[62];
  uint64_t v5 = v0[55];
  outlined destroy of CompletePromptRequest(v0[57], type metadata accessor for CompletePromptRequest);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v3, &demangling cache variable for type metadata for CompletePromptRequest?);
  outlined init with take of Locale?(v4, v3, &demangling cache variable for type metadata for CompletePromptRequest?);
  outlined init with copy of Prompt.Rendering?(v3, v2, &demangling cache variable for type metadata for CompletePromptRequest?);
  if (v1(v2, 1, v5) == 1)
  {
    uint64_t v6 = v0[66];
    uint64_t v7 = v0[65];
    uint64_t v9 = v0[60];
    uint64_t v8 = v0[61];
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[63], &demangling cache variable for type metadata for CompletePromptRequest?);
    outlined init with copy of Prompt.Rendering?(v8, v9, &demangling cache variable for type metadata for PromptCompletion?);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1, v7);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = v0[64];
      uint64_t v12 = v0[60];
      uint64_t v13 = v0[46];
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[61], &demangling cache variable for type metadata for PromptCompletion?);
      outlined destroy of GenerativeFunctionsInstrumentationEvent?(v11, &demangling cache variable for type metadata for CompletePromptRequest?);
      outlined init with take of AnyTooling(v12, v13, type metadata accessor for PromptCompletion);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v14 = (uint64_t (*)(void))v0[1];
      return v14();
    }
  }
  else
  {
    uint64_t v15 = v0[57];
    uint64_t v16 = v0[54];
    uint64_t v17 = v0[48];
    outlined init with take of AnyTooling(v0[63], v15, type metadata accessor for CompletePromptRequest);
    uint64_t v18 = *(void *)(v17 + 120);
    __swift_project_boxed_opaque_existential_1((void *)(v17 + 96), v18);
    outlined init with copy of AnyTooling(v15, v16, type metadata accessor for CompletePromptRequest);
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[71] = v19;
    lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
    lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
    *uint64_t v19 = v0;
    v19[1] = closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:);
    uint64_t v20 = v0[54];
    uint64_t v21 = v0[50];
    uint64_t v22 = v0[51];
    uint64_t v23 = v0[49];
    return InferenceSessionProtocol.request<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)((uint64_t)(v0 + 2), v23, v21, v20, v22, (uint64_t)&type metadata for CompletePromptResponse, v18, (uint64_t)&type metadata for CompletePromptResponse);
  }
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = v0[64];
  uint64_t v2 = v0[61];
  outlined destroy of CompletePromptRequest(v0[57], type metadata accessor for CompletePromptRequest);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v2, &demangling cache variable for type metadata for PromptCompletion?);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v1, &demangling cache variable for type metadata for CompletePromptRequest?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[64];
  uint64_t v2 = v0[61];
  uint64_t v3 = v0[58];
  outlined destroy of CompletePromptRequest(v0[57], type metadata accessor for CompletePromptRequest);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v2, &demangling cache variable for type metadata for PromptCompletion?);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v1, &demangling cache variable for type metadata for CompletePromptRequest?);
  outlined destroy of CompletePromptRequest(v3, type metadata accessor for PromptCompletion);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t TokenGenerator.nextRequest(for:invoking:previousRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = type metadata accessor for Prompt();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Prompt.Turn(0);
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for CompletePromptRequest(0);
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](TokenGenerator.nextRequest(for:invoking:previousRequest:), 0, 0);
}

uint64_t TokenGenerator.nextRequest(for:invoking:previousRequest:)()
{
  uint64_t v1 = *(void **)(v0[3] + 32);
  if (v1[2])
  {
    uint64_t v2 = v0[4];
    v0[20] = v1[4];
    uint64_t v3 = v1[5];
    v0[21] = v3;
    v0[22] = v1[6];
    uint64_t v4 = v1[7];
    v0[23] = v4;
    unint64_t v5 = v1[8];
    v0[24] = v5;
    uint64_t v6 = v1[9];
    v0[25] = v6;
    unint64_t v7 = v1[10];
    v0[26] = v7;
    if (*(void *)(v2 + 16) && *(void *)(v3 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of FinishReason(v4, v5);
      outlined copy of Data._Representation(v6, v7);
      uint64_t v8 = (void *)swift_task_alloc();
      v0[27] = v8;
      *uint64_t v8 = v0;
      v8[1] = TokenGenerator.nextRequest(for:invoking:previousRequest:);
      uint64_t v9 = v0[4];
      return specialized TokenGenerator.invoke(tooling:calls:)(v9, v3);
    }
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[18] + 56))(v0[2], 1, 1, v0[17]);
  }
  else
  {
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Log.generator);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25F79F000, v12, v13, "Response was missing candidates", v14, 2u);
      MEMORY[0x261201C80](v14, -1, -1);
    }
    uint64_t v15 = v0[17];
    uint64_t v16 = v0[18];
    uint64_t v17 = v0[2];

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v17, 1, 1, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unsigned char *v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint8_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t (*v60)(void);
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  int *v67;
  unint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  uint64_t v1 = v0[28];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[21];
    uint64_t v3 = (unsigned char *)v0[15];
    uint64_t v79 = v0[16];
    uint64_t v4 = (int *)v0[12];
    unint64_t v5 = v69[11];
    uint64_t v6 = v69[10];
    outlined init with copy of AnyTooling(v69[5], v0[19], type metadata accessor for CompletePromptRequest);
    unint64_t v7 = type metadata accessor for Locale();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    v8(v5, 1, 1, v7);
    outlined init with copy of Prompt.Rendering?(v5, v6, &demangling cache variable for type metadata for Locale?);
    uint64_t v9 = (uint64_t)&v3[v4[5]];
    uint64_t v64 = v8;
    uint64_t v65 = v7;
    v8(v9, 1, 1, v7);
    uint64_t v10 = &v3[v4[9]];
    *uint64_t v3 = 1;
    uint64_t v11 = MEMORY[0x263F8EE78];
    *(void *)&v3[v4[6]] = MEMORY[0x263F8EE78];
    *(void *)&v3[v4[8]] = v2;
    *uint64_t v10 = 0u;
    v10[1] = 0u;
    unint64_t v67 = v4;
    v3[v4[7]] = 0;
    swift_bridgeObjectRetain();
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v6, v9, &demangling cache variable for type metadata for Locale?);
    outlined init with take of AnyTooling((uint64_t)v3, v79, type metadata accessor for Prompt.Turn);
    uint64_t v12 = v5;
    os_log_type_t v13 = v69;
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v12, &demangling cache variable for type metadata for Locale?);
    uint64_t v14 = *(void *)(v1 + 16);
    uint64_t v15 = v69[28];
    uint64_t v16 = v69[13];
    if (v14)
    {
      long long v81 = v11;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
      uint64_t v80 = v11;
      uint64_t v17 = (uint64_t *)(v15 + 56);
      uint64_t v63 = v16;
      do
      {
        uint64_t v18 = (unsigned char *)v13[15];
        uint64_t v75 = v13[14];
        int64_t v77 = v14;
        uint64_t v19 = v13[10];
        uint64_t v20 = v13[11];
        uint64_t v21 = *(v17 - 2);
        uint64_t v72 = *(v17 - 3);
        uint64_t v22 = *v17;
        uint64_t v70 = *(v17 - 1);
        v64(v20, 1, 1, v65);
        outlined init with copy of Prompt.Rendering?(v20, v19, &demangling cache variable for type metadata for Locale?);
        uint64_t v23 = (uint64_t)&v18[v67[5]];
        v64(v23, 1, 1, v65);
        uint64_t v24 = &v18[v67[9]];
        *uint64_t v18 = 3;
        uint64_t v25 = MEMORY[0x263F8EE78];
        *(void *)&v18[v67[6]] = MEMORY[0x263F8EE78];
        *(void *)&v18[v67[8]] = v25;
        *uint64_t v24 = v72;
        v24[1] = v21;
        void v24[2] = v70;
        v24[3] = v22;
        v18[v67[7]] = 0;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v19, v23, &demangling cache variable for type metadata for Locale?);
        outlined init with take of AnyTooling((uint64_t)v18, v75, type metadata accessor for Prompt.Turn);
        outlined destroy of GenerativeFunctionsInstrumentationEvent?(v20, &demangling cache variable for type metadata for Locale?);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v27 = v80;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v80 + 16) + 1, 1);
          uint64_t v27 = v81;
        }
        long long v29 = *(void *)(v27 + 16);
        uint64_t v28 = *(void *)(v27 + 24);
        os_log_type_t v13 = v69;
        if (v29 >= v28 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
          uint64_t v27 = v81;
        }
        uint64_t v80 = v27;
        long long v30 = v69[14];
        *(void *)(v27 + 16) = v29 + 1;
        uint64_t v31 = (*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
        outlined init with take of AnyTooling(v30, v27 + v31 + *(void *)(v63 + 72) * v29, type metadata accessor for Prompt.Turn);
        v17 += 4;
        uint64_t v14 = v77 - 1;
      }
      while (v77 != 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v31 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      uint64_t v80 = MEMORY[0x263F8EE78];
    }
    uint64_t v71 = v13[25];
    uint64_t v73 = v13[26];
    uint64_t v66 = v13[23];
    uint64_t v68 = v13[24];
    unint64_t v42 = (uint64_t *)v13[19];
    uint64_t v43 = v13[16];
    uint64_t v76 = v13[18];
    int v78 = v13[17];
    uint64_t v44 = v13[9];
    uint64_t v62 = v13[8];
    uint64_t v45 = v13[6];
    uint64_t v46 = v13[7];
    uint64_t v47 = (uint64_t *)v13[5];
    uint64_t v74 = v13[2];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Prompt.Turn>);
    long long v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_25F91CC30;
    outlined init with copy of AnyTooling(v43, v48 + v31, type metadata accessor for Prompt.Turn);
    specialized Array.append<A>(contentsOf:)(v80);
    uint64_t v49 = v48;
    PromptEnvelope.unseal()(*v47, v47[1], v47[2], v47[3], v44);
    uint64_t v50 = Prompt.turns()();
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    v51(v44, v45);
    specialized Array.append<A>(contentsOf:)(v49);
    static Prompt.transcript(turns:)(v50, v44);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v62, v44, v45);
    uint64_t v52 = specialized PromptEnvelope.init(sealing:)(v62);
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    v51(v44, v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of FinishReason(v66, v68);
    outlined consume of Data._Representation(v71, v73);
    char *v42 = v52;
    v42[1] = v54;
    uint64_t v59 = v69;
    v42[2] = v56;
    v42[3] = v58;
    outlined destroy of CompletePromptRequest(v43, type metadata accessor for Prompt.Turn);
    outlined init with take of AnyTooling((uint64_t)v42, v74, type metadata accessor for CompletePromptRequest);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56))(v74, 0, 1, v78);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    __swift_project_value_buffer(v32, (uint64_t)static Log.generator);
    uint64_t v33 = Logger.logObject.getter();
    int64_t v34 = static os_log_type_t.info.getter();
    uint64_t v35 = os_log_type_enabled(v33, v34);
    uint64_t v37 = v0[25];
    unint64_t v36 = v0[26];
    long long v39 = v0[23];
    uint64_t v38 = v0[24];
    if (v35)
    {
      long long v40 = v0[26];
      unint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v41 = 0;
      _os_log_impl(&dword_25F79F000, v33, v34, "Tools produced no results, exiting model call loop.", v41, 2u);
      MEMORY[0x261201C80](v41, -1, -1);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined consume of FinishReason(v39, v38);
      outlined consume of Data._Representation(v37, v40);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined consume of FinishReason(v39, v38);
      outlined consume of Data._Representation(v37, v36);
    }
    uint64_t v59 = v69;
    (*(void (**)(void, uint64_t, uint64_t, void))(v69[18] + 56))(v69[2], 1, 1, v69[17]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v60 = (uint64_t (*)(void))v59[1];
  return v60();
}

{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of FinishReason(v4, v3);
  outlined consume of Data._Representation(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t TokenGenerator.nextRequest(for:invoking:previousRequest:)(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 224) = a1;
  *(void *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = TokenGenerator.nextRequest(for:invoking:previousRequest:);
  }
  else {
    uint64_t v4 = TokenGenerator.nextRequest(for:invoking:previousRequest:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[46] = a7;
  v7[47] = v12;
  v7[44] = a5;
  v7[45] = a6;
  v7[42] = a1;
  v7[43] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Prompt.Rendering?);
  v7[48] = swift_task_alloc();
  v7[49] = swift_task_alloc();
  v7[50] = type metadata accessor for PromptCompletion.Aggregator(0);
  v7[51] = swift_task_alloc();
  v7[52] = type metadata accessor for PromptCompletion(0);
  v7[53] = swift_task_alloc();
  v7[54] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CompletePromptResponseElement?);
  v7[55] = swift_task_alloc();
  v7[56] = type metadata accessor for StreamingRequest(0);
  v7[57] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>);
  v7[58] = v8;
  v7[59] = *(void *)(v8 - 8);
  v7[60] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  v7[61] = swift_task_alloc();
  v7[62] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CompletePromptRequest?);
  v7[63] = swift_task_alloc();
  v7[64] = swift_task_alloc();
  v7[65] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for CompletePromptRequest(0);
  v7[66] = v9;
  v7[67] = *(void *)(v9 - 8);
  v7[68] = swift_task_alloc();
  v7[69] = swift_projectBox();
  v7[70] = swift_projectBox();
  v7[71] = swift_projectBox();
  return MEMORY[0x270FA2498](closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:), 0, 0);
}

uint64_t closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:)()
{
  uint64_t v1 = v0[69];
  uint64_t v2 = v0[67];
  uint64_t v35 = v0[66];
  uint64_t v3 = v0[65];
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  outlined init with copy of Prompt.Rendering?(v1, v3, &demangling cache variable for type metadata for CompletePromptRequest?);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  v0[72] = v4;
  v0[73] = (v2 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v4(v3, 1, v35) == 1)
  {
    uint64_t v5 = v0[42];
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[65], &demangling cache variable for type metadata for CompletePromptRequest?);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(void *)(v5 + 32) = 0;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v8 = v0[70];
    uint64_t v9 = v0[62];
    outlined init with take of AnyTooling(v0[65], v0[68], type metadata accessor for CompletePromptRequest);
    outlined init with copy of Prompt.Rendering?(v8, v9, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator);
    v0[74] = v10;
    uint64_t v11 = *(void *)(v10 - 8);
    v0[75] = v11;
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    LODWORD(v8) = v12(v9, 1, v10);
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v9, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
    if (v8 == 1)
    {
      uint64_t v33 = v0[70];
      uint64_t v13 = v0[68];
      uint64_t v31 = v0[61];
      uint64_t v14 = v0[60];
      uint64_t v32 = v0[59];
      int64_t v34 = v12;
      uint64_t v15 = v0[57];
      uint64_t v29 = v0[46];
      uint64_t v30 = v0[58];
      uint64_t v26 = v0[44];
      uint64_t v27 = v0[45];
      uint64_t v16 = (void *)v0[43];
      uint64_t v17 = v16[15];
      uint64_t v28 = v16[16];
      __swift_project_boxed_opaque_existential_1(v16 + 12, v17);
      outlined init with copy of AnyTooling(v13, v15, type metadata accessor for CompletePromptRequest);
      swift_storeEnumTagMultiPayload();
      uint64_t v18 = type metadata accessor for CompletePromptResponseElement(0);
      uint64_t v19 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
      uint64_t v20 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
      InferenceSessionProtocol.streamingRequest<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)(v26, v27, v29, v17, v18, v28, v14, v19, v20);
      uint64_t v21 = v15;
      uint64_t v12 = v34;
      outlined destroy of CompletePromptRequest(v21, type metadata accessor for StreamingRequest);
      MEMORY[0x261200F50](v30);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v14, v30);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v31, 0, 1, v10);
      outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v31, v33, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
    }
    uint64_t v22 = v0[70];
    swift_beginAccess();
    uint64_t v23 = v12(v22, 1, v10);
    if (v23 == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v25 = (void *)swift_task_alloc();
      v0[76] = v25;
      *uint64_t v25 = v0;
      v25[1] = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
      uint64_t v23 = v0[55];
      uint64_t v24 = v10;
    }
    return MEMORY[0x270FA2100](v23, v24);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 616) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  Class isa;
  id v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t (*v54)(void);
  uint64_t result;
  uint64_t v56;
  void *v57;
  Class v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  int64_t v89;
  uint64_t v90;
  void *v91;
  id *v92;
  uint64_t *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;

  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = type metadata accessor for CompletePromptResponseElement(0);
  uint64_t v94 = (void *)v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) != 1)
  {
    uint64_t v52 = *(void *)(v0 + 544);
    uint64_t v53 = *(void **)(v0 + 336);
    PromptCompletionStreamElementEnvelope.Envelope.unseal()((uint64_t *)(v0 + 16));
    outlined destroy of CompletePromptRequest(v1, type metadata accessor for CompletePromptResponseElement);
    outlined init with take of AsyncIteratorProtocol((long long *)(v0 + 16), (uint64_t)v53);
    swift_beginAccess();
    PromptCompletion.Aggregator.receive(event:)(v53);
    swift_endAccess();
    outlined destroy of CompletePromptRequest(v52, type metadata accessor for CompletePromptRequest);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
    return v54();
  }
  uint64_t v3 = *(void *)(v0 + 600);
  uint64_t v4 = *(void *)(v0 + 592);
  uint64_t v5 = *(void *)(v0 + 568);
  uint64_t v6 = *(void *)(v0 + 560);
  unint64_t v7 = *(void *)(v0 + 488);
  uint64_t v8 = *(uint64_t **)(v0 + 408);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v1, &demangling cache variable for type metadata for CompletePromptResponseElement?);
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0 + 16, &demangling cache variable for type metadata for PromptCompletionEvent?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v7, 1, 1, v4);
  outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v7, v6, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  outlined init with copy of AnyTooling(v5, (uint64_t)v8, type metadata accessor for PromptCompletion.Aggregator);
  uint64_t v9 = *v8;
  long long v81 = v8[1];
  uint64_t v10 = v8[2];
  uint64_t v11 = v8[5];
  uint64_t v12 = v8[6];
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v14 = MEMORY[0x263F8EE58];
  long long v83 = v11;
  long long v84 = v10;
  long long v82 = v9;
  if (!v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Swift::String v100 = MEMORY[0x263F8EE78];
    goto LABEL_44;
  }
  long long v85 = (void *)(v0 + 56);
  uint64_t v92 = (id *)(v0 + 312);
  *(void *)(v0 + 328) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v93 = (uint64_t *)(v0 + 328);
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v13, 0);
  uint64_t v15 = *(void *)(v0 + 328);
  uint64_t v16 = v14;
  uint64_t v17 = specialized Dictionary.startIndex.getter(v12);
  uint64_t v19 = v18;
  uint64_t v20 = v12 + 64;
  uint64_t v21 = self;
  uint64_t v22 = 0;
  uint64_t v23 = *(unsigned char *)(v12 + 32);
  int v88 = v19;
  uint64_t v89 = v13;
  uint64_t v80 = v12 + 88;
  uint64_t v91 = v21;
  uint64_t v90 = v12 + 64;
  do
  {
    if ((v17 & 0x8000000000000000) != 0 || (uint64_t)v17 >= 1 << v23)
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      int v78 = v21;
      outlined consume of FinishReason?(v10, v16);
      swift_bridgeObjectRelease();
      _convertNSErrorToError(_:)();

      swift_willThrow();
      __break(1u);
    }
    if ((*(void *)(v20 + 8 * (v17 >> 6)) & (1 << v17)) == 0) {
      goto LABEL_49;
    }
    if (*(_DWORD *)(v12 + 36) != v19) {
      goto LABEL_50;
    }
    uint64_t v98 = v17 >> 6;
    uint64_t v97 = v19;
    uint64_t v99 = v15;
    uint64_t v27 = *(void *)(v12 + 56) + 56 * v17;
    uint64_t v28 = *(void *)(v27 + 16);
    uint64_t v29 = *(void *)(v27 + 24);
    uint64_t v16 = *(void *)(v27 + 32);
    uint64_t v10 = *(void *)(v27 + 40);
    v101 = (void *)MEMORY[0x263F8EE78];
    long long v103 = MEMORY[0x263F8EE78];
    if ((*(unsigned char *)(v27 + 48) & 1) == 0)
    {
      uint64_t v95 = *(void *)(v27 + 24);
      uint64_t v30 = *(void *)(v27 + 8);
      uint64_t v31 = *(void *)(v30 + 16);
      long long v103 = *(void *)v27;
      if (v31)
      {
        long long v86 = *(void *)(v27 + 16);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Prompt.ToolCall>);
        uint64_t v32 = (void *)swift_allocObject();
        uint64_t v33 = _swift_stdlib_malloc_size(v32);
        int64_t v34 = v33 - 32;
        if (v33 < 32) {
          int64_t v34 = v33 + 31;
        }
        v32[2] = v31;
        v32[3] = 2 * (v34 >> 6);
        v101 = v32;
        long long v87 = specialized Sequence._copySequenceContents(initializing:)(v85, v32 + 4, v31, v30);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v21 = (id)outlined consume of [String : Any].Iterator._Variant();
        if (v87 != (void *)v31) {
          goto LABEL_54;
        }
        swift_bridgeObjectRelease();
        uint64_t v28 = v86;
      }
      else
      {
        swift_bridgeObjectRetain();
        v101 = (void *)MEMORY[0x263F8EE78];
      }
      uint64_t v29 = v95;
    }
    unint64_t v96 = v22;
    uint64_t v35 = v12;
    if (v16 == 3) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = v29;
    }
    if (v16 == 3) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v16;
    }
    uint64_t v38 = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of FinishReason?(v29, v16);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    *uint64_t v92 = 0;
    uint64_t v10 = v29;
    long long v40 = objc_msgSend(v91, sel_dataWithJSONObject_options_error_, isa, 0, v92);

    uint64_t v21 = *v92;
    if (!v40) {
      goto LABEL_55;
    }
    uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v42 = v41;

    uint64_t v15 = v99;
    *uint64_t v93 = v99;
    uint64_t v44 = *(void *)(v99 + 16);
    uint64_t v43 = *(void *)(v99 + 24);
    uint64_t v10 = v44 + 1;
    if (v44 >= v43 >> 1)
    {
      uint64_t v21 = (id)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v43 > 1, v44 + 1, 1);
      uint64_t v15 = *v93;
    }
    *(void *)(v15 + 16) = v10;
    uint64_t v45 = (void *)(v15 + 56 * v44);
    v45[4] = v103;
    v45[5] = v101;
    v45[6] = v38;
    uint64_t v45[7] = v36;
    v45[8] = v37;
    v45[9] = v16;
    v45[10] = v42;
    uint64_t v23 = *(unsigned char *)(v35 + 32);
    uint64_t v24 = 1 << v23;
    if ((uint64_t)v17 >= 1 << v23) {
      goto LABEL_51;
    }
    uint64_t v12 = v35;
    uint64_t v20 = v90;
    uint64_t v46 = v17 >> 6;
    uint64_t v47 = *(void *)(v90 + 8 * v98);
    if ((v47 & (1 << v17)) == 0) {
      goto LABEL_52;
    }
    if (*(_DWORD *)(v12 + 36) != v97) {
      goto LABEL_53;
    }
    long long v48 = v47 & (-2 << (v17 & 0x3F));
    if (v48)
    {
      uint64_t v24 = __clz(__rbit64(v48)) | v17 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v25 = v89;
      uint64_t v26 = v96;
      goto LABEL_5;
    }
    uint64_t v49 = v98 + 1;
    uint64_t v50 = (v24 + 63) >> 6;
    uint64_t v25 = v89;
    uint64_t v26 = v96;
    if (v98 + 1 < v50)
    {
      uint64_t v51 = *(void *)(v90 + 8 * v49);
      if (v51) {
        goto LABEL_33;
      }
      uint64_t v49 = v98 + 2;
      if (v98 + 2 < v50)
      {
        uint64_t v51 = *(void *)(v90 + 8 * v49);
        if (v51)
        {
LABEL_33:
          uint64_t v24 = __clz(__rbit64(v51)) + (v49 << 6);
          goto LABEL_5;
        }
        while (v50 - 3 != v46)
        {
          uint64_t v51 = *(void *)(v80 + 8 * v46++);
          if (v51)
          {
            uint64_t v49 = v46 + 2;
            goto LABEL_33;
          }
        }
      }
    }
LABEL_5:
    uint64_t v22 = v26 + 1;
    uint64_t v19 = v88;
    uint64_t v17 = v24;
  }
  while (v22 != v25);
  Swift::String v100 = v15;
  swift_bridgeObjectRelease();
LABEL_44:
  uint64_t v56 = v94[51];
  char v102 = *(void *)(v56 + 32);
  unint64_t v104 = *(void *)(v56 + 24);
  outlined init with copy of Prompt.Rendering?(v56 + *(int *)(v94[50] + 32), v94[49], &demangling cache variable for type metadata for Prompt.Rendering?);
  uint64_t v57 = self;
  swift_bridgeObjectRetain();
  uint64_t v58 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v94[40] = 0;
  uint64_t v59 = objc_msgSend(v57, sel_dataWithJSONObject_options_error_, v58, 0, v94 + 40);

  uint64_t v60 = (void *)v94[40];
  if (v59)
  {
    uint64_t v62 = (void *)v94[53];
    uint64_t v61 = v94[54];
    uint64_t v63 = v94[51];
    uint64_t v64 = v94[52];
    uint64_t v66 = v94[48];
    uint64_t v65 = v94[49];
    unint64_t v67 = v60;
    uint64_t v68 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v70 = v69;

    outlined init with copy of Prompt.Rendering?(v65, v66, &demangling cache variable for type metadata for Prompt.Rendering?);
    uint64_t v71 = (uint64_t)v62 + *(int *)(v64 + 36);
    uint64_t v72 = type metadata accessor for Prompt.Rendering();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v71, 1, 1, v72);
    *uint64_t v62 = v82;
    v62[1] = v81;
    v62[2] = v84;
    v62[3] = v83;
    v62[4] = v100;
    v62[5] = v104;
    v62[6] = v102;
    v62[7] = v68;
    v62[8] = v70;
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v66, v71, &demangling cache variable for type metadata for Prompt.Rendering?);
    outlined init with take of AnyTooling((uint64_t)v62, v61, type metadata accessor for PromptCompletion);
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v65, &demangling cache variable for type metadata for Prompt.Rendering?);
    outlined destroy of CompletePromptRequest(v63, type metadata accessor for PromptCompletion.Aggregator);
    uint64_t v73 = (void *)swift_task_alloc();
    v94[78] = v73;
    *uint64_t v73 = v94;
    v73[1] = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
    uint64_t v74 = v94[68];
    uint64_t v75 = v94[64];
    uint64_t v76 = v94[54];
    int64_t v77 = v94[47];
    return TokenGenerator.nextRequest(for:invoking:previousRequest:)(v75, v76, v77, v74);
  }
  else
  {
    uint64_t v79 = v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    uint64_t result = swift_willThrow();
    __break(1u);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 632) = v0;
  swift_task_dealloc();
  outlined destroy of CompletePromptRequest(*(void *)(v2 + 432), type metadata accessor for PromptCompletion);
  if (v0) {
    uint64_t v3 = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  else {
    uint64_t v3 = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  unsigned int (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;

  uint64_t v1 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[72];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[66];
  uint64_t v5 = v0[63];
  uint64_t v4 = v0[64];
  outlined destroy of CompletePromptRequest(v0[68], type metadata accessor for CompletePromptRequest);
  outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v4, v2, &demangling cache variable for type metadata for CompletePromptRequest?);
  outlined init with copy of Prompt.Rendering?(v2, v5, &demangling cache variable for type metadata for CompletePromptRequest?);
  if (v1(v5, 1, v3) == 1)
  {
    uint64_t v6 = v0 + 63;
LABEL_5:
    uint64_t v11 = v0[42];
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(*v6, &demangling cache variable for type metadata for CompletePromptRequest?);
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    *(void *)(v11 + 32) = 0;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  unint64_t v7 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[72];
  uint64_t v8 = v0[69];
  uint64_t v9 = v0[66];
  uint64_t v10 = v0[65];
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[63], &demangling cache variable for type metadata for CompletePromptRequest?);
  outlined init with copy of Prompt.Rendering?(v8, v10, &demangling cache variable for type metadata for CompletePromptRequest?);
  if (v7(v10, 1, v9) == 1)
  {
    uint64_t v6 = v0 + 65;
    goto LABEL_5;
  }
  uint64_t v14 = v0[70];
  uint64_t v15 = v0[62];
  outlined init with take of AnyTooling(v0[65], v0[68], type metadata accessor for CompletePromptRequest);
  outlined init with copy of Prompt.Rendering?(v14, v15, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator);
  v0[74] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v0[75] = v17;
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v14) = v18(v15, 1, v16);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v15, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  if (v14 == 1)
  {
    long long v39 = v0[70];
    uint64_t v19 = v0[68];
    uint64_t v37 = v0[61];
    uint64_t v20 = v0[60];
    uint64_t v38 = v0[59];
    long long v40 = v18;
    uint64_t v21 = v0[57];
    uint64_t v35 = v0[46];
    uint64_t v36 = v0[58];
    uint64_t v32 = v0[44];
    uint64_t v33 = v0[45];
    uint64_t v22 = (void *)v0[43];
    uint64_t v23 = v22[15];
    int64_t v34 = v22[16];
    __swift_project_boxed_opaque_existential_1(v22 + 12, v23);
    outlined init with copy of AnyTooling(v19, v21, type metadata accessor for CompletePromptRequest);
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = type metadata accessor for CompletePromptResponseElement(0);
    uint64_t v25 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
    uint64_t v26 = lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type CompletePromptResponseElement and conformance CompletePromptResponseElement, (void (*)(uint64_t))type metadata accessor for CompletePromptResponseElement);
    InferenceSessionProtocol.streamingRequest<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)(v32, v33, v35, v23, v24, v34, v20, v25, v26);
    uint64_t v27 = v21;
    uint64_t v18 = v40;
    outlined destroy of CompletePromptRequest(v27, type metadata accessor for StreamingRequest);
    MEMORY[0x261200F50](v36);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v20, v36);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v37, 0, 1, v16);
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v37, v39, &demangling cache variable for type metadata for AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?);
  }
  uint64_t v28 = v0[70];
  swift_beginAccess();
  uint64_t v29 = v18(v28, 1, v16);
  if (v29 == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v31 = (void *)swift_task_alloc();
    v0[76] = v31;
    *uint64_t v31 = v0;
    v31[1] = closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:);
    uint64_t v29 = v0[55];
    uint64_t v30 = v16;
  }
  return MEMORY[0x270FA2100](v29, v30);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 544);
  swift_endAccess();
  outlined destroy of CompletePromptRequest(v1, type metadata accessor for CompletePromptRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of CompletePromptRequest(*(void *)(v0 + 544), type metadata accessor for CompletePromptRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized TokenStream.init<A>(streamResponse:bufferResponse:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v38 = a1;
  uint64_t v41 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v37 = (char *)&v34 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v35 = type metadata accessor for PromptCompletionStream(0) - 8;
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v18(v16, a1, v5);
  v18(v12, v16, v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator?);
  uint64_t v19 = swift_allocBox();
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v18(v9, v12, v5);
  unint64_t v23 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v19;
  unint64_t v25 = v24 + v23;
  uint64_t v26 = *(void (**)(unint64_t, char *, uint64_t))(v6 + 32);
  v26(v25, v9, v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  uint64_t v27 = v37;
  AsyncThrowingStream.init<>(unfolding:)();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v6 + 8);
  v28(v12, v5);
  swift_release();
  v28(v16, v5);
  uint64_t v29 = (uint64_t)v36;
  v26((unint64_t)v36, v27, v5);
  uint64_t v30 = (void *)(v29 + *(int *)(v35 + 28));
  uint64_t v31 = v38;
  uint64_t v32 = v40;
  void *v30 = v39;
  v30[1] = v32;
  v28(v31, v5);
  return outlined init with take of AnyTooling(v29, v41, type metadata accessor for PromptCompletionStream);
}

{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v34 = a1;
  uint64_t v40 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - v15;
  uint64_t v32 = type metadata accessor for PromptCompletionStream(0) - 8;
  MEMORY[0x270FA5388](v32);
  uint64_t v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v16, (uint64_t)a1, v7);
  v18(v14, (uint64_t)v16, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator?);
  uint64_t v19 = swift_allocBox();
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v18(v11, (uint64_t)v14, v7);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v24 + v23, v11, v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  unint64_t v25 = v35;
  AsyncThrowingStream.init<>(unfolding:)();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v14, v7);
  swift_release();
  v26(v16, v7);
  uint64_t v27 = (uint64_t)v33;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v25, v37);
  uint64_t v28 = (void *)(v27 + *(int *)(v32 + 28));
  uint64_t v29 = v39;
  *uint64_t v28 = v38;
  v28[1] = v29;
  v26(v34, v7);
  return outlined init with take of AnyTooling(v27, v40, type metadata accessor for PromptCompletionStream);
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed CompletePromptResponseElement) -> (@out PromptCompletionEvent)(uint64_t *a1)
{
  PromptCompletionStreamElementEnvelope.Envelope.unseal()(a1);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return thunk for @escaping @callee_guaranteed (@in_guaranteed CompletePromptResponseElement) -> (@out PromptCompletionEvent)specialized (v2);
}

uint64_t closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[50] = a5;
  v6[51] = a6;
  v6[48] = a3;
  v6[49] = a4;
  v6[46] = a1;
  v6[47] = a2;
  v6[52] = type metadata accessor for OneShotRequest(0);
  v6[53] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:), 0, 0);
}

uint64_t closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:)()
{
  uint64_t v1 = v0[53];
  uint64_t v2 = v0[50];
  uint64_t v3 = v0[47];
  uint64_t v4 = *(void *)(v3 + 120);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 96), v4);
  outlined init with copy of AnyTooling(v2, v1, type metadata accessor for CompletePromptTemplateRequest);
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[54] = v5;
  lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
  lazy protocol witness table accessor for type CompletePromptResponse and conformance CompletePromptResponse();
  void *v5 = v0;
  v5[1] = closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:);
  uint64_t v6 = v0[53];
  uint64_t v7 = v0[51];
  uint64_t v8 = v0[48];
  uint64_t v9 = v0[49];
  return InferenceSessionProtocol.request<A>(loggingIdentifier:payload:requiredAssets:expectedResponse:)((uint64_t)(v0 + 2), v8, v9, v6, v7, (uint64_t)&type metadata for CompletePromptResponse, v4, (uint64_t)&type metadata for CompletePromptResponse);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  outlined destroy of CompletePromptRequest(*(void *)(v2 + 424), type metadata accessor for OneShotRequest);
  if (v0) {
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:);
  }
  else {
    uint64_t v3 = closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  long long v1;
  long long v2;
  long long v3;
  long long v4;
  long long v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v1 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 320) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 336) = v1;
  *(_OWORD *)(v0 + 352) = *(_OWORD *)(v0 + 176);
  uint64_t v2 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 256) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 272) = v2;
  uint64_t v3 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 288) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 304) = v3;
  uint64_t v4 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 + 208) = v4;
  uint64_t v5 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 224) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 240) = v5;
  PromptCompletionEnvelope.unseal()(*(void **)(v0 + 368));
  outlined release of CompletePromptResponse((void *)(v0 + 192));
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t closure #1 in AnyTooling.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[19] = type metadata accessor for TokenGenerationError(0);
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in AnyTooling.init(_:), 0, 0);
}

uint64_t closure #1 in AnyTooling.init(_:)()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v3 = v1[3];
  uint64_t v2 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  v0[21] = swift_getAssociatedTypeWitness();
  uint64_t v4 = type metadata accessor for Optional();
  v0[22] = v4;
  v0[23] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v0[24] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[25] = v6;
  *uint64_t v6 = v0;
  v6[1] = closure #1 in AnyTooling.init(_:);
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[17];
  return MEMORY[0x270F2F470](v5, v7, v8, v3, v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in AnyTooling.init(_:);
  }
  else {
    uint64_t v2 = closure #1 in AnyTooling.init(_:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1Tm;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;

  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 184) + 8))(v1, *(void *)(v0 + 176));
    swift_task_dealloc();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
LABEL_5:
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v7(v4, v5);
  }
  *(void *)(v0 + 72) = v2;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(v0 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1Tm, v1, v2);
  swift_task_dealloc();
  outlined init with take of Any((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 16));
  outlined init with copy of Any(v0 + 16, v0 + 80);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 120);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    goto LABEL_5;
  }
  if (one-time initialization token for generator != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Log.generator);
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25F79F000, v10, v11, "Only tools that output strings are currently supported.", v12, 2u);
    MEMORY[0x261201C80](v12, -1, -1);
  }
  uint64_t v13 = *(uint64_t **)(v0 + 160);
  uint64_t v14 = *(void **)(v0 + 144);

  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  *uint64_t v13 = dispatch thunk of Tooling.name.getter();
  v13[1] = v15;
  v13[2] = 0xD000000000000037;
  v13[3] = 0x800000025F92E010;
  v13[4] = 0;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
  swift_allocError();
  outlined init with copy of AnyTooling((uint64_t)v13, v16, type metadata accessor for TokenGenerationError);
  swift_willThrow();
  outlined destroy of CompletePromptRequest((uint64_t)v13, type metadata accessor for TokenGenerationError);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AnyTooling.init(name:usageDescription:argumentsSchema:invoke:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  uint64_t v12 = type metadata accessor for AnyTooling();
  uint64_t v13 = (char *)a8 + *(int *)(v12 + 24);
  uint64_t v14 = type metadata accessor for GenerationSchema();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a5, v14);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a6;
  *(void *)(result + 24) = a7;
  uint64_t v16 = (void *)((char *)a8 + *(int *)(v12 + 28));
  void *v16 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error);
  v16[1] = result;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error);
  return v8(a1, a2);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v9(a1, a2);
  }
}

uint64_t type metadata accessor for AnyTooling()
{
  uint64_t result = type metadata singleton initialization cache for AnyTooling;
  if (!type metadata singleton initialization cache for AnyTooling) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

{
  uint64_t *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  Swift::Int *v14;
  Swift::Int v15;
  uint64_t v17;
  void *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ModelCatalog.AssetKey>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

{
  uint64_t *v4;
  uint64_t *v5;
  Swift::Int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  Swift::Int *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ModelCatalog.AssetKey>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ModelCatalog.AssetKey>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain_n();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t outlined copy of RequestMetadata?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SessionConfiguration?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a4 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v10 = 0;
    uint64_t v8 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v28;
    result[2] = ~v5;
    result[3] = v10;
    result[4] = v7;
    return (void *)v8;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
    int64_t v10 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v9 = a2;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v26 = result;
  int64_t v10 = 0;
  uint64_t v11 = 0;
  int64_t v27 = (unint64_t)(63 - v5) >> 6;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v12 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v13 = v12 | (v10 << 6);
  while (1)
  {
    ++v11;
    unint64_t v17 = (void *)(*(void *)(a4 + 56) + (v13 << 6));
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = v17[4];
    uint64_t v22 = v17[5];
    uint64_t v23 = v17[6];
    unint64_t v24 = v17[7];
    *uint64_t v9 = *v17;
    v9[1] = v18;
    v9[2] = v19;
    v9[3] = v20;
    v9[4] = v21;
    v9[5] = v22;
    v9[6] = v23;
    v9[7] = v24;
    if (v11 == v8)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of Data?(v23, v24);
      goto LABEL_38;
    }
    v9 += 8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)outlined copy of Data?(v23, v24);
    if (v7) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v14 >= v27) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    if (!v15)
    {
      v10 += 2;
      if (v14 + 1 >= v27)
      {
        unint64_t v7 = 0;
        int64_t v10 = v14;
      }
      else
      {
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (v15) {
          goto LABEL_14;
        }
        int64_t v16 = v14 + 2;
        if (v14 + 2 >= v27) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v16);
        if (v15)
        {
LABEL_17:
          int64_t v14 = v16;
          goto LABEL_18;
        }
        int64_t v10 = v14 + 3;
        if (v14 + 3 < v27)
        {
          unint64_t v15 = *(void *)(v28 + 8 * v10);
          if (v15)
          {
LABEL_14:
            int64_t v14 = v10;
            goto LABEL_18;
          }
          int64_t v16 = v14 + 4;
          if (v14 + 4 >= v27)
          {
LABEL_33:
            unint64_t v7 = 0;
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v28 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v14 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v27)
              {
                unint64_t v7 = 0;
                int64_t v10 = v27 - 1;
                goto LABEL_37;
              }
              unint64_t v15 = *(void *)(v28 + 8 * v14);
              ++v16;
              if (v15) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v7 = 0;
        int64_t v10 = v14 + 2;
      }
LABEL_37:
      uint64_t v8 = v11;
LABEL_38:
      uint64_t v5 = v25;
      uint64_t result = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v14 << 6);
    int64_t v10 = v14;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

{
  uint64_t v2;
  uint64_t result;
  Swift::Int *v4;
  Swift::Int v5;
  Swift::Int v6;
  Swift::Int v7;
  uint64_t v8;

  uint64_t v2 = *(void *)(a1 + 16);
  lazy protocol witness table accessor for type ModelCatalog.AssetKey and conformance ModelCatalog.AssetKey();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t outlined consume of SessionConfiguration?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t partial apply for closure #1 in TokenGenerator.register(documents:)(uint64_t a1, uint64_t a2, void *a3)
{
  Swift::Int v5 = *(void **)(v3 + 16);
  uint64_t v6 = String.utf8CString.getter();
  xpc_dictionary_set_value(v5, (const char *)(v6 + 32), a3);
  return swift_release();
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    unint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    a2(v14, v15, v16);
    swift_unknownObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25F90B590()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<RegisterDocumentResponseElement, Error>, DocumentRegistration>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #3 in TokenGenerator.register(documents:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<RegisterDocumentResponseElement, Error>, DocumentRegistration>)
                 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *unint64_t v12 = v2;
  v12[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #3 in TokenGenerator.register(documents:)(a1, v7, v8, v9, v10, v11);
}

uint64_t partial apply for closure #1 in closure #4 in TokenGenerator.register(documents:)(uint64_t a1)
{
  return closure #1 in closure #4 in TokenGenerator.register(documents:)(a1, v1);
}

uint64_t sub_25F90B7CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = dispatch thunk of InferenceSessionProtocol.request(loggingIdentifier:data:xpcData:requiredAssets:);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error)
                                                       + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed String) -> (@owned String, @error @owned Error));
  return v8(a1, a2, v6);
}

uint64_t type metadata accessor for TokenGenerator()
{
  return self;
}

uint64_t method lookup function for TokenGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenGenerator);
}

uint64_t dispatch thunk of TokenGenerator.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TokenGenerator.__allocating_init(session:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TokenGenerator.__allocating_init(session:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t *initializeBufferWithCopyOfBuffer for AnyTooling(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for GenerationSchema();
    unint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 28);
    uint64_t v15 = (uint64_t *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    if (*v16)
    {
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    }
  }
  return v4;
}

uint64_t destroy for AnyTooling(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for GenerationSchema();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  if (*(void *)(a1 + *(int *)(a2 + 28)))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for AnyTooling(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for GenerationSchema();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  if (*v15)
  {
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  return a1;
}

void *assignWithCopy for AnyTooling(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for GenerationSchema();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)((char *)a1 + v10);
  uint64_t v14 = *(void *)((char *)a2 + v10);
  if (!v13)
  {
    if (v14)
    {
      uint64_t v16 = *((void *)v12 + 1);
      *uint64_t v11 = v14;
      v11[1] = v16;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v15 = *((void *)v12 + 1);
  *uint64_t v11 = v14;
  v11[1] = v15;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for AnyTooling(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for GenerationSchema();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    *uint64_t v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  return a1;
}

void *assignWithTake for AnyTooling(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for GenerationSchema();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = *(void *)((char *)a1 + v12);
  uint64_t v16 = *v14;
  if (!v15)
  {
    if (v16)
    {
      uint64_t v18 = v14[1];
      *uint64_t v13 = v16;
      v13[1] = v18;
      return a1;
    }
LABEL_7:
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    return a1;
  }
  if (!v16)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v17 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v17;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyTooling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F90BEE4);
}

uint64_t sub_25F90BEE4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for GenerationSchema();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AnyTooling(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F90BFA8);
}

uint64_t sub_25F90BFA8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for GenerationSchema();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for AnyTooling()
{
  uint64_t result = type metadata accessor for GenerationSchema();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25F90C0F0()
{
  return lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<DocumentRegistration, Error> and conformance AsyncThrowingStream<A, B>, &demangling cache variable for type metadata for AsyncThrowingStream<DocumentRegistration, Error>);
}

uint64_t lazy protocol witness table accessor for type Prompt and conformance Prompt(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25F90C21C()
{
  unint64_t v1 = (int *)type metadata accessor for CompletePromptTemplateRequest(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = v5 + v1[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for PromptTemplateInfoEnvelope(0) + 24);
  uint64_t v8 = type metadata accessor for Locale();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v5 + v1[8] + 8) >= 4uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + v1[10];
  uint64_t v11 = type metadata accessor for Constraints(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRelease();
    }
    else if (!EnumCaseMultiPayload)
    {
      uint64_t v13 = type metadata accessor for GenerationSchema();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v10, v13);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t partial apply for closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for CompletePromptTemplateRequest(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in TokenGenerator.handleCompletePromptTemplateRequest(request:)(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_25F90C5FC()
{
  return objectdestroy_293Tm(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed CompletePromptResponseElement) -> (@out PromptCompletionEvent)specialized (uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25F90C750()
{
  uint64_t v1 = type metadata accessor for CompletePromptRequest(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = type metadata accessor for Constraints(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRelease();
    }
    else if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = type metadata accessor for GenerationSchema();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v5, v8);
    }
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + *(int *)(v1 + 32) + 8) >= 4uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((((((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 8, v2 | 7);
}

uint64_t partial apply for closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for CompletePromptRequest(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v7);
  uint64_t v12 = *(void *)(v1 + v7 + 8);
  uint64_t v13 = *(void *)(v1 + v8);
  uint64_t v14 = *(void *)(v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = partial apply for closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in TokenGenerator.handleCompletePromptRequest(request:tools:)(a1, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_25F90CAD8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t partial apply for closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #2 in TokenGenerator.handleCompletePromptRequest(request:tools:)(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_25F90CC2C()
{
  return objectdestroy_293Tm(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
}

uint64_t specialized TokenGenerator.invoke(tooling:calls:)(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  v2[5] = type metadata accessor for TokenGenerationError(0);
  v2[6] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AnyTooling();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized TokenGenerator.invoke(tooling:calls:), 0, 0);
}

{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v4 = (void *)*v3;
  v4[30] = a1;
  v4[31] = a2;
  v4[32] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = specialized TokenGenerator.invoke(tooling:calls:);
  }
  else {
    uint64_t v5 = specialized TokenGenerator.invoke(tooling:calls:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized TokenGenerator.invoke(tooling:calls:)()
{
  uint64_t v60 = v0;
  uint64_t v1 = v0[4];
  v0[14] = v0;
  uint64_t v2 = *(void *)(v1 + 16);
  v0[15] = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v0[3] + 16);
    v0[16] = v3;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263F8EE78];
    while (1)
    {
      v0[17] = v4;
      v0[18] = v5;
      uint64_t v6 = (void *)(v1 + (v4 << 6));
      v0[19] = v6[4];
      v0[20] = v6[5];
      uint64_t v7 = v6[6];
      v0[21] = v7;
      uint64_t v8 = (void *)v6[7];
      v0[22] = v8;
      uint64_t v9 = v6[8];
      uint64_t v10 = v6[9];
      v0[23] = v10;
      uint64_t v11 = v6[10];
      v0[24] = v11;
      unint64_t v12 = v6[11];
      v0[25] = v12;
      uint64_t v57 = v10;
      if (!v3) {
        break;
      }
      uint64_t v55 = v9;
      uint64_t v13 = v0[8];
      uint64_t v14 = v0[3] + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of Data?(v11, v12);
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)(v13 + 72);
      while (1)
      {
        uint64_t v17 = (void *)v0[11];
        outlined init with copy of AnyTooling(v14, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        BOOL v18 = *v17 == v7 && v17[1] == (void)v8;
        if (v18 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          break;
        }
        ++v15;
        uint64_t v19 = v0[16];
        outlined destroy of CompletePromptRequest(v0[11], (uint64_t (*)(void))type metadata accessor for AnyTooling);
        v14 += v16;
        if (v15 == v19)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v43 = v0;
          goto LABEL_22;
        }
      }
      uint64_t v21 = v0[12];
      uint64_t v20 = v0[13];
      uint64_t v22 = v0[11];
      swift_bridgeObjectRelease();
      outlined init with take of AnyTooling(v22, v21, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      outlined init with take of AnyTooling(v21, v20, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      if (one-time initialization token for generator != -1) {
        swift_once();
      }
      uint64_t v23 = v0[13];
      uint64_t v24 = v0[10];
      uint64_t v25 = type metadata accessor for Logger();
      v0[26] = __swift_project_value_buffer(v25, (uint64_t)static Log.generator);
      outlined init with copy of AnyTooling(v23, v24, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      unint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.info.getter();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v29 = v0[10];
      if (v28)
      {
        uint64_t v30 = v0[9];
        uint64_t v31 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        uint64_t v58 = v32;
        *(_DWORD *)uint64_t v31 = 136315138;
        outlined init with copy of AnyTooling(v29, v30, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        uint64_t v33 = String.init<A>(describing:)();
        *(void *)(v31 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v58);
        swift_bridgeObjectRelease();
        outlined destroy of CompletePromptRequest(v29, (uint64_t (*)(void))type metadata accessor for AnyTooling);
        _os_log_impl(&dword_25F79F000, v26, v27, "Invoking tool: %s", (uint8_t *)v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261201C80](v32, -1, -1);
        MEMORY[0x261201C80](v31, -1, -1);
      }
      else
      {
        outlined destroy of CompletePromptRequest(v0[10], (uint64_t (*)(void))type metadata accessor for AnyTooling);
      }

      uint64_t v35 = (int **)(v0[13] + *(int *)(v0[7] + 28));
      uint64_t v36 = *v35;
      v0[27] = *v35;
      v0[28] = v35[1];
      if (v36)
      {
        uint64_t v56 = (uint64_t (*)(uint64_t, uint64_t))((char *)v36 + *v36);
        swift_retain();
        uint64_t v54 = (void *)swift_task_alloc();
        v0[29] = v54;
        *uint64_t v54 = v0;
        v54[1] = specialized TokenGenerator.invoke(tooling:calls:);
        return v56(v55, v57);
      }
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_25F79F000, v37, v38, "Tool returned no response. Skipping response for this tool.", v39, 2u);
        MEMORY[0x261201C80](v39, -1, -1);
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v0[18];
      uint64_t v40 = v0[15];
      uint64_t v41 = v0[13];
      uint64_t v42 = v0[17] + 1;
      outlined consume of Data?(v0[24], v0[25]);
      outlined destroy of CompletePromptRequest(v41, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      if (v42 == v40)
      {
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      uint64_t v3 = v0[16];
      uint64_t v4 = v0[17] + 1;
      uint64_t v1 = v0[4];
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v11, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = (void *)v0[14];
LABEL_22:
    uint64_t v44 = (uint64_t *)v0[6];
    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
    _StringGuts.grow(_:)(57);
    v45._object = (void *)0x800000025F92DF60;
    v45._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v45);
    swift_bridgeObjectRetain();
    v46._countAndFlagsBits = v7;
    v46._object = v8;
    String.append(_:)(v46);
    swift_bridgeObjectRelease();
    v47._countAndFlagsBits = 0xD000000000000020;
    v47._object = (void *)0x800000025F92DF80;
    String.append(_:)(v47);
    uint64_t v48 = v58;
    unint64_t v49 = v59;
    *uint64_t v44 = v7;
    v44[1] = (uint64_t)v8;
    v44[2] = v48;
    _OWORD v44[3] = v49;
    v44[4] = 0;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
    swift_allocError();
    outlined init with copy of AnyTooling((uint64_t)v44, v50, type metadata accessor for TokenGenerationError);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x261201A80](0);
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data?(v11, v12);
    swift_bridgeObjectRelease();

    outlined destroy of CompletePromptRequest((uint64_t)v44, type metadata accessor for TokenGenerationError);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = (uint64_t (*)(void))v43[1];
    return v51();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_26:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v53 = (uint64_t (*)(uint64_t))v0[1];
    return v53(v5);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int **v43;
  int *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t (*v60)(void *);
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;

  uint64_t v68 = v0;
  uint64_t v1 = v0[31];
  _s15TokenGeneration31InferenceRequestInstrumentationCxRi_zRi0_zly7ElementQzIseghgn_Sgs8SendableRzSciRzlWOe(v0[27]);
  if (!v1) {
    goto LABEL_24;
  }
  uint64_t v2 = v0[31];
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = (void *)v0[18];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, (void *)v0[18]);
  }
  uint64_t v6 = v4[2];
  uint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v5 > 1), v6 + 1, 1, v4);
  }
  uint64_t v7 = v0[30];
  uint64_t v9 = v0[19];
  uint64_t v8 = v0[20];
  v4[2] = v6 + 1;
  uint64_t v10 = &v4[4 * v6];
  v10[4] = v9;
  v10[5] = v8;
  v10[6] = v7;
  v10[7] = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  while (1)
  {
    uint64_t v48 = v0[15];
    unint64_t v49 = v0[13];
    uint64_t v50 = v0[17] + 1;
    outlined consume of Data?(v0[24], v0[25]);
    outlined destroy of CompletePromptRequest(v49, (uint64_t (*)(void))type metadata accessor for AnyTooling);
    if (v50 == v48)
    {
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v60 = (uint64_t (*)(void *))v0[1];
      return v60(v4);
    }
    uint64_t v51 = v0[16];
    uint64_t v52 = v0[17] + 1;
    v0[17] = v52;
    v0[18] = v4;
    uint64_t v53 = (void *)(v0[4] + (v52 << 6));
    v0[19] = v53[4];
    v0[20] = v53[5];
    uint64_t v54 = v53[6];
    v0[21] = v54;
    uint64_t v55 = (void *)v53[7];
    v0[22] = v55;
    uint64_t v56 = v53[8];
    uint64_t v57 = v53[9];
    v0[23] = v57;
    uint64_t v58 = v53[10];
    v0[24] = v58;
    unint64_t v59 = v53[11];
    v0[25] = v59;
    if (!v51) {
      break;
    }
    uint64_t v62 = v56;
    uint64_t v11 = v0[8];
    unint64_t v12 = v0[3] + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v64 = v57;
    swift_bridgeObjectRetain();
    outlined copy of Data?(v58, v59);
    uint64_t v13 = *(void *)(v11 + 72);
    swift_bridgeObjectRetain();
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = (void *)v0[11];
      outlined init with copy of AnyTooling(v12, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      uint64_t v16 = *v15 == v54 && v15[1] == (void)v55;
      if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      ++v14;
      uint64_t v17 = v0[16];
      outlined destroy of CompletePromptRequest(v0[11], (uint64_t (*)(void))type metadata accessor for AnyTooling);
      v12 += v13;
      if (v14 == v17)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v63 = v0;
        goto LABEL_15;
      }
    }
    os_log_type_t v27 = v0[12];
    BOOL v28 = v0[13];
    uint64_t v29 = v0[11];
    swift_bridgeObjectRelease();
    outlined init with take of AnyTooling(v29, v27, (uint64_t (*)(void))type metadata accessor for AnyTooling);
    outlined init with take of AnyTooling(v27, v28, (uint64_t (*)(void))type metadata accessor for AnyTooling);
    if (one-time initialization token for generator != -1) {
      swift_once();
    }
    uint64_t v30 = v0[13];
    uint64_t v31 = v0[10];
    uint64_t v32 = type metadata accessor for Logger();
    v0[26] = __swift_project_value_buffer(v32, (uint64_t)static Log.generator);
    outlined init with copy of AnyTooling(v30, v31, (uint64_t (*)(void))type metadata accessor for AnyTooling);
    uint64_t v33 = Logger.logObject.getter();
    unint64_t v34 = static os_log_type_t.info.getter();
    uint64_t v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = v0[10];
    if (v35)
    {
      uint64_t v37 = v0[9];
      os_log_type_t v38 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v66 = v39;
      *(_DWORD *)os_log_type_t v38 = 136315138;
      outlined init with copy of AnyTooling(v36, v37, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      uint64_t v40 = String.init<A>(describing:)();
      *(void *)(v38 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, &v66);
      swift_bridgeObjectRelease();
      outlined destroy of CompletePromptRequest(v36, (uint64_t (*)(void))type metadata accessor for AnyTooling);
      _os_log_impl(&dword_25F79F000, v33, v34, "Invoking tool: %s", (uint8_t *)v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v39, -1, -1);
      MEMORY[0x261201C80](v38, -1, -1);
    }
    else
    {
      outlined destroy of CompletePromptRequest(v0[10], (uint64_t (*)(void))type metadata accessor for AnyTooling);
    }

    uint64_t v42 = v64;
    uint64_t v43 = (int **)(v0[13] + *(int *)(v0[7] + 28));
    uint64_t v44 = *v43;
    v0[27] = *v43;
    v0[28] = v43[1];
    if (v44)
    {
      uint64_t v65 = (uint64_t (*)(uint64_t, uint64_t))((char *)v44 + *v44);
      swift_retain();
      uint64_t v61 = (void *)swift_task_alloc();
      v0[29] = v61;
      *uint64_t v61 = v0;
      v61[1] = specialized TokenGenerator.invoke(tooling:calls:);
      return v65(v62, v42);
    }
LABEL_24:
    Swift::String v45 = Logger.logObject.getter();
    Swift::String v46 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v45, v46))
    {
      Swift::String v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v47 = 0;
      _os_log_impl(&dword_25F79F000, v45, v46, "Tool returned no response. Skipping response for this tool.", v47, 2u);
      MEMORY[0x261201C80](v47, -1, -1);
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)v0[18];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of Data?(v58, v59);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v63 = (void *)v0[14];
LABEL_15:
  BOOL v18 = (uint64_t *)v0[6];
  uint64_t v66 = 0;
  unint64_t v67 = 0xE000000000000000;
  _StringGuts.grow(_:)(57);
  v19._object = (void *)0x800000025F92DF60;
  v19._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v19);
  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v54;
  v20._object = v55;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0xD000000000000020;
  v21._object = (void *)0x800000025F92DF80;
  String.append(_:)(v21);
  uint64_t v22 = v66;
  uint64_t v23 = v67;
  *BOOL v18 = v54;
  v18[1] = (uint64_t)v55;
  v18[2] = v22;
  v18[3] = v23;
  v18[4] = 0;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
  swift_allocError();
  outlined init with copy of AnyTooling((uint64_t)v18, v24, type metadata accessor for TokenGenerationError);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x261201A80](0);
  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v58, v59);
  swift_bridgeObjectRelease();

  outlined destroy of CompletePromptRequest((uint64_t)v18, type metadata accessor for TokenGenerationError);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v63[1];
  return v25();
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  uint64_t v1 = v0[32];
  _s15TokenGeneration31InferenceRequestInstrumentationCxRi_zRi0_zly7ElementQzIseghgn_Sgs8SendableRzSciRzlWOe(v0[27]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  MEMORY[0x261201A80](v1);
  MEMORY[0x261201A80](v1);
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (void *)v0[32];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    MEMORY[0x261201A80](v4);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v7;

    _os_log_impl(&dword_25F79F000, v2, v3, "Encountered failure while invoking function: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x261201C80](v6, -1, -1);
    MEMORY[0x261201C80](v5, -1, -1);
  }
  else
  {
    uint64_t v8 = (void *)v0[32];
  }
  uint64_t v9 = (void *)v0[32];
  uint64_t v10 = v0[24];
  uint64_t v11 = v0[22];
  uint64_t v16 = v0[25];
  uint64_t v17 = v0[13];
  unint64_t v12 = (void *)v0[6];
  *unint64_t v12 = v0[21];
  v12[1] = v11;
  uint64_t v12[2] = 0xD00000000000002BLL;
  v12[3] = 0x800000025F92DFB0;
  v12[4] = v9;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type Prompt and conformance Prompt(&lazy protocol witness table cache variable for type TokenGenerationError and conformance TokenGenerationError, (void (*)(uint64_t))type metadata accessor for TokenGenerationError);
  swift_allocError();
  outlined init with copy of AnyTooling((uint64_t)v12, v13, type metadata accessor for TokenGenerationError);
  MEMORY[0x261201A80](v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x261201A80](v9);
  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v10, v16);
  swift_bridgeObjectRelease();

  outlined destroy of CompletePromptRequest((uint64_t)v12, type metadata accessor for TokenGenerationError);
  outlined destroy of CompletePromptRequest(v17, (uint64_t (*)(void))type metadata accessor for AnyTooling);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of AnyTooling(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F90E374()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in AnyTooling.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = partial apply for closure #1 in InferenceRequestHandler.handleRequest(data:configuration:);
  return closure #1 in AnyTooling.init(_:)(a1, a2, v2 + 16);
}

uint64_t outlined init with copy of AnyTooling(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of CompletePromptRequest(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay15TokenGeneration16PromptCompletionV7SegmentVG_AH7ContentOs5NeverOTg504_s15d32Generation0A6StreamV26contentAndf41Completionx0D0_AA0fG0V06promptG0tyYaKFAG7i4OAG7H52Vcfu_32b1aea282a60d71b97bfb98b78a1fe981AlJTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  return _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay15TokenGeneration16PromptCompletionV7SegmentVG_AH7ContentOs5NeverOTg504_s15d12Generation16fg71V23transparencyDescription07_B6A0E2G24BC0F2AD1EA2F42FD0087EEC9LLSSvgAC7i4OAC7H52Vcfu_32b1aea282a60d71b97bfb98b78a1fe981AiGTf3nnnpk_nTf1cn_n(a1);
}

uint64_t AsyncThrowingStream<>.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  type metadata accessor for Optional();
  uint64_t v11 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v12, 1, 1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a2;
  *((void *)v14 + 3) = a3;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = v11;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v14[v13], (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  swift_retain();
  AsyncThrowingStream.init<>(unfolding:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, a3);
  return swift_release();
}

uint64_t specialized StreamWithTimeout.Iterator.next()(uint64_t a1)
{
  v2[29] = a1;
  v2[30] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[31] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for GenerativeError.RuntimeError.ErrorType();
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized StreamWithTimeout.Iterator.next(), 0, 0);
}

uint64_t specialized StreamWithTimeout.Iterator.next()()
{
  uint64_t v1 = *(void *)(v0 + 240);
  if (*(unsigned char *)(v1 + 64)) {
    goto LABEL_2;
  }
  if (*(unsigned char *)(v1 + 80))
  {
    uint64_t v7 = mach_absolute_time();
    *(void *)(v1 + 72) = v7;
    *(unsigned char *)(v1 + 80) = 0;
    if (*(unsigned char *)(v1 + 64) == 1)
    {
      uint64_t v1 = *(void *)(v0 + 240);
LABEL_2:
      swift_retain();
      uint64_t v2 = v1;
LABEL_3:
      *(void *)(v0 + 304) = mach_absolute_time();
      uint64_t v3 = v2 + 16;
      swift_beginAccess();
      uint64_t v4 = *(void *)(v2 + 40);
      uint64_t v5 = *(void *)(v2 + 48);
      __swift_mutable_project_boxed_opaque_existential_1(v3, v4);
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v6;
      *uint64_t v6 = v0;
      v6[1] = specialized StreamWithTimeout.Iterator.next();
      return MEMORY[0x270FA1E80](v0 + 160, v4, v5);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(v1 + 72);
  }
  double v8 = *(double *)(v1 + 56);
  uint64_t v9 = mach_absolute_time();
  BOOL v10 = v9 >= v7;
  unint64_t v11 = v9 - v7;
  if (!v10)
  {
    __break(1u);
    goto LABEL_23;
  }
  *(void *)(v0 + 336) = 0;
  mach_timebase_info((mach_timebase_info_t)(v0 + 336));
  LODWORD(v12) = *(_DWORD *)(v0 + 336);
  *(double *)&unint64_t v13 = (double)v12;
  double v14 = (double)v11 * *(double *)&v13;
  LODWORD(v13) = *(_DWORD *)(v0 + 340);
  if (v8 <= v14 / ((double)v13 * 1000000000.0))
  {
    if (one-time initialization token for generator == -1)
    {
LABEL_18:
      uint64_t v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)static Log.generator);
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 134217984;
        *(double *)(v0 + 224) = v8;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_25F79F000, v20, v21, "Aborting execution as stream exceeded maxiumum allotted time %f", v22, 0xCu);
        MEMORY[0x261201C80](v22, -1, -1);
      }
      uint64_t v24 = *(void *)(v0 + 264);
      uint64_t v23 = *(void *)(v0 + 272);
      uint64_t v26 = *(void *)(v0 + 248);
      uint64_t v25 = *(void *)(v0 + 256);

      uint64_t v27 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
      GenerativeError.RuntimeError.ErrorType.TimeoutErrorInfo.init(retryAfterDate:)();
      (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v23, *MEMORY[0x263F40B50], v25);
      type metadata accessor for GenerativeError();
      lazy protocol witness table accessor for type PromptCompletionStream and conformance PromptCompletionStream((unint64_t *)&lazy protocol witness table cache variable for type GenerativeError and conformance GenerativeError, MEMORY[0x263F40B88]);
      swift_allocError();
      static GenerativeError.runtimeError(type:)();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      BOOL v28 = *(uint64_t (**)(void))(v0 + 8);
      return v28();
    }
LABEL_23:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)(v0 + 240);
  char v15 = *(unsigned char *)(v1 + 64);
  uint64_t v16 = *(void *)(v1 + 56);
  swift_retain();
  if (v15) {
    goto LABEL_3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent?);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v17;
  v17[2] = &async function pointer to partial apply for specialized closure #1 in StreamWithTimeout.Iterator.next();
  v17[3] = v2;
  v17[4] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (result: PromptCompletionEvent?, duration: Double));
  BOOL v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v18;
  *BOOL v18 = v0;
  v18[1] = specialized StreamWithTimeout.Iterator.next();
  return MEMORY[0x270FA22B8](v0 + 64);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  uint64_t v1 = *(void *)(v0 + 304);
  outlined init with copy of Prompt.Rendering?(v0 + 160, v0 + 16, &demangling cache variable for type metadata for PromptCompletionEvent?);
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = v2 - v1;
  if (v2 < v1) {
    __break(1u);
  }
  *(void *)(v0 + 328) = 0;
  mach_timebase_info((mach_timebase_info_t)(v0 + 328));
  LODWORD(v4) = *(_DWORD *)(v0 + 328);
  *(double *)&uint64_t v5 = (double)v4;
  uint64_t v6 = (double)v3 * *(double *)&v5;
  LODWORD(v5) = *(_DWORD *)(v0 + 332);
  uint64_t v7 = v6 / ((double)v5 * 1000000000.0);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0 + 160, &demangling cache variable for type metadata for PromptCompletionEvent?);
  swift_release();
  double v8 = *(void *)(v0 + 240);
  *(double *)(v0 + 56) = v7;
  if ((*(unsigned char *)(v8 + 64) & 1) == 0 && *(void *)(v0 + 40))
  {
    *(double *)(v8 + 56) = *(double *)(v8 + 56) - v7;
    *(unsigned char *)(v8 + 64) = 0;
  }
  uint64_t v9 = *(void *)(v0 + 232);
  outlined init with take of PromptCompletionEvent?(v0 + 16, v0 + 112);
  outlined init with take of PromptCompletionEvent?(v0 + 112, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(double *)(v0 + 104);
  outlined init with take of PromptCompletionEvent?(v0 + 64, v0 + 16);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 240);
  *(double *)(v0 + 56) = v1;
  if ((*(unsigned char *)(v2 + 64) & 1) == 0 && *(void *)(v0 + 40))
  {
    *(double *)(v2 + 56) = *(double *)(v2 + 56) - v1;
    *(unsigned char *)(v2 + 64) = 0;
  }
  uint64_t v3 = *(void *)(v0 + 232);
  outlined init with take of PromptCompletionEvent?(v0 + 16, v0 + 112);
  outlined init with take of PromptCompletionEvent?(v0 + 112, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v1[11] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v1[12] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for GenerativeError.RuntimeError.ErrorType();
  v1[13] = v2;
  v1[14] = *(void *)(v2 - 8);
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized StreamWithTimeout.Iterator.next(), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(void);
  uint64_t v30;

  uint64_t v1 = (uint64_t *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 88);
  if (*(unsigned char *)(v2 + 64)) {
    goto LABEL_2;
  }
  if (*(unsigned char *)(v2 + 80))
  {
    double v8 = mach_absolute_time();
    *(void *)(v2 + 72) = v8;
    *(unsigned char *)(v2 + 80) = 0;
    if (*(unsigned char *)(v2 + 64) == 1)
    {
      uint64_t v2 = *v1;
LABEL_2:
      swift_retain();
      uint64_t v3 = v2;
LABEL_3:
      *(void *)(v0 + 152) = mach_absolute_time();
      uint64_t v4 = v3 + 16;
      swift_beginAccess();
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 48);
      __swift_mutable_project_boxed_opaque_existential_1(v4, v5);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v7;
      *uint64_t v7 = v0;
      v7[1] = specialized StreamWithTimeout.Iterator.next();
      return MEMORY[0x270FA1E80](v0 + 64, v5, v6);
    }
  }
  else
  {
    double v8 = *(void *)(v2 + 72);
  }
  uint64_t v9 = *(double *)(v2 + 56);
  BOOL v10 = mach_absolute_time();
  unint64_t v11 = v10 >= v8;
  unint64_t v12 = v10 - v8;
  if (!v11)
  {
    __break(1u);
    goto LABEL_23;
  }
  *(void *)(v0 + 200) = 0;
  mach_timebase_info((mach_timebase_info_t)(v0 + 200));
  LODWORD(v13) = *(_DWORD *)(v0 + 200);
  LODWORD(v14) = *(_DWORD *)(v0 + 204);
  if (v9 <= (double)v12 * (double)v13 / ((double)v14 * 1000000000.0))
  {
    if (one-time initialization token for generator == -1)
    {
LABEL_18:
      uint64_t v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)static Log.generator);
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 134217984;
        *(double *)(v0 + 80) = v9;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_25F79F000, v20, v21, "Aborting execution as stream exceeded maxiumum allotted time %f", v22, 0xCu);
        MEMORY[0x261201C80](v22, -1, -1);
      }
      uint64_t v24 = *(void *)(v0 + 112);
      uint64_t v23 = *(void *)(v0 + 120);
      uint64_t v26 = *(void *)(v0 + 96);
      uint64_t v25 = *(void *)(v0 + 104);

      uint64_t v27 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
      GenerativeError.RuntimeError.ErrorType.TimeoutErrorInfo.init(retryAfterDate:)();
      (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v23, *MEMORY[0x263F40B50], v25);
      type metadata accessor for GenerativeError();
      lazy protocol witness table accessor for type PromptCompletionStream and conformance PromptCompletionStream((unint64_t *)&lazy protocol witness table cache variable for type GenerativeError and conformance GenerativeError, MEMORY[0x263F40B88]);
      swift_allocError();
      static GenerativeError.runtimeError(type:)();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      BOOL v28 = *(uint64_t (**)(void))(v0 + 8);
      return v28();
    }
LABEL_23:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v3 = *v1;
  char v15 = *(unsigned char *)(v2 + 64);
  uint64_t v16 = *(void *)(v2 + 56);
  swift_retain();
  if (v15) {
    goto LABEL_3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v17;
  v17[2] = &async function pointer to partial apply for specialized closure #1 in StreamWithTimeout.Iterator.next();
  v17[3] = v3;
  v17[4] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (result: String?, duration: Double));
  BOOL v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v18;
  *BOOL v18 = v0;
  v18[1] = specialized StreamWithTimeout.Iterator.next();
  return MEMORY[0x270FA22B8](v0 + 40);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = specialized StreamWithTimeout.Iterator.next();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = specialized StreamWithTimeout.Iterator.next();
  }
  else
  {
    swift_endAccess();
    *(_OWORD *)(v2 + 176) = *(_OWORD *)(v2 + 64);
    uint64_t v3 = specialized StreamWithTimeout.Iterator.next();
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v9;

  uint64_t v1 = *(void *)(v0 + 152);
  swift_bridgeObjectRetain();
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = v2 - v1;
  if (v2 < v1) {
    __break(1u);
  }
  *(_DWORD *)(v0 + 192) = 0;
  *(_DWORD *)(v0 + 196) = 0;
  mach_timebase_info((mach_timebase_info_t)(v0 + 192));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 88);
  if ((*(unsigned char *)(v6 + 64) & 1) == 0 && v5)
  {
    *(double *)(v6 + 56) = *(double *)(v6 + 56)
                         + (double)v3
                         * (double)*(unsigned int *)(v0 + 192)
                         / ((double)*(unsigned int *)(v0 + 196)
                          * -1000000000.0);
    *(unsigned char *)(v6 + 64) = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v7(v4, v5);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v6;

  swift_release();
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 88);
  if ((*(unsigned char *)(v3 + 64) & 1) == 0 && v1)
  {
    *(double *)(v3 + 56) = *(double *)(v3 + 56) - *(double *)(v0 + 56);
    *(unsigned char *)(v3 + 64) = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v2, v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TokenStream.init(throwing:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v44 = type metadata accessor for PromptCompletionStream(0) - 8;
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v40 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  BOOL v10 = (char *)&v36 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v36 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v36 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  uint64_t v41 = (char *)&v36 - v16;
  *(void *)(swift_allocObject() + 16) = a1;
  uint64_t v36 = a1;
  MEMORY[0x261201A80](a1);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  AsyncThrowingStream.init<>(unfolding:)();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v37 = v15;
  v19(v15, v17, v4);
  uint64_t v20 = swift_allocObject();
  uint64_t v39 = v20;
  *(void *)(v20 + 16) = _s15TokenGeneration0A6StreamV8throwingACyxGs5Error_p_tcfcAA16PromptCompletionVyYbKcfU0_TA_0;
  *(void *)(v20 + 24) = v18;
  v19(v10, v15, v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator?);
  uint64_t v21 = swift_allocBox();
  uint64_t v23 = v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  uint64_t v25 = v40;
  v19(v40, v10, v4);
  unint64_t v26 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v21;
  BOOL v28 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v28(v27 + v26, v25, v4);
  uint64_t v29 = v36;
  MEMORY[0x261201A80](v36);
  swift_retain();
  swift_retain();
  uint64_t v30 = v42;
  AsyncThrowingStream.init<>(unfolding:)();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
  v31(v10, v4);
  swift_release();
  v31(v37, v4);
  uint64_t v32 = (uint64_t)v43;
  v28((unint64_t)v43, v30, v4);

  swift_release();
  uint64_t v33 = (void *)(v32 + *(int *)(v44 + 28));
  uint64_t v34 = v39;
  void *v33 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error);
  v33[1] = v34;
  v31(v41, v4);
  return _s15TokenGeneration22PromptCompletionStreamVWObTm_0(v32, v45, type metadata accessor for PromptCompletionStream);
}

uint64_t TokenStream.contentAndPromptCompletion()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = *(void *)(a3 + 16);
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for String.Encoding();
  v4[10] = v6;
  v4[11] = *(void *)(v6 - 8);
  v4[12] = swift_task_alloc();
  type metadata accessor for PromptCompletion(0);
  v4[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](TokenStream.contentAndPromptCompletion(), 0, 0);
}

uint64_t TokenStream.contentAndPromptCompletion()()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for PromptCompletionStream(0) + 20));
  uint64_t v6 = (uint64_t (*)(uint64_t))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = TokenStream.contentAndPromptCompletion();
  uint64_t v4 = v0[13];
  return v6(v4);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenStream.contentAndPromptCompletion();
  }
  else {
    uint64_t v2 = TokenStream.contentAndPromptCompletion();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;
  uint64_t (*v20)(void);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  uint64_t v1 = v0[4];
  _s15TokenGeneration22PromptCompletionStreamVWObTm_0(v0[13], v1, type metadata accessor for PromptCompletion);
  if (*(void *)(*(void *)(v1 + 32) + 16))
  {
    uint64_t v2 = v0[15];
    uint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v4 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay15TokenGeneration16PromptCompletionV7SegmentVG_AH7ContentOs5NeverOTg504_s15d12Generation16fg71V23transparencyDescription07_B6A0E2G24BC0F2AD1EA2F42FD0087EEC9LLSSvgAC7i4OAC7H52Vcfu_32b1aea282a60d71b97bfb98b78a1fe981AiGTf3nnnpk_nTf1cn_n(v3);
    uint64_t v25 = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = v0[15];
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = swift_bridgeObjectRetain() + 40;
    do
    {
      if ((*(unsigned char *)(v6 + 32) & 1) == 0)
      {
        uint64_t v8 = *(void *)(v6 + 16);
        uint64_t v7 = *(void *)(v6 + 24);
        BOOL v10 = *(void **)v6;
        uint64_t v9 = *(void *)(v6 + 8);
        uint64_t v11 = *(void *)(v6 - 8);
        outlined copy of PromptCompletion.Content(v11, *(void *)v6, v9, v8, v7, 0);
        swift_bridgeObjectRetain();
        v12._countAndFlagsBits = v11;
        v12._object = v10;
        String.append(_:)(v12);
        outlined consume of PromptCompletionEnvelope.SegmentEnvelope(v11, (unint64_t)v10, v9, v8, v7, 0);
        swift_bridgeObjectRelease();
      }
      v6 += 48;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[12];
  char v15 = v0[10];
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v16 = String.data(using:allowLossyConversion:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  if (v18 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    static Generable.decode(data:)();
    if (v25)
    {
      outlined destroy of PromptCompletion(v0[4], type metadata accessor for PromptCompletion);
      outlined consume of Data?(v16, v18);
    }
    else
    {
      uint64_t v22 = v0[8];
      uint64_t v21 = v0[9];
      uint64_t v23 = v0[7];
      uint64_t v24 = v0[3];
      outlined consume of Data?(v16, v18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v21, v23);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  return result;
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TokenStream.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = type metadata accessor for PromptCompletionStream.AsyncIterator(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v21 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for PromptCompletionStream(0);
  MEMORY[0x270FA5388](v20);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v19 - v12;
  outlined init with copy of PromptCompletionStream(v1, (uint64_t)v6);
  type metadata accessor for Token();
  lazy protocol witness table accessor for type PromptCompletionStream and conformance PromptCompletionStream(&lazy protocol witness table cache variable for type PromptCompletionStream and conformance PromptCompletionStream, (void (*)(uint64_t))type metadata accessor for PromptCompletionStream);
  AsyncCompactMapSequence.init(_:transform:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  MEMORY[0x261201470](v7);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  MEMORY[0x261200F50](v14);
  outlined destroy of PromptCompletion((uint64_t)v6, type metadata accessor for PromptCompletionStream);
  AsyncMapSequence.Iterator.transform.getter();
  char v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = v21;
  AsyncCompactMapSequence.Iterator.init(_:transform:)();
  v15(v13, v7);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v22, v16, v17);
}

uint64_t TokenStream.AsyncIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](TokenStream.AsyncIterator.next(), 0, 0);
}

uint64_t TokenStream.AsyncIterator.next()()
{
  static Task<>.checkCancellation()();
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&async function pointer to specialized AsyncCompactMapSequence.Iterator.next()
                                       + async function pointer to specialized AsyncCompactMapSequence.Iterator.next());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = PromptCompletionStream.AsyncIterator.next();
  uint64_t v2 = *(void *)(v0 + 16);
  return v4(v2);
}

uint64_t TokenStream.collect()(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for String.Encoding();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Token?);
  v3[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Token();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  type metadata accessor for PromptCompletion(0);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](TokenStream.collect(), 0, 0);
}

uint64_t TokenStream.collect()()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for PromptCompletionStream(0) + 20));
  uint64_t v6 = (uint64_t (*)(uint64_t))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  *uint64_t v3 = v0;
  v3[1] = TokenStream.collect();
  uint64_t v4 = v0[15];
  return v6(v4);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = TokenStream.collect();
  }
  else {
    uint64_t v2 = TokenStream.collect();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  void *v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t result;
  uint64_t (*v44)(void);
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  void (**v48)(uint64_t, uint64_t, uint64_t);
  unsigned int (**v49)(uint64_t, uint64_t, uint64_t);
  void *v50;
  void (**v51)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v52;

  uint64_t v1 = v0[16];
  _s15TokenGeneration22PromptCompletionStreamVWObTm_0(v0[15], v1, type metadata accessor for PromptCompletion);
  uint64_t v2 = *(void **)(v1 + 32);
  swift_bridgeObjectRetain();
  outlined destroy of PromptCompletion(v1, type metadata accessor for PromptCompletion);
  uint64_t v50 = v0;
  if (v2[2])
  {
    uint64_t v3 = v0[18];
    uint64_t v4 = v2[4];
    uint64_t v5 = v2[7];
    uint64_t v7 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of FinishReason(v5, v7);
    outlined copy of Data._Representation(v6, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of FinishReason(v5, v7);
    outlined consume of Data._Representation(v6, v8);
    uint64_t v9 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay15TokenGeneration16PromptCompletionV7SegmentVG_AH7ContentOs5NeverOTg504_s15d12Generation16fg71V23transparencyDescription07_B6A0E2G24BC0F2AD1EA2F42FD0087EEC9LLSSvgAC7i4OAC7H52Vcfu_32b1aea282a60d71b97bfb98b78a1fe981AiGTf3nnnpk_nTf1cn_n(v4);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
LABEL_3:
      Swift::String v46 = v3;
      uint64_t v11 = v0[12];
      uint64_t v51 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
      Swift::String v47 = v11;
      uint64_t v48 = (void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
      unint64_t v49 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
      swift_bridgeObjectRetain();
      uint64_t v12 = v9 + 40;
      uint64_t v13 = MEMORY[0x263F8EE78];
      while (1)
      {
        char v15 = v0[10];
        uint64_t v14 = v0[11];
        if (*(unsigned char *)(v12 + 32))
        {
          (*v51)(v0[10], 1, 1, v0[11]);
        }
        else
        {
          uint64_t v17 = *(void *)(v12 + 16);
          uint64_t v16 = *(void *)(v12 + 24);
          uint64_t v18 = v13;
          uint64_t v19 = *(void *)v12;
          uint64_t v20 = *(void *)(v12 + 8);
          uint64_t v21 = *(void *)(v12 - 8);
          outlined copy of PromptCompletion.Content(v21, *(void *)v12, v20, v17, v16, 0);
          swift_bridgeObjectRetain();
          Token.init(text:)();
          (*v51)(v15, 0, 1, v14);
          uint64_t v22 = v20;
          uint64_t v13 = v18;
          uint64_t v0 = v50;
          outlined consume of PromptCompletionEnvelope.SegmentEnvelope(v21, v19, v22, v17, v16, 0);
          if ((*v49)(v15, 1, v14) != 1)
          {
            uint64_t v24 = v50[13];
            uint64_t v23 = v50[14];
            uint64_t v25 = v50[11];
            unint64_t v26 = *v48;
            (*v48)(v23, v50[10], v25);
            v26(v24, v23, v25);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v13 + 16) + 1, 1, v13);
            }
            BOOL v28 = *(void *)(v13 + 16);
            uint64_t v27 = *(void *)(v13 + 24);
            if (v28 >= v27 >> 1) {
              uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1, v13);
            }
            uint64_t v29 = v50[13];
            uint64_t v30 = v50[11];
            *(void *)(v13 + 16) = v28 + 1;
            v26(v13+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(void *)(v47 + 72) * v28, v29, v30);
            goto LABEL_6;
          }
        }
        outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0[10], &demangling cache variable for type metadata for Token?);
LABEL_6:
        v12 += 48;
        if (!--v10)
        {
          swift_bridgeObjectRelease();
          uint64_t v3 = v46;
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[18];
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
LABEL_17:
  swift_bridgeObjectRelease();
  uint64_t v31 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay15TokenGeneration0D0VG_SSs5NeverOTg504_s15D116Generation22CompletePromptResponseV6tokensACSayAA0A0VG_tcfcSSAFcfu_33_2c83176e6c929c34cc0288687e3e762dAFSSTf3nnnpk_nTf1cn_n(v13);
  uint64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = (void **)(v31 + 40);
    do
    {
      uint64_t v34 = (uint64_t)*(v33 - 1);
      uint64_t v35 = *v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v36._countAndFlagsBits = v34;
      v36._object = v35;
      String.append(_:)(v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33 += 2;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease();
  }
  uint64_t v37 = v0[8];
  uint64_t v38 = v0[9];
  uint64_t v39 = v0[7];
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v40 = String.data(using:allowLossyConversion:)();
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
  if (v42 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    static Generable.decode(data:)();
    if (v3)
    {
      outlined consume of Data?(v40, v42);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v44 = (uint64_t (*)(void))v0[1];
      return v44();
    }
    else
    {
      outlined consume of Data?(v40, v42);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v45 = (uint64_t (*)(uint64_t))v0[1];
      return v45(v13);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TokenStream<>.map<A>(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PromptCompletionStream(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of PromptCompletionStream(v1, (uint64_t)v5);
  return _s15TokenGeneration22PromptCompletionStreamVWObTm_0((uint64_t)v5, a1, type metadata accessor for PromptCompletionStream);
}

uint64_t TokenStream.init<A>(streamResponse:bufferResponse:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PromptCompletionStream(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  PromptCompletionStream.init<A>(streamResponse:bufferResponse:)((uint64_t)v14, a2, a3, a4, a5, (uint64_t)v17);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, a4);
  return _s15TokenGeneration22PromptCompletionStreamVWObTm_0((uint64_t)v17, a6, type metadata accessor for PromptCompletionStream);
}

uint64_t TokenStream.events.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of PromptCompletionStream(v1, a1);
}

uint64_t closure #1 in TokenStream.init(throwing:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return MEMORY[0x270FA2498](closure #1 in TokenStream.init(throwing:), 0, 0);
}

uint64_t closure #1 in TokenStream.init(throwing:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_willThrow();
  MEMORY[0x261201A80](v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25F911C7C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t closure #2 in TokenStream.init(throwing:)(uint64_t a1)
{
  return MEMORY[0x261201A80](a1);
}

uint64_t _s15TokenGeneration0A6StreamV8throwingACyxGs5Error_p_tcfcAA16PromptCompletionVyYbKcfU0_TA_0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_willThrow();
  return MEMORY[0x261201A80](v1);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error)(uint64_t a1, void (*a2)(void))
{
  a2();
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error)(v3);
}

uint64_t sub_25F911DC0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t TokenStream.content()(uint64_t a1, uint64_t a2)
{
  type metadata accessor for PromptCompletion(0);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v6;
  *uint64_t v6 = v2;
  v6[1] = TokenStream.content();
  return TokenStream.contentAndPromptCompletion()(a1, v5, a2);
}

uint64_t TokenStream.content()()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = TokenGenerator._respond<A, B>(type:configuration:);
  }
  else
  {
    outlined destroy of PromptCompletion(*(void *)(v2 + 16), type metadata accessor for PromptCompletion);
    uint64_t v3 = TokenGenerator._respond<A, B>(type:configuration:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t closure #1 in TokenStream.makeAsyncIterator()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x270FA2498](closure #1 in TokenStream.makeAsyncIterator(), 0, 0);
}

uint64_t closure #1 in TokenStream.makeAsyncIterator()()
{
  outlined init with copy of PromptCompletionEvent(v0[17], (uint64_t)(v0 + 11));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v0[9];
    unint64_t v2 = v0[10];
    swift_bridgeObjectRetain();
    Token.init(text:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data?(v1, v2);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = v0[16];
  uint64_t v5 = type metadata accessor for Token();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, v3, 1, v5);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t specialized AsyncCompactMapSequence.Iterator.next()(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Token?);
  v2[18] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  v2[19] = v3;
  v2[20] = *(void *)(v3 - 8);
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized AsyncCompactMapSequence.Iterator.next(), 0, 0);
}

uint64_t specialized AsyncCompactMapSequence.Iterator.next()()
{
  uint64_t v1 = AsyncCompactMapSequence.Iterator.baseIterator.modify();
  static Task<>.checkCancellation()();
  *(void *)(v0 + 176) = v1;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
  *unint64_t v2 = v0;
  v2[1] = specialized AsyncCompactMapSequence.Iterator.next();
  return MEMORY[0x270FA2100](v0 + 56, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  unint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = specialized AsyncCompactMapSequence.Iterator.next();
  }
  else
  {
    (*(void (**)(void))(v2 + 176))();
    uint64_t v3 = specialized AsyncCompactMapSequence.Iterator.next();
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  long long *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  int *v14;
  uint64_t v15;

  uint64_t v1 = (long long *)(v0 + 7);
  if (v0[10])
  {
    uint64_t v3 = v0[20];
    unint64_t v2 = v0[21];
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[17];
    outlined init with take of AsyncIteratorProtocol(v1, (uint64_t)(v0 + 2));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    uint64_t v6 = (int *)AsyncMapSequence.Iterator.transform.getter();
    v0[25] = v7;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    uint64_t v14 = (int *)((char *)v6 + *v6);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[26] = v8;
    *uint64_t v8 = v0;
    v8[1] = specialized AsyncCompactMapSequence.Iterator.next();
    uint64_t v9 = v0[18];
    return ((uint64_t (*)(uint64_t, void *))v14)(v9, v0 + 2);
  }
  else
  {
    uint64_t v11 = v0[16];
    outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v1, &demangling cache variable for type metadata for PromptCompletionEvent?);
    uint64_t v12 = type metadata accessor for Token();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void))(v0 + 176))();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;

  uint64_t v1 = *v0 + 16;
  swift_task_dealloc();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  return MEMORY[0x270FA2498](specialized AsyncCompactMapSequence.Iterator.next(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t (*v6)(void);
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v1 = v0[18];
  unint64_t v2 = type metadata accessor for Token();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    uint64_t v7 = v0[16];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v7, v1, v2);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v7, 0, 1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    goto LABEL_5;
  }
  uint64_t v4 = v0[24];
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v1, &demangling cache variable for type metadata for Token?);
  uint64_t v5 = (void (*)(void *, uint64_t))AsyncCompactMapSequence.Iterator.baseIterator.modify();
  static Task<>.checkCancellation()();
  if (v4)
  {
    v5(v0 + 12, 1);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
LABEL_5:
    return v6();
  }
  v0[22] = v5;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[23] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
  *uint64_t v9 = v0;
  v9[1] = specialized AsyncCompactMapSequence.Iterator.next();
  return MEMORY[0x270FA2100](v0 + 7, v10);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance TokenStream<A>.AsyncIterator(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = partial apply for closure #2 in register<A>(documents:registrationCallback:);
  return MEMORY[0x270FA2498](TokenStream.AsyncIterator.next(), 0, 0);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance TokenStream<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  TokenStream.makeAsyncIterator()(a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

uint64_t specialized closure #1 in AsyncThrowingStream<>.init<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_beginAccess();
  if (!*(void *)(v1 + 16))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v0 + 192) + 16);
    outlined init with copy of Prompt.Rendering?(*(void *)(v0 + 200), v0 + 16, &demangling cache variable for type metadata for StreamWithTimeout<PromptCompletionEvent>);
    uint64_t v2 = *(void *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
    uint64_t v3 = *(void *)(v2 - 8);
    swift_task_alloc();
    (*(void (**)(void))(v3 + 16))();
    *(void *)(v0 + 96) = swift_getAssociatedTypeWitness();
    *(void *)(v0 + 104) = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(v0 + 72));
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    swift_task_dealloc();
    uint64_t v4 = *(void *)(v0 + 56);
    char v5 = *(unsigned char *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamWithTimeout<PromptCompletionEvent>.Iterator);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 56) = 0;
    *(unsigned char *)(v6 + 64) = 1;
    *(void *)(v6 + 72) = 0;
    *(unsigned char *)(v6 + 80) = 1;
    outlined init with take of AsyncIteratorProtocol((long long *)(v0 + 72), v6 + 16);
    *(void *)(v6 + 56) = v4;
    *(unsigned char *)(v6 + 64) = v5;
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0 + 16, &demangling cache variable for type metadata for StreamWithTimeout<PromptCompletionEvent>);
    swift_beginAccess();
    *uint64_t v13 = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(v0 + 192);
  swift_beginAccess();
  if (*(void *)(v7 + 16))
  {
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v8;
    *uint64_t v8 = v0;
    v8[1] = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
    uint64_t v9 = *(void *)(v0 + 184);
    return specialized StreamWithTimeout.Iterator.next()(v9);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 184);
    swift_endAccess();
    *(void *)(v11 + 32) = 0;
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v10)(void, void);
  uint64_t *v11;
  uint64_t v12;

  uint64_t v1 = *(void *)(v0 + 184);
  swift_beginAccess();
  if (!*(void *)(v1 + 16))
  {
    uint64_t v11 = (uint64_t *)(*(void *)(v0 + 184) + 16);
    outlined init with copy of Prompt.Rendering?(*(void *)(v0 + 192), v0 + 16, &demangling cache variable for type metadata for StreamWithTimeout<String>);
    uint64_t v2 = *(void *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
    uint64_t v3 = *(void *)(v2 - 8);
    swift_task_alloc();
    (*(void (**)(void))(v3 + 16))();
    *(void *)(v0 + 96) = swift_getAssociatedTypeWitness();
    *(void *)(v0 + 104) = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(v0 + 72));
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    swift_task_dealloc();
    uint64_t v4 = *(void *)(v0 + 56);
    char v5 = *(unsigned char *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamWithTimeout<String>.Iterator);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 56) = 0;
    *(unsigned char *)(v6 + 64) = 1;
    *(void *)(v6 + 72) = 0;
    *(unsigned char *)(v6 + 80) = 1;
    outlined init with take of AsyncIteratorProtocol((long long *)(v0 + 72), v6 + 16);
    *(void *)(v6 + 56) = v4;
    *(unsigned char *)(v6 + 64) = v5;
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v0 + 16, &demangling cache variable for type metadata for StreamWithTimeout<String>);
    swift_beginAccess();
    *uint64_t v11 = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(v0 + 184);
  swift_beginAccess();
  if (*(void *)(v7 + 16))
  {
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v8;
    *uint64_t v8 = v0;
    v8[1] = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
    return specialized StreamWithTimeout.Iterator.next()();
  }
  else
  {
    swift_endAccess();
    uint64_t v10 = *(uint64_t (**)(void, void))(v0 + 8);
    return v10(0, 0);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void, void);
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  swift_beginAccess();
  outlined init with copy of Prompt.Rendering?(v1, v2, &demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator?);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator);
  uint64_t v4 = *(void *)(v3 - 8);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v2, &demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator?);
  if (v1 == 1)
  {
    uint64_t v6 = v0[19];
    uint64_t v7 = v0[17];
    (*(void (**)(void, void, void))(v0[15] + 16))(v0[16], v0[13], v0[14]);
    lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncMapSequence<TokenStream<String>, String> and conformance AsyncMapSequence<A, B>, &demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>);
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v7, v6, &demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator?);
  }
  uint64_t v8 = v0[19];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void, void))v0[1];
    return v9(0, 0);
  }
  else
  {
    uint64_t v11 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncMapSequence<TokenStream<String>, String>.Iterator and conformance AsyncMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[20] = v12;
    *uint64_t v12 = v0;
    v12[1] = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
    return MEMORY[0x270FA1E80](v0 + 11, v3, v11);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_beginAccess();
  outlined init with copy of Prompt.Rendering?(v1, v2, &demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator?);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
  uint64_t v4 = *(void *)(v3 - 8);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v2, &demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator?);
  if (v1 == 1)
  {
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[16];
    (*(void (**)(void, void, void))(v0[14] + 16))(v0[15], v0[12], v0[13]);
    lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<PromptCompletionEvent, Error> and conformance AsyncThrowingStream<A, B>, &demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v7, v6, &demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator?);
  }
  uint64_t v8 = v0[18];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[11];
    swift_endAccess();
    *(void *)(v9 + 32) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator and conformance AsyncThrowingStream<A, B>.Iterator, &demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>.Iterator);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    *uint64_t v13 = v0;
    v13[1] = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
    uint64_t v14 = v0[11];
    return MEMORY[0x270FA1E80](v14, v3, v12);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_beginAccess();
  outlined init with copy of Prompt.Rendering?(v1, v2, &demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator?);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator);
  uint64_t v4 = *(void *)(v3 - 8);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?(v2, &demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator?);
  if (v1 == 1)
  {
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[16];
    (*(void (**)(void, void, void))(v0[14] + 16))(v0[15], v0[12], v0[13]);
    lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent> and conformance AsyncMapSequence<A, B>, &demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>);
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    outlined assign with take of AsyncThrowingStream<CompletePromptResponseElement, Error>.Iterator?(v7, v6, &demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator?);
  }
  uint64_t v8 = v0[18];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[11];
    swift_endAccess();
    *(void *)(v9 + 32) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = lazy protocol witness table accessor for type AsyncThrowingStream<(), Error> and conformance AsyncThrowingStream<A, B>(&lazy protocol witness table cache variable for type AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator and conformance AsyncMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncMapSequence<AsyncThrowingStream<CompletePromptResponseElement, Error>, PromptCompletionEvent>.Iterator);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    *uint64_t v13 = v0;
    v13[1] = specialized closure #1 in AsyncThrowingStream<>.init<A>(_:);
    uint64_t v14 = v0[11];
    return MEMORY[0x270FA1E80](v14, v3, v12);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t specialized closure #1 in AsyncThrowingStream<>.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = a2;
  return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
}

{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v9;

  uint64_t v6 = *v3;
  *(void *)(*v3 + 208) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(a1, a2);
  }
}

{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v2[13] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>);
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<TokenStream<String>, String>.Iterator?);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_projectBox();
  return MEMORY[0x270FA2498](specialized closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
}

uint64_t sub_25F914170()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t _s15TokenGeneration22PromptCompletionStreamVWObTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of PromptCompletionStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PromptCompletionStream(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of PromptCompletion(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t closure #1 in AsyncThrowingStream<>.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a5;
  v6[15] = a6;
  v6[12] = a3;
  v6[13] = a4;
  v6[11] = a1;
  v6[16] = *(void *)(a5 - 8);
  v6[17] = swift_task_alloc();
  v6[18] = swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  v6[23] = swift_projectBox();
  return MEMORY[0x270FA2498](closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
}

uint64_t closure #1 in AsyncThrowingStream<>.init<A>(_:)()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[18];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  LODWORD(v1) = v7(v2, 1, v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v1 == 1)
  {
    uint64_t v21 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];
    uint64_t v22 = v0[19];
    uint64_t v20 = v0[18];
    (*(void (**)(void, void, void))(v0[16] + 16))(v0[17], v0[12], v0[14]);
    dispatch thunk of AsyncSequence.makeAsyncIterator()();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v9, 0, 1, v20);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v21, v9, v22);
  }
  uint64_t v10 = v0[23];
  uint64_t v11 = v0[18];
  swift_beginAccess();
  if (v7(v10, 1, v11))
  {
    uint64_t v12 = v0[13];
    uint64_t v13 = v0[11];
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v13, 1, 1, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
  else
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v17 = (void *)swift_task_alloc();
    v0[24] = v17;
    *uint64_t v17 = v0;
    v17[1] = closure #1 in AsyncThrowingStream<>.init<A>(_:);
    uint64_t v18 = v0[18];
    uint64_t v19 = v0[11];
    return MEMORY[0x270FA1E80](v19, v18, AssociatedConformanceWitness);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](closure #1 in AsyncThrowingStream<>.init<A>(_:), 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in TokenStream<A>()
{
  return swift_getWitnessTable();
}

uint64_t type metadata instantiation function for TokenStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata completion function for TokenStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return type metadata completion function for TokenStream(a1, a2, a3, type metadata accessor for PromptCompletionStream);
}

uint64_t *initializeBufferWithCopyOfBuffer for TokenStream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for PromptCompletionStream(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for TokenStream(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for PromptCompletionStream(0);
  return swift_release();
}

uint64_t initializeWithCopy for TokenStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PromptCompletionStream(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = v7[1];
  *uint64_t v6 = *v7;
  v6[1] = v8;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TokenStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for PromptCompletionStream(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = v7[1];
  *uint64_t v6 = *v7;
  v6[1] = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for TokenStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for PromptCompletionStream(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t assignWithTake for TokenStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<PromptCompletionEvent, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for PromptCompletionStream(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F915324);
}

uint64_t sub_25F915324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PromptCompletionStream(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TokenStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F9153A4);
}

uint64_t sub_25F9153A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PromptCompletionStream(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TokenStream()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return type metadata completion function for TokenStream(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
}

uint64_t type metadata completion function for TokenStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for TokenStream.AsyncIterator(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F915760);
}

uint64_t sub_25F915760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TokenStream.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F9157E4);
}

uint64_t sub_25F9157E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TokenStream.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator()
{
  if (!lazy cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator)
  {
    type metadata accessor for PromptCompletionStream(255);
    type metadata accessor for Token();
    lazy protocol witness table accessor for type PromptCompletionStream and conformance PromptCompletionStream(&lazy protocol witness table cache variable for type PromptCompletionStream and conformance PromptCompletionStream, (void (*)(uint64_t))type metadata accessor for PromptCompletionStream);
    unint64_t v0 = type metadata accessor for AsyncCompactMapSequence.Iterator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AsyncCompactMapSequence<PromptCompletionStream, Token>.Iterator);
    }
  }
}

uint64_t sub_25F91591C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in AsyncThrowingStream<>.init<A>(_:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  return closure #1 in AsyncThrowingStream<>.init<A>(_:)(a1, v7, v8, v4, v5, v6);
}

uint64_t partial apply for specialized closure #1 in StreamWithTimeout.Iterator.next()(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  v4[5] = a1;
  v4[6] = v1;
  return MEMORY[0x270FA2498](closure #1 in StreamWithTimeout.Iterator.next(), 0, 0);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v7;

  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = partial apply for closure #1 in closure #2 in register<A>(documents:registrationCallback:);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to specialized closure #1 in StreamWithTimeout.Iterator.next()
                                                + async function pointer to specialized closure #1 in StreamWithTimeout.Iterator.next());
  return v5(a1, v1);
}

uint64_t outlined init with take of PromptCompletionEvent?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptCompletionEvent?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type PromptCompletionStream and conformance PromptCompletionStream(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> (@out PromptCompletion, @error @owned Error)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t specialized closure #1 in StreamWithTimeout.Iterator.next()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x270FA2498](specialized closure #1 in StreamWithTimeout.Iterator.next(), 0, 0);
}

uint64_t specialized closure #1 in StreamWithTimeout.Iterator.next()()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = v1 + 16;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  __swift_mutable_project_boxed_opaque_existential_1(v2, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v5;
  void *v5 = v0;
  v5[1] = specialized closure #1 in StreamWithTimeout.Iterator.next();
  return MEMORY[0x270FA1E80](v0 + 40, v3, v4);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](specialized closure #1 in StreamWithTimeout.Iterator.next(), 0, 0);
  }
  else
  {
    uint64_t v3 = *(_OWORD **)(v2 + 56);
    swift_endAccess();
    *uint64_t v3 = *(_OWORD *)(v2 + 40);
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized closure #1 in withTimeout<A>(timeout:_:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    uint64_t v10 = *(void *)(v8 + 16);
    *(void *)uint64_t v10 = a1;
    *(void *)(v10 + 8) = a2;
    *(double *)(v10 + 16) = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x7470697263736564;
    }
    else {
      uint64_t v3 = 0x6574656D61726170;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEB000000006E6F69;
    }
    else {
      unint64_t v4 = 0xEA00000000007372;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x7470697263736564;
      }
      else {
        uint64_t v6 = 0x6574656D61726170;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEB000000006E6F69;
      }
      else {
        unint64_t v7 = 0xEA00000000007372;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1701667182;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1701667182)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000012;
  }
  else {
    unint64_t v3 = 0x736C6F6F74;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0x800000025F92C240;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000012;
  }
  else {
    unint64_t v5 = 0x736C6F6F74;
  }
  if (a2) {
    unint64_t v6 = 0x800000025F92C240;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

BOOL _LoadedUseCaseConfigurations.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of _LoadedUseCaseConfigurations.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];
  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  Swift::Int v3 = (void *)a1[1];
  v5._countAndFlagsBits = *a1;
  v5._object = v3;
  BOOL result = _LoadedUseCaseConfigurations.CodingKeys.init(rawValue:)(v5);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x800000025F92C220;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance _LoadedUseCaseConfigurations<A>.CodingKeys()
{
  return 0xD000000000000015;
}

BOOL protocol witness for CodingKey.init(stringValue:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys@<W0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  BOOL result = _LoadedUseCaseConfigurations.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance _LoadedUseCaseConfigurations<A>.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = protocol witness for static Equatable.== infix(_:_:) in conformance CachePolicy();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance _LoadedUseCaseConfigurations<A>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t _LoadedUseCaseConfigurations.__allocating_init(from:)(void *a1)
{
  return _LoadedUseCaseConfigurations.init(from:)(a1);
}

uint64_t _LoadedUseCaseConfigurations.init(from:)(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for _LoadedUseCaseConfigurations.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v16 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v15 - v5;
  uint64_t v7 = a1[3];
  uint64_t v17 = a1;
  char v8 = __swift_project_boxed_opaque_existential_1(a1, v7);
  swift_retain();
  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = v18[8];
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v10)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
    type metadata accessor for _LoadedUseCaseConfigurations();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v16;
    type metadata accessor for Dictionary();
    uint64_t WitnessTable = swift_getWitnessTable();
    v18[5] = MEMORY[0x263F8D348];
    v18[6] = WitnessTable;
    swift_getWitnessTable();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    *(void *)(v2 + direct field offset for _LoadedUseCaseConfigurations.useCaseConfigurations) = v18[0];
    swift_release();
    uint64_t v14 = (uint64_t)v17;
    outlined init with copy of PromptCompletionEvent((uint64_t)v17, (uint64_t)v18);
    uint64_t v9 = _LoadedModelConfiguration.init(from:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v4);
    __swift_destroy_boxed_opaque_existential_1Tm(v14);
  }
  return v9;
}

uint64_t type metadata accessor for _LoadedUseCaseConfigurations.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for _LoadedUseCaseConfigurations()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t _LoadedUseCaseConfigurations.configuration(for:fallbackToDefault:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = *v3;
  uint64_t v9 = *(uint64_t *)((char *)v3 + direct field offset for _LoadedUseCaseConfigurations.useCaseConfigurations);
  if (!v9
    || (uint64_t v25 = a1,
        unint64_t v26 = a2,
        uint64_t v10 = *(void *)(v7 + class metadata base offset for _LoadedUseCaseConfigurations),
        swift_bridgeObjectRetain(),
        MEMORY[0x261200B30](&v27, &v25, v9, MEMORY[0x263F8D310], v10, MEMORY[0x263F8D320]),
        swift_bridgeObjectRelease(),
        (uint64_t result = v27) == 0))
  {
    if ((a3 & 1) == 0)
    {
      if (one-time initialization token for assets != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      __swift_project_value_buffer(v17, (uint64_t)static Log.assets);
      swift_bridgeObjectRetain_n();
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        uint64_t v25 = v21;
        *(_DWORD *)uint64_t v20 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v25);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25F79F000, v18, v19, "No model configuration for use case - %s. Not going to fallback to default config", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261201C80](v21, -1, -1);
        MEMORY[0x261201C80](v20, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return 0;
    }
    if (one-time initialization token for assets != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)static Log.assets);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v25 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25F79F000, v13, v14, "No model configuration for use case - %s. Fallback to default config", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261201C80](v16, -1, -1);
      MEMORY[0x261201C80](v15, -1, -1);

      if (!v9) {
        goto LABEL_15;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!v9)
      {
LABEL_15:
        uint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_25F79F000, v22, v23, "Missing default model configuration", v24, 2u);
          MEMORY[0x261201C80](v24, -1, -1);
        }

        return 0;
      }
    }
    uint64_t v25 = 0x73746C7561666564;
    unint64_t v26 = 0xE800000000000000;
    MEMORY[0x261200B30](&v27, &v25, v9, MEMORY[0x263F8D310], *(void *)(v8 + class metadata base offset for _LoadedUseCaseConfigurations), MEMORY[0x263F8D320]);
    uint64_t result = v27;
    if (v27) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

uint64_t _LoadedUseCaseConfigurations.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t _LoadedUseCaseConfigurations.deinit()
{
  uint64_t v0 = _LoadedModelConfiguration.deinit();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _LoadedUseCaseConfigurations.__deallocating_deinit()
{
  _LoadedModelConfiguration.deinit();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t _UseCaseConfiguration.toolItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _UseCaseConfiguration.samplingParameters.getter@<X0>(uint64_t a1@<X8>)
{
  outlined init with take of Locale?(v1 + 24, (uint64_t)v4, &demangling cache variable for type metadata for SamplingParameters?);
  outlined init with take of Locale?((uint64_t)v4, a1, &demangling cache variable for type metadata for SamplingParameters?);
  return outlined retain of SamplingParameters((uint64_t)v4);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance _UseCaseConfiguration.CodingKeys(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance _UseCaseConfiguration.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance _UseCaseConfiguration.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance _UseCaseConfiguration.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance _UseCaseConfiguration.CodingKeys@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of _UseCaseConfiguration.CodingKeys.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance _UseCaseConfiguration.CodingKeys(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x736C6F6F74;
  if (*v1) {
    unint64_t v2 = 0xD000000000000012;
  }
  unint64_t v3 = 0x800000025F92C240;
  if (!*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance _UseCaseConfiguration.CodingKeys()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0x736C6F6F74;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance _UseCaseConfiguration.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of _UseCaseConfiguration.CodingKeys.init(rawValue:), v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance _UseCaseConfiguration.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance _UseCaseConfiguration.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t _UseCaseConfiguration.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  _UseCaseConfiguration.init(from:)(a1);
  return v2;
}

uint64_t _UseCaseConfiguration.init(from:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v65 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for Schema();
  unint64_t v69 = *(void (***)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v63 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ToolDescription?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v91 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for ToolDescription(0);
  uint64_t v71 = *(void *)(v67 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v67);
  uint64_t v74 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v51 - v9;
  uint64_t v11 = type metadata accessor for ToolItem();
  uint64_t v70 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<_UseCaseConfiguration.CodingKeys>);
  uint64_t v64 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  uint64_t v73 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  lazy protocol witness table accessor for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys();
  unint64_t v18 = v75;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v18)
  {
    uint64_t v19 = v72;
LABEL_29:
    type metadata accessor for _UseCaseConfiguration();
    swift_deallocPartialClassInstance();
    goto LABEL_30;
  }
  uint64_t v20 = v70;
  uint64_t v61 = v11;
  uint64_t v62 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ToolItem]);
  LOBYTE(v76[0]) = 0;
  lazy protocol witness table accessor for type [ToolItem] and conformance <A> [A]();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v53 = v14;
  uint64_t v54 = 0;
  if ((void)v78)
  {
    uint64_t v52 = v16;
    uint64_t v21 = *(void *)(v78 + 16);
    if (v21)
    {
      uint64_t v22 = v78 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
      uint64_t v23 = *(void *)(v20 + 72);
      uint64_t v57 = (void (**)(char *, uint64_t, uint64_t))(v69 + 4);
      uint64_t v58 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 6);
      uint64_t v55 = (void (**)(char *, uint64_t))(v69 + 1);
      uint64_t v56 = (void (**)(char *, char *, uint64_t))(v69 + 2);
      unint64_t v69 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56);
      uint64_t v70 = v23;
      uint64_t v68 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48);
      uint64_t v51 = v78;
      swift_bridgeObjectRetain();
      unint64_t v75 = MEMORY[0x263F8EE78];
      uint64_t v24 = v65;
      uint64_t v25 = (uint64_t)v91;
      uint64_t v26 = v67;
      while (1)
      {
        outlined init with copy of ToolItem(v22, (uint64_t)v13);
        uint64_t v27 = v13[1];
        if (v27)
        {
          uint64_t v28 = (uint64_t)v24;
          uint64_t v29 = v13[3];
          if (v29)
          {
            uint64_t v30 = v13[2];
            uint64_t v59 = *v13;
            uint64_t v60 = v30;
            outlined init with copy of Schema?((uint64_t)v13 + *(int *)(v61 + 24), v28);
            uint64_t v31 = v66;
            if ((*v58)(v28, 1, v66) != 1)
            {
              uint64_t v33 = v63;
              (*v57)(v63, v28, v31);
              uint64_t v34 = type metadata accessor for FunctionDescription(0);
              (*v56)(&v91[*(int *)(v34 + 24)], v33, v31);
              *(void *)uint64_t v91 = v59;
              *((void *)v91 + 1) = v27;
              *((void *)v91 + 2) = v60;
              *((void *)v91 + 3) = v29;
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v91, 0, 2, v34);
              uint64_t v35 = *v55;
              swift_bridgeObjectRetain();
              uint64_t v24 = v65;
              swift_bridgeObjectRetain();
              uint64_t v36 = v33;
              uint64_t v25 = (uint64_t)v91;
              v35(v36, v31);
              uint64_t v32 = 0;
              uint64_t v26 = v67;
              goto LABEL_16;
            }
            outlined destroy of GenerativeFunctionsInstrumentationEvent?(v28, &demangling cache variable for type metadata for Schema?);
            uint64_t v32 = 1;
            uint64_t v26 = v67;
          }
          else
          {
            uint64_t v32 = 1;
          }
          uint64_t v24 = (char *)v28;
        }
        else
        {
          uint64_t v32 = 1;
        }
LABEL_16:
        (*v69)(v25, v32, 1, v26);
        outlined destroy of ToolItem((uint64_t)v13);
        if ((*v68)(v25, 1, v26) == 1)
        {
          outlined destroy of GenerativeFunctionsInstrumentationEvent?(v25, &demangling cache variable for type metadata for ToolDescription?);
        }
        else
        {
          uint64_t v37 = (uint64_t)v62;
          outlined init with take of ToolDescription(v25, (uint64_t)v62);
          outlined init with take of ToolDescription(v37, v74);
          uint64_t v38 = v24;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v39 = v75;
          }
          else {
            unint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v75 + 16) + 1, 1, v75);
          }
          unint64_t v41 = *(void *)(v39 + 16);
          unint64_t v40 = *(void *)(v39 + 24);
          uint64_t v42 = v71;
          uint64_t v43 = v74;
          if (v41 >= v40 >> 1)
          {
            uint64_t v45 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1, v39);
            uint64_t v42 = v71;
            unint64_t v39 = v45;
            uint64_t v43 = v74;
          }
          *(void *)(v39 + 16) = v41 + 1;
          unint64_t v44 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
          unint64_t v75 = v39;
          outlined init with take of ToolDescription(v43, v39 + v44 + *(void *)(v42 + 72) * v41);
          uint64_t v24 = v38;
        }
        v22 += v70;
        if (!--v21)
        {
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
      }
    }
    unint64_t v75 = MEMORY[0x263F8EE78];
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v19 = v72;
    uint64_t v16 = v52;
    uint64_t v47 = v53;
    uint64_t v48 = v64;
    unint64_t v46 = v75;
  }
  else
  {
    unint64_t v46 = 0;
    uint64_t v47 = v53;
    uint64_t v48 = v64;
    uint64_t v19 = v72;
  }
  *(void *)(v19 + 16) = v46;
  char v89 = 1;
  lazy protocol witness table accessor for type SamplingParametersEnvelope and conformance SamplingParametersEnvelope();
  uint64_t v49 = v54;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  if (v49)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v47);
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  outlined init with take of Locale?((uint64_t)v90, (uint64_t)v86, &demangling cache variable for type metadata for SamplingParametersEnvelope?);
  outlined init with take of Locale?((uint64_t)v86, (uint64_t)v87, &demangling cache variable for type metadata for SamplingParametersEnvelope?);
  if (_s15TokenGeneration26SamplingParametersEnvelopeVSgWOg((uint64_t)v87) == 1)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v47);
    _s15TokenGeneration18SamplingParametersVSgWOi0_((uint64_t)&v78);
  }
  else
  {
    long long v84 = v87[6];
    *(_OWORD *)long long v85 = v87[7];
    *(_WORD *)&v85[16] = v88;
    long long v80 = v87[2];
    long long v81 = v87[3];
    long long v82 = v87[4];
    long long v83 = v87[5];
    long long v78 = v87[0];
    long long v79 = v87[1];
    SamplingParametersEnvelope.unseal()((uint64_t)v76);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v47);
    outlined release of SamplingParametersEnvelope((uint64_t)v86);
    long long v84 = v76[6];
    *(_OWORD *)long long v85 = *(_OWORD *)v77;
    *(_DWORD *)&v85[15] = *(_DWORD *)&v77[15];
    long long v80 = v76[2];
    long long v81 = v76[3];
    long long v82 = v76[4];
    long long v83 = v76[5];
    long long v78 = v76[0];
    long long v79 = v76[1];
    protocol witness for Hashable.hash(into:) in conformance CachePolicy(&v78);
  }
  outlined init with take of Locale?((uint64_t)&v78, v19 + 24, &demangling cache variable for type metadata for SamplingParameters?);
LABEL_30:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
  return v19;
}

uint64_t _UseCaseConfiguration.deinit()
{
  swift_bridgeObjectRelease();
  outlined init with take of Locale?(v0 + 24, (uint64_t)v2, &demangling cache variable for type metadata for SamplingParameters?);
  outlined release of SamplingParametersEnvelope((uint64_t)v2);
  return v0;
}

uint64_t _UseCaseConfiguration.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  outlined init with take of Locale?(v0 + 24, (uint64_t)v2, &demangling cache variable for type metadata for SamplingParameters?);
  outlined release of SamplingParametersEnvelope((uint64_t)v2);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Decodable.init(from:) in conformance _UseCaseConfiguration@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 96))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ToolItem.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ToolItem.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ToolItem.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ToolItem.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ToolItem.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized ToolItem.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ToolItem.CodingKeys(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xEB000000006E6F69;
  uint64_t v5 = 0x7470697263736564;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6574656D61726170;
    unint64_t v4 = 0xEA00000000007372;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1701667182;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ToolItem.CodingKeys()
{
  uint64_t v1 = 0x7470697263736564;
  if (*v0 != 1) {
    uint64_t v1 = 0x6574656D61726170;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance ToolItem.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized ToolItem.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ToolItem.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ToolItem.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ToolItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v38 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GenerationSchema?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v43 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for GenerationSchema();
  uint64_t v39 = *(void *)(v42 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v42);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ToolItem.CodingKeys>);
  uint64_t v41 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ToolItem();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (uint64_t *)((char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = a1[3];
  unint64_t v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  lazy protocol witness table accessor for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys();
  uint64_t v19 = v45;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v19) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  uint64_t v36 = v11;
  uint64_t v37 = v15;
  uint64_t v45 = v9;
  uint64_t v20 = v42;
  uint64_t v21 = (uint64_t)v43;
  uint64_t v22 = v41;
  char v48 = 0;
  *uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v17[1] = v24;
  char v47 = 1;
  v17[2] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v17[3] = v25;
  char v46 = 2;
  lazy protocol witness table accessor for type ToolItem and conformance ToolItem(&lazy protocol witness table cache variable for type GenerationSchema and conformance GenerationSchema, MEMORY[0x263F40C58]);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v26 = v39;
  int v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v21, 1, v20);
  uint64_t v28 = v40;
  if (v27 == 1)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v12);
    outlined destroy of GenerativeFunctionsInstrumentationEvent?(v21, &demangling cache variable for type metadata for GenerationSchema?);
    uint64_t v29 = (char *)v17 + *(int *)(v37 + 24);
    uint64_t v30 = type metadata accessor for Schema();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
  }
  else
  {
    uint64_t v31 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v36, v21, v20);
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v45, v31, v20);
    uint64_t v32 = v26;
    uint64_t v33 = (uint64_t)v38;
    Schema.init(type:)();
    uint64_t v34 = v31;
    uint64_t v28 = v40;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v20);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v12);
    uint64_t v35 = type metadata accessor for Schema();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v33, 0, 1, v35);
    outlined init with take of Locale?(v33, (uint64_t)v17 + *(int *)(v37 + 24), &demangling cache variable for type metadata for Schema?);
  }
  outlined init with copy of ToolItem((uint64_t)v17, v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  return outlined destroy of ToolItem((uint64_t)v17);
}

uint64_t protocol witness for Decodable.init(from:) in conformance ToolItem@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ToolItem.init(from:)(a1, a2);
}

uint64_t type metadata accessor for ToolItem()
{
  uint64_t result = type metadata singleton initialization cache for ToolItem;
  if (!type metadata singleton initialization cache for ToolItem) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys;
  if (!lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys;
  if (!lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys;
  if (!lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys;
  if (!lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _UseCaseConfiguration.CodingKeys and conformance _UseCaseConfiguration.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for _UseCaseConfiguration()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type [ToolItem] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [ToolItem] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [ToolItem] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [ToolItem]);
    lazy protocol witness table accessor for type ToolItem and conformance ToolItem(&lazy protocol witness table cache variable for type ToolItem and conformance ToolItem, (void (*)(uint64_t))type metadata accessor for ToolItem);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [ToolItem] and conformance <A> [A]);
  }
  return result;
}

uint64_t outlined init with copy of ToolItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ToolItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ToolItem(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ToolItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of ToolDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ToolDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of Schema?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of UsecaseConfigurationProtocol.tools(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of UsecaseConfigurationProtocol.samplingParameters(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata instantiation function for _LoadedUseCaseConfigurations()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for _LoadedUseCaseConfigurations()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for _LoadedUseCaseConfigurations(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _LoadedUseCaseConfigurations);
}

uint64_t dispatch thunk of _LoadedUseCaseConfigurations.configuration(for:fallbackToDefault:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for _LoadedUseCaseConfigurations + *v0 + 16))();
}

uint64_t method lookup function for _UseCaseConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _UseCaseConfiguration);
}

uint64_t dispatch thunk of _UseCaseConfiguration.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for _UseCaseConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x25F918C74);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for _UseCaseConfiguration.CodingKeys()
{
  return &unk_270BC1AB0;
}

uint64_t *initializeBufferWithCopyOfBuffer for ToolItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
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
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for Schema();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t destroy for ToolItem(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Schema();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for ToolItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Schema();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

void *assignWithCopy for ToolItem(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Schema();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for ToolItem(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Schema();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithTake for ToolItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Schema();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25F9194C4);
}

uint64_t sub_25F9194C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for ToolItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25F919598);
}

uint64_t sub_25F919598(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Schema?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for ToolItem()
{
  type metadata accessor for Schema?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Schema?()
{
  if (!lazy cache variable for type metadata for Schema?)
  {
    type metadata accessor for Schema();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Schema?);
    }
  }
}

uint64_t type metadata instantiation function for _LoadedUseCaseConfigurations.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

unsigned char *storeEnumTagSinglePayload for _LoadedUseCaseConfigurations.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25F9197D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t base witness table accessor for Equatable in _LoadedUseCaseConfigurations<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomDebugStringConvertible in _LoadedUseCaseConfigurations<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomStringConvertible in _LoadedUseCaseConfigurations<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

unint64_t lazy protocol witness table accessor for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ToolItem.CodingKeys and conformance ToolItem.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ToolItem and conformance ToolItem(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for ToolItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25F919AC4);
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

void *type metadata accessor for ToolItem.CodingKeys()
{
  return &unk_270BC4610;
}

unint64_t specialized ToolItem.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ToolItem.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE68](percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x270EF0090]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.hash(into:)()
{
  return MEMORY[0x270EF0190]();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x270EF0D78]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x270EF0EE0]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t dispatch thunk of CatalogClient.resourceBundle(for:)()
{
  return MEMORY[0x270F4BC68]();
}

uint64_t CatalogClient.init()()
{
  return MEMORY[0x270F4BC98]();
}

uint64_t type metadata accessor for CatalogClient()
{
  return MEMORY[0x270F4BCA0]();
}

uint64_t AssetBackedLLMBundle.id.getter()
{
  return MEMORY[0x270F4BF30]();
}

uint64_t type metadata accessor for AssetBackedLLMBundle()
{
  return MEMORY[0x270F4BF48]();
}

uint64_t ResourceBundleIdentifier.init(stringLiteral:)()
{
  return MEMORY[0x270F4BFC0]();
}

uint64_t LLMBundle.id.getter()
{
  return MEMORY[0x270F4C148]();
}

uint64_t type metadata accessor for LLMBundle()
{
  return MEMORY[0x270F4C160]();
}

uint64_t Token.init(text:)()
{
  return MEMORY[0x270F7F350]();
}

uint64_t Token.text.getter()
{
  return MEMORY[0x270F7F358]();
}

uint64_t type metadata accessor for Token()
{
  return MEMORY[0x270F7F360]();
}

Swift::Int __swiftcall Prompt.overestimatedTokenCount()()
{
  return MEMORY[0x270F7F368]();
}

uint64_t static Prompt.averageCharactersPerToken.getter()
{
  return MEMORY[0x270F7F370]();
}

uint64_t Prompt.SpecialToken.init(identifier:instance:locale:)()
{
  return MEMORY[0x270F7F380]();
}

uint64_t Prompt.SpecialToken.init(identifier:)()
{
  return MEMORY[0x270F7F388]();
}

uint64_t Prompt.SpecialToken.identifier.getter()
{
  return MEMORY[0x270F7F390]();
}

uint64_t static Prompt.SpecialToken.== infix(_:_:)()
{
  return MEMORY[0x270F7F398]();
}

uint64_t static Prompt.SpecialToken.Chat.instructions.getter()
{
  return MEMORY[0x270F7F3A8]();
}

uint64_t static Prompt.SpecialToken.Chat.defaultInstructions(locale:)()
{
  return MEMORY[0x270F7F3B0]();
}

uint64_t static Prompt.SpecialToken.Chat.defaultInstructions.getter()
{
  return MEMORY[0x270F7F3B8]();
}

uint64_t static Prompt.SpecialToken.Chat.tool.getter()
{
  return MEMORY[0x270F7F3C8]();
}

uint64_t static Prompt.SpecialToken.Chat.user.getter()
{
  return MEMORY[0x270F7F3D8]();
}

uint64_t static Prompt.SpecialToken.Chat.turnEnd(locale:)()
{
  return MEMORY[0x270F7F3E0]();
}

uint64_t static Prompt.SpecialToken.Chat.turnEnd.getter()
{
  return MEMORY[0x270F7F3E8]();
}

uint64_t static Prompt.SpecialToken.Chat.response(locale:)()
{
  return MEMORY[0x270F7F3F0]();
}

uint64_t static Prompt.SpecialToken.Chat.response.getter()
{
  return MEMORY[0x270F7F3F8]();
}

uint64_t Prompt.SpecialToken.locale.getter()
{
  return MEMORY[0x270F7F400]();
}

uint64_t Prompt.SpecialToken.locale.setter()
{
  return MEMORY[0x270F7F408]();
}

uint64_t static Prompt.SpecialToken.ToolUse.toolResult(id:)()
{
  return MEMORY[0x270F7F410]();
}

uint64_t static Prompt.SpecialToken.ToolUse.actionStart.getter()
{
  return MEMORY[0x270F7F418]();
}

uint64_t static Prompt.SpecialToken.ToolUse.toolCall(id:)()
{
  return MEMORY[0x270F7F420]();
}

uint64_t static Prompt.SpecialToken.ToolUse.actionEnd.getter()
{
  return MEMORY[0x270F7F428]();
}

uint64_t Prompt.SpecialToken.instance.getter()
{
  return MEMORY[0x270F7F430]();
}

uint64_t type metadata accessor for Prompt.SpecialToken()
{
  return MEMORY[0x270F7F438]();
}

uint64_t Prompt.Attachment.init(content:position:priority:)()
{
  return MEMORY[0x270F7F458]();
}

uint64_t Prompt.Attachment.content.getter()
{
  return MEMORY[0x270F7F460]();
}

uint64_t Prompt.Attachment.position.getter()
{
  return MEMORY[0x270F7F468]();
}

uint64_t Prompt.Attachment.position.setter()
{
  return MEMORY[0x270F7F470]();
}

uint64_t Prompt.Attachment.priority.getter()
{
  return MEMORY[0x270F7F478]();
}

uint64_t type metadata accessor for Prompt.Attachment()
{
  return MEMORY[0x270F7F480]();
}

uint64_t Prompt.delimiters.getter()
{
  return MEMORY[0x270F7F488]();
}

uint64_t Prompt.attachments.getter()
{
  return MEMORY[0x270F7F490]();
}

uint64_t Prompt.init(stringLiteral:)()
{
  return MEMORY[0x270F7F4A0]();
}

uint64_t static Prompt.ImageAttachment.== infix(_:_:)()
{
  return MEMORY[0x270F7F4A8]();
}

uint64_t Prompt.ImageAttachment.data.getter()
{
  return MEMORY[0x270F7F4B0]();
}

uint64_t type metadata accessor for Prompt.ImageAttachment.Format()
{
  return MEMORY[0x270F7F4B8]();
}

uint64_t Prompt.ImageAttachment.init(format:data:)()
{
  return MEMORY[0x270F7F4C0]();
}

uint64_t Prompt.ImageAttachment.format.getter()
{
  return MEMORY[0x270F7F4C8]();
}

uint64_t type metadata accessor for Prompt.ImageAttachment()
{
  return MEMORY[0x270F7F4D0]();
}

uint64_t type metadata accessor for Prompt.AttachmentContent()
{
  return MEMORY[0x270F7F4D8]();
}

uint64_t Prompt.StringInterpolation.appendInterpolation(image:)()
{
  return MEMORY[0x270F7F4E0]();
}

Swift::Void __swiftcall Prompt.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t Prompt.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F7F4F0]();
}

uint64_t type metadata accessor for Prompt.StringInterpolation()
{
  return MEMORY[0x270F7F4F8]();
}

uint64_t Prompt.init(stringInterpolation:)()
{
  return MEMORY[0x270F7F500]();
}

uint64_t static Prompt.== infix(_:_:)()
{
  return MEMORY[0x270F7F508]();
}

{
  return MEMORY[0x270F58208]();
}

uint64_t static Prompt.+= infix(_:_:)()
{
  return MEMORY[0x270F7F510]();
}

{
  return MEMORY[0x270F7F518]();
}

{
  return MEMORY[0x270F7F520]();
}

uint64_t Prompt.init(string:delimiters:attachments:)()
{
  return MEMORY[0x270F7F528]();
}

uint64_t Prompt.string.getter()
{
  return MEMORY[0x270F7F530]();
}

uint64_t Prompt.Delimiter.init(token:position:priority:)()
{
  return MEMORY[0x270F7F538]();
}

uint64_t Prompt.Delimiter.token.getter()
{
  return MEMORY[0x270F7F540]();
}

uint64_t Prompt.Delimiter.position.getter()
{
  return MEMORY[0x270F7F548]();
}

uint64_t Prompt.Delimiter.position.setter()
{
  return MEMORY[0x270F7F550]();
}

uint64_t Prompt.Delimiter.priority.getter()
{
  return MEMORY[0x270F7F558]();
}

uint64_t type metadata accessor for Prompt.Delimiter()
{
  return MEMORY[0x270F7F560]();
}

uint64_t Prompt.Rendering.originalPrompt.getter()
{
  return MEMORY[0x270F7F568]();
}

uint64_t Prompt.Rendering.renderedString.getter()
{
  return MEMORY[0x270F7F570]();
}

uint64_t Prompt.Rendering.detokenizedString.getter()
{
  return MEMORY[0x270F7F578]();
}

uint64_t static Prompt.Rendering.== infix(_:_:)()
{
  return MEMORY[0x270F7F580]();
}

uint64_t Prompt.Rendering.Source.init(identifier:version:)()
{
  return MEMORY[0x270F7F588]();
}

uint64_t Prompt.Rendering.Source.identifier.getter()
{
  return MEMORY[0x270F7F590]();
}

uint64_t Prompt.Rendering.Source.version.getter()
{
  return MEMORY[0x270F7F598]();
}

uint64_t type metadata accessor for Prompt.Rendering.Source()
{
  return MEMORY[0x270F7F5A0]();
}

uint64_t Prompt.Rendering.init(source:segments:renderedString:originalPrompt:tokenIDs:userInfo:detokenizedString:)()
{
  return MEMORY[0x270F7F5A8]();
}

uint64_t Prompt.Rendering.source.getter()
{
  return MEMORY[0x270F7F5B8]();
}

uint64_t Prompt.Rendering.segments.getter()
{
  return MEMORY[0x270F7F5C0]();
}

uint64_t Prompt.Rendering.tokenIDs.getter()
{
  return MEMORY[0x270F7F5C8]();
}

uint64_t Prompt.Rendering.userInfo.getter()
{
  return MEMORY[0x270F7F5D0]();
}

uint64_t type metadata accessor for Prompt.Rendering()
{
  return MEMORY[0x270F7F5D8]();
}

uint64_t type metadata accessor for Prompt()
{
  return MEMORY[0x270F7F5E0]();
}

{
  return MEMORY[0x270F582E8]();
}

uint64_t Prompt.init(_:)()
{
  return MEMORY[0x270F7F5E8]();
}

{
  return MEMORY[0x270F582F0]();
}

uint64_t OverrideHint.value.getter()
{
  return MEMORY[0x270F2FCA8]();
}

uint64_t _ClientInfoSessionTrackingConfig.sessionTrackingConifg.getter()
{
  return MEMORY[0x270F2FDE8]();
}

uint64_t _ClientInfoSessionTrackingConfig._internalSessionTrackingConfig.getter()
{
  return MEMORY[0x270F2FDF0]();
}

uint64_t type metadata accessor for _ClientInfoSessionTrackingConfig()
{
  return MEMORY[0x270F2FDF8]();
}

uint64_t type metadata accessor for StringResponseSanitizerWithRunner()
{
  return MEMORY[0x270F2FE00]();
}

uint64_t Overridable.wrappedValue.getter()
{
  return MEMORY[0x270F7F680]();
}

uint64_t Overridable<A>.init(key:)()
{
  return MEMORY[0x270F7F690]();
}

uint64_t type metadata accessor for Overridable()
{
  return MEMORY[0x270F7F6A8]();
}

uint64_t type metadata accessor for AutomationJSON.SamplingStrategyConfiguration()
{
  return MEMORY[0x270F7F6C8]();
}

uint64_t ModelConfiguration.promptTemplate(for:)()
{
  return MEMORY[0x270F7F750]();
}

uint64_t ModelConfiguration.init(modelbundleIdentifier:)()
{
  return MEMORY[0x270F7F758]();
}

{
  return MEMORY[0x270F7F760]();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return MEMORY[0x270F7F770]();
}

uint64_t PromptTemplateInfo.init(templateID:richVariableBindings:locale:)()
{
  return MEMORY[0x270F7F778]();
}

uint64_t PromptTemplateInfo.templateID.getter()
{
  return MEMORY[0x270F7F780]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.init(components:)()
{
  return MEMORY[0x270F7F790]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.components.getter()
{
  return MEMORY[0x270F7F798]();
}

uint64_t static PromptTemplateInfo.RichVariableBinding.Component.Content.Text.selfAttention(string:)()
{
  return MEMORY[0x270F7F7A0]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.Content.Text.isSelfAttention.getter()
{
  return MEMORY[0x270F7F7A8]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.Content.Text.init(string:isSelfAttention:)()
{
  return MEMORY[0x270F7F7B0]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.Content.Text.init(string:)()
{
  return MEMORY[0x270F7F7B8]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.Content.Text.string.getter()
{
  return MEMORY[0x270F7F7C0]();
}

uint64_t type metadata accessor for PromptTemplateInfo.RichVariableBinding.Component.Content.Text()
{
  return MEMORY[0x270F7F7C8]();
}

uint64_t type metadata accessor for PromptTemplateInfo.RichVariableBinding.Component.Content()
{
  return MEMORY[0x270F7F7D0]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.init(content:)()
{
  return MEMORY[0x270F7F7D8]();
}

uint64_t PromptTemplateInfo.RichVariableBinding.Component.content.getter()
{
  return MEMORY[0x270F7F7E0]();
}

uint64_t type metadata accessor for PromptTemplateInfo.RichVariableBinding.Component()
{
  return MEMORY[0x270F7F7E8]();
}

uint64_t type metadata accessor for PromptTemplateInfo.RichVariableBinding()
{
  return MEMORY[0x270F7F7F0]();
}

uint64_t PromptTemplateInfo.richVariableBindings.getter()
{
  return MEMORY[0x270F7F7F8]();
}

uint64_t PromptTemplateInfo.locale.getter()
{
  return MEMORY[0x270F7F800]();
}

uint64_t type metadata accessor for PromptTemplateInfo()
{
  return MEMORY[0x270F7F808]();
}

uint64_t _LoadedModelConfiguration.init(from:)()
{
  return MEMORY[0x270F7F868]();
}

uint64_t _LoadedModelConfiguration.deinit()
{
  return MEMORY[0x270F7F888]();
}

uint64_t ModelConfigurationPromptTemplate.rawTemplateString.getter()
{
  return MEMORY[0x270F7F890]();
}

uint64_t type metadata accessor for ModelConfigurationPromptTemplate()
{
  return MEMORY[0x270F7F898]();
}

uint64_t ModelInstance.assetBundleIdentifier.getter()
{
  return MEMORY[0x270F4C168]();
}

uint64_t type metadata accessor for ModelInstance()
{
  return MEMORY[0x270F4C170]();
}

uint64_t type metadata accessor for ModelManagerError()
{
  return MEMORY[0x270F4C188]();
}

uint64_t ClientData.xpcData.getter()
{
  return MEMORY[0x270F4C1A8]();
}

uint64_t ClientData.init(data:xpcData:)()
{
  return MEMORY[0x270F4C1B0]();
}

uint64_t ClientData.data.getter()
{
  return MEMORY[0x270F4C1B8]();
}

uint64_t ClientData.init(data:)()
{
  return MEMORY[0x270F4C1C0]();
}

uint64_t type metadata accessor for ClientData()
{
  return MEMORY[0x270F4C1C8]();
}

uint64_t InferenceError.Context.init(additionalDescription:domain:code:userInfo:fallbackAllowed:)()
{
  return MEMORY[0x270F4C1D0]();
}

uint64_t InferenceError.Context.additionalDescription.getter()
{
  return MEMORY[0x270F4C1D8]();
}

uint64_t InferenceError.Context.code.getter()
{
  return MEMORY[0x270F4C1E0]();
}

uint64_t InferenceError.Context.domain.getter()
{
  return MEMORY[0x270F4C1E8]();
}

uint64_t InferenceError.Context.userInfo.getter()
{
  return MEMORY[0x270F4C1F0]();
}

uint64_t type metadata accessor for InferenceError.Context()
{
  return MEMORY[0x270F4C1F8]();
}

uint64_t InferenceError.context.getter()
{
  return MEMORY[0x270F4C200]();
}

uint64_t InferenceError.caseName.getter()
{
  return MEMORY[0x270F4C208]();
}

uint64_t type metadata accessor for InferenceError()
{
  return MEMORY[0x270F4C210]();
}

uint64_t OneShotRequest.__allocating_init(session:loggingIdentifier:clientData:requiredAssetIDs:)()
{
  return MEMORY[0x270F4C220]();
}

uint64_t type metadata accessor for OneShotRequest()
{
  return MEMORY[0x270F4C230]();
}

uint64_t ResponseStream.makeAsyncIterator()()
{
  return MEMORY[0x270F4C238]();
}

uint64_t type metadata accessor for ResponseIterator()
{
  return MEMORY[0x270F4C248]();
}

uint64_t ResponseSequence.makeAsyncIterator()()
{
  return MEMORY[0x270F4C250]();
}

uint64_t type metadata accessor for ResponseSequence()
{
  return MEMORY[0x270F4C258]();
}

uint64_t dispatch thunk of StreamingRequest.execute()()
{
  return MEMORY[0x270F4C268]();
}

uint64_t StreamingRequest.__allocating_init(session:loggingIdentifier:clientData:requiredAssetIDs:)()
{
  return MEMORY[0x270F4C270]();
}

uint64_t type metadata accessor for StreamingRequest()
{
  return MEMORY[0x270F4C280]();
}

uint64_t InferenceProviderRequestConfiguration.requestUUID.getter()
{
  return MEMORY[0x270F4C350]();
}

uint64_t InferenceProviderRequestConfiguration.sessionUUID.getter()
{
  return MEMORY[0x270F4C358]();
}

uint64_t InferenceProviderRequestConfiguration.useCaseIdentifier.getter()
{
  return MEMORY[0x270F4C378]();
}

uint64_t type metadata accessor for InferenceProviderRequestConfiguration()
{
  return MEMORY[0x270F4C388]();
}

uint64_t Request.executeStream()()
{
  return MEMORY[0x270F4C3A8]();
}

uint64_t Request.init(session:loggingIdentifier:clientData:requiredAssetTypes:)()
{
  return MEMORY[0x270F4C3B8]();
}

uint64_t type metadata accessor for Request()
{
  return MEMORY[0x270F4C3C8]();
}

uint64_t Session.fetchModelInfo()()
{
  return MEMORY[0x270F4C3D0]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Session.requestPrewarm()()
{
}

uint64_t Session.__allocating_init(supportedAssetBundleIdentifiers:useCaseID:onBehalfOfPID:parentOfOnBehalfOfPid:loggingIdentifier:sessionSetID:)()
{
  return MEMORY[0x270F4C3E0]();
}

Swift::Void __swiftcall Session.cancel()()
{
}

uint64_t type metadata accessor for Session()
{
  return MEMORY[0x270F4C408]();
}

uint64_t SelfAttention.text.getter()
{
  return MEMORY[0x270F2FEA0]();
}

uint64_t type metadata accessor for SelfAttention()
{
  return MEMORY[0x270F2FEA8]();
}

Swift::String_optional __swiftcall PromptTemplate.loadRawPromptTemplateFromFallbackPromptTemplateCatalog()()
{
  uint64_t v0 = MEMORY[0x270F2FEB8]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t PromptTemplate.templateID.getter()
{
  return MEMORY[0x270F2FEC0]();
}

uint64_t type metadata accessor for PromptTemplate.ModelBundleID()
{
  return MEMORY[0x270F2FEC8]();
}

uint64_t PromptTemplate.modelBundleID.getter()
{
  return MEMORY[0x270F2FEE8]();
}

uint64_t static PromptTemplate.name.getter()
{
  return MEMORY[0x270F2FEF0]();
}

uint64_t type metadata accessor for PromptTemplate()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t DocumentResource.fileDescriptor.getter()
{
  return MEMORY[0x270F2FF08]();
}

uint64_t DocumentResource.url.getter()
{
  return MEMORY[0x270F2FF10]();
}

uint64_t DocumentResource.init(url:)()
{
  return MEMORY[0x270F2FF18]();
}

uint64_t DocumentResource.metadata.getter()
{
  return MEMORY[0x270F2FF20]();
}

uint64_t type metadata accessor for DocumentResource()
{
  return MEMORY[0x270F2FF28]();
}

uint64_t DocumentResource.init(_:_:_:)()
{
  return MEMORY[0x270F2FF30]();
}

uint64_t static DocumentRegistration.registering(progress:url:)()
{
  return MEMORY[0x270F2FF38]();
}

uint64_t type metadata accessor for DocumentRegistration.InternalStatus()
{
  return MEMORY[0x270F2FF40]();
}

uint64_t DocumentRegistration.internalStatus.getter()
{
  return MEMORY[0x270F2FF48]();
}

uint64_t DocumentRegistration.url.getter()
{
  return MEMORY[0x270F2FF50]();
}

uint64_t static DocumentRegistration.error(description:url:)()
{
  return MEMORY[0x270F2FF58]();
}

uint64_t type metadata accessor for DocumentRegistration.Status()
{
  return MEMORY[0x270F2FF60]();
}

uint64_t DocumentRegistration.status.getter()
{
  return MEMORY[0x270F2FF68]();
}

uint64_t DocumentRegistration.Progress.totalBytes.getter()
{
  return MEMORY[0x270F2FF70]();
}

uint64_t DocumentRegistration.Progress.bytes.getter()
{
  return MEMORY[0x270F2FF78]();
}

uint64_t DocumentRegistration.Progress.init(progress:bytes:totalBytes:)()
{
  return MEMORY[0x270F2FF80]();
}

uint64_t DocumentRegistration.Progress.progress.getter()
{
  return MEMORY[0x270F2FF88]();
}

uint64_t type metadata accessor for DocumentRegistration.Progress()
{
  return MEMORY[0x270F2FF90]();
}

uint64_t static DocumentRegistration.finished(identifier:url:)()
{
  return MEMORY[0x270F2FF98]();
}

uint64_t type metadata accessor for DocumentRegistration()
{
  return MEMORY[0x270F2FFA0]();
}

uint64_t type metadata accessor for ModelBundleIdentifier()
{
  return MEMORY[0x270F2FFA8]();
}

uint64_t static DocumentResourceIdentifier.== infix(_:_:)()
{
  return MEMORY[0x270F2FFC8]();
}

uint64_t type metadata accessor for DocumentResourceIdentifier()
{
  return MEMORY[0x270F2FFE8]();
}

uint64_t StringResponseSanitizerWithConfiguration.init(stringResponseSanitizer:configuration:)()
{
  return MEMORY[0x270F2FFF0]();
}

uint64_t StringResponseSanitizerWithConfiguration.scrub<A>(_:elementToContent:)()
{
  return MEMORY[0x270F2FFF8]();
}

uint64_t type metadata accessor for StringResponseSanitizerWithConfiguration()
{
  return MEMORY[0x270F30008]();
}

uint64_t StringResponseSanitizerRunnerConfiguration.init(generativeFunctionInstrumenter:modelBundleIdentifier:useCaseIdentifier:onBehalfOfProcessId:)()
{
  return MEMORY[0x270F30010]();
}

uint64_t type metadata accessor for StringResponseSanitizerRunnerConfiguration()
{
  return MEMORY[0x270F30018]();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizerWithConfiguration()
{
  return MEMORY[0x270F30028]();
}

uint64_t StringRenderedPromptSanitizerRunnerConfiguration.init(generativeFunctionInstrumenter:modelBundleIdentifier:useCaseIdentifier:onBehalfOfProcessId:)()
{
  return MEMORY[0x270F30030]();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizerRunnerConfiguration()
{
  return MEMORY[0x270F30038]();
}

uint64_t type metadata accessor for GenerativeExperiencesTransparencyLog.ExecutionEnvironment()
{
  return MEMORY[0x270F43620]();
}

uint64_t GenerativeFunctionsInstrumentationError.GenericError.code.setter()
{
  return MEMORY[0x270F43740]();
}

uint64_t GenerativeFunctionsInstrumentationError.GenericError.domain.setter()
{
  return MEMORY[0x270F43750]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationError.GenericError()
{
  return MEMORY[0x270F43758]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationError()
{
  return MEMORY[0x270F437B8]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.Identifiers.useCaseIdentifier.setter()
{
  return MEMORY[0x270F437D0]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.Identifiers.catalogResourceIdentifier.setter()
{
  return MEMORY[0x270F43810]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.Identifiers.modelManagerRequestIdentifier.setter()
{
  return MEMORY[0x270F43858]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.Identifiers.modelManagerSessionIdentifier.setter()
{
  return MEMORY[0x270F43868]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationEvent.Identifiers()
{
  return MEMORY[0x270F43898]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.identifiers.setter()
{
  return MEMORY[0x270F438B8]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion.identifier.setter()
{
  return MEMORY[0x270F438F8]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion.version.setter()
{
  return MEMORY[0x270F43908]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationEvent.CatalogResourceIdentifierAndVersion()
{
  return MEMORY[0x270F43918]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.error.setter()
{
  return MEMORY[0x270F43930]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationEvent.Subtype()
{
  return MEMORY[0x270F43948]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.subtype.setter()
{
  return MEMORY[0x270F43960]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.metadata.setter()
{
  return MEMORY[0x270F43978]();
}

uint64_t GenerativeFunctionsInstrumentationEvent.eventType.setter()
{
  return MEMORY[0x270F43990]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationEvent()
{
  return MEMORY[0x270F439A8]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.RequestType()
{
  return MEMORY[0x270F43AC8]();
}

uint64_t GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.requestType.setter()
{
  return MEMORY[0x270F43AD8]();
}

uint64_t GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.outputImagesCount.setter()
{
  return MEMORY[0x270F43AF0]();
}

uint64_t GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest.outputTokensCount.setter()
{
  return MEMORY[0x270F43B00]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationMetadata.TGIExecuteRequest()
{
  return MEMORY[0x270F43C10]();
}

uint64_t type metadata accessor for GenerativeFunctionsInstrumentationMetadata()
{
  return MEMORY[0x270F441A8]();
}

uint64_t static Buildable.with(_:)()
{
  return MEMORY[0x270F44210]();
}

uint64_t static GenerativeError.networkingError(retryAfterDate:)()
{
  return MEMORY[0x270F2EF60]();
}

uint64_t static GenerativeError.invalidatedError()()
{
  return MEMORY[0x270F2EF68]();
}

uint64_t GenerativeError.AvailabilityError.ErrorType.RateLimitedErrorInfo.init(retryAfterDate:)()
{
  return MEMORY[0x270F2EF78]();
}

uint64_t GenerativeError.AvailabilityError.ErrorType.UseCaseDisabledErrorInfo.init(useCaseIdentifier:)()
{
  return MEMORY[0x270F2EF88]();
}

uint64_t type metadata accessor for GenerativeError.AvailabilityError.ErrorType.ResourceUnavailableErrorInfo.AssetType()
{
  return MEMORY[0x270F2EF90]();
}

uint64_t GenerativeError.AvailabilityError.ErrorType.ResourceUnavailableErrorInfo.init(assetType:)()
{
  return MEMORY[0x270F2EF98]();
}

uint64_t type metadata accessor for GenerativeError.AvailabilityError.ErrorType()
{
  return MEMORY[0x270F2EFA0]();
}

uint64_t static GenerativeError.availabilityError(type:)()
{
  return MEMORY[0x270F2EFB8]();
}

uint64_t static GenerativeError.authenticationError()()
{
  return MEMORY[0x270F2EFC0]();
}

uint64_t GenerativeError.ToolError.ErrorContext.init(name:description:)()
{
  return MEMORY[0x270F2EFD0]();
}

uint64_t type metadata accessor for GenerativeError.ToolError.ErrorContext()
{
  return MEMORY[0x270F2EFD8]();
}

uint64_t static GenerativeError.toolError(context:)()
{
  return MEMORY[0x270F2EFE0]();
}

uint64_t GenerativeError.PromptError.ErrorType.TooManyTokensErrorInfo.init(tokenCount:tokenCountMaximum:)()
{
  return MEMORY[0x270F2EFE8]();
}

uint64_t GenerativeError.PromptError.ErrorType.InvalidPromptFormatInfo.init(debugDescription:)()
{
  return MEMORY[0x270F2F068]();
}

uint64_t type metadata accessor for GenerativeError.PromptError.ErrorType.InvalidPromptFormatInfo()
{
  return MEMORY[0x270F2F070]();
}

uint64_t type metadata accessor for GenerativeError.PromptError.ErrorType()
{
  return MEMORY[0x270F2F078]();
}

uint64_t static GenerativeError.promptError(type:)()
{
  return MEMORY[0x270F2F090]();
}

uint64_t GenerativeError.RuntimeError.ErrorType.ConfigurationErrorInfo.ErrorType.UnboundBindableConfigurationErrorInfo.init(bindableConfiguration:)()
{
  return MEMORY[0x270F2F098]();
}

uint64_t GenerativeError.RuntimeError.ErrorType.ConfigurationErrorInfo.ErrorType.UnboundBindableVariableErrorInfo.init(bindableVariable:)()
{
  return MEMORY[0x270F2F0A8]();
}

uint64_t GenerativeError.RuntimeError.ErrorType.ConfigurationErrorInfo.ErrorType.UnknownModelBundleIdentifierErrorInfo.init(modelBundleIdentifier:)()
{
  return MEMORY[0x270F2F0B0]();
}

uint64_t GenerativeError.RuntimeError.ErrorType.ConfigurationErrorInfo.ErrorType.UnspecifiedModelBundleIdentifierErrorInfo.init()()
{
  return MEMORY[0x270F2F0B8]();
}

uint64_t type metadata accessor for GenerativeError.RuntimeError.ErrorType.ConfigurationErrorInfo.ErrorType()
{
  return MEMORY[0x270F2F0C0]();
}

uint64_t static GenerativeError.RuntimeError.ErrorType.configurationError(type:)()
{
  return MEMORY[0x270F2F0C8]();
}

uint64_t GenerativeError.RuntimeError.ErrorType.TimeoutErrorInfo.init(retryAfterDate:)()
{
  return MEMORY[0x270F2F0D8]();
}

uint64_t type metadata accessor for GenerativeError.RuntimeError.ErrorType()
{
  return MEMORY[0x270F2F0F0]();
}

uint64_t GenerativeError.RuntimeError.type.getter()
{
  return MEMORY[0x270F2F0F8]();
}

uint64_t type metadata accessor for GenerativeError.RuntimeError()
{
  return MEMORY[0x270F2F100]();
}

uint64_t static GenerativeError.runtimeError(type:)()
{
  return MEMORY[0x270F2F108]();
}

uint64_t GenerativeError.DocumentError.ErrorContext.init(url:description:)()
{
  return MEMORY[0x270F2F110]();
}

uint64_t type metadata accessor for GenerativeError.DocumentError.ErrorContext()
{
  return MEMORY[0x270F2F118]();
}

uint64_t static GenerativeError.canceledError()()
{
  return MEMORY[0x270F2F120]();
}

uint64_t static GenerativeError.documentError(context:)()
{
  return MEMORY[0x270F2F128]();
}

uint64_t type metadata accessor for GenerativeError.ErrorType()
{
  return MEMORY[0x270F2F130]();
}

uint64_t GenerativeError.type.getter()
{
  return MEMORY[0x270F2F140]();
}

uint64_t type metadata accessor for GenerativeError()
{
  return MEMORY[0x270F2F150]();
}

uint64_t type metadata accessor for GenerativeStream()
{
  return MEMORY[0x270F2F168]();
}

uint64_t ToolChoice.FunctionChoice.name.getter()
{
  return MEMORY[0x270F2F170]();
}

uint64_t type metadata accessor for ToolChoice.FunctionChoice()
{
  return MEMORY[0x270F2F178]();
}

uint64_t static ToolChoice.none.getter()
{
  return MEMORY[0x270F2F180]();
}

uint64_t type metadata accessor for ToolChoice.Value()
{
  return MEMORY[0x270F2F188]();
}

uint64_t ToolChoice.value.getter()
{
  return MEMORY[0x270F2F190]();
}

uint64_t static ToolChoice.function(name:)()
{
  return MEMORY[0x270F2F198]();
}

uint64_t static ToolChoice.required.getter()
{
  return MEMORY[0x270F2F1A0]();
}

uint64_t static ToolChoice.automatic.getter()
{
  return MEMORY[0x270F2F1A8]();
}

uint64_t type metadata accessor for ToolChoice()
{
  return MEMORY[0x270F2F1B0]();
}

uint64_t static GenerationSchema.== infix(_:_:)()
{
  return MEMORY[0x270F2F220]();
}

uint64_t type metadata accessor for GenerationSchema()
{
  return MEMORY[0x270F2F270]();
}

uint64_t CompletionResponse.init(content:)()
{
  return MEMORY[0x270F2F290]();
}

uint64_t ChatMessageResponse.init(role:content:)()
{
  return MEMORY[0x270F2F2F0]();
}

uint64_t static Schema.== infix(_:_:)()
{
  return MEMORY[0x270F2F418]();
}

uint64_t Schema.type.getter()
{
  return MEMORY[0x270F2F420]();
}

uint64_t Schema.init(type:)()
{
  return MEMORY[0x270F2F428]();
}

uint64_t type metadata accessor for Schema()
{
  return MEMORY[0x270F2F458]();
}

uint64_t dispatch thunk of Tooling.usageDescription.getter()
{
  return MEMORY[0x270F2F460]();
}

uint64_t dispatch thunk of Tooling.name.getter()
{
  return MEMORY[0x270F2F468]();
}

uint64_t type metadata accessor for ToolType.Type()
{
  return MEMORY[0x270F2F488]();
}

uint64_t static ToolType.imageGenerator.getter()
{
  return MEMORY[0x270F2F490]();
}

uint64_t ToolType.type.getter()
{
  return MEMORY[0x270F2F498]();
}

uint64_t static ToolType.browser.getter()
{
  return MEMORY[0x270F2F4A0]();
}

uint64_t ToolType.Function.parameters.getter()
{
  return MEMORY[0x270F2F4B0]();
}

uint64_t ToolType.Function.description.getter()
{
  return MEMORY[0x270F2F4B8]();
}

uint64_t ToolType.Function.name.getter()
{
  return MEMORY[0x270F2F4C0]();
}

uint64_t type metadata accessor for ToolType.Function()
{
  return MEMORY[0x270F2F4C8]();
}

uint64_t static ToolType.function(name:description:parameters:)()
{
  return MEMORY[0x270F2F4D0]();
}

uint64_t type metadata accessor for ToolType()
{
  return MEMORY[0x270F2F4D8]();
}

uint64_t dispatch thunk of static Generable.schema.getter()
{
  return MEMORY[0x270F2F4E8]();
}

uint64_t static Generable.decode(data:)()
{
  return MEMORY[0x270F2F4F8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t GenerativeFunctionInstrumenter.executionEnd(error:)()
{
  return MEMORY[0x270F2F560]();
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.inferenceEnd()()
{
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.executionBegin()()
{
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.inferenceBegin()()
{
}

uint64_t GenerativeFunctionInstrumenter.functionIdentifier.getter()
{
  return MEMORY[0x270F2F590]();
}

uint64_t GenerativeFunctionInstrumenter.invocationIdentifier.getter()
{
  return MEMORY[0x270F2F598]();
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.promptConstructionEnd()()
{
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.responseProcessingEnd()()
{
}

uint64_t GenerativeFunctionInstrumenter.clientRequestIdentifier.getter()
{
  return MEMORY[0x270F2F5B0]();
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.promptConstructionBegin()()
{
}

Swift::Void __swiftcall GenerativeFunctionInstrumenter.responseProcessingBegin()()
{
}

uint64_t type metadata accessor for GenerativeFunctionInstrumenter()
{
  return MEMORY[0x270F2F5D8]();
}

uint64_t EventReporter.send(eventBuiltWithPresetsAnd:)()
{
  return MEMORY[0x270F2F668]();
}

uint64_t EventReporter.init()()
{
  return MEMORY[0x270F2F678]();
}

uint64_t type metadata accessor for EventReporter()
{
  return MEMORY[0x270F2F680]();
}

uint64_t TransparencyReport.logEvent(configuration:prompt:response:executionEnvironment:)()
{
  return MEMORY[0x270F2F6C8]();
}

uint64_t TransparencyReport.init()()
{
  return MEMORY[0x270F2F6D8]();
}

uint64_t type metadata accessor for TransparencyReport()
{
  return MEMORY[0x270F2F6E0]();
}

uint64_t XPCCodableObject.copyUnderlyingXPCObject()()
{
  return MEMORY[0x270FA1D00]();
}

uint64_t XPCCodableObject.init(copying:)()
{
  return MEMORY[0x270FA1D10]();
}

uint64_t type metadata accessor for XPCCodableObject()
{
  return MEMORY[0x270FA1D28]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t type metadata accessor for Insecure.MD5()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t Insecure.MD5Digest.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEB0E8]();
}

uint64_t type metadata accessor for Insecure.MD5Digest()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t type metadata accessor for CompletionPrompt()
{
  return MEMORY[0x270F58050]();
}

uint64_t ChatMessagePrompt.asCustomData<A>(type:)()
{
  return MEMORY[0x270F58070]();
}

uint64_t ChatMessagePrompt.init(role:prompt:)()
{
  return MEMORY[0x270F58088]();
}

uint64_t ChatMessagePrompt.role.getter()
{
  return MEMORY[0x270F58098]();
}

uint64_t ChatMessagePrompt.locale.getter()
{
  return MEMORY[0x270F580A0]();
}

uint64_t ChatMessagePrompt.prompt.modify()
{
  return MEMORY[0x270F580A8]();
}

uint64_t ChatMessagePrompt.prompt.getter()
{
  return MEMORY[0x270F580B0]();
}

uint64_t type metadata accessor for ChatMessagePrompt()
{
  return MEMORY[0x270F580B8]();
}

uint64_t ChatMessagesPrompt.chatMessages.getter()
{
  return MEMORY[0x270F580C8]();
}

uint64_t ChatMessagesPrompt.locale(_:)()
{
  return MEMORY[0x270F580E0]();
}

uint64_t type metadata accessor for ChatMessagesPrompt()
{
  return MEMORY[0x270F580E8]();
}

uint64_t ChatMessagesPrompt.init(_:)()
{
  return MEMORY[0x270F580F8]();
}

uint64_t RawPrompt.init(text:originalPrompt:segments:tokenIDs:)()
{
  return MEMORY[0x270F58120]();
}

uint64_t static CustomPromptBuilder.buildBlock(_:)()
{
  return MEMORY[0x270F58128]();
}

uint64_t static CustomPromptBuilder.buildExpression(_:)()
{
  return MEMORY[0x270F58130]();
}

uint64_t Prompt.ToolResult.id.getter()
{
  return MEMORY[0x270F58158]();
}

uint64_t Prompt.ToolResult.Text.value.getter()
{
  return MEMORY[0x270F58160]();
}

uint64_t type metadata accessor for Prompt.ToolResult.Text()
{
  return MEMORY[0x270F58168]();
}

uint64_t type metadata accessor for Prompt.ToolResult.Content()
{
  return MEMORY[0x270F58178]();
}

uint64_t Prompt.ToolResult.content.getter()
{
  return MEMORY[0x270F58180]();
}

uint64_t type metadata accessor for Prompt.ToolResult()
{
  return MEMORY[0x270F58188]();
}

uint64_t Prompt.init(components:)()
{
  return MEMORY[0x270F58190]();
}

uint64_t Prompt.components.modify()
{
  return MEMORY[0x270F58198]();
}

uint64_t Prompt.components.getter()
{
  return MEMORY[0x270F581A0]();
}

uint64_t Prompt.components.setter()
{
  return MEMORY[0x270F581A8]();
}

uint64_t type metadata accessor for Prompt.ImageFormat()
{
  return MEMORY[0x270F581B0]();
}

uint64_t type metadata accessor for Prompt.RenderError()
{
  return MEMORY[0x270F581B8]();
}

uint64_t type metadata accessor for Prompt.ToolCall.Content()
{
  return MEMORY[0x270F58220]();
}

uint64_t Prompt.ToolCall.content.getter()
{
  return MEMORY[0x270F58228]();
}

uint64_t Prompt.ToolCall.Function.name.getter()
{
  return MEMORY[0x270F58230]();
}

uint64_t Prompt.ToolCall.Function.arguments.getter()
{
  return MEMORY[0x270F58238]();
}

uint64_t type metadata accessor for Prompt.ToolCall.Function()
{
  return MEMORY[0x270F58240]();
}

uint64_t type metadata accessor for Prompt.ToolCall()
{
  return MEMORY[0x270F58250]();
}

uint64_t Prompt.init(template:)()
{
  return MEMORY[0x270F58258]();
}

uint64_t Prompt.Component.Value.CustomData.name.getter()
{
  return MEMORY[0x270F58268]();
}

uint64_t Prompt.Component.Value.CustomData.value<A>(type:)()
{
  return MEMORY[0x270F58270]();
}

uint64_t type metadata accessor for Prompt.Component.Value.CustomData()
{
  return MEMORY[0x270F58278]();
}

uint64_t type metadata accessor for Prompt.Component.Value()
{
  return MEMORY[0x270F58280]();
}

uint64_t Prompt.Component.init(value:priority:privacy:)()
{
  return MEMORY[0x270F58288]();
}

uint64_t Prompt.Component.value.getter()
{
  return MEMORY[0x270F58290]();
}

uint64_t Prompt.Component.value.setter()
{
  return MEMORY[0x270F58298]();
}

uint64_t type metadata accessor for Prompt.Component.Privacy()
{
  return MEMORY[0x270F582A0]();
}

uint64_t type metadata accessor for Prompt.Component()
{
  return MEMORY[0x270F582A8]();
}

uint64_t Prompt.ImageData.data.getter()
{
  return MEMORY[0x270F582B0]();
}

uint64_t Prompt.ImageData.format.getter()
{
  return MEMORY[0x270F582C0]();
}

uint64_t type metadata accessor for Prompt.ImageData()
{
  return MEMORY[0x270F582C8]();
}

uint64_t dispatch thunk of PromptComponentValueConvertible.toValue()()
{
  return MEMORY[0x270F582F8]();
}

uint64_t SpecialToken.overestimatedTokenCount.getter()
{
  return MEMORY[0x270F58308]();
}

uint64_t SpecialToken.init(identifier:overestimatedTokenCount:)()
{
  return MEMORY[0x270F58310]();
}

uint64_t SpecialToken.identifier.getter()
{
  return MEMORY[0x270F58320]();
}

uint64_t type metadata accessor for SpecialToken()
{
  return MEMORY[0x270F58330]();
}

uint64_t static ChatMessageRole.== infix(_:_:)()
{
  return MEMORY[0x270F58338]();
}

uint64_t type metadata accessor for ChatMessageRole()
{
  return MEMORY[0x270F58340]();
}

uint64_t BindableVariable.name.getter()
{
  return MEMORY[0x270F58350]();
}

uint64_t BindableVariable.toValue()()
{
  return MEMORY[0x270F58358]();
}

uint64_t type metadata accessor for BindableVariable()
{
  return MEMORY[0x270F58360]();
}

uint64_t BindableConfiguration.name.getter()
{
  return MEMORY[0x270F58370]();
}

uint64_t type metadata accessor for BindableConfiguration()
{
  return MEMORY[0x270F58378]();
}

uint64_t type metadata accessor for GenerativeConfigurationKey()
{
  return MEMORY[0x270F58388]();
}

uint64_t GenerativeConfigurationKey.init(_:)()
{
  return MEMORY[0x270F58390]();
}

uint64_t GenerativeConfigurationProtocol.stringRenderedPromptSanitizer.getter()
{
  return MEMORY[0x270F30048]();
}

uint64_t GenerativeConfigurationProtocol.stringResponseSanitizer.getter()
{
  return MEMORY[0x270F30058]();
}

uint64_t GenerativeConfigurationProtocol.trackingConfig.getter()
{
  return MEMORY[0x270F2F500]();
}

uint64_t GenerativeConfigurationProtocol._internalTrackingConfig.getter()
{
  return MEMORY[0x270F2F518]();
}

uint64_t GenerativeConfigurationProtocol.generateGenerativeFunctionInstrumenter(useCaseIdentifier:eventReporter:)()
{
  return MEMORY[0x270F2F800]();
}

uint64_t GenerativeConfigurationProtocol._internalSessionTrackingConfig.getter()
{
  return MEMORY[0x270F30060]();
}

uint64_t GenerativeConfigurationProtocol._getRunnableConfiguration<A>(for:type:)()
{
  return MEMORY[0x270F58398]();
}

uint64_t GenerativeConfigurationProtocol._setRunnableConfiguration<A>(_:value:)()
{
  return MEMORY[0x270F583A0]();
}

uint64_t GenerativeConfigurationProtocol.chatMessagesPromptBindings.getter()
{
  return MEMORY[0x270F583A8]();
}

uint64_t GenerativeConfigurationProtocol._getOverridableConfiguration<A>(for:type:)()
{
  return MEMORY[0x270F583B8]();
}

uint64_t GenerativeConfigurationProtocol._setOverridableConfiguration<A>(_:value:)()
{
  return MEMORY[0x270F583C0]();
}

uint64_t GenerativeConfigurationProtocol.promptContent.getter()
{
  return MEMORY[0x270F583D8]();
}

uint64_t GenerativeConfigurationProtocol.variableBindings.getter()
{
  return MEMORY[0x270F583E0]();
}

uint64_t GenerativeConfigurationProtocol.configurationBindings.getter()
{
  return MEMORY[0x270F583F0]();
}

uint64_t System.toChatMessagePrompt()()
{
  return MEMORY[0x270F58418]();
}

uint64_t type metadata accessor for System()
{
  return MEMORY[0x270F58420]();
}

uint64_t System.init(_:)()
{
  return MEMORY[0x270F58428]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return MEMORY[0x270F9D468]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return MEMORY[0x270EF18F0]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270EF1928]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x270EF1938]();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return MEMORY[0x270EF1950]();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return MEMORY[0x270EF1958]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x270F9D750]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D760]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.insert(_:at:)()
{
  return MEMORY[0x270F9D7B0]();
}

uint64_t String.remove(at:)()
{
  return MEMORY[0x270F9D7B8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array<A>.bind(chatMessagesPromptBindings:)()
{
  return MEMORY[0x270F58438]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x270FA1FE8]();
}

Swift::Void __swiftcall ThrowingTaskGroup.cancelAll()()
{
}

uint64_t type metadata accessor for ThrowingTaskGroup()
{
  return MEMORY[0x270FA2070]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x270FA2080]();
}

uint64_t AsyncSequence.map<A>(_:)()
{
  return MEMORY[0x270FA2090]();
}

{
  return MEMORY[0x270FA2098]();
}

uint64_t static AsyncThrowingStream.makeStream<>(of:throwing:bufferingPolicy:)()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t AsyncThrowingStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Iterator()
{
  return MEMORY[0x270FA2108]();
}

uint64_t AsyncThrowingStream.init<>(unfolding:)()
{
  return MEMORY[0x270FA2110]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t AsyncMapSequence.base.getter()
{
  return MEMORY[0x270FA2210]();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x270FA2218]();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return MEMORY[0x270FA2220]();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return MEMORY[0x270FA2228]();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return MEMORY[0x270FA2230]();
}

uint64_t type metadata accessor for AsyncMapSequence()
{
  return MEMORY[0x270FA2238]();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return MEMORY[0x270FA2240]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x270F9F048]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x270F9F050]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t CollectionDifference.insertions.getter()
{
  return MEMORY[0x270F9F0F8]();
}

uint64_t CollectionDifference.removals.getter()
{
  return MEMORY[0x270F9F110]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F280]();
}

{
  return MEMORY[0x270F9F290]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F300]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F310]();
}

{
  return MEMORY[0x270F9F330]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x270F9F378]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3B8]();
}

{
  return MEMORY[0x270F9F3C0]();
}

{
  return MEMORY[0x270F9F3D0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F440]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F450]();
}

{
  return MEMORY[0x270F9F470]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t AsyncCompactMapSequence.base.getter()
{
  return MEMORY[0x270FA22D0]();
}

uint64_t AsyncCompactMapSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x270FA22D8]();
}

uint64_t AsyncCompactMapSequence.Iterator.transform.getter()
{
  return MEMORY[0x270FA22E8]();
}

uint64_t type metadata accessor for AsyncCompactMapSequence.Iterator()
{
  return MEMORY[0x270FA22F0]();
}

uint64_t AsyncCompactMapSequence.Iterator.init(_:transform:)()
{
  return MEMORY[0x270FA22F8]();
}

uint64_t AsyncCompactMapSequence.transform.getter()
{
  return MEMORY[0x270FA2300]();
}

uint64_t AsyncCompactMapSequence.init(_:transform:)()
{
  return MEMORY[0x270FA2310]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t type metadata accessor for AsyncThrowingMapSequence()
{
  return MEMORY[0x270FA2328]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x270F9F730]();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x270F9F920]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x270FA2378]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t static Duration.seconds(_:)()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x270EDC1C8](*(void *)&fd);
}