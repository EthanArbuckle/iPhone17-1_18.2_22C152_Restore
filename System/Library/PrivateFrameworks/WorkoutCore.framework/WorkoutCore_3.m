void (*Apple_Workout_Core_WorkoutStatePublisher.workoutStarted.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 16);
  return sub_236C4C400;
}

void sub_236C4C400(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 16);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4C4EC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(void *)(v7 + 24) = v3;
  *(unsigned char *)(v7 + 32) = 0;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.workoutStartDateReferenceTime.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  double v6 = *(double *)(v5 + 24);
  if (*(unsigned char *)(v5 + 32)) {
    double v6 = 0.0;
  }
  *((double *)v3 + 9) = v6;
  return sub_236C4C638;
}

void sub_236C4C638(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 72);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 88);
    uint64_t v7 = *(void *)(v3 + 80);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = *(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88));
  swift_beginAccess();
  *(void *)(v10 + 24) = v4;
  *(unsigned char *)(v10 + 32) = 0;

  free((void *)v3);
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearWorkoutStartDateReferenceTime()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = swift_retain();
    uint64_t v4 = sub_236C51DA4(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2);
  swift_beginAccess();
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 32) = 1;
}

uint64_t sub_236C4C7D4(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v7 + 33) = v3;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.workoutActive.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 33);
  return sub_236C4C90C;
}

void sub_236C4C90C(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 33);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4C9F8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  swift_beginAccess();
  *a2 = *(void *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_236C4CA54(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  swift_beginAccess();
  *(void *)(v7 + 40) = v3;
  return swift_bridgeObjectRelease();
}

void (*Apple_Workout_Core_WorkoutStatePublisher.pauseTimes.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  v3[9] = *(void *)(v5 + 40);
  swift_bridgeObjectRetain();
  return sub_236C4CBA4;
}

void sub_236C4CBA4(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v4 = *(int *)(v2 + 88);
      uint64_t v5 = *(void *)(v2 + 80);
      type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v6 = swift_retain();
      uint64_t v7 = sub_236C51DA4(v6);
      swift_release();
      *(void *)(v5 + v4) = v7;
      swift_release();
    }
    uint64_t v8 = *(void *)(*(void *)(v2 + 80) + *(int *)(v2 + 88));
    swift_beginAccess();
    *(void *)(v8 + 40) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v9 = *(int *)(v2 + 88);
      uint64_t v10 = *(void *)(v2 + 80);
      type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v11 = swift_retain();
      uint64_t v12 = sub_236C51DA4(v11);
      swift_release();
      *(void *)(v10 + v9) = v12;
      swift_release();
    }
    uint64_t v13 = *(void *)(*(void *)(v2 + 80) + *(int *)(v2 + 88));
    swift_beginAccess();
    *(void *)(v13 + 40) = v3;
  }
  swift_bridgeObjectRelease();

  free((void *)v2);
}

uint64_t sub_236C4CD1C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(void *)(v7 + 48) = v3;
  *(unsigned char *)(v7 + 56) = 0;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.lastUnbalancedPauseStartReferenceTime.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  double v6 = *(double *)(v5 + 48);
  if (*(unsigned char *)(v5 + 56)) {
    double v6 = 0.0;
  }
  *((double *)v3 + 9) = v6;
  return sub_236C4CE68;
}

void sub_236C4CE68(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 72);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 88);
    uint64_t v7 = *(void *)(v3 + 80);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = *(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88));
  swift_beginAccess();
  *(void *)(v10 + 48) = v4;
  *(unsigned char *)(v10 + 56) = 0;

  free((void *)v3);
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearLastUnbalancedPauseStartReferenceTime()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = swift_retain();
    uint64_t v4 = sub_236C51DA4(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2);
  swift_beginAccess();
  *(void *)(v5 + 48) = 0;
  *(unsigned char *)(v5 + 56) = 1;
}

uint64_t sub_236C4D004(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v7 + 57) = v3;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.gpsLock.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 57);
  return sub_236C4D13C;
}

void sub_236C4D13C(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 57);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4D228(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v7 + 58) = v3;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.gpsUnavailable.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 58);
  return sub_236C4D360;
}

void sub_236C4D360(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 58);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4D44C(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v7 + 59) = v3;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.showGymKitConnectionStatus.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 59);
  return sub_236C4D584;
}

void sub_236C4D584(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 59);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4D670(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v7 + 60) = v3;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.lowPowerModeAnimationSuspended.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *(unsigned char *)(v5 + 60);
  return sub_236C4D7A8;
}

void sub_236C4D7A8(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80)) + 60);
  swift_beginAccess();
  unsigned char *v10 = v4;

  free((void *)v3);
}

uint64_t sub_236C4D894(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Workout_Core_Activity(0);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236C52F48(a1, (uint64_t)v4, type metadata accessor for Apple_Workout_Core_Activity);
  return Apple_Workout_Core_WorkoutStatePublisher.activityType.setter((uint64_t)v4);
}

void (*Apple_Workout_Core_WorkoutStatePublisher.activityType.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8498);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for Apple_Workout_Core_Activity(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20))
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  sub_236A731D0(v10, (uint64_t)v5, &qword_2688A8498);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v9[4] = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 2) = sub_236B78CB8(MEMORY[0x263F8EE78]);
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    sub_236A73174((uint64_t)v5, &qword_2688A8498);
  }
  else
  {
    sub_236C53010((uint64_t)v5, (uint64_t)v9, type metadata accessor for Apple_Workout_Core_Activity);
  }
  return sub_236C4DAF0;
}

void sub_236C4DAF0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  uint64_t v4 = *(void **)(*(void *)a1 + 48);
  uint64_t v5 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    sub_236C52F48(*(void *)(*(void *)a1 + 48), (uint64_t)v3, type metadata accessor for Apple_Workout_Core_Activity);
    Apple_Workout_Core_WorkoutStatePublisher.activityType.setter((uint64_t)v3);
    sub_236C52FB0((uint64_t)v4, type metadata accessor for Apple_Workout_Core_Activity);
  }
  else
  {
    Apple_Workout_Core_WorkoutStatePublisher.activityType.setter(*(void *)(*(void *)a1 + 48));
  }
  free(v4);
  free(v3);
  free(v5);

  free(v2);
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearActivityType()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8498);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v6 = swift_retain();
    uint64_t v7 = sub_236C51DA4(v6);
    swift_release();
    *(void *)(v1 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = type metadata accessor for Apple_Workout_Core_Activity(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = v8
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  swift_retain();
  sub_236B2D674((uint64_t)v4, v10);
  swift_endAccess();
  swift_release();
}

void (*Apple_Workout_Core_WorkoutStatePublisher.mirroringToCompanion.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5;
  return sub_236C4DD9C;
}

void sub_236C4DD9C(uint64_t *a1, char a2)
{
}

uint64_t sub_236C4DDA8(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v7 = *a1;
  uint64_t v8 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v9 = swift_retain();
    uint64_t v10 = sub_236C51DA4(v9);
    swift_release();
    *(void *)(a2 + v8) = v10;
    swift_release();
  }
  uint64_t v11 = (unsigned char *)(*(void *)(a2 + v8) + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v11 = v7;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.mirrorModeEnabled.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5;
  return sub_236C4DEF8;
}

void sub_236C4DEF8(uint64_t *a1, char a2)
{
}

void sub_236C4DF04(uint64_t *a1, char a2, void *a3)
{
  uint64_t v5 = *a1;
  char v6 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v8 = *(int *)(v5 + 80);
    uint64_t v9 = *(void *)(v5 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v10 = swift_retain();
    uint64_t v11 = sub_236C51DA4(v10);
    swift_release();
    *(void *)(v9 + v8) = v11;
    swift_release();
  }
LABEL_4:
  uint64_t v12 = (unsigned char *)(*(void *)(*(void *)(v5 + 72) + *(int *)(v5 + 80)) + *a3);
  swift_beginAccess();
  *uint64_t v12 = v6;

  free((void *)v5);
}

void (*Apple_Workout_Core_WorkoutStatePublisher.isGymKit.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return sub_236C4E090;
}

void sub_236C4E090(uint64_t *a1, char a2)
{
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearIsGymKit()()
{
}

void (*Apple_Workout_Core_WorkoutStatePublisher.multisportWorkoutInAutoMode.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return sub_236C4E140;
}

void sub_236C4E140(uint64_t *a1, char a2)
{
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearMultisportWorkoutInAutoMode()()
{
}

uint64_t sub_236C4E158(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(v3 + v4) = v6;
    swift_release();
  }
  char v7 = (unsigned char *)(*(void *)(v3 + v4) + *a1);
  uint64_t result = swift_beginAccess();
  *char v7 = 2;
  return result;
}

uint64_t sub_236C4E214@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20))
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  uint64_t result = swift_beginAccess();
  int v5 = *(_DWORD *)v3;
  if (*(unsigned char *)(v3 + 4)) {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_236C4E284(int *a1, uint64_t a2)
{
  int v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_236C51DA4(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4)
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v7 = v3;
  *(unsigned char *)(v7 + 4) = 0;
  return result;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.segmentIndex.modify(void *a1))(uint64_t *a1, char a2)
{
  int v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 21) = v4;
  uint64_t v5 = *(void *)(v1 + v4)
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  swift_beginAccess();
  int v6 = *(_DWORD *)v5;
  if (*(unsigned char *)(v5 + 4)) {
    int v6 = 0;
  }
  *((_DWORD *)v3 + 20) = v6;
  return sub_236C4E3E4;
}

void sub_236C4E3E4(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  int v4 = *(_DWORD *)(*a1 + 80);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 84);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_236C51DA4(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = *(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 84))
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  swift_beginAccess();
  *(_DWORD *)uint64_t v10 = v4;
  *(unsigned char *)(v10 + 4) = 0;

  free((void *)v3);
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearSegmentIndex()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = swift_retain();
    uint64_t v4 = sub_236C51DA4(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2)
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  swift_beginAccess();
  *(_DWORD *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 4) = 1;
}

void (*Apple_Workout_Core_WorkoutStatePublisher.speedSensor.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return sub_236C4E630;
}

void sub_236C4E630(uint64_t *a1, char a2)
{
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearSpeedSensor()()
{
}

void (*Apple_Workout_Core_WorkoutStatePublisher.cadenceSensor.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return sub_236C4E6E0;
}

void sub_236C4E6E0(uint64_t *a1, char a2)
{
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearCadenceSensor()()
{
}

void (*Apple_Workout_Core_WorkoutStatePublisher.powerSensor.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return sub_236C4E790;
}

void sub_236C4E790(uint64_t *a1, char a2)
{
}

Swift::Void __swiftcall Apple_Workout_Core_WorkoutStatePublisher.clearPowerSensor()()
{
}

uint64_t Apple_Workout_Core_WorkoutStatePublisher.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_236C74838();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t Apple_Workout_Core_WorkoutStatePublisher.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = sub_236C74838();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*Apple_Workout_Core_WorkoutStatePublisher.unknownFields.modify())()
{
  return nullsub_1;
}

double Apple_Workout_Core_DateInterval.startReferenceTime.getter()
{
  return *(double *)v0;
}

void Apple_Workout_Core_DateInterval.startReferenceTime.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Apple_Workout_Core_DateInterval.startReferenceTime.modify())()
{
  return nullsub_1;
}

double Apple_Workout_Core_DateInterval.endReferenceTime.getter()
{
  return *(double *)(v0 + 8);
}

void Apple_Workout_Core_DateInterval.endReferenceTime.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*Apple_Workout_Core_DateInterval.endReferenceTime.modify())()
{
  return nullsub_1;
}

uint64_t Apple_Workout_Core_DateInterval.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Apple_Workout_Core_DateInterval(0) + 24);
  uint64_t v4 = sub_236C74838();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Apple_Workout_Core_DateInterval.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Apple_Workout_Core_DateInterval(0) + 24);
  uint64_t v4 = sub_236C74838();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*Apple_Workout_Core_DateInterval.unknownFields.modify())()
{
  return nullsub_1;
}

unint64_t static Apple_Workout_Core_WorkoutStatePublisher.protoMessageName.getter()
{
  return 0xD000000000000028;
}

uint64_t sub_236C4EA4C()
{
  uint64_t v0 = sub_236C74B48();
  __swift_allocate_value_buffer(v0, qword_2688ABC98);
  __swift_project_value_buffer(v0, (uint64_t)qword_2688ABC98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688A7F58);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688A7F60) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_236C83F10;
  unint64_t v4 = v41 + v3;
  unint64_t v5 = v41 + v3 + v1[14];
  *(void *)(v41 + v3) = 1;
  *(void *)unint64_t v5 = "workoutStarted";
  *(void *)(v5 + 8) = 14;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_236C74B18();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v41 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "workoutStartDateReferenceTime";
  *(void *)(v9 + 8) = 29;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v41 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "workoutActive";
  *((void *)v11 + 1) = 13;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v41 + v3 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "pauseTimes";
  *((void *)v13 + 1) = 10;
  v13[16] = 2;
  v8();
  v14 = (void *)(v41 + v3 + 4 * v2);
  v15 = (char *)v14 + v1[14];
  void *v14 = 5;
  *(void *)v15 = "lastUnbalancedPauseStartReferenceTime";
  *((void *)v15 + 1) = 37;
  v15[16] = 2;
  v8();
  v16 = (void *)(v41 + v3 + 5 * v2);
  v17 = (char *)v16 + v1[14];
  void *v16 = 6;
  *(void *)v17 = "gpsLock";
  *((void *)v17 + 1) = 7;
  v17[16] = 2;
  v8();
  v18 = (void *)(v41 + v3 + 6 * v2);
  v19 = (char *)v18 + v1[14];
  void *v18 = 7;
  *(void *)v19 = "gpsUnavailable";
  *((void *)v19 + 1) = 14;
  v19[16] = 2;
  v8();
  v20 = (void *)(v41 + v3 + 7 * v2);
  v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)v21 = "showGymKitConnectionStatus";
  *((void *)v21 + 1) = 26;
  v21[16] = 2;
  v8();
  uint64_t v22 = v41 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "lowPowerModeAnimationSuspended";
  *(void *)(v22 + 8) = 30;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  v23 = (void *)(v41 + v3 + 9 * v2);
  v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)v24 = "activityType";
  *((void *)v24 + 1) = 12;
  v24[16] = 2;
  v8();
  v25 = (void *)(v41 + v3 + 10 * v2);
  v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)v26 = "mirroringToCompanion";
  *((void *)v26 + 1) = 20;
  v26[16] = 2;
  v8();
  v27 = (void *)(v41 + v3 + 11 * v2);
  v28 = (char *)v27 + v1[14];
  void *v27 = 12;
  *(void *)v28 = "mirrorModeEnabled";
  *((void *)v28 + 1) = 17;
  v28[16] = 2;
  v8();
  v29 = (void *)(v41 + v3 + 12 * v2);
  v30 = (char *)v29 + v1[14];
  void *v29 = 13;
  *(void *)v30 = "isGymKit";
  *((void *)v30 + 1) = 8;
  v30[16] = 2;
  v8();
  v31 = (void *)(v41 + v3 + 13 * v2);
  v32 = (char *)v31 + v1[14];
  void *v31 = 14;
  *(void *)v32 = "multisportWorkoutInAutoMode";
  *((void *)v32 + 1) = 27;
  v32[16] = 2;
  v8();
  v33 = (void *)(v41 + v3 + 14 * v2);
  v34 = (char *)v33 + v1[14];
  void *v33 = 15;
  *(void *)v34 = "segmentIndex";
  *((void *)v34 + 1) = 12;
  v34[16] = 2;
  v8();
  v35 = (void *)(v41 + v3 + 15 * v2);
  v36 = (char *)v35 + v1[14];
  void *v35 = 16;
  *(void *)v36 = "speedSensor";
  *((void *)v36 + 1) = 11;
  v36[16] = 2;
  v8();
  uint64_t v37 = v41 + v3 + 16 * v2 + v1[14];
  *(void *)(v4 + 16 * v2) = 17;
  *(void *)uint64_t v37 = "cadenceSensor";
  *(void *)(v37 + 8) = 13;
  *(unsigned char *)(v37 + 16) = 2;
  v8();
  v38 = (void *)(v41 + v3 + 17 * v2);
  v39 = (char *)v38 + v1[14];
  void *v38 = 18;
  *(void *)v39 = "powerSensor";
  *((void *)v39 + 1) = 11;
  v39[16] = 2;
  v8();
  return sub_236C74B28();
}

uint64_t static Apple_Workout_Core_WorkoutStatePublisher._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236A63294(&qword_2688A79F8, (uint64_t)qword_2688ABC98, a1);
}

uint64_t sub_236C4F004()
{
  type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
  swift_allocObject();
  uint64_t result = sub_236C4F064();
  qword_2688ABCB0 = result;
  return result;
}

uint64_t type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(uint64_t a1)
{
  return sub_236A62258(a1, (uint64_t *)&unk_2688ABD70);
}

uint64_t sub_236C4F064()
{
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(_WORD *)(v0 + 32) = 1;
  *(void *)(v0 + 40) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 48) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  *(_DWORD *)(v0 + 57) = 0;
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  uint64_t v2 = type metadata accessor for Apple_Workout_Core_Activity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion) = 0;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled) = 0;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit) = 2;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode) = 2;
  uint64_t v3 = v0
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  *(_DWORD *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 4) = 1;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor) = 2;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor) = 2;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor) = 2;
  return v0;
}

uint64_t sub_236C4F168()
{
  swift_bridgeObjectRelease();
  sub_236A73174(v0+ OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType, &qword_2688A8498);

  return swift_deallocClassInstance();
}

uint64_t Apple_Workout_Core_WorkoutStatePublisher.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v9 = swift_retain();
    uint64_t v10 = sub_236C51DA4(v9);
    swift_release();
    *(void *)(v4 + v8) = v10;
    swift_release();
  }
  uint64_t v11 = swift_retain();
  sub_236C4F2AC(v11, a1, a2, a3);
  return swift_release();
}

uint64_t sub_236C4F2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_236C748B8();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_236C00708();
          break;
        case 2:
          sub_236C4F630();
          break;
        case 3:
          sub_236C4F6B0();
          break;
        case 4:
          sub_236C4F730();
          break;
        case 5:
          sub_236C4F7F8();
          break;
        case 6:
          sub_236C4F878();
          break;
        case 7:
          sub_236C4F8F8();
          break;
        case 8:
          sub_236C4F978();
          break;
        case 9:
          sub_236C4F9F8();
          break;
        case 10:
          sub_236C4FA78();
          break;
        case 11:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505B0];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion;
          goto LABEL_5;
        case 12:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505B0];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled;
          goto LABEL_5;
        case 13:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505A8];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit;
          goto LABEL_5;
        case 14:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505A8];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode;
          goto LABEL_5;
        case 15:
          sub_236C4FB48();
          break;
        case 16:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505A8];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor;
          goto LABEL_5;
        case 17:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505A8];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor;
          goto LABEL_5;
        case 18:
          uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F505A8];
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          v16 = &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor;
LABEL_5:
          sub_236C4FBD0(v12, v13, v14, v15, v16, v11);
          break;
        default:
          break;
      }
      uint64_t result = sub_236C748B8();
    }
  }
  return result;
}

uint64_t sub_236C4F630()
{
  return swift_endAccess();
}

uint64_t sub_236C4F6B0()
{
  return swift_endAccess();
}

uint64_t sub_236C4F730()
{
  return swift_endAccess();
}

uint64_t sub_236C4F7F8()
{
  return swift_endAccess();
}

uint64_t sub_236C4F878()
{
  return swift_endAccess();
}

uint64_t sub_236C4F8F8()
{
  return swift_endAccess();
}

uint64_t sub_236C4F978()
{
  return swift_endAccess();
}

uint64_t sub_236C4F9F8()
{
  return swift_endAccess();
}

uint64_t sub_236C4FA78()
{
  return swift_endAccess();
}

uint64_t sub_236C4FB48()
{
  return swift_endAccess();
}

uint64_t sub_236C4FBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = a2 + *a5;
  swift_beginAccess();
  a6(v9, a3, a4);
  return swift_endAccess();
}

uint64_t Apple_Workout_Core_WorkoutStatePublisher.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0);
  uint64_t v7 = swift_retain();
  sub_236C4FCF0(v7, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return sub_236C74818();
  }
  return result;
}

uint64_t sub_236C4FCF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  if (*(unsigned char *)(a1 + 16) != 1 || (uint64_t result = sub_236C74A68(), !v4))
  {
    uint64_t result = sub_236C50158(a1);
    if (!v4)
    {
      swift_beginAccess();
      if (*(unsigned char *)(a1 + 33) == 1) {
        sub_236C74A68();
      }
      swift_beginAccess();
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        type metadata accessor for Apple_Workout_Core_DateInterval(0);
        sub_236C523E4(&qword_2688ABD40, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
        swift_bridgeObjectRetain();
        sub_236C74AF8();
        swift_bridgeObjectRelease();
      }
      sub_236C501E0(a1);
      swift_beginAccess();
      if (*(unsigned char *)(a1 + 57) == 1) {
        sub_236C74A68();
      }
      swift_beginAccess();
      if (*(unsigned char *)(a1 + 58) == 1) {
        sub_236C74A68();
      }
      swift_beginAccess();
      if (*(unsigned char *)(a1 + 59) == 1) {
        sub_236C74A68();
      }
      swift_beginAccess();
      if (*(unsigned char *)(a1 + 60) == 1) {
        sub_236C74A68();
      }
      sub_236C50268(a1, a2, a3, a4);
      char v10 = (unsigned char *)(a1
                    + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
      swift_beginAccess();
      if (*v10 == 1) {
        sub_236C74A68();
      }
      uint64_t v11 = (unsigned char *)(a1
                    + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
      swift_beginAccess();
      if (*v11 == 1) {
        sub_236C74A68();
      }
      sub_236C50510(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
      sub_236C50510(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
      sub_236C50484(a1);
      sub_236C50510(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
      sub_236C50510(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
      return sub_236C50510(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
    }
  }
  return result;
}

uint64_t sub_236C50158(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
    return sub_236C74AC8();
  }
  return result;
}

uint64_t sub_236C501E0(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 56) & 1) == 0) {
    return sub_236C74AC8();
  }
  return result;
}

uint64_t sub_236C50268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8498);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Apple_Workout_Core_Activity(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  sub_236A731D0(v12, (uint64_t)v7, &qword_2688A8498);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_236A73174((uint64_t)v7, &qword_2688A8498);
  }
  sub_236C53010((uint64_t)v7, (uint64_t)v11, type metadata accessor for Apple_Workout_Core_Activity);
  sub_236C523E4(&qword_2688A8710, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_Activity);
  sub_236C74B08();
  return sub_236C52FB0((uint64_t)v11, type metadata accessor for Apple_Workout_Core_Activity);
}

uint64_t sub_236C50484(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 4) & 1) == 0) {
    return sub_236C74AE8();
  }
  return result;
}

uint64_t sub_236C50510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = (unsigned char *)(a1 + *a5);
  uint64_t result = swift_beginAccess();
  if (*v5 != 2) {
    return sub_236C74A68();
  }
  return result;
}

uint64_t sub_236C505A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Workout_Core_Activity(0);
  uint64_t v70 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA3B8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8498);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v68 - v14;
  swift_beginAccess();
  int v16 = *(unsigned __int8 *)(a1 + 16);
  swift_beginAccess();
  if (v16 != *(unsigned __int8 *)(a2 + 16)) {
    return 0;
  }
  v69 = v6;
  swift_beginAccess();
  double v17 = *(double *)(a1 + 24);
  char v18 = *(unsigned char *)(a1 + 32);
  swift_beginAccess();
  char v19 = *(unsigned char *)(a2 + 32);
  if (v18)
  {
    if (!*(unsigned char *)(a2 + 32)) {
      return 0;
    }
  }
  else
  {
    if (v17 != *(double *)(a2 + 24)) {
      char v19 = 1;
    }
    if (v19) {
      return 0;
    }
  }
  swift_beginAccess();
  int v20 = *(unsigned __int8 *)(a1 + 33);
  swift_beginAccess();
  if (v20 != *(unsigned __int8 *)(a2 + 33)) {
    return 0;
  }
  v68 = v9;
  swift_beginAccess();
  uint64_t v21 = *(void *)(a1 + 40);
  swift_beginAccess();
  uint64_t v22 = *(void *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v23 = sub_236C4ACB0(v21, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0) {
    goto LABEL_28;
  }
  swift_beginAccess();
  double v24 = *(double *)(a1 + 48);
  char v25 = *(unsigned char *)(a1 + 56);
  swift_beginAccess();
  if (v25)
  {
    if ((*(unsigned char *)(a2 + 56) & 1) == 0) {
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a2 + 56) & 1) != 0 || v24 != *(double *)(a2 + 48))
  {
    goto LABEL_28;
  }
  swift_beginAccess();
  int v26 = *(unsigned __int8 *)(a1 + 57);
  swift_beginAccess();
  if (v26 != *(unsigned __int8 *)(a2 + 57)) {
    goto LABEL_28;
  }
  swift_beginAccess();
  int v27 = *(unsigned __int8 *)(a1 + 58);
  swift_beginAccess();
  if (v27 != *(unsigned __int8 *)(a2 + 58)) {
    goto LABEL_28;
  }
  swift_beginAccess();
  int v28 = *(unsigned __int8 *)(a1 + 59);
  swift_beginAccess();
  if (v28 != *(unsigned __int8 *)(a2 + 59)) {
    goto LABEL_28;
  }
  swift_beginAccess();
  int v29 = *(unsigned __int8 *)(a1 + 60);
  swift_beginAccess();
  if (v29 != *(unsigned __int8 *)(a2 + 60)) {
    goto LABEL_28;
  }
  uint64_t v30 = a1
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  sub_236A731D0(v30, (uint64_t)v15, &qword_2688A8498);
  uint64_t v31 = a2
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  uint64_t v32 = (uint64_t)v68;
  uint64_t v33 = (uint64_t)&v68[*(int *)(v7 + 48)];
  sub_236A731D0((uint64_t)v15, (uint64_t)v68, &qword_2688A8498);
  sub_236A731D0(v31, v33, &qword_2688A8498);
  v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
  if (v34(v32, 1, v4) == 1)
  {
    sub_236A73174((uint64_t)v15, &qword_2688A8498);
    if (v34(v33, 1, v4) == 1)
    {
      sub_236A73174(v32, &qword_2688A8498);
      goto LABEL_26;
    }
LABEL_24:
    sub_236A73174(v32, &qword_2688AA3B8);
    goto LABEL_28;
  }
  sub_236A731D0(v32, (uint64_t)v13, &qword_2688A8498);
  if (v34(v33, 1, v4) == 1)
  {
    sub_236A73174((uint64_t)v15, &qword_2688A8498);
    sub_236C52FB0((uint64_t)v13, type metadata accessor for Apple_Workout_Core_Activity);
    goto LABEL_24;
  }
  uint64_t v35 = (uint64_t)v69;
  sub_236C53010(v33, (uint64_t)v69, type metadata accessor for Apple_Workout_Core_Activity);
  char v36 = static Apple_Workout_Core_Activity.== infix(_:_:)((uint64_t)v13, v35);
  sub_236C52FB0(v35, type metadata accessor for Apple_Workout_Core_Activity);
  sub_236A73174((uint64_t)v15, &qword_2688A8498);
  sub_236C52FB0((uint64_t)v13, type metadata accessor for Apple_Workout_Core_Activity);
  sub_236A73174(v32, &qword_2688A8498);
  if ((v36 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v37 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
  swift_beginAccess();
  int v38 = *v37;
  v39 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
  swift_beginAccess();
  if (v38 != *v39) {
    goto LABEL_28;
  }
  v40 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
  swift_beginAccess();
  int v41 = *v40;
  v42 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
  swift_beginAccess();
  if (v41 != *v42) {
    goto LABEL_28;
  }
  v44 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
  swift_beginAccess();
  int v45 = *v44;
  v46 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
  swift_beginAccess();
  int v47 = *v46;
  if (v45 == 2)
  {
    if (v47 != 2) {
      goto LABEL_28;
    }
  }
  else if (v47 == 2 || ((((v47 & 1) == 0) ^ v45) & 1) == 0)
  {
    goto LABEL_28;
  }
  v48 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
  swift_beginAccess();
  int v49 = *v48;
  v50 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
  swift_beginAccess();
  int v51 = *v50;
  if (v49 == 2)
  {
    if (v51 != 2) {
      goto LABEL_28;
    }
  }
  else if (v51 == 2 || ((((v51 & 1) == 0) ^ v49) & 1) == 0)
  {
    goto LABEL_28;
  }
  v52 = (int *)(a1
              + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex);
  swift_beginAccess();
  int v53 = *v52;
  char v54 = *((unsigned char *)v52 + 4);
  uint64_t v55 = a2
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  swift_beginAccess();
  if (v54)
  {
    if ((*(unsigned char *)(v55 + 4) & 1) == 0) {
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(v55 + 4) & 1) != 0 || v53 != *(_DWORD *)v55)
  {
    goto LABEL_28;
  }
  v56 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
  swift_beginAccess();
  int v57 = *v56;
  v58 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
  swift_beginAccess();
  int v59 = *v58;
  if (v57 == 2)
  {
    if (v59 != 2) {
      goto LABEL_28;
    }
  }
  else if (v59 == 2 || ((((v59 & 1) == 0) ^ v57) & 1) == 0)
  {
    goto LABEL_28;
  }
  v60 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
  swift_beginAccess();
  int v61 = *v60;
  v62 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
  swift_beginAccess();
  int v63 = *v62;
  if (v61 == 2)
  {
    if (v63 == 2) {
      goto LABEL_55;
    }
LABEL_28:
    swift_release();
    swift_release();
    return 0;
  }
  if (v63 == 2 || ((((v63 & 1) == 0) ^ v61) & 1) == 0) {
    goto LABEL_28;
  }
LABEL_55:
  v64 = (unsigned __int8 *)(a1
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
  swift_beginAccess();
  int v65 = *v64;
  swift_release();
  v66 = (unsigned __int8 *)(a2
                          + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
  swift_beginAccess();
  int v67 = *v66;
  swift_release();
  if (v65 == 2)
  {
    if (v67 != 2) {
      return 0;
    }
  }
  else if (v67 == 2 || ((((v67 & 1) == 0) ^ v65) & 1) == 0)
  {
    return 0;
  }
  return 1;
}

uint64_t Apple_Workout_Core_WorkoutStatePublisher.hashValue.getter()
{
  return sub_236C5151C((void (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher, &qword_2688ABD18, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
}

uint64_t sub_236C50F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  uint64_t v4 = *(int *)(a1 + 20);
  if (qword_2688A7A00 != -1) {
    swift_once();
  }
  *(void *)(a2 + v4) = qword_2688ABCB0;

  return swift_retain();
}

unint64_t sub_236C50FA4()
{
  return 0xD000000000000028;
}

uint64_t sub_236C50FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Apple_Workout_Core_WorkoutStatePublisher.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_236C50FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Apple_Workout_Core_WorkoutStatePublisher.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_236C50FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236C523E4(&qword_2688ABD88, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_236C5106C@<X0>(uint64_t a1@<X8>)
{
  return sub_236A637F8(&qword_2688A79F8, (uint64_t)qword_2688ABC98, a1);
}

uint64_t sub_236C51090(uint64_t a1)
{
  uint64_t v2 = sub_236C523E4(&qword_2688A98E0, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_236C510FC()
{
  sub_236C523E4(&qword_2688A98E0, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);

  return sub_236C74A18();
}

unint64_t static Apple_Workout_Core_DateInterval.protoMessageName.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_236C51198()
{
  uint64_t v0 = sub_236C74B48();
  __swift_allocate_value_buffer(v0, qword_2688ABCB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2688ABCB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688A7F58);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688A7F60) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_236C79410;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "startReferenceTime";
  *(void *)(v6 + 8) = 18;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_236C74B18();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "endReferenceTime";
  *((void *)v10 + 1) = 16;
  v10[16] = 2;
  v9();
  return sub_236C74B28();
}

uint64_t static Apple_Workout_Core_DateInterval._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236A63294(&qword_2688A7A08, (uint64_t)qword_2688ABCB8, a1);
}

uint64_t Apple_Workout_Core_DateInterval.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_236C748B8();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_236C74968();
      }
      uint64_t result = sub_236C748B8();
    }
  }
  return result;
}

uint64_t Apple_Workout_Core_DateInterval.traverse<A>(visitor:)()
{
  if (*v0 == 0.0 || (uint64_t result = sub_236C74AC8(), !v1))
  {
    if (v0[1] == 0.0 || (uint64_t result = sub_236C74AC8(), !v1))
    {
      type metadata accessor for Apple_Workout_Core_DateInterval(0);
      return sub_236C74818();
    }
  }
  return result;
}

uint64_t Apple_Workout_Core_DateInterval.hashValue.getter()
{
  return sub_236C5151C((void (*)(void))type metadata accessor for Apple_Workout_Core_DateInterval, &qword_2688ABD20, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
}

uint64_t sub_236C5151C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_236C75A68();
}

unint64_t sub_236C515A4()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_236C515C0()
{
  return Apple_Workout_Core_DateInterval.decodeMessage<A>(decoder:)();
}

uint64_t sub_236C515D8()
{
  return Apple_Workout_Core_DateInterval.traverse<A>(visitor:)();
}

uint64_t sub_236C515F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236C523E4(&qword_2688ABD80, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_236C5166C@<X0>(uint64_t a1@<X8>)
{
  return sub_236A637F8(&qword_2688A7A08, (uint64_t)qword_2688ABCB8, a1);
}

uint64_t sub_236C51690(uint64_t a1)
{
  uint64_t v2 = sub_236C523E4(&qword_2688ABD40, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_236C516FC()
{
  sub_236C523E4(&qword_2688ABD40, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);

  return sub_236C74A18();
}

uint64_t sub_236C5177C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_236A5B9DC(a2, a3);
      uint64_t v10 = (char *)sub_236C73B78();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_236C73BA8();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_236C73B98();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x236C519E0);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_236A57E80(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      double v17 = (char *)sub_236C73B78();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_236C73BA8();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_236C73B98();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t _s11WorkoutCore06Apple_a1_b1_A14StatePublisherV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236C74838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  BOOL v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20);
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a2 + v11);
  if (v12 == v13
    || (swift_retain(), swift_retain(), char v14 = sub_236C505A8(v12, v13), swift_release(), swift_release(), (v14 & 1) != 0))
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v8, a2, v4);
    sub_236C523E4(&qword_2688A7F50, MEMORY[0x263F50560]);
    char v16 = sub_236C74DF8();
    double v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t _s11WorkoutCore06Apple_a1_B13_DateIntervalV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  uint64_t v4 = sub_236C74838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  BOOL v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    uint64_t v11 = type metadata accessor for Apple_Workout_Core_DateInterval(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 24), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 24), v4);
    sub_236C523E4(&qword_2688A7F50, MEMORY[0x263F50560]);
    char v13 = sub_236C74DF8();
    char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_236C51DA4(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8498);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = (uint64_t)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(_WORD *)(v1 + 32) = 1;
  v34[1] = v1 + 33;
  *(void *)(v1 + 40) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 48) = 0;
  *(unsigned char *)(v1 + 56) = 1;
  v34[2] = v1 + 58;
  v34[3] = v1 + 59;
  *(_DWORD *)(v1 + 57) = 0;
  uint64_t v5 = v1
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  v34[4] = v1 + 60;
  uint64_t v35 = v1
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  uint64_t v6 = type metadata accessor for Apple_Workout_Core_Activity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  char v36 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion) = 0;
  int v38 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled) = 0;
  v39 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit) = 2;
  v40 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode) = 2;
  uint64_t v7 = v1
     + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  *(_DWORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 4) = 1;
  int v41 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor) = 2;
  v42 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor) = 2;
  v43 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor) = 2;
  swift_beginAccess();
  char v8 = *(unsigned char *)(a1 + 16);
  swift_beginAccess();
  *(unsigned char *)(v1 + 16) = v8;
  swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 24);
  char v10 = *(unsigned char *)(a1 + 32);
  swift_beginAccess();
  *(void *)(v1 + 24) = v9;
  *(unsigned char *)(v1 + 32) = v10;
  swift_beginAccess();
  LOBYTE(v9) = *(unsigned char *)(a1 + 33);
  swift_beginAccess();
  *(unsigned char *)(v1 + 33) = v9;
  swift_beginAccess();
  uint64_t v11 = *(void *)(a1 + 40);
  swift_beginAccess();
  *(void *)(v1 + 40) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  swift_beginAccess();
  *(void *)(v1 + 48) = v12;
  *(unsigned char *)(v1 + 56) = v13;
  swift_beginAccess();
  LOBYTE(v12) = *(unsigned char *)(a1 + 57);
  swift_beginAccess();
  *(unsigned char *)(v1 + 57) = v12;
  swift_beginAccess();
  LOBYTE(v12) = *(unsigned char *)(a1 + 58);
  swift_beginAccess();
  *(unsigned char *)(v1 + 58) = v12;
  swift_beginAccess();
  LOBYTE(v12) = *(unsigned char *)(a1 + 59);
  swift_beginAccess();
  *(unsigned char *)(v1 + 59) = v12;
  swift_beginAccess();
  LOBYTE(v12) = *(unsigned char *)(a1 + 60);
  swift_beginAccess();
  *(unsigned char *)(v1 + 60) = v12;
  uint64_t v14 = a1
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__activityType;
  swift_beginAccess();
  uint64_t v15 = v14;
  uint64_t v16 = v37;
  sub_236A731D0(v15, v37, &qword_2688A8498);
  uint64_t v17 = v35;
  swift_beginAccess();
  sub_236B2D674(v16, v17);
  swift_endAccess();
  uint64_t v18 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
  swift_beginAccess();
  LOBYTE(v18) = *v18;
  uint64_t v19 = v36;
  swift_beginAccess();
  unsigned char *v19 = (_BYTE)v18;
  int64_t v20 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
  swift_beginAccess();
  LOBYTE(v20) = *v20;
  uint64_t v21 = v38;
  swift_beginAccess();
  unsigned char *v21 = (_BYTE)v20;
  size_t v22 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
  swift_beginAccess();
  LOBYTE(v22) = *v22;
  int v23 = v39;
  swift_beginAccess();
  unsigned char *v23 = (_BYTE)v22;
  char v24 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
  swift_beginAccess();
  LOBYTE(v24) = *v24;
  char v25 = v40;
  swift_beginAccess();
  unsigned char *v25 = (_BYTE)v24;
  uint64_t v26 = a1
      + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__segmentIndex;
  swift_beginAccess();
  LODWORD(v25) = *(_DWORD *)v26;
  LOBYTE(v26) = *(unsigned char *)(v26 + 4);
  swift_beginAccess();
  *(_DWORD *)uint64_t v7 = v25;
  *(unsigned char *)(v7 + 4) = v26;
  char v27 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
  swift_beginAccess();
  LOBYTE(v27) = *v27;
  char v28 = v41;
  swift_beginAccess();
  unsigned char *v28 = (_BYTE)v27;
  char v29 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
  swift_beginAccess();
  LOBYTE(v29) = *v29;
  char v30 = v42;
  swift_beginAccess();
  unsigned char *v30 = (_BYTE)v29;
  uint64_t v31 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
  swift_beginAccess();
  LOBYTE(v31) = *v31;
  uint64_t v32 = v43;
  swift_beginAccess();
  unsigned char *v32 = (_BYTE)v31;
  return v1;
}

