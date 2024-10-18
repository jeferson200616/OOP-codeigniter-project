<?= $this->extend("layouts/default") ?>

<?= $this->section("title") ?><?= lang('Tasks.edit_task') ?><?= $this->endSection() ?>

<?= $this->section("content") ?>

<h1 class="title"><?= lang('Tasks.edit_task') ?></h1>

<div class="container">

<?php if (session()->has('errors')): ?>
    <ul>
        <?php foreach(session('errors') as $error): ?>
            <li><?= $error ?></li>
        <?php endforeach; ?>
    </ul>
<?php endif ?>

<?= form_open("/tasks/update/" . $task->id) ?>

    <?= $this->include('Tasks/form') ?>

    <div class="field is-grouped">
    <div class="control">
    <button class="button is-primary"><?= lang('Tasks.save') ?></button>
    </div>

    <div class="control">
    <a class="button" href="<?= site_url("/tasks/show/" . $task->id) ?>"><?= lang('Tasks.cancel') ?></a>

</form>
</div>

<?= $this->endSection() ?>