uint64_t type metadata accessor for Apple_Workout_Core_DateInterval(uint64_t a1)
{
  return sub_236A62258(a1, (uint64_t *)&unk_2688ABD60);
}

uint64_t sub_236C523E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236C5242C()
{
  return sub_236C523E4(&qword_2688ABD28, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
}

uint64_t sub_236C52474()
{
  return sub_236C523E4(&qword_2688A98E0, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
}

uint64_t sub_236C524BC()
{
  return sub_236C523E4(&qword_2688ABD18, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
}

uint64_t sub_236C52504()
{
  return sub_236C523E4(&qword_2688ABD30, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
}

uint64_t sub_236C5254C()
{
  return sub_236C523E4(&qword_2688ABD38, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
}

uint64_t sub_236C52594()
{
  return sub_236C523E4(&qword_2688ABD40, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
}

uint64_t sub_236C525DC()
{
  return sub_236C523E4(&qword_2688ABD20, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
}

uint64_t sub_236C52624()
{
  return sub_236C523E4(&qword_2688ABD48, (void (*)(uint64_t))type metadata accessor for Apple_Workout_Core_DateInterval);
}

uint64_t sub_236C5266C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_236C526C8@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  double v5 = *(double *)(v3 + 24);
  if (*(unsigned char *)(v3 + 32)) {
    double v5 = 0.0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_236C52734@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 33);
  return result;
}

uint64_t sub_236C52798@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  double v5 = *(double *)(v3 + 48);
  if (*(unsigned char *)(v3 + 56)) {
    double v5 = 0.0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_236C52804@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 57);
  return result;
}

uint64_t sub_236C52860@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 58);
  return result;
}

uint64_t sub_236C528BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 59);
  return result;
}

uint64_t sub_236C52918@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20));
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 60);
  return result;
}

uint64_t sub_236C52974@<X0>(uint64_t a1@<X8>)
{
  return Apple_Workout_Core_WorkoutStatePublisher.activityType.getter(a1);
}

uint64_t sub_236C5299C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_33Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion, a2);
}

uint64_t sub_236C529A8(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirroringToCompanion);
}

uint64_t sub_236C529C8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_33Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled, a2);
}

uint64_t keypath_get_33Tm@<X0>(uint64_t a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20))
               + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_236C52A40(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__mirrorModeEnabled);
}

uint64_t sub_236C52A60@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_37Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit, a2);
}

uint64_t sub_236C52A6C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__isGymKit);
}

uint64_t sub_236C52A8C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_37Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode, a2);
}

uint64_t keypath_get_37Tm@<X0>(uint64_t a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*(void *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0) + 20))
               + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4 & 1;
  return result;
}

uint64_t sub_236C52B08(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__multisportWorkoutInAutoMode);
}

uint64_t sub_236C52B30@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_37Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor, a2);
}

uint64_t sub_236C52B3C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__speedSensor);
}

uint64_t sub_236C52B5C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_37Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor, a2);
}

uint64_t sub_236C52B68(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__cadenceSensor);
}

uint64_t sub_236C52B88@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_37Tm(a1, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor, a2);
}

uint64_t sub_236C52B94(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C4DDA8(a1, a2, a3, a4, &OBJC_IVAR____TtCV11WorkoutCore40Apple_Workout_Core_WorkoutStatePublisherP33_155C789B29B85C4B9B116E76685C478113_StorageClass__powerSensor);
}

uint64_t getEnumTagSinglePayload for Apple_Workout_Core_WorkoutStatePublisher(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236C52BC8);
}

uint64_t sub_236C52BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_236C74838();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    char v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Apple_Workout_Core_WorkoutStatePublisher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236C52C9C);
}

uint64_t sub_236C52C9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_236C74838();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Apple_Workout_Core_DateInterval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236C52D6C);
}

uint64_t sub_236C52D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 24);
  uint64_t v5 = sub_236C74838();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for Apple_Workout_Core_DateInterval(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236C52DF0);
}

uint64_t sub_236C52DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 24);
  uint64_t v6 = sub_236C74838();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_236C52E64()
{
  return type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher._StorageClass(0);
}

void sub_236C52E6C()
{
  sub_236C28608();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_236C52F48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236C52FB0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236C53010(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void (*LapsMetricsPublisher.laps.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A5E138;
}

uint64_t LapsMetricsPublisher.laps.setter()
{
  return sub_236C74C38();
}

uint64_t LapsMetricsPublisher.laps.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236C531E8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C5326C()
{
  return sub_236C74C38();
}

uint64_t LapsMetricsPublisher.$laps.getter()
{
  return swift_endAccess();
}

uint64_t sub_236C53348()
{
  return swift_endAccess();
}

uint64_t sub_236C533B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABD98);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  sub_236C74C08();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t LapsMetricsPublisher.$laps.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABD98);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  sub_236C74C08();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*LapsMetricsPublisher.$laps.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABD98);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5E664;
}

uint64_t LapsMetricsPublisher.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_236C74BE8();
  return v0;
}

uint64_t LapsMetricsPublisher.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  v7[1] = 0;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  return v0;
}

uint64_t LapsMetricsPublisher.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LapsMetricsPublisher.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t LapsMetricsPublisher.wireData()()
{
  uint64_t v0 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (_DWORD *)((char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v2 = 0;
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if (HIDWORD(v6))
  {
    uint64_t result = sub_236C75678();
    __break(1u);
  }
  else
  {
    *uint64_t v2 = v6;
    sub_236C53C18();
    uint64_t v3 = sub_236C749F8();
    sub_236C53C70((uint64_t)v2);
    return v3;
  }
  return result;
}

uint64_t LapsMetricsPublisher.protobuf.getter@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  if (HIDWORD(v3))
  {
    uint64_t result = sub_236C75678();
    __break(1u);
  }
  else
  {
    *a1 = v3;
  }
  return result;
}

unint64_t sub_236C53C18()
{
  unint64_t result = qword_2688AAED8;
  if (!qword_2688AAED8)
  {
    type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688AAED8);
  }
  return result;
}

uint64_t sub_236C53C70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static LapsMetricsPublisher.decodeProto(serializedData:)(uint64_t a1, unint64_t a2)
{
  return sub_236C53E60(a1, a2);
}

uint64_t LapsMetricsPublisher.__allocating_init(serializedData:)(uint64_t a1, unint64_t a2)
{
  return sub_236C540D0(a1, a2);
}

uint64_t sub_236C53CFC@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  if (HIDWORD(v3))
  {
    uint64_t result = sub_236C75678();
    __break(1u);
  }
  else
  {
    *a1 = v3;
  }
  return result;
}

uint64_t sub_236C53DE4()
{
  return LapsMetricsPublisher.wireData()();
}

uint64_t sub_236C53E08@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236C53E60(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_236C53E34@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236C540D0(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_236C53E60(uint64_t a1, unint64_t a2)
{
  unint64_t v17 = a2;
  uint64_t v3 = sub_236C74858();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (unsigned int *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LapsMetricsPublisher();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v11 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  *(void *)&long long v18 = 0;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v7);
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  sub_236A5B9DC(a1, v17);
  sub_236C74848();
  sub_236C53C18();
  uint64_t v13 = v21;
  sub_236C749E8();
  if (v13)
  {
    swift_release();
  }
  else
  {
    uint64_t v14 = *v6;
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v18 = v14;
    swift_retain();
    sub_236C74C38();
    sub_236C53C70((uint64_t)v6);
  }
  return v11;
}

uint64_t sub_236C540D0(uint64_t a1, unint64_t a2)
{
  unint64_t v19 = a2;
  uint64_t v3 = sub_236C74858();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (unsigned int *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LapsMetricsPublisher();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v11 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  *(void *)&long long v20 = 0;
  sub_236C74BE8();
  uint64_t v13 = v7;
  unint64_t v14 = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v13);
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  swift_retain();
  sub_236A5B9DC(a1, v14);
  sub_236C74848();
  sub_236C53C18();
  uint64_t v15 = v23;
  sub_236C749E8();
  if (v15)
  {
    sub_236A57E80(a1, v14);
    swift_release_n();
  }
  else
  {
    uint64_t v16 = *v6;
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v20 = v16;
    sub_236C74C38();
    sub_236A57E80(a1, v14);
    sub_236C53C70((uint64_t)v6);
  }
  return v11;
}

uint64_t sub_236C54364()
{
  return type metadata accessor for LapsMetricsPublisher();
}

uint64_t type metadata accessor for LapsMetricsPublisher()
{
  uint64_t result = qword_26AF30120;
  if (!qword_26AF30120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236C543B8()
{
  sub_236C54474();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LapsMetricsPublisher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LapsMetricsPublisher);
}

uint64_t dispatch thunk of LapsMetricsPublisher.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void sub_236C54474()
{
  if (!qword_26AF30720)
  {
    unint64_t v0 = sub_236C74C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AF30720);
    }
  }
}

uint64_t Data.utf8String.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_236A5B9DC(a1, a2);
      uint64_t v4 = sub_236C548DC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_236C54B48);
      if (v5) {
        goto LABEL_16;
      }
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(a1 + 24);
      sub_236A5B9DC(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v4 = sub_236C548DC(v6, v7, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_236C54B48);
      uint64_t v9 = v8;
      swift_release();
      swift_release();
      if (v9) {
        goto LABEL_16;
      }
LABEL_7:
      uint64_t v14 = a1;
      unint64_t v15 = a2;
      sub_236A5B9DC(a1, a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDA0);
      if (swift_dynamicCast())
      {
        sub_236A5A460(v12, (uint64_t)v16);
        __swift_project_boxed_opaque_existential_1(v16, v17);
        if (sub_236C75708())
        {
          __swift_project_boxed_opaque_existential_1(v16, v17);
          sub_236C756F8();
          sub_236A57E80(a1, a2);
          uint64_t v4 = *(void *)&v12[0];
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
          return v4;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      }
      else
      {
        uint64_t v13 = 0;
        memset(v12, 0, sizeof(v12));
        sub_236C54B80((uint64_t)v12);
      }
      uint64_t v10 = sub_236C547D4(a1, a2);
LABEL_15:
      uint64_t v4 = v10;
LABEL_16:
      sub_236A57E80(a1, a2);
      return v4;
    case 3uLL:
      memset(v16, 0, 14);
      goto LABEL_11;
    default:
      v16[0] = a1;
      LOWORD(v16[1]) = a2;
      BYTE2(v16[1]) = BYTE2(a2);
      BYTE3(v16[1]) = BYTE3(a2);
      BYTE4(v16[1]) = BYTE4(a2);
      BYTE5(v16[1]) = BYTE5(a2);
LABEL_11:
      uint64_t v10 = sub_236C74EC8();
      goto LABEL_15;
  }
}

uint64_t sub_236C547D4(uint64_t a1, unint64_t a2)
{
  sub_236A5B9DC(a1, a2);
  sub_236C5498C(a1, a2);
  sub_236A57E80(a1, a2);
  uint64_t v4 = sub_236C74EC8();
  swift_release();
  return v4;
}

uint64_t sub_236C5484C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236C74EC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_236C54888(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_236C548DC(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_236C73B78();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_236C73BA8();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_236C73B98();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_236C54888(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void *sub_236C5498C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_236C73E18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF307F0);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_236A5B9DC(a1, a2);
        uint64_t v13 = sub_236C73D88();
        sub_236A57E80(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x236C54B38);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_236C54B48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236C74EC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236C54B80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236C54BE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  MEMORY[0x270FA5388](v4 - 8);
  v102 = (char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_236C73F58();
  uint64_t v6 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  v95 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for Apple_Workout_Core_HKQuantity();
  uint64_t v8 = MEMORY[0x270FA5388](v107);
  uint64_t v106 = (uint64_t)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v105 = (char *)&v92 - v10;
  uint64_t v11 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue(0);
  uint64_t v112 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (int64_t *)((char *)&v92 - v15);
  uint64_t v17 = type metadata accessor for Apple_Workout_Core_Activity(0);
  MEMORY[0x270FA5388](v17);
  unint64_t v19 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)v19 + 2) = sub_236B78CB8(MEMORY[0x263F8EE78]);
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  unint64_t v20 = (unint64_t)objc_msgSend(v2, sel_identifier);
  if (v20 >> 31)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  *(_DWORD *)unint64_t v19 = v20;
  unint64_t v21 = (unint64_t)objc_msgSend(v2, sel_auxiliaryTypeIdentifier);
  if (v21 >> 31)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  uint64_t v97 = a1;
  *((_DWORD *)v19 + 1) = v21;
  v19[8] = objc_msgSend(v2, sel_isIndoor);
  unsigned __int8 v22 = objc_msgSend(v2, sel_isPartOfMultiSport);
  v96 = v19;
  v19[9] = v22;
  id v23 = objc_msgSend(v2, sel_metadata);
  uint64_t v24 = sub_236C74D68();

  int64_t v115 = 0;
  uint64_t v26 = *(void *)(v24 + 64);
  uint64_t v103 = v24 + 64;
  uint64_t v111 = v24;
  uint64_t v27 = 1 << *(unsigned char *)(v24 + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & v26;
  v110 = v122;
  v113 = &v125;
  v100 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v99 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  v94 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
  v93 = (void (**)(char *, uint64_t))(v6 + 8);
  char v30 = (void *)MEMORY[0x263F8EE80];
  int64_t v108 = (unint64_t)(v27 + 63) >> 6;
  int64_t v92 = v108 - 1;
  *(void *)&long long v25 = 136315138;
  long long v98 = v25;
  v116 = v16;
  uint64_t v104 = v11;
  v114 = v14;
  while (1)
  {
    if (v29)
    {
      unint64_t v31 = __clz(__rbit64(v29));
      uint64_t v32 = (v29 - 1) & v29;
      unint64_t v33 = v31 | (v115 << 6);
LABEL_10:
      uint64_t v34 = *(void *)(v111 + 56);
      uint64_t v35 = (void *)(*(void *)(v111 + 48) + 16 * v33);
      uint64_t v36 = v35[1];
      *(void *)&long long v121 = *v35;
      *((void *)&v121 + 1) = v36;
      sub_236A83E88(v34 + 32 * v33, (uint64_t)v110);
      swift_bridgeObjectRetain();
      goto LABEL_29;
    }
    int64_t v37 = v115 + 1;
    if (__OFADD__(v115, 1)) {
      goto LABEL_61;
    }
    if (v37 < v108)
    {
      unint64_t v38 = *(void *)(v103 + 8 * v37);
      if (v38) {
        goto LABEL_14;
      }
      int64_t v39 = v115 + 2;
      ++v115;
      if (v37 + 1 < v108)
      {
        unint64_t v38 = *(void *)(v103 + 8 * v39);
        if (v38) {
          goto LABEL_17;
        }
        int64_t v115 = v37 + 1;
        if (v37 + 2 < v108)
        {
          unint64_t v38 = *(void *)(v103 + 8 * (v37 + 2));
          if (v38)
          {
            v37 += 2;
            goto LABEL_14;
          }
          int64_t v39 = v37 + 3;
          int64_t v115 = v37 + 2;
          if (v37 + 3 < v108) {
            break;
          }
        }
      }
    }
LABEL_28:
    uint64_t v32 = 0;
    memset(v122, 0, sizeof(v122));
    long long v121 = 0u;
LABEL_29:
    sub_236A926F0((uint64_t)&v121, (uint64_t)&v123, &qword_2688ABDD8);
    uint64_t v40 = v124;
    if (!v124)
    {
      swift_release();
      uint64_t v90 = (uint64_t)v96;
      swift_bridgeObjectRelease();
      *(void *)(v90 + 16) = v30;
      sub_236C5C01C(v90, v97, type metadata accessor for Apple_Workout_Core_Activity);
      return sub_236C5BEF0(v90, type metadata accessor for Apple_Workout_Core_Activity);
    }
    uint64_t v41 = v123;
    sub_236A5A450(v113, &v121);
    uint64_t v42 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue.OneOf_MetadataValue(0);
    v43 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
    v43(v16, 1, 1, v42);
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    sub_236A83E88((uint64_t)&v121, (uint64_t)&v120);
    int v44 = swift_dynamicCast();
    unint64_t v117 = v32;
    if (v44)
    {
      uint64_t v45 = v118[0];
      uint64_t v46 = v41;
      uint64_t v47 = v118[1];
      sub_236A73174((uint64_t)v16, &qword_2688A86E8);
      void *v16 = v45;
      v16[1] = v47;
      uint64_t v41 = v46;
      goto LABEL_32;
    }
    sub_236A83E88((uint64_t)&v121, (uint64_t)&v120);
    sub_236C5A474();
    if (swift_dynamicCast())
    {
      v48 = (void *)v118[0];
      int v49 = v105;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      id v50 = objc_msgSend(v48, sel__unit);
      id v51 = objc_msgSend(v50, sel_unitString);

      uint64_t v52 = sub_236C74E48();
      uint64_t v109 = v41;
      uint64_t v54 = v53;

      uint64_t v16 = v116;
      v49[1] = v52;
      v49[2] = v54;
      id v55 = objc_msgSend(v48, sel__unit);
      objc_msgSend(v48, sel_doubleValueForUnit_, v55);
      uint64_t v57 = v56;

      *int v49 = v57;
      uint64_t v58 = v106;
      sub_236C5C01C((uint64_t)v49, v106, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HKQuantity);
      sub_236A73174((uint64_t)v16, &qword_2688A86E8);
      uint64_t v59 = v58;
      uint64_t v41 = v109;
      sub_236C5BF50(v59, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HKQuantity);
      swift_storeEnumTagMultiPayload();
      v43(v16, 0, 1, v42);

      sub_236C5BEF0((uint64_t)v49, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HKQuantity);
      goto LABEL_35;
    }
    sub_236A83E88((uint64_t)&v121, (uint64_t)&v120);
    if (swift_dynamicCast())
    {
      uint64_t v74 = v118[0];
      sub_236A73174((uint64_t)v16, &qword_2688A86E8);
      void *v16 = v74;
LABEL_32:
      swift_storeEnumTagMultiPayload();
      v43(v16, 0, 1, v42);
LABEL_35:
      uint64_t v60 = (uint64_t)v114;
      goto LABEL_36;
    }
    uint64_t v109 = v41;
    sub_236A83E88((uint64_t)&v121, (uint64_t)&v120);
    uint64_t v75 = (uint64_t)v102;
    uint64_t v76 = v101;
    int v77 = swift_dynamicCast();
    v78 = *v100;
    if (!v77)
    {
      v78(v75, 1, 1, v76);
LABEL_51:
      sub_236A73174(v75, &qword_26AF2FE50);
      if (qword_26AF2E5B0 != -1) {
        swift_once();
      }
      uint64_t v82 = sub_236C74B98();
      __swift_project_value_buffer(v82, (uint64_t)qword_26AF2E598);
      sub_236A83E88((uint64_t)&v121, (uint64_t)&v120);
      v83 = sub_236C74B78();
      os_log_type_t v84 = sub_236C752B8();
      BOOL v85 = os_log_type_enabled(v83, v84);
      uint64_t v60 = (uint64_t)v114;
      if (v85)
      {
        uint64_t v86 = swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        uint64_t v119 = v87;
        *(_DWORD *)uint64_t v86 = v98;
        sub_236A83E88((uint64_t)&v120, (uint64_t)v118);
        uint64_t v88 = sub_236C74EA8();
        *(void *)(v86 + 4) = sub_236A83898(v88, v89, &v119);
        uint64_t v16 = v116;
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v120);
        _os_log_impl(&dword_236A4F000, v83, v84, "Unhandled metadata value %s", (uint8_t *)v86, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237E0C720](v87, -1, -1);
        MEMORY[0x237E0C720](v86, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v120);
      }

      goto LABEL_57;
    }
    v78(v75, 0, 1, v76);
    if ((*v99)(v75, 1, v76) == 1) {
      goto LABEL_51;
    }
    v79 = v95;
    (*v94)(v95, v75, v76);
    sub_236C73E48();
    uint64_t v81 = v80;
    sub_236A73174((uint64_t)v16, &qword_2688A86E8);
    void *v16 = v81;
    swift_storeEnumTagMultiPayload();
    v43(v16, 0, 1, v42);
    (*v93)(v79, v76);
    uint64_t v60 = (uint64_t)v114;
LABEL_57:
    uint64_t v41 = v109;
LABEL_36:
    sub_236C5C01C((uint64_t)v16, v60, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v120 = v30;
    unint64_t v63 = sub_236A825A0(v41, v40);
    uint64_t v64 = v30[2];
    BOOL v65 = (v62 & 1) == 0;
    uint64_t v66 = v64 + v65;
    if (__OFADD__(v64, v65))
    {
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    char v67 = v62;
    if (v30[3] >= v66)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_236C5A4B4();
      }
    }
    else
    {
      sub_236C56E40(v66, isUniquelyReferenced_nonNull_native);
      unint64_t v68 = sub_236A825A0(v41, v40);
      if ((v67 & 1) != (v69 & 1)) {
        goto LABEL_65;
      }
      unint64_t v63 = v68;
    }
    uint64_t v16 = v116;
    char v30 = v120;
    if (v67)
    {
      sub_236C5BFB8(v60, v120[7] + *(void *)(v112 + 72) * v63);
    }
    else
    {
      v120[(v63 >> 6) + 8] |= 1 << v63;
      uint64_t v70 = (uint64_t *)(v30[6] + 16 * v63);
      *uint64_t v70 = v41;
      v70[1] = v40;
      sub_236C5BF50(v60, v30[7] + *(void *)(v112 + 72) * v63, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
      uint64_t v71 = v30[2];
      BOOL v72 = __OFADD__(v71, 1);
      uint64_t v73 = v71 + 1;
      if (v72) {
        goto LABEL_60;
      }
      v30[2] = v73;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_236C5BEF0((uint64_t)v16, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v121);
    unint64_t v29 = v117;
  }
  unint64_t v38 = *(void *)(v103 + 8 * v39);
  if (v38)
  {
LABEL_17:
    int64_t v37 = v39;
LABEL_14:
    uint64_t v32 = (v38 - 1) & v38;
    unint64_t v33 = __clz(__rbit64(v38)) + (v37 << 6);
    int64_t v115 = v37;
    goto LABEL_10;
  }
  while (1)
  {
    int64_t v37 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    if (v37 >= v108)
    {
      int64_t v115 = v92;
      goto LABEL_28;
    }
    unint64_t v38 = *(void *)(v103 + 8 * v37);
    ++v39;
    if (v38) {
      goto LABEL_14;
    }
  }
LABEL_64:
  __break(1u);
LABEL_65:
  uint64_t result = sub_236C75978();
  __break(1u);
  return result;
}

id Apple_Workout_Core_Activity.decoded.getter()
{
  uint64_t v1 = type metadata accessor for Apple_Workout_Core_HKQuantity();
  MEMORY[0x270FA5388](v1 - 8);
  v110 = (double *)((char *)&v105 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A86E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue.OneOf_MetadataValue(0);
  uint64_t v6 = *(void *)(v120 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v120);
  int64_t v115 = (uint64_t *)((char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v114 = (uint64_t)&v105 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AABD8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v105 - v14);
  if ((*v0 & 0x80000000) != 0) {
    goto LABEL_84;
  }
  uint64_t v112 = *v0;
  uint64_t v111 = v0[1];
  if ((v111 & 0x80000000) != 0) {
    goto LABEL_84;
  }
  unint64_t v116 = sub_236B78B80(MEMORY[0x263F8EE78]);
  v113 = v0;
  uint64_t v16 = *((void *)v0 + 2);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v117 = v16 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  unint64_t v21 = (unint64_t)(v18 + 63) >> 6;
  unsigned __int8 v22 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  unint64_t v107 = v21 - 1;
  uint64_t v23 = swift_bridgeObjectRetain();
  unint64_t v24 = 0;
  int64_t v118 = v21;
  unint64_t v109 = v21 - 5;
  uint64_t v119 = v23;
  uint64_t v108 = v23 + 104;
  while (1)
  {
    if (v20)
    {
      unint64_t v25 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v26 = v25 | (v24 << 6);
LABEL_8:
      uint64_t v27 = *(void *)(v119 + 56);
      uint64_t v28 = (void *)(*(void *)(v119 + 48) + 16 * v26);
      uint64_t v29 = v28[1];
      *uint64_t v13 = *v28;
      v13[1] = v29;
      uint64_t v30 = v27
          + *(void *)(*(void *)(type metadata accessor for Apple_Workout_Core_ActivityMetadataValue(0) - 8) + 72)
          * v26;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AABE0);
      sub_236C5C01C(v30, (uint64_t)v13 + *(int *)(v31 + 48), type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v13, 0, 1, v31);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
    int64_t v32 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      sub_236C75678();
      __break(1u);
LABEL_85:
      sub_236C75978();
      __break(1u);
      JUMPOUT(0x236C5670CLL);
    }
    if (v32 >= v118)
    {
      unint64_t v34 = v24;
    }
    else
    {
      unint64_t v33 = *(void *)(v117 + 8 * v32);
      if (v33) {
        goto LABEL_12;
      }
      unint64_t v34 = v24 + 1;
      if ((uint64_t)(v24 + 2) < v118)
      {
        unint64_t v33 = *(void *)(v117 + 8 * (v24 + 2));
        if (v33)
        {
          int64_t v32 = v24 + 2;
LABEL_12:
          unint64_t v20 = (v33 - 1) & v33;
          unint64_t v26 = __clz(__rbit64(v33)) + (v32 << 6);
          unint64_t v24 = v32;
          goto LABEL_8;
        }
        unint64_t v34 = v24 + 2;
        if ((uint64_t)(v24 + 3) < v118)
        {
          unint64_t v33 = *(void *)(v117 + 8 * (v24 + 3));
          if (v33)
          {
            int64_t v32 = v24 + 3;
            goto LABEL_12;
          }
          int64_t v32 = v24 + 4;
          unint64_t v34 = v24 + 3;
          if ((uint64_t)(v24 + 4) < v118)
          {
            unint64_t v33 = *(void *)(v117 + 8 * v32);
            if (v33) {
              goto LABEL_12;
            }
            while (v109 != v24)
            {
              unint64_t v33 = *(void *)(v108 + 8 * v24++);
              if (v33)
              {
                int64_t v32 = v24 + 4;
                goto LABEL_12;
              }
            }
            unint64_t v34 = v107;
          }
        }
      }
    }
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AABE0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v13, 1, 1, v35);
    unint64_t v20 = 0;
    unint64_t v24 = v34;
LABEL_15:
    sub_236A926F0((uint64_t)v13, (uint64_t)v15, &qword_2688AABD8);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AABE0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v15, 1, v36) == 1) {
      break;
    }
    uint64_t v38 = *v15;
    uint64_t v37 = v15[1];
    uint64_t v39 = (uint64_t)v15 + *(int *)(v36 + 48);
    sub_236C59BA8(v39, (uint64_t)v5);
    sub_236C5BEF0(v39, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    if ((*v22)(v5, 1, v120) == 1)
    {
      swift_bridgeObjectRelease();
      sub_236A73174((uint64_t)v5, &qword_2688A86E8);
    }
    else
    {
      uint64_t v40 = v114;
      sub_236C5BF50((uint64_t)v5, v114, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue.OneOf_MetadataValue);
      sub_236C5C01C(v40, (uint64_t)v115, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue.OneOf_MetadataValue);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v60 = v110;
          sub_236C5BF50((uint64_t)v115, (uint64_t)v110, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HKQuantity);
          id v106 = (id)*((void *)v60 + 1);
          swift_bridgeObjectRetain();
          uint64_t v105 = sub_236C74E28();
          swift_bridgeObjectRelease();
          int v61 = self;
          char v62 = (void *)v105;
          id v106 = objc_msgSend(v61, sel_unitFromString_, v105);

          double v63 = *v60;
          uint64_t v64 = self;
          BOOL v65 = v106;
          id v66 = objc_msgSend(v64, sel_quantityWithUnit_doubleValue_, v106, v63);

          unint64_t v124 = sub_236C5A474();
          *(void *)&long long v123 = v66;
          sub_236A5A450(&v123, v122);
          unint64_t v67 = v116;
          LODWORD(v106) = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v121 = v67;
          unint64_t v69 = sub_236A825A0(v38, v37);
          uint64_t v70 = *(void *)(v67 + 16);
          BOOL v71 = (v68 & 1) == 0;
          uint64_t v72 = v70 + v71;
          if (__OFADD__(v70, v71)) {
            goto LABEL_78;
          }
          if (*(void *)(v67 + 24) >= v72)
          {
            if ((v106 & 1) == 0)
            {
              LODWORD(v116) = v68;
              sub_236C5A28C();
              LOBYTE(v68) = v116;
            }
          }
          else
          {
            LODWORD(v116) = v68;
            sub_236C56B40(v72, (char)v106);
            unint64_t v73 = sub_236A825A0(v38, v37);
            int v74 = v68 & 1;
            LOBYTE(v68) = v116;
            if ((v116 & 1) != v74) {
              goto LABEL_85;
            }
            unint64_t v69 = v73;
          }
          unint64_t v116 = v121;
          if (v68)
          {
            unint64_t v89 = (_OWORD *)(*(void *)(v121 + 56) + 32 * v69);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
            sub_236A5A450(v122, v89);
          }
          else
          {
            *(void *)(v121 + 8 * (v69 >> 6) + 64) |= 1 << v69;
            v94 = (uint64_t *)(*(void *)(v116 + 48) + 16 * v69);
            uint64_t *v94 = v38;
            v94[1] = v37;
            sub_236A5A450(v122, (_OWORD *)(*(void *)(v116 + 56) + 32 * v69));
            uint64_t v95 = *(void *)(v116 + 16);
            BOOL v86 = __OFADD__(v95, 1);
            uint64_t v96 = v95 + 1;
            if (v86) {
              goto LABEL_83;
            }
            *(void *)(v116 + 16) = v96;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_236C5BEF0((uint64_t)v110, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HKQuantity);
          goto LABEL_67;
        case 2u:
          uint64_t v51 = *v115;
          unint64_t v124 = MEMORY[0x263F8D538];
          *(void *)&long long v123 = v51;
          sub_236A5A450(&v123, v122);
          unint64_t v52 = v116;
          LODWORD(v106) = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v121 = v52;
          unint64_t v54 = sub_236A825A0(v38, v37);
          uint64_t v55 = *(void *)(v52 + 16);
          BOOL v56 = (v53 & 1) == 0;
          uint64_t v57 = v55 + v56;
          if (__OFADD__(v55, v56)) {
            goto LABEL_76;
          }
          if (*(void *)(v52 + 24) >= v57)
          {
            if ((v106 & 1) == 0)
            {
              LODWORD(v116) = v53;
              sub_236C5A28C();
              LOBYTE(v53) = v116;
            }
          }
          else
          {
            LODWORD(v116) = v53;
            sub_236C56B40(v57, (char)v106);
            unint64_t v58 = sub_236A825A0(v38, v37);
            int v59 = v53 & 1;
            LOBYTE(v53) = v116;
            if ((v116 & 1) != v59) {
              goto LABEL_85;
            }
            unint64_t v54 = v58;
          }
          unint64_t v82 = v121;
          unint64_t v116 = v121;
          if (v53) {
            goto LABEL_58;
          }
          *(void *)(v121 + 8 * (v54 >> 6) + 64) |= 1 << v54;
          v83 = (uint64_t *)(*(void *)(v116 + 48) + 16 * v54);
          uint64_t *v83 = v38;
          v83[1] = v37;
          sub_236A5A450(v122, (_OWORD *)(*(void *)(v116 + 56) + 32 * v54));
          unint64_t v84 = v116;
          uint64_t v85 = *(void *)(v116 + 16);
          BOOL v86 = __OFADD__(v85, 1);
          uint64_t v87 = v85 + 1;
          if (!v86) {
            goto LABEL_65;
          }
          goto LABEL_82;
        case 3u:
          unint64_t v124 = sub_236C73F58();
          __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v123);
          sub_236C73E38();
          sub_236A5A450(&v123, v122);
          unint64_t v75 = v116;
          LODWORD(v106) = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v121 = v75;
          unint64_t v54 = sub_236A825A0(v38, v37);
          uint64_t v77 = *(void *)(v75 + 16);
          BOOL v78 = (v76 & 1) == 0;
          uint64_t v79 = v77 + v78;
          if (__OFADD__(v77, v78)) {
            goto LABEL_79;
          }
          if (*(void *)(v75 + 24) >= v79)
          {
            if ((v106 & 1) == 0)
            {
              LODWORD(v116) = v76;
              sub_236C5A28C();
              LOBYTE(v76) = v116;
            }
          }
          else
          {
            LODWORD(v116) = v76;
            sub_236C56B40(v79, (char)v106);
            unint64_t v80 = sub_236A825A0(v38, v37);
            int v81 = v76 & 1;
            LOBYTE(v76) = v116;
            if ((v116 & 1) != v81) {
              goto LABEL_85;
            }
            unint64_t v54 = v80;
          }
          unint64_t v82 = v121;
          unint64_t v116 = v121;
          if (v76)
          {
LABEL_58:
            uint64_t v90 = (_OWORD *)(*(void *)(v82 + 56) + 32 * v54);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v90);
            sub_236A5A450(v122, v90);
          }
          else
          {
            *(void *)(v121 + 8 * (v54 >> 6) + 64) |= 1 << v54;
            uint64_t v97 = (uint64_t *)(*(void *)(v116 + 48) + 16 * v54);
            *uint64_t v97 = v38;
            v97[1] = v37;
            sub_236A5A450(v122, (_OWORD *)(*(void *)(v116 + 56) + 32 * v54));
            unint64_t v84 = v116;
            uint64_t v98 = *(void *)(v116 + 16);
            BOOL v86 = __OFADD__(v98, 1);
            uint64_t v87 = v98 + 1;
            if (v86) {
              goto LABEL_81;
            }
LABEL_65:
            *(void *)(v84 + 16) = v87;
            swift_bridgeObjectRetain();
          }
LABEL_66:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_67:
          sub_236C5BEF0(v114, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue.OneOf_MetadataValue);
          break;
        default:
          uint64_t v41 = *v115;
          uint64_t v42 = v115[1];
          unint64_t v124 = MEMORY[0x263F8D310];
          *(void *)&long long v123 = v41;
          *((void *)&v123 + 1) = v42;
          sub_236A5A450(&v123, v122);
          unint64_t v43 = v116;
          LODWORD(v106) = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v121 = v43;
          unint64_t v45 = sub_236A825A0(v38, v37);
          uint64_t v46 = *(void *)(v43 + 16);
          BOOL v47 = (v44 & 1) == 0;
          uint64_t v48 = v46 + v47;
          if (__OFADD__(v46, v47)) {
            goto LABEL_77;
          }
          if (*(void *)(v43 + 24) >= v48)
          {
            if ((v106 & 1) == 0)
            {
              LODWORD(v116) = v44;
              sub_236C5A28C();
              LOBYTE(v44) = v116;
            }
          }
          else
          {
            LODWORD(v116) = v44;
            sub_236C56B40(v48, (char)v106);
            unint64_t v49 = sub_236A825A0(v38, v37);
            int v50 = v44 & 1;
            LOBYTE(v44) = v116;
            if ((v116 & 1) != v50) {
              goto LABEL_85;
            }
            unint64_t v45 = v49;
          }
          unint64_t v116 = v121;
          if (v44)
          {
            uint64_t v88 = (_OWORD *)(*(void *)(v121 + 56) + 32 * v45);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
            sub_236A5A450(v122, v88);
          }
          else
          {
            *(void *)(v121 + 8 * (v45 >> 6) + 64) |= 1 << v45;
            v91 = (uint64_t *)(*(void *)(v116 + 48) + 16 * v45);
            uint64_t *v91 = v38;
            v91[1] = v37;
            sub_236A5A450(v122, (_OWORD *)(*(void *)(v116 + 56) + 32 * v45));
            uint64_t v92 = *(void *)(v116 + 16);
            BOOL v86 = __OFADD__(v92, 1);
            uint64_t v93 = v92 + 1;
            if (v86) {
              goto LABEL_80;
            }
            *(void *)(v116 + 16) = v93;
            swift_bridgeObjectRetain();
          }
          goto LABEL_66;
      }
    }
  }
  swift_release();
  uint64_t v99 = *((unsigned __int8 *)v113 + 8);
  uint64_t v100 = *((unsigned __int8 *)v113 + 9);
  id v101 = objc_allocWithZone(MEMORY[0x263F3F188]);
  v102 = (void *)sub_236C74D58();
  swift_bridgeObjectRelease();
  id v103 = objc_msgSend(v101, sel_initWithActivityTypeIdentifier_isIndoor_isPartOfMultiSport_metadata_auxiliaryTypeIdentifier_, v112, v99, v100, v102, v111);

  return v103;
}

uint64_t sub_236C5671C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_236C73F58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA8F0);
  int v46 = a2;
  uint64_t v10 = sub_236C756C8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_236C5C084(&qword_2688A7F88, MEMORY[0x263F07490]);
    uint64_t result = sub_236C74DA8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_236C56B40(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA988);
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_236A5A450(v24, v35);
      }
      else
      {
        sub_236A83E88((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_236C75A08();
      sub_236C74EE8();
      uint64_t result = sub_236C75A68();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_236A5A450(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C56E40(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue(0);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA9A0);
  int v43 = a2;
  uint64_t v9 = sub_236C756C8();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_236C5BF50(v30, (uint64_t)v7, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    }
    else
    {
      sub_236C5C01C(v30, (uint64_t)v7, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
      swift_bridgeObjectRetain();
    }
    sub_236C75A08();
    sub_236C74EE8();
    uint64_t result = sub_236C75A68();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_236C5BF50((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_236C57220(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA978);
  uint64_t result = sub_236C756C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    unint64_t v32 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    uint64_t v31 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v30;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      unsigned int v21 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v17);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
      uint64_t result = MEMORY[0x237E0BDC0](*(void *)(v7 + 40), v21, 4);
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v15) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C574C8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA980);
  uint64_t result = sub_236C756C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    char v34 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_236C759F8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C57774(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_236C73F58();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDC8);
  int v47 = a2;
  uint64_t v8 = sub_236C756C8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  int v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    char v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_236C75A08();
    sub_236C74EE8();
    uint64_t result = sub_236C75A68();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    int64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_236C57B5C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDB0);
  char v38 = a2;
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_236C75A08();
    sub_236C74EE8();
    uint64_t result = sub_236C75A68();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C57E6C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDC0);
  char v42 = a2;
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_236C75A08();
    sub_236C74EE8();
    uint64_t result = sub_236C75A68();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C58194(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_236C73FE8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA970);
  int v46 = a2;
  uint64_t v10 = sub_236C756C8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_236C5C084(&qword_2688A7BF8, MEMORY[0x263F07508]);
    uint64_t result = sub_236C74DA8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_236C585B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDB8);
  char v36 = a2;
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_236C75A08();
    sub_236C74EE8();
    uint64_t result = sub_236C75A68();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C588D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA860);
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  char v32 = a2;
  uint64_t v33 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
LABEL_8:
  if (v10)
  {
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v15 = v14 | (v12 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_39;
  }
  if (v16 >= v34)
  {
    swift_release();
    uint64_t v3 = v33;
    unint64_t v17 = (void *)(v5 + 64);
    if (v32)
    {
LABEL_34:
      uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
      if (v30 >= 64) {
        bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        void *v17 = -1 << v30;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    unint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v35 + 8 * v16);
    ++v12;
    if (v18) {
      goto LABEL_21;
    }
    int64_t v12 = v16 + 1;
    if (v16 + 1 >= v34) {
      goto LABEL_31;
    }
    unint64_t v18 = *(void *)(v35 + 8 * v12);
    if (v18)
    {
LABEL_21:
      unint64_t v10 = (v18 - 1) & v18;
      unint64_t v15 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_22:
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v15);
      int v21 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v15);
      sub_236C75A08();
      sub_236C74EE8();
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_236C75A68();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = v22 & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_7;
      }
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      while (++v25 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v25);
        if (v29 != -1)
        {
          unint64_t v13 = __clz(__rbit64(~v29)) + (v25 << 6);
LABEL_7:
          *(void *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          *(unsigned char *)(*(void *)(v7 + 48) + v13) = v20;
          *(_DWORD *)(*(void *)(v7 + 56) + 4 * v13) = v21;
          ++*(void *)(v7 + 16);
          goto LABEL_8;
        }
      }
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      JUMPOUT(0x236C58DB0);
    }
    int64_t v19 = v16 + 2;
    if (v19 < v34)
    {
      unint64_t v18 = *(void *)(v35 + 8 * v19);
      if (!v18)
      {
        while (1)
        {
          int64_t v12 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            goto LABEL_40;
          }
          if (v12 >= v34) {
            goto LABEL_31;
          }
          unint64_t v18 = *(void *)(v35 + 8 * v12);
          ++v19;
          if (v18) {
            goto LABEL_21;
          }
        }
      }
      int64_t v12 = v19;
      goto LABEL_21;
    }
LABEL_31:
    swift_release();
    uint64_t v3 = v33;
    if (v32) {
      goto LABEL_34;
    }
  }
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C58DF4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA960);
  uint64_t result = sub_236C756C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      char v26 = *(unsigned char *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_236C75A08();
      sub_236C75A18();
      uint64_t result = sub_236C75A68();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C590C4(uint64_t a1, char a2)
{
  return sub_236C590DC(a1, a2, &qword_2688AA958);
}

uint64_t sub_236C590D0(uint64_t a1, char a2)
{
  return sub_236C590DC(a1, a2, &qword_2688AA8E0);
}

uint64_t sub_236C590DC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_236C756C8();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (uint64_t *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v32 = -1 << v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v6 + 32);
    int64_t v34 = v4;
    int64_t v35 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }
      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v4 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v6 + 64), 8 * v35);
              }
              else {
                uint64_t *v10 = v32;
              }
              uint64_t v4 = v34;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v9 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v24;
          }
        }
LABEL_30:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(*(void *)(v6 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v6 + 56) + v29);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_236C759F8();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v30;
      *(void *)(*(void *)(v8 + 56) + v19) = v31;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v4 = v8;
  return result;
}

unint64_t sub_236C59394(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA8F8);
  uint64_t v6 = (void *)sub_236C756C8();
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v8 = (void *)(v5 + 64);
    uint64_t v9 = -1;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v15 = v14 | (v13 << 6);
      }
      else
      {
        int64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v16 >= v11) {
          goto LABEL_22;
        }
        unint64_t v17 = v8[v16];
        ++v13;
        if (!v17)
        {
          int64_t v13 = v16 + 1;
          if (v16 + 1 >= v11) {
            goto LABEL_22;
          }
          unint64_t v17 = v8[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v11)
            {
LABEL_22:
              swift_release();
              if (a2)
              {
                uint64_t v22 = 1 << *(unsigned char *)(v5 + 32);
                if (v22 > 63) {
                  bzero((void *)(v5 + 64), ((unint64_t)(v22 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v22;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_29;
                }
                if (v13 >= v11) {
                  goto LABEL_22;
                }
                unint64_t v17 = v8[v13];
                ++v18;
                if (v17) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v13 = v18;
          }
        }
LABEL_19:
        unint64_t v10 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      uint64_t v19 = 8 * v15;
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + v19);
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + v19);
      if ((a2 & 1) == 0)
      {
        swift_retain();
        swift_bridgeObjectRetain();
      }
      unint64_t result = sub_236C59C10(v20, v21, v6);
    }
  }
  unint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_236C59584(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA858);
  uint64_t v6 = sub_236C756C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  char v34 = a2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      return result;
    }
    if (v18 >= v36) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v37 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v36) {
        goto LABEL_31;
      }
      unint64_t v20 = *(void *)(v37 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v36)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v35;
          if ((v34 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
        unint64_t v20 = *(void *)(v37 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_40;
            }
            if (v13 >= v36) {
              goto LABEL_31;
            }
            unint64_t v20 = *(void *)(v37 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = *(void *)(v5 + 48) + 16 * v17;
    char v23 = *(unsigned char *)(v22 + 8);
    uint64_t v24 = *(void *)v22;
    int v25 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v17);
    sub_236C75A08();
    sub_236A84644();
    sub_236C74DB8();
    uint64_t result = sub_236C75A68();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = *(void *)(v7 + 48) + 16 * v14;
    *(void *)uint64_t v15 = v24;
    *(unsigned char *)(v15 + 8) = v23;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v14) = v25;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v34 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_236C59898(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDD0);
  char v6 = a2;
  uint64_t v7 = sub_236C756C8();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      BOOL v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_236A5B9DC(v37, *((unint64_t *)&v37 + 1));
      }
      sub_236C75A08();
      sub_236C74EE8();
      uint64_t result = sub_236C75A68();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      unint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_236C59BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A86E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_236C59C10(uint64_t a1, uint64_t a2, void *a3)
{
  sub_236C75A08();
  swift_beginAccess();
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_236C74EE8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_236C75A18();
  sub_236C75A68();
  unint64_t result = sub_236C754A8();
  *(void *)((char *)a3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
  uint64_t v7 = 8 * result;
  *(void *)(a3[6] + v7) = a1;
  *(void *)(a3[7] + v7) = a2;
  ++a3[2];
  return result;
}

uint64_t sub_236C59D40(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_236C73F58();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

_OWORD *sub_236C59DF8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  char v6 = (void *)(a5[6] + 16 * a1);
  *char v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_236A5A450(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_236C59E64(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_236C73F58();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_236C59F18(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  char v6 = (void *)(a6[6] + 16 * result);
  *char v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_236C59F68(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_236C59FB0(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

void *sub_236C59FF4()
{
  uint64_t v1 = sub_236C73F58();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA8F0);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_236C756B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_236C5A28C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA988);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_236A83E88(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_236A5A450(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_236C5A474()
{
  unint64_t result = qword_2688A7D10;
  if (!qword_2688A7D10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688A7D10);
  }
  return result;
}

void *sub_236C5A4B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue(0);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA9A0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_236C756B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_236C5C01C(*(void *)(v5 + 56) + v21, (uint64_t)v4, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *int64_t v22 = v19;
    v22[1] = v20;
    sub_236C5BF50((uint64_t)v4, *(void *)(v7 + 56) + v21, type metadata accessor for Apple_Workout_Core_ActivityMetadataValue);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_236C5A748()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA978);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v23 = __clz(__rbit64(v21));
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = v23 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 8 * v15;
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5A8DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA980);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5AA6C()
{
  uint64_t v35 = sub_236C73F58();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDC8);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_236C756B8();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    int64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_236C5AD30()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5AEE4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_236C5B0A0()
{
  uint64_t v1 = sub_236C73FE8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA970);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_236C756B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_236C5B338()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5B4F0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA860);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    int v16 = *(_DWORD *)(*(void *)(v2 + 56) + 4 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(_DWORD *)(*(void *)(v4 + 56) + 4 * v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5B680()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA960);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5B824()
{
  return sub_236C5B83C(&qword_2688AA958);
}

void *sub_236C5B830()
{
  return sub_236C5B83C(&qword_2688AA8E0);
}

void *sub_236C5B83C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_236C756B8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    id result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5B9D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA8F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5BB84()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688AA858);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v25 = __clz(__rbit64(v23));
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = v25 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 16 * v15;
    uint64_t v18 = *(void *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = 4 * v15;
    int v20 = *(_DWORD *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v21 = v18;
    *(unsigned char *)(v21 + 8) = v17;
    *(_DWORD *)(*(void *)(v4 + 56) + v19) = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236C5BD28()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDD0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236C756B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    int v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    id result = (void *)sub_236A5B9DC(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_236C5BEF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236C5BF50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_236C5BFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Workout_Core_ActivityMetadataValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_236C5C01C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236C5C084(unint64_t *a1, void (*a2)(uint64_t))
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

void (*MetricsPublisher.segmentDuration.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.splitDuration.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.distance.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.currentPace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.averagePace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.fastestPace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.rollingPace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.currentElevation.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.requiredPace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.secondsAheadOfPacer.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.elevationGain.getter()
{
  return sub_236AAF300();
}

uint64_t MetricsPublisher.elevationGain.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.descent.getter()
{
  return sub_236AAF300();
}

uint64_t MetricsPublisher.descent.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.currentCadence.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.averageCadence.setter()
{
  return sub_236AAF4B8();
}

void (*MetricsPublisher.segmentDistance.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.segmentPace.setter()
{
  return sub_236A709E8();
}

void (*MetricsPublisher.segmentActiveEnergy.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.segmentTotalEnergy.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.splitDistance.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.splitPace.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.currentStrideLength.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.averageStrideLength.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.currentVerticalOscillation.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.averageVerticalOscillation.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.currentGroundContactTime.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.averageGroundContactTime.setter()
{
  return sub_236AAF4B8();
}

void (*MetricsPublisher.descent.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.flightsClimbed.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

void (*MetricsPublisher.downhillRunCount.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

double MetricsPublisher.timerRemainingTime.getter()
{
  return sub_236A70844();
}

void (*MetricsPublisher.timerRemainingTime.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

double MetricsPublisher.timerRemainingTimeWithOffset.getter()
{
  return sub_236A70844();
}

uint64_t MetricsPublisher.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  MetricsPublisher.init()();
  return v0;
}

uint64_t MetricsPublisher.splitStartDate.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236A731D0(a1, (uint64_t)v4, &qword_26AF2FE50);
  swift_retain();
  sub_236C74C38();
  return sub_236A73174(a1, &qword_26AF2FE50);
}

uint64_t MetricsPublisher.distance.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.elevationChartData.setter()
{
  return sub_236C74C38();
}

uint64_t MetricsPublisher.flightsClimbed.setter()
{
  return sub_236A709E8();
}

double MetricsPublisher.averagePace.getter()
{
  return sub_236A70844();
}

double MetricsPublisher.distance.getter()
{
  return sub_236A70844();
}

uint64_t MetricsPublisher.segmentDuration.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.segmentDistance.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.segmentActiveEnergy.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.segmentTotalEnergy.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.timerDuration.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.timerRemainingTime.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.timerRemainingTimeWithOffset.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.splitIndex.setter()
{
  return sub_236AA307C();
}

uint64_t MetricsPublisher.splitDuration.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.splitDistance.setter()
{
  return sub_236A709E8();
}

uint64_t MetricsPublisher.downhillRunCount.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.distanceGoalFinishTime.setter()
{
  return sub_236AAF4B8();
}

uint64_t MetricsPublisher.protobuf.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v435 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v437 = sub_236C73F58();
  uint64_t v479 = *(void *)(v437 - 8);
  MEMORY[0x270FA5388](v437);
  v436 = (char *)&v435 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v477 = (uint64_t)&v435 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v476 = (uint64_t)&v435 - v11;
  uint64_t v12 = type metadata accessor for Apple_Workout_Core_LocationPositionPublisher();
  uint64_t v474 = *(void *)(v12 - 8);
  uint64_t v475 = v12;
  MEMORY[0x270FA5388](v12);
  v473 = (unint64_t *)((char *)&v435 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BC8);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v472 = (uint64_t)&v435 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v471 = (uint64_t)&v435 - v17;
  uint64_t v18 = type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher(0);
  uint64_t v469 = *(void *)(v18 - 8);
  uint64_t v470 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v468 = (uint64_t)&v435 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BD0);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v467 = (uint64_t)&v435 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v466 = (uint64_t)&v435 - v23;
  uint64_t v24 = type metadata accessor for Apple_Workout_Core_RaceInformationPublisher(0);
  uint64_t v464 = *(void *)(v24 - 8);
  uint64_t v465 = v24;
  MEMORY[0x270FA5388](v24);
  v463 = (unint64_t *)((char *)&v435 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BE8);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v462 = (uint64_t)&v435 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v461 = (uint64_t)&v435 - v29;
  uint64_t v30 = type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher(0);
  uint64_t v459 = *(void *)(v30 - 8);
  uint64_t v460 = v30;
  MEMORY[0x270FA5388](v30);
  uint64_t v458 = (uint64_t)&v435 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C00);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  uint64_t v457 = (uint64_t)&v435 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v456 = (uint64_t)&v435 - v35;
  uint64_t v36 = type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher(0);
  uint64_t v454 = *(void *)(v36 - 8);
  uint64_t v455 = v36;
  MEMORY[0x270FA5388](v36);
  uint64_t v453 = (uint64_t)&v435 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BC0);
  uint64_t v39 = MEMORY[0x270FA5388](v38 - 8);
  uint64_t v452 = (uint64_t)&v435 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v39);
  uint64_t v451 = (uint64_t)&v435 - v41;
  uint64_t v42 = type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0);
  uint64_t v449 = *(void *)(v42 - 8);
  uint64_t v450 = v42;
  MEMORY[0x270FA5388](v42);
  v448 = (char *)&v435 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BB8);
  uint64_t v45 = MEMORY[0x270FA5388](v44 - 8);
  uint64_t v447 = (uint64_t)&v435 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v45);
  uint64_t v446 = (uint64_t)&v435 - v47;
  uint64_t v48 = type metadata accessor for Apple_Workout_Core_WaterTemperatureMetricsPublisher();
  uint64_t v444 = *(void *)(v48 - 8);
  uint64_t v445 = v48;
  MEMORY[0x270FA5388](v48);
  v443 = (char *)&v435 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BD8);
  uint64_t v51 = MEMORY[0x270FA5388](v50 - 8);
  uint64_t v442 = (uint64_t)&v435 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v51);
  uint64_t v441 = (uint64_t)&v435 - v53;
  uint64_t v54 = type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher();
  uint64_t v439 = *(void *)(v54 - 8);
  uint64_t v440 = v54;
  MEMORY[0x270FA5388](v54);
  uint64_t v438 = (uint64_t)&v435 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v518 = type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement();
  uint64_t v517 = *(void *)(v518 - 8);
  uint64_t v56 = MEMORY[0x270FA5388](v518);
  uint64_t v522 = (uint64_t)&v435 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v520 = (char *)&v435 - v59;
  MEMORY[0x270FA5388](v58);
  uint64_t v521 = (uint64_t)&v435 - v60;
  uint64_t v523 = type metadata accessor for WorkoutChartDataElement();
  uint64_t v435 = *(void *)(v523 - 8);
  MEMORY[0x270FA5388](v523);
  v519 = (char *)&v435 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C10);
  uint64_t v63 = MEMORY[0x270FA5388](v62 - 8);
  uint64_t v512 = (uint64_t)&v435 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v63);
  uint64_t v511 = (uint64_t)&v435 - v65;
  uint64_t v510 = type metadata accessor for Apple_Workout_Core_GoalPublisher(0);
  uint64_t v509 = *(void *)(v510 - 8);
  MEMORY[0x270FA5388](v510);
  v508 = (uint64_t *)((char *)&v435 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BE0);
  uint64_t v68 = MEMORY[0x270FA5388](v67 - 8);
  uint64_t v507 = (uint64_t)&v435 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v68);
  uint64_t v506 = (uint64_t)&v435 - v70;
  uint64_t v505 = type metadata accessor for Apple_Workout_Core_PlatterPublisher(0);
  uint64_t v504 = *(void *)(v505 - 8);
  MEMORY[0x270FA5388](v505);
  v503 = (unint64_t *)((char *)&v435 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BF8);
  uint64_t v73 = MEMORY[0x270FA5388](v72 - 8);
  uint64_t v502 = (uint64_t)&v435 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v73);
  uint64_t v501 = (uint64_t)&v435 - v75;
  uint64_t v500 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  uint64_t v499 = *(void *)(v500 - 8);
  MEMORY[0x270FA5388](v500);
  v498 = (char *)&v435 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C18);
  uint64_t v78 = MEMORY[0x270FA5388](v77 - 8);
  uint64_t v497 = (uint64_t)&v435 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v78);
  uint64_t v496 = (uint64_t)&v435 - v80;
  uint64_t v81 = type metadata accessor for Apple_Workout_Core_EnergyMetricsPublisher();
  uint64_t v494 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  v516 = (uint64_t *)((char *)&v435 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C08);
  uint64_t v84 = MEMORY[0x270FA5388](v83 - 8);
  uint64_t v493 = (uint64_t)&v435 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v84);
  uint64_t v492 = (uint64_t)&v435 - v86;
  uint64_t v87 = type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher();
  uint64_t v490 = *(void *)(v87 - 8);
  uint64_t v491 = v87;
  MEMORY[0x270FA5388](v87);
  uint64_t v489 = (uint64_t)&v435 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C28);
  uint64_t v90 = MEMORY[0x270FA5388](v89 - 8);
  uint64_t v488 = (uint64_t)&v435 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v90);
  uint64_t v487 = (uint64_t)&v435 - v92;
  uint64_t v93 = type metadata accessor for Apple_Workout_Core_HKActivitySummary(0);
  uint64_t v484 = *(void *)(v93 - 8);
  uint64_t v485 = v93;
  MEMORY[0x270FA5388](v93);
  uint64_t v483 = (uint64_t)&v435 - ((v94 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v515 = type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher(0);
  uint64_t v486 = *(void *)(v515 - 8);
  MEMORY[0x270FA5388](v515);
  v514 = (char *)&v435 - ((v95 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C20);
  uint64_t v97 = MEMORY[0x270FA5388](v96 - 8);
  uint64_t v513 = (uint64_t)&v435 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v97);
  uint64_t v482 = (uint64_t)&v435 - v99;
  uint64_t v100 = type metadata accessor for Apple_Workout_Core_ElapsedTimeMetricsPublisher();
  uint64_t v480 = *(void *)(v100 - 8);
  uint64_t v481 = v100;
  MEMORY[0x270FA5388](v100);
  int64_t v102 = (int64_t)&v435 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v103 = (_DWORD *)sub_236C73FE8();
  uint64_t v104 = (uint64_t *)*((void *)v103 - 1);
  MEMORY[0x270FA5388](v103);
  uint64_t v106 = (uint64_t)&v435 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
  unint64_t v107 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Apple_Workout_Core_MetricsPublisher(0) + 20));
  if (qword_2688A7978 != -1) {
    goto LABEL_177;
  }
  while (1)
  {
    uint64_t v495 = v81;
    v478 = v6;
    *unint64_t v107 = qword_2688AB248;
    swift_beginAccess();
    char v108 = *(unsigned char *)(v2 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v524 = v107;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v110 = swift_retain();
      uint64_t v111 = sub_236C08FE8(v110);
      unint64_t v107 = v524;
      swift_release();
      *unint64_t v107 = v111;
      swift_release();
    }
    uint64_t v112 = *v107;
    swift_beginAccess();
    *(unsigned char *)(v112 + 16) = v108;
    swift_getKeyPath();
    swift_getKeyPath();
    v113 = v107;
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v114 = sub_236C6E6B8();
    uint64_t v116 = v115;
    ((void (*)(uint64_t, _DWORD *))v104[1])(v106, v103);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v117 = swift_retain();
      uint64_t v118 = sub_236C08FE8(v117);
      swift_release();
      uint64_t *v113 = v118;
      swift_release();
    }
    uint64_t v119 = (uint64_t *)(*v113
                     + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__workoutIdentifierBytes);
    swift_beginAccess();
    uint64_t v120 = *v119;
    unint64_t v121 = v119[1];
    *uint64_t v119 = v114;
    v119[1] = v116;
    sub_236A5B940(v120, v121);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v122 = v554;
    unint64_t v107 = v113;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v123 = swift_retain();
      uint64_t v124 = sub_236C08FE8(v123);
      swift_release();
      uint64_t *v113 = v124;
      swift_release();
    }
    uint64_t v125 = *v113;
    swift_beginAccess();
    *(void *)(v125 + 40) = v122;
    *(unsigned char *)(v125 + 48) = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    unsigned __int8 v126 = v554;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v127 = swift_retain();
      uint64_t v128 = sub_236C08FE8(v127);
      swift_release();
      uint64_t *v113 = v128;
      swift_release();
    }
    uint64_t v129 = *v113;
    swift_beginAccess();
    *(unsigned char *)(v129 + 49) = v126;
    *(void *)int64_t v102 = 0;
    uint64_t v130 = v481;
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    *(void *)int64_t v102 = v553;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v131 = swift_retain();
      uint64_t v132 = sub_236C08FE8(v131);
      swift_release();
      uint64_t *v113 = v132;
      swift_release();
    }
    uint64_t v133 = *v113;
    uint64_t v134 = v482;
    sub_236C70690(v102, v482, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_ElapsedTimeMetricsPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v480 + 56))(v134, 0, 1, v130);
    uint64_t v135 = v513;
    sub_236A926F0(v134, v513, &qword_2688A9C20);
    uint64_t v136 = v133
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elapsedTimeMetricsPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v135, v136, &qword_2688A9C20);
    swift_endAccess();
    swift_release();
    uint64_t v513 = v2;
    v137 = v514;
    unsigned char *v514 = 0;
    uint64_t v138 = v515;
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    uint64_t v139 = (uint64_t)&v137[*(int *)(v138 + 24)];
    uint64_t v140 = v485;
    v141 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v484 + 56);
    v141(v139, 1, 1, v485);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    v142 = v553;
    uint64_t v143 = v483;
    sub_236C3D3A8(v483);

    sub_236A73174(v139, &qword_2688AB6A8);
    sub_236C70690(v143, v139, type metadata accessor for Apple_Workout_Core_HKActivitySummary);
    v141(v139, 0, 1, v140);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    unsigned char *v137 = (_BYTE)v553;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v144 = swift_retain();
      uint64_t v145 = sub_236C08FE8(v144);
      swift_release();
      *unint64_t v107 = v145;
      swift_release();
    }
    uint64_t v146 = *v107;
    uint64_t v147 = v487;
    sub_236C70690((uint64_t)v514, v487, type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v486 + 56))(v147, 0, 1, v515);
    uint64_t v148 = v488;
    sub_236A926F0(v147, v488, &qword_2688A9C28);
    uint64_t v149 = v146
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__activitySummaryMetricsPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v148, v149, &qword_2688A9C28);
    swift_endAccess();
    swift_release();
    uint64_t v150 = v489;
    HeartRateMetricsPublisher.protobuf.getter(v489);
    char v151 = swift_isUniquelyReferenced_nonNull_native();
    v152 = v498;
    uint64_t v153 = v495;
    if ((v151 & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v154 = swift_retain();
      uint64_t v155 = sub_236C08FE8(v154);
      swift_release();
      *unint64_t v107 = v155;
      swift_release();
    }
    uint64_t v156 = *v107;
    uint64_t v157 = v150;
    uint64_t v158 = v492;
    sub_236C70690(v157, v492, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v490 + 56))(v158, 0, 1, v491);
    uint64_t v159 = v493;
    sub_236A926F0(v158, v493, &qword_2688A9C08);
    uint64_t v160 = v156
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__heartRateMetricsPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v159, v160, &qword_2688A9C08);
    swift_endAccess();
    swift_release();
    v161 = v516;
    void *v516 = 0;
    v161[1] = 0;
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    void *v161 = v553;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    v161[1] = v553;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v162 = swift_retain();
      uint64_t v163 = sub_236C08FE8(v162);
      swift_release();
      *unint64_t v107 = v163;
      swift_release();
    }
    uint64_t v164 = *v107;
    uint64_t v165 = v496;
    sub_236C70690((uint64_t)v516, v496, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_EnergyMetricsPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v494 + 56))(v165, 0, 1, v153);
    uint64_t v166 = v497;
    sub_236A926F0(v165, v497, &qword_2688A9C18);
    uint64_t v167 = v164
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__energyMetricsPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v166, v167, &qword_2688A9C18);
    swift_endAccess();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    v168 = v553;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v169 = swift_retain();
      uint64_t v170 = sub_236C08FE8(v169);
      swift_release();
      *unint64_t v107 = v170;
      swift_release();
    }
    v171 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__distance);
    swift_beginAccess();
    void *v171 = v168;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v172 = v552;
    char v173 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v174 = v500;
    if ((v173 & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v175 = swift_retain();
      uint64_t v176 = sub_236C08FE8(v175);
      swift_release();
      *unint64_t v107 = v176;
      swift_release();
    }
    v177 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__secondsAheadOfPacer);
    swift_beginAccess();
    void *v177 = v172;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v178 = v551;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v179 = swift_retain();
      uint64_t v180 = sub_236C08FE8(v179);
      swift_release();
      *unint64_t v107 = v180;
      swift_release();
    }
    v181 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentPace);
    swift_beginAccess();
    void *v181 = v178;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v182 = v550;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v183 = swift_retain();
      uint64_t v184 = sub_236C08FE8(v183);
      swift_release();
      *unint64_t v107 = v184;
      swift_release();
    }
    v185 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averagePace);
    swift_beginAccess();
    void *v185 = v182;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v186 = v549;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v187 = swift_retain();
      uint64_t v188 = sub_236C08FE8(v187);
      swift_release();
      *unint64_t v107 = v188;
      swift_release();
    }
    v189 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__rollingPace);
    swift_beginAccess();
    void *v189 = v186;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v190 = v548;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v191 = swift_retain();
      uint64_t v192 = sub_236C08FE8(v191);
      swift_release();
      *unint64_t v107 = v192;
      swift_release();
    }
    v193 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__requiredPace);
    swift_beginAccess();
    void *v193 = v190;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v194 = v547;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v195 = swift_retain();
      uint64_t v196 = sub_236C08FE8(v195);
      swift_release();
      *unint64_t v107 = v196;
      swift_release();
    }
    v197 = (void *)(*v107
                    + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__fastestPace);
    swift_beginAccess();
    void *v197 = v194;
    _DWORD *v152 = 0;
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    if (HIDWORD(v545)) {
      goto LABEL_182;
    }
    _DWORD *v152 = v545;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v198 = swift_retain();
      uint64_t v199 = sub_236C08FE8(v198);
      swift_release();
      *unint64_t v107 = v199;
      swift_release();
    }
    uint64_t v200 = *v107;
    uint64_t v201 = v501;
    sub_236C70690((uint64_t)v152, v501, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v499 + 56))(v201, 0, 1, v174);
    uint64_t v202 = v502;
    sub_236A926F0(v201, v502, &qword_2688A9BF8);
    uint64_t v203 = v200
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__lapsMetricsPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v202, v203, &qword_2688A9BF8);
    swift_endAccess();
    swift_release();
    v204 = v503;
    PlatterPublisher.protobuf.getter(v503);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v205 = swift_retain();
      uint64_t v206 = sub_236C08FE8(v205);
      swift_release();
      *unint64_t v107 = v206;
      swift_release();
    }
    uint64_t v207 = *v107;
    uint64_t v208 = (uint64_t)v204;
    uint64_t v209 = v506;
    sub_236C70690(v208, v506, type metadata accessor for Apple_Workout_Core_PlatterPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v504 + 56))(v209, 0, 1, v505);
    uint64_t v210 = v507;
    sub_236A926F0(v209, v507, &qword_2688A9BE0);
    uint64_t v211 = v207
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__platterPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v210, v211, &qword_2688A9BE0);
    swift_endAccess();
    swift_release();
    uint64_t v212 = (uint64_t)v508;
    void *v508 = 0;
    *(unsigned char *)(v212 + 8) = 1;
    *(_DWORD *)(v212 + 12) = 0;
    uint64_t v213 = v510;
    _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v214 = 0;
    if (v545 <= 3) {
      uint64_t v214 = qword_236C8E800[v545];
    }
    *(void *)uint64_t v212 = v214;
    *(unsigned char *)(v212 + 8) = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    *(_DWORD *)(v212 + 12) = v545;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v215 = swift_retain();
      uint64_t v216 = sub_236C08FE8(v215);
      swift_release();
      *unint64_t v107 = v216;
      swift_release();
    }
    uint64_t v217 = *v107;
    uint64_t v218 = v511;
    sub_236C70690(v212, v511, type metadata accessor for Apple_Workout_Core_GoalPublisher);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v509 + 56))(v218, 0, 1, v213);
    uint64_t v219 = v512;
    sub_236A926F0(v218, v512, &qword_2688A9C10);
    uint64_t v220 = v217
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__goalPublisher;
    swift_beginAccess();
    swift_retain();
    sub_236A92754(v219, v220, &qword_2688A9C10);
    swift_endAccess();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    if ((v546 & 1) == 0)
    {
      unint64_t v221 = v545;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
        swift_allocObject();
        uint64_t v222 = swift_retain();
        uint64_t v223 = sub_236C08FE8(v222);
        swift_release();
        *unint64_t v107 = v223;
        swift_release();
      }
      uint64_t v224 = *v107
           + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationGain;
      swift_beginAccess();
      *(void *)uint64_t v224 = v221;
      *(unsigned char *)(v224 + 8) = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    if ((v546 & 1) == 0)
    {
      unint64_t v225 = v545;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
        swift_allocObject();
        uint64_t v226 = swift_retain();
        uint64_t v227 = sub_236C08FE8(v226);
        swift_release();
        *unint64_t v107 = v227;
        swift_release();
      }
      uint64_t v228 = *v107
           + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentElevation;
      swift_beginAccess();
      *(void *)uint64_t v228 = v225;
      *(unsigned char *)(v228 + 8) = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v81 = *(void *)(v545 + 16);
    if (!v81) {
      break;
    }
    uint64_t v229 = *(unsigned __int8 *)(v435 + 80);
    v516 = (void *)v545;
    int64_t v102 = v545 + ((v229 + 32) & ~v229);
    uint64_t v106 = 0x7FF0000000000000;
    uint64_t v6 = *(char **)(v435 + 72);
    uint64_t v104 = &qword_2688AB000;
    id v103 = v520;
    uint64_t v230 = (uint64_t)v519;
    while (1)
    {
      sub_236C6EF0C(v102, v230, (uint64_t (*)(void))type metadata accessor for WorkoutChartDataElement);
      double v232 = *(double *)(v230 + *(int *)(v523 + 20));
      if ((~*(void *)&v232 & 0x7FF0000000000000) == 0) {
        goto LABEL_52;
      }
      uint64_t v2 = v230;
      uint64_t v233 = v518;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      v234 = (char *)v103 + *(int *)(v233 + 28);
      *(void *)v234 = 0;
      v234[8] = 1;
      v235 = (char *)v103 + *(int *)(v233 + 32);
      *(void *)v235 = 0;
      v235[8] = 1;
      sub_236C73E48();
      if ((~*(void *)&v236 & 0x7FF0000000000000) == 0) {
        break;
      }
      if (v236 <= -2147483650.0) {
        goto LABEL_172;
      }
      if (v236 >= 2147483650.0) {
        goto LABEL_173;
      }
      *id v103 = (int)v236;
      double v237 = v232 * 100.0;
      if ((~COERCE__INT64(v232 * 100.0) & 0x7FF0000000000000) == 0) {
        goto LABEL_174;
      }
      if (v237 <= -2147483650.0) {
        goto LABEL_175;
      }
      if (v237 >= 2147483650.0) {
        goto LABEL_176;
      }
      v103[1] = (int)v237;
      uint64_t v238 = v521;
      sub_236C70690((uint64_t)v103, v521, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      sub_236C6EF0C(v238, v522, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      v239 = (unint64_t *)(*v107
                                + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationChartData);
      swift_beginAccess();
      unint64_t v240 = *v239;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v240 = sub_236A8E844(0, *(void *)(v240 + 16) + 1, 1, v240);
      }
      unint64_t v242 = *(void *)(v240 + 16);
      unint64_t v241 = *(void *)(v240 + 24);
      if (v242 >= v241 >> 1) {
        unint64_t v240 = sub_236A8E844(v241 > 1, v242 + 1, 1, v240);
      }
      *(void *)(v240 + 16) = v242 + 1;
      sub_236C70690(v522, v240+ ((*(unsigned __int8 *)(v517 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v517 + 80))+ *(void *)(v517 + 72) * v242, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      unint64_t v107 = v524;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
        swift_allocObject();
        uint64_t v243 = swift_retain();
        uint64_t v244 = sub_236C08FE8(v243);
        unint64_t v107 = v524;
        swift_release();
        *unint64_t v107 = v244;
        swift_release();
      }
      v231 = (unint64_t *)(*v107
                                + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationChartData);
      swift_beginAccess();
      unint64_t *v231 = v240;
      swift_bridgeObjectRelease();
      sub_236C706F8(v521, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      id v103 = v520;
      uint64_t v230 = (uint64_t)v519;
LABEL_52:
      sub_236C706F8(v230, (uint64_t (*)(void))type metadata accessor for WorkoutChartDataElement);
      v102 += (int64_t)v6;
      if (!--v81) {
        goto LABEL_66;
      }
    }
    __break(1u);
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
LABEL_175:
    __break(1u);
LABEL_176:
    __break(1u);
LABEL_177:
    swift_once();
  }
LABEL_66:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  id v245 = (id)v545;
  id v246 = objc_msgSend((id)v545, sel_unitString);

  uint64_t v247 = sub_236C74E48();
  uint64_t v249 = v248;

  char v250 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v251 = (uint64_t)v478;
  if ((v250 & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v252 = swift_retain();
    uint64_t v253 = sub_236C08FE8(v252);
    swift_release();
    *unint64_t v107 = v253;
    swift_release();
  }
  v254 = (uint64_t *)(*v107
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationChartUnit);
  swift_beginAccess();
  uint64_t *v254 = v247;
  v254[1] = v249;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v255 = v479;
  if ((v544 & 1) == 0)
  {
    uint64_t v256 = v543;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v257 = swift_retain();
      uint64_t v258 = sub_236C08FE8(v257);
      swift_release();
      *unint64_t v107 = v258;
      swift_release();
    }
    uint64_t v259 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentCadence;
    swift_beginAccess();
    *(void *)uint64_t v259 = v256;
    *(unsigned char *)(v259 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v544 & 1) == 0)
  {
    uint64_t v260 = v543;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v261 = swift_retain();
      uint64_t v262 = sub_236C08FE8(v261);
      swift_release();
      *unint64_t v107 = v262;
      swift_release();
    }
    uint64_t v263 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageCadence;
    swift_beginAccess();
    *(void *)uint64_t v263 = v260;
    *(unsigned char *)(v263 + 8) = 0;
  }
  uint64_t v264 = v438;
  PowerMetricsPublisher.protobuf.getter(v438);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v265 = swift_retain();
    uint64_t v266 = sub_236C08FE8(v265);
    swift_release();
    *unint64_t v107 = v266;
    swift_release();
  }
  uint64_t v267 = *v107;
  uint64_t v268 = v264;
  uint64_t v269 = v441;
  sub_236C70690(v268, v441, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v439 + 56))(v269, 0, 1, v440);
  uint64_t v270 = v442;
  sub_236A926F0(v269, v442, &qword_2688A9BD8);
  uint64_t v271 = v267
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__powerMetricsPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v270, v271, &qword_2688A9BD8);
  swift_endAccess();
  swift_release();
  v272 = v443;
  WaterTemperatureMetricsPublisher.protobuf.getter(v443);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v273 = swift_retain();
    uint64_t v274 = sub_236C08FE8(v273);
    swift_release();
    *unint64_t v107 = v274;
    swift_release();
  }
  uint64_t v275 = *v107;
  uint64_t v276 = (uint64_t)v272;
  uint64_t v277 = v446;
  sub_236C70690(v276, v446, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WaterTemperatureMetricsPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v444 + 56))(v277, 0, 1, v445);
  uint64_t v278 = v447;
  sub_236A926F0(v277, v447, &qword_2688A9BB8);
  uint64_t v279 = v275
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__waterTemperatureMetricsPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v278, v279, &qword_2688A9BB8);
  swift_endAccess();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v280 = v543;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v281 = swift_retain();
    uint64_t v282 = sub_236C08FE8(v281);
    swift_release();
    *unint64_t v107 = v282;
    swift_release();
  }
  v283 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__flightsClimbed);
  swift_beginAccess();
  void *v283 = v280;
  v284 = v448;
  WorkoutStatePublisher.protobuf.getter(v448);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v285 = swift_retain();
    uint64_t v286 = sub_236C08FE8(v285);
    swift_release();
    *unint64_t v107 = v286;
    swift_release();
  }
  uint64_t v287 = *v107;
  uint64_t v288 = (uint64_t)v284;
  uint64_t v289 = v451;
  sub_236C70690(v288, v451, type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v449 + 56))(v289, 0, 1, v450);
  uint64_t v290 = v452;
  sub_236A926F0(v289, v452, &qword_2688A9BC0);
  uint64_t v291 = v287
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__workoutStatePublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v290, v291, &qword_2688A9BC0);
  swift_endAccess();
  swift_release();
  uint64_t v292 = v453;
  IntervalsMetricsPublisher.protobuf.getter(v453);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v293 = swift_retain();
    uint64_t v294 = sub_236C08FE8(v293);
    swift_release();
    *unint64_t v107 = v294;
    swift_release();
  }
  uint64_t v295 = *v107;
  uint64_t v296 = v292;
  uint64_t v297 = v456;
  sub_236C70690(v296, v456, type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v454 + 56))(v297, 0, 1, v455);
  uint64_t v298 = v457;
  sub_236A926F0(v297, v457, &qword_2688A9C00);
  uint64_t v299 = v295
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__intervalsMetricsPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v298, v299, &qword_2688A9C00);
  swift_endAccess();
  swift_release();
  uint64_t v300 = v458;
  MultisportMetricsPublisher.protobuf.getter(v458);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v301 = swift_retain();
    uint64_t v302 = sub_236C08FE8(v301);
    swift_release();
    *unint64_t v107 = v302;
    swift_release();
  }
  uint64_t v303 = *v107;
  uint64_t v304 = v300;
  uint64_t v305 = v461;
  sub_236C70690(v304, v461, type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v459 + 56))(v305, 0, 1, v460);
  uint64_t v306 = v462;
  sub_236A926F0(v305, v462, &qword_2688A9BE8);
  uint64_t v307 = v303
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__multisportMetricsPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v306, v307, &qword_2688A9BE8);
  swift_endAccess();
  swift_release();
  v308 = v463;
  RaceInformationPublisher.protobuf.getter(v463);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v309 = swift_retain();
    uint64_t v310 = sub_236C08FE8(v309);
    swift_release();
    *unint64_t v107 = v310;
    swift_release();
  }
  uint64_t v311 = *v107;
  uint64_t v312 = (uint64_t)v308;
  uint64_t v313 = v466;
  sub_236C70690(v312, v466, type metadata accessor for Apple_Workout_Core_RaceInformationPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v464 + 56))(v313, 0, 1, v465);
  uint64_t v314 = v467;
  sub_236A926F0(v313, v467, &qword_2688A9BD0);
  uint64_t v315 = v311
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__raceInformationPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v314, v315, &qword_2688A9BD0);
  swift_endAccess();
  swift_release();
  uint64_t v316 = v468;
  RacePositionStatePublisher.protobuf.getter(v468);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v317 = swift_retain();
    uint64_t v318 = sub_236C08FE8(v317);
    swift_release();
    *unint64_t v107 = v318;
    swift_release();
  }
  uint64_t v319 = *v107;
  uint64_t v320 = v316;
  uint64_t v321 = v471;
  sub_236C70690(v320, v471, type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v469 + 56))(v321, 0, 1, v470);
  uint64_t v322 = v472;
  sub_236A926F0(v321, v472, &qword_2688A9BC8);
  uint64_t v323 = v319
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__racePositionStatePublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v322, v323, &qword_2688A9BC8);
  swift_endAccess();
  swift_release();
  v324 = v473;
  LocationPositionPublisher.protobuf.getter(v473);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v325 = swift_retain();
    uint64_t v326 = sub_236C08FE8(v325);
    swift_release();
    *unint64_t v107 = v326;
    swift_release();
  }
  uint64_t v327 = *v107;
  uint64_t v328 = (uint64_t)v324;
  uint64_t v329 = v476;
  sub_236C70690(v328, v476, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LocationPositionPublisher);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v474 + 56))(v329, 0, 1, v475);
  uint64_t v330 = v477;
  sub_236A926F0(v329, v477, &qword_2688A9BF0);
  uint64_t v331 = v327
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__locationPositionPublisher;
  swift_beginAccess();
  swift_retain();
  sub_236A92754(v330, v331, &qword_2688A9BF0);
  swift_endAccess();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v542 & 1) == 0)
  {
    uint64_t v332 = v541;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v333 = swift_retain();
      uint64_t v334 = sub_236C08FE8(v333);
      swift_release();
      *unint64_t v107 = v334;
      swift_release();
    }
    uint64_t v335 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__distanceGoalFinishTime;
    swift_beginAccess();
    *(void *)uint64_t v335 = v332;
    *(unsigned char *)(v335 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  int v336 = v541;
  if (v541 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_179;
  }
  if (v541 > 0x7FFFFFFF)
  {
LABEL_179:
    __break(1u);
LABEL_180:
    __break(1u);
    goto LABEL_181;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v337 = swift_retain();
    uint64_t v338 = sub_236C08FE8(v337);
    swift_release();
    *unint64_t v107 = v338;
    swift_release();
  }
  v339 = (_DWORD *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentIndex);
  swift_beginAccess();
  _DWORD *v339 = v336;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v340 = v540;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v341 = swift_retain();
    uint64_t v342 = sub_236C08FE8(v341);
    swift_release();
    *unint64_t v107 = v342;
    swift_release();
  }
  v343 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentDuration);
  swift_beginAccess();
  void *v343 = v340;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v344 = v539;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v345 = swift_retain();
    uint64_t v346 = sub_236C08FE8(v345);
    swift_release();
    *unint64_t v107 = v346;
    swift_release();
  }
  v347 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentDistance);
  swift_beginAccess();
  void *v347 = v344;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v348 = v538;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v349 = swift_retain();
    uint64_t v350 = sub_236C08FE8(v349);
    swift_release();
    *unint64_t v107 = v350;
    swift_release();
  }
  v351 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentPace);
  swift_beginAccess();
  void *v351 = v348;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v352 = v537;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v353 = swift_retain();
    uint64_t v354 = sub_236C08FE8(v353);
    swift_release();
    *unint64_t v107 = v354;
    swift_release();
  }
  v355 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentActiveEnergy);
  swift_beginAccess();
  void *v355 = v352;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v356 = v536;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v357 = swift_retain();
    uint64_t v358 = sub_236C08FE8(v357);
    swift_release();
    *unint64_t v107 = v358;
    swift_release();
  }
  v359 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentTotalEnergy);
  swift_beginAccess();
  void *v359 = v356;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v360 = v535;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v361 = swift_retain();
    uint64_t v362 = sub_236C08FE8(v361);
    swift_release();
    *unint64_t v107 = v362;
    swift_release();
  }
  v363 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentAveragePower);
  swift_beginAccess();
  void *v363 = v360;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  int v364 = v534;
  if (v534 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_180;
  }
  if (v534 > 0x7FFFFFFF)
  {
LABEL_181:
    __break(1u);
    goto LABEL_182;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v365 = swift_retain();
    uint64_t v366 = sub_236C08FE8(v365);
    swift_release();
    *unint64_t v107 = v366;
    swift_release();
  }
  v367 = (_DWORD *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitIndex);
  swift_beginAccess();
  _DWORD *v367 = v364;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v368 = v437;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v255 + 48))(v251, 1, v437) == 1)
  {
    sub_236A73174(v251, &qword_26AF2FE50);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v255 + 32))(v436, v251, v368);
    sub_236C73E48();
    uint64_t v370 = v369;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v371 = swift_retain();
      uint64_t v372 = sub_236C08FE8(v371);
      swift_release();
      *unint64_t v107 = v372;
      swift_release();
    }
    uint64_t v373 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitStartDate;
    swift_beginAccess();
    *(void *)uint64_t v373 = v370;
    *(unsigned char *)(v373 + 8) = 0;
    (*(void (**)(char *, uint64_t))(v255 + 8))(v436, v368);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v374 = v533;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v375 = swift_retain();
    uint64_t v376 = sub_236C08FE8(v375);
    swift_release();
    *unint64_t v107 = v376;
    swift_release();
  }
  v377 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitDuration);
  swift_beginAccess();
  void *v377 = v374;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v378 = v532;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v379 = swift_retain();
    uint64_t v380 = sub_236C08FE8(v379);
    swift_release();
    *unint64_t v107 = v380;
    swift_release();
  }
  v381 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitDistance);
  swift_beginAccess();
  void *v381 = v378;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v382 = v531;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v383 = swift_retain();
    uint64_t v384 = sub_236C08FE8(v383);
    swift_release();
    *unint64_t v107 = v384;
    swift_release();
  }
  v385 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitPace);
  swift_beginAccess();
  void *v385 = v382;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v386 = v530;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v387 = swift_retain();
    uint64_t v388 = sub_236C08FE8(v387);
    swift_release();
    *unint64_t v107 = v388;
    swift_release();
  }
  v389 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitAveragePower);
  swift_beginAccess();
  void *v389 = v386;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v390 = v529;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v391 = swift_retain();
    uint64_t v392 = sub_236C08FE8(v391);
    swift_release();
    *unint64_t v107 = v392;
    swift_release();
  }
  v393 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerRemainingTime);
  swift_beginAccess();
  void *v393 = v390;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v394 = v528;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v395 = swift_retain();
    uint64_t v396 = sub_236C08FE8(v395);
    swift_release();
    *unint64_t v107 = v396;
    swift_release();
  }
  v397 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerRemainingTimeWithOffset);
  swift_beginAccess();
  void *v397 = v394;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  uint64_t v398 = v527;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
    swift_allocObject();
    uint64_t v399 = swift_retain();
    uint64_t v400 = sub_236C08FE8(v399);
    swift_release();
    *unint64_t v107 = v400;
    swift_release();
  }
  v401 = (void *)(*v107
                  + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerDuration);
  swift_beginAccess();
  void *v401 = v398;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v402 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v403 = swift_retain();
      uint64_t v404 = sub_236C08FE8(v403);
      swift_release();
      *unint64_t v107 = v404;
      swift_release();
    }
    uint64_t v405 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentStrideLength;
    swift_beginAccess();
    *(void *)uint64_t v405 = v402;
    *(unsigned char *)(v405 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v406 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v407 = swift_retain();
      uint64_t v408 = sub_236C08FE8(v407);
      swift_release();
      *unint64_t v107 = v408;
      swift_release();
    }
    uint64_t v409 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageStrideLength;
    swift_beginAccess();
    *(void *)uint64_t v409 = v406;
    *(unsigned char *)(v409 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v410 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v411 = swift_retain();
      uint64_t v412 = sub_236C08FE8(v411);
      swift_release();
      *unint64_t v107 = v412;
      swift_release();
    }
    uint64_t v413 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentVerticalOscillation;
    swift_beginAccess();
    *(void *)uint64_t v413 = v410;
    *(unsigned char *)(v413 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v414 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v415 = swift_retain();
      uint64_t v416 = sub_236C08FE8(v415);
      swift_release();
      *unint64_t v107 = v416;
      swift_release();
    }
    uint64_t v417 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageVerticalOscillation;
    swift_beginAccess();
    *(void *)uint64_t v417 = v414;
    *(unsigned char *)(v417 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v418 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v419 = swift_retain();
      uint64_t v420 = sub_236C08FE8(v419);
      swift_release();
      *unint64_t v107 = v420;
      swift_release();
    }
    uint64_t v421 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentGroundContactTime;
    swift_beginAccess();
    *(void *)uint64_t v421 = v418;
    *(unsigned char *)(v421 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v422 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v423 = swift_retain();
      uint64_t v424 = sub_236C08FE8(v423);
      swift_release();
      *unint64_t v107 = v424;
      swift_release();
    }
    uint64_t v425 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageGroundContactTime;
    swift_beginAccess();
    *(void *)uint64_t v425 = v422;
    *(unsigned char *)(v425 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  if ((v526 & 1) == 0)
  {
    unint64_t v426 = v525;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
      swift_allocObject();
      uint64_t v427 = swift_retain();
      uint64_t v428 = sub_236C08FE8(v427);
      swift_release();
      *unint64_t v107 = v428;
      swift_release();
    }
    uint64_t v429 = *v107
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__descent;
    swift_beginAccess();
    *(void *)uint64_t v429 = v426;
    *(unsigned char *)(v429 + 8) = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  if ((v526 & 1) == 0)
  {
    int v431 = v525;
    if (!HIDWORD(v525))
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        type metadata accessor for Apple_Workout_Core_MetricsPublisher._StorageClass(0);
        swift_allocObject();
        uint64_t v432 = swift_retain();
        uint64_t v433 = sub_236C08FE8(v432);
        swift_release();
        *unint64_t v107 = v433;
        swift_release();
      }
      uint64_t v434 = *v107
           + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__downhillRunCount;
      uint64_t result = swift_beginAccess();
      *(_DWORD *)uint64_t v434 = v431;
      *(unsigned char *)(v434 + 4) = 0;
      return result;
    }
LABEL_182:
    uint64_t result = sub_236C75678();
    __break(1u);
  }
  return result;
}

uint64_t sub_236C61448@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C614C8()
{
  return sub_236C74C38();
}

uint64_t sub_236C6153C@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C615BC()
{
  return sub_236C74C38();
}

uint64_t sub_236C61630(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v466 = (uint64_t)&v392 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v465 = (char *)&v392 - v6;
  uint64_t v463 = type metadata accessor for Apple_Workout_Core_LocationPositionPublisher();
  uint64_t v462 = *(void *)(v463 - 8);
  MEMORY[0x270FA5388](v463);
  uint64_t v420 = (uint64_t *)((char *)&v392 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v419 = (uint64_t)&v392 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v461 = (uint64_t)&v392 - v11;
  uint64_t v460 = type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher(0);
  uint64_t v459 = *(void *)(v460 - 8);
  MEMORY[0x270FA5388](v460);
  unint64_t v418 = (uint64_t *)((char *)&v392 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BC8);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v417 = (uint64_t)&v392 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v458 = (uint64_t)&v392 - v16;
  uint64_t v457 = type metadata accessor for Apple_Workout_Core_RaceInformationPublisher(0);
  uint64_t v456 = *(void *)(v457 - 8);
  MEMORY[0x270FA5388](v457);
  uint64_t v416 = (uint64_t *)((char *)&v392 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BD0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v415 = (uint64_t)&v392 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v455 = (uint64_t)&v392 - v21;
  uint64_t v22 = type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher(0);
  uint64_t v453 = *(void *)(v22 - 8);
  uint64_t v454 = v22;
  MEMORY[0x270FA5388](v22);
  uint64_t v414 = (uint64_t)&v392 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BE8);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v413 = (uint64_t)&v392 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v452 = (uint64_t)&v392 - v27;
  uint64_t v28 = type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher(0);
  uint64_t v450 = *(void *)(v28 - 8);
  uint64_t v451 = v28;
  MEMORY[0x270FA5388](v28);
  uint64_t v412 = (_OWORD *)((char *)&v392 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C00);
  MEMORY[0x270FA5388](v30 - 8);
  uint64_t v449 = (uint64_t)&v392 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher(0);
  uint64_t v447 = *(void *)(v32 - 8);
  uint64_t v448 = v32;
  MEMORY[0x270FA5388](v32);
  uint64_t v411 = (uint64_t)&v392 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BC0);
  uint64_t v35 = MEMORY[0x270FA5388](v34 - 8);
  uint64_t v410 = (uint64_t)&v392 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v446 = (uint64_t)&v392 - v37;
  uint64_t v38 = type metadata accessor for Apple_Workout_Core_WaterTemperatureMetricsPublisher();
  uint64_t v444 = *(void *)(v38 - 8);
  uint64_t v445 = v38;
  MEMORY[0x270FA5388](v38);
  uint64_t v409 = (char *)&v392 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BB8);
  uint64_t v41 = MEMORY[0x270FA5388](v40 - 8);
  uint64_t v408 = (uint64_t)&v392 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v41);
  uint64_t v443 = (uint64_t)&v392 - v43;
  uint64_t v44 = type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher();
  uint64_t v441 = *(void *)(v44 - 8);
  uint64_t v442 = (int *)v44;
  MEMORY[0x270FA5388](v44);
  uint64_t v407 = (char *)&v392 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BD8);
  uint64_t v47 = MEMORY[0x270FA5388](v46 - 8);
  uint64_t v406 = (uint64_t)&v392 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v47);
  uint64_t v440 = (uint64_t)&v392 - v49;
  uint64_t v480 = sub_236C73F58();
  uint64_t v470 = *(void *)(v480 - 8);
  MEMORY[0x270FA5388](v480);
  v478 = (char *)&v392 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v477 = type metadata accessor for WorkoutChartDataElement();
  uint64_t v476 = *(void *)(v477 - 8);
  MEMORY[0x270FA5388](v477);
  uint64_t v483 = (uint64_t)&v392 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v475 = type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement();
  uint64_t v421 = *(void *)(v475 - 8);
  MEMORY[0x270FA5388](v475);
  uint64_t v479 = (uint64_t)&v392 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v474 = type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher();
  uint64_t v473 = *(void *)(v474 - 8);
  MEMORY[0x270FA5388](v474);
  uint64_t v405 = (unsigned int *)((char *)&v392 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BF8);
  uint64_t v55 = MEMORY[0x270FA5388](v54 - 8);
  uint64_t v404 = (uint64_t)&v392 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v55);
  uint64_t v469 = (uint64_t)&v392 - v57;
  uint64_t v58 = type metadata accessor for Apple_Workout_Core_GoalPublisher(0);
  uint64_t v438 = *(void *)(v58 - 8);
  uint64_t v439 = v58;
  MEMORY[0x270FA5388](v58);
  uint64_t v403 = (uint64_t *)((char *)&v392 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C10);
  uint64_t v61 = MEMORY[0x270FA5388](v60 - 8);
  uint64_t v402 = (uint64_t)&v392 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v61);
  uint64_t v437 = (uint64_t)&v392 - v63;
  uint64_t v64 = type metadata accessor for Apple_Workout_Core_PlatterPublisher(0);
  uint64_t v435 = *(void *)(v64 - 8);
  uint64_t v436 = v64;
  MEMORY[0x270FA5388](v64);
  v401 = (uint64_t *)((char *)&v392 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9BE0);
  uint64_t v67 = MEMORY[0x270FA5388](v66 - 8);
  uint64_t v400 = (uint64_t)&v392 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v67);
  uint64_t v434 = (uint64_t)&v392 - v69;
  uint64_t v70 = type metadata accessor for Apple_Workout_Core_EnergyMetricsPublisher();
  uint64_t v432 = *(void *)(v70 - 8);
  uint64_t v433 = v70;
  MEMORY[0x270FA5388](v70);
  uint64_t v399 = (uint64_t *)((char *)&v392 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C18);
  uint64_t v73 = MEMORY[0x270FA5388](v72 - 8);
  uint64_t v398 = (uint64_t)&v392 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v73);
  uint64_t v431 = (uint64_t)&v392 - v75;
  uint64_t v76 = type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher();
  uint64_t v429 = *(void *)(v76 - 8);
  v430 = (int *)v76;
  MEMORY[0x270FA5388](v76);
  v397 = (uint64_t *)((char *)&v392 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C08);
  uint64_t v79 = MEMORY[0x270FA5388](v78 - 8);
  uint64_t v396 = (uint64_t)&v392 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v79);
  uint64_t v428 = (uint64_t)&v392 - v81;
  uint64_t v82 = type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher(0);
  uint64_t v426 = *(void *)(v82 - 8);
  uint64_t v427 = v82;
  MEMORY[0x270FA5388](v82);
  uint64_t v395 = (char *)&v392 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C28);
  uint64_t v85 = MEMORY[0x270FA5388](v84 - 8);
  uint64_t v394 = (uint64_t)&v392 - ((v86 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v85);
  uint64_t v425 = (uint64_t)&v392 - v87;
  uint64_t v88 = type metadata accessor for Apple_Workout_Core_ElapsedTimeMetricsPublisher();
  uint64_t v423 = *(void *)(v88 - 8);
  uint64_t v424 = v88;
  MEMORY[0x270FA5388](v88);
  v393 = (uint64_t *)((char *)&v392 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9C20);
  uint64_t v91 = MEMORY[0x270FA5388](v90 - 8);
  uint64_t v392 = (uint64_t)&v392 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v91);
  uint64_t v422 = (uint64_t)&v392 - v93;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A81B8);
  uint64_t v95 = MEMORY[0x270FA5388](v94 - 8);
  uint64_t v97 = (char *)&v392 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v95);
  uint64_t v99 = (char *)&v392 - v98;
  uint64_t v100 = sub_236C73FE8();
  uint64_t v101 = *(void *)(v100 - 8);
  uint64_t v102 = MEMORY[0x270FA5388](v100);
  uint64_t v468 = (char *)&v392 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = MEMORY[0x270FA5388](v102);
  uint64_t v106 = (char *)&v392 - v105;
  MEMORY[0x270FA5388](v104);
  uint64_t v471 = (char *)&v392 - v107;
  uint64_t v108 = *(int *)(type metadata accessor for Apple_Workout_Core_MetricsPublisher(0) + 20);
  uint64_t v472 = v1;
  uint64_t v482 = v108;
  uint64_t v109 = *(void *)(v1 + v108);
  swift_beginAccess();
  char v110 = *(unsigned char *)(v109 + 16);
  swift_beginAccess();
  uint64_t v481 = a1;
  *(unsigned char *)(a1 + 16) = v110;
  uint64_t v111 = v109
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__workoutIdentifierBytes;
  swift_beginAccess();
  unint64_t v112 = *(void *)(v111 + 8);
  if (v112 >> 60 == 15)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_236C73F68();
    swift_bridgeObjectRelease();
    uint64_t v113 = v101;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v97, 1, v100) == 1)
    {
      sub_236A73174((uint64_t)v97, &qword_2688A81B8);
      if (qword_26AF2E5B0 != -1) {
        swift_once();
      }
      uint64_t v114 = sub_236C74B98();
      __swift_project_value_buffer(v114, (uint64_t)qword_26AF2E598);
      uint64_t v115 = sub_236C74B78();
      os_log_type_t v116 = sub_236C752B8();
      BOOL v117 = os_log_type_enabled(v115, v116);
      uint64_t v118 = v481;
      if (!v117) {
        goto LABEL_13;
      }
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v119 = 0;
      uint64_t v120 = "Unable to decode provided UUID for workoutIdentifierDeprecated, generating new UUID";
LABEL_12:
      _os_log_impl(&dword_236A4F000, v115, v116, v120, v119, 2u);
      MEMORY[0x237E0C720](v119, -1, -1);
LABEL_13:

      uint64_t v124 = v471;
      sub_236C73FD8();
      goto LABEL_17;
    }
    uint64_t v124 = v471;
    (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v471, v97, v100);
  }
  else
  {
    uint64_t v121 = *(void *)v111;
    sub_236A5B9DC(*(void *)v111, *(void *)(v111 + 8));
    sub_236C6E7F0(v121, v112, (uint64_t)v99);
    uint64_t v113 = v101;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v99, 1, v100) == 1)
    {
      sub_236A73174((uint64_t)v99, &qword_2688A81B8);
      if (qword_26AF2E5B0 != -1) {
        swift_once();
      }
      uint64_t v122 = sub_236C74B98();
      __swift_project_value_buffer(v122, (uint64_t)qword_26AF2E598);
      uint64_t v115 = sub_236C74B78();
      os_log_type_t v116 = sub_236C752B8();
      BOOL v123 = os_log_type_enabled(v115, v116);
      uint64_t v118 = v481;
      if (!v123) {
        goto LABEL_13;
      }
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v119 = 0;
      uint64_t v120 = "Unable to decode provided UUID for workoutIdentifierBytes, generating new UUID";
      goto LABEL_12;
    }
    uint64_t v124 = v471;
    (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v471, v99, v100);
  }
  uint64_t v118 = v481;
LABEL_17:
  uint64_t v125 = v113;
  unsigned __int8 v126 = *(void (**)(char *, char *, uint64_t))(v113 + 16);
  v126(v106, v124, v100);
  swift_getKeyPath();
  swift_getKeyPath();
  v126(v468, v106, v100);
  swift_retain();
  sub_236C74C38();
  uint64_t v127 = *(uint64_t (**)(char *, char *))(v125 + 8);
  uint64_t v468 = (char *)v100;
  uint64_t v467 = v125 + 8;
  uint64_t v464 = v127;
  v127(v106, (char *)v100);
  uint64_t v128 = v472;
  uint64_t v129 = *(void *)(v472 + v482);
  uint64_t v130 = v482;
  swift_beginAccess();
  char v131 = *(unsigned char *)(v129 + 48);
  uint64_t v523 = *(void *)(v129 + 40);
  BOOL v524 = v131;
  sub_236C6ED6C(v525);
  char v132 = v525[0];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v523) = v132;
  swift_retain();
  sub_236C74C38();
  uint64_t v133 = *(void *)(v128 + v130);
  swift_beginAccess();
  char v134 = *(unsigned char *)(v133 + 49);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v523) = v134;
  swift_retain();
  sub_236C74C38();
  uint64_t v135 = *(void *)(v128 + v130)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elapsedTimeMetricsPublisher;
  swift_beginAccess();
  uint64_t v136 = v422;
  sub_236A731D0(v135, v422, &qword_2688A9C20);
  uint64_t v137 = v424;
  uint64_t v138 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v423 + 48);
  LODWORD(v135) = v138(v136, 1, v424);
  sub_236A73174(v136, &qword_2688A9C20);
  uint64_t v139 = v426;
  uint64_t v140 = v118;
  uint64_t v141 = v482;
  if (v135 != 1)
  {
    uint64_t v142 = *(void *)(v128 + v482)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elapsedTimeMetricsPublisher;
    swift_beginAccess();
    uint64_t v143 = v142;
    uint64_t v144 = v392;
    sub_236A731D0(v143, v392, &qword_2688A9C20);
    if (v138(v144, 1, v137) == 1)
    {
      uint64_t v145 = v393;
      uint64_t *v393 = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v144, &qword_2688A9C20);
    }
    else
    {
      uint64_t v145 = v393;
      sub_236C70690(v144, (uint64_t)v393, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_ElapsedTimeMetricsPublisher);
    }
    uint64_t v146 = *v145;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v523 = v146;
    swift_retain();
    sub_236C74C38();
    sub_236C706F8((uint64_t)v145, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_ElapsedTimeMetricsPublisher);
    uint64_t v128 = v472;
  }
  uint64_t v147 = *(void *)(v128 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__activitySummaryMetricsPublisher;
  swift_beginAccess();
  uint64_t v148 = v425;
  sub_236A731D0(v147, v425, &qword_2688A9C28);
  uint64_t v149 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v139 + 48);
  uint64_t v150 = v427;
  LODWORD(v147) = v149(v148, 1, v427);
  sub_236A73174(v148, &qword_2688A9C28);
  if (v147 != 1)
  {
    uint64_t v151 = *(void *)(v128 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__activitySummaryMetricsPublisher;
    swift_beginAccess();
    uint64_t v152 = v394;
    sub_236A731D0(v151, v394, &qword_2688A9C28);
    if (v149(v152, 1, v150) == 1)
    {
      uint64_t v153 = v395;
      *uint64_t v395 = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v154 = &v153[*(int *)(v150 + 24)];
      uint64_t v155 = type metadata accessor for Apple_Workout_Core_HKActivitySummary(0);
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v155 - 8) + 56))(v154, 1, 1, v155);
      sub_236A73174(v152, &qword_2688A9C28);
    }
    else
    {
      uint64_t v153 = v395;
      sub_236C70690(v152, (uint64_t)v395, type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher);
    }
    sub_236C3E65C();
    sub_236C706F8((uint64_t)v153, type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher);
    uint64_t v128 = v472;
  }
  uint64_t v156 = *(void *)(v128 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__heartRateMetricsPublisher;
  swift_beginAccess();
  uint64_t v157 = v428;
  sub_236A731D0(v156, v428, &qword_2688A9C08);
  uint64_t v158 = v430;
  uint64_t v159 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v429 + 48);
  LODWORD(v156) = v159(v157, 1, v430);
  sub_236A73174(v157, &qword_2688A9C08);
  if (v156 != 1)
  {
    uint64_t v160 = *(void *)(v128 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__heartRateMetricsPublisher;
    swift_beginAccess();
    uint64_t v161 = v396;
    sub_236A731D0(v160, v396, &qword_2688A9C08);
    if (v159(v161, 1, v158) == 1)
    {
      uint64_t v162 = v397;
      void *v397 = 0;
      *((_WORD *)v162 + 4) = 1;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v163 = (char *)v162 + v158[7];
      *(void *)uint64_t v163 = 0;
      v163[8] = 1;
      uint64_t v164 = (char *)v162 + v158[8];
      *(void *)uint64_t v164 = 0;
      v164[8] = 1;
      uint64_t v165 = (char *)v162 + v158[9];
      *(void *)uint64_t v165 = 0;
      v165[8] = 1;
      uint64_t v166 = (char *)v162 + v158[10];
      uint64_t v167 = type metadata accessor for Apple_Workout_Core_LiveZones(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v167 - 8) + 56))(v166, 1, 1, v167);
      sub_236A73174(v161, &qword_2688A9C08);
    }
    else
    {
      uint64_t v162 = v397;
      sub_236C70690(v161, (uint64_t)v397, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher);
    }
    sub_236BD23E8();
    sub_236C706F8((uint64_t)v162, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher);
    uint64_t v128 = v472;
  }
  uint64_t v168 = *(void *)(v128 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__energyMetricsPublisher;
  swift_beginAccess();
  uint64_t v169 = v431;
  sub_236A731D0(v168, v431, &qword_2688A9C18);
  uint64_t v170 = v433;
  v171 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v432 + 48);
  LODWORD(v168) = v171(v169, 1, v433);
  uint64_t v172 = v169;
  uint64_t v173 = v472;
  sub_236A73174(v172, &qword_2688A9C18);
  if (v168 != 1)
  {
    uint64_t v174 = *(void *)(v173 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__energyMetricsPublisher;
    swift_beginAccess();
    uint64_t v175 = v174;
    uint64_t v176 = v398;
    sub_236A731D0(v175, v398, &qword_2688A9C18);
    if (v171(v176, 1, v170) == 1)
    {
      v177 = v399;
      *uint64_t v399 = 0;
      v177[1] = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v176, &qword_2688A9C18);
    }
    else
    {
      v177 = v399;
      sub_236C70690(v176, (uint64_t)v399, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_EnergyMetricsPublisher);
    }
    uint64_t v178 = *v177;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v523 = v178;
    swift_retain();
    sub_236C74C38();
    uint64_t v179 = v177[1];
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v523 = v179;
    swift_retain();
    sub_236C74C38();
    sub_236C706F8((uint64_t)v177, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_EnergyMetricsPublisher);
  }
  uint64_t v180 = *(void *)(v173 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__platterPublisher;
  swift_beginAccess();
  uint64_t v181 = v434;
  sub_236A731D0(v180, v434, &qword_2688A9BE0);
  uint64_t v182 = v436;
  uint64_t v183 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v435 + 48);
  LODWORD(v180) = v183(v181, 1, v436);
  uint64_t v184 = v181;
  uint64_t v185 = v472;
  sub_236A73174(v184, &qword_2688A9BE0);
  if (v180 != 1)
  {
    uint64_t v186 = *(void *)(v185 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__platterPublisher;
    swift_beginAccess();
    uint64_t v187 = v400;
    sub_236A731D0(v186, v400, &qword_2688A9BE0);
    if (v183(v187, 1, v182) == 1)
    {
      uint64_t v188 = v401;
      void *v401 = MEMORY[0x263F8EE78];
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v187, &qword_2688A9BE0);
    }
    else
    {
      uint64_t v188 = v401;
      sub_236C70690(v187, (uint64_t)v401, type metadata accessor for Apple_Workout_Core_PlatterPublisher);
    }
    sub_236B3AE0C(*(void *)(v140 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_platterPublisher));
    sub_236C706F8((uint64_t)v188, type metadata accessor for Apple_Workout_Core_PlatterPublisher);
  }
  uint64_t v189 = *(void *)(v185 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__goalPublisher;
  swift_beginAccess();
  uint64_t v190 = v185;
  uint64_t v191 = v437;
  sub_236A731D0(v189, v437, &qword_2688A9C10);
  uint64_t v192 = v439;
  v193 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v438 + 48);
  LODWORD(v189) = v193(v191, 1, v439);
  uint64_t v194 = v191;
  uint64_t v195 = v190;
  sub_236A73174(v194, &qword_2688A9C10);
  if (v189 != 1)
  {
    uint64_t v196 = *(void *)(v190 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__goalPublisher;
    swift_beginAccess();
    uint64_t v197 = v402;
    sub_236A731D0(v196, v402, &qword_2688A9C10);
    if (v193(v197, 1, v192) == 1)
    {
      uint64_t v198 = v403;
      *uint64_t v403 = 0;
      *((unsigned char *)v198 + 8) = 1;
      *((_DWORD *)v198 + 3) = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v197, &qword_2688A9C10);
    }
    else
    {
      uint64_t v198 = v403;
      sub_236C70690(v197, (uint64_t)v403, type metadata accessor for Apple_Workout_Core_GoalPublisher);
    }
    char v199 = *((unsigned char *)v198 + 8);
    uint64_t v523 = *v198;
    BOOL v524 = v199;
    uint64_t v200 = sub_236AAEC4C();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v523 = v200;
    swift_retain();
    sub_236C74C38();
    int v201 = *((_DWORD *)v198 + 3);
    swift_getKeyPath();
    swift_getKeyPath();
    LODWORD(v523) = v201;
    swift_retain();
    sub_236C74C38();
    sub_236C706F8((uint64_t)v198, type metadata accessor for Apple_Workout_Core_GoalPublisher);
  }
  uint64_t v202 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__distance);
  swift_beginAccess();
  uint64_t v203 = *v202;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v203;
  swift_retain();
  sub_236C74C38();
  v204 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__secondsAheadOfPacer);
  swift_beginAccess();
  uint64_t v205 = *v204;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v205;
  swift_retain();
  sub_236C74C38();
  uint64_t v206 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentPace);
  swift_beginAccess();
  uint64_t v207 = *v206;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v207;
  swift_retain();
  sub_236C74C38();
  uint64_t v208 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averagePace);
  swift_beginAccess();
  uint64_t v209 = *v208;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v209;
  swift_retain();
  sub_236C74C38();
  uint64_t v210 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__rollingPace);
  swift_beginAccess();
  uint64_t v211 = *v210;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v211;
  swift_retain();
  sub_236C74C38();
  uint64_t v212 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__requiredPace);
  swift_beginAccess();
  uint64_t v213 = *v212;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v213;
  swift_retain();
  sub_236C74C38();
  uint64_t v214 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__fastestPace);
  swift_beginAccess();
  uint64_t v215 = *v214;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v215;
  swift_retain();
  sub_236C74C38();
  uint64_t v216 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__lapsMetricsPublisher;
  swift_beginAccess();
  uint64_t v217 = v469;
  sub_236A731D0(v216, v469, &qword_2688A9BF8);
  uint64_t v218 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v473 + 48);
  uint64_t v219 = v474;
  LODWORD(v216) = v218(v217, 1, v474);
  sub_236A73174(v217, &qword_2688A9BF8);
  if (v216 != 1)
  {
    uint64_t v220 = *(void *)(v195 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__lapsMetricsPublisher;
    swift_beginAccess();
    uint64_t v221 = v220;
    uint64_t v222 = v404;
    sub_236A731D0(v221, v404, &qword_2688A9BF8);
    if (v218(v222, 1, v219) == 1)
    {
      uint64_t v223 = v405;
      *uint64_t v405 = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v222, &qword_2688A9BF8);
    }
    else
    {
      uint64_t v223 = v405;
      sub_236C70690(v222, (uint64_t)v405, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher);
    }
    uint64_t v224 = *v223;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v523 = v224;
    swift_retain();
    sub_236C74C38();
    sub_236C706F8((uint64_t)v223, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LapsMetricsPublisher);
  }
  uint64_t v225 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationGain;
  swift_beginAccess();
  uint64_t v226 = *(void *)v225;
  char v227 = *(unsigned char *)(v225 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v226;
  BOOL v524 = (v227 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v228 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentElevation;
  swift_beginAccess();
  uint64_t v229 = *(void *)v228;
  char v230 = *(unsigned char *)(v228 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = v229;
  BOOL v524 = (v230 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v523 = MEMORY[0x263F8EE78];
  swift_retain();
  sub_236C74C38();
  v231 = (uint64_t *)(*(void *)(v195 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__elevationChartData);
  swift_beginAccess();
  uint64_t v469 = *v231;
  uint64_t v232 = *(void *)(v469 + 16);
  if (v232)
  {
    uint64_t v233 = v469 + ((*(unsigned __int8 *)(v421 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v421 + 80));
    uint64_t v474 = *(void *)(v421 + 72);
    uint64_t v473 = v470 + 32;
    swift_bridgeObjectRetain();
    uint64_t v234 = v479;
    do
    {
      sub_236C6EF0C(v233, v234, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      uint64_t v235 = v475;
      if (*(unsigned char *)(v234 + *(int *)(v475 + 28) + 8))
      {
        double v236 = v478;
        sub_236C73E38();
        double v237 = (double)*(int *)(v234 + 4) / 100.0;
      }
      else
      {
        double v236 = v478;
        sub_236C73E38();
        uint64_t v238 = v234 + *(int *)(v235 + 32);
        if (*(unsigned char *)(v238 + 8)) {
          double v237 = 0.0;
        }
        else {
          double v237 = *(double *)v238;
        }
      }
      uint64_t v239 = v483;
      (*(void (**)(uint64_t, char *, uint64_t))v473)(v483, v236, v480);
      *(double *)(v239 + *(int *)(v477 + 20)) = v237;
      swift_getKeyPath();
      swift_getKeyPath();
      unint64_t v240 = (void (*)(uint64_t *, void))sub_236C74C18();
      unint64_t v242 = v241;
      unint64_t v243 = *v241;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unint64_t v242 = v243;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v243 = sub_236A8E194(0, *(void *)(v243 + 16) + 1, 1, v243);
        *unint64_t v242 = v243;
      }
      unint64_t v246 = *(void *)(v243 + 16);
      unint64_t v245 = *(void *)(v243 + 24);
      if (v246 >= v245 >> 1)
      {
        unint64_t v243 = sub_236A8E194(v245 > 1, v246 + 1, 1, v243);
        *unint64_t v242 = v243;
      }
      *(void *)(v243 + 16) = v246 + 1;
      sub_236C70690(v483, v243+ ((*(unsigned __int8 *)(v476 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v476 + 80))+ *(void *)(v476 + 72) * v246, (uint64_t (*)(void))type metadata accessor for WorkoutChartDataElement);
      v240(&v523, 0);
      swift_release();
      swift_release();
      uint64_t v234 = v479;
      sub_236C706F8(v479, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WorkoutChartDataElement);
      v233 += v474;
      --v232;
      uint64_t v140 = v481;
      uint64_t v141 = v482;
    }
    while (v232);
    swift_bridgeObjectRelease();
    uint64_t v195 = v472;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v247 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();
  id v248 = objc_msgSend(self, sel_unitFromString_, v247);

  swift_getKeyPath();
  swift_getKeyPath();
  id v522 = v248;
  swift_retain();
  sub_236C74C38();
  uint64_t v249 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentCadence;
  swift_beginAccess();
  uint64_t v250 = *(void *)v249;
  char v251 = *(unsigned char *)(v249 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v520 = v250;
  BOOL v521 = (v251 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v252 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageCadence;
  swift_beginAccess();
  uint64_t v253 = *(void *)v252;
  char v254 = *(unsigned char *)(v252 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v518 = v253;
  BOOL v519 = (v254 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v255 = *(void *)(v195 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__powerMetricsPublisher;
  swift_beginAccess();
  uint64_t v256 = v440;
  sub_236A731D0(v255, v440, &qword_2688A9BD8);
  uint64_t v257 = v195;
  uint64_t v258 = v442;
  uint64_t v259 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v441 + 48);
  LODWORD(v255) = v259(v256, 1, v442);
  sub_236A73174(v256, &qword_2688A9BD8);
  if (v255 != 1)
  {
    uint64_t v260 = *(void *)(v195 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__powerMetricsPublisher;
    swift_beginAccess();
    uint64_t v261 = v406;
    sub_236A731D0(v260, v406, &qword_2688A9BD8);
    if (v259(v261, 1, v258) == 1)
    {
      uint64_t v262 = v407;
      *uint64_t v407 = 0;
      uint64_t v263 = MEMORY[0x263F8EE78];
      *((void *)v262 + 1) = sub_236B968C8(MEMORY[0x263F8EE78]);
      *((void *)v262 + 2) = v263;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v264 = &v262[v258[8]];
      *(void *)uint64_t v264 = 0;
      v264[8] = 1;
      uint64_t v265 = &v262[v258[9]];
      *(void *)uint64_t v265 = 0;
      v265[8] = 1;
      uint64_t v266 = &v262[v258[10]];
      *(void *)uint64_t v266 = 0;
      v266[8] = 1;
      uint64_t v267 = &v262[v258[11]];
      uint64_t v268 = type metadata accessor for Apple_Workout_Core_LiveZones(0);
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v268 - 8) + 56))(v267, 1, 1, v268);
      sub_236A73174(v261, &qword_2688A9BD8);
    }
    else
    {
      uint64_t v262 = v407;
      sub_236C70690(v261, (uint64_t)v407, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher);
    }
    sub_236AB1920(*(void *)(v140 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_powerMetricsPublisher));
    sub_236C706F8((uint64_t)v262, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher);
    uint64_t v257 = v195;
  }
  uint64_t v269 = *(void *)(v257 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__waterTemperatureMetricsPublisher;
  swift_beginAccess();
  uint64_t v270 = v443;
  sub_236A731D0(v269, v443, &qword_2688A9BB8);
  uint64_t v271 = v445;
  v272 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v444 + 48);
  LODWORD(v269) = v272(v270, 1, v445);
  sub_236A73174(v270, &qword_2688A9BB8);
  if (v269 != 1)
  {
    uint64_t v273 = v257;
    uint64_t v274 = *(void *)(v257 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__waterTemperatureMetricsPublisher;
    swift_beginAccess();
    uint64_t v275 = v408;
    sub_236A731D0(v274, v408, &qword_2688A9BB8);
    if (v272(v275, 1, v271) == 1)
    {
      uint64_t v276 = v409;
      *uint64_t v409 = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v277 = &v276[*(int *)(v271 + 24)];
      *(void *)uint64_t v277 = 0;
      v277[8] = 1;
      uint64_t v278 = &v276[*(int *)(v271 + 28)];
      *(void *)uint64_t v278 = 0;
      v278[8] = 1;
      sub_236A73174(v275, &qword_2688A9BB8);
    }
    else
    {
      uint64_t v276 = v409;
      sub_236C70690(v275, (uint64_t)v409, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WaterTemperatureMetricsPublisher);
    }
    sub_236B1BEC8();
    sub_236C706F8((uint64_t)v276, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_WaterTemperatureMetricsPublisher);
    uint64_t v257 = v273;
  }
  uint64_t v279 = (uint64_t *)(*(void *)(v257 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__flightsClimbed);
  swift_beginAccess();
  uint64_t v280 = *v279;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v517 = v280;
  swift_retain();
  sub_236C74C38();
  uint64_t v281 = *(void *)(v257 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__workoutStatePublisher;
  swift_beginAccess();
  uint64_t v282 = v446;
  sub_236A731D0(v281, v446, &qword_2688A9BC0);
  uint64_t v283 = v448;
  v284 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v447 + 48);
  LODWORD(v281) = v284(v282, 1, v448);
  sub_236A73174(v282, &qword_2688A9BC0);
  if (v281 != 1)
  {
    uint64_t v285 = v257;
    uint64_t v286 = *(void *)(v257 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__workoutStatePublisher;
    swift_beginAccess();
    uint64_t v287 = v410;
    sub_236A731D0(v286, v410, &qword_2688A9BC0);
    if (v284(v287, 1, v283) == 1)
    {
      uint64_t v288 = v411;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v289 = *(int *)(v283 + 20);
      if (qword_2688A7A00 != -1) {
        swift_once();
      }
      *(void *)(v288 + v289) = qword_2688ABCB0;
      swift_retain();
      sub_236A73174(v287, &qword_2688A9BC0);
    }
    else
    {
      uint64_t v288 = v411;
      sub_236C70690(v287, v411, type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
    }
    sub_236B2C168(*(void *)(v140 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_workoutStatePublisher));
    sub_236C706F8(v288, type metadata accessor for Apple_Workout_Core_WorkoutStatePublisher);
    uint64_t v257 = v285;
  }
  uint64_t v290 = *(void *)(v257 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__intervalsMetricsPublisher;
  swift_beginAccess();
  uint64_t v291 = v449;
  sub_236A731D0(v290, v449, &qword_2688A9C00);
  LODWORD(v290) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v450 + 48))(v291, 1, v451);
  sub_236A73174(v291, &qword_2688A9C00);
  if (v290 != 1)
  {
    uint64_t v292 = v412;
    Apple_Workout_Core_MetricsPublisher.intervalsMetricsPublisher.getter(v412);
    sub_236BE6D04();
    sub_236C706F8((uint64_t)v292, type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher);
  }
  uint64_t v293 = *(void *)(v257 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__multisportMetricsPublisher;
  swift_beginAccess();
  uint64_t v294 = v452;
  sub_236A731D0(v293, v452, &qword_2688A9BE8);
  uint64_t v295 = v257;
  uint64_t v296 = v454;
  uint64_t v297 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v453 + 48);
  LODWORD(v293) = v297(v294, 1, v454);
  sub_236A73174(v294, &qword_2688A9BE8);
  if (v293 != 1)
  {
    uint64_t v298 = v257;
    uint64_t v299 = *(void *)(v257 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__multisportMetricsPublisher;
    swift_beginAccess();
    uint64_t v300 = v413;
    sub_236A731D0(v299, v413, &qword_2688A9BE8);
    if (v297(v300, 1, v296) == 1)
    {
      uint64_t v301 = v414;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v302 = *(int *)(v296 + 20);
      if (qword_2688A79D0 != -1) {
        swift_once();
      }
      *(void *)(v301 + v302) = qword_2688AB828;
      swift_retain();
      sub_236A73174(v300, &qword_2688A9BE8);
    }
    else
    {
      uint64_t v301 = v414;
      sub_236C70690(v300, v414, type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher);
    }
    sub_236C38C24();
    sub_236C706F8(v301, type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher);
    uint64_t v295 = v298;
  }
  uint64_t v303 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__raceInformationPublisher;
  swift_beginAccess();
  uint64_t v304 = v455;
  sub_236A731D0(v303, v455, &qword_2688A9BD0);
  uint64_t v305 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v456 + 48);
  uint64_t v306 = v457;
  LODWORD(v303) = v305(v304, 1, v457);
  sub_236A73174(v304, &qword_2688A9BD0);
  if (v303 != 1)
  {
    uint64_t v307 = v295;
    uint64_t v308 = *(void *)(v295 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__raceInformationPublisher;
    swift_beginAccess();
    uint64_t v309 = v415;
    sub_236A731D0(v308, v415, &qword_2688A9BD0);
    if (v305(v309, 1, v306) == 1)
    {
      uint64_t v310 = v416;
      *uint64_t v416 = MEMORY[0x263F8EE78];
      v310[1] = 0;
      *((unsigned char *)v310 + 16) = 1;
      v310[3] = 0;
      v310[4] = 0;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      sub_236A73174(v309, &qword_2688A9BD0);
    }
    else
    {
      uint64_t v310 = v416;
      sub_236C70690(v309, (uint64_t)v416, type metadata accessor for Apple_Workout_Core_RaceInformationPublisher);
    }
    sub_236A8D9AC(*(void *)(v140 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_raceInformationPublisher));
    sub_236C706F8((uint64_t)v310, type metadata accessor for Apple_Workout_Core_RaceInformationPublisher);
    uint64_t v295 = v307;
  }
  uint64_t v311 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__racePositionStatePublisher;
  swift_beginAccess();
  uint64_t v312 = v458;
  sub_236A731D0(v311, v458, &qword_2688A9BC8);
  uint64_t v313 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v459 + 48);
  uint64_t v314 = v460;
  LODWORD(v311) = v313(v312, 1, v460);
  sub_236A73174(v312, &qword_2688A9BC8);
  if (v311 != 1)
  {
    uint64_t v315 = v295;
    uint64_t v316 = *(void *)(v295 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__racePositionStatePublisher;
    swift_beginAccess();
    uint64_t v317 = v417;
    sub_236A731D0(v316, v417, &qword_2688A9BC8);
    if (v313(v317, 1, v314) == 1)
    {
      uint64_t v318 = v418;
      *unint64_t v418 = 0;
      *((unsigned char *)v318 + 8) = 1;
      v318[6] = 0;
      *((_OWORD *)v318 + 1) = 0u;
      *((_OWORD *)v318 + 2) = 0u;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v319 = (char *)v318 + *(int *)(v314 + 44);
      uint64_t v320 = type metadata accessor for Apple_Workout_Core_RacePosition(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v320 - 8) + 56))(v319, 1, 1, v320);
      sub_236A73174(v317, &qword_2688A9BC8);
    }
    else
    {
      uint64_t v318 = v418;
      sub_236C70690(v317, (uint64_t)v418, type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher);
    }
    sub_236A71F88();
    sub_236C706F8((uint64_t)v318, type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher);
    uint64_t v295 = v315;
  }
  uint64_t v321 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__locationPositionPublisher;
  swift_beginAccess();
  uint64_t v322 = v461;
  sub_236A731D0(v321, v461, &qword_2688A9BF0);
  uint64_t v323 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v462 + 48);
  uint64_t v324 = v463;
  LODWORD(v321) = v323(v322, 1, v463);
  sub_236A73174(v322, &qword_2688A9BF0);
  if (v321 != 1)
  {
    uint64_t v325 = v295;
    uint64_t v326 = *(void *)(v295 + v141)
         + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__locationPositionPublisher;
    swift_beginAccess();
    uint64_t v327 = v419;
    sub_236A731D0(v326, v419, &qword_2688A9BF0);
    if (v323(v327, 1, v324) == 1)
    {
      uint64_t v328 = v420;
      uint64_t v329 = MEMORY[0x263F8EE78];
      *uint64_t v420 = MEMORY[0x263F8EE78];
      v328[1] = v329;
      _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
      uint64_t v330 = (char *)v328 + *(int *)(v324 + 28);
      uint64_t v331 = type metadata accessor for Apple_Workout_Core_RacePosition(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v331 - 8) + 56))(v330, 1, 1, v331);
      sub_236A73174(v327, &qword_2688A9BF0);
    }
    else
    {
      uint64_t v328 = v420;
      sub_236C70690(v327, (uint64_t)v420, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LocationPositionPublisher);
    }
    sub_236AA47A0(*(void *)(v140 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_locationPositionPublisher));
    sub_236C706F8((uint64_t)v328, (uint64_t (*)(void))type metadata accessor for Apple_Workout_Core_LocationPositionPublisher);
    uint64_t v295 = v325;
  }
  uint64_t v332 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__distanceGoalFinishTime;
  swift_beginAccess();
  uint64_t v333 = *(void *)v332;
  char v334 = *(unsigned char *)(v332 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v515 = v333;
  BOOL v516 = (v334 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v335 = (int *)(*(void *)(v295 + v141)
               + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentIndex);
  swift_beginAccess();
  uint64_t v336 = *v335;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v514 = v336;
  swift_retain();
  sub_236C74C38();
  uint64_t v337 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentDuration);
  swift_beginAccess();
  uint64_t v338 = *v337;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v513 = v338;
  swift_retain();
  sub_236C74C38();
  v339 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentDistance);
  swift_beginAccess();
  uint64_t v340 = *v339;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v512 = v340;
  swift_retain();
  sub_236C74C38();
  uint64_t v341 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentPace);
  swift_beginAccess();
  uint64_t v342 = *v341;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v511 = v342;
  swift_retain();
  sub_236C74C38();
  v343 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentActiveEnergy);
  swift_beginAccess();
  uint64_t v344 = *v343;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v510 = v344;
  swift_retain();
  sub_236C74C38();
  uint64_t v345 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentTotalEnergy);
  swift_beginAccess();
  uint64_t v346 = *v345;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v509 = v346;
  swift_retain();
  sub_236C74C38();
  v347 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__segmentAveragePower);
  swift_beginAccess();
  uint64_t v348 = *v347;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v508 = v348;
  swift_retain();
  sub_236C74C38();
  uint64_t v349 = (int *)(*(void *)(v295 + v141)
               + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitIndex);
  swift_beginAccess();
  uint64_t v350 = *v349;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v507 = v350;
  swift_retain();
  sub_236C74C38();
  uint64_t v351 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitStartDate;
  swift_beginAccess();
  if (*(unsigned char *)(v351 + 8))
  {
    uint64_t v352 = 1;
    uint64_t v353 = (uint64_t)v465;
  }
  else
  {
    uint64_t v353 = (uint64_t)v465;
    sub_236C73E38();
    uint64_t v352 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v470 + 56))(v353, v352, 1, v480);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236A731D0(v353, v466, &qword_26AF2FE50);
  swift_retain();
  sub_236C74C38();
  sub_236A73174(v353, &qword_26AF2FE50);
  uint64_t v354 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitDuration);
  swift_beginAccess();
  uint64_t v355 = *v354;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v506 = v355;
  swift_retain();
  sub_236C74C38();
  uint64_t v356 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitDistance);
  swift_beginAccess();
  uint64_t v357 = *v356;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v505 = v357;
  swift_retain();
  sub_236C74C38();
  uint64_t v358 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitPace);
  swift_beginAccess();
  uint64_t v359 = *v358;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v504 = v359;
  swift_retain();
  sub_236C74C38();
  uint64_t v360 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__splitAveragePower);
  swift_beginAccess();
  uint64_t v361 = *v360;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v503 = v361;
  swift_retain();
  sub_236C74C38();
  uint64_t v362 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerRemainingTime);
  swift_beginAccess();
  uint64_t v363 = *v362;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v502 = v363;
  swift_retain();
  sub_236C74C38();
  int v364 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerRemainingTimeWithOffset);
  swift_beginAccess();
  uint64_t v365 = *v364;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v501 = v365;
  swift_retain();
  sub_236C74C38();
  uint64_t v366 = (uint64_t *)(*(void *)(v295 + v141)
                   + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__timerDuration);
  swift_beginAccess();
  uint64_t v367 = *v366;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v500 = v367;
  swift_retain();
  sub_236C74C38();
  uint64_t v368 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentStrideLength;
  swift_beginAccess();
  uint64_t v369 = *(void *)v368;
  char v370 = *(unsigned char *)(v368 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v498 = v369;
  BOOL v499 = (v370 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v371 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageStrideLength;
  swift_beginAccess();
  uint64_t v372 = *(void *)v371;
  char v373 = *(unsigned char *)(v371 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v496 = v372;
  BOOL v497 = (v373 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v374 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentVerticalOscillation;
  swift_beginAccess();
  uint64_t v375 = *(void *)v374;
  char v376 = *(unsigned char *)(v374 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v494 = v375;
  BOOL v495 = (v376 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v377 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageVerticalOscillation;
  swift_beginAccess();
  uint64_t v378 = *(void *)v377;
  char v379 = *(unsigned char *)(v377 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v492 = v378;
  BOOL v493 = (v379 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v380 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__currentGroundContactTime;
  swift_beginAccess();
  uint64_t v381 = *(void *)v380;
  char v382 = *(unsigned char *)(v380 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v490 = v381;
  BOOL v491 = (v382 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v383 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__averageGroundContactTime;
  swift_beginAccess();
  uint64_t v384 = *(void *)v383;
  char v385 = *(unsigned char *)(v383 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v488 = v384;
  BOOL v489 = (v385 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  uint64_t v386 = *(void *)(v295 + v141)
       + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__descent;
  swift_beginAccess();
  uint64_t v387 = *(void *)v386;
  char v388 = *(unsigned char *)(v386 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v486 = v387;
  BOOL v487 = (v388 & 1) != 0;
  swift_retain();
  sub_236C74C38();
  v389 = (unsigned int *)(*(void *)(v295 + v141)
                        + OBJC_IVAR____TtCV11WorkoutCore35Apple_Workout_Core_MetricsPublisherP33_508C7676BE35C88A6A3FC097C9B7FAB413_StorageClass__downhillRunCount);
  swift_beginAccess();
  if (v389[1])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v484 = 0;
    char v485 = 1;
  }
  else
  {
    uint64_t v390 = *v389;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v484 = v390;
    char v485 = 0;
  }
  swift_retain();
  sub_236C74C38();
  return v464(v471, v468);
}

uint64_t MetricsPublisher.isFaked.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t MetricsPublisher.isFaked.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t (*MetricsPublisher.isFaked.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MetricsPublisher.workoutIdentifier.getter()
{
  return sub_236B24C7C();
}

uint64_t sub_236C658E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();

  return swift_release();
}

uint64_t sub_236C6595C(uint64_t a1)
{
  uint64_t v2 = sub_236C73FE8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  sub_236C74C38();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t MetricsPublisher.workoutIdentifier.setter(uint64_t a1)
{
  uint64_t v2 = sub_236C73FE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  swift_retain();
  sub_236C74C38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*MetricsPublisher.workoutIdentifier.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$workoutIdentifier.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier, &qword_26AF30550);
}

uint64_t MetricsPublisher.$workoutIdentifier.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688ABDE0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier, &qword_26AF30550);
}

uint64_t (*MetricsPublisher.$workoutIdentifier.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30550);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.workoutConfigurationType.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();

  return swift_release();
}

uint64_t sub_236C65E38@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C65EB8()
{
  return sub_236C74C38();
}

uint64_t MetricsPublisher.workoutConfigurationType.setter()
{
  return sub_236C74C38();
}

void (*MetricsPublisher.workoutConfigurationType.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$workoutConfigurationType.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType, &qword_26AF30598);
}

uint64_t MetricsPublisher.$workoutConfigurationType.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688ABDE8, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType, &qword_26AF30598);
}

uint64_t (*MetricsPublisher.$workoutConfigurationType.modify(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDE8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30598);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.multisportWorkoutInAutoMode.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236C661DC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C6625C()
{
  return sub_236C74C38();
}

uint64_t MetricsPublisher.multisportWorkoutInAutoMode.setter()
{
  return sub_236C74C38();
}

void (*MetricsPublisher.multisportWorkoutInAutoMode.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$multisportWorkoutInAutoMode.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode, &qword_26AF30670);
}

uint64_t MetricsPublisher.$multisportWorkoutInAutoMode.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A87C0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode, &qword_26AF30670);
}

uint64_t (*MetricsPublisher.$multisportWorkoutInAutoMode.modify(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A87C0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30670);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.elapsedTimeMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.videoTimeProvider.getter()
{
  return sub_236C6659C();
}

uint64_t MetricsPublisher.videoTimeProvider.setter(uint64_t a1, uint64_t a2)
{
  return sub_236C665F4(a1, a2, &OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_videoTimeProvider);
}

uint64_t (*MetricsPublisher.videoTimeProvider.modify())()
{
  return j__swift_endAccess;
}

uint64_t MetricsPublisher.gymKitTimeProvider.getter()
{
  return sub_236C6659C();
}

uint64_t sub_236C6659C()
{
  return swift_unknownObjectRetain();
}

uint64_t MetricsPublisher.gymKitTimeProvider.setter(uint64_t a1, uint64_t a2)
{
  return sub_236C665F4(a1, a2, &OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_gymKitTimeProvider);
}

uint64_t sub_236C665F4(uint64_t a1, uint64_t a2, void *a3)
{
  size_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *size_t v6 = a1;
  v6[1] = a2;
  return swift_unknownObjectRelease();
}

uint64_t (*MetricsPublisher.gymKitTimeProvider.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MetricsPublisher.activitySummaryMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.heartRateMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.energyMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.trackRunningMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.platterPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.goalPublisher.getter()
{
  return swift_retain();
}

double sub_236C6670C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C66720()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$distance.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance, &qword_26AF30680);
}

uint64_t MetricsPublisher.$distance.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$distance.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.secondsAheadOfPacer.getter()
{
  return sub_236A70844();
}

double sub_236C66888@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C6689C()
{
  return sub_236A70958();
}

void (*MetricsPublisher.secondsAheadOfPacer.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$secondsAheadOfPacer.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer, &qword_26AF30680);
}

uint64_t MetricsPublisher.$secondsAheadOfPacer.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$secondsAheadOfPacer.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.currentPace.getter()
{
  return sub_236A70844();
}

double sub_236C66A90@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C66AA4()
{
  return sub_236A70958();
}

void (*MetricsPublisher.currentPace.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$currentPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$currentPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double sub_236C66C84@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C66C98()
{
  return sub_236A70958();
}

void (*MetricsPublisher.averagePace.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$averagePace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$averagePace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$averagePace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.rollingPace.getter()
{
  return sub_236A70844();
}

double sub_236C66E8C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C66EA0()
{
  return sub_236A70958();
}

void (*MetricsPublisher.rollingPace.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$rollingPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$rollingPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$rollingPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.requiredPace.getter()
{
  return sub_236A70844();
}

double sub_236C67094@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C670A8()
{
  return sub_236A70958();
}

void (*MetricsPublisher.requiredPace.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$requiredPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$requiredPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$requiredPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.fastestPace.getter()
{
  return sub_236A70844();
}

double sub_236C6729C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C672B0()
{
  return sub_236A70958();
}

void (*MetricsPublisher.fastestPace.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$fastestPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$fastestPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$fastestPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.lapsMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t sub_236C674A0@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C674B4()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.elevationGain.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$elevationGain.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain, &qword_26AF30690);
}

uint64_t MetricsPublisher.$elevationGain.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$elevationGain.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.currentElevation.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C676A8@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C676BC()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.currentElevation.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentElevation.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation, &qword_26AF30690);
}

uint64_t MetricsPublisher.$currentElevation.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$currentElevation.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.elevationChartData.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  return v1;
}

void (*MetricsPublisher.elevationChartData.modify(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$elevationChartData.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData, &qword_26AF30630);
}

uint64_t MetricsPublisher.$elevationChartData.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A8900, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData, &qword_26AF30630);
}

uint64_t (*MetricsPublisher.$elevationChartData.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8900);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30630);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.elevationChartUnit.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236C67B50@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C67BD0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_236C74C38();
}

uint64_t MetricsPublisher.elevationChartUnit.setter()
{
  return sub_236C74C38();
}

void (*MetricsPublisher.elevationChartUnit.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$elevationChartUnit.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit, &qword_26AF30708);
}

uint64_t MetricsPublisher.$elevationChartUnit.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688ABDF0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit, &qword_26AF30708);
}

uint64_t (*MetricsPublisher.$elevationChartUnit.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDF0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30708);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.currentCadence.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C67E98@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C67EAC()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.currentCadence.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentCadence.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence, &qword_26AF30690);
}

uint64_t MetricsPublisher.$currentCadence.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$currentCadence.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.averageCadence.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C680A0@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C680B4()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.averageCadence.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$averageCadence.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence, &qword_26AF30690);
}

uint64_t MetricsPublisher.$averageCadence.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$averageCadence.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.powerMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.waterTemperatureMetricsPublisher.getter()
{
  return swift_retain();
}

double MetricsPublisher.flightsClimbed.getter()
{
  return sub_236A70844();
}

double sub_236C682C8@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C682DC()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$flightsClimbed.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed, &qword_26AF30680);
}

uint64_t MetricsPublisher.$flightsClimbed.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$flightsClimbed.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.workoutStatePublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.intervalsMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.multisportMetricsPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.raceInformationPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.racePositionStatePublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.locationPositionPublisher.getter()
{
  return swift_retain();
}

uint64_t MetricsPublisher.distanceGoalFinishTime.getter()
{
  return sub_236AAF300();
}

void (*MetricsPublisher.distanceGoalFinishTime.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$distanceGoalFinishTime.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime, &qword_26AF30690);
}

uint64_t MetricsPublisher.$distanceGoalFinishTime.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$distanceGoalFinishTime.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.segmentIndex.getter()
{
  return sub_236A74328();
}

uint64_t sub_236C68684@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236C68704()
{
  return sub_236C74C38();
}

uint64_t MetricsPublisher.segmentIndex.setter()
{
  return sub_236AA307C();
}

void (*MetricsPublisher.segmentIndex.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$segmentIndex.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex, &qword_26AF306A0);
}

uint64_t MetricsPublisher.$segmentIndex.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A7D90, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex, &qword_26AF306A0);
}

uint64_t (*MetricsPublisher.$segmentIndex.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A7D90);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306A0);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentDuration.getter()
{
  return sub_236A70844();
}

double sub_236C6896C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C68984()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$segmentDuration.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentDuration.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentDuration.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentDistance.getter()
{
  return sub_236A70844();
}

double sub_236C68AF0@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C68B04()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$segmentDistance.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentDistance.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentDistance.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentPace.getter()
{
  return sub_236A70844();
}

double sub_236C68C6C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C68C80()
{
  return sub_236A70958();
}

void (*MetricsPublisher.segmentPace.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$segmentPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentActiveEnergy.getter()
{
  return sub_236A70844();
}

double sub_236C68E74@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C68E88()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$segmentActiveEnergy.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentActiveEnergy.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentActiveEnergy.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentTotalEnergy.getter()
{
  return sub_236A70844();
}

double sub_236C68FF0@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69004()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$segmentTotalEnergy.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentTotalEnergy.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentTotalEnergy.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.segmentAveragePower.getter()
{
  return sub_236A70844();
}

double sub_236C6916C@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69180()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.segmentAveragePower.setter()
{
  return sub_236A709E8();
}

void (*MetricsPublisher.segmentAveragePower.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$segmentAveragePower.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower, &qword_26AF30680);
}

uint64_t MetricsPublisher.$segmentAveragePower.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$segmentAveragePower.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.splitIndex.getter()
{
  return sub_236A74328();
}

void (*MetricsPublisher.splitIndex.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$splitIndex.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex, &qword_26AF306A0);
}

uint64_t MetricsPublisher.$splitIndex.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A7D90, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex, &qword_26AF306A0);
}

uint64_t (*MetricsPublisher.$splitIndex.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A7D90);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306A0);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.splitStartDate.getter()
{
  return sub_236B24C7C();
}

void (*MetricsPublisher.splitStartDate.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$splitStartDate.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate, &qword_26AF30540);
}

uint64_t MetricsPublisher.$splitStartDate.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A9868, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate, &qword_26AF30540);
}

uint64_t (*MetricsPublisher.$splitStartDate.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9868);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30540);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.splitDuration.getter()
{
  return sub_236A70844();
}

double sub_236C69748@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69760()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$splitDuration.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration, &qword_26AF30680);
}

uint64_t MetricsPublisher.$splitDuration.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$splitDuration.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.splitDistance.getter()
{
  return sub_236A70844();
}

double sub_236C69914@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69928()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$splitDistance.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance, &qword_26AF30680);
}

uint64_t MetricsPublisher.$splitDistance.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$splitDistance.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.splitPace.getter()
{
  return sub_236A70844();
}

double sub_236C69A90@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69AA4()
{
  return sub_236A70958();
}

void (*MetricsPublisher.splitPace.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$splitPace.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace, &qword_26AF30680);
}

uint64_t MetricsPublisher.$splitPace.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$splitPace.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.splitAveragePower.getter()
{
  return sub_236A70844();
}

double sub_236C69C98@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69CAC()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.splitAveragePower.setter()
{
  return sub_236A709E8();
}

void (*MetricsPublisher.splitAveragePower.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$splitAveragePower.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower, &qword_26AF30680);
}

uint64_t MetricsPublisher.$splitAveragePower.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$splitAveragePower.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double sub_236C69EA0@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C69EB4()
{
  return sub_236A70958();
}

uint64_t MetricsPublisher.$timerRemainingTime.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime, &qword_26AF30680);
}

uint64_t MetricsPublisher.$timerRemainingTime.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$timerRemainingTime.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double sub_236C6A008@<D0>(double *a1@<X8>)
{
  return sub_236A708C4(a1);
}

uint64_t sub_236C6A01C()
{
  return sub_236A70958();
}

void (*MetricsPublisher.timerRemainingTimeWithOffset.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$timerRemainingTimeWithOffset.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset, &qword_26AF30680);
}

uint64_t MetricsPublisher.$timerRemainingTimeWithOffset.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$timerRemainingTimeWithOffset.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

double MetricsPublisher.timerDuration.getter()
{
  return sub_236A70844();
}

void (*MetricsPublisher.timerDuration.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$timerDuration.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration, &qword_26AF30680);
}

uint64_t MetricsPublisher.$timerDuration.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration, &qword_26AF30680);
}

uint64_t (*MetricsPublisher.$timerDuration.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.currentStrideLength.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6A3F0@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6A404()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.currentStrideLength.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentStrideLength.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength, &qword_26AF30690);
}

uint64_t MetricsPublisher.$currentStrideLength.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$currentStrideLength.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.averageStrideLength.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6A5F8@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6A60C()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.averageStrideLength.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$averageStrideLength.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength, &qword_26AF30690);
}

uint64_t MetricsPublisher.$averageStrideLength.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$averageStrideLength.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.currentVerticalOscillation.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6A800@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6A814()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.currentVerticalOscillation.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentVerticalOscillation.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation, &qword_26AF30690);
}

uint64_t MetricsPublisher.$currentVerticalOscillation.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$currentVerticalOscillation.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.averageVerticalOscillation.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6AA08@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6AA1C()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.averageVerticalOscillation.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$averageVerticalOscillation.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation, &qword_26AF30690);
}

uint64_t MetricsPublisher.$averageVerticalOscillation.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$averageVerticalOscillation.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.currentGroundContactTime.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6AC10@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6AC24()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.currentGroundContactTime.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$currentGroundContactTime.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime, &qword_26AF30690);
}

uint64_t MetricsPublisher.$currentGroundContactTime.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$currentGroundContactTime.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.averageGroundContactTime.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6AE18@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6AE2C()
{
  return sub_236AAF420();
}

void (*MetricsPublisher.averageGroundContactTime.modify(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236C74C18();
  return sub_236A6FA6C;
}

uint64_t MetricsPublisher.$averageGroundContactTime.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime, &qword_26AF30690);
}

uint64_t MetricsPublisher.$averageGroundContactTime.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$averageGroundContactTime.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t sub_236C6B00C@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6B024()
{
  return sub_236AAF420();
}

uint64_t MetricsPublisher.$descent.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent, &qword_26AF30690);
}

uint64_t MetricsPublisher.$descent.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent, &qword_26AF30690);
}

uint64_t (*MetricsPublisher.$descent.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A88F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.downhillRunCount.getter()
{
  return sub_236AAF300();
}

uint64_t sub_236C6B208@<X0>(uint64_t a1@<X8>)
{
  return sub_236AAF384(a1);
}

uint64_t sub_236C6B220()
{
  return sub_236AAF420();
}

uint64_t MetricsPublisher.$downhillRunCount.getter()
{
  return sub_236A5E1B4((uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount, &qword_26AF30728);
}

uint64_t sub_236C6B25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_236C74C08();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t MetricsPublisher.$downhillRunCount.setter(uint64_t a1)
{
  return sub_236C6B3F4(a1, &qword_2688ABDF8, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount, &qword_26AF30728);
}

uint64_t sub_236C6B3F4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_236C74C08();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*MetricsPublisher.$downhillRunCount.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688ABDF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30728);
  sub_236C74BF8();
  swift_endAccess();
  return sub_236A5DEC0;
}

uint64_t MetricsPublisher.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30718);
  uint64_t v166 = *(void *)(v1 - 8);
  uint64_t v167 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v165 = (char *)&v132 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306D0);
  uint64_t v163 = *(void *)(v3 - 8);
  uint64_t v164 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v162 = (char *)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30728);
  uint64_t v160 = *(void *)(v5 - 8);
  uint64_t v161 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v159 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30540);
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  uint64_t v155 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  uint64_t v8 = MEMORY[0x270FA5388](v154);
  uint64_t v152 = (uint64_t)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v151 = (char *)&v132 - v10;
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306A0);
  uint64_t v150 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  uint64_t v149 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30708);
  uint64_t v147 = *(void *)(v148 - 8);
  MEMORY[0x270FA5388](v148);
  uint64_t v146 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30630);
  uint64_t v144 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  uint64_t v143 = (char *)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  uint64_t v173 = *(void *)(v170 - 8);
  MEMORY[0x270FA5388](v170);
  uint64_t v158 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v175 = v15;
  uint64_t v176 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = (void (*)(uint64_t, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_26AF30738);
  uint64_t v142 = (void (*)(uint64_t, char *, uint64_t))*((void *)v172 - 1);
  MEMORY[0x270FA5388](v172);
  uint64_t v141 = (char *)&v132 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306E0);
  uint64_t v139 = *(void *)(v140 - 8);
  MEMORY[0x270FA5388](v140);
  uint64_t v138 = (char *)&v132 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30640);
  uint64_t v136 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v135 = (char *)&v132 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30670);
  uint64_t v174 = *(void *)(v171 - 8);
  MEMORY[0x270FA5388](v171);
  uint64_t v169 = (char *)&v132 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = (void (*)(uint64_t, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_26AF30598);
  uint64_t v134 = *((void *)v153 - 1);
  MEMORY[0x270FA5388](v153);
  uint64_t v24 = (char *)&v132 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30550);
  uint64_t v25 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  uint64_t v27 = (char *)&v132 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_236C73FE8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v132 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v132 - v33;
  *(unsigned char *)(v0 + 16) = 0;
  uint64_t v35 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier;
  sub_236C73FD8();
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v32, v34, v28);
  sub_236C74BE8();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v34, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v35, v27, v133);
  uint64_t v36 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType;
  LOBYTE(v177) = 0;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, void *))(v134 + 32))(v36, v24, v153);
  uint64_t v37 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode;
  LOBYTE(v177) = 1;
  uint64_t v38 = v169;
  sub_236C74BE8();
  uint64_t v39 = *(void (**)(uint64_t, char *, uint64_t))(v174 + 32);
  v174 += 32;
  uint64_t v153 = v39;
  v39(v37, v38, v171);
  uint64_t v40 = (void *)(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_videoTimeProvider);
  void *v40 = 0;
  v40[1] = 0;
  uint64_t v41 = v0;
  uint64_t v42 = (void *)(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_gymKitTimeProvider);
  void *v42 = 0;
  v42[1] = 0;
  uint64_t v43 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_trackRunningMetricsPublisher;
  type metadata accessor for TrackRunningMetricsPublisher();
  uint64_t v44 = swift_allocObject();
  uint64_t v177 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30110);
  sub_236C74BE8();
  if (qword_26AF301B8 != -1) {
    swift_once();
  }
  uint64_t v177 = qword_26AF301A8;
  type metadata accessor for TrackRunningCoordinator();
  swift_retain();
  sub_236C74BE8();
  *(void *)(v0 + v43) = v44;
  uint64_t v45 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_platterPublisher;
  type metadata accessor for PlatterPublisher();
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v46 + OBJC_IVAR____TtC11WorkoutCore16PlatterPublisher__metricPlatters;
  uint64_t v48 = MEMORY[0x263F8EE78];
  uint64_t v177 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30768);
  uint64_t v49 = v135;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v136 + 32))(v47, v49, v137);
  *(void *)(v41 + v45) = v46;
  uint64_t v50 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_goalPublisher;
  type metadata accessor for GoalPublisher();
  uint64_t v51 = swift_allocObject();
  uint64_t v52 = v51 + OBJC_IVAR____TtC11WorkoutCore13GoalPublisher__goal;
  uint64_t v177 = 0;
  type metadata accessor for _HKWorkoutGoalType(0);
  uint64_t v53 = v138;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v139 + 32))(v52, v53, v140);
  uint64_t v54 = v51 + OBJC_IVAR____TtC11WorkoutCore13GoalPublisher__progress;
  LODWORD(v177) = 0;
  uint64_t v55 = v141;
  sub_236C74BE8();
  (*((void (**)(uint64_t, char *, void *))v142 + 4))(v54, v55, v172);
  *(void *)(v41 + v50) = v51;
  uint64_t v56 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance;
  uint64_t v177 = 0;
  sub_236C74BE8();
  uint64_t v58 = v176 + 32;
  uint64_t v57 = *(void (**)(uint64_t, char *))(v176 + 32);
  uint64_t v59 = v175;
  v57(v56, v18);
  uint64_t v60 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer;
  uint64_t v177 = 0;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v60, v18, v59);
  uint64_t v61 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v61, v18, v59);
  uint64_t v62 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v62, v18, v59);
  uint64_t v63 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v63, v18, v59);
  uint64_t v64 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v64, v18, v59);
  uint64_t v172 = (void (*)(uint64_t, char *, uint64_t))v57;
  uint64_t v176 = v58;
  uint64_t v177 = 0;
  uint64_t v65 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v57)(v65, v18, v59);
  uint64_t v66 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain;
  uint64_t v177 = 0;
  char v178 = 1;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30780);
  uint64_t v68 = v158;
  sub_236C74BE8();
  uint64_t v69 = v173 + 32;
  uint64_t v70 = *(void (**)(uint64_t, char *, uint64_t))(v173 + 32);
  uint64_t v71 = v170;
  v70(v66, v68, v170);
  uint64_t v72 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v70(v72, v68, v71);
  uint64_t v73 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData;
  uint64_t v177 = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30760);
  uint64_t v74 = v143;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v144 + 32))(v73, v74, v145);
  uint64_t v75 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit;
  uint64_t v177 = (uint64_t)objc_msgSend(self, sel_meterUnit);
  sub_236A5A600(0, &qword_26AF307C8);
  uint64_t v76 = v146;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v147 + 32))(v75, v76, v148);
  uint64_t v77 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v70(v77, v68, v71);
  uint64_t v78 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence;
  uint64_t v177 = 0;
  char v178 = 1;
  uint64_t v141 = (char *)v67;
  sub_236C74BE8();
  uint64_t v173 = v69;
  v70(v78, v68, v71);
  uint64_t v142 = v70;
  uint64_t v79 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed;
  uint64_t v177 = 0;
  sub_236C74BE8();
  uint64_t v80 = v175;
  v172(v79, v18, v175);
  uint64_t v81 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v70(v81, v68, v71);
  uint64_t v82 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex;
  uint64_t v177 = 1;
  uint64_t v83 = v149;
  sub_236C74BE8();
  uint64_t v150 = *(void *)(v150 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v150)(v82, v83, v168);
  uint64_t v84 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration;
  uint64_t v177 = 0;
  sub_236C74BE8();
  uint64_t v85 = v172;
  v172(v84, v18, v80);
  uint64_t v86 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v85(v86, v18, v80);
  uint64_t v87 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v85(v87, v18, v80);
  uint64_t v88 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v85(v88, v18, v80);
  uint64_t v89 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v85(v89, v18, v80);
  uint64_t v90 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v85(v90, v18, v80);
  uint64_t v91 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex;
  uint64_t v177 = 1;
  sub_236C74BE8();
  ((void (*)(uint64_t, char *, uint64_t))v150)(v91, v83, v168);
  uint64_t v92 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate;
  uint64_t v93 = sub_236C73F58();
  uint64_t v94 = (uint64_t)v151;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v151, 1, 1, v93);
  sub_236A731D0(v94, v152, &qword_26AF2FE50);
  uint64_t v95 = v155;
  sub_236C74BE8();
  sub_236A73174(v94, &qword_26AF2FE50);
  (*(void (**)(uint64_t, char *, uint64_t))(v156 + 32))(v92, v95, v157);
  uint64_t v96 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration;
  uint64_t v177 = 0;
  sub_236C74BE8();
  uint64_t v97 = v80;
  uint64_t v98 = v80;
  uint64_t v99 = v172;
  v172(v96, v18, v98);
  uint64_t v100 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v100, v18, v97);
  uint64_t v101 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v101, v18, v97);
  uint64_t v102 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v102, v18, v97);
  uint64_t v103 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v103, v18, v97);
  uint64_t v104 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v104, v18, v97);
  uint64_t v105 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v105, v18, v97);
  uint64_t v106 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  uint64_t v107 = v170;
  uint64_t v108 = v142;
  v142(v106, v68, v170);
  uint64_t v109 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v109, v68, v107);
  uint64_t v110 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v110, v68, v107);
  uint64_t v111 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v111, v68, v107);
  uint64_t v112 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v112, v68, v107);
  uint64_t v113 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v113, v68, v107);
  uint64_t v114 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent;
  uint64_t v177 = 0;
  char v178 = 1;
  sub_236C74BE8();
  v108(v114, v68, v107);
  uint64_t v115 = v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount;
  uint64_t v177 = 0;
  char v178 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF307E0);
  os_log_type_t v116 = v159;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v160 + 32))(v115, v116, v161);
  type metadata accessor for ElapsedTimeMetricsPublisher();
  uint64_t v117 = swift_allocObject();
  uint64_t v118 = v117 + OBJC_IVAR____TtC11WorkoutCore27ElapsedTimeMetricsPublisher__elapsedTime;
  uint64_t v177 = 0;
  sub_236C74BE8();
  uint64_t v119 = v175;
  v99(v118, v18, v175);
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_elapsedTimeMetricsPublisher) = v117;
  type metadata accessor for ActivitySummaryMetricsPublisher();
  uint64_t v120 = swift_allocObject();
  uint64_t v121 = v120 + OBJC_IVAR____TtC11WorkoutCore31ActivitySummaryMetricsPublisher__activitySummary;
  uint64_t v177 = (uint64_t)sub_236C3C87C();
  sub_236A5A600(0, (unint64_t *)&qword_26AF307A0);
  uint64_t v122 = v162;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v163 + 32))(v121, v122, v164);
  uint64_t v123 = v120 + OBJC_IVAR____TtC11WorkoutCore31ActivitySummaryMetricsPublisher__isWheelchairUser;
  LOBYTE(v177) = 0;
  uint64_t v124 = v169;
  sub_236C74BE8();
  v153(v123, v124, v171);
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_activitySummaryMetricsPublisher) = v120;
  type metadata accessor for HeartRateMetricsPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_heartRateMetricsPublisher) = HeartRateMetricsPublisher.init()();
  type metadata accessor for EnergyMetricsPublisher();
  uint64_t v125 = swift_allocObject();
  uint64_t v126 = v125 + OBJC_IVAR____TtC11WorkoutCore22EnergyMetricsPublisher__activeEnergy;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v126, v18, v119);
  uint64_t v127 = v125 + OBJC_IVAR____TtC11WorkoutCore22EnergyMetricsPublisher__totalEnergy;
  uint64_t v177 = 0;
  sub_236C74BE8();
  v99(v127, v18, v119);
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_energyMetricsPublisher) = v125;
  type metadata accessor for LapsMetricsPublisher();
  uint64_t v128 = swift_allocObject();
  uint64_t v129 = v128 + OBJC_IVAR____TtC11WorkoutCore20LapsMetricsPublisher__laps;
  uint64_t v177 = 0;
  uint64_t v130 = v165;
  sub_236C74BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v166 + 32))(v129, v130, v167);
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_lapsMetricsPublisher) = v128;
  type metadata accessor for PowerMetricsPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_powerMetricsPublisher) = PowerMetricsPublisher.init()();
  type metadata accessor for WaterTemperatureMetricsPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_waterTemperatureMetricsPublisher) = WaterTemperatureMetricsPublisher.init()();
  type metadata accessor for WorkoutStatePublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_workoutStatePublisher) = WorkoutStatePublisher.init()();
  type metadata accessor for IntervalsMetricsPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_intervalsMetricsPublisher) = IntervalsMetricsPublisher.init()();
  type metadata accessor for MultisportMetricsPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_multisportMetricsPublisher) = MultisportMetricsPublisher.init()();
  type metadata accessor for RaceInformationPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_raceInformationPublisher) = sub_236A8D1E4();
  type metadata accessor for RacePositionStatePublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_racePositionStatePublisher) = RacePositionStatePublisher.init()();
  type metadata accessor for LocationPositionPublisher();
  swift_allocObject();
  *(void *)(v41 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_locationPositionPublisher) = LocationPositionPublisher.init()();
  return v41;
}

void MetricsPublisher.retrieveInfo(from:)(char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8928);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = &a1[OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_type];
  swift_beginAccess();
  char v6 = *v5;
  swift_getKeyPath();
  swift_getKeyPath();
  char v15 = v6;
  swift_retain();
  sub_236C74C38();
  uint64_t v7 = (uint64_t)&a1[OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_route];
  swift_beginAccess();
  sub_236A731D0(v7, (uint64_t)v4, &qword_2688A8928);
  uint64_t v8 = sub_236C74348();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8)) {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  else {
    uint64_t v9 = sub_236C74338();
  }
  sub_236A73174((uint64_t)v4, &qword_2688A8928);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v14 = v9;
  swift_retain();
  sub_236C74C38();
  type metadata accessor for RaceWorkoutConfiguration();
  if (swift_dynamicCastClass())
  {
    uint64_t v10 = a1;
    RaceInformationPublisher.setRaceInfo(from:)();
  }
  else
  {
    type metadata accessor for MultiSportWorkoutConfiguration();
    if (swift_dynamicCastClass())
    {
      id v11 = sub_236B51FEC();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_236C74C28();

      swift_release();
      swift_release();
      char v12 = v14;
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v14) = v12;
      swift_retain();
      sub_236C74C38();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v14) = v12;
      swift_retain();
      sub_236C74C38();
    }
  }
}

uint64_t MetricsPublisher.updatePlaceholderValues(from:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v63 = (uint64_t)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v58 = (uint64_t)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for Apple_Workout_Core_HKActivitySummary(0);
  uint64_t v56 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v61 = (uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher(0);
  MEMORY[0x270FA5388](v60);
  uint64_t v59 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v57 = (uint64_t)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Workout_Core_RaceInformationPublisher(0);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (void *)((char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher(0);
  MEMORY[0x270FA5388](v13 - 8);
  char v15 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for Apple_Workout_Core_GoalPublisher(0);
  MEMORY[0x270FA5388](v19);
  uint64_t v55 = (char *)v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for Apple_Workout_Core_PlatterPublisher(0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (void *)((char *)v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236C74C28();
  swift_release();
  swift_release();
  unint64_t v24 = *(void *)(v66 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v24 >= 3)
  {
    PlatterPublisher.protobuf.getter(v23);
    sub_236B3AE0C(*(void *)(v65 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_platterPublisher));
    sub_236C706F8((uint64_t)v23, type metadata accessor for Apple_Workout_Core_PlatterPublisher);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v64 = a1;
    sub_236C74C28();
    swift_release();
    swift_release();
    uint64_t v26 = v65;
    switch(v68)
    {
      case 1:
        IntervalsMetricsPublisher.protobuf.getter((uint64_t)v18);
        sub_236BE6D04();
        uint64_t v33 = type metadata accessor for Apple_Workout_Core_IntervalsMetricsPublisher;
        uint64_t v34 = (uint64_t)v18;
        goto LABEL_9;
      case 2:
        RaceInformationPublisher.protobuf.getter(v12);
        sub_236A8D9AC(*(void *)(v26 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_raceInformationPublisher));
        sub_236C706F8((uint64_t)v12, type metadata accessor for Apple_Workout_Core_RaceInformationPublisher);
        uint64_t v35 = v57;
        RacePositionStatePublisher.protobuf.getter(v57);
        sub_236A71F88();
        uint64_t v33 = type metadata accessor for Apple_Workout_Core_RacePositionStatePublisher;
        uint64_t v34 = v35;
        goto LABEL_9;
      case 3:
        goto LABEL_10;
      case 4:
        MultisportMetricsPublisher.protobuf.getter((uint64_t)v15);
        sub_236C38C24();
        uint64_t v33 = type metadata accessor for Apple_Workout_Core_MultiSportMetricsPublisher;
        uint64_t v34 = (uint64_t)v15;
        goto LABEL_9;
      default:
        uint64_t v27 = v55;
        *(void *)uint64_t v55 = 0;
        v27[8] = 1;
        *((_DWORD *)v27 + 3) = 0;
        _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_236C74C28();
        swift_release();
        swift_release();
        uint64_t v28 = 0;
        if (v66 <= 3) {
          uint64_t v28 = qword_236C8E800[v66];
        }
        *(void *)uint64_t v27 = v28;
        v27[8] = 1;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_236C74C28();
        swift_release();
        swift_release();
        *((_DWORD *)v27 + 3) = v66;
        uint64_t v29 = v65;
        char v30 = v27[8];
        unint64_t v66 = *(void *)v27;
        char v67 = v30;
        uint64_t v31 = sub_236AAEC4C();
        swift_getKeyPath();
        swift_getKeyPath();
        unint64_t v66 = v31;
        swift_retain();
        sub_236C74C38();
        int v32 = *((_DWORD *)v27 + 3);
        swift_getKeyPath();
        uint64_t v26 = v29;
        swift_getKeyPath();
        LODWORD(v66) = v32;
        swift_retain();
        sub_236C74C38();
        uint64_t v33 = type metadata accessor for Apple_Workout_Core_GoalPublisher;
        uint64_t v34 = (uint64_t)v27;
LABEL_9:
        sub_236C706F8(v34, v33);
LABEL_10:
        swift_getKeyPath();
        swift_getKeyPath();
        sub_236C74C28();
        swift_release();
        swift_release();
        unint64_t v36 = v66;
        uint64_t v37 = *(void *)(v66 + 16);
        if (v37)
        {
          uint64_t v38 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_powerMetricsPublisher;
          uint64_t v57 = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_activitySummaryMetricsPublisher;
          v52[2] = OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher_heartRateMetricsPublisher;
          uint64_t v53 = (char **)(v56 + 56);
          swift_bridgeObjectRetain();
          v52[1] = v36;
          unint64_t v39 = v36 + 40;
          uint64_t v54 = v38;
          uint64_t v40 = v59;
          do
          {
            uint64_t v45 = *(unsigned __int8 *)(v39 - 8);
            v39 += 16;
            switch(v45)
            {
              case 7:
                uint64_t v56 = *(void *)(v64 + v57);
                unsigned char *v40 = 0;
                uint64_t v46 = v60;
                swift_bridgeObjectRetain();
                _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0();
                uint64_t v47 = (uint64_t)&v40[*(int *)(v46 + 24)];
                uint64_t v55 = *v53;
                uint64_t v48 = v62;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v55)(v47, 1, 1, v62);
                swift_getKeyPath();
                swift_getKeyPath();
                sub_236C74C28();
                swift_release();
                uint64_t v26 = v65;
                swift_release();
                uint64_t v49 = (void *)v66;
                uint64_t v50 = v61;
                sub_236C3D3A8(v61);

                sub_236A73174(v47, &qword_2688AB6A8);
                sub_236C70690(v50, v47, type metadata accessor for Apple_Workout_Core_HKActivitySummary);
                uint64_t v51 = v48;
                uint64_t v38 = v54;
                ((void (*)(uint64_t, void, uint64_t, uint64_t))v55)(v47, 0, 1, v51);
                swift_getKeyPath();
                swift_getKeyPath();
                sub_236C74C28();
                swift_release();
                swift_release();
                unsigned char *v40 = v66;
                sub_236C3E65C();
                uint64_t v43 = type metadata accessor for Apple_Workout_Core_ActivitySummaryMetricsPublisher;
                uint64_t v44 = (uint64_t)v40;
                goto LABEL_14;
              case 10:
                swift_bridgeObjectRetain();
                uint64_t v41 = v58;
                HeartRateMetricsPublisher.protobuf.getter(v58);
                sub_236BD23E8();
                uint64_t v42 = type metadata accessor for Apple_Workout_Core_HeartRateMetricsPublisher;
                goto LABEL_13;
              case 12:
              case 13:
                swift_bridgeObjectRetain();
                uint64_t v41 = v63;
                PowerMetricsPublisher.protobuf.getter(v63);
                sub_236AB1920(*(void *)(v26 + v38));
                uint64_t v42 = type metadata accessor for Apple_Workout_Core_PowerMetricsPublisher;
LABEL_13:
                uint64_t v43 = (uint64_t (*)(uint64_t))v42;
                uint64_t v44 = v41;
LABEL_14:
                sub_236C706F8(v44, v43);
                swift_bridgeObjectRelease();
                break;
              default:
                break;
            }
            --v37;
          }
          while (v37);
          swift_bridgeObjectRelease();
        }
        uint64_t result = swift_bridgeObjectRelease();
        break;
    }
  }
  return result;
}

uint64_t MetricsPublisher.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30670);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30680);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace, v8);
  swift_release();
  uint64_t v10 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30690);
  char v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation, v11);
  uint64_t v13 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v12(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence, v11);
  v12(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence, v11);
  uint64_t v25 = v12;
  swift_release();
  swift_release();
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v12(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime, v11);
  uint64_t v17 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF306A0);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  v19(v17, v18);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower, v8);
  v19(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex, v18);
  uint64_t v20 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset, v8);
  v9(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration, v8);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime, v11);
  v25(v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent, v11);
  uint64_t v22 = v0 + OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30728);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  return v0;
}

uint64_t MetricsPublisher.__deallocating_deinit()
{
  MetricsPublisher.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_236C6E6B8()
{
  unint64_t v0 = sub_236C73FC8();
  char v1 = v0;
  char v3 = v2;
  unint64_t v4 = v0 >> 8;
  unint64_t v5 = v0 >> 16;
  unint64_t v6 = v0 >> 24;
  unint64_t v7 = HIDWORD(v0);
  unint64_t v8 = v0 >> 40;
  unint64_t v9 = HIWORD(v0);
  unint64_t v10 = HIBYTE(v0);
  unint64_t v14 = v2 >> 8;
  unint64_t v15 = v2 >> 16;
  unint64_t v16 = v2 >> 24;
  unint64_t v17 = HIDWORD(v2);
  unint64_t v18 = v2 >> 40;
  unint64_t v19 = HIWORD(v2);
  unint64_t v20 = HIBYTE(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF307F0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_236C77DD0;
  *(unsigned char *)(v11 + 32) = v1;
  *(unsigned char *)(v11 + 33) = v4;
  *(unsigned char *)(v11 + 34) = v5;
  *(unsigned char *)(v11 + 35) = v6;
  *(unsigned char *)(v11 + 36) = v7;
  *(unsigned char *)(v11 + 37) = v8;
  *(unsigned char *)(v11 + 38) = v9;
  *(unsigned char *)(v11 + 39) = v10;
  *(unsigned char *)(v11 + 40) = v3;
  *(unsigned char *)(v11 + 41) = v14;
  *(unsigned char *)(v11 + 42) = v15;
  *(unsigned char *)(v11 + 43) = v16;
  *(unsigned char *)(v11 + 44) = v17;
  *(unsigned char *)(v11 + 45) = v18;
  *(unsigned char *)(v11 + 46) = v19;
  *(unsigned char *)(v11 + 47) = v20;
  uint64_t v12 = sub_236B23BF4(v11);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_236C6E7F0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x236C6EAA8);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 == 16)
      {
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73E28();
        sub_236C73FB8();
        sub_236A57E80(a1, a2);
        uint64_t v10 = sub_236C73FE8();
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
        uint64_t v12 = v10;
        uint64_t v13 = a3;
        uint64_t v14 = 0;
      }
      else
      {
LABEL_8:
        sub_236A57E80(a1, a2);
        uint64_t v15 = sub_236C73FE8();
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
        uint64_t v12 = v15;
        uint64_t v13 = a3;
        uint64_t v14 = 1;
      }
      return v11(v13, v14, 1, v12);
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(a1 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      goto LABEL_8;
    default:
      uint64_t v6 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t MetricsPublisher.wireData()()
{
  uint64_t v0 = type metadata accessor for Apple_Workout_Core_MetricsPublisher(0);
  MEMORY[0x270FA5388](v0);
  unint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MetricsPublisher.protobuf.getter((uint64_t)v2);
  sub_236C6EF94();
  uint64_t v3 = sub_236C749F8();
  sub_236C706F8((uint64_t)v2, type metadata accessor for Apple_Workout_Core_MetricsPublisher);
  return v3;
}

uint64_t static MetricsPublisher.decodeProto(serializedData:)(uint64_t a1, unint64_t a2)
{
  return sub_236C6EFEC(a1, a2);
}

uint64_t MetricsPublisher.__allocating_init(serializedData:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_236C6F174(a1, a2);
  sub_236A57E80(a1, a2);
  return v4;
}

uint64_t sub_236C6EBEC@<X0>(uint64_t a1@<X8>)
{
  return MetricsPublisher.protobuf.getter(a1);
}

uint64_t sub_236C6EC10()
{
  uint64_t v0 = type metadata accessor for Apple_Workout_Core_MetricsPublisher(0);
  MEMORY[0x270FA5388](v0);
  unint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MetricsPublisher.protobuf.getter((uint64_t)v2);
  sub_236C6EF94();
  uint64_t v3 = sub_236C749F8();
  sub_236C706F8((uint64_t)v2, type metadata accessor for Apple_Workout_Core_MetricsPublisher);
  return v3;
}

uint64_t sub_236C6ECE4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236C6EFEC(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_236C6ED10@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_236C6F174(a1, a2);
  uint64_t result = sub_236A57E80(a1, a2);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

void sub_236C6ED6C(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  if ((v1[1] & 1) == 0)
  {
    if (qword_26AF2E5B0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_236C74B98();
    __swift_project_value_buffer(v4, (uint64_t)qword_26AF2E598);
    uint64_t v5 = sub_236C74B78();
    os_log_type_t v6 = sub_236C752B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 134217984;
      sub_236C753F8();
      MEMORY[0x237E0C720](v7, -1, -1);
    }

    LOBYTE(v3) = 0;
  }
  *a1 = v3;
}

uint64_t sub_236C6EF0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_236C6EF94()
{
  unint64_t result = qword_2688AA3C0;
  if (!qword_2688AA3C0)
  {
    type metadata accessor for Apple_Workout_Core_MetricsPublisher(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688AA3C0);
  }
  return result;
}

uint64_t sub_236C6EFEC(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_236C74858();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = type metadata accessor for Apple_Workout_Core_MetricsPublisher(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MetricsPublisher();
  uint64_t v9 = swift_allocObject();
  MetricsPublisher.init()();
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_236A5B9DC(a1, a2);
  sub_236C74848();
  sub_236C6EF94();
  sub_236C749E8();
  if (v2)
  {
    swift_release();
  }
  else
  {
    sub_236C61630(v9);
    sub_236C706F8((uint64_t)v8, type metadata accessor for Apple_Workout_Core_MetricsPublisher);
  }
  return v9;
}

uint64_t sub_236C6F174(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_236C74858();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = type metadata accessor for Apple_Workout_Core_MetricsPublisher(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_236A5B9DC(a1, a2);
  sub_236C74848();
  sub_236C6EF94();
  sub_236C749E8();
  if (!v2)
  {
    type metadata accessor for MetricsPublisher();
    a1 = swift_allocObject();
    MetricsPublisher.init()();
    uint64_t v9 = swift_retain();
    sub_236C61630(v9);
    swift_release();
    sub_236C706F8((uint64_t)v8, type metadata accessor for Apple_Workout_Core_MetricsPublisher);
  }
  return a1;
}

uint64_t sub_236C6F300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier, &qword_26AF30550);
}

uint64_t sub_236C6F328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688ABDE0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutIdentifier, &qword_26AF30550);
}

uint64_t sub_236C6F358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType, &qword_26AF30598);
}

uint64_t sub_236C6F380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688ABDE8, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__workoutConfigurationType, &qword_26AF30598);
}

uint64_t sub_236C6F3B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode, &qword_26AF30670);
}

uint64_t sub_236C6F3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A87C0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__multisportWorkoutInAutoMode, &qword_26AF30670);
}

uint64_t sub_236C6F408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance, &qword_26AF30680);
}

uint64_t sub_236C6F430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distance, &qword_26AF30680);
}

uint64_t sub_236C6F460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer, &qword_26AF30680);
}

uint64_t sub_236C6F488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__secondsAheadOfPacer, &qword_26AF30680);
}

uint64_t sub_236C6F4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace, &qword_26AF30680);
}

uint64_t sub_236C6F4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentPace, &qword_26AF30680);
}

uint64_t sub_236C6F510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace, &qword_26AF30680);
}

uint64_t sub_236C6F538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averagePace, &qword_26AF30680);
}

uint64_t sub_236C6F568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace, &qword_26AF30680);
}

uint64_t sub_236C6F590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__rollingPace, &qword_26AF30680);
}

uint64_t sub_236C6F5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace, &qword_26AF30680);
}

uint64_t sub_236C6F5E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__requiredPace, &qword_26AF30680);
}

uint64_t sub_236C6F618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace, &qword_26AF30680);
}

uint64_t sub_236C6F640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__fastestPace, &qword_26AF30680);
}

uint64_t sub_236C6F670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain, &qword_26AF30690);
}

uint64_t sub_236C6F698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationGain, &qword_26AF30690);
}

uint64_t sub_236C6F6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation, &qword_26AF30690);
}

uint64_t sub_236C6F6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentElevation, &qword_26AF30690);
}

uint64_t sub_236C6F728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData, &qword_26AF30630);
}

uint64_t sub_236C6F750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A8900, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartData, &qword_26AF30630);
}

uint64_t sub_236C6F780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit, &qword_26AF30708);
}

uint64_t sub_236C6F7A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688ABDF0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__elevationChartUnit, &qword_26AF30708);
}

uint64_t sub_236C6F7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence, &qword_26AF30690);
}

uint64_t sub_236C6F800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentCadence, &qword_26AF30690);
}

uint64_t sub_236C6F830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence, &qword_26AF30690);
}

uint64_t sub_236C6F858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageCadence, &qword_26AF30690);
}

uint64_t sub_236C6F888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed, &qword_26AF30680);
}

uint64_t sub_236C6F8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__flightsClimbed, &qword_26AF30680);
}

uint64_t sub_236C6F8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime, &qword_26AF30690);
}

uint64_t sub_236C6F910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__distanceGoalFinishTime, &qword_26AF30690);
}

uint64_t sub_236C6F940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex, &qword_26AF306A0);
}

uint64_t sub_236C6F968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A7D90, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentIndex, &qword_26AF306A0);
}

uint64_t sub_236C6F998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration, &qword_26AF30680);
}

uint64_t sub_236C6F9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDuration, &qword_26AF30680);
}

uint64_t sub_236C6F9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance, &qword_26AF30680);
}

uint64_t sub_236C6FA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentDistance, &qword_26AF30680);
}

uint64_t sub_236C6FA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace, &qword_26AF30680);
}

uint64_t sub_236C6FA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentPace, &qword_26AF30680);
}

uint64_t sub_236C6FAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy, &qword_26AF30680);
}

uint64_t sub_236C6FAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentActiveEnergy, &qword_26AF30680);
}

uint64_t sub_236C6FAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy, &qword_26AF30680);
}

uint64_t sub_236C6FB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentTotalEnergy, &qword_26AF30680);
}

uint64_t sub_236C6FB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower, &qword_26AF30680);
}

uint64_t sub_236C6FB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__segmentAveragePower, &qword_26AF30680);
}

uint64_t sub_236C6FBB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex, &qword_26AF306A0);
}

uint64_t sub_236C6FBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A7D90, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitIndex, &qword_26AF306A0);
}

uint64_t sub_236C6FC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate, &qword_26AF30540);
}

uint64_t sub_236C6FC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A9868, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitStartDate, &qword_26AF30540);
}

uint64_t sub_236C6FC68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration, &qword_26AF30680);
}

uint64_t sub_236C6FC90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDuration, &qword_26AF30680);
}

uint64_t sub_236C6FCC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance, &qword_26AF30680);
}

uint64_t sub_236C6FCE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitDistance, &qword_26AF30680);
}

uint64_t sub_236C6FD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace, &qword_26AF30680);
}

uint64_t sub_236C6FD40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitPace, &qword_26AF30680);
}

uint64_t sub_236C6FD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower, &qword_26AF30680);
}

uint64_t sub_236C6FD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__splitAveragePower, &qword_26AF30680);
}

uint64_t sub_236C6FDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime, &qword_26AF30680);
}

uint64_t sub_236C6FDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTime, &qword_26AF30680);
}

uint64_t sub_236C6FE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset, &qword_26AF30680);
}

uint64_t sub_236C6FE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerRemainingTimeWithOffset, &qword_26AF30680);
}

uint64_t sub_236C6FE80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration, &qword_26AF30680);
}

uint64_t sub_236C6FEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A80B0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__timerDuration, &qword_26AF30680);
}

uint64_t sub_236C6FED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength, &qword_26AF30690);
}

uint64_t sub_236C6FF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentStrideLength, &qword_26AF30690);
}

uint64_t sub_236C6FF30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength, &qword_26AF30690);
}

uint64_t sub_236C6FF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageStrideLength, &qword_26AF30690);
}

uint64_t sub_236C6FF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation, &qword_26AF30690);
}

uint64_t sub_236C6FFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentVerticalOscillation, &qword_26AF30690);
}

uint64_t sub_236C6FFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation, &qword_26AF30690);
}

uint64_t sub_236C70008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageVerticalOscillation, &qword_26AF30690);
}

uint64_t sub_236C70038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime, &qword_26AF30690);
}

uint64_t sub_236C70060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__currentGroundContactTime, &qword_26AF30690);
}

uint64_t sub_236C70090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime, &qword_26AF30690);
}

uint64_t sub_236C700B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__averageGroundContactTime, &qword_26AF30690);
}

uint64_t sub_236C700E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent, &qword_26AF30690);
}

uint64_t sub_236C70110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688A88F0, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__descent, &qword_26AF30690);
}

uint64_t sub_236C70140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236A5E21C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount, &qword_26AF30728);
}

uint64_t sub_236C70168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236C6B25C(a1, a2, a3, a4, &qword_2688ABDF8, (uint64_t)&OBJC_IVAR____TtC11WorkoutCore16MetricsPublisher__downhillRunCount, &qword_26AF30728);
}

uint64_t sub_236C70198()
{
  return type metadata accessor for MetricsPublisher();
}

uint64_t type metadata accessor for MetricsPublisher()
{
  uint64_t result = qword_26AF300E8;
  if (!qword_26AF300E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236C701EC()
{
  sub_236C705D0();
  if (v0 <= 0x3F)
  {
    sub_236A7312C(319, &qword_26AF2E5D0);
    if (v1 <= 0x3F)
    {
      sub_236A7312C(319, (unint64_t *)&qword_26AF30678);
      if (v2 <= 0x3F)
      {
        sub_236A7312C(319, (unint64_t *)&qword_26AF30688);
        if (v3 <= 0x3F)
        {
          sub_236AA5A48(319, (unint64_t *)&qword_26AF30698, &qword_26AF30780);
          if (v4 <= 0x3F)
          {
            sub_236AA5A48(319, (unint64_t *)&qword_26AF30638, &qword_26AF30760);
            if (v5 <= 0x3F)
            {
              sub_236C70628();
              if (v6 <= 0x3F)
              {
                sub_236A7312C(319, (unint64_t *)&qword_26AF306A8);
                if (v7 <= 0x3F)
                {
                  sub_236AA5A48(319, &qword_26AF30548, &qword_26AF2FE50);
                  if (v8 <= 0x3F)
                  {
                    sub_236AA5A48(319, &qword_26AF30730, &qword_26AF307E0);
                    if (v9 <= 0x3F) {
                      swift_updateClassMetadata2();
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

uint64_t method lookup function for MetricsPublisher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MetricsPublisher);
}

uint64_t dispatch thunk of MetricsPublisher.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 568))();
}

void sub_236C705D0()
{
  if (!qword_26AF30558)
  {
    sub_236C73FE8();
    unint64_t v0 = sub_236C74C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AF30558);
    }
  }
}

void sub_236C70628()
{
  if (!qword_26AF30710)
  {
    sub_236A5A600(255, &qword_26AF307C8);
    unint64_t v0 = sub_236C74C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AF30710);
    }
  }
}

uint64_t sub_236C70690(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_236C706F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id static IntervalWorkout.supportedGoalTypes(for:activityMoveMode:)(uint64_t a1, uint64_t a2)
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F198]), sel_initWithWorkoutActivityType_activityMoveMode_, a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    sub_236C707BC((uint64_t)result);
    uint64_t v5 = v4;

    return (id)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_236C707BC(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_fiui_supportedGoalTypesForWorkoutSettingsManager_, a1);
  if (!v1) {
    return;
  }
  unint64_t v2 = v1;
  sub_236A73598();
  unint64_t v3 = sub_236C750A8();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_236C756A8();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    goto LABEL_18;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x237E0B940](v5, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * v5 + 32);
      }
      unint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_unsignedIntegerValue);
      if (v9 != (id)3)
      {
        id v10 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v6 = sub_236A8E4B0(0, v6[2] + 1, 1, v6);
        }
        unint64_t v12 = v6[2];
        unint64_t v11 = v6[3];
        if (v12 >= v11 >> 1) {
          unint64_t v6 = sub_236A8E4B0((void *)(v11 > 1), v12 + 1, 1, v6);
        }
        v6[2] = v12 + 1;
        v6[v12 + 4] = v10;
      }
      ++v5;
    }
    while (v4 != v5);
    goto LABEL_18;
  }
  __break(1u);
}

uint64_t TimeBucketedData.__allocating_init(bucketDuration:maxBucketCount:startDate:)(uint64_t a1, char a2, uint64_t a3, double a4)
{
  int v7 = a2 & 1;
  uint64_t v8 = swift_allocObject();
  TimeBucketedData.init(bucketDuration:maxBucketCount:startDate:)(a1, v7, a3, a4);
  return v8;
}

uint64_t sub_236C709F0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  *(void *)(v0 + 32) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      uint64_t v2 = *(void *)(v1 + 32);
      swift_retain();
      swift_release();
      uint64_t v1 = v2;
    }
    while (v2);
  }
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t TimeBucketedData.init(bucketDuration:maxBucketCount:startDate:)(uint64_t a1, int a2, uint64_t a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v23 = a1;
  uint64_t v24 = a3;
  int v22 = a2;
  uint64_t v26 = sub_236C75328();
  uint64_t v7 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_236C75318();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_236C74D08();
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v25 = sub_236A6BD8C();
  sub_236C74CD8();
  uint64_t v27 = MEMORY[0x263F8EE78];
  sub_236C739A8((unint64_t *)&unk_26AF30850, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30840);
  sub_236A8953C(&qword_26AF30848, &qword_26AF30840);
  sub_236C75488();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F130], v26);
  *(void *)(v4 + 40) = sub_236C75368();
  *(void *)(v4 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail) = 0;
  if (a4 <= 0.0)
  {
    sub_236C70E6C();
    swift_allocError();
    void *v14 = 0xD00000000000002FLL;
    uint64_t v15 = "Buckets must have a positive non-zero duration.";
  }
  else
  {
    char v12 = v22;
    uint64_t v13 = v23;
    if ((v22 & 1) != 0 || v23 > 0)
    {
      *(double *)(v4 + 16) = a4;
      *(void *)(v4 + 24) = v13;
      *(unsigned char *)(v4 + 32) = v12 & 1;
      uint64_t v18 = v4 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
      uint64_t v19 = sub_236C73F58();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, v24, v19);
      return v5;
    }
    sub_236C70E6C();
    swift_allocError();
    void *v14 = 0xD00000000000003ELL;
    uint64_t v15 = "If max bucket count is provided, it must be greater than zero.";
  }
  uint64_t v16 = v24;
  v14[1] = (unint64_t)(v15 - 32) | 0x8000000000000000;
  swift_willThrow();
  uint64_t v17 = sub_236C73F58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);

  swift_release();
  type metadata accessor for TimeBucketedData();
  swift_deallocPartialClassInstance();
  return v5;
}

unint64_t sub_236C70E6C()
{
  unint64_t result = qword_2688ABE08;
  if (!qword_2688ABE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688ABE08);
  }
  return result;
}

uint64_t type metadata accessor for TimeBucketedData()
{
  uint64_t result = qword_2688ABE18;
  if (!qword_2688ABE18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double sub_236C70F0C(uint64_t a1)
{
  uint64_t v3 = sub_236C74D18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (void *)((char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void **)(v1 + 40);
  *unint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F0D8], v3);
  id v8 = v7;
  char v9 = sub_236C74D28();
  uint64_t v10 = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (v9)
  {
    double v22 = 0.0;
    MEMORY[0x270FA5388](v10);
    v21[-4] = &v22;
    v21[-3] = v1;
    v21[-2] = a1;
    sub_236C75348();
  }
  else
  {
    __break(1u);
    swift_once();
    uint64_t v11 = sub_236C74B98();
    __swift_project_value_buffer(v11, (uint64_t)qword_26AF2E5B8);
    id v12 = v8;
    id v13 = v8;
    uint64_t v14 = sub_236C74B78();
    os_log_type_t v15 = sub_236C752B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      id v18 = v8;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      v21[1] = v19;
      sub_236C753F8();
      void *v17 = v19;

      _os_log_impl(&dword_236A4F000, v14, v15, "Unable to calculate sum: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF307D0);
      swift_arrayDestroy();
      MEMORY[0x237E0C720](v17, -1, -1);
      MEMORY[0x237E0C720](v16, -1, -1);
    }
    else
    {
    }
  }
  return v22;
}

uint64_t sub_236C71214(double *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = a3;
  uint64_t v48 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_236C73F58();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v46 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v47 = (char *)&v46 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)&v46 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v46 - v16;
  uint64_t v17 = sub_236C74D18();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v20 = (uint64_t *)((char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = *(void **)(a2 + 40);
  void *v20 = v21;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F8F0E0], v17);
  id v22 = v21;
  uint64_t v23 = sub_236C74D28();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v20, v17);
  if (v23)
  {
    sub_236AF4C34(v49, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      uint64_t v24 = a2 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
      swift_beginAccess();
      unint64_t v25 = v51;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v51, v24, v7);
      sub_236AF4C9C((uint64_t)v6);
    }
    else
    {
      unint64_t v25 = v51;
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v51, v6, v7);
    }
    uint64_t v26 = v50;
    uint64_t v27 = *(void *)(a2 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail);
    uint64_t v28 = a2 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v15, v28, v7);
    double v29 = *(double *)(a2 + 16);
    swift_retain();
    uint64_t v30 = sub_236C73870(v29);
    if (v26)
    {
      uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
      v31(v15, v7);
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v31)(v25, v7);
    }
    uint64_t v33 = v30;
    uint64_t v34 = v15;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
    v35(v34, v7);
    double v36 = 0.0;
    if (v27)
    {
      while (1)
      {
        uint64_t v37 = *(void *)(v27 + 24);
        if (v33 >= v37) {
          break;
        }
        double v36 = v36 + *(double *)(v27 + 16);
        uint64_t v38 = *(void *)(v27 + 32);
        swift_retain();
        swift_release();
        uint64_t v27 = v38;
        if (!v38) {
          goto LABEL_14;
        }
      }
      if (v37 == v33)
      {
        swift_retain();
        uint64_t v39 = v46;
        sub_236C72520(v33, v46);
        uint64_t v40 = v47;
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v47, v39, v7);
        uint64_t v41 = v51;
        sub_236C73E88();
        double v43 = v42;
        swift_release();
        v35(v40, v7);
        v35(v41, v7);
        double v44 = 1.0 - v43 / v29;
        double v45 = *(double *)(v27 + 16);
        uint64_t result = swift_release();
        double *v48 = v36 + v44 * v45;
        return result;
      }
      swift_release();
    }
LABEL_14:
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v51, v7);
    double *v48 = v36;
  }
  else
  {
    __break(1u);
    swift_release();

    uint64_t result = sub_236C75688();
    __break(1u);
  }
  return result;
}

uint64_t sub_236C71770()
{
  return sub_236C71214(*(double **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_236C71790(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_236C74D18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v2 + 40);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0D8], v5);
  v9;
  char v10 = sub_236C74D28();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v10)
  {
    MEMORY[0x270FA5388](result);
    *(&v12 - 4) = a1;
    *(&v12 - 3) = v2;
    *(&v12 - 2) = a2;
    return sub_236C75348();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236C71920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X8>)
{
  uint64_t v80 = a3;
  uint64_t v71 = a4;
  uint64_t v76 = sub_236C74D18();
  uint64_t v6 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v8 = (void (**)(char *, uint64_t, uint64_t))((char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF2FE50);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v73 = (uint64_t)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v79 = (uint64_t)&v67 - v13;
  MEMORY[0x270FA5388](v12);
  os_log_type_t v15 = (char *)&v67 - v14;
  uint64_t v16 = sub_236C73F58();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v70 = (uint64_t)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v69 = (char *)&v67 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v74 = (char *)&v67 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v77 = (char *)&v67 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v67 - v26;
  sub_236AF4C34(a1, (uint64_t)v15);
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  unsigned int v29 = v28(v15, 1, v16);
  uint64_t v78 = a2;
  uint64_t v72 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v28;
  if (v29 == 1)
  {
    uint64_t v30 = a2 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v27, v30, v16);
    sub_236AF4C9C((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v27, v15, v16);
  }
  if ((sub_236C73EB8() & 1) == 0)
  {
    sub_236C70E6C();
    swift_allocError();
    void *v44 = 0xD00000000000002FLL;
    v44[1] = 0x8000000236C973F0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v27, v16);
  }
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  int v32 = v27;
  uint64_t v33 = v79;
  char v68 = v32;
  char v67 = v31;
  ((void (*)(uint64_t))v31)(v79);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v33, 0, 1, v16);
  uint64_t v34 = *(void **)(v78 + 40);
  *uint64_t v8 = v34;
  uint64_t v35 = v76;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v76);
  id v36 = v34;
  LOBYTE(v34) = sub_236C74D28();
  uint64_t v38 = *(void (**)(void *, uint64_t))(v6 + 8);
  uint64_t v37 = (void *)(v6 + 8);
  v38(v8, v35);
  if (v34)
  {
    uint64_t v39 = v73;
    sub_236AF4C34(v33, v73);
    if (v72(v39, 1, v16) == 1)
    {
      uint64_t v40 = v78;
      uint64_t v41 = v78 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
      swift_beginAccess();
      double v42 = v77;
      double v43 = v67;
      v67(v77, v41, v16);
      sub_236AF4C9C(v39);
    }
    else
    {
      double v42 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v77, v39, v16);
      uint64_t v40 = v78;
      double v43 = v67;
    }
    uint64_t v46 = *(void *)(v40 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail);
    uint64_t v47 = v40 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
    swift_beginAccess();
    uint64_t v48 = v74;
    v43(v74, v47, v16);
    double v49 = *(double *)(v40 + 16);
    swift_retain();
    uint64_t v50 = v75;
    uint64_t v51 = sub_236C73870(v49);
    if (v50)
    {
      uint64_t v52 = *(void (**)(char *, uint64_t))(v17 + 8);
      v52(v48, v16);
      swift_release();
      v52(v42, v16);
      sub_236AF4C9C(v79);
      return ((uint64_t (*)(char *, uint64_t))v52)(v68, v16);
    }
    uint64_t v53 = v51;
    uint64_t v54 = *(void (**)(char *, uint64_t))(v17 + 8);
    v54(v48, v16);
    double v55 = 0.0;
    if (v46)
    {
      while (1)
      {
        uint64_t v56 = *(void *)(v46 + 24);
        if (v53 >= v56) {
          break;
        }
        double v55 = v55 + *(double *)(v46 + 16);
        uint64_t v57 = *(void *)(v46 + 32);
        swift_retain();
        swift_release();
        uint64_t v46 = v57;
        if (!v57) {
          goto LABEL_19;
        }
      }
      if (v56 == v53)
      {
        swift_retain();
        sub_236C72520(v53, v70);
        uint64_t v58 = v69;
        (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v69, v70, v16);
        uint64_t v59 = v77;
        sub_236C73E88();
        double v61 = v60;
        swift_release();
        v54(v58, v16);
        v54(v59, v16);
        double v62 = 1.0 - v61 / v49;
        double v63 = *(double *)(v46 + 16);
        swift_release();
        double v55 = v55 + v62 * v63;
LABEL_20:
        uint64_t v64 = v68;
        sub_236AF4C9C(v79);
        sub_236C73E88();
        double v66 = v65;
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v54)(v64, v16);
        *uint64_t v71 = v55 / v66;
        return result;
      }
      swift_release();
    }
LABEL_19:
    v54(v77, v16);
    goto LABEL_20;
  }
  __break(1u);
  swift_release();

  uint64_t result = sub_236C75688();
  __break(1u);
  return result;
}

uint64_t sub_236C720D0(uint64_t a1)
{
  uint64_t v3 = sub_236C73F58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = sub_236C74D18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)(v1 + 40);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0D8], v6);
  dispatch_queue_t v17 = v10;
  LOBYTE(v10) = sub_236C74D28();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v1;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_236C734AC;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_236A6F778;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236C724F8;
  aBlock[3] = &block_descriptor_24;
  os_log_type_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v17, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v12) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_236C723CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236C73F58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a1 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail) = 0;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v8 = a1 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_236C724F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_236C72520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v17[1] = a2;
  uint64_t v4 = sub_236C73F58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_236C74D18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (void *)((char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = *(void **)(v2 + 40);
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F0E0], v8);
  id v13 = v12;
  LOBYTE(v12) = sub_236C74D28();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    if (a1 < 0)
    {
      sub_236C70E6C();
      swift_allocError();
      void *v16 = 0xD00000000000001CLL;
      v16[1] = 0x8000000236C973D0;
      return swift_willThrow();
    }
    else
    {
      uint64_t v15 = v2 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
      sub_236C73E98();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236C7278C(uint64_t a1, double a2)
{
  v23[0] = a1;
  uint64_t v4 = sub_236C74CB8();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_236C74D08();
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_236C73F58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = sub_236C74D18();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (void *)((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(void **)(v2 + 40);
  void *v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0D8], v11);
  v23[1] = v15;
  LOBYTE(v15) = sub_236C74D28();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    (*(void (**)(char *, void, uint64_t))(v9 + 16))((char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v23[0], v8);
    unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v17;
    *(double *)(v19 + 24) = a2;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v18, (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    aBlock[4] = sub_236C73624;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_236A6A7C0;
    aBlock[3] = &block_descriptor_12_3;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain();
    sub_236C74CD8();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_236C739A8((unint64_t *)&qword_26AF30820, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30828);
    sub_236A8953C((unint64_t *)&qword_26AF30830, &qword_26AF30828);
    uint64_t v21 = v25;
    uint64_t v22 = v28;
    sub_236C75488();
    MEMORY[0x237E0B730](0, v7, v21, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v26);
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236C72C20(double a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_236C72E38(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_236C72E38(double a1)
{
  uint64_t v3 = sub_236C73F58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_236C74D18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)(v1 + 40);
  void *v10 = v11;
  uint64_t v12 = *(void (**)(void))(v8 + 104);
  unsigned int v39 = *MEMORY[0x263F8F0E0];
  uint64_t v40 = v8 + 104;
  uint64_t v38 = (void (*)(void *, void, uint64_t))v12;
  v12(v10);
  id v36 = v11;
  LOBYTE(v11) = sub_236C74D28();
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t))(v8 + 8);
  uint64_t v35 = v7;
  uint64_t v37 = v13;
  uint64_t result = v13(v10, v7);
  if ((v11 & 1) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v15 = v1 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
  uint64_t v16 = v41;
  uint64_t v17 = sub_236C73870(*(double *)(v1 + 16));
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v19 = OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail;
  uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail);
  uint64_t v41 = OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_tail;
  if (!v20)
  {
    uint64_t v22 = 0;
LABEL_10:
    type metadata accessor for TimeBucketedData.Bucket();
    uint64_t v24 = swift_allocObject();
    *(double *)(v24 + 16) = a1;
    *(void *)(v24 + 24) = v18;
    *(void *)(v24 + 32) = 0;
    if (v22)
    {
      uint64_t v25 = v1;
      *(void *)(v22 + 32) = v24;
      swift_release();
      goto LABEL_18;
    }
    uint64_t v25 = v1;
    *(void *)(v1 + v19) = v24;
    goto LABEL_15;
  }
  uint64_t v21 = 0;
  while (1)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)(v20 + 24);
    if (v18 >= v23) {
      break;
    }
    swift_retain();
    swift_release();
    uint64_t v20 = *(void *)(v22 + 32);
    uint64_t v21 = v22;
    if (!v20) {
      goto LABEL_10;
    }
  }
  if (v23 == v18)
  {
    uint64_t v25 = v1;
    *(double *)(v22 + 16) = *(double *)(v22 + 16) + a1;
    swift_retain();
    goto LABEL_18;
  }
  type metadata accessor for TimeBucketedData.Bucket();
  uint64_t v26 = swift_allocObject();
  *(double *)(v26 + 16) = a1;
  *(void *)(v26 + 24) = v18;
  *(void *)(v26 + 32) = v22;
  swift_retain_n();
  if (!v21)
  {
    uint64_t v25 = v1;
    *(void *)(v1 + v19) = v26;
    swift_release();
LABEL_15:
    swift_release();
    goto LABEL_18;
  }
  uint64_t v25 = v1;
  swift_retain();
  swift_release();
  *(void *)(v21 + 32) = v26;
  swift_release();
  swift_release();
LABEL_18:
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  void *v10 = v36;
  v38(v10, v39, v28);
  id v29 = v27;
  char v30 = sub_236C74D28();
  uint64_t result = v37(v10, v28);
  if (v30)
  {
    if ((*(unsigned char *)(v25 + 32) & 1) != 0
      || (v31 = *(void *)(v25 + 24), v32 = *(void *)(v25 + v41), uint64_t result = swift_retain(), !v32))
    {
LABEL_26:
      swift_release();
      return swift_release();
    }
    uint64_t v33 = 0;
    while (!__OFADD__(v33, 1))
    {
      if (v33 + 1 >= v31)
      {
        *(void *)(v32 + 32) = 0;
        swift_release();
      }
      uint64_t v34 = *(void *)(v32 + 32);
      swift_retain();
      uint64_t result = swift_release();
      ++v33;
      uint64_t v32 = v34;
      if (!v34) {
        goto LABEL_26;
      }
    }
    __break(1u);
    goto LABEL_29;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t TimeBucketedData.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
  uint64_t v2 = sub_236C73F58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t TimeBucketedData.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11WorkoutCore16TimeBucketedData_startDate;
  uint64_t v2 = sub_236C73F58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_236C733E0()
{
  uint64_t v1 = sub_236C73F58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_236C734AC()
{
  uint64_t v1 = *(void *)(sub_236C73F58() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_236C723CC(v2, v3);
}

uint64_t sub_236C73510()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236C73520()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_236C73558()
{
  uint64_t v1 = sub_236C73F58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_236C73624()
{
  sub_236C73F58();
  double v1 = *(double *)(v0 + 24);

  return sub_236C72C20(v1);
}

uint64_t sub_236C7368C()
{
  return type metadata accessor for TimeBucketedData();
}

uint64_t sub_236C73694()
{
  uint64_t result = sub_236C73F58();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TimeBucketedData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TimeBucketedData);
}

uint64_t dispatch thunk of TimeBucketedData.__allocating_init(bucketDuration:maxBucketCount:startDate:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 168))(a1, a2 & 1);
}

uint64_t dispatch thunk of TimeBucketedData.sum(since:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of TimeBucketedData.average(since:until:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TimeBucketedData.reset(newStartDate:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TimeBucketedData.addSample(_:date:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

ValueMetadata *type metadata accessor for TimeBucketedData.TimeBucketedDataErrors()
{
  return &type metadata for TimeBucketedData.TimeBucketedDataErrors;
}

uint64_t type metadata accessor for TimeBucketedData.Bucket()
{
  return self;
}

uint64_t sub_236C73870(double a1)
{
  sub_236C73F58();
  sub_236C739A8(&qword_2688AACD8, MEMORY[0x263F07490]);
  if (sub_236C74DD8())
  {
    sub_236C70E6C();
    swift_allocError();
    *uint64_t v2 = 0xD000000000000038;
    v2[1] = 0x8000000236C97390;
    return swift_willThrow();
  }
  uint64_t result = sub_236C73E88();
  double v5 = floor(v4 / a1);
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 9.22337204e18) {
    return (uint64_t)v5;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_236C739A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236C739F8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_236C73A08()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_236C73A18()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_236C73A28()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_236C73A38()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_236C73A48()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_236C73A58()
{
  return MEMORY[0x270F07A20]();
}

uint64_t sub_236C73A68()
{
  return MEMORY[0x270F07A28]();
}

uint64_t sub_236C73A78()
{
  return MEMORY[0x270F07A30]();
}

uint64_t sub_236C73A88()
{
  return MEMORY[0x270EEDFA0]();
}

uint64_t sub_236C73A98()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_236C73AA8()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_236C73AB8()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_236C73AC8()
{
  return MEMORY[0x270EEE2B8]();
}

uint64_t sub_236C73AD8()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_236C73AE8()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_236C73AF8()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_236C73B08()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_236C73B18()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_236C73B28()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_236C73B38()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_236C73B48()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_236C73B58()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_236C73B68()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_236C73B78()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_236C73B88()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_236C73B98()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_236C73BA8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_236C73BB8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_236C73BC8()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_236C73BD8()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_236C73BE8()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_236C73BF8()
{
  return MEMORY[0x270EEE8B0]();
}

uint64_t sub_236C73C08()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_236C73C18()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_236C73C28()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_236C73C38()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_236C73C48()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_236C73C58()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_236C73C68()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_236C73C78()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_236C73C88()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_236C73C98()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_236C73CA8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_236C73CB8()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_236C73CC8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_236C73CD8()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t sub_236C73CE8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_236C73CF8()
{
  return MEMORY[0x270EEFD00]();
}

uint64_t sub_236C73D08()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_236C73D18()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_236C73D28()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_236C73D38()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_236C73D48()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_236C73D58()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_236C73D68()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_236C73D78()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_236C73D88()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_236C73D98()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_236C73DA8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_236C73DB8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_236C73DC8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_236C73DD8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_236C73DE8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_236C73DF8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_236C73E08()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_236C73E18()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_236C73E28()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_236C73E38()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_236C73E48()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_236C73E58()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_236C73E68()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_236C73E78()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_236C73E88()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_236C73E98()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_236C73EA8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_236C73EB8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_236C73EC8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_236C73ED8()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_236C73EE8()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_236C73EF8()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_236C73F08()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_236C73F18()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_236C73F28()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_236C73F38()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_236C73F48()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_236C73F58()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_236C73F68()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_236C73F78()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_236C73F88()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_236C73F98()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_236C73FA8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_236C73FB8()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_236C73FC8()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_236C73FD8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_236C73FE8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_236C73FF8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_236C74008()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_236C74018()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_236C74028()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_236C74038()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_236C74048()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_236C74058()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_236C74068()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_236C74078()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_236C74088()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_236C74098()
{
  return MEMORY[0x270F07A38]();
}

uint64_t sub_236C740A8()
{
  return MEMORY[0x270F07A40]();
}

uint64_t sub_236C740B8()
{
  return MEMORY[0x270F07A48]();
}

uint64_t sub_236C740C8()
{
  return MEMORY[0x270F07A50]();
}

uint64_t sub_236C740D8()
{
  return MEMORY[0x270F07A58]();
}

uint64_t sub_236C740E8()
{
  return MEMORY[0x270F07A60]();
}

uint64_t sub_236C740F8()
{
  return MEMORY[0x270F07A68]();
}

uint64_t sub_236C74108()
{
  return MEMORY[0x270F07A70]();
}

uint64_t sub_236C74118()
{
  return MEMORY[0x270F07A78]();
}

uint64_t sub_236C74128()
{
  return MEMORY[0x270F07A80]();
}

uint64_t sub_236C74138()
{
  return MEMORY[0x270F07A88]();
}

uint64_t sub_236C74148()
{
  return MEMORY[0x270F07A90]();
}

uint64_t sub_236C74158()
{
  return MEMORY[0x270F07A98]();
}

uint64_t sub_236C74168()
{
  return MEMORY[0x270F07AA0]();
}

uint64_t sub_236C74178()
{
  return MEMORY[0x270F07AA8]();
}

uint64_t sub_236C74188()
{
  return MEMORY[0x270F07AB0]();
}

uint64_t sub_236C74198()
{
  return MEMORY[0x270F07AB8]();
}

uint64_t sub_236C741A8()
{
  return MEMORY[0x270F07AC0]();
}

uint64_t sub_236C741B8()
{
  return MEMORY[0x270F07AC8]();
}

uint64_t sub_236C741C8()
{
  return MEMORY[0x270F07AD0]();
}

uint64_t sub_236C741D8()
{
  return MEMORY[0x270F07AD8]();
}

uint64_t sub_236C741E8()
{
  return MEMORY[0x270F07AE0]();
}

uint64_t sub_236C741F8()
{
  return MEMORY[0x270F07AE8]();
}

uint64_t sub_236C74208()
{
  return MEMORY[0x270F07AF0]();
}

uint64_t sub_236C74218()
{
  return MEMORY[0x270F07AF8]();
}

uint64_t sub_236C74228()
{
  return MEMORY[0x270F07B00]();
}

uint64_t sub_236C74238()
{
  return MEMORY[0x270F07B08]();
}

uint64_t sub_236C74248()
{
  return MEMORY[0x270F07B10]();
}

uint64_t sub_236C74258()
{
  return MEMORY[0x270F07B18]();
}

uint64_t sub_236C74268()
{
  return MEMORY[0x270F07B20]();
}

uint64_t sub_236C74278()
{
  return MEMORY[0x270F07B28]();
}

uint64_t sub_236C74288()
{
  return MEMORY[0x270F07B30]();
}

uint64_t sub_236C74298()
{
  return MEMORY[0x270F07B38]();
}

uint64_t sub_236C742A8()
{
  return MEMORY[0x270F07B40]();
}

uint64_t sub_236C742B8()
{
  return MEMORY[0x270F07B48]();
}

uint64_t sub_236C742C8()
{
  return MEMORY[0x270F07B50]();
}

uint64_t sub_236C742D8()
{
  return MEMORY[0x270F07B58]();
}

uint64_t sub_236C742E8()
{
  return MEMORY[0x270F07B60]();
}

uint64_t sub_236C742F8()
{
  return MEMORY[0x270F07B68]();
}

uint64_t sub_236C74308()
{
  return MEMORY[0x270F07B70]();
}

uint64_t sub_236C74318()
{
  return MEMORY[0x270F07B78]();
}

uint64_t sub_236C74328()
{
  return MEMORY[0x270F07B80]();
}

uint64_t sub_236C74338()
{
  return MEMORY[0x270F07B88]();
}

uint64_t sub_236C74348()
{
  return MEMORY[0x270F07B98]();
}

uint64_t sub_236C74358()
{
  return MEMORY[0x270F07BA0]();
}

uint64_t sub_236C74368()
{
  return MEMORY[0x270F07BA8]();
}

uint64_t sub_236C74378()
{
  return MEMORY[0x270F07BB0]();
}

uint64_t sub_236C74388()
{
  return MEMORY[0x270F07BB8]();
}

uint64_t sub_236C74398()
{
  return MEMORY[0x270F07BC0]();
}

uint64_t sub_236C743A8()
{
  return MEMORY[0x270F07BC8]();
}

uint64_t sub_236C743B8()
{
  return MEMORY[0x270F07BD0]();
}

uint64_t sub_236C743C8()
{
  return MEMORY[0x270F07BD8]();
}

uint64_t sub_236C743D8()
{
  return MEMORY[0x270F07BE0]();
}

uint64_t sub_236C743E8()
{
  return MEMORY[0x270F07BE8]();
}

uint64_t sub_236C743F8()
{
  return MEMORY[0x270F07BF0]();
}

uint64_t sub_236C74408()
{
  return MEMORY[0x270F07BF8]();
}

uint64_t sub_236C74418()
{
  return MEMORY[0x270F07C00]();
}

uint64_t sub_236C74428()
{
  return MEMORY[0x270F07C08]();
}

uint64_t sub_236C74438()
{
  return MEMORY[0x270F07C10]();
}

uint64_t sub_236C74448()
{
  return MEMORY[0x270F07C18]();
}

uint64_t sub_236C74458()
{
  return MEMORY[0x270F07C20]();
}

uint64_t sub_236C74468()
{
  return MEMORY[0x270F07C28]();
}

uint64_t sub_236C74478()
{
  return MEMORY[0x270F07C30]();
}

uint64_t sub_236C74488()
{
  return MEMORY[0x270F07C38]();
}

uint64_t sub_236C74498()
{
  return MEMORY[0x270F07C40]();
}

uint64_t sub_236C744A8()
{
  return MEMORY[0x270F07C50]();
}

uint64_t sub_236C744B8()
{
  return MEMORY[0x270F07C58]();
}

uint64_t sub_236C744C8()
{
  return MEMORY[0x270F07C60]();
}

uint64_t sub_236C744D8()
{
  return MEMORY[0x270F07C68]();
}

uint64_t sub_236C744E8()
{
  return MEMORY[0x270F07C70]();
}

uint64_t sub_236C744F8()
{
  return MEMORY[0x270F07C78]();
}

uint64_t sub_236C74508()
{
  return MEMORY[0x270F07C80]();
}

uint64_t sub_236C74518()
{
  return MEMORY[0x270F07C88]();
}

uint64_t sub_236C74528()
{
  return MEMORY[0x270F07C90]();
}

uint64_t sub_236C74538()
{
  return MEMORY[0x270F07C98]();
}

uint64_t sub_236C74548()
{
  return MEMORY[0x270F07CA0]();
}

uint64_t sub_236C74558()
{
  return MEMORY[0x270F07CA8]();
}

uint64_t sub_236C74568()
{
  return MEMORY[0x270F07CB0]();
}

uint64_t sub_236C74578()
{
  return MEMORY[0x270F07CB8]();
}

uint64_t sub_236C74588()
{
  return MEMORY[0x270F07CC0]();
}

uint64_t sub_236C74598()
{
  return MEMORY[0x270F07CC8]();
}

uint64_t sub_236C745A8()
{
  return MEMORY[0x270F07CD0]();
}

uint64_t sub_236C745B8()
{
  return MEMORY[0x270F07CD8]();
}

uint64_t sub_236C745C8()
{
  return MEMORY[0x270F07CE0]();
}

uint64_t sub_236C745D8()
{
  return MEMORY[0x270F07CE8]();
}

uint64_t sub_236C745E8()
{
  return MEMORY[0x270F07CF0]();
}

uint64_t sub_236C745F8()
{
  return MEMORY[0x270F07CF8]();
}

uint64_t sub_236C74608()
{
  return MEMORY[0x270F07D00]();
}

uint64_t sub_236C74618()
{
  return MEMORY[0x270F07D08]();
}

uint64_t sub_236C74628()
{
  return MEMORY[0x270F07D10]();
}

uint64_t sub_236C74638()
{
  return MEMORY[0x270F07D18]();
}

uint64_t sub_236C74648()
{
  return MEMORY[0x270F07D20]();
}

uint64_t sub_236C74658()
{
  return MEMORY[0x270F07D28]();
}

uint64_t sub_236C74668()
{
  return MEMORY[0x270F07D30]();
}

uint64_t sub_236C74678()
{
  return MEMORY[0x270F07D38]();
}

uint64_t sub_236C74688()
{
  return MEMORY[0x270F07D40]();
}

uint64_t sub_236C74698()
{
  return MEMORY[0x270F07D48]();
}

uint64_t sub_236C746A8()
{
  return MEMORY[0x270F07D50]();
}

uint64_t sub_236C746B8()
{
  return MEMORY[0x270F07D58]();
}

uint64_t sub_236C746C8()
{
  return MEMORY[0x270F07D60]();
}

uint64_t sub_236C746D8()
{
  return MEMORY[0x270F07D68]();
}

uint64_t sub_236C746E8()
{
  return MEMORY[0x270F07D70]();
}

uint64_t sub_236C746F8()
{
  return MEMORY[0x270F07D78]();
}

uint64_t sub_236C74708()
{
  return MEMORY[0x270F07D80]();
}

uint64_t sub_236C74718()
{
  return MEMORY[0x270F07D88]();
}

uint64_t sub_236C74728()
{
  return MEMORY[0x270F07D90]();
}

uint64_t sub_236C74738()
{
  return MEMORY[0x270F07D98]();
}

uint64_t sub_236C74748()
{
  return MEMORY[0x270F07DA0]();
}

uint64_t sub_236C74758()
{
  return MEMORY[0x270F07DA8]();
}

uint64_t sub_236C74768()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_236C74778()
{
  return MEMORY[0x270EE9F50]();
}

uint64_t sub_236C74788()
{
  return MEMORY[0x270EE9F68]();
}

uint64_t sub_236C74798()
{
  return MEMORY[0x270EE9F88]();
}

uint64_t sub_236C747A8()
{
  return MEMORY[0x270F44678]();
}

uint64_t sub_236C747B8()
{
  return MEMORY[0x270F44680]();
}

uint64_t sub_236C747C8()
{
  return MEMORY[0x270F44698]();
}

uint64_t sub_236C747D8()
{
  return MEMORY[0x270F446A0]();
}

uint64_t sub_236C747E8()
{
  return MEMORY[0x270F449E8]();
}

uint64_t sub_236C747F8()
{
  return MEMORY[0x270F449F8]();
}

uint64_t sub_236C74808()
{
  return MEMORY[0x270F44A00]();
}

uint64_t sub_236C74818()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s11WorkoutCore06Apple_a1_B26_RacePositionNotYetOnRouteVACycfC_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_236C74838()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_236C74848()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_236C74858()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_236C74868()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_236C74898()
{
  return MEMORY[0x270F44B00]();
}

uint64_t sub_236C748A8()
{
  return MEMORY[0x270F44B08]();
}

uint64_t sub_236C748B8()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_236C748C8()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_236C748D8()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_236C748E8()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_236C748F8()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_236C74908()
{
  return MEMORY[0x270F44B58]();
}

uint64_t sub_236C74918()
{
  return MEMORY[0x270F44B90]();
}

uint64_t sub_236C74928()
{
  return MEMORY[0x270F44B98]();
}

uint64_t sub_236C74938()
{
  return MEMORY[0x270F44BA0]();
}

uint64_t sub_236C74948()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t sub_236C74958()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_236C74968()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_236C74978()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_236C74988()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_236C74998()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_236C749A8()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_236C749B8()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_236C749C8()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_236C749D8()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_236C749E8()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_236C749F8()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_236C74A18()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_236C74A28()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_236C74A38()
{
  return MEMORY[0x270F44D00]();
}

uint64_t sub_236C74A48()
{
  return MEMORY[0x270F44D08]();
}

uint64_t sub_236C74A58()
{
  return MEMORY[0x270F44D48]();
}

uint64_t sub_236C74A68()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_236C74A78()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_236C74A88()
{
  return MEMORY[0x270F44D70]();
}

uint64_t sub_236C74A98()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_236C74AA8()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_236C74AB8()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_236C74AC8()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_236C74AD8()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_236C74AE8()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_236C74AF8()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_236C74B08()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_236C74B18()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_236C74B28()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_236C74B38()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_236C74B48()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_236C74B58()
{
  return MEMORY[0x270FA16A0]();
}

uint64_t sub_236C74B68()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_236C74B78()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_236C74B88()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_236C74B98()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_236C74BA8()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_236C74BB8()
{
  return MEMORY[0x270EE3C18]();
}

uint64_t sub_236C74BC8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_236C74BD8()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_236C74BE8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_236C74BF8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_236C74C08()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_236C74C18()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_236C74C28()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_236C74C38()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_236C74C48()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_236C74C58()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_236C74C68()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_236C74C78()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_236C74C88()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_236C74C98()
{
  return MEMORY[0x270F043C8]();
}

uint64_t sub_236C74CA8()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_236C74CB8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_236C74CC8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_236C74CD8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_236C74CE8()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_236C74CF8()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_236C74D08()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_236C74D18()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_236C74D28()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_236C74D38()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_236C74D48()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_236C74D58()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_236C74D68()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_236C74D78()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_236C74D88()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_236C74D98()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_236C74DA8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_236C74DB8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_236C74DC8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_236C74DD8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_236C74DE8()
{
  return MEMORY[0x270F053E0]();
}

uint64_t sub_236C74DF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_236C74E08()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_236C74E18()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_236C74E28()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_236C74E38()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_236C74E48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_236C74E58()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_236C74E68()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t sub_236C74E78()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_236C74E88()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_236C74E98()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_236C74EA8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_236C74EB8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_236C74EC8()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_236C74ED8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_236C74EE8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_236C74EF8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_236C74F08()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_236C74F18()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_236C74F28()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_236C74F38()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_236C74F48()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_236C74F58()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_236C74F68()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_236C74F78()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_236C74F88()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_236C74F98()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_236C74FA8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_236C74FB8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_236C74FC8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_236C74FD8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_236C74FE8()
{
  return MEMORY[0x270F9D970]();
}

uint64_t sub_236C74FF8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_236C75008()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_236C75018()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_236C75058()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_236C75068()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_236C75078()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_236C75088()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_236C75098()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_236C750A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_236C750B8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_236C750C8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_236C750D8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_236C750E8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_236C750F8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_236C75108()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_236C75118()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_236C75128()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_236C75138()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_236C75148()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_236C75158()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_236C75168()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_236C75178()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_236C75188()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_236C75198()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_236C751A8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_236C751B8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_236C751C8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_236C751D8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_236C751E8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_236C751F8()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_236C75208()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_236C75218()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_236C75228()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_236C75238()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_236C75248()
{
  return MEMORY[0x270F053F0]();
}

uint64_t sub_236C75258()
{
  return MEMORY[0x270F9E320]();
}

uint64_t sub_236C75268()
{
  return MEMORY[0x270F07DB0]();
}

uint64_t sub_236C75278()
{
  return MEMORY[0x270F07DB8]();
}

uint64_t sub_236C75288()
{
  return MEMORY[0x270F07DC0]();
}

uint64_t sub_236C75298()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_236C752A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_236C752B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_236C752C8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_236C752D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_236C752E8()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_236C752F8()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_236C75308()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_236C75318()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_236C75328()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_236C75338()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_236C75348()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_236C75358()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_236C75368()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_236C75378()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_236C75388()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_236C75398()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_236C753A8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_236C753B8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_236C753C8()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_236C753D8()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_236C753E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_236C753F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_236C75408()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_236C75418()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_236C75428()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_236C75438()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_236C75448()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_236C75458()
{
  return MEMORY[0x270EF2570]();
}

uint64_t sub_236C75468()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_236C75478()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_236C75488()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_236C75498()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_236C754A8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_236C754B8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_236C754C8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_236C754D8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_236C754E8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_236C754F8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_236C75508()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_236C75518()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_236C75528()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_236C75538()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_236C75548()
{
  return MEMORY[0x270F9EA28]();
}

uint64_t sub_236C75558()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_236C75568()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_236C75578()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_236C75588()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_236C75598()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_236C755A8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_236C755B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_236C755C8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_236C755D8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_236C755E8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_236C755F8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_236C75608()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_236C75618()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_236C75628()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_236C75638()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_236C75648()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_236C75658()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_236C75668()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_236C75678()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_236C75688()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_236C75698()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_236C756A8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_236C756B8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_236C756C8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_236C756D8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_236C756E8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_236C756F8()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_236C75708()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_236C75718()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_236C75728()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_236C75738()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_236C75748()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_236C75758()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_236C75768()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_236C75778()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_236C75788()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_236C75798()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_236C757A8()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_236C757B8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_236C757C8()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_236C757D8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_236C757E8()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_236C757F8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_236C75808()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_236C75818()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_236C75828()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_236C75838()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_236C75848()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_236C75858()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_236C75868()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_236C75878()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_236C75888()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_236C75898()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_236C758A8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_236C758B8()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_236C758C8()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_236C758D8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_236C758E8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_236C758F8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_236C75908()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_236C75918()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_236C75928()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_236C75938()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_236C75958()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_236C75968()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_236C75978()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_236C75988()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_236C75998()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_236C759A8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_236C759B8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_236C759C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_236C759D8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_236C759E8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_236C759F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_236C75A08()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_236C75A18()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_236C75A28()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_236C75A38()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_236C75A48()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_236C75A58()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_236C75A68()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_236C75A78()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_236C75A88()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_236C75A98()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_236C75AC8()
{
  return MEMORY[0x270FA0128]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t FIActivityMoveModeWithHealthStore()
{
  return MEMORY[0x270F29910]();
}

uint64_t FIUIBundle()
{
  return MEMORY[0x270F2CC00]();
}

uint64_t FIUIDistanceTypeForActivityType()
{
  return MEMORY[0x270F2CC30]();
}

uint64_t FIUIHKWorkoutGoalTypeDescription()
{
  return MEMORY[0x270F2CC48]();
}

uint64_t FIUIIsZero()
{
  return MEMORY[0x270F2CC60]();
}

uint64_t FIUIPace()
{
  return MEMORY[0x270F2CC70]();
}

uint64_t FIUIPaceFormatForDistanceType()
{
  return MEMORY[0x270F2CC78]();
}

uint64_t FIUIPaceFormatForWorkoutActivityType()
{
  return MEMORY[0x270F2CC80]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

uint64_t NSStringForWOPersistencePermissionState()
{
  return MEMORY[0x270F872C8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t WOWorkoutServerInterface()
{
  return MEMORY[0x270F872D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getAtAnyKeyPath()
{
  return MEMORY[0x270FA0308]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